unit MfEncodeAudio.Files;

{$mode delphiunicode}

interface

uses SysUtils,Classes,Types;

type
  TSearchOption = (soTopDirectoryOnly,soAllDirectories);
  TDirectory = class
  public
    class function GetFiles(const Directory,Mask: UnicodeString;
                             Option: TSearchOption): TStringDynArray; static;
  end;

  TFile = class
  public
    class procedure WriteAllText(const Name: UnicodeString;
                                  const Text: UnicodeString;
                                  Encoding: TEncoding); static;
    class procedure AppendAllText(const Name: UnicodeString;
                                   const Text: UnicodeString;
                                   Encoding: TEncoding); static;
  end;

implementation

class function TDirectory.GetFiles(const Directory,Mask: UnicodeString;
                                    Option: TSearchOption): TStringDynArray;
var
  Search: TSearchRec;
  Base: UnicodeString;
  Count: Integer;
begin
  if Option <> soTopDirectoryOnly then raise Exception.Create('Recursive search is not used by these samples');
  SetLength(Result,0);Count := 0;Base := IncludeTrailingPathDelimiter(Directory);
  if FindFirst(Base+Mask,faAnyFile,Search) <> 0 then Exit;
  try
    repeat
      if (Search.Attr and faDirectory) = 0 then
        begin
          SetLength(Result,Count+1);Result[Count] := UTF8Encode(Base+Search.Name);Inc(Count);
        end;
    until FindNext(Search) <> 0;
  finally FindClose(Search);end;
end;

procedure WriteBytes(Stream: TStream;const Bytes: TBytes);
begin
  if Length(Bytes)>0 then Stream.WriteBuffer(Bytes[0],Length(Bytes));
end;

class procedure TFile.WriteAllText(const Name: UnicodeString;
                                    const Text: UnicodeString;
                                    Encoding: TEncoding);
var
  Stream: TFileStream;
begin
  Stream := TFileStream.Create(Name,fmCreate);
  try
    WriteBytes(Stream,Encoding.GetPreamble());
    WriteBytes(Stream,Encoding.GetBytes(Text));
  finally Stream.Free;end;
end;

class procedure TFile.AppendAllText(const Name: UnicodeString;
                                     const Text: UnicodeString;
                                     Encoding: TEncoding);
var
  Stream: TFileStream;
begin
  if not FileExists(Name) then begin WriteAllText(Name,Text,Encoding);Exit;end;
  Stream := TFileStream.Create(Name,fmOpenWrite or fmShareDenyWrite);
  try
    Stream.Position := Stream.Size;
    WriteBytes(Stream,Encoding.GetBytes(Text));
  finally Stream.Free;end;
end;

end.
