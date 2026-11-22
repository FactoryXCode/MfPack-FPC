// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: WinApi.DirectX - DirectX
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.DirectX.XInput.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 14-01-2018
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: This module defines Xbox 360 Common Controller APIs
//              and constants for the Windows platform.
//              Windows Vista or later.
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
// Remarks: Requires Windows Vista or later.
// 
//          Using packed records is not a recommended practice,
//          because it can prevent compatibility with other languages or
//          platforms, it slows data access, and in the case of a character array,
//          it affects type compatibility.
//          For more information, see Memory management and Implicit Packing of
//          Fields with a Common Type Specification.
//
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
// Source: XInput.h
//
// Copyright (c) Microsoft Corporation. All rights reserved.
//==============================================================================
//
// FPC port updated: 2026-11-16
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
unit WinApi.DirectX.XInput;

{$I MfPack.Fpc.inc}


interface

uses

  {WinApi}
  Windows;

  {$PACKENUM 4}

  {$IFDEF WIN32}
    {$ALIGN 1}
  {$ELSE}
  {$ALIGN 8}
  // Win64
  {$ENDIF}


const

  // Current name of the DLL shipped in the same SDK as this header.
  // The name reflects the current version

  {>= WIN8}
  XINPUT_DLL_A = 'xinput1_4.dll';
  XINPUT_DLL_W = 'xinput1_4.dll';
  {ELSE}
  //XINPUT_DLL_A                        = 'xinput9_1_0.dll';
  //XINPUT_DLL_W                        = 'xinput9_1_0.dll';
  {ENDIF}

  {$IFDEF UNICODE}
  XINPUT_DLL = XINPUT_DLL_W;
  {$ELSE}
  XINPUT_DLL = XINPUT_DLL_A;
  {$ENDIF}

  //
  // Device types available in XINPUT_CAPABILITIES
  //
  XINPUT_DEVTYPE_GAMEPAD = $01;

  //
  // Device subtypes available in XINPUT_CAPABILITIES
  //

  XINPUT_DEVSUBTYPE_GAMEPAD = $01;

  {>=WIN8}

  XINPUT_DEVSUBTYPE_UNKNOWN = $00;
  XINPUT_DEVSUBTYPE_WHEEL = $02;
  XINPUT_DEVSUBTYPE_ARCADE_STICK = $03;
  XINPUT_DEVSUBTYPE_FLIGHT_STICK = $04;
  XINPUT_DEVSUBTYPE_DANCE_PAD = $05;
  XINPUT_DEVSUBTYPE_GUITAR = $06;
  XINPUT_DEVSUBTYPE_GUITAR_ALTERNATE = $07;
  XINPUT_DEVSUBTYPE_DRUM_KIT = $08;
  XINPUT_DEVSUBTYPE_GUITAR_BASS = $0B;
  XINPUT_DEVSUBTYPE_ARCADE_PAD = $13;

  {ENDIF}//(_WIN32_WINNT >= _WIN32_WINNT_WIN8)

  //
  // Flags for XINPUT_CAPABILITIES
  //

  XINPUT_CAPS_VOICE_SUPPORTED = $0004;

  {>= _WIN32_WINNT_WIN8}
  XINPUT_CAPS_FFB_SUPPORTED = $0001;
  XINPUT_CAPS_WIRELESS = $0002;
  XINPUT_CAPS_PMD_SUPPORTED = $0008;
  XINPUT_CAPS_NO_NAVIGATION = $0010;
  {ENDIF}//(_WIN32_WINNT >= _WIN32_WINNT_WIN8)

  //
  // Constants for gamepad buttons
  //
  XINPUT_GAMEPAD_DPAD_UP = $0001;
  XINPUT_GAMEPAD_DPAD_DOWN = $0002;
  XINPUT_GAMEPAD_DPAD_LEFT = $0004;
  XINPUT_GAMEPAD_DPAD_RIGHT = $0008;
  XINPUT_GAMEPAD_START = $0010;
  XINPUT_GAMEPAD_BACK = $0020;
  XINPUT_GAMEPAD_LEFT_THUMB = $0040;
  XINPUT_GAMEPAD_RIGHT_THUMB = $0080;
  XINPUT_GAMEPAD_LEFT_SHOULDER = $0100;
  XINPUT_GAMEPAD_RIGHT_SHOULDER = $0200;
  XINPUT_GAMEPAD_A = $1000;
  XINPUT_GAMEPAD_B = $2000;
  XINPUT_GAMEPAD_X = $4000;
  XINPUT_GAMEPAD_Y = $8000;


  //
  // Gamepad thresholds
  //
  XINPUT_GAMEPAD_LEFT_THUMB_DEADZONE = 7849;
  XINPUT_GAMEPAD_RIGHT_THUMB_DEADZONE = 8689;
  XINPUT_GAMEPAD_TRIGGER_THRESHOLD = 30;

  //
  // Flags to pass to XInputGetCapabilities
  //
  XINPUT_FLAG_GAMEPAD = $00000001;

  {>= WIN8}

  //
  // Devices that support batteries
  //
  BATTERY_DEVTYPE_GAMEPAD = $00;
  BATTERY_DEVTYPE_HEADSET = $01;

  //
  // Flags for battery status level
  //
  BATTERY_TYPE_DISCONNECTED = $00;  // This device is not connected
  BATTERY_TYPE_WIRED = $01;  // Wired device, no battery
  BATTERY_TYPE_ALKALINE = $02;  // Alkaline battery source
  BATTERY_TYPE_NIMH = $03;  // Nickel Metal Hydride battery source
  BATTERY_TYPE_UNKNOWN = $FF;  // Cannot determine the battery type

  // These are only valid for wireless, connected devices, with known battery types
  // The amount of use time remaining depends on the type of device.
  BATTERY_LEVEL_EMPTY = $00;
  BATTERY_LEVEL_LOW = $01;
  BATTERY_LEVEL_MEDIUM = $02;
  BATTERY_LEVEL_FULL = $03;

  {ENDIF}//(_WIN32_WINNT >= _WIN32_WINNT_WIN8)

  // User index definitions
  XUSER_MAX_COUNT = 4;

  XUSER_INDEX_ANY = $000000FF;

  {>= WIN8}

  //
  // Codes returned for the gamepad keystroke
  //

  VK_PAD_A = $5800;
  VK_PAD_B = $5801;
  VK_PAD_X = $5802;
  VK_PAD_Y = $5803;
  VK_PAD_RSHOULDER = $5804;
  VK_PAD_LSHOULDER = $5805;
  VK_PAD_LTRIGGER = $5806;
  VK_PAD_RTRIGGER = $5807;

  VK_PAD_DPAD_UP = $5810;
  VK_PAD_DPAD_DOWN = $5811;
  VK_PAD_DPAD_LEFT = $5812;
  VK_PAD_DPAD_RIGHT = $5813;
  VK_PAD_START = $5814;
  VK_PAD_BACK = $5815;
  VK_PAD_LTHUMB_PRESS = $5816;
  VK_PAD_RTHUMB_PRESS = $5817;

  VK_PAD_LTHUMB_UP = $5820;
  VK_PAD_LTHUMB_DOWN = $5821;
  VK_PAD_LTHUMB_RIGHT = $5822;
  VK_PAD_LTHUMB_LEFT = $5823;
  VK_PAD_LTHUMB_UPLEFT = $5824;
  VK_PAD_LTHUMB_UPRIGHT = $5825;
  VK_PAD_LTHUMB_DOWNRIGHT = $5826;
  VK_PAD_LTHUMB_DOWNLEFT = $5827;

  VK_PAD_RTHUMB_UP = $5830;
  VK_PAD_RTHUMB_DOWN = $5831;
  VK_PAD_RTHUMB_RIGHT = $5832;
  VK_PAD_RTHUMB_LEFT = $5833;
  VK_PAD_RTHUMB_UPLEFT = $5834;
  VK_PAD_RTHUMB_UPRIGHT = $5835;
  VK_PAD_RTHUMB_DOWNRIGHT = $5836;
  VK_PAD_RTHUMB_DOWNLEFT = $5837;

  //
  // Flags used in XINPUT_KEYSTROKE
  //
  XINPUT_KEYSTROKE_KEYDOWN = $0001;
  XINPUT_KEYSTROKE_KEYUP = $0002;
  XINPUT_KEYSTROKE_REPEAT = $0004;

  {ENDIF}//(_WIN32_WINNT >= _WIN32_WINNT_WIN8)



