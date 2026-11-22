// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.WinMM.VfwExt.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 17-05-2020
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: Constants and function prototypes needed to create IHV's extension DLL
//              and constants used to programatically open a target capture device.
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
// Remarks:
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
// Source: VfWExt.h
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
unit WinApi.WinMM.VfwExt;

{$I MfPack.Fpc.inc}

interface


uses
  {WinApi}
  Windows,
  CommCtrl;

  {$PACKENUM 4}

  {$IFDEF WIN32}
    {$ALIGN 1}
  {$ELSE}
  {$ALIGN 8}
  // Win64
  {$ENDIF}

const

  VFW_HIDE_SETTINGS_PAGE = $00000001;
  VFW_HIDE_VIDEOSRC_PAGE = $00000002;
  VFW_HIDE_CAMERACONTROL_PAGE = $00000004;
  VFW_HIDE_ALL_PAGES = (VFW_HIDE_SETTINGS_PAGE or
    VFW_HIDE_VIDEOSRC_PAGE or
    VFW_HIDE_CAMERACONTROL_PAGE);

  VFW_OEM_ADD_PAGE = $80000000;  // If OEM has added any page


  VFW_USE_DEVICE_HANDLE = $00000001;
  VFW_USE_STREAM_HANDLE = $00000002;
  VFW_QUERY_DEV_CHANGED = $00000100;  // if selected_dev == streaming_dev


  //
  // This is the function pointer that vfwwdm mapper calls to add an page
  //

type

  VFWWDMExtensionProc = function(pfnDeviceIoControl: Pointer;
                                 pfnAddPropertyPage: LPFNADDPROPSHEETPAGE;
                                 lParam: LPARAM): DWord; stdcall;

  //
  // This is the function pointer that you can call to make DeviceIoControl() calls.
  //

  LPFNEXTDEVIO = function(lParam: LPARAM;
                          dwFlags: DWORD;
                          dwIoControlCode: DWORD;
                          lpInBuffer: Pointer;
                          nInBufferSize: DWORD;
                          lpOutBuffer: Pointer;
                          nOutBufferSize: DWORD;
                          lpBytesReturned: PDWORD;
                          lpOverlapped: POVERLAPPED): BOOL; stdcall;


  //
  // HLM\System\CurrentControlSet\Control\MediaResources\msvideo\MSVideo.VFWWDM
  //
  // Registry values used to allow a VfW client application to programatically
  // open a target capture device.  The first is the FriendlyName of the capture
  // device; and the 2nd flag if set, vfwwdm mapper will open only; if failed,
  // no attempt will be made by VfWWDM mapper to open other WDM capture device.
  //
  // Both registry value should be clear after capDriverConnect().  VfWWDM mapper
  // will not clear them unless video source dialog box is chosen.
  //

const

  TARGET_DEVICE_FRIENDLY_NAME = 'TargetDeviceFriendlyName';  // REG_SZ
  TARGET_DEVICE_OPEN_EXCLUSIVELY = 'TargetDeviceOpenExclusively';  // REG_DWORD

  // Additional Prototypes for ALL Interfaces

  // End of Additional Prototypes

implementation

// Implement Additional functions here.

end.
