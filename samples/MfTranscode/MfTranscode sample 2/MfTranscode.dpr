program MfTranscode;

{$I MfPack.Fpc.inc}
{$POINTERMATH ON}

uses
  MfCaptureSamples.Platform,
  Interfaces,
  WinApi.ComBaseApi,
  WinApi.ActiveX.ObjBase,
  ComObj,
  SysUtils,
{$IFDEF FASTMM}
  FastMM4,
  {$ENDIF}

  Forms,
  frmTranscode in 'frmTranscode.pas' {frmTranscoder},
  Transcoder in 'Transcoder.pas',
  Common in 'Common.pas',
  dlgAudioFormats in 'dlgAudioFormats.pas' {AudioFormatDlg},
  dlgVideoFormats in 'dlgVideoFormats.pas' {VideoFormatDlg};

{$R *.res}

begin
  {$IFDEF DEBUG}
  
  {$ENDIF}
  OleCheck(CoInitializeEx(nil,
                          COINIT_APARTMENTTHREADED));
  try
    Application.Initialize;
    Application.MainFormOnTaskbar := True;
    Application.Title := 'MfTranscode version 3.1.6';
    Application.CreateForm(TfrmTranscoder, frmTranscoder);
    Application.CreateForm(TAudioFormatDlg, AudioFormatDlg);
    Application.CreateForm(TVideoFormatDlg, VideoFormatDlg);
    if (ParamCount = 1) and (ParamStr(1) = '--smoke') then
      begin
        Application.ProcessMessages;
        frmTranscoder.Close();
        Application.ProcessMessages;
        FreeAndNil(frmTranscoder);
      end
    else
      Application.Run;
  finally
    CoUninitialize();
  end;
end.
