program LatencyExample;
{$IFDEF FPC}{$mode delphiunicode}{$ENDIF}
{$APPTYPE CONSOLE}
uses Windows,SysUtils,MfPack.LatencyTool;
const Measurements=20;
var Tool:TLatencyTool;StartTick,EndTick,ElapsedTicks:Int64;I:Integer;
begin
 try
  Tool:=TLatencyTool.Create;
  try
   if not Tool.Initialize then raise Exception.Create('Performance counter unavailable.');
   for I:=1 to Measurements do
     begin
       Tool.Start(StartTick,0);
       Sleep(1);
       Tool.Stop(EndTick,ElapsedTicks);
     end;
   Writeln('Measurements: ',Measurements);
   Writeln('Minimum: ',Tool.MinExecutionTime:0:3,' us');
   Writeln('Maximum: ',Tool.MaxExecutionTime:0:3,' us');
   Writeln('Average: ',Tool.AverageExecutionTime:0:3,' us');
   Writeln('Total:   ',Tool.TotalExecutionTime:0:3,' us');
   if (Tool.MinExecutionTime<0) or (Tool.AverageExecutionTime<Tool.MinExecutionTime) or
      (Tool.AverageExecutionTime>Tool.MaxExecutionTime) or (Tool.TotalExecutionTime<=0) then
     raise Exception.Create('Invalid measurement statistics.');
   Writeln('LATENCY EXAMPLE PASSED.');
  finally Tool.Free;end;
 except on E:Exception do begin Writeln(E.ClassName,': ',E.Message);Halt(1);end;end;
end.
