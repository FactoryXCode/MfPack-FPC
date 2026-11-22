unit MfCastPlayerPlatform;
{$mode delphiunicode}
interface

uses
  Windows,
  MultiMon;

function CastStartsWith(const Value,
                        Prefix: UnicodeString;
                        IgnoreCase: Boolean): Boolean;
function CastEndsWith(const Value,
                      Suffix: UnicodeString): Boolean;
function SetThreadErrorMode(NewMode: DWORD;
                            out OldMode: DWORD): BOOL; stdcall; external 'kernel32.dll';
function GetMonitorInfoW(Monitor: HMONITOR;
                         Info: Pointer): BOOL; stdcall; external 'user32.dll';
function EnumDisplayDevicesW(DeviceName: PWideChar;
                             Index: DWORD;
                             var Device: TDisplayDeviceW;
                             Flags: DWORD): BOOL; stdcall; external 'user32.dll';
function GetWindowDisplayAffinity(Window: HWND;
                                  out Affinity: DWORD): BOOL; stdcall; external 'user32.dll';
function SetWindowDisplayAffinity(Window: HWND;
                                  Affinity: DWORD): BOOL; stdcall; external 'user32.dll';

implementation

uses
  SysUtils;


function CastStartsWith(const Value,
                        Prefix: UnicodeString;
                        IgnoreCase: Boolean): Boolean;

begin

  if IgnoreCase then
    Result := SameText(Copy(Value,
                            1,
                            Length(Prefix)),
                       Prefix)
  else
    Result := (Copy(Value,
                    1,
                    Length(Prefix)) = Prefix);
end;


function CastEndsWith(const Value,
                      Suffix: UnicodeString): Boolean;

begin

  Result := (Length(Value) >= Length(Suffix)) and (Copy(Value,
                                                        Length(Value) - Length(Suffix) + 1,
                                                        MaxInt) = Suffix);
end;

initialization
  SetMultiByteConversionCodePage(CP_UTF8);
  SetMultiByteRTLFileSystemCodePage(CP_UTF8);
end.
