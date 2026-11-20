unit MfEncodeAudio.Wic;

{$I MfPack.Fpc.inc}

interface

uses SysUtils,Windows,WinApi.WinApiTypes,WinApi.ComBaseApi,WinApi.ActiveX.ObjBase,WinApi.WIC.WinCodec;

type
  TWICImage = class
  private
    FHandle: IWICBitmapSource;
    FDecoder: IWICBitmapDecoder;
    FWidth,FHeight: UINT;
  public
    procedure LoadFromFile(const Name: UnicodeString);
    property Handle: IWICBitmapSource read FHandle;
    property Width: UINT read FWidth;
    property Height: UINT read FHeight;
  end;

implementation

procedure Check(Value: HRESULT);
begin
  if Value < 0 then raise Exception.Create('WIC decoding failed: '+IntToHex(Cardinal(Value),8));
end;

procedure TWICImage.LoadFromFile(const Name: UnicodeString);
var
  Factory: IWICImagingFactory;
  Decoder: IWICBitmapDecoder;
  Frame: IWICBitmapFrameDecode;
begin
  Check(CoCreateInstance(CLSID_WICImagingFactory,nil,CLSCTX_INPROC_SERVER,IWICImagingFactory,Factory));
  Check(Factory.CreateDecoderFromFilename(PWideChar(Name),nil,GENERIC_READ,WICDecodeMetadataCacheOnLoad,Decoder));
  Check(Decoder.GetFrame(0,Frame));
  Check(Frame.GetSize(@FWidth,@FHeight));
  FHandle := Frame;
  FDecoder := Decoder;
end;

end.
