unit MfCameraControlsPlatform;

{$I MfPack.Fpc.inc}

interface

implementation

uses
  Windows,
  SysUtils;

initialization

  // LCL text is UTF-8; Media Foundation symbolic links remain UTF-16.
  SetMultiByteConversionCodePage(CP_UTF8);
  SetMultiByteRTLFileSystemCodePage(CP_UTF8);

end.
