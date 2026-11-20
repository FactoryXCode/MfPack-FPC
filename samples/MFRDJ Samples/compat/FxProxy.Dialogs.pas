unit FxProxy.Dialogs;
{$mode delphiunicode}
interface
function FxInputQuery(const Caption,Prompt: UnicodeString;var Value: UnicodeString): Boolean;
function FxSelectDirectory(const Caption,Root: UnicodeString;var Directory: UnicodeString): Boolean;
implementation
uses Dialogs,FileCtrl;
function FxSelectDirectory(const Caption,Root: UnicodeString;var Directory: UnicodeString): Boolean;
var Text: AnsiString;
begin
  Text := UTF8Encode(Directory);
  Result := Dialogs.SelectDirectory(UTF8Encode(Caption),UTF8Encode(Root),Text);
  if Result then Directory := UTF8Decode(Text);
end;
function FxInputQuery(const Caption,Prompt: UnicodeString;var Value: UnicodeString): Boolean;
var Text: AnsiString;
begin
  Text := UTF8Encode(Value);
  Result := Dialogs.InputQuery(UTF8Encode(Caption),UTF8Encode(Prompt),Text);
  if Result then Value := UTF8Decode(Text);
end;
end.
