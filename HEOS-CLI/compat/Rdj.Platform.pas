unit Rdj.Platform;
{$mode delphiunicode}
interface
uses Windows;
const MOVEFILE_WRITE_THROUGH=$00000008;
function ReplaceFileW(ReplacedName,ReplacementName,BackupName:PWideChar;Flags:DWORD;Exclude,Reserved:Pointer):BOOL;stdcall;external 'kernel32.dll';
implementation
end.
