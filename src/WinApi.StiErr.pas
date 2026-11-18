// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: WinApi - Shared
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.StiErr.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 24/11/2023
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: This module contains the user mode still image APIs error and status codes.
//
// Organisation: FactoryX
// Initiator(s): Tony (maXcomX), Peter (OzShips)
// Contributor(s): Tony Kalf (maXcomX).
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
// Source: stierr.h
//
// Author:
// Copyright (c) 1986-1997  Microsoft Corporation
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
unit WinApi.StiErr;

{$I MfPack.Fpc.inc}

interface

uses
  
  {WinApi}
  Windows,
  WinApi.WinError;


//
// Error codes are constructed as compound COM status codes
//

const

//
// The operation completed successfully
//
  STI_OK                              = S_OK;
  STI_ERROR_NO_ERROR                  = STI_OK;

//
// The device exists but not currently attached to the system
//
  STI_NOTCONNECTED                    = S_FALSE;

//
// The requested change in device mode settings had no effect
//
  STI_CHANGENOEFFECT                  = S_FALSE;


//
// The application requires newer version
//
  STIERR_OLD_VERSION                  = HRESULT($8007047E);

//
// The application was written for pre-release version of provider DLL
//
  STIERR_BETA_VERSION                 = HRESULT($80070481);


//
// The requested object could not be created due to incompatible or mismatched driver
//
  STIERR_BADDRIVER                    = HRESULT($80070077);

//
// The device is not registered
//
  STIERR_DEVICENOTREG                 = REGDB_E_CLASSNOTREG;

//
// The requested container does not exist
//
  STIERR_OBJECTNOTFOUND               = HRESULT($80070002);

//
// An invalid or not state matching parameter was passed to the API
//
  STIERR_INVALID_PARAM                = E_INVALIDARG;

//
// The specified interface is not supported
//
  STIERR_NOINTERFACE                  = E_NOINTERFACE;

//
// The undetermined error occured
//
  STIERR_GENERIC                      = E_FAIL;

//
// There is not enough memory to perform requested operation
//
  STIERR_OUTOFMEMORY                  = E_OUTOFMEMORY;

//
// The application called unsupported (at this time) function
//
  STIERR_UNSUPPORTED                  = E_NOTIMPL;

//
// The application requires newer version
//
  STIERR_NOT_INITIALIZED              = HRESULT($80070015);

//
// The application requires newer version
//
  STIERR_ALREADY_INITIALIZED          = HRESULT($800704DF);

//
// The operation can not performed while device is locked
//
  STIERR_DEVICE_LOCKED                = HRESULT($80070021);

//
// The specified propery can not be changed for this device
//
  STIERR_READONLY                     = E_ACCESSDENIED;

//
// The device already has notification handle associated with it
//
  STIERR_NOTINITIALIZED               = E_ACCESSDENIED;


//
// The device needs to be locked before attempting this operation
//
  STIERR_NEEDS_LOCK                   = HRESULT($8007009E);

//
// The device is opened by another application in data mode
//
  STIERR_SHARING_VIOLATION            = HRESULT($80070020);

//
// Handle already set for this context
//
  STIERR_HANDLEEXISTS                 = HRESULT($800700B7);

//
// Device name is not recognized
//
  STIERR_INVALID_DEVICE_NAME          = HRESULT($8007007B);

//
// Device hardware type is not valid
//
  STIERR_INVALID_HW_TYPE              = HRESULT($8007000D);

//
// No events available
//
  STIERR_NOEVENTS                     = HRESULT($80070103);

//
// Device appears as not ready
//
  STIERR_DEVICE_NOTREADY              = HRESULT($80070015);


implementation


end.
