unit MfEncodeAudio.Platform;

{$mode delphiunicode}

interface

uses Types;

const
  MOD_NOREPEAT = $4000;

function StrCmpLogicalW(Left,Right: PWideChar): Integer; stdcall; external 'shlwapi.dll';
function RectF(Left,Top,Right,Bottom: Single): TRectF;

implementation

uses Windows,SysUtils;

function RectF(Left,Top,Right,Bottom: Single): TRectF;
begin
  Result.Left := Left;Result.Top := Top;Result.Right := Right;Result.Bottom := Bottom;
end;

initialization
  SetMultiByteConversionCodePage(CP_UTF8);
  SetMultiByteRTLFileSystemCodePage(CP_UTF8);
end.
