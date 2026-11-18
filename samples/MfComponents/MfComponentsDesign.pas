{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit MfComponentsDesign;

{$warn 5023 off : no warning about unused units}
interface

uses
  MfFxEditors, MfComponentsRegister, LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('MfComponentsRegister', @MfComponentsRegister.Register);
end;

initialization
  RegisterPackage('MfComponentsDesign', @Register);
end.
