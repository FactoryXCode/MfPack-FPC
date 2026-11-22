unit MfCameraTimeSpan;

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

    constructor Create(Ticks: Int64);

    class function FromMilliseconds(Value: Double): TTimeSpan; static;

    property Hours: Integer read GetHours;
    property Minutes: Integer read GetMinutes;
    property Seconds: Integer read GetSeconds;
    property Milliseconds: Integer read GetMilliseconds;
  end;


implementation


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
