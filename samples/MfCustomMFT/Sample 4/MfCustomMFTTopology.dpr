program MfCustomMFTTopology;

{$I MfPack.Fpc.inc}
{$POINTERMATH ON}

uses
  Interfaces,
{WinApi}
  Windows,
  WinApi.ComBaseApi,
  {ActiveX}
  WinApi.ActiveX.ObjBase,
  {System}
  SysUtils,
  {Vcl}
  Forms,
  {MediaFoundationApi}
  WinApi.MediaFoundationApi.MfApi,
  {Application}
  Form.Main in 'Form.Main.pas' {frmMain},
  TopologyPlayer in 'TopologyPlayer.pas',
  MfGrayscaleMFT in 'MfGrayscaleMFT.pas';

var
  Hr: HRESULT;

begin

  Hr := CoInitializeEx(nil,
                       COINIT_APARTMENTTHREADED);
  if Failed(Hr) then
    Halt(1);

  try
    Hr := MFStartup(MF_VERSION,
                    MFSTARTUP_FULL);
    if Failed(Hr) then
      Halt(1);

    try
      Application.Initialize;
      Application.MainFormOnTaskbar := True;
      Application.CreateForm(TfrmMain, frmMain);
      if ParamStr(1) = '--smoke' then Application.ProcessMessages
      else Application.Run;
    finally
      FreeAndNil(frmMain);
      MFShutdown();
    end;

  finally
    CoUninitialize();
  end;
end.
