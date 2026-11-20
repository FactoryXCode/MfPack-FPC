unit MfCaptureSamples.Diagnostics;

{$mode delphiunicode}

interface

type
  TStopwatch = record
  private
    FStart,FElapsed: Int64;
    FRunning: Boolean;
    function GetElapsedMilliseconds(): Int64;
  public
    class function Create(): TStopwatch; static;
    class function StartNew(): TStopwatch; static;
    procedure Start();
    procedure Stop();
    procedure Reset();
    property ElapsedMilliseconds: Int64 read GetElapsedMilliseconds;
  end;

implementation

uses Windows;

class function TStopwatch.Create(): TStopwatch;
begin
  Result := Default(TStopwatch);
end;

class function TStopwatch.StartNew(): TStopwatch;
begin
  Result := Create();
  Result.Start();
end;

procedure TStopwatch.Start();
begin
  if not FRunning then
    begin
      QueryPerformanceCounter(FStart);
      FRunning := True;
    end;
end;

procedure TStopwatch.Stop();
begin
  FElapsed := GetElapsedMilliseconds();
  FRunning := False;
end;

procedure TStopwatch.Reset();
begin
  FStart := 0;
  FElapsed := 0;
  FRunning := False;
end;

function TStopwatch.GetElapsedMilliseconds(): Int64;
var
  Counter,Frequency: Int64;
begin
  Result := FElapsed;
  if FRunning then
    begin
      QueryPerformanceCounter(Counter);
      QueryPerformanceFrequency(Frequency);
      Inc(Result,((Counter - FStart) * 1000) div Frequency);
    end;
end;

end.
