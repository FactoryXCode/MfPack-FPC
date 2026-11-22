unit MfDuckingTimeSpan;
{$mode delphiunicode}
interface

type
  TTimeSpan = record

  private
    FTicks: Int64;
    function GetHours(): Integer;
    function GetMinutes(): Integer;
    function GetSeconds(): Integer;
    function GetMilliseconds(): Integer;

  public
    constructor Create(Ticks: Int64); overload;
    constructor Create(Hours,
                       Minutes,
                       Seconds: Integer); overload;
    class function Zero: TTimeSpan; static;
    class function FromTicks(Value: Int64): TTimeSpan; static;
    function GetTotalMilliseconds: Double;
    function GetTotalSeconds: Double;
    property Ticks: Int64 read FTicks;
    property TotalMilliseconds: Double read GetTotalMilliseconds;
    property TotalSeconds: Double read GetTotalSeconds;
    class function FromMilliseconds(Value: Double): TTimeSpan; static;
    property Hours: Integer read GetHours;
    property Minutes: Integer read GetMinutes;
    property Seconds: Integer read GetSeconds;
    property Milliseconds: Integer read GetMilliseconds;
  end;

implementation


constructor TTimeSpan.Create(Hours,
                             Minutes,
                             Seconds: Integer);

begin

  FTicks := (Int64(Hours) * 3600 + Int64(Minutes) * 60 + Seconds) * 10000000;
end;


class function TTimeSpan.Zero: TTimeSpan;

begin

  Result.FTicks := 0;
end;


class function TTimeSpan.FromTicks(Value: Int64): TTimeSpan;

begin

  Result.FTicks := Value;
end;


function TTimeSpan.GetTotalMilliseconds: Double;

begin

  Result := FTicks / 10000;
end;


function TTimeSpan.GetTotalSeconds: Double;

begin

  Result := FTicks / 10000000;
end;


constructor TTimeSpan.Create(Ticks: Int64);

begin

  FTicks := Ticks;
end;


class function TTimeSpan.FromMilliseconds(Value: Double): TTimeSpan;

begin

  Result.FTicks := Round(Value * 10000);
end;


function TTimeSpan.GetHours(): Integer;

begin

  Result := (FTicks div 36000000000) mod 24;
end;


function TTimeSpan.GetMinutes(): Integer;

begin

  Result := (FTicks div 600000000) mod 60;
end;


function TTimeSpan.GetSeconds(): Integer;

begin

  Result := (FTicks div 10000000) mod 60;
end;


function TTimeSpan.GetMilliseconds(): Integer;

begin

  Result := (FTicks div 10000) mod 1000;
end;

end.
