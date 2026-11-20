program MfRdjJ;
{$I MfPack.Fpc.inc}
{$POINTERMATH ON}

uses Heos.Fpc.ControlsRuntime,
Rdj.ControlsRuntime,
Rdj.Platform,
Interfaces,SysUtils,Math,ComObj,
  LMessages,
  LCLType,
  MfCastPlayerPlatform,
WinApi.ActiveX.ObjBase,
  WinApi.WinApiTypes,
WinApi.ComBaseApi,



  Forms,
  Themes,
  frmMasterDeck in 'frmMasterDeck.pas' {MasterDeckFrm},
  frmPlaylistEditor in 'frmPlaylistEditor.pas' {frmPlaylistEditor},
  frmSetup in 'frmSetup.pas' {frmSetup},
  RDJ.LibraryScanner in 'RDJ.LibraryScanner.pas',
  RDJ.PlaylistDb in 'RDJ.PlaylistDb.pas',
  RDJ.PlaylistManager in 'RDJ.PlaylistManager.pas',
  RDJ.PlaylistTypes in 'RDJ.PlaylistTypes.pas',
  RDJ.Setup in 'RDJ.Setup.pas',
  RDJ.TagReader in 'RDJ.TagReader.pas',
  RDJ.TrackLibrary in 'RDJ.TrackLibrary.pas',
  RDJ.LibraryScanThread in 'RDJ.LibraryScanThread.pas',
  RDJ.InternalMixer in 'RDJ.InternalMixer.pas',
  MfWasApiRenderOutputEngine in 'MfWasApiRenderOutputEngine.pas',
  MfChannelDeckEngine in 'MfChannelDeckEngine.pas',
  frmMasterFxRack in 'frmMasterFxRack.pas' {frmMasterFxRack},
  frmTagEditor in 'frmTagEditor.pas' {frmTagEditor},
  RDJ.TagWriter in 'RDJ.TagWriter.pas',
  MfLoopbackDeckEngine in 'MfLoopbackDeckEngine.pas',
  frmLoopbackDeck in 'frmLoopbackDeck.pas' {LoopbackDeckfrm},
  LoopBackCapture in 'LoopBackCapture.pas',
  frmChannelDeck in 'frmChannelDeck.pas' {ChannelDeckFrm},
  frmProcessPicker in 'frmProcessPicker.pas' {dlgProcessPicker},
  ProcessAudioPickerUtils in 'ProcessAudioPickerUtils.pas',
  MfAudioRecorder in 'MfAudioRecorder.pas',
  MfAudioFileWriter in 'MfAudioFileWriter.pas',
  RDJ_Common in 'RDJ_Common.pas',
  frmMainMDI in 'frmMainMDI.pas' {MainMDIFrm},
  MfMicrophoneFx in 'MfMicrophoneFx.pas',
  MfMicrophoneDeckEngine in 'MfMicrophoneDeckEngine.pas',
  MicrophoneDeckFrm in 'MicrophoneDeckFrm.pas' {MicrophoneDeckFrm},
  RDJ.JSon in 'RDJ.JSon.pas',
  RDJ.FilenameParser in 'RDJ.FilenameParser.pas',
  dlgMediaServer in 'dlgMediaServer.pas' {frmMediaServer},
  dlgHeosRemote in 'dlgHeosRemote.pas' {HeosRemoteFrm},
  Heos,
  HEOSTransport,
  HEOSSockets,
  HEOSDiscovery,
  RDJ.HeosOutput in 'RDJ.HeosOutput.pas',
  RDJ.HeosAudioServer in 'RDJ.HeosAudioServer.pas',
  RDJ.HeosAacEncoder in 'RDJ.HeosAacEncoder.pas',
  dlgAudioDevices in 'dlgAudioDevices.pas' {AudioDevicesDlg},
  LWFileBrowserExDlg in 'LWFileBrowserExDlg.pas' {LWFileBrowserExDlg},
  RDJ_NetWorkStationsScanner in 'RDJ_NetWorkStationsScanner.pas',
  RDJ.RdjPro.Compositor in 'RDJ.RdjPro.Compositor.pas',
  RDJ.RdjPro.AudioQueue in 'RDJ.RdjPro.AudioQueue.pas',
  RDJ.RdjPro.CaptureEngine in 'RDJ.RdjPro.CaptureEngine.pas',
  RDJ.RdjPro.SampleConverter in 'RDJ.RdjPro.SampleConverter.pas',
  RDJ.RdjPro.Mp4Recorder in 'RDJ.RdjPro.Mp4Recorder.pas',
  RDJ.RdjPro.BroadcastFmp4Recorder in 'RDJ.RdjPro.BroadcastFmp4Recorder.pas',
  RDJ.RdjPro.CastFmp4Rebaser in 'RDJ.RdjPro.CastFmp4Rebaser.pas',
  RDJ.EqPlot in 'RDJ.EqPlot.pas',
  RDJ.Log in 'RDJ.Log.pas',
  RDJ.BackgroundAudio in 'RDJ.BackgroundAudio.pas',
  RDJ.RadioAudioServer in 'RDJ.RadioAudioServer.pas';



{$R MfRdjJ.res}
var SavedMask: TFPUExceptionMask;
begin
 try
  SetMultiByteConversionCodePage(CP_UTF8);
  SetMultiByteRTLFileSystemCodePage(CP_UTF8);
  SavedMask:=GetExceptionMask;
  SetExceptionMask([exInvalidOp,exDenormalized,exZeroDivide,exOverflow,exUnderflow,exPrecision]);
  OleCheck(CoInitializeEx(nil,COINIT_APARTMENTTHREADED));
  try
   Application.Initialize;
   Application.Title:='RDJ Pro';
   Application.CreateForm(TMainMDIFrm,MainMDIFrm);
   Application.CreateForm(TLWFileBrowserExDlg,DlgLWFileBrowserEx);
   Application.CreateForm(TfrmMediaServer,fMediaServer);
   if ParamStr(1)='--smoke' then Application.ProcessMessages else Application.Run;
  finally
   FreeAndNil(fMediaServer);FreeAndNil(DlgLWFileBrowserEx);FreeAndNil(MainMDIFrm);
   CoUninitialize;ClearExceptions(False);SetExceptionMask(SavedMask);
  end;
 except
  on E:Exception do begin Writeln('FAIL: '+E.ClassName+': '+E.Message);Halt(1);end;
 end;
end.
