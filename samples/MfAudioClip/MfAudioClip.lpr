program MfAudioClip;

{$mode delphiunicode}

uses

  {$IFDEF FASTMM}
  FastMM4,
  {$ENDIF}

  Interfaces,
  SysUtils,
  WinApi.ComBaseApi,
  WinApi.ActiveX.ObjBase,
  Forms,
  AudioClipCore in 'AudioClipCore.pas',
  frmAudioClip in 'frmAudioClip.pas' {frmAudioClip};



begin
  if CoInitializeEx(nil,COINIT_APARTMENTTHREADED) < 0 then
    raise Exception.Create('COM initialization failed.');
  try
  Application.Initialize;

  Application.Title := 'MfAudioClip';
  Application.CreateForm(TfrmAudioClip, AudioClipFrm);
  if (ParamCount = 1) and (ParamStr(1) = '--smoke') then
    FreeAndNil(AudioClipFrm)
  else
    Application.Run;
  finally CoUninitialize;end;
end.
