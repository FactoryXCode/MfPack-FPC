unit Heos.Fpc.ControlsRuntime;
{$mode delphiunicode}
interface

implementation

uses
  Classes,
  HEOSButton,
  HEOSLevelProgressBar,
  HEOSTrackBar;

initialization
  RegisterClasses([TDnButton, TDnLevelProgressBar, TDnTrackBar]);
end.
