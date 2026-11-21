program MfHeosRemote;
{$I Heos.Fpc.inc}
{$POINTERMATH ON}
{$APPTYPE GUI}

uses Interfaces,Windows,SysUtils,Math,ComObj,ActiveX,ExtCtrls,
Forms,
  frmHeosRemote in 'frmHeosRemote.pas' {HeosRemoteFrm},
  MfHeosAudioServer in 'MfHeosAudioServer.pas',
  Heos.Cli in '..\..\Source\Heos.Cli.pas',
  Heos.Commands in '..\..\Source\Heos.Commands.pas',
  Heos.Sockets in '..\..\Source\Heos.Sockets.pas',
  Heos.Discovery in '..\..\Source\Heos.Discovery.pas';

procedure SmokeLog(const Text:UnicodeString);
var Bytes:UTF8String;Written:DWORD;OutputHandle:THandle;
begin
 Bytes:=UTF8Encode(Text+LineEnding);OutputHandle:=GetStdHandle(STD_OUTPUT_HANDLE);
 if (OutputHandle<>0) and (OutputHandle<>INVALID_HANDLE_VALUE) then
  WriteFile(OutputHandle,Bytes[1],Length(Bytes),Written,nil);
end;

var SavedMask:TFPUExceptionMask;
begin
 try
 SavedMask:=GetExceptionMask;
 SetExceptionMask([exInvalidOp,exDenormalized,exZeroDivide,exOverflow,exUnderflow,exPrecision]);
 OleCheck(CoInitializeEx(nil,COINIT_APARTMENTTHREADED));
 try
  Application.Initialize;
  if ParamStr(1)='--smoke' then Application.CaptureExceptions:=False;
  Application.Title:='MfPack HEOS CLI Remote';
  Application.CreateForm(TfrmHeosRemote,HeosRemoteFrm);
  try
   if ParamStr(1)='--smoke' then Application.ProcessMessages else Application.Run;
  finally
   FreeAndNil(HeosRemoteFrm);
  end;
 finally
  CoUninitialize;
  ClearExceptions(False);SetExceptionMask(SavedMask);
 end;
 if ParamStr(1)='--smoke' then SmokeLog('PASS: forms loaded and cleanup completed');
 except on E:Exception do
  begin
   if ParamStr(1)='--smoke' then begin SmokeLog('FAIL: '+E.ClassName+': '+E.Message);Halt(1);end;
   raise;
  end;
 end;
end.
