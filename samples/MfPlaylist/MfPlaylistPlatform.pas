unit MfPlaylistPlatform;

{$I MfPack.Fpc.inc}

interface

implementation

uses
  Windows,
  SysUtils;

initialization

  // LCL strings and filenames use UTF-8; native MF source URLs use UTF-16.
  SetMultiByteConversionCodePage(CP_UTF8);
  SetMultiByteRTLFileSystemCodePage(CP_UTF8);

end.
