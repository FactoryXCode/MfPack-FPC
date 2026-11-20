library MfPackDtsMFT;

{$I MfPack.Fpc.inc}
{$POINTERMATH ON}

uses

  {WinApi}
  Windows,
  {System}
  ComServ,
  {MediaFoundationApi}
  WinApi.MediaFoundationApi.MfApi,
  WinApi.MediaFoundationApi.MfObjects,
  {MfPackDtsMft}
  MfDtsBridgeApi in 'MfDtsBridgeApi.pas',
  MfDtsDecoderMFT in 'MfDtsDecoderMFT.pas';


function DllRegisterServer(): HRESULT; stdcall;
var
  Inputs: array[0..4] of MFT_REGISTER_TYPE_INFO;
  Output: MFT_REGISTER_TYPE_INFO;
  Name: WideString;

begin

  Result := ComServ.DllRegisterServer();
  if FAILED(Result) then
    Exit;

  Inputs[0].guidMajorType := MFMediaType_Audio;
  Inputs[0].guidSubtype   := MFAudioFormat_DTS;
  Inputs[1].guidMajorType := MFMediaType_Audio;
  Inputs[1].guidSubtype   := MFAudioFormat_DTS_RAW;
  Inputs[2].guidMajorType := MFMediaType_Audio;
  Inputs[2].guidSubtype   := MFAudioFormat_DTS_HD;
  Inputs[3].guidMajorType := MFMediaType_Audio;
  Inputs[3].guidSubtype   := MFAudioFormat_DTS_XLL;
  Inputs[4].guidMajorType := MFMediaType_Audio;
  Inputs[4].guidSubtype   := MFAudioFormat_DTS_LBR;
  Output.guidMajorType := MFMediaType_Audio;
  Output.guidSubtype := MFAudioFormat_PCM;

  Name := MFPACK_DTS_MFT_NAME;
  Result := MFTRegister(CLSID_MfPackDtsDecoderMFT,
                        MFT_CATEGORY_AUDIO_DECODER,
                        PWideChar(Name),
                        UINT32(MFT_ENUM_FLAG_SYNCMFT),
                        Length(Inputs),
                        @Inputs[0],
                        1,
                        @Output,
                        nil);

  if FAILED(Result) then
    ComServ.DllUnregisterServer();
end;


function DllUnregisterServer(): HRESULT; stdcall;
var
  a: HRESULT;
  b: HRESULT;

begin

  a := MFTUnregister(CLSID_MfPackDtsDecoderMFT);
  b := ComServ.DllUnregisterServer();

  if FAILED(a) then
    Result := a
  else
    Result := b;
end;

exports
  ComServ.DllGetClassObject name 'DllGetClassObject',
  ComServ.DllCanUnloadNow name 'DllCanUnloadNow',
  DllRegisterServer name 'DllRegisterServer',
  DllUnregisterServer name 'DllUnregisterServer';

begin
end.
