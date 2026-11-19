unit MfGpuCapture.Platform;

{$mode delphiunicode}

interface

const
  MOD_NOREPEAT = $4000;

implementation

uses Windows,SysUtils;

initialization
  SetMultiByteConversionCodePage(CP_UTF8);
  SetMultiByteRTLFileSystemCodePage(CP_UTF8);
end.
