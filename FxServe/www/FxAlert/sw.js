importScripts('./alerts.js');
const CACHE = 'fxalert-v6';
const SHELL = ['./', './index.html', './app.css', './app.js', './alerts.js', './manifest.webmanifest', '../icons/icon-192.png', '../icons/icon-512.png'];

self.addEventListener('install', event => event.waitUntil(caches.open(CACHE).then(cache => cache.addAll(SHELL)).then(() => self.skipWaiting())));
self.addEventListener('activate', event => event.waitUntil(caches.keys().then(keys => Promise.all(keys.filter(key => key !== CACHE).map(key => caches.delete(key)))).then(() => self.clients.claim())));
self.addEventListener('fetch', event => {
  const url = new URL(event.request.url);
  if (url.pathname.toLowerCase().endsWith('/fxalert/status.json')) return;
  event.respondWith(fetch(event.request).then(response => {
    const copy = response.clone(); caches.open(CACHE).then(cache => cache.put(event.request, copy)); return response;
  }).catch(() => caches.match(event.request).then(response => response || caches.match('./index.html'))));
});

self.addEventListener('notificationclick', event => {
  event.notification.close();
  event.waitUntil(clients.matchAll({type:'window', includeUncontrolled:true}).then(windows => {
    if (windows.length) return windows[0].focus();
    return clients.openWindow(event.notification.data?.url || './');
  }));
});

async function showCurrentWarning(){
  let title='FxAlert warning', body='FxRecord needs attention. Open FxAlert for details.', tag='fxalert-warning', severity='warning';
  try {
    const response=await fetch(`status.json?t=${Date.now()}`,{cache:'no-store'});
    if(!response.ok) throw new Error(`HTTP ${response.status}`);
    const status=await response.json(), alert=FxAlertStatus.currentAlert(status);
    if (!alert) {
      if ('clearAppBadge' in self.navigator) await self.navigator.clearAppBadge().catch(()=>{});
      const notifications = await self.registration.getNotifications();
      notifications.filter(item => item.tag.startsWith('fxalert-')).forEach(item => item.close());
      return self.registration.showNotification('FxRecord recovered', {body:'The recorder reports normally.', tag:'fxalert-recovery', silent:true, data:{url:'./'}});
    }
    severity=status.state||'warning';
    title=alert.subject||`FxRecord is ${severity}`;
    body=alert.message||'Open FxAlert for the current recorder status.';
    tag=`fxalert-${alert.id||status.heartbeatUtc||severity}`;
  } catch(error) {
    title='FxRecord heartbeat warning';
    body='FxAlert could not read the recorder status. Check the recorder server and network.';
    tag='fxalert-heartbeat-lost';
    severity='critical';
  }
  if ('setAppBadge' in self.navigator) await self.navigator.setAppBadge(1).catch(()=>{});
  return self.registration.showNotification(title,{
    body,
    icon:'../icons/icon-192.png',
    badge:'../icons/icon-192.png',
    tag,
    renotify:true,
    requireInteraction:severity==='critical'||severity==='stopped',
    data:{url:'./'}
  });
}

self.addEventListener('push',event=>event.waitUntil(showCurrentWarning()));
