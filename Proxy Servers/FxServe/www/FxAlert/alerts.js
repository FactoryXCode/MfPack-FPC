'use strict';

// Current conditions drive alarms; lastAlert is retained only as event history.
globalThis.FxAlertStatus = Object.freeze({
  currentAlert(status) {
    if (!status || !['warning', 'critical', 'stopped'].includes(status.state)) return null;
    if (status.state === 'stopped') return {id:'recorder-stopped', severity:'critical', subject:'FxRecord is stopped', message:'Start the recorder service when recording is required.'};
    if (Array.isArray(status.alerts)) return status.alerts[0] || null;
    const alert = status.alert || {}, key = alert.key || '';
    let active = Boolean(alert.id);
    if (key.startsWith('live-')) active = ['stale','missing','invalid','unreadable'].includes(status.streamState);
    else if (key.startsWith('disk-')) active = ['warning','critical','unavailable'].includes(status.diskState);
    else if (key === 'windows-updates-waiting') active = status.updatesWaiting === true;
    else if (key === 'windows-restart-pending') active = status.restartPending === true;
    if (active) return {...alert, severity:status.state};
    // Compatibility with recorders that publish only their last historical event.
    const condition = status.restartPending ? 'windows-restart-pending' : status.updatesWaiting ? 'windows-updates-waiting' : '';
    if (condition) return {id:condition, key:condition, severity:'warning', subject:status.restartPending ? 'Windows restart required' : 'Windows updates are waiting', message:'Plan a maintenance window for Windows updates.'};
    return {id:`current-${status.state}-${status.streamState}-${status.diskState}`, severity:status.state, subject:'FxRecord needs attention', message:`Stream: ${status.streamState || 'unknown'}. Archive disk: ${status.diskState || 'unknown'}. Check the current recorder status.`};
  }
});