type

  //
  // Structures used by XInput APIs
  //

  PXINPUT_GAMEPAD = ^_XINPUT_GAMEPAD;

  _XINPUT_GAMEPAD = record
    wButtons: WORD;
    bLeftTrigger: Byte;
    bRightTrigger: Byte;
    sThumbLX: SHORT;
    sThumbLY: SHORT;
    sThumbRX: SHORT;
    sThumbRY: SHORT;
  end;
  XINPUT_GAMEPAD = _XINPUT_GAMEPAD;


  PXINPUT_STATE = ^_XINPUT_STATE;

  _XINPUT_STATE = record
    dwPacketNumber: DWORD;
    Gamepad: XINPUT_GAMEPAD;
  end;
  XINPUT_STATE = _XINPUT_STATE;


  PXINPUT_VIBRATION = ^_XINPUT_VIBRATION;

  _XINPUT_VIBRATION = record
    wLeftMotorSpeed: WORD;
    wRightMotorSpeed: WORD;
  end;
  XINPUT_VIBRATION = _XINPUT_VIBRATION;


  PXINPUT_CAPABILITIES = ^_XINPUT_CAPABILITIES;

  _XINPUT_CAPABILITIES = record
    _Type: Byte;
    SubType: Byte;
    Flags: WORD;
    Gamepad: XINPUT_GAMEPAD;
    Vibration: XINPUT_VIBRATION;
  end;
  XINPUT_CAPABILITIES = _XINPUT_CAPABILITIES;


  {>= WIN8}

  PXINPUT_BATTERY_INFORMATION = ^_XINPUT_BATTERY_INFORMATION;

  _XINPUT_BATTERY_INFORMATION = record
    BatteryType: Byte;
    BatteryLevel: Byte;
  end;
  XINPUT_BATTERY_INFORMATION = _XINPUT_BATTERY_INFORMATION;


  PXINPUT_KEYSTROKE = ^_XINPUT_KEYSTROKE;

  _XINPUT_KEYSTROKE = record
    VirtualKey: WORD;
    Unicode: WideChar;
    Flags: WORD;
    UserIndex: Byte;
    HidCode: Byte;
  end;
  XINPUT_KEYSTROKE = _XINPUT_KEYSTROKE;

