program TMFPlayer;

{$I MfPack.Fpc.inc}
{$POINTERMATH ON}
{$PACKENUM 1}

uses
  MfPlayerSample.Platform,
  Interfaces,
  WinApi.ComBaseApi,
  WinApi.ActiveX.ObjBase,
  SysUtils,
  {$IFDEF FASTMM}
  FastMM4,
  {$ENDIF}

  Forms,
  frmMfPlayer in 'frmMfPlayer.pas' {frm_MfPlayer},
  MfPlayerClass in 'MfPlayerClass.pas';

{$R *.res}

var
  hrCom: LongInt;

begin
  hrCom := CoInitializeEx(nil,COINIT_APARTMENTTHREADED);
  if hrCom < 0 then
    raise Exception.CreateFmt('COM initialization failed: %.8x',[Cardinal(hrCom)]);
  try
  Application.Initialize;
  Application.MainFormOnTaskbar:= True;
  Application.Title:= 'MFPlayer I';
  Application.CreateForm(Tfrm_MfPlayer, frm_MfPlayer);
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
