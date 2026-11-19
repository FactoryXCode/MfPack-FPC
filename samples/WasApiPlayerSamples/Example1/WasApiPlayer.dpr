program WasApiPlayer;

{$I MfPack.Fpc.inc}
{$POINTERMATH ON}
{$PACKENUM 1}

uses
  Interfaces,
Forms,
  MainFrm in 'MainFrm.pas' {MainForm},
  Tools in 'Tools.pas',
  WASAPIEngine in 'WASAPIEngine.pas';

{$R *.res}

begin

  {$IFDEF DEBUG}
  {$WARN SYMBOL_PLATFORM OFF}
  
  {$ENDIF}

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
