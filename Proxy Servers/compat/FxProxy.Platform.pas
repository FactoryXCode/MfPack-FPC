unit FxProxy.Platform;

{$mode delphiunicode}
{$POINTERMATH ON}

interface

uses
  Windows,
  SysUtils;

const
  SERVICE_CONFIG_DELAYED_AUTO_START_INFO = 3;
  SERVICE_CONFIG_FAILURE_ACTIONS_FLAG = 4;

type
  SERVICE_DELAYED_AUTO_START_INFO = record
    fDelayedAutostart: BOOL;
  end;

  SERVICE_FAILURE_ACTIONS_FLAG = record
    fFailureActionsOnNonCrashFailures: BOOL;
  end;

function FxDeleteFile(const Name: UnicodeString): Boolean;
function FxParamStr(Index: Integer): UnicodeString;
function FxParamCount: Integer;

function FxGetSystemTimes(var Idle,
                          Kernel,
                          UserTime: TFileTime): BOOL; stdcall; external 'kernel32.dll' name 'GetSystemTimes';

implementation

type
  PPWideChar = ^PWideChar;

var
  Arguments: array of UnicodeString;

function CommandLineToArgvW(CommandLine: PWideChar;
                            out Count: Integer): PPWideChar; stdcall; external 'shell32.dll' name 'CommandLineToArgvW';


procedure InitializeArguments;
var
  Values: PPWideChar;
  Count, I: Integer;
  ModuleName: UnicodeString;
  NameLength: DWORD;

begin

  Values := CommandLineToArgvW(GetCommandLineW,
                               Count);
  if (Values = nil) then
    RaiseLastOSError;
  try
    SetLength(Arguments,
              Count);
    for I := 0 to Count - 1 do
      Arguments[I] := Values[I];
    SetLength(ModuleName,
              32768);
    NameLength := GetModuleFileNameW(0,
                                     PWideChar(ModuleName),
                                     Length(ModuleName));
    if (NameLength = 0) or (NameLength >= DWORD(Length(ModuleName))) then
      RaiseLastOSError;
    SetLength(ModuleName,
              NameLength);
    if (Count > 0) then
      Arguments[0] := ModuleName;
  finally
    LocalFree(THandle(Values));
  end;
end;


function FxParamStr(Index: Integer): UnicodeString;

begin

  if (Index >= 0) and (Index < Length(Arguments)) then
    Result := Arguments[Index]
  else
    Result := '';
end;


function FxParamCount: Integer;

begin

  Result := Length(Arguments) - 1;
end;


function FxDeleteFile(const Name: UnicodeString): Boolean;

begin

  Result := Windows.DeleteFileW(PWideChar(Name));
end;

initialization

  SetMultiByteConversionCodePage(CP_UTF8);
  SetMultiByteRTLFileSystemCodePage(CP_UTF8);
  InitializeArguments;

end.
