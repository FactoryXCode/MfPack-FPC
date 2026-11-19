program XAudio2RenderingSample;

{$I MfPack.Fpc.inc}
{$POINTERMATH ON}

uses
  MfEncodeAudio.Platform,
  Interfaces,
  WinApi.ComBaseApi,
  WinApi.ActiveX.ObjBase,
  ComObj,
  SysUtils,
  Math,
  Forms,
  MainFrm in 'MainFrm.pas' {frmMain},
  XAudio2Engine in 'XAudio2Engine.pas',
  Tools in 'Tools.pas';

{$R *.res}

var
  SavedMask: TFPUExceptionMask;

begin
  try
    SavedMask := GetExceptionMask();
    SetExceptionMask([exInvalidOp,exDenormalized,exZeroDivide,exOverflow,exUnderflow,exPrecision]);
    OleCheck(CoInitializeEx(nil,COINIT_APARTMENTTHREADED));
    try
  
    {$IFDEF DEBUG}
    {$WARN SYMBOL_PLATFORM OFF}
    {$IFNDEF FPC}{$ENDIF}
    {$ENDIF}
  
      Application.Initialize;
      Application.MainFormOnTaskbar := True;
      Application.CreateForm(TfrmMain, frmMain);
      if (ParamCount = 1) and (ParamStr(1) = '--smoke') then
        Application.ProcessMessages
      else
        Application.Run;
    finally
      FreeAndNil(frmMain);
      CoUninitialize();
      ClearExceptions(False);
      SetExceptionMask(SavedMask);
    end;
  except
    on E: Exception do
      begin
        if (ParamCount = 1) and (ParamStr(1) = '--smoke') then
          begin
            Writeln('FAIL: '+E.ClassName+': '+E.Message);
            Halt(1);
          end;
        raise;
      end;
  end;
end.
