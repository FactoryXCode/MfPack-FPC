'use strict';

const $ = id => document.getElementById(id);
const els = {
  badge:$('connectionBadge'), alarm:$('alarmPanel'), alarmKind:$('alarmKind'), alarmTitle:$('alarmTitle'), alarmText:$('alarmText'),
  ack:$('ackButton'), overall:$('overallText'), detail:$('overallDetail'), pulse:$('pulse'), recorder:$('recorderState'), host:$('recorderHost'),
  stream:$('streamState'), session:$('streamSession'), disk:$('diskState'), free:$('diskFree'), age:$('heartbeatAge'), time:$('heartbeatTime'),
  enable:$('enableButton'), install:$('installButton'), permissionHelp:$('permissionHelp'), eventSubject:$('eventSubject'), eventTime:$('eventTime')
};
let latest = null, lastFetch = 0, alarmsEnabled = localStorage.getItem('fxalert-enabled') === '1', installPrompt = null, audio = null, alarmTimer = 0, syntheticAlert = '';
let pushEnabled = false;
let pollInFlight = false, consecutiveFailures = 0, lostSince = 0, wakeGraceUntil = Date.now() + 15000;
const HEARTBEAT_STALE_SECONDS = 45;
const CONNECTION_LOST_SECONDS = 60;
const FETCH_TIMEOUT_MS = 12000;
const renderedText = new WeakMap();

function words(value){ return String(value || 'unknown').replace(/[-_]/g,' ').replace(/^./, c => c.toUpperCase()); }
function when(value){ const d = new Date(value); return Number.isNaN(d.getTime()) ? '—' : d.toLocaleString(); }
function setClass(el, base, state){ el.className = `${base} ${state}`; }
function setText(el, value){
  const text=String(value ?? '');
  if(renderedText.get(el)===text) return;
  renderedText.set(el,text);
  el.textContent=text;
}
function heartbeatAge(){ return latest ? Math.max(0, Math.floor((Date.now() - new Date(latest.heartbeatUtc).getTime()) / 1000)) : Infinity; }
function heartbeatLost(){
  if (Date.now() < wakeGraceUntil) return false;
  if (latest && lastFetch && Date.now() - lastFetch < FETCH_TIMEOUT_MS * 2) return heartbeatAge() > HEARTBEAT_STALE_SECONDS;
  return consecutiveFailures >= 3 && (!lastFetch || Date.now() - lastFetch > CONNECTION_LOST_SECONDS * 1000);
}
function severity(lost){
  if (lost) return 'critical';
  if (!latest) return 'warning';
  return ['ok','warning','critical','stopped'].includes(latest.state) ? (latest.state === 'stopped' ? 'critical' : latest.state) : 'warning';
}
function activeAlert(lost){
  if (lost) return {id:`heartbeat-lost-${lostSince}`, severity:'critical', subject:'FxRecord heartbeat lost', message:'FxRecord has not reported for more than one minute. Check the recorder server and network now.'};
  return FxAlertStatus.currentAlert(latest);
}
function acknowledged(id){ return localStorage.getItem('fxalert-ack') === id; }