{ENDIF}//(_WIN32_WINNT >= _WIN32_WINNT_WIN8)


  //
  // XInput APIs
  //


function XInputGetState(dwUserIndex: DWORD;  // Index of the gamer associated with the device
  pState: PXINPUT_STATE): DWORD; stdcall;

function XInputSetState(dwUserIndex: DWORD;  // Index of the gamer associated with the device
  pVibration: PXINPUT_VIBRATION): DWORD; stdcall; // The vibration information to send to the controller

function XInputGetCapabilities(dwUserIndex: DWORD;  // Index of the gamer associated with the device
  dwFlags: DWORD;      // Input flags that identify the device type
  pCapabilities: PXINPUT_CAPABILITIES): DWORD; stdcall; // Receives the capabilities


// Sets the reporting state of XInput.
// #if(_WIN32_WINNT >= _WIN32_WINNT_WIN8)
//procedure XInputEnable({in} enable: BOOL); stdcall;
//#if(_WIN32_WINNT >= _WIN32_WINNT_WIN10)
procedure XInputEnable({in} enable: BOOL); stdcall; deprecated 'Deprecated by the Windows 10 SDK';
//#endif

{ENDIF}

function XInputGetAudioDeviceIds(dwUserIndex: DWORD;               // Index of the gamer associated with the device
  pRenderDeviceId: PWideChar;   // Windows Core Audio device ID string for render (speakers)
  pRenderCount: PUINT;           // Size of render device ID string buffer (in wide-chars)
  pCaptureDeviceId: PWideChar;  // Windows Core Audio device ID string for capture (microphone)
  pCaptureCount: PUINT): DWORD; stdcall;  // Size of capture device ID string buffer (in wide-chars)



