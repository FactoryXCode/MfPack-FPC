program WasApiPlayer;

{$I MfPack.Fpc.inc}
{$POINTERMATH ON}
{$PACKENUM 1}

uses
  Interfaces,
Forms,
  MainFrm in 'MainFrm.pas' {MainForm},
  WASAPIEngine in 'WASAPIEngine.pas',
  MfAudioBassTrebleMFT in 'MfAudioBassTrebleMFT.pas',
  MfAudioBassTrebleTypes in 'MfAudioBassTrebleTypes.pas';

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
