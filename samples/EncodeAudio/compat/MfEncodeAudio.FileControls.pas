unit MfEncodeAudio.FileControls;

{$I MfPack.Fpc.inc}

interface

uses
  Classes,
  SysUtils,
  Windows,
  Controls,
  StdCtrls,
  ComCtrls,
  ShellCtrls;

type
  TDirectoryListBox = class(TShellTreeView)

  private
    FDirectoryChange: TNotifyEvent;
    function GetDirectory(): UnicodeString;
    procedure SetDirectory(const Value: UnicodeString);

  protected
    procedure Change(Node: TTreeNode); override;

  published
    property Directory: UnicodeString read GetDirectory write SetDirectory;
    property OnChange: TNotifyEvent read FDirectoryChange write FDirectoryChange;
  end;

  TDriveComboBox = class(TComboBox)

  private
    FDirList: TDirectoryListBox;
    function GetDrive(): Char;

  protected
    procedure Change(); override;

  public
    constructor Create(Owner: TComponent); override;
    property Drive: Char read GetDrive;

  published
    property DirList: TDirectoryListBox read FDirList write FDirList;
  end;

implementation


function TDirectoryListBox.GetDirectory(): UnicodeString;

begin

  Result := UTF8Decode(Path);
end;


procedure TDirectoryListBox.SetDirectory(const Value: UnicodeString);

begin

  Path := UTF8Encode(Value);
end;


procedure TDirectoryListBox.Change(Node: TTreeNode);

begin

  inherited Change(Node);
  if not (csLoading in ComponentState) and not (csDestroying in ComponentState) and
    Assigned(FDirectoryChange) then
    FDirectoryChange(Self);
end;


constructor TDriveComboBox.Create(Owner: TComponent);
var
  Buffer: array[0..511] of WideChar;
  Cursor: PWideChar;

begin

  inherited Create(Owner);
  Style := csDropDownList;
  if (GetLogicalDriveStringsW(Length(Buffer), @Buffer[0]) > 0) then
    begin
      Cursor := @Buffer[0];
      while (Cursor^ <> #0) do
        begin
          Items.Add(UTF8Encode(UnicodeString(Cursor)));
          Inc(Cursor,
              Length(UnicodeString(Cursor)) + 1);
        end;
    end;
  if (Items.Count > 0) then
    ItemIndex := 0;
end;


function TDriveComboBox.GetDrive(): Char;

begin

  if (Text = '') then
    Result := #0
  else
    Result := Char(Text[1]);
end;


procedure TDriveComboBox.Change();

begin

  if (FDirList <> nil) and (ItemIndex >= 0) then
    FDirList.Directory := UTF8Decode(Items[ItemIndex]);
  inherited Change();
end;

initialization
  RegisterClasses([TDirectoryListBox, TDriveComboBox]);
end.
