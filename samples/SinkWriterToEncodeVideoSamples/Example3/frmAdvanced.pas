unit frmAdvanced;

{$I MfPack.Fpc.inc}
{$POINTERMATH ON}

interface

uses
  MfEncodeAudio.Platform,
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, Spin;

type
  TFfrmAdvanced = class(TForm)
    cbxDisableHardwareTransforms: TCheckBox;
    cbxDisableThrottling: TCheckBox;
    Button3: TButton;
    cbxDisableGOPSize: TCheckBox;
    cbxDisableQualityBasedEncoding: TCheckBox;
    Label13: TLabel;
    spedThreadLimit: TSpinEdit;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FfrmAdvanced: TFfrmAdvanced;

implementation

{$R *.lfm}

end.
