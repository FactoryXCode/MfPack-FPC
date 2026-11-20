unit Heos.ControlsRegister;
{$mode delphiunicode}
interface
procedure Register;
implementation
uses Classes,HEOSButton,HEOSLevelProgressBar,HEOSTrackBar;
procedure Register;
begin RegisterComponents('HEOS',[TDnButton,TDnLevelProgressBar,TDnTrackBar]);end;
end.
