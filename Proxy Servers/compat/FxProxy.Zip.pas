unit FxProxy.Zip;
{$mode delphiunicode}
interface
uses Classes,SysUtils,Zipper;
type
  TZipMode = (zmRead);
  TZipFile = class
  private
    FZip: TUnZipper;
    FSource: TStream;
    FOutput: TMemoryStream;
    procedure OpenInput(Sender: TObject;var Stream: TStream);
    procedure CloseInput(Sender: TObject;var Stream: TStream);
    procedure CreateOutput(Sender: TObject;var Stream: TStream;Item: TFullZipFileEntry);
    procedure DoneOutput(Sender: TObject;var Stream: TStream;Item: TFullZipFileEntry);
    function GetCount: Integer;
    function GetName(Index: Integer): UnicodeString;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Open(Stream: TStream;Mode: TZipMode);
    procedure Close;
    function IndexOf(const Name: UnicodeString): Integer;
    procedure Read(Index: Integer;out Data: TBytes);
    property FileCount: Integer read GetCount;
    property FileName[Index: Integer]: UnicodeString read GetName;
  end;
implementation
constructor TZipFile.Create;
begin
  inherited Create;FZip := TUnZipper.Create;
  FZip.OnOpenInputStream := OpenInput;FZip.OnCloseInputStream := CloseInput;
  FZip.OnCreateStream := CreateOutput;FZip.OnDoneStream := DoneOutput;
end;
destructor TZipFile.Destroy;
begin FZip.Free;FOutput.Free;inherited;end;
procedure TZipFile.OpenInput(Sender: TObject;var Stream: TStream);
begin FSource.Position := 0;Stream := FSource;end;
procedure TZipFile.CloseInput(Sender: TObject;var Stream: TStream);
begin Stream := nil;end;
procedure TZipFile.CreateOutput(Sender: TObject;var Stream: TStream;Item: TFullZipFileEntry);
begin FreeAndNil(FOutput);FOutput := TMemoryStream.Create;Stream := FOutput;end;
procedure TZipFile.DoneOutput(Sender: TObject;var Stream: TStream;Item: TFullZipFileEntry);
begin Stream := nil;end;
procedure TZipFile.Open(Stream: TStream;Mode: TZipMode);
begin FSource := Stream;FZip.Examine;end;
procedure TZipFile.Close;
begin FZip.Clear;FSource := nil;end;
function TZipFile.GetCount: Integer;
begin Result := FZip.Entries.Count;end;
function TZipFile.GetName(Index: Integer): UnicodeString;
begin
  if (Index<0) or (Index>=FileCount) then raise ERangeError.Create('ZIP entry index');
  Result := UTF8Decode(FZip.Entries[Index].ArchiveFileName);
end;
function TZipFile.IndexOf(const Name: UnicodeString): Integer;
var I: Integer;
begin for I := 0 to FileCount-1 do if FileName[I]=Name then Exit(I);Result := -1;end;
procedure TZipFile.Read(Index: Integer;out Data: TBytes);
var Name: UnicodeString;
begin
  Data := nil;Name := FileName[Index];FreeAndNil(FOutput);
  FZip.UnZipFile(UTF8Encode(Name));
  if FOutput=nil then Exit;
  if FOutput.Size>MaxInt then raise EStreamError.Create('ZIP entry is too large');
  SetLength(Data,FOutput.Size);if Length(Data)>0 then Move(FOutput.Memory^,Data[0],Length(Data));
end;
end.
