// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.WinMM.MMiscApi2.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 11-07-2012
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: ApiSet Contract for api-ms-win-mm-misc-l2-1-0
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
// Source: mmiscapi2.h
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
unit WinApi.WinMM.MMiscApi2;

{$I MfPack.Fpc.inc}


{$PACKENUM 4}

{$IFDEF WIN32}
    {$ALIGN 1}
{$ELSE}
{$ALIGN 8}
// Win64
{$ENDIF}

interface

(*$HPPEMIT '' *)
(*$HPPEMIT '#include <mmiscapi2.h>' *)
(*$HPPEMIT '' *)

uses
  {WinApi}
  WinApi.WinApiTypes,
  {WinMM}
  WinApi.WinMM.MMSysCom;

type

  LPTIMECALLBACK = ^TIMECALLBACK;
  TIMECALLBACK = procedure(uTimerID: UINT;
                           uMsg: UINT;
                           dwUser: DWORD_PTR;
                           dw1: DWORD_PTR;
                           dw2: DWORD_PTR);



  { flags for fuEvent parameter of timeSetEvent() function }

const

  TIME_ONESHOT = $0000;  { program timer for single event }
  TIME_PERIODIC = $0001;  { program for continuous periodic event }

  TIME_CALLBACK_FUNCTION = $0000;  { callback is function }
  TIME_CALLBACK_EVENT_SET = $0010;  { callback is event - use SetEvent }
  TIME_CALLBACK_EVENT_PULSE = $0020;  { callback is event - use PulseEvent }

  TIME_KILL_SYNCHRONOUS = $0100;  { This flag prevents the event from occurring }

  { after the user calls timeKillEvent() to }
  { destroy it. }


function timeSetEvent(uDelay: UINT;
                      uResolution: UINT;
                      fptc: LPTIMECALLBACK;
                      dwUser: DWORD_PTR;
                      fuEvent: UINT): MMRESULT; stdcall;


function timeKillEvent(uTimerID: UINT): MMRESULT; stdcall;


// Additional Prototypes for ALL interfaces

// End of Additional Prototypes

implementation

const
  MMiscApi2Lib = 'Winmm.dll';

function timeSetEvent; external MMiscApi2Lib name 'timeSetEvent';
function timeKillEvent; external MMiscApi2Lib name 'timeKillEvent';

// Implement Additional Prototypes here.

end.
