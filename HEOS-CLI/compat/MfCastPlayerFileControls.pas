unit MfCastPlayerFileControls;
{$I MfPack.Fpc.inc}
interface

uses
  Classes,
  FileCtrl;

type
  TMfCastFilterComboBox = class(TFilterComboBox)

  private
    FFileList: TFileListBox;
    function GetFilterText(): string;
    procedure SetFilterText(const Value: string);
    procedure SetFileList(const Value: TFileListBox);
    procedure UpdateFileMask();

  protected
    procedure Select(); override;
    procedure Loaded(); override;
    procedure Notification(AComponent: TComponent;
                           Operation: TOperation); override;

  published
    property FileList: TFileListBox read FFileList write SetFileList;
    property Filter: string read GetFilterText write SetFilterText;
  end;

implementation


function TMfCastFilterComboBox.GetFilterText(): string;

begin

  Result := inherited Filter;
end;


procedure TMfCastFilterComboBox.SetFilterText(const Value: string);

begin

  inherited Filter := Value;
  UpdateFileMask();
end;


procedure TMfCastFilterComboBox.UpdateFileMask();

begin

  if (FFileList <> nil) and not (csLoading in ComponentState) then
    FFileList.Mask := Mask;
end;


procedure TMfCastFilterComboBox.SetFileList(const Value: TFileListBox);

begin

  if (FFileList <> nil) then
    FFileList.RemoveFreeNotification(Self);
  FFileList := Value;
  if (FFileList <> nil) then
    FFileList.FreeNotification(Self);
  UpdateFileMask();
end;


procedure TMfCastFilterComboBox.Select();

begin

  inherited Select();
  UpdateFileMask();
end;


procedure TMfCastFilterComboBox.Loaded();

begin

  inherited Loaded();
  UpdateFileMask();
end;


procedure TMfCastFilterComboBox.Notification(AComponent: TComponent;
                                             Operation: TOperation);

begin

  inherited Notification(AComponent,
                         Operation);
  if (Operation = opRemove) and (AComponent = FFileList) then
    FFileList := nil;
end;

initialization
  RegisterClass(TMfCastFilterComboBox);
end.
