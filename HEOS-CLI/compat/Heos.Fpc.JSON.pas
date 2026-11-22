unit Heos.Fpc.JSON;

{$mode delphiunicode}

interface

uses
  SysUtils,
  fpjson,
  jsonparser;

type
  TJSONValue = fpjson.TJSONData;
  TJSONObject = fpjson.TJSONObject;
  TJSONArray = fpjson.TJSONArray;
  TJSONPair = TJSONValue;
  TJSONString = fpjson.TJSONString;

  TJSONNumber = record
    class function Create(Value: Int64): TJSONValue; overload; static;
    class function Create(Value: Double): TJSONValue; overload; static;
  end;

  TJSONTrue = record
    class function Create: TJSONValue; static;
  end;

  TJSONFalse = record
    class function Create: TJSONValue; static;
  end;

  TFxJSONValueHelper = class helper for TJSONValue
    function ToJSON: UnicodeString;
    function GetValueText: UnicodeString;
    property Value: UnicodeString read GetValueText;
  end;

  TFxJSONObjectHelper = class helper for TJSONObject
    function GetValue(const Name: UnicodeString): TJSONValue;
    function RemovePair(const Name: UnicodeString): TJSONValue;
    procedure AddPair(const Name,
                      Value: UnicodeString); overload;
    procedure AddPair(const Name: UnicodeString;
                      Value: TJSONValue); overload;
  end;

  TFxJSONArrayHelper = class helper for TJSONArray
    procedure AddElement(Value: TJSONValue);
  end;

function FxParseJSON(const Text: UnicodeString): TJSONValue;
function FxJsonText(Value: TJSONValue): UnicodeString;

implementation


function TFxJSONValueHelper.GetValueText: UnicodeString;

begin

  Result := FxJsonText(Self);
end;


function TFxJSONObjectHelper.GetValue(const Name: UnicodeString): TJSONValue;

begin

  Result := Find(UTF8Encode(Name));
end;


function TFxJSONObjectHelper.RemovePair(const Name: UnicodeString): TJSONValue;
var
  Index: Integer;

begin

  Index := IndexOfName(UTF8Encode(Name));
  if (Index < 0) then
    Result := nil
  else
    Result := Extract(Index);
end;


class function TJSONNumber.Create(Value: Int64): TJSONValue;

begin

  Result := fpjson.TJSONInt64Number.Create(Value);
end;


class function TJSONNumber.Create(Value: Double): TJSONValue;

begin

  Result := fpjson.TJSONFloatNumber.Create(Value);
end;


class function TJSONTrue.Create: TJSONValue;

begin

  Result := fpjson.TJSONBoolean.Create(True);
end;


class function TJSONFalse.Create: TJSONValue;

begin

  Result := fpjson.TJSONBoolean.Create(False);
end;


function TFxJSONValueHelper.ToJSON: UnicodeString;

begin

  Result := UTF8Decode(AsJSON);
end;


procedure TFxJSONObjectHelper.AddPair(const Name,
                                      Value: UnicodeString);

begin

  Add(UTF8Encode(Name),
      UTF8Encode(Value));
end;


procedure TFxJSONObjectHelper.AddPair(const Name: UnicodeString;
                                      Value: TJSONValue);

begin

  Add(UTF8Encode(Name),
      Value);
end;


procedure TFxJSONArrayHelper.AddElement(Value: TJSONValue);

begin

  Add(Value);
end;


function FxParseJSON(const Text: UnicodeString): TJSONValue;

begin

  try
    Result := GetJSON(UTF8Encode(Text),
                      True);
  except
    on E: EJSONParser do
      Result := nil;
  end;
end;


function FxJsonText(Value: TJSONValue): UnicodeString;

begin

  if (Value = nil) then
    Result := ''
  else if (Value.JSONType = jtNull) then
    Result := 'null'
  else if (Value.JSONType = jtBoolean) then
    begin
      if Value.AsBoolean then
        Result := 'true'
      else
        Result := 'false';
    end
  else
    Result := UTF8Decode(Value.AsString);
end;

end.
