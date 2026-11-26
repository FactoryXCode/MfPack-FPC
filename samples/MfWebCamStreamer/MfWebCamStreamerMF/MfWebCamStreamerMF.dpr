program MfWebCamStreamerMF;

{$I MfPack.Fpc.inc}
{$POINTERMATH ON}

uses
  MfCaptureSamples.Platform,
  Interfaces,
  WinApi.ComBaseApi,
  WinApi.ActiveX.ObjBase,
  ComObj,
  Math,
  SysUtils,
  WinApi.MediaFoundationApi.MfApi,
  Forms,
  Form.Main in 'Form.Main.pas' {frmMain},
  CamControl in 'CamControl.pas',
  dlgMfCameraControls in 'dlgMfCameraControls.pas' {MfCameraControlsDialog},
  FxServePublisher in 'FxServePublisher.pas',
  SimpleAvCapture in 'SimpleAvCapture.pas',
  SimpleFmp4ByteStream in 'SimpleFmp4ByteStream.pas',
  MfCameraSettings in 'MfCameraSettings.pas';

{$R *.res}

var
  SavedMask: TFPUExceptionMask;

begin
  SavedMask := GetExceptionMask();
  SetExceptionMask([exInvalidOp, exDenormalized, exZeroDivide, exOverflow, exUnderflow, exPrecision]);
  try
    OleCheck(CoInitializeEx(nil,
                            COINIT_APARTMENTTHREADED));
    try
      OleCheck(MFStartup(MF_VERSION,
                         MFSTARTUP_FULL));
      try
        Application.Initialize;
        Application.MainFormOnTaskbar := True;
        Application.Title := 'MfWebCamStreamer MF';
        Application.CreateForm(TfrmMain, frmMain);
        try
          if (ParamCount = 1) and (ParamStr(1) = '--smoke') then
            begin
              Application.ProcessMessages();
              frmMain.Close();
              Application.ProcessMessages();
            end
          else
            Application.Run();
        finally
          FreeAndNil(frmMain);
        end;
      finally
        MFShutdown();
      end;
    finally
      CoUninitialize();
    end;
  finally
    SetExceptionMask(SavedMask);
  end;
end.

