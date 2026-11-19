unit MfPlayerSample.Platform;

{$mode delphiunicode}

interface

uses Windows;

function MfPlayerSetWindowText(Window: HWND;
                               const Value: UnicodeString): BOOL;


implementation

uses
  
  {System}
  SysUtils;
  

function MfPlayerSetWindowText(Window: HWND;
                               const Value: UnicodeString): BOOL;
begin
  Result := Windows.SetWindowTextW(Window,
                                   PWideChar(Value));
end;


initialization
  
  SetMultiByteConversionCodePage(CP_UTF8);
  SetMultiByteRTLFileSystemCodePage(CP_UTF8);
  
end.
