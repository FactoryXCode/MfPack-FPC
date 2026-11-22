// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.WinMM.TimeApi.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 17-09-2020
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: ApiSet Contract for api-ms-win-mm-time-l1-1-0
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
// Source: timeapi.h
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
unit WinApi.WinMM.TimeApi;

{$I MfPack.Fpc.inc}


interface

uses
  {WinApi}
  Windows,
  {WinMM}
  WinApi.WinMM.MMSysCom;

  {$PACKENUM 4}

  {$IFDEF WIN32}
    {$ALIGN 1}
  {$ELSE}
  {$ALIGN 8}
  // Win64
  {$ENDIF}

  //****************************************************************************
  //
  //                          Timer support
  //
  //****************************************************************************

  { timer error return values }

const

  TIMERR_NOERROR = (0);  { no error }
  TIMERR_NOCANDO = (TIMERR_BASE + 1);  { request not completed }
  TIMERR_STRUCT = (TIMERR_BASE + 33);  { time struct size }

  { timer device capabilities data structure }

type

  PTIMECAPS = ^timecaps_tag;

  timecaps_tag = record
    wPeriodMin: UINT;               { minimum period supported  }
    wPeriodMax: UINT;               { maximum period supported  }
  end;
  TIMECAPS = timecaps_tag;
  NPTIMECAPS = ^timecaps_tag;
  LPTIMECAPS = ^timecaps_tag;

  { timer function prototypes }

function timeGetSystemTime(pmmt: LPMMTIME;
                           cbmmt: UINT): MMRESULT; stdcall;

function timeGetTime(): DWORD; stdcall;

function timeGetDevCaps(ptc: LPTIMECAPS;
                        cbtc: UINT): MMRESULT; stdcall;

function timeBeginPeriod(uPeriod: UINT): MMRESULT; stdcall;

function timeEndPeriod(uPeriod: UINT): MMRESULT; stdcall;


// Additional Prototypes for ALL interfaces

// End of Additional Prototypes


implementation

const
  TimerApiLib = 'winmm.dll';

function timeGetSystemTime; external TimerApiLib name 'timeGetSystemTime';
function timeGetTime; external TimerApiLib name 'timeGetTime';
function timeGetDevCaps; external TimerApiLib name 'timeGetDevCaps';
function timeBeginPeriod; external TimerApiLib name 'timeBeginPeriod';
function timeEndPeriod; external TimerApiLib name 'timeEndPeriod';

// Implement Additional Prototypes here.

end.
