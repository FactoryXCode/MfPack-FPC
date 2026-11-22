unit Heos.Fpc.Text;
{$mode delphiunicode}
interface

function MfCastSplit(const Text: UnicodeString;
                     Delimiter: WideChar): TArray < UnicodeString > ;

implementation


function MfCastSplit(const Text: UnicodeString;
                     Delimiter: WideChar): TArray < UnicodeString > ;
var
  I, Start, N: Integer;

begin

  Result := nil;
  Start := 1;
  N := 0;
  for I := 1 to Length(Text) + 1 do
    if (I > Length(Text)) or (Text[I] = Delimiter) then
      begin
        SetLength(Result,
                  N + 1);
        Result[N] := Copy(Text,
                          Start,
                          I - Start);
        Inc(N);
        Start := I + 1;
      end;
end;

end.
