// FactoryX
//
// Copyright © FactoryX, Netherlands/Australia/Germany. All rights reserved.
//
// Project: Media Foundation - MFPack - Samples
// Module: dlgFxServePassword.pas
// Kind: Pascal Unit
//
//==============================================================================
unit dlgFxServePassword;

{$I MfPack.Fpc.inc}
{$POINTERMATH ON}
{$PACKENUM 1}

interface

uses
  {System}
  Classes,
  {Vcl}
  Forms,
  Controls,
  StdCtrls;

type
  TFxServePasswordDlg = class(TForm)
    lblPrompt: TLabel;
    edtPassword: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
  end;

implementation

{$R *.lfm}

end.
