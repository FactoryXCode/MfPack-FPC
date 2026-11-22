unit MfGpuCapture.Events;

{$mode delphiunicode}

interface

uses
  Windows,
  SysUtils,
  SyncObjs;

type
  TMfGpuEvent = class

  private
    FHandle: THandle;
    FLastError: DWORD;

  public
    constructor Create(Attributes: Pointer;
                       ManualReset: Boolean;
                       InitialState: Boolean;
                       const Name: UnicodeString);
    destructor Destroy(); override;
    procedure SetEvent();
    procedure ResetEvent();
    function WaitFor(Timeout: Cardinal): TWaitResult;
    property Handle: THandle read FHandle;
    property LastError: DWORD read FLastError;
  end;

implementation


constructor TMfGpuEvent.Create(Attributes: Pointer;
                               ManualReset: Boolean;
                               InitialState: Boolean;
                               const Name: UnicodeString);

begin

  inherited Create();
  FHandle := Windows.CreateEventW(Attributes,
                                  ManualReset,
                                  InitialState,
                                  PWideChar(Name));
  if (FHandle = 0) then
    RaiseLastOSError;
end;


destructor TMfGpuEvent.Destroy();

begin

  if (FHandle <> 0) then
    Windows.CloseHandle(FHandle);
  inherited Destroy();
end;


procedure TMfGpuEvent.SetEvent();

begin

  if not Windows.SetEvent(FHandle) then
    RaiseLastOSError;
end;


procedure TMfGpuEvent.ResetEvent();

begin

  if not Windows.ResetEvent(FHandle) then
    RaiseLastOSError;
end;


function TMfGpuEvent.WaitFor(Timeout: Cardinal): TWaitResult;

begin

  case Windows.WaitForSingleObject(FHandle,
                                   Timeout) of
    WAIT_OBJECT_0: Result := wrSignaled;
    WAIT_TIMEOUT: Result := wrTimeout;
    WAIT_ABANDONED: Result := wrAbandoned;
    else
      begin
        FLastError := Windows.GetLastError();
        Result := wrError;
      end;
  end;
end;

end.
