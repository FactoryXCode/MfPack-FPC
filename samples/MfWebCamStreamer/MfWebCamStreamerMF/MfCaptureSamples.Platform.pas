unit MfCaptureSamples.Platform;

{$mode delphiunicode}

interface

function MfSelectDirectory(const Caption: UnicodeString;
                           const Root: UnicodeString;
                           var Folder: UnicodeString): Boolean;

implementation

uses
  Windows,
  SysUtils,
  Dialogs;


function MfSelectDirectory(const Caption: UnicodeString;
                           const Root: UnicodeString;
                           var Folder: UnicodeString): Boolean;
var
  Selected: AnsiString;

begin

  Selected := UTF8Encode(Folder);
  Result := Dialogs.SelectDirectory(UTF8Encode(Caption),
                                    UTF8Encode(Root),
                                    Selected);
  if Result then
    Folder := UTF8Decode(Selected);
end;

initialization
  SetMultiByteConversionCodePage(CP_UTF8);
  SetMultiByteRTLFileSystemCodePage(CP_UTF8);
end.
