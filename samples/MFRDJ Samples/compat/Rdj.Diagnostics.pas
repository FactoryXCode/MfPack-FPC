unit Rdj.Diagnostics;
{$mode delphiunicode}
interface
uses Windows;
type
 TTimeSpan=record
  TotalHours:Double;Minutes,Seconds,Milliseconds:Integer;
 end;
 TStopwatch=record
 private
  FStart,FElapsed:Int64;FRunning:Boolean;
  function GetElapsedMilliseconds:Int64;
  function GetElapsed:TTimeSpan;
 public
  class function Create:TStopwatch;static;
  class function StartNew:TStopwatch;static;
  procedure Start;
  procedure Stop;
  procedure Reset;
  property ElapsedMilliseconds:Int64 read GetElapsedMilliseconds;
  property Elapsed:TTimeSpan read GetElapsed;
 end;
implementation
class function TStopwatch.Create:TStopwatch;
begin FillChar(Result,SizeOf(Result),0);end;
class function TStopwatch.StartNew:TStopwatch;
begin Result:=Create;Result.Start;end;
procedure TStopwatch.Start;
begin if not FRunning then begin QueryPerformanceCounter(FStart);FRunning:=True;end;end;
procedure TStopwatch.Stop;
begin FElapsed:=GetElapsedMilliseconds;FRunning:=False;end;
procedure TStopwatch.Reset;
begin FStart:=0;FElapsed:=0;FRunning:=False;end;
function TStopwatch.GetElapsedMilliseconds:Int64;
var Count,Frequency:Int64;
begin
 Result:=FElapsed;if not FRunning then Exit;
 QueryPerformanceCounter(Count);QueryPerformanceFrequency(Frequency);
 Result:=Result+Trunc((Count-FStart)*1000.0/Frequency);
end;
function TStopwatch.GetElapsed:TTimeSpan;
var Value:Int64;
begin
 Value:=GetElapsedMilliseconds;Result.TotalHours:=Value/3600000;
 Result.Minutes:=(Value div 60000) mod 60;Result.Seconds:=(Value div 1000) mod 60;Result.Milliseconds:=Value mod 1000;
end;
end.
