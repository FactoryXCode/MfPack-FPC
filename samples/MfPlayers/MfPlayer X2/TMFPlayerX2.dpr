program TMFPlayerX2;

{$I MfPack.Fpc.inc}
{$POINTERMATH ON}
{$PACKENUM 1}

uses
  MfPlayerSample.Platform,
  Interfaces,
  WinApi.ComBaseApi,
  WinApi.ActiveX.ObjBase,
  SysUtils,
  Forms,
  frmMfPlayer in 'frmMfPlayer.pas' {frm_MfPlayer},
  dlgStreamSelect in 'dlgStreamSelect.pas' {dlgSelectStreams},
  TimedTextClass,
  MfMatroskaSubtitleReader,
  MfEmbeddedSubtitleReader,
  LangTags,
  MfPlayerClassX in 'MfPlayerClassX.pas',
  MfMediaTimeline in 'MfMediaTimeline.pas',
  MfSubtitleCompositor,
  MfSubtitleFramePump,
  MfSubtitleTransform in 'MfSubtitleTransform.pas',
  MFTimerCallBackClass in 'MFTimerCallBackClass.pas',
  MfPCXConstants,
  dlgSelectTimedTextLanguages in 'dlgSelectTimedTextLanguages.pas' {DlgTimedTextLanguages},
  dlgMfCastDevices in 'dlgMfCastDevices.pas' {CastDevicesDlg};

{$R *.res}

var
  hrCom: LongInt;

begin
  hrCom := CoInitializeEx(nil,COINIT_APARTMENTTHREADED);
  if hrCom < 0 then
    raise Exception.CreateFmt('COM initialization failed: %.8x',[Cardinal(hrCom)]);
  try

   // Check for memoryleaks (debug mode (F9) only!)
{$IFNDEF madExcept}
  {$IFDEF DEBUG}
    {$WARN SYMBOL_PLATFORM OFF}
    
    {$WARN SYMBOL_PLATFORM ON}
  {$ENDIF}
{$ENDIF}

  Application.Initialize;
  Application.MainFormOnTaskbar:= True;
  Application.Title := 'MFPlayer X2';
  Application.CreateForm(Tfrm_MfPlayer, frm_MfPlayer);
  Application.CreateForm(TdlgSelectStreams, dlgSelectStreams);
  Application.CreateForm(TdlgTimedTextLanguages, dlgTimedTextLanguages);
  Application.CreateForm(TCastDevicesDlg, CastDevicesDlg);
  if (ParamCount = 1) and (ParamStr(1) = '--smoke') then
    begin
      Application.ProcessMessages;
      frm_MfPlayer.Close();
      Application.ProcessMessages;
      FreeAndNil(frm_MfPlayer);
    end
  else
    Application.Run;
  finally
    CoUninitialize();
  end;
end.