function render(){
  const age = heartbeatAge(), lost = heartbeatLost();
  if (lost && !lostSince) lostSince = Date.now();
  if (!lost) lostSince = 0;
  const state = severity(lost), alert = activeAlert(lost);
  setClass(els.badge,'badge',state); setText(els.badge,!latest ? 'No connection' : state === 'ok' ? 'Online' : words(state));
  setClass(els.pulse,'pulse',state);
  setText(els.overall,state === 'ok' ? 'Everything is running' : state === 'warning' ? 'Check FxRecord' : 'Action is required');
  setText(els.detail,!latest ? (Date.now() < wakeGraceUntil ? 'Connecting to FxRecord.' : 'The status feed could not be read.') : lost ? `The last heartbeat is ${age} seconds old.` : state === 'ok' ? 'Recorder, stream monitor and archive disk report normally.' : 'One or more checks need attention.');
  setText(els.recorder,!latest ? 'Connecting' : lost ? 'Not responding' : latest.recordingActive ? 'Recording' : words(latest.state));
  setText(els.host,latest?.recordingActive && latest?.recordingFile ? latest.recordingFile.split(/[\\/]/).pop() : (latest?.computer || '—')); setText(els.stream,words(latest?.streamState));
  setText(els.session,latest?.sessionId ? `Session ${latest.sessionId}` : 'No active session');
  setText(els.disk,words(latest?.diskState)); setText(els.free,Number(latest?.diskFreeGB) >= 0 ? `${Number(latest.diskFreeGB).toFixed(1)} GB free` : 'Free space unavailable');
  setText(els.age,Number.isFinite(age) ? `${age} sec ago` : 'No heartbeat'); setText(els.time,latest ? when(latest.heartbeatUtc) : '—');
  const event = latest?.lastAlert || latest?.alert;
  if (event?.subject) { setText(els.eventSubject,event.subject); setText(els.eventTime,when(event.createdUtc)); }
  if (alert && !acknowledged(alert.id)) { els.alarm.classList.remove('hidden'); setText(els.alarmKind,`${words(alert.severity)} alert`); setText(els.alarmTitle,alert.subject); setText(els.alarmText,alert.message); triggerAlarm(alert); }
  else { els.alarm.classList.add('hidden'); stopAlarm(); }
  setText(els.enable,pushEnabled ? 'Push alerts enabled' : alarmsEnabled ? 'Alerts enabled' : 'Enable alerts');
}

async function poll(){
  if (pollInFlight) return;
  pollInFlight = true;
  const controller = new AbortController();
  const timeout = setTimeout(() => controller.abort(), FETCH_TIMEOUT_MS);
  try {
    const response = await fetch(`status.json?t=${Date.now()}`, {cache:'no-store', signal:controller.signal});
    if (!response.ok) throw new Error(`HTTP ${response.status}`);
    latest = await response.json(); lastFetch = Date.now(); consecutiveFailures = 0; syntheticAlert = '';
  } catch (error) {
    consecutiveFailures++;
    if (!syntheticAlert) syntheticAlert = String(error);
  } finally {
    clearTimeout(timeout);
    pollInFlight = false;
  }
  render();
}

function ensureAudio(){
  if (!audio) audio = new (window.AudioContext || window.webkitAudioContext)();
  if (audio.state === 'suspended') audio.resume();
}
function beep(frequency=880, duration=.18){
  if (!alarmsEnabled || !audio) return;
  const osc=audio.createOscillator(), gain=audio.createGain(), now=audio.currentTime;
  osc.frequency.value=frequency; osc.type='square'; gain.gain.setValueAtTime(.0001,now); gain.gain.exponentialRampToValueAtTime(.15,now+.02); gain.gain.exponentialRampToValueAtTime(.0001,now+duration);
  osc.connect(gain).connect(audio.destination); osc.start(now); osc.stop(now+duration+.03);
}
async function notify(alert){
  if (!alarmsEnabled || Notification.permission !== 'granted') return;
  const reg = await navigator.serviceWorker?.ready;
  if (reg && window.currentAlertId === alert.id) {
    await reg.showNotification(alert.subject,{body:alert.message,icon:'../icons/icon-192.png',badge:'../icons/icon-192.png',tag:`fxalert-${alert.id}`,renotify:true});
    clearResolvedNotifications();
  }
}
function triggerAlarm(alert){
  if (!alarmsEnabled || window.currentAlertId === alert.id) return;
  window.currentAlertId = alert.id; ensureAudio(); beep(alert.severity === 'critical' ? 920 : 680,.25); notify(alert);
  clearInterval(alarmTimer); alarmTimer=setInterval(() => beep(alert.severity === 'critical' ? 920 : 680,.22), alert.severity === 'critical' ? 4000 : 12000);
}
async function clearResolvedNotifications(){
  try {
    const reg = await navigator.serviceWorker?.getRegistration();
    if (!reg) return;
    const notifications = await reg.getNotifications();
    notifications.filter(item => item.tag.startsWith('fxalert-') && item.tag !== `fxalert-${window.currentAlertId}`).forEach(item => item.close());
  } catch (error) { console.warn('FxAlert notification cleanup:',error); }
}
function stopAlarm(){
  const hadAlarm = Boolean(window.currentAlertId);
  clearInterval(alarmTimer); alarmTimer=0; window.currentAlertId='';
  if (hadAlarm) clearResolvedNotifications();
}

