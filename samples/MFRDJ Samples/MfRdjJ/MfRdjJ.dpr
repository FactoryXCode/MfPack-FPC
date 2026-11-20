program MfRdjJ;
{$I MfPack.Fpc.inc}
{$POINTERMATH ON}

uses Rdj.ControlsRuntime,
Rdj.Platform,
Interfaces,SysUtils,Math,ComObj,
  LMessages,
  LCLType,
  MfCastPlayerPlatform,
WinApi.ActiveX.ObjBase,
  WinApi.WinApiTypes,
WinApi.ComBaseApi,



{$IFDEF madExcept}
{$ENDIF}
  Forms,
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
  Themes,
  frmMainMDI in 'frmMainMDI.pas' {MainMDIFrm},
  MfIcecastBroadcastEngine in 'MfIcecastBroadcastEngine.pas',
  MfMicrophoneFx in 'MfMicrophoneFx.pas',
  MfMicrophoneDeckEngine in 'MfMicrophoneDeckEngine.pas',
  MicrophoneDeckFrm in 'MicrophoneDeckFrm.pas' {MicrophoneDeckFrm},
  MfIcecastServerManager in 'MfIcecastServerManager.pas',
  MfBroadcastEncoderAac in 'MfBroadcastEncoderAac.pas',
  RDJ.JSon in 'RDJ.JSon.pas',
  RDJ.FilenameParser in 'RDJ.FilenameParser.pas',
  dlgMediaServer in 'dlgMediaServer.pas' {frmMediaServer},
  dlgAudioDevices in 'dlgAudioDevices.pas' {AudioDevicesDlg},
  LWFileBrowserExDlg in 'LWFileBrowserExDlg.pas' {LWFileBrowserExDlg},
  RDJ_NetWorkStationsScanner in 'RDJ_NetWorkStationsScanner.pas';



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
   Application.Title:='RDJ Radio';
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
