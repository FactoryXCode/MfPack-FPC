program MFDeviceLoss;

{$I MfPack.Fpc.inc}
{$POINTERMATH ON}

uses
  MfSmallSamplesPlatform,
Interfaces,
SysUtils,
  Math,
  ComObj,
  WinApi.ComBaseApi,
  WinApi.ActiveX.ObjBase,
Forms,
  DeviceLoss in 'DeviceLoss.pas',
  frmdlgChooseDevice in 'frmdlgChooseDevice.pas' {dlgChooseDevice},
  frmSimpleCapture in 'frmSimpleCapture.pas' {Frm_SimpleCapture},
  MfDeviceCaptureClass in 'MfDeviceCaptureClass.pas';



var
  SavedMask: TFPUExceptionMask;

begin
  try
    SavedMask := GetExceptionMask();
    SetExceptionMask([exInvalidOp,exDenormalized,exZeroDivide,exOverflow,exUnderflow,exPrecision]);
    OleCheck(CoInitializeEx(nil,COINIT_APARTMENTTHREADED));
    try
      SetMultiByteConversionCodePage(CP_UTF8);
  SetMultiByteRTLFileSystemCodePage(CP_UTF8);
  Application.Initialize;
      Application.MainFormOnTaskbar := True;
      Application.CreateForm(TFrm_SimpleCapture, Frm_SimpleCapture);
      Application.CreateForm(TdlgChooseDevice, dlgChooseDevice);
      if ParamStr(1) = '--smoke' then Application.ProcessMessages
      else Application.Run;
    finally
      FreeAndNil(dlgChooseDevice);
      FreeAndNil(Frm_SimpleCapture);
      CoUninitialize();
      ClearExceptions(False);
      SetExceptionMask(SavedMask);
    end;
  except
    on E: Exception do
      begin
        if ParamStr(1) = '--smoke' then begin Writeln('FAIL: '+E.ClassName+': '+E.Message);Halt(1);end;
        raise;
      end;
  end;
end.
