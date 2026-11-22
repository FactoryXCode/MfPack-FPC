unit Rdj.Dispatch;
{$mode delphiunicode}
interface

uses
  Windows,
  Classes,
  SysUtils,
  Math,
  LCLIntf,
  LMessages;

type
  TRdjEvent = class;
  TRdjEventHandler = procedure(Event: TRdjEvent) of object;

  TRdjEvent = class
    Handler: TRdjEventHandler;
    Kind: Integer;
    I0, I1: Int64;
    U0: UInt64;
    D0, D1: Double;
    Text: UnicodeString;
  end;

  TRdjDispatcher = class

  private
    FWindow: HWND;
    FPending: LongInt;
    procedure WindowProc(var Message: TLMessage);

  public
    constructor Create;
    destructor Destroy; override;
    procedure Post(Handler: TRdjEventHandler;
                   Kind: Integer;
                   I0: Int64 = 0;
                   U0: UInt64 = 0;
                   I1: Int64 = 0;
                   D0: Double = 0;
                   D1: Double = 0;
                   const Text: UnicodeString = '');
  end;

implementation

const
  DISPATCH_MESSAGE = WM_APP + $537;


constructor TRdjDispatcher.Create;

begin

  inherited;
  FWindow := LCLIntf.AllocateHWnd(WindowProc);
end;


procedure TRdjDispatcher.Post(Handler: TRdjEventHandler;
                              Kind: Integer;
                              I0: Int64;
                              U0: UInt64;
                              I1: Int64;
                              D0: Double;
                              D1: Double;
                              const Text: UnicodeString);
var
  Event: TRdjEvent;

begin

  if (InterlockedIncrement(FPending) > 1024) and (Kind in [4, 6, 7, 8]) then
    begin
      InterlockedDecrement(FPending);
      Exit;
    end;
  Event := TRdjEvent.Create;
  Event.Handler := Handler;
  Event.Kind := Kind;
  Event.I0 := I0;
  Event.U0 := U0;
  Event.I1 := I1;
  Event.D0 := D0;
  Event.D1 := D1;
  Event.Text := Text;
  if not PostMessageW(FWindow, DISPATCH_MESSAGE, 0, LPARAM(Event)) then
    begin
      Event.Free;
      InterlockedDecrement(FPending);
    end;
end;


procedure TRdjDispatcher.WindowProc(var Message: TLMessage);
var
  Event: TRdjEvent;
  Mask: TFPUExceptionMask;

begin

  if (Message.Msg = DISPATCH_MESSAGE) then
    begin
      Event := TRdjEvent(Message.LParam);
      InterlockedDecrement(FPending);
      Mask := GetExceptionMask;
      SetExceptionMask([exInvalidOp, exDenormalized, exZeroDivide, exOverflow, exUnderflow, exPrecision]);
      try
        Event.Handler(Event);
      finally
        Event.Free;
        ClearExceptions(False);
        SetExceptionMask(Mask);
      end;
      Message.Result := 0;
    end
  else
    Message.Result := DefWindowProcW(FWindow,
                                     Message.Msg,
                                     Message.WParam,
                                     Message.LParam);
end;


destructor TRdjDispatcher.Destroy;
var
  Message: TMsg;

begin

  if (FWindow <> 0) then
    begin
      while PeekMessageW(Message, FWindow, DISPATCH_MESSAGE, DISPATCH_MESSAGE, PM_REMOVE) do
        TRdjEvent(Message.LParam).Free;
      LCLIntf.DeallocateHWnd(FWindow);
    end;
  inherited;
end;

end.
