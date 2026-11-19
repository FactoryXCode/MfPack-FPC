program MfWebCamStreamer;

{$I MfPack.Fpc.inc}
{$POINTERMATH ON}

uses
  MfCaptureSamples.Platform,
  Interfaces,
  WinApi.ComBaseApi,
  WinApi.ActiveX.ObjBase,
  ComObj,
  SysUtils,
  WinApi.MediaFoundationApi.MfApi,
  Forms,
  Form.Main in 'Form.Main.pas' {frmMain},
  FxServePublisher in 'FxServePublisher.pas',
  SimpleAvCapture in 'SimpleAvCapture.pas',
  SimpleFmp4ByteStream in 'SimpleFmp4ByteStream.pas';

{$R *.res}

begin
  OleCheck(CoInitializeEx(nil,
                          COINIT_APARTMENTTHREADED));
  try
    OleCheck(MFStartup(MF_VERSION,
                       MFSTARTUP_FULL));
    try
      Application.Initialize;
      Application.MainFormOnTaskbar := True;
      Application.Title := 'MfWebCamStreamer';
      Application.CreateForm(TfrmMain, frmMain);
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
      MFShutdown();
    end;
  finally
    CoUninitialize();
  end;
end.
