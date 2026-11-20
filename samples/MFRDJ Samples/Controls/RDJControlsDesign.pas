{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit RDJControlsDesign;

{$warn 5023 off : no warning about unused units}
interface

uses
  Rdj.ControlsRegister, LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('Rdj.ControlsRegister', @Rdj.ControlsRegister.Register);
end;

initialization
  RegisterPackage('RDJControlsDesign', @Register);
end.
