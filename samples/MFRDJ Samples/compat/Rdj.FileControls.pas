unit Rdj.FileControls;
{$mode delphiunicode}
interface

uses
  Classes,
  SysUtils,
  Windows,
  StdCtrls,
  FileCtrl;

type
  TRdjDirectoryListBox = class(TListBox)

  private
    FDirectory: UnicodeString;
    FFileList: TFileListBox;
    FOnChange: TNotifyEvent;
    procedure SetDirectory(const Value: UnicodeString);
    procedure SetFileList(Value: TFileListBox);

  protected
    procedure DblClick; override;

  public
    property Directory: UnicodeString read FDirectory write SetDirectory;
    property FileList: TFileListBox read FFileList write SetFileList;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

  TRdjDriveComboBox = class(TComboBox)

  private
    FDirList: TRdjDirectoryListBox;

  protected
    procedure Change; override;

  public
    constructor Create(AOwner: TComponent); override;
    property DirList: TRdjDirectoryListBox read FDirList write FDirList;
  end;

implementation


procedure TRdjDirectoryListBox.SetDirectory(const Value: UnicodeString);
var
  Info: TSearchRec;

begin

  if not DirectoryExists(Value) then
    Exit;
  FDirectory := ExcludeTrailingPathDelimiter(ExpandFileName(Value));
  Items.BeginUpdate;
  try
    Items.Clear;
    Items.Add('..');
    if (FindFirst(IncludeTrailingPathDelimiter(FDirectory) + '*', faDirectory, Info) = 0) then
    try
      repeat
        if ((Info.Attr and faDirectory) <> 0) and (Info.Name <> '.') and (Info.Name <> '..') then
          Items.Add(UTF8Encode(Info.Name));
      until (FindNext(Info) <> 0);
    finally
      SysUtils.FindClose(Info);
    end;
  finally
    Items.EndUpdate;
  end;
  if (FFileList <> nil) then
    FFileList.Directory := UTF8Encode(FDirectory);
  if Assigned(FOnChange) then
    FOnChange(Self);
end;


procedure TRdjDirectoryListBox.SetFileList(Value: TFileListBox);

begin

  FFileList := Value;
  if (Value <> nil) and (FDirectory <> '') then
    Value.Directory := UTF8Encode(FDirectory);
end;


procedure TRdjDirectoryListBox.DblClick;
var
  Target: UnicodeString;

begin

  if (ItemIndex >= 0) then
    begin
      Target := IncludeTrailingPathDelimiter(FDirectory) + UTF8Decode(Items[ItemIndex]);
      SetDirectory(Target);
    end;
  inherited;
end;


constructor TRdjDriveComboBox.Create(AOwner: TComponent);
var
  Letter: WideChar;
  Root: UnicodeString;

begin

  inherited;
  Style := csDropDownList;
  for Letter := 'A' to 'Z' do
    begin
      Root := Letter + ':\';
      if (GetDriveTypeW(PWideChar(Root)) <> DRIVE_NO_ROOT_DIR) then
        Items.Add(UTF8Encode(Root));
    end;
  if (Items.Count > 0) then
    ItemIndex := 0;
end;


procedure TRdjDriveComboBox.Change;

begin

  if (FDirList <> nil) and (ItemIndex >= 0) then
    FDirList.Directory := UTF8Decode(Items[ItemIndex]);
  inherited;
end;

end.
