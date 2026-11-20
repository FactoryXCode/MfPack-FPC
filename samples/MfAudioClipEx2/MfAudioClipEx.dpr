program MfAudioClipEx;

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
  frmAudioClipEx in 'frmAudioClipEx.pas' {frmAudioClipEx},
  AudioClipEngine in 'AudioClipEngine.pas',
  Helpers in 'Helpers.pas';



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
      Application.CreateForm(TAudioClipExFrm, AudioClipExFrm);
      if ParamStr(1) = '--smoke' then Application.ProcessMessages
      else Application.Run;
    finally
      FreeAndNil(AudioClipExFrm);
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
