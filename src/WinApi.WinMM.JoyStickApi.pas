// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.WinMM.JoyStickApi.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 17-05-2020
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: ApiSet Contract for api-ms-win-mm-joystick-l1-1-0
//              Part of Windows Multimedia
//              See: https://docs.microsoft.com/en-us/windows/win32/api/_multimedia/
//
// Organisation: FactoryX
// Initiator(s): Tony (maXcomX), Peter (OzShips)
// Contributor(s): Tony Kalf (maXcomX), Peter Larson (ozships)
//
//------------------------------------------------------------------------------
// CHANGE LOG
// Date       Person              Reason
// ---------- ------------------- ----------------------------------------------
// 15/11/2026 All                 Eels release  SDK 10.0.28000.2705 (Windows 11)
//------------------------------------------------------------------------------
//
// Remarks: -
//
// Related objects: -
// Related projects: MfPack FPC/Lazarus port
// Known Issues: -
//
// Compiler version: FPC 3.2.2 (Windows x64 port baseline)
// SDK version: 10.0.28000.2705
//
// Todo: -
//
//==============================================================================
// Source: joystickapi.h
//
// Copyright (c) Microsoft Corporation. All rights reserved.
//==============================================================================
//
// FPC port updated: 2026-11-13
// Lazarus version: 4.8
// FPC mode: DelphiUnicode; COM interfaces; UTF-8 source.
// COM headers: MfPack WinApi.ActiveX.* and WinApi.ComBaseApi.
//
//==============================================================================
// LICENSE
//
// The contents of this file are subject to the Mozilla Public License
// Version 2.0 (the "License"); you may not use this file except in
// compliance with the License. You may obtain a copy of the License at
// https://www.mozilla.org/en-US/MPL/2.0/
//
// Software distributed under the License is distributed on an "AS IS"
// basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
// License for the specific language governing rights and limitations
// under the License.
//
// Non commercial users may distribute this sourcecode provided that this
// header is included in full at the top of the file.
// Commercial users are not allowed to distribute this sourcecode as part of
// their product.
//
//==============================================================================
unit WinApi.WinMM.JoyStickApi;

{$I MfPack.Fpc.inc}


{$PACKENUM 4}

{$IFDEF WIN32}
    {$ALIGN 1}
{$ELSE}
{$ALIGN 8}
// Win64
{$ENDIF}


interface


uses
  {WinApi}
  Windows,
  {WinMM}
  WinApi.WinMM.MMSysCom;

  //****************************************************************************
  //
  //                          Joystick support
  //
  //****************************************************************************

  { joystick error return values }

