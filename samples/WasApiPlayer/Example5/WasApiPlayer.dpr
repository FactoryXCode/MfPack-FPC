program WasApiPlayer;

{$I MfPack.Fpc.inc}
{$POINTERMATH ON}
{$PACKENUM 1}

uses
  Interfaces,
Forms,
  MainFrm in 'MainFrm.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
