{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit HeosSampleControlsDesign;

{$warn 5023 off : no warning about unused units}
interface

uses
  HeosSampleControlsRegister, LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('HeosSampleControlsRegister', 
    @HeosSampleControlsRegister.Register);
end;

initialization
  RegisterPackage('HeosSampleControlsDesign', @Register);
end.
