program WinHResultTools;
{$mode delphiunicode}
{$APPTYPE GUI}
uses Interfaces,Forms,SysUtils,HrDlg,MediaTransformToolDlg,
     WinApi.ComBaseApi,WinApi.ActiveX.ObjBase,WinApi.MediaFoundationApi.MfApi;
begin
  if CoInitializeEx(nil,COINIT_APARTMENTTHREADED) < 0 then raise Exception.Create('COM initialization failed.');
  try
    if MFStartup(MF_VERSION,MFSTARTUP_FULL) < 0 then raise Exception.Create('Media Foundation initialization failed.');
    try
      Application.Initialize;
      Application.CreateForm(TdlgHrTools,dlgHrTools);
      if (ParamCount = 1) and (ParamStr(1) = '--smoke') then
        begin
          dlgHrTools.cbxAutoPaste.Checked := False;
          dlgHrTools.rbHLD.Checked := True;
          dlgHrTools.edHrHex.Text := '$80004005';
          dlgHrTools.butSearchClick(nil);
          if Pos('E_FAIL',UnicodeString(dlgHrTools.mmoDescription.Text)) = 0 then
            raise Exception.Create('Lookup initialization check failed.');
        end
      else
        Application.Run;
    finally
      FreeAndNil(dlgMediaTransformTool);
      FreeAndNil(dlgHrTools);
      MFShutdown;
    end;
  finally CoUninitialize;end;
end.