const
  JOYERR_NOERROR = (0);  { no error }
  JOYERR_PARMS = (JOYERR_BASE + 5);  { bad parameters }
  JOYERR_NOCANDO = (JOYERR_BASE + 6);  { request not completed }
  JOYERR_UNPLUGGED = (JOYERR_BASE + 7);  { joystick is unplugged }

  { constants used with JOYINFO and JOYINFOEX structures and MM_JOY* messages }
  JOY_BUTTON1 = $0001;
  JOY_BUTTON2 = $0002;
  JOY_BUTTON3 = $0004;
  JOY_BUTTON4 = $0008;
  JOY_BUTTON1CHG = $0100;
  JOY_BUTTON2CHG = $0200;
  JOY_BUTTON3CHG = $0400;
  JOY_BUTTON4CHG = $0800;

  { constants used with JOYINFOEX }
  JOY_BUTTON5 = $00000010;
  JOY_BUTTON6 = $00000020;
  JOY_BUTTON7 = $00000040;
  JOY_BUTTON8 = $00000080;
  JOY_BUTTON9 = $00000100;
  JOY_BUTTON10 = $00000200;
  JOY_BUTTON11 = $00000400;
  JOY_BUTTON12 = $00000800;
  JOY_BUTTON13 = $00001000;
  JOY_BUTTON14 = $00002000;
  JOY_BUTTON15 = $00004000;
  JOY_BUTTON16 = $00008000;
  JOY_BUTTON17 = $00010000;
  JOY_BUTTON18 = $00020000;
  JOY_BUTTON19 = $00040000;
  JOY_BUTTON20 = $00080000;
  JOY_BUTTON21 = $00100000;
  JOY_BUTTON22 = $00200000;
  JOY_BUTTON23 = $00400000;
  JOY_BUTTON24 = $00800000;
  JOY_BUTTON25 = $01000000;
  JOY_BUTTON26 = $02000000;
  JOY_BUTTON27 = $04000000;
  JOY_BUTTON28 = $08000000;
  JOY_BUTTON29 = $10000000;
  JOY_BUTTON30 = $20000000;
  JOY_BUTTON31 = $40000000;
  JOY_BUTTON32 = $80000000;

  { constants used with JOYINFOEX structure }
  JOY_POVCENTERED = WORD(-1);
  JOY_POVFORWARD = 0;
  JOY_POVRIGHT = 9000;
  JOY_POVBACKWARD = 18000;
  JOY_POVLEFT = 27000;
  JOY_RETURNX = $00000001;
  JOY_RETURNY = $00000002;
  JOY_RETURNZ = $00000004;
  JOY_RETURNR = $00000008;
  JOY_RETURNU = $00000010;  { axis 5 }
  JOY_RETURNV = $00000020;  { axis 6 }
  JOY_RETURNPOV = $00000040;
  JOY_RETURNBUTTONS = $00000080;
  JOY_RETURNRAWDATA = $00000100;
  JOY_RETURNPOVCTS = $00000200;
  JOY_RETURNCENTERED = $00000400;
  JOY_USEDEADZONE = $00000800;
  JOY_RETURNALL = (JOY_RETURNX OR JOY_RETURNY OR JOY_RETURNZ OR
    JOY_RETURNR OR JOY_RETURNU OR JOY_RETURNV OR
    JOY_RETURNPOV OR JOY_RETURNBUTTONS);
  JOY_CAL_READALWAYS = $00010000;
  JOY_CAL_READXYONLY = $00020000;
  JOY_CAL_READ3 = $00040000;
  JOY_CAL_READ4 = $00080000;
  JOY_CAL_READXONLY = $00100000;
  JOY_CAL_READYONLY = $00200000;
  JOY_CAL_READ5 = $00400000;
  JOY_CAL_READ6 = $00800000;
  JOY_CAL_READZONLY = $01000000;
  JOY_CAL_READRONLY = $02000000;
  JOY_CAL_READUONLY = $04000000;
  JOY_CAL_READVONLY = $08000000;

  { joystick ID constants }
  JOYSTICKID1 = 0;
  JOYSTICKID2 = 1;

  { joystick driver capabilites }
  JOYCAPS_HASZ = $0001;
  JOYCAPS_HASR = $0002;
  JOYCAPS_HASU = $0004;
  JOYCAPS_HASV = $0008;
  JOYCAPS_HASPOV = $0010;
  JOYCAPS_POV4DIR = $0020;
  JOYCAPS_POVCTS = $0040;



  { joystick device capabilities data structure }

