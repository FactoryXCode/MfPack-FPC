unit Rdj.ControlsRegister;
{$mode delphiunicode}
interface
procedure Register;
implementation
uses Classes,MfBeatLed,MfJogShuttle,MfLevelProgressBar,MfTrackBar,MPxpButton,RdjAudioMixVisualizer;
procedure Register;
begin RegisterComponents('RDJ',[TMfBeatLed,TJogShuttleProgress,TMfLevelProgressBar,TMfTrackBar,TMPxpButton,TRdjAudioMixVisualizer]);end;
end.
