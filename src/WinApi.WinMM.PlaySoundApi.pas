// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.WinMM.PlaySoundApi.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 17-09-2020
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: ApiSet Contract for api-ms-win-mm-playsound-l1-1-0
//
// Organisation: FactoryX
// Initiator(s): Tony (maXcomX), Peter (OzShips)
// Contributor(s): Tony Kalf (maXcomX)
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
// Source: playsoundapi.h
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
unit WinApi.WinMM.PlaySoundApi;

{$I MfPack.Fpc.inc}

interface

  (*$HPPEMIT '#include <playsoundapi.h>' *)

uses
  {WinApi}
  Windows,
  WinApi.WinApiTypes;

  {$PACKENUM 4}

  {$IFDEF WIN32}
    {$ALIGN 1}
  {$ELSE}
    {$ALIGN 8} // Win64
  {$ENDIF}


   {***************************************************************************

                            Sound support

    ***************************************************************************}


  function sndPlaySound({_In_opt_} pszSound: LPCWSTR;
                         fuSound: UINT): BOOL; stdcall;

  function sndPlaySoundA({_In_opt_} pszSound: LPCSTR;
                         fuSound: UINT): BOOL; stdcall;

  { UniCode }
  function sndPlaySoundW({_In_opt_} pszSound: LPCWSTR;
                         fuSound: UINT): BOOL; stdcall;


  {
   *  flag values for fuSound and fdwSound arguments on [snd]PlaySound
  }

const

  SND_SYNC                            = $0000 { play synchronously (default)};
  SND_ASYNC                           = $0001 { play asynchronously };
  SND_NODEFAULT                       = $0002 { silence (! default)if sound not found };
  SND_MEMORY                          = $0004 { pszSound points to a memory file };
  SND_LOOP                            = $0008 { loop the sound until next sndPlaySound };
  SND_NOSTOP                          = $0010 { don ' t stop any currently playing sound };

  SND_NOWAIT                          = $00002000 { don ' t wait if the driver is busy };
  SND_ALIAS                           = $00010000 { name is a registry alias };
  SND_ALIAS_ID                        = $00110000 { alias is a predefined ID };
  SND_FILENAME                        = $00020000 { name is file name };
  SND_RESOURCE                        = $00040004 { name is resource name or atom };

  SND_PURGE                           = $0040 { purge non - static events for task };
  SND_APPLICATION                     = $0080 { look for application specific association };

  SND_SENTRY                          = $00080000 { Generate a SoundSentry event with this sound };
  SND_RING                            = $00100000 { Treat this as a 'ring' from a communications app - don ' t duck me };
  SND_SYSTEM                          = $00200000 { Treat this as a system sound };

  SND_ALIAS_START                     = 0 { alias base };

  function sndAlias(ch0: Char; ch1: Char): DWord; inline;

  // This needs a work-around, because we can't use (macro) sndAlias
  // example: SND_ALIAS_START + (DWORD(Ord('S')) or (DWORD(Ord('*')) shl 8))
  //
const
  SND_ALIAS_SYSTEMASTERISK            = SND_ALIAS_START + (DWORD(Ord('S')) or (DWORD(Ord('*')) shl 8)); // sndAlias('S', '*')
  SND_ALIAS_SYSTEMQUESTION            = SND_ALIAS_START + (DWORD(Ord('S')) or (DWORD(Ord('?')) shl 8)); // sndAlias('S', '?')
  SND_ALIAS_SYSTEMHAND                = SND_ALIAS_START + (DWORD(Ord('S')) or (DWORD(Ord('H')) shl 8)); // sndAlias('S', 'H')
  SND_ALIAS_SYSTEMEXIT                = SND_ALIAS_START + (DWORD(Ord('S')) or (DWORD(Ord('E')) shl 8)); // sndAlias('S', 'E')
  SND_ALIAS_SYSTEMSTART               = SND_ALIAS_START + (DWORD(Ord('S')) or (DWORD(Ord('S')) shl 8)); // sndAlias('S', 'S')
  SND_ALIAS_SYSTEMWELCOME             = SND_ALIAS_START + (DWORD(Ord('S')) or (DWORD(Ord('W')) shl 8)); // sndAlias('S', 'W')
  SND_ALIAS_SYSTEMEXCLAMATION         = SND_ALIAS_START + (DWORD(Ord('S')) or (DWORD(Ord('!')) shl 8)); // sndAlias('S', '!')
  SND_ALIAS_SYSTEMDEFAULT             = SND_ALIAS_START + (DWORD(Ord('S')) or (DWORD(Ord('D')) shl 8)); // sndAlias('S', 'D')


  // use unicode by default
  function PlaySound({_In_opt_} pszSound: LPCWSTR;
                     {_In_opt_} hmod: HMODULE;
                     fdwSound: DWORD): BOOL; stdcall;

  function PlaySoundA({_In_opt_} pszSound: LPCSTR;
                      {_In_opt_} hmod: HMODULE;
                      fdwSound: DWORD): BOOL; stdcall;

  { UniCode }
  function PlaySoundW({_In_opt_} pszSound: LPCWSTR;
                      {_In_opt_} hmod: HMODULE;
                      fdwSound: DWORD): BOOL; stdcall;


  // Additional Prototypes for ALL interfaces


  // end of Additional Prototypes

implementation

const
  PlaySoundApiLib = 'Winmm.dll';


function sndAlias(ch0: Char;
                  ch1: Char): DWord;
begin
  Result := (SND_ALIAS_START + (DWORD(Ord(ch0)) or (DWORD(Ord(ch1)) shl 8)));
end;

function sndPlaySound; external PlaySoundApiLib name 'sndPlaySoundW';
function sndPlaySoundA; external PlaySoundApiLib name 'sndPlaySoundA';
function sndPlaySoundW; external PlaySoundApiLib name 'sndPlaySoundW';
function PlaySound; external PlaySoundApiLib name 'PlaySoundW';
function PlaySoundA; external PlaySoundApiLib name 'PlaySoundA';
function PlaySoundW; external PlaySoundApiLib name 'PlaySoundW';

  // Implement Additional Prototypes here.

end.