function XInputGetBatteryInformation(dwUserIndex: DWORD;           // Index of the gamer associated with the device
  devType: Byte;                // Which device on this user index
  pBatteryInformation: PXINPUT_BATTERY_INFORMATION): DWORD; stdcall; // Contains the level and types of batteries


function XInputGetKeystroke(dwUserIndex: DWORD;           // Index of the gamer associated with the device
  dwReserved: DWORD;            // Reserved for future use
  pKeystroke: PXINPUT_KEYSTROKE): DWORD; stdcall; // Pointer to an XINPUT_KEYSTROKE structure that receives an input event.



{ENDIF}//(_WIN32_WINNT >= _WIN32_WINNT_WIN8)


{>= WIN8}

function XInputGetDSoundAudioDeviceGuids(dwUserIndex: DWORD;            // Index of the gamer associated with the device
  out pDSoundRenderGuid: TGUID;  // DSound device ID for render (speakers)
  out pDSoundCaptureGuid: TGUID): DWORD; stdcall;  // DSound device ID for capture (microphone)

{ENDIF}//(_WIN32_WINNT < _WIN32_WINNT_WIN8)


// Additional Prototypes for ALL interfaces

// End of Additional Prototypes

implementation



function XInputGetState; external XINPUT_DLL name 'XInputGetState';
function XInputSetState; external XINPUT_DLL name 'XInputSetState';
function XInputGetCapabilities; external XINPUT_DLL name 'XInputGetCapabilities';
procedure XInputEnable; external XINPUT_DLL name 'XInputEnable';
function XInputGetAudioDeviceIds; external XINPUT_DLL name 'XInputGetAudioDeviceIds';
function XInputGetBatteryInformation; external XINPUT_DLL name 'XInputGetBatteryInformation';
function XInputGetKeystroke; external XINPUT_DLL name 'XInputGetKeystroke';
// This legacy API is absent from XInput 1.4. Keep the compatibility entry point
// without a mandatory import of an unavailable export.
function XInputGetDSoundAudioDeviceGuids(dwUserIndex: DWORD;
                                         out pDSoundRenderGuid: TGUID;
                                         out pDSoundCaptureGuid: TGUID): DWORD;
type
  TGetDSoundAudioDeviceGuids = function(dwUserIndex: DWORD;
                                        out pRenderGuid: TGUID;
                                        out pCaptureGuid: TGUID): DWORD; stdcall;
var
  Module: HMODULE;
  GetGuids: TGetDSoundAudioDeviceGuids;

begin

  Module := GetModuleHandleW(PWideChar(XINPUT_DLL_W));
  GetGuids := nil;
  if (Module <> 0) then
    GetGuids := TGetDSoundAudioDeviceGuids(GetProcAddress(Module,
                                                          'XInputGetDSoundAudioDeviceGuids'));
  if Assigned(GetGuids) then
    Result := GetGuids(dwUserIndex,
                       pDSoundRenderGuid,
                       pDSoundCaptureGuid)
  else
    Result := ERROR_PROC_NOT_FOUND;
end;


// Implement Additional functions here.

end.
