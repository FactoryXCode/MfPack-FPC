program MfVideoThumbnail;

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
{$IFDEF FASTMM}
  FastMM4,
  {$ENDIF}

  Forms,
  frmVideoThumbnail in 'frmVideoThumbnail.pas' {Form1},
  Thumbnail in 'Thumbnail.pas',
  Sprite in 'Sprite.pas',
  SimpleTimer in 'SimpleTimer.pas',
  VideoTumbNailHelpers in 'VideoTumbNailHelpers.pas';



var
  SavedMask: TFPUExceptionMask;

begin
  try
    SavedMask := GetExceptionMask();
    SetExceptionMask([exInvalidOp,exDenormalized,exZeroDivide,exOverflow,exUnderflow,exPrecision]);
    OleCheck(CoInitializeEx(nil,COINIT_APARTMENTTHREADED));
    try

  // Check for memoryleaks (debug mode (F9) only!)
  {$WARN SYMBOL_PLATFORM OFF}
  {$WARN SYMBOL_PLATFORM ON}


      SetMultiByteConversionCodePage(CP_UTF8);
  SetMultiByteRTLFileSystemCodePage(CP_UTF8);
  Application.Initialize;
      Application.MainFormOnTaskbar := True;
      Application.CreateForm(TForm1, Form1);
      if ParamStr(1) = '--smoke' then Application.ProcessMessages
      else Application.Run;
    finally
      FreeAndNil(Form1);
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