type

  PJOYCAPSA = ^tagJOYCAPSA;

  tagJOYCAPSA = record
    wMid: WORD;                                                   { manufacturer ID }
    wPid: WORD;                                                   { product ID }
    szPname: array[0..MAXPNAMELEN - 1] of AnsiChar;               { product name (NULL terminated string) }
    wXmin: UINT;                                                  { minimum x position value }
    wXmax: UINT;                                                  { maximum x position value }
    wYmin: UINT;                                                  { minimum y position value }
    wYmax: UINT;                                                  { maximum y position value }
    wZmin: UINT;                                                  { minimum z position value }
    wZmax: UINT;                                                  { maximum z position value }
    wNumButtons: UINT;                                            { number of buttons }
    wPeriodMin: UINT;                                             { minimum message period when captured }
    wPeriodMax: UINT;                                             { maximum message period when captured }
    wRmin: UINT;                                                  { minimum r position value }
    wRmax: UINT;                                                  { maximum r position value }
    wUmin: UINT;                                                  { minimum u (5th axis) position value }
    wUmax: UINT;                                                  { maximum u (5th axis) position value }
    wVmin: UINT;                                                  { minimum v (6th axis) position value }
    wVmax: UINT;                                                  { maximum v (6th axis) position value }
    wCaps: UINT;                                                  { joystick capabilites }
    wMaxAxes: UINT;                                               { maximum number of axes supported }
    wNumAxes: UINT;                                               { number of axes in use }
    wMaxButtons: UINT;                                            { maximum number of buttons supported }
    szRegKey: array[0..MAXPNAMELEN - 1] of AnsiChar;              { registry key }
    szOEMVxD: array[0..MAX_JOYSTICKOEMVXDNAME - 1] of AnsiChar;  { OEM VxD in use }
  end;
  JOYCAPSA = tagJOYCAPSA;
  NPJOYCAPSA = ^tagJOYCAPSA;
  LPJOYCAPSA = ^tagJOYCAPSA;

  PJOYCAPSW = ^tagJOYCAPSW;

  tagJOYCAPSW = record
    wMid: WORD;                                                   { manufacturer ID }
    wPid: WORD;                                                   { product ID }
    szPname: array[0..MAXPNAMELEN - 1] of WideChar;               { product name (NULL terminated string) }
    wXmin: UINT;                                                  { minimum x position value }
    wXmax: UINT;                                                  { maximum x position value }
    wYmin: UINT;                                                  { minimum y position value }
    wYmax: UINT;                                                  { maximum y position value }
    wZmin: UINT;                                                  { minimum z position value }
    wZmax: UINT;                                                  { maximum z position value }
    wNumButtons: UINT;                                            { number of buttons }
    wPeriodMin: UINT;                                             { minimum message period when captured }
    wPeriodMax: UINT;                                             { maximum message period when captured }
    wRmin: UINT;                                                  { minimum r position value }
    wRmax: UINT;                                                  { maximum r position value }
    wUmin: UINT;                                                  { minimum u (5th axis) position value }
    wUmax: UINT;                                                  { maximum u (5th axis) position value }
    wVmin: UINT;                                                  { minimum v (6th axis) position value }
    wVmax: UINT;                                                  { maximum v (6th axis) position value }
    wCaps: UINT;                                                  { joystick capabilites }
    wMaxAxes: UINT;                                               { maximum number of axes supported }
    wNumAxes: UINT;                                               { number of axes in use }
    wMaxButtons: UINT;                                            { maximum number of buttons supported }
    szRegKey: array[0..MAXPNAMELEN - 1] of WideChar;              { registry key }
    szOEMVxD: array[0..MAX_JOYSTICKOEMVXDNAME - 1] of WideChar;  { OEM VxD in use }
  end;
  JOYCAPSW = tagJOYCAPSW;
  NPJOYCAPSW = ^tagJOYCAPSW;
  LPJOYCAPSW = ^tagJOYCAPSW;

  { Delphi }
  JOYCAPS = tagJOYCAPSW;
  PJOYCAPS = ^tagJOYCAPSW;
  NPJOYCAPS = ^tagJOYCAPSW;
  LPJOYCAPS = ^tagJOYCAPSW;


  PJOYCAPS2A = ^tagJOYCAPS2A;

  tagJOYCAPS2A = record
    wMid: WORD;                                                   { manufacturer ID }
    wPid: WORD;                                                   { product ID }
    szPname: array[0..MAXPNAMELEN - 1] of AnsiChar;               { product name (NULL terminated string) }
    wXmin: UINT;                                                  { minimum x position value }
    wXmax: UINT;                                                  { maximum x position value }
    wYmin: UINT;                                                  { minimum y position value }
    wYmax: UINT;                                                  { maximum y position value }
    wZmin: UINT;                                                  { minimum z position value }
    wZmax: UINT;                                                  { maximum z position value }
    wNumButtons: UINT;                                            { number of buttons }
    wPeriodMin: UINT;                                             { minimum message period when captured }
    wPeriodMax: UINT;                                             { maximum message period when captured }
    wRmin: UINT;                                                  { minimum r position value }
    wRmax: UINT;                                                  { maximum r position value }
    wUmin: UINT;                                                  { minimum u (5th axis) position value }
    wUmax: UINT;                                                  { maximum u (5th axis) position value }
    wVmin: UINT;                                                  { minimum v (6th axis) position value }
    wVmax: UINT;                                                  { maximum v (6th axis) position value }
    wCaps: UINT;                                                  { joystick capabilites }
    wMaxAxes: UINT;                                               { maximum number of axes supported }
    wNumAxes: UINT;                                               { number of axes in use }
    wMaxButtons: UINT;                                            { maximum number of buttons supported }
    szRegKey: array[0..MAXPNAMELEN - 1] of AnsiChar;              { registry key }
    szOEMVxD: array[0..MAX_JOYSTICKOEMVXDNAME - 1] of AnsiChar;   { OEM VxD in use }
    ManufacturerGuid: TGUID;                                      { for extensible MID mapping }
    ProductGuid: TGUID;                                           { for extensible PID mapping }
    NameGuid: TGUID;                                             { for name lookup in registry }
  end;
  JOYCAPS2A = tagJOYCAPS2A;
  NPJOYCAPS2A = ^tagJOYCAPS2A;
  LPJOYCAPS2A = ^tagJOYCAPS2A;

  PJOYCAPS2W = ^tagJOYCAPS2W;

  tagJOYCAPS2W = record
    wMid: WORD;                                                   { manufacturer ID }
    wPid: WORD;                                                   { product ID }
    szPname: array[0..MAXPNAMELEN - 1] of WideChar;               { product name (NULL terminated string) }
    wXmin: UINT;                                                  { minimum x position value }
    wXmax: UINT;                                                  { maximum x position value }
    wYmin: UINT;                                                  { minimum y position value }
    wYmax: UINT;                                                  { maximum y position value }
    wZmin: UINT;                                                  { minimum z position value }
    wZmax: UINT;                                                  { maximum z position value }
    wNumButtons: UINT;                                            { number of buttons }
    wPeriodMin: UINT;                                             { minimum message period when captured }
    wPeriodMax: UINT;                                             { maximum message period when captured }
    wRmin: UINT;                                                  { minimum r position value }
    wRmax: UINT;                                                  { maximum r position value }
    wUmin: UINT;                                                  { minimum u (5th axis) position value }
    wUmax: UINT;                                                  { maximum u (5th axis) position value }
    wVmin: UINT;                                                  { minimum v (6th axis) position value }
    wVmax: UINT;                                                  { maximum v (6th axis) position value }
    wCaps: UINT;                                                  { joystick capabilites }
    wMaxAxes: UINT;                                               { maximum number of axes supported }
    wNumAxes: UINT;                                               { number of axes in use }
    wMaxButtons: UINT;                                            { maximum number of buttons supported }
    szRegKey: array[0..MAXPNAMELEN - 1] of WideChar;              { registry key }
    szOEMVxD: array[0..MAX_JOYSTICKOEMVXDNAME - 1] of WideChar;   { OEM VxD in use }
    ManufacturerGuid: TGUID;                                      { for extensible MID mapping }
    ProductGuid: TGUID;                                           { for extensible PID mapping }
    NameGuid: TGUID;                                             { for name lookup in registry }
  end;
  JOYCAPS2W = tagJOYCAPS2W;
  NPJOYCAPS2W = ^tagJOYCAPS2W;
  LPJOYCAPS2W = ^tagJOYCAPS2W;

  { Delphi }
  JOYCAPS2 = tagJOYCAPS2W;
  PJOYCAPS2 = ^tagJOYCAPS2W;
  NPJOYCAPS2 = ^tagJOYCAPS2W;
  LPJOYCAPS2 = ^tagJOYCAPS2W;


  { joystick information data structure }

  PJOYINFO = ^joyinfo_tag;

  joyinfo_tag = record
    wXpos: UINT;                     { x position }
    wYpos: UINT;                     { y position }
    wZpos: UINT;                     { z position }
    wButtons: UINT;                 { button states }
  end;
  JOYINFO = joyinfo_tag;
  NPJOYINFO = ^joyinfo_tag;
  LPJOYINFO = ^joyinfo_tag;


  PJOYINFOEX = ^joyinfoex_tag;

  joyinfoex_tag = record
    dwSize: DWORD;                   { size of structure }
    dwFlags: DWORD;                  { flags to indicate what to return }
    dwXpos: DWORD;                   { x position }
    dwYpos: DWORD;                   { y position }
    dwZpos: DWORD;                   { z position }
    dwRpos: DWORD;                   { rudder/4th axis position }
    dwUpos: DWORD;                   { 5th axis position }
    dwVpos: DWORD;                   { 6th axis position }
    dwButtons: DWORD;                { button states }
    dwButtonNumber: DWORD;           { current button number pressed }
    dwPOV: DWORD;                    { point of view state }
    dwReserved1: DWORD;              { reserved for communication between winmm  driver }
    dwReserved2: DWORD;             { reserved for future expansion }
  end;
  JOYINFOEX = joyinfoex_tag;
  NPJOYINFOEX = ^joyinfoex_tag;
  LPJOYINFOEX = ^joyinfoex_tag;


  { joystick function prototypes }

