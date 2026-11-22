unit HeosSampleControlsRegister;
{$mode delphiunicode}
interface

procedure Register;

implementation

uses
  Classes,
  MPxpButton;


procedure Register;

begin

  RegisterComponents('HEOS Samples',
                     [TMPxpButton]);
end;

end.
