unit Rdj.Thread;
{$mode delphiunicode}
interface
uses Classes;
procedure RdjRunMta(Method:TThreadMethod);
type
 TRdjMethodThread=class(TThread)
 private FMethod:TThreadMethod;
 protected procedure Execute;override;
 public constructor Create(Method:TThreadMethod);
 end;
implementation
uses Math,ComObj,WinApi.ComBaseApi,WinApi.ActiveX.ObjBase;
procedure RdjRunMta(Method:TThreadMethod);
var Mask:TFPUExceptionMask;
begin
 Mask:=GetExceptionMask;SetExceptionMask([exInvalidOp,exDenormalized,exZeroDivide,exOverflow,exUnderflow,exPrecision]);
 try
  OleCheck(CoInitializeEx(nil,COINIT_MULTITHREADED));
  try Method;finally CoUninitialize;end;
 finally ClearExceptions(False);SetExceptionMask(Mask);end;
end;
constructor TRdjMethodThread.Create(Method:TThreadMethod);
begin inherited Create(True);FreeOnTerminate:=False;FMethod:=Method;end;
procedure TRdjMethodThread.Execute;
begin RdjRunMta(FMethod);end;
end.
