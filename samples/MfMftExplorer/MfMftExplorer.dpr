program MfMftExplorer;

{$I MfPack.Fpc.inc}
{$POINTERMATH ON}

uses
  Interfaces,
SysUtils,
  Windows,
  WinApi.ComBaseApi,
  WinApi.ActiveX.ObjBase,
  Forms,
  WinApi.MediaFoundationApi.MfApi,
  Form.Main in 'Form.Main.pas' {frmMain};

var
  Hr: HResult;

begin
  Hr := CoInitializeEx(nil, COINIT_APARTMENTTHREADED);
  if FAILED(Hr) then
    raise Exception.CreateFmt('CoInitializeEx failed (HRESULT 0x%.8x).',
                              [Cardinal(Hr)]);
  try
    Hr := MFStartup(MF_VERSION, MFSTARTUP_FULL);
    if FAILED(Hr) then
      raise Exception.CreateFmt('MFStartup failed (HRESULT 0x%.8x).',
                                [Cardinal(Hr)]);
    try
      Application.Initialize;
      Application.MainFormOnTaskbar := True;
      Application.CreateForm(TfrmMain, frmMain);
      if ParamStr(1) = '--smoke' then Application.ProcessMessages
      else Application.Run;
    finally
      FreeAndNil(frmMain);
      MFShutdown;
    end;
  finally
    CoUninitialize;
  end;
end.
