unit FxProxy.IOUtils;
{$mode delphiunicode}
interface

uses
  Windows,
  SysUtils,
  Classes,
  Types;

type
  TSearchOption = (soTopDirectoryOnly,
                   soAllDirectories);
  TDirectory = record
    class function GetFiles(const Directory,
                            Pattern: UnicodeString;
                            Option: TSearchOption = soTopDirectoryOnly): TStringDynArray; static;
  end;
  TPath = record
    class function Combine(const A,
                           B: UnicodeString): UnicodeString; static;
    class function IsPathRooted(const P: UnicodeString): Boolean; static;
    class function GetFullPath(const P: UnicodeString): UnicodeString; static;
  end;
  TFile = record
    class function ReadAllBytes(const Name: UnicodeString): TBytes; static;
    class procedure WriteAllBytes(const Name: UnicodeString;
                                  const Data: TBytes); static;
    class function ReadAllText(const Name: UnicodeString;
                               Encoding: TEncoding = nil): UnicodeString; static;
    class procedure WriteAllText(const Name,
                                 Text: UnicodeString;
                                 Encoding: TEncoding = nil); static;
    class procedure AppendAllText(const Name,
                                  Text: UnicodeString;
                                  Encoding: TEncoding = nil); static;
    class function GetLastWriteTime(const Name: UnicodeString): TDateTime; static;
  end;

implementation


class function TDirectory.GetFiles(const Directory,
                                   Pattern: UnicodeString;
                                   Option: TSearchOption): TStringDynArray;
var
  Found: TSearchRec;


  procedure Scan(const Folder: UnicodeString);
  var
    Item: TSearchRec;
  begin
    if (FindFirst(IncludeTrailingPathDelimiter(Folder) + Pattern, faAnyFile, Item) = 0) then
    try
      repeat
        if ((Item.Attr and faDirectory) = 0) then
          begin
            SetLength(Result,
                      Length(Result) + 1);
            Result[High(Result)] := IncludeTrailingPathDelimiter(Folder) + Item.Name;
          end;
      until (FindNext(Item) <> 0);
    finally
      FindClose(Item);
    end;
    if (Option = soAllDirectories) then
      if (FindFirst(IncludeTrailingPathDelimiter(Folder) + '*', faDirectory, Item) = 0) then
      try
        repeat
          if ((Item.Attr and faDirectory) <> 0) and ((Item.Attr and faSymLink) = 0) and (Item.Name <> '.') and (Item.Name <> '..') then
            Scan(IncludeTrailingPathDelimiter(Folder) + Item.Name);
        until (FindNext(Item) <> 0);
      finally
        FindClose(Item);
      end;
  end;

begin

  Result := nil;
  Scan(Directory);
end;

function GetFileSizeEx(Handle: THandle;
                       out Size: Int64): BOOL; stdcall; external 'kernel32.dll';


class function TPath.Combine(const A,
                             B: UnicodeString): UnicodeString;

begin

  if (A = '') then
    Exit(B);
  if (B = '') then
    Exit(A);
  if IsPathRooted(B) then
    Exit(B);
  Result := IncludeTrailingPathDelimiter(A) + B;
end;


class function TPath.IsPathRooted(const P: UnicodeString): Boolean;