function joyGetPosEx(uJoyID: UINT;
                     pji: LPJOYINFOEX): MMRESULT; stdcall;

function joyGetNumDevs(): UINT; stdcall;

function joyGetDevCapsA(uJoyID: UINT_PTR;
                        pjc: LPJOYCAPSA;
                        cbjc: UINT): MMRESULT; stdcall;

function joyGetDevCapsW(uJoyID: UINT_PTR;
                        pjc: LPJOYCAPSW;
                        cbjc: UINT): MMRESULT; stdcall;
{ Delphi }
function joyGetDevCaps(uJoyID: UINT_PTR;
                       pjc: LPJOYCAPSW;
                       cbjc: UINT): MMRESULT; stdcall;

function joyGetPos(uJoyID: UINT;
                   pji: LPJOYINFO): MMRESULT; stdcall;

function joyGetThreshold(uJoyID: UINT;
                         puThreshold: PUINT): MMRESULT; stdcall;

function joyReleaseCapture(uJoyID: UINT): MMRESULT; stdcall;

function joySetCapture(hwnd: HWND;
                       uJoyID: UINT;
                       uPeriod: UINT;
                       fChanged: BOOL): MMRESULT; stdcall;

function joySetThreshold(uJoyID: UINT;
                         uThreshold: UINT): MMRESULT; stdcall;

function joyConfigChanged(dwFlags: DWORD): MMRESULT; stdcall;


// Additional Prototypes for ALL interfaces

// End of Additional Prototypes

implementation

const
  JoyStickApiLib = 'winmm.dll';


function joyGetPosEx; external JoyStickApiLib name 'joyGetPosEx';
function joyGetNumDevs; external JoyStickApiLib name 'joyGetNumDevs';

function joyGetDevCapsA; external JoyStickApiLib name 'joyGetDevCapsA';
function joyGetDevCapsW; external JoyStickApiLib name 'joyGetDevCapsW';
function joyGetDevCaps; external JoyStickApiLib name 'joyGetDevCapsW';

function joyGetPos; external JoyStickApiLib name 'joyGetPos';
function joyGetThreshold; external JoyStickApiLib name 'joyGetThreshold';
function joyReleaseCapture; external JoyStickApiLib name 'joyReleaseCapture';
function joySetCapture; external JoyStickApiLib name 'joySetCapture';
function joySetThreshold; external JoyStickApiLib name 'joySetThreshold';
function joyConfigChanged; external JoyStickApiLib name 'joyConfigChanged';

// Implement Additional Prototypes here.

end.
