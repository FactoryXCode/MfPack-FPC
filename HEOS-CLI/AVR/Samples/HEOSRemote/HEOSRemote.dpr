program HEOSRemote;
{$I Heos.Fpc.inc}
{$POINTERMATH ON}
{$APPTYPE GUI}

uses Interfaces,Windows,SysUtils,Math,ComObj,ActiveX,ExtCtrls,
Heos.Fpc.ControlsRuntime,Heos.Sample.Controls,
Forms,
  HEOSRadioArtwork in 'HEOSRadioArtwork.pas',
  HEOSRadioStreamProbe in 'HEOSRadioStreamProbe.pas',
  HEOSRadioForm in 'HEOSRadioForm.pas',
  HEOSTransport in 'HEOSTransport.pas',
  HEOSAudioServer in 'HEOSAudioServer.pas',
  Heos in 'Heos.pas',
  HEOSLoopback in 'HEOSLoopback.pas',
  HEOSSockets in 'HEOSSockets.pas',
  HEOSDiscovery in 'HEOSDiscovery.pas',
  HEOSPlaylist in 'HEOSPlaylist.pas',
  HEOSPlaylistForm in 'HeOsPlaylistForm.pas' {HEOSPlaylistEditor},
  HEOSRdjBridge in 'HEOSRdjBridge.pas',
  LWFileBrowserExDlg in 'LWFileBrowserExDlg.pas' {DlgLWFileBrowserEx},
  frmTagEditor in 'frmTagEditor.pas' {frmTagEditor},
  HEOSAacEncoder in 'HEOSAacEncoder.pas',
  RDJ.FilenameParser in 'RDJ.FilenameParser.pas',
  RDJ.LibraryScanner in 'RDJ.LibraryScanner.pas',
  RDJ.LibraryScanThread in 'RDJ.LibraryScanThread.pas',
  RDJ.PlaylistDb in 'RDJ.PlaylistDb.pas',
  RDJ.PlaylistManager in 'RDJ.PlaylistManager.pas',
  RDJ.PlaylistTypes in 'RDJ.PlaylistTypes.pas',
  RDJ.TagReader in 'RDJ.TagReader.pas',
  RDJ.TagWriter in 'RDJ.TagWriter.pas',
  RDJ.TrackLibrary in 'RDJ.TrackLibrary.pas',
  RDJ.TrackQuality in 'RDJ.TrackQuality.pas',
  RDJ_Common in 'RDJ_Common.pas',
  RDJ_NetWorkStationsScanner in 'RDJ_NetWorkStationsScanner.pas',
  MainForm in 'MainForm.pas' {HEOSForm};

procedure SmokeLog(const Text:UnicodeString);
var Bytes:UTF8String;Written:DWORD;OutputHandle:THandle;
begin
 Bytes:=UTF8Encode(Text+LineEnding);OutputHandle:=GetStdHandle(STD_OUTPUT_HANDLE);
 if (OutputHandle<>0) and (OutputHandle<>INVALID_HANDLE_VALUE) then
  WriteFile(OutputHandle,Bytes[1],Length(Bytes),Written,nil);
end;

var SavedMask:TFPUExceptionMask;
begin
 try
 SavedMask:=GetExceptionMask;
 SetExceptionMask([exInvalidOp,exDenormalized,exZeroDivide,exOverflow,exUnderflow,exPrecision]);
 OleCheck(CoInitializeEx(nil,COINIT_APARTMENTTHREADED));
 try
  Application.Initialize;
  if ParamStr(1)='--smoke' then Application.CaptureExceptions:=False;
  Application.Title:='HEOS AVR Remote';
  Application.CreateForm(THEOSForm,HEOSForm);
  try
   if ParamStr(1)='--smoke' then Application.ProcessMessages else Application.Run;
  finally
   FreeAndNil(HEOSForm);
  end;
 finally
  CoUninitialize;
  ClearExceptions(False);SetExceptionMask(SavedMask);
 end;
 if ParamStr(1)='--smoke' then SmokeLog('PASS: forms loaded and cleanup completed');
 except on E:Exception do
  begin
   if ParamStr(1)='--smoke' then begin SmokeLog('FAIL: '+E.ClassName+': '+E.Message);Halt(1);end;
   raise;
  end;
 end;
end.