function applicationServerKey(value){
  const padding='='.repeat((4-value.length%4)%4), base64=(value+padding).replace(/-/g,'+').replace(/_/g,'/'), raw=atob(base64), bytes=new Uint8Array(raw.length);
  for(let i=0;i<raw.length;i++) bytes[i]=raw.charCodeAt(i);
  return bytes;
}
async function enablePush(){
  if (!('serviceWorker' in navigator) || !('PushManager' in window)) throw new Error('This browser does not support Web Push.');
  const registration=await navigator.serviceWorker.ready;
  const keyResponse=await fetch('api/push/vapid-public-key',{cache:'no-store'});
  if(!keyResponse.ok) throw new Error(keyResponse.status===404?'Web Push is not enabled on FxServe.':`FxServe returned HTTP ${keyResponse.status}.`);
  const {publicKey}=await keyResponse.json();
  let subscription=await registration.pushManager.getSubscription();
  if(!subscription) subscription=await registration.pushManager.subscribe({userVisibleOnly:true,applicationServerKey:applicationServerKey(publicKey)});
  const response=await fetch('api/push/subscribe',{method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify(subscription)});
  if(!response.ok) throw new Error((await response.text()).trim()||`FxServe returned HTTP ${response.status}.`);
  pushEnabled=true;
  return subscription;
}
async function refreshPushState(){
  if(!('serviceWorker' in navigator) || !('PushManager' in window)) return;
  try {
    const registration=await navigator.serviceWorker.ready, subscription=await registration.pushManager.getSubscription();
    pushEnabled=Boolean(subscription);
    if(subscription && Notification.permission==='granted') {
      await fetch('api/push/subscribe',{method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify(subscription)});
      els.permissionHelp.textContent='Secure push warnings are enabled, including while FxAlert is closed.';
    }
  } catch(error) { console.warn('FxAlert push status:',error); }
  render();
}

els.ack.addEventListener('click', () => { const alert=activeAlert(heartbeatLost()); if(alert) localStorage.setItem('fxalert-ack',alert.id); stopAlarm(); render(); });
els.enable.addEventListener('click', async () => {
  ensureAudio(); alarmsEnabled=true; localStorage.setItem('fxalert-enabled','1');
  if ('Notification' in window && Notification.permission === 'default') await Notification.requestPermission();
  const notificationsAllowed = 'Notification' in window && Notification.permission === 'granted';
  if(notificationsAllowed) {
    try {
      await enablePush();
      els.permissionHelp.textContent='Secure push warnings are enabled, including while FxAlert is closed.';
    } catch(error) {
      const ios=/iPad|iPhone|iPod/.test(navigator.userAgent), standalone=window.matchMedia('(display-mode: standalone)').matches||navigator.standalone===true;
      els.permissionHelp.textContent=ios&&!standalone?'On iPhone or iPad, add FxAlert to the Home Screen first, open that app, then enable alerts.':`Open-app alerts are enabled. Push setup failed: ${error.message}`;
    }
  } else els.permissionHelp.textContent='Sound is enabled. Browser notifications are not allowed.';
  render();
});
window.addEventListener('beforeinstallprompt', event => { event.preventDefault(); installPrompt=event; els.install.classList.remove('hidden'); });
els.install.addEventListener('click', async () => { if(installPrompt){ installPrompt.prompt(); await installPrompt.userChoice; installPrompt=null; els.install.classList.add('hidden'); } });

if ('serviceWorker' in navigator) navigator.serviceWorker.register('sw.js').then(refreshPushState).catch(error=>console.warn('FxAlert service worker:',error));
if (alarmsEnabled) els.permissionHelp.textContent='Alerts were enabled on this device. Tap the button again if sound is blocked.';
function resumePolling(){ wakeGraceUntil=Date.now()+15000; consecutiveFailures=0; poll(); render(); }
document.addEventListener('visibilitychange', () => { if (!document.hidden) resumePolling(); });
window.addEventListener('online', resumePolling);
poll(); setInterval(poll,5000); setInterval(render,1000);
