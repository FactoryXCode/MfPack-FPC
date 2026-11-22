unit MfDuckingPlatform;
{$I MfPack.Fpc.inc}
interface

uses
  SysUtils;

type
  TPath = class

  public
    class function GetPicturesPath(): UnicodeString; static;
  end;

implementation

uses
  Windows,
  WinApi.ComBaseApi;

function SHGetKnownFolderPath(const Folder: TGUID;
                              Flags: DWORD;
                              Token: THandle;
                              out Path: PWideChar): LongInt; stdcall; external 'shell32.dll';


class function TPath.GetPicturesPath(): UnicodeString;
const
  Pictures: TGUID = '{33E28130-4E1E-4676-835A-98395C3BC3BB}';
var
  Path: PWideChar;

begin

  Path := nil;
  if (SHGetKnownFolderPath(Pictures, 0, 0, Path) < 0) then
    raise Exception.Create('Pictures folder lookup failed');
  try
    Result := UnicodeString(Path);
  finally
    CoTaskMemFree(Path);
  end;
end;

initialization
  SetMultiByteConversionCodePage(CP_UTF8);
  SetMultiByteRTLFileSystemCodePage(CP_UTF8);
end.
