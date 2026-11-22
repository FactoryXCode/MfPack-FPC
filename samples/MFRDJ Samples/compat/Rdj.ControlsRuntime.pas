unit Rdj.ControlsRuntime;
{$mode delphiunicode}
interface

implementation

uses
  Classes,
  MfBeatLed,
  MfJogShuttle,
  MfLevelProgressBar,
  MfTrackBar,
  MPxpButton,
  RdjAudioMixVisualizer;

initialization
  RegisterClasses([TMfBeatLed, TJogShuttleProgress, TMfLevelProgressBar, TMfTrackBar, TMPxpButton, TRdjAudioMixVisualizer]);
end.