begin

  Result := (P <> '') and ((P[1] = '\') or (P[1] = '/') or ((Length(P) > 1) and (P[2] = ':')));
end;


class function TPath.GetFullPath(const P: UnicodeString): UnicodeString;

begin

  Result := ExpandFileName(P);
end;


class function TFile.ReadAllBytes(const Name: UnicodeString): TBytes;
var
  H: THandle;
  Size: Int64;
  Done, Count: DWORD;
  Pos: Integer;

begin

  Result := nil;
  H := CreateFileW(PWideChar(Name),
                   GENERIC_READ,
                   FILE_SHARE_READ or FILE_SHARE_WRITE or FILE_SHARE_DELETE,
                   nil,
                   OPEN_EXISTING,
                   FILE_ATTRIBUTE_NORMAL,
                   0);
  if (H = INVALID_HANDLE_VALUE) then
    RaiseLastOSError;
  try
    if not GetFileSizeEx(H, Size) then
      RaiseLastOSError;
    if (Size < 0) or (Size > MaxInt) then
      raise EStreamError.Create('File is too large');
    SetLength(Result,
              Integer(Size));
    Pos := 0;
    while (Pos < Length(Result)) do
      begin
        Count := Length(Result) - Pos;
        if not ReadFile(H, Result[Pos], Count, Done, nil) then
          RaiseLastOSError;
        if (Done = 0) then
          raise EReadError.Create('Unexpected end of file');
        Inc(Pos,
            Done);
      end;
  finally
    CloseHandle(H);
  end;
end;


class procedure TFile.WriteAllBytes(const Name: UnicodeString;
                                    const Data: TBytes);
var
  H: THandle;
  Pos: Integer;
  Done: DWORD;

begin

  H := CreateFileW(PWideChar(Name),
                   GENERIC_WRITE,
                   FILE_SHARE_READ,
                   nil,
                   CREATE_ALWAYS,
                   FILE_ATTRIBUTE_NORMAL,
                   0);
  if (H = INVALID_HANDLE_VALUE) then
    RaiseLastOSError;
  try
    Pos := 0;
    while (Pos < Length(Data)) do
      begin
        if not WriteFile(H, Data[Pos], Length(Data) - Pos, Done, nil) then
          RaiseLastOSError;
        if (Done = 0) then
          raise EWriteError.Create('No file write progress');
        Inc(Pos,
            Done);
      end;
  finally
    CloseHandle(H);
  end;
end;


class function TFile.ReadAllText(const Name: UnicodeString;
                                 Encoding: TEncoding): UnicodeString;
var
  Data: TBytes;
  Offset: Integer;

begin

  Data := ReadAllBytes(Name);
  if (Encoding = nil) then
    Encoding := TEncoding.UTF8;
  Offset := TEncoding.GetBufferEncoding(Data,
                                        Encoding);
  Result := Encoding.GetString(Data,
                               Offset,
                               Length(Data) - Offset);
end;


class procedure TFile.WriteAllText(const Name,
                                   Text: UnicodeString;
                                   Encoding: TEncoding);
var
  Data: TBytes;

begin

  if (Encoding = nil) then
    Encoding := TEncoding.UTF8;
  Data := Encoding.GetBytes(Text);
  WriteAllBytes(Name,
                Data);
end;


class procedure TFile.AppendAllText(const Name,
                                    Text: UnicodeString;
                                    Encoding: TEncoding);
var
  H: THandle;
  Data: TBytes;
  Pos: Int64;
  Done: DWORD;

begin

  if (Encoding = nil) then
    Encoding := TEncoding.UTF8;
  Data := Encoding.GetBytes(Text);
  H := CreateFileW(PWideChar(Name),
                   FILE_APPEND_DATA,
                   FILE_SHARE_READ,
                   nil,
                   OPEN_ALWAYS,
                   FILE_ATTRIBUTE_NORMAL,
                   0);
  if (H = INVALID_HANDLE_VALUE) then
    RaiseLastOSError;
  try
    Pos := 0;
    while (Pos < Length(Data)) do
      begin
        if not WriteFile(H, Data[Pos], Length(Data) - Pos, Done, nil) then
          RaiseLastOSError;
        if (Done = 0) then
          raise EWriteError.Create('No append progress');
        Inc(Pos,
            Done);
      end;
  finally
    CloseHandle(H);
  end;
end;


class function TFile.GetLastWriteTime(const Name: UnicodeString): TDateTime;
var
  Attr: WIN32_FILE_ATTRIBUTE_DATA;
  Local: TFileTime;
  Stamp: TSystemTime;

begin

  if not GetFileAttributesExW(PWideChar(Name), GetFileExInfoStandard, @Attr) then
    RaiseLastOSError;
  if not FileTimeToLocalFileTime(Attr.ftLastWriteTime, Local) then
    RaiseLastOSError;
  if not FileTimeToSystemTime(Local, Stamp) then
    RaiseLastOSError;
  Result := SystemTimeToDateTime(Stamp);
end;

end.
