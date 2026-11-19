program LoopBackCapture2;

{$I MfPack.Fpc.inc}
{$POINTERMATH ON}

uses
  MfLoopbackSamples.Platform,
  Interfaces,
  WinApi.ComBaseApi,
  WinApi.ActiveX.ObjBase,
  ComObj,
  SysUtils,
{$IFDEF madExcept}
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  {$ENDIF}
  Forms,
  frmLoopBackCapture in 'frmLoopBackCapture.pas' {frmMain},
  Common in 'Common.pas',
  ProcessInfoDlg in 'ProcessInfoDlg.pas' {dlgProcessInfo},
  LoopBackCapture in 'LoopBackCapture.pas',
  UniThreadTimer in 'UniThreadTimer.pas',
  MfAudioWriter in 'MfAudioWriter.pas';

{$R *.res}

begin
  OleCheck(CoInitializeEx(nil,
                          COINIT_APARTMENTTHREADED));
  try
    Application.Initialize;
    Application.MainFormOnTaskbar := True;
    Application.CreateForm(TfrmMain, frmMain);
    Application.CreateForm(TdlgProcessInfo, dlgProcessInfo);
    if (ParamCount = 1) and (ParamStr(1) = '--smoke') then
      begin
        Application.ProcessMessages;
        frmMain.Close();
        Application.ProcessMessages;
        FreeAndNil(frmMain);
      end
    else
      Application.Run;
  finally
    CoUninitialize();
  end;
end.
