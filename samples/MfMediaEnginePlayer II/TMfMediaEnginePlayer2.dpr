program TMfMediaEnginePlayer2;

{$I MfPack.Fpc.inc}
{$POINTERMATH ON}

uses
  Interfaces,
SysUtils,
  Math,
  ComObj,
  WinApi.ComBaseApi,
  WinApi.ActiveX.ObjBase,
{$IFDEF FASTMM}
  FastMM4,
  {$ENDIF}

  Forms,
  MediaEngineClass in 'MediaEngineClass.pas',
  frmMfMediaEnginePlayer in 'frmMfMediaEnginePlayer.pas' {FeMediaEnginePlayer},
  TimedTextNotifyClass in 'TimedTextNotifyClass.pas',
  FloatingFrm in 'FloatingFrm.pas' {FloatingForm};



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
      Application.MainFormOnTaskbar:= True;
      Application.Title:= 'Mf MePlayer II';
      Application.CreateForm(TFeMediaEnginePlayer, FeMediaEnginePlayer);
      if ParamStr(1) = '--smoke' then Application.ProcessMessages
      else Application.Run;
    finally
      FreeAndNil(FeMediaEnginePlayer);
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
