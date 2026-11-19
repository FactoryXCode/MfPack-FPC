program CaptureVideoFromGPU;

{$I MfPack.Fpc.inc}
{$POINTERMATH ON}

uses
  MfGpuCapture.Platform,
  Interfaces,
  WinApi.ComBaseApi,
  WinApi.ActiveX.ObjBase,
  ComObj,
  SysUtils,
  Math,
  Forms,
  frmCaptureVideoFromGpu in 'frmCaptureVideoFromGpu.pas' {FrmCapture},
  CaptureStreamEngine in 'CaptureStreamEngine.pas',
  Helpers in 'Helpers.pas',
  PreviewRenderer in 'PreviewRenderer.pas',
  GpuNV12Converter in 'GpuNV12Converter.pas';

{$R *.res}

var
  SavedMask: TFPUExceptionMask;

begin
  SavedMask := GetExceptionMask();
  SetExceptionMask([exInvalidOp,exDenormalized,exZeroDivide,exOverflow,exUnderflow,exPrecision]);
  OleCheck(CoInitializeEx(nil,COINIT_APARTMENTTHREADED));
  try
    Application.Initialize;
    Application.MainFormOnTaskbar := True;
    Application.CreateForm(TFrmCapture, FrmCapture);
    if (ParamCount = 1) and (ParamStr(1) = '--smoke') then
      begin
        Application.ProcessMessages;
        FrmCapture.Close();
        Application.ProcessMessages;
        FreeAndNil(FrmCapture);
      end
    else
      Application.Run;
  finally
    FreeAndNil(FrmCapture);
    CoUninitialize();
    ClearExceptions(False);
    SetExceptionMask(SavedMask);
  end;
end.
