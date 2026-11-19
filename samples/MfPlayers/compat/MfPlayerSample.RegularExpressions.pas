unit MfPlayerSample.RegularExpressions;

{$mode delphiunicode}

interface

uses
  SysUtils,
  URegExpr;

type
  TRegExOption = (roNotEmpty,
                  roSingleLine);
                  
  TRegExOptions = set of TRegExOption;

  TGroup = record
    Value: UnicodeString;
  end;

  TGroupCollection = record
  private
    FValues: array of TGroup;
    function GetCount: Integer;
    function GetItem(Index: Integer): TGroup;
  
  public
    
    property Count: Integer read GetCount;
    property Item[Index: Integer]: TGroup read GetItem;
  end;

  TMatch = record
  private
    FPattern,FText: UnicodeString;
    FOptions: TRegExOptions;
    FNext: Integer;
  
  public
    Success: Boolean;
    Value: UnicodeString;
    Groups: TGroupCollection;
    function NextMatch: TMatch;
  end;

  // The small Unicode regex surface used by LangTags and TimedTextClass.
  // PCRE reset-match syntax is adapted only for their two literal prefixes.
  TRegEx = record
  private
    FPattern: UnicodeString;
    FOptions: TRegExOptions;
  
  public
    constructor Create(const Pattern: UnicodeString;
                       Options: TRegExOptions = []);
    
    function Match(const Text: UnicodeString): TMatch;
    class function IsMatch(const Text,Pattern: UnicodeString): Boolean; static;
  end;

implementation

function FindMatch(const Pattern: UnicodeString;
                   const Text: UnicodeString;
                   Options: TRegExOptions;
                   Start: Integer): TMatch;
var
  Engine: TRegExpr;
  Expression: UnicodeString;
  DisplayGroup,I: Integer;
  Found: Boolean;
  
begin
  
  Result := Default(TMatch);
  Result.FPattern := Pattern;
  Result.FText := Text;
  Result.FOptions := Options;
  
  if (Start < 1) or (Start > Length(Text)+1) then
    Exit;
    
  Expression := Pattern;
  DisplayGroup := 0;
  
  if Pattern = '\[\K[a-z][a-z]' then
    begin 
      Expression := '\[([a-z][a-z])';DisplayGroup := 1;
    end
  else
    if (Pattern = '{\K[-+]?[0-9]*') then
      begin
        Expression := '\{([-+]?[0-9]*)';DisplayGroup := 1;
      end
  else
    if (Pos('\K',Pattern) <> 0) then
      raise EArgumentException.Create('Unsupported reset-match pattern');
      
  Engine := TRegExpr.Create;
  
  try
    Engine.Expression := Expression;
    Engine.ModifierS := roSingleLine in Options;
    Engine.ModifierM := False;
    Engine.InputString := Text;
    Found := Engine.ExecPos(Start);
    
    while Found do
      begin
        Result.FNext := Engine.MatchPos[0]+Engine.MatchLen[0];
        
        if Engine.MatchLen[0] = 0 then
          Inc(Result.FNext);
        
        if not (roNotEmpty in Options) or (Engine.MatchLen[DisplayGroup] > 0) then
          begin
            Result.Success := True;
            Result.Value := Engine.Match[DisplayGroup];
            
            if DisplayGroup = 0 then
              begin
                SetLength(Result.Groups.FValues,Engine.SubExprMatchCount+1);
                for I := 0 to High(Result.Groups.FValues) do
                  Result.Groups.FValues[I].Value := Engine.Match[I];
              end
            else
              begin
                SetLength(Result.Groups.FValues,1);
                Result.Groups.FValues[0].Value := Result.Value;
              end;
            Exit;
          end;
          
        if (Result.FNext > Length(Text) + 1) then
          Exit;
        Found := Engine.ExecPos(Result.FNext);
      end;
      
  finally Engine.Free;end;
end;


function TGroupCollection.GetCount(): Integer;
begin
  
  Result := Length(FValues);
end;


function TGroupCollection.GetItem(Index: Integer): TGroup;
begin
  if (Index < 0) or (Index >= Length(FValues)) then
    raise ERangeError.Create('Regex group index');
  Result := FValues[Index];
end;


function TMatch.NextMatch(): TMatch;
begin
  
  if not Success then
    Exit(Default(TMatch));
    
  Result := FindMatch(FPattern,
                      FText,
                      FOptions,FNext);
end;

constructor TRegEx.Create(const Pattern: UnicodeString;
                          Options: TRegExOptions);
begin
  
  FPattern := Pattern;
  FOptions := Options;
end;


function TRegEx.Match(const Text: UnicodeString): TMatch;
begin
  
  Result := FindMatch(FPattern,
                      Text,
                      FOptions,
                      1);
end;

class function TRegEx.IsMatch(const Text: UnicodeString;
                              const Pattern: UnicodeString): Boolean;
var
  M: TMatch;

begin
  
  M := FindMatch(Pattern,
                 Text,
                 [],
                 1);
                 
  Result := M.Success;
end;

end.
