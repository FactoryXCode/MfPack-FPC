unit MfPlayerSample.Diagnostics;

{$mode delphiunicode}

interface

type
  
  TStopwatch = record
  private
    FStart: Int64;
    FElapsed: Int64;
    FRunning: Boolean;
    function GetElapsedMilliseconds(): Int64;
  
  public
    class function StartNew(): TStopwatch; static;
    
    procedure Reset();
    procedure Stop();
    
    property ElapsedMilliseconds: Int64 read GetElapsedMilliseconds;
  end;
  

implementation


uses

  Windows;

class function TStopwatch.StartNew(): TStopwatch;
begin
  
  QueryPerformanceCounter(Result.FStart);
  Result.FElapsed := 0;
  Result.FRunning := True;
end;


procedure TStopwatch.Reset();
begin
  
  FStart := 0;
  FElapsed := 0;
  FRunning := False;
end;


procedure TStopwatch.Stop();
begin
  
  FElapsed := GetElapsedMilliseconds();
  FRunning := False;
end;


function TStopwatch.GetElapsedMilliseconds(): Int64;
var
  Counter: Int64;
  Frequency: Int64;
  
begin
  
  if not FRunning then
    Exit(FElapsed);
    
  QueryPerformanceCounter(Counter);
  QueryPerformanceFrequency(Frequency);
  
  Result := ((Counter - FStart) * 1000) div Frequency;
end;

end.
