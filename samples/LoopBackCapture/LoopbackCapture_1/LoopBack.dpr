program LoopBack;

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
  frmWasapiLoopBack in 'frmWasapiLoopBack.pas' {frmLoopBackCapture},
  WasapiLoopback in 'WasapiLoopback.pas',
  Utils in 'Utils.pas',
  dlgDevices in 'dlgDevices.pas' {DevicesDlg},
  UniThreadTimer in 'UniThreadTimer.pas';

{$R *.res}

begin
  OleCheck(CoInitializeEx(nil,
                          COINIT_APARTMENTTHREADED));
  try
    Application.Initialize;
    Application.MainFormOnTaskbar := True;
    Application.CreateForm(TfrmLoopBackCapture, frmLoopBackCapture);
    Application.CreateForm(TDevicesDlg, DevicesDlg);
    if (ParamCount = 1) and (ParamStr(1) = '--smoke') then
      begin
        Application.ProcessMessages;
        frmLoopBackCapture.Close();
        Application.ProcessMessages;
        FreeAndNil(frmLoopBackCapture);
      end
    else
      Application.Run;
  finally
    CoUninitialize();
  end;
end.
