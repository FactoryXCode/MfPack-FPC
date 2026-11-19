program MfSimpleCastPlayer;
{$mode delphiunicode}
{$APPTYPE GUI}
uses Interfaces,Forms,SysUtils,WinApi.ComBaseApi,WinApi.ActiveX.ObjBase,frmSimpleCastPlayer;
{$R *.res}
begin
 if CoInitializeEx(nil,2)<0 then raise Exception.Create('COM initialization failed.');
 try
 Application.Initialize;
 Application.CreateForm(TSimpleCastPlayerForm,SimpleCastPlayerForm);
 if ParamStr(1)='--smoke' then
   begin Application.ProcessMessages;FreeAndNil(SimpleCastPlayerForm);end
 else Application.Run;
 finally CoUninitialize;end;
end.
