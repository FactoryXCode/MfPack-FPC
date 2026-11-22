// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.WinMM.MMeApi.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 17-05-2020
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: ApiSet Contract for api-ms-win-mm-mme-l1-1-0
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
// 24/10/2026 Carmen              Corrected allignments.
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
// Source: mmeapi.h
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
unit WinApi.WinMM.MMeApi;

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
(*$HPPEMIT '#include <mmeapi.h>' *)
(*$HPPEMIT '' *)

uses
  {WinApi}
  Windows,
  {WinMM}
  WinApi.WinMM.MMSysCom;


  //****************************************************************************
  //
  //                       Waveform audio support
  //
  //****************************************************************************

  { waveform audio error return values }

const

  WAVERR_BADFORMAT = (WAVERR_BASE + 0);  { unsupported wave format }
  WAVERR_STILLPLAYING = (WAVERR_BASE + 1);  { still something playing }
  WAVERR_UNPREPARED = (WAVERR_BASE + 2);  { header not prepared }
  WAVERR_SYNC = (WAVERR_BASE + 3);  { device is synchronous }
  WAVERR_LASTERROR = (WAVERR_BASE + 3);  { last error in range }

  { waveform audio data types }

type

  PHWAVE = ^HWAVE;
  HWAVE = IntPtr;

  PHWAVEIN = ^HWAVEIN;
  HWAVEIN = IntPtr;
  LPHWAVEIN = ^HWAVEIN;

  PHWAVEOUT = ^HWAVEOUT;
  HWAVEOUT = IntPtr;
  LPHWAVEOUT = ^HWAVEOUT;

  PWAVECALLBACK = ^WAVECALLBACK;
  WAVECALLBACK = DRVCALLBACK;
  LPWAVECALLBACK = ^WAVECALLBACK;


  { wave callback messages }

const

  WOM_OPEN = MM_WOM_OPEN;
  WOM_CLOSE = MM_WOM_CLOSE;
  WOM_DONE = MM_WOM_DONE;
  WIM_OPEN = MM_WIM_OPEN;
  WIM_CLOSE = MM_WIM_CLOSE;
  WIM_DATA = MM_WIM_DATA;

  { device ID for wave device mapper }
  WAVE_MAPPER = UINT(-1);

  { flags for dwFlags parameter in waveOutOpen() and waveInOpen() }
  WAVE_FORMAT_QUERY = $0001;
  WAVE_ALLOWSYNC = $0002;

  WAVE_MAPPED = $0004;
  WAVE_FORMAT_DIRECT = $0008;
  WAVE_FORMAT_DIRECT_QUERY = (WAVE_FORMAT_QUERY or WAVE_FORMAT_DIRECT);
  WAVE_MAPPED_DEFAULT_COMMUNICATION_DEVICE = $0010;


  { wave data block header }

type


  PWAVEHDR = ^wavehdr_tag;

  wavehdr_tag = record
    lpData: PAnsiChar;              { pointer to locked data buffer }
    dwBufferLength: DWORD;          { length of data buffer }
    dwBytesRecorded: DWORD;         { used for input only }
    dwUser: DWORD_PTR;              { for client's use }
    dwFlags: DWORD;                 { assorted flags (see defines) }
    dwLoops: DWORD;                 { loop control counter }
    lpNext: PWAVEHDR;               { reserved for driver }
    reserved: DWORD_PTR;            { reserved for driver }
  end;
  WAVEHDR = wavehdr_tag;
  LPWAVEHDR = ^wavehdr_tag;


  { flags for dwFlags field of WAVEHDR }

const

  WHDR_DONE = $00000001;  { done bit }
  WHDR_PREPARED = $00000002;  { set if this header has been prepared }
  WHDR_BEGINLOOP = $00000004;  { loop start block }
  WHDR_ENDLOOP = $00000008;  { loop end block }
  WHDR_INQUEUE = $00000010;  { reserved for driver }


  { waveform output device capabilities structure }

type

  PWAVEOUTCAPSA = ^tagWAVEOUTCAPSA;

  tagWAVEOUTCAPSA = record
    wMid: WORD;                                      { manufacturer ID }
    wPid: WORD;                                      { product ID }
    vDriverVersion: MMVERSION;                       { version of the driver }
    szPname: array[0..MAXPNAMELEN - 1] of AnsiChar;  { product name (NULL terminated string) }
    dwFormats: DWORD;                                { formats supported }
    wChannels: WORD;                                 { number of sources supported }
    wReserved1: WORD;                                { packing }
    dwSupport: DWORD;                                { functionality supported by driver }
  end;
  WAVEOUTCAPSA = tagWAVEOUTCAPSA;
  NPWAVEOUTCAPSA = ^tagWAVEOUTCAPSA;
  LPWAVEOUTCAPSA = ^tagWAVEOUTCAPSA;

  { UniCode }
  PWAVEOUTCAPSW = ^tagWAVEOUTCAPSW;

  tagWAVEOUTCAPSW = record
    wMid: WORD;                                      { manufacturer ID }
    wPid: WORD;                                      { product ID }
    vDriverVersion: MMVERSION;                       { version of the driver }
    szPname: array[0..MAXPNAMELEN - 1] of WideChar;  { product name (NULL terminated string) }
    dwFormats: DWORD;                                { formats supported }
    wChannels: WORD;                                 { number of sources supported }
    wReserved1: WORD;                                { packing }
    dwSupport: DWORD;                                { functionality supported by driver }
  end;
  WAVEOUTCAPSW = tagWAVEOUTCAPSW;
  NPWAVEOUTCAPSW = ^tagWAVEOUTCAPSW;
  LPWAVEOUTCAPSW = ^tagWAVEOUTCAPSW;

  { Delphi }
  WAVEOUTCAPS = tagWAVEOUTCAPSW;
  NPWAVEOUTCAPS = ^tagWAVEOUTCAPSW;
  LPWAVEOUTCAPS = ^tagWAVEOUTCAPSW;


  PWAVEOUTCAPS2A = ^tagWAVEOUTCAPS2A;

  tagWAVEOUTCAPS2A = record
    wMid: WORD;                                      { manufacturer ID }
    wPid: WORD;                                      { product ID }
    vDriverVersion: MMVERSION;                       { version of the driver }
    szPname: array[0..MAXPNAMELEN - 1] of AnsiChar;  { product name (NULL terminated string) }
    dwFormats: DWORD;                                { formats supported }
    wChannels: WORD;                                 { number of sources supported }
    wReserved1: WORD;                                { packing }
    dwSupport: DWORD;                                { functionality supported by driver }
    ManufacturerGuid: TGUID;                         { for extensible MID mapping }
    ProductGuid: TGUID;                              { for extensible PID mapping }
    NameGuid: TGUID;                                 { for name lookup in registry }
  end;
  WAVEOUTCAPS2A = tagWAVEOUTCAPS2A;
  NPWAVEOUTCAPS2A = ^tagWAVEOUTCAPS2A;
  LPWAVEOUTCAPS2A = ^tagWAVEOUTCAPS2A;

  { UniCode }
  PWAVEOUTCAPS2W = ^tagWAVEOUTCAPS2W;

  tagWAVEOUTCAPS2W = record
    wMid: WORD;                                      { manufacturer ID }
    wPid: WORD;                                      { product ID }
    vDriverVersion: MMVERSION;                       { version of the driver }
    szPname: array[0..MAXPNAMELEN - 1] of WideChar;  { product name (NULL terminated string) }
    dwFormats: DWORD;                                { formats supported }
    wChannels: WORD;                                 { number of sources supported }
    wReserved1: WORD;                                { packing }
    dwSupport: DWORD;                                { functionality supported by driver }
    ManufacturerGuid: TGUID;                         { for extensible MID mapping }
    ProductGuid: TGUID;                              { for extensible PID mapping }
    NameGuid: TGUID;                                 { for name lookup in registry }
  end;
  WAVEOUTCAPS2W = tagWAVEOUTCAPS2W;
  NPWAVEOUTCAPS2W = ^tagWAVEOUTCAPS2W;
  LPWAVEOUTCAPS2W = ^tagWAVEOUTCAPS2W;

  { Delphi }
  WAVEOUTCAPS2 = tagWAVEOUTCAPS2W;
  PWAVEOUTCAPS2 = ^tagWAVEOUTCAPS2W;
  LPWAVEOUTCAPS2 = ^tagWAVEOUTCAPS2W;


  { flags for dwSupport field of WAVEOUTCAPS }
const

  WAVECAPS_PITCH = $0001;  { supports pitch control }
  WAVECAPS_PLAYBACKRATE = $0002;  { supports playback rate control }
  WAVECAPS_VOLUME = $0004;  { supports volume control }
  WAVECAPS_LRVOLUME = $0008;  { separate left-right volume control }
  WAVECAPS_SYNC = $0010;
  WAVECAPS_SAMPLEACCURATE = $0020;


  { waveform input device capabilities structure }

type

  PWAVEINCAPSA = ^tagWAVEINCAPSA;

  tagWAVEINCAPSA = record
    wMid: WORD;                                       { manufacturer ID }
    wPid: WORD;                                       { product ID }
    vDriverVersion: MMVERSION;                        { version of the driver }
    szPname: array[0..MAXPNAMELEN - 1] of AnsiChar;   { product name (NULL terminated string) }
    dwFormats: DWORD;                                 { formats supported }
    wChannels: WORD;                                  { number of channels supported }
    wReserved1: WORD;                                { structure packing }
  end;
  WAVEINCAPSA = tagWAVEINCAPSA;
  NPWAVEINCAPSA = ^tagWAVEINCAPSA;
  LPWAVEINCAPSA = ^tagWAVEINCAPSA;

  { UniCode }
  PWAVEINCAPSW = ^tagWAVEINCAPSW;

  tagWAVEINCAPSW = record
    wMid: WORD;                                       { manufacturer ID }
    wPid: WORD;                                       { product ID }
    vDriverVersion: MMVERSION;                        { version of the driver }
    szPname: array[0..MAXPNAMELEN - 1] of WideChar;   { product name (NULL terminated string) }
    dwFormats: DWORD;                                 { formats supported }
    wChannels: WORD;                                  { number of channels supported }
    wReserved1: WORD;                                { structure packing }
  end;
  WAVEINCAPSW = tagWAVEINCAPSW;
  NPWAVEINCAPSW = ^tagWAVEINCAPSW;
  LPWAVEINCAPSW = ^tagWAVEINCAPSW;

  { Delphi }
  WAVEINCAPS = tagWAVEINCAPSW;
  NPWAVEINCAPS = ^tagWAVEINCAPSW;
  LPWAVEINCAPS = ^tagWAVEINCAPSW;


  PWAVEINCAPS2A = ^tagWAVEINCAPS2A;

  tagWAVEINCAPS2A = record
    wMid: WORD;                                      { manufacturer ID }
    wPid: WORD;                                      { product ID }
    vDriverVersion: MMVERSION;                       { version of the driver }
    szPname: array[0..MAXPNAMELEN - 1] of AnsiChar;  { product name (NULL terminated string) }
    dwFormats: DWORD;                                { formats supported }
    wChannels: WORD;                                 { number of channels supported }
    wReserved1: WORD;                                { structure packing }
    ManufacturerGuid: TGUID;                         { for extensible MID mapping }
    ProductGuid: TGUID;                              { for extensible PID mapping }
    NameGuid: TGUID;                                 { for name lookup in registry }
  end;
  WAVEINCAPS2A = tagWAVEINCAPS2A;
  NPWAVEINCAPS2A = ^tagWAVEINCAPS2A;
  LPWAVEINCAPS2A = ^tagWAVEINCAPS2A;

  { UniCode }
  PWAVEINCAPS2W = ^tagWAVEINCAPS2W;

  tagWAVEINCAPS2W = record
    wMid: WORD;                                      { manufacturer ID }
    wPid: WORD;                                      { product ID }
    vDriverVersion: MMVERSION;                       { version of the driver }
    szPname: array[0..MAXPNAMELEN - 1] of WideChar;  { product name (NULL terminated string) }
    dwFormats: DWORD;                                { formats supported }
    wChannels: WORD;                                 { number of channels supported }
    wReserved1: WORD;                                { structure packing }
    ManufacturerGuid: TGUID;                         { for extensible MID mapping }
    ProductGuid: TGUID;                              { for extensible PID mapping }
    NameGuid: TGUID;                                 { for name lookup in registry }
  end;
  WAVEINCAPS2W = tagWAVEINCAPS2W;
  NPWAVEINCAPS2W = ^tagWAVEINCAPS2W;
  LPWAVEINCAPS2W = ^tagWAVEINCAPS2W;

  { Delphi }
  WAVEINCAPS2 = tagWAVEINCAPS2W;
  PWAVEINCAPS2 = ^tagWAVEINCAPS2W;
  LPWAVEINCAPS2 = ^tagWAVEINCAPS2W;


  { defines for dwFormat field of WAVEINCAPS and WAVEOUTCAPS }

const

  WAVE_INVALIDFORMAT = $00000000;  { invalid format }
  WAVE_FORMAT_1M08 = $00000001;  { 11.025 kHz, Mono, 8-bit }
  WAVE_FORMAT_1S08 = $00000002;  { 11.025 kHz, Stereo, 8-bit }
  WAVE_FORMAT_1M16 = $00000004;  { 11.025 kHz, Mono, 16-bit }
  WAVE_FORMAT_1S16 = $00000008;  { 11.025 kHz, Stereo, 16-bit }
  WAVE_FORMAT_2M08 = $00000010;  { 22.05 kHz, Mono, 8-bit }
  WAVE_FORMAT_2S08 = $00000020;  { 22.05 kHz, Stereo, 8-bit }
  WAVE_FORMAT_2M16 = $00000040;  { 22.05 kHz, Mono, 16-bit }
  WAVE_FORMAT_2S16 = $00000080;  { 22.05 kHz, Stereo, 16-bit }
  WAVE_FORMAT_4M08 = $00000100;  { 44.1 kHz, Mono, 8-bit }
  WAVE_FORMAT_4S08 = $00000200;  { 44.1 kHz, Stereo, 8-bit }
  WAVE_FORMAT_4M16 = $00000400;  { 44.1 kHz, Mono, 16-bit }
  WAVE_FORMAT_4S16 = $00000800;  { 44.1 kHz, Stereo, 16-bit }

  WAVE_FORMAT_44M08 = $00000100;  { 44.1 kHz, Mono, 8-bit }
  WAVE_FORMAT_44S08 = $00000200;  { 44.1 kHz, Stereo, 8-bit }
  WAVE_FORMAT_44M16 = $00000400;  { 44.1 kHz, Mono, 16-bit }
  WAVE_FORMAT_44S16 = $00000800;  { 44.1 kHz, Stereo, 16-bit }
  WAVE_FORMAT_48M08 = $00001000;  { 48 kHz, Mono, 8-bit }
  WAVE_FORMAT_48S08 = $00002000;  { 48 kHz, Stereo, 8-bit }
  WAVE_FORMAT_48M16 = $00004000;  { 48 kHz, Mono, 16-bit }
  WAVE_FORMAT_48S16 = $00008000;  { 48 kHz, Stereo, 16-bit }
  WAVE_FORMAT_96M08 = $00010000;  { 96 kHz, Mono, 8-bit }
  WAVE_FORMAT_96S08 = $00020000;  { 96 kHz, Stereo, 8-bit }
  WAVE_FORMAT_96M16 = $00040000;  { 96 kHz, Mono,   16-bit }
  WAVE_FORMAT_96S16 = $00080000;  { 96 kHz, Stereo, 16-bit }


  { OLD general waveform format structure (information common to all formats) }

type
  // left here for backward compatability
  PWAVEFORMAT_OLD = ^waveformat_tag_OLD;

  waveformat_tag_OLD = record
    wFormatTag: WORD;               { format type }
    nChannels: WORD;                { number of channels (i.e. mono, stereo, etc.) }
    nSamplesPerSec: DWORD;          { sample rate }
    nAvgBytesPerSec: DWORD;         { for buffer estimation }
    nBlockAlign: WORD;              { block size of data }
  end;
  WAVEFORMAT_OLD = waveformat_tag_OLD;
  LPWAVEFORMAT_OLD = ^waveformat_tag_OLD;

  { flags for wFormatTag field of WAVEFORMAT }

const

  WAVE_FORMAT_PCM = 1;


  { specific waveform format structure for PCM data }

type
  // Allows the managed application programming interface (API) to have access to the
  // unmanaged portions of the Microsoft DirectX API.
  // This is not intended to be used directly from your code.
  PPCMWAVEFORMAT = ^pcmwaveformat_tag;

  pcmwaveformat_tag = record
    wf: WAVEFORMAT_OLD;
    wBitsPerSample: WORD;
  end;
  PCMWAVEFORMAT = pcmwaveformat_tag;
  LPPCMWAVEFORMAT = ^pcmwaveformat_tag;



 {
 *  extended waveform format structure used for all non-PCM formats. this
 *  structure is common to all non-PCM formats.
 // NOTE: This structure is also defined in MMReg.h but removed from there to prevent clashes.
 }

type

  PWAVEFORMATEX = ^tWAVEFORMATEX;
  // Match the SDK byte packing for wave format headers on both platforms.
  {$ALIGN 1}
  tWAVEFORMATEX = record
    wFormatTag: WORD;               { format type }
    nChannels: WORD;                { number of channels (i.e. mono, stereo...) }
    nSamplesPerSec: DWORD;          { sample rate }
    nAvgBytesPerSec: DWORD;         { for buffer estimation }
    nBlockAlign: WORD;              { block size of data }
    wBitsPerSample: WORD;           { number of bits per sample of mono data }
    cbSize: WORD;                   { the count in bytes of the size of }
    { extra information (after cbSize) }
  end;

  {$IFDEF WIN32}
  {$ALIGN 1}
  {$ELSE}
  {$ALIGN 8}
  {$ENDIF}

  WAVEFORMATEX = tWAVEFORMATEX;
  NPWAVEFORMATEX = ^tWAVEFORMATEX;
  LPWAVEFORMATEX = ^tWAVEFORMATEX;
  LPCWAVEFORMATEX = ^WAVEFORMATEX;



  { waveform audio function prototypes }

function waveOutGetNumDevs(): UINT; stdcall;


function waveOutGetDevCapsA(uDeviceID: UINT_PTR;
  {out} pwoc: LPWAVEOUTCAPSA;
                            cbwoc: UINT): MMRESULT; stdcall;

function waveOutGetDevCapsW(uDeviceID: UINT_PTR;
  {out} pwoc: LPWAVEOUTCAPSW;
                            cbwoc: UINT): MMRESULT; stdcall;

{ Delphi }
function waveOutGetDevCaps(uDeviceID: UINT_PTR;
                           out pwoc: LPWAVEOUTCAPSW;
                           cbwoc: UINT): MMRESULT; stdcall;

function waveOutGetVolume({_In_opt_} hwo: HWAVEOUT;
                          out pdwVolume: DWORD): MMRESULT; stdcall;

function waveOutSetVolume({_In_opt_} hwo: HWAVEOUT;
                          dwVolume: DWORD): MMRESULT; stdcall;

function waveOutGetErrorTextA(mmrError: MMRESULT;
                              out pszText: PAnsiChar;
                              cchText: UINT): MMRESULT; stdcall;

{ UniCode }
function waveOutGetErrorTextW(mmrError: MMRESULT;
                              out pszText: PWideChar;
                              cchText: UINT): MMRESULT; stdcall;

{ Delphi }
function waveOutGetErrorText(mmrError: MMRESULT;
                             pszText: PWideChar;
                             cchText: UINT): MMRESULT; stdcall;

function waveOutOpen({outopt_} phwo: LPHWAVEOUT;
                     uDeviceID: UINT;
                     pwfx: LPCWAVEFORMATEX;
  {_In_opt_} dwCallback: DWORD_PTR;
  {_In_opt_} dwInstance: DWORD_PTR;
                     fdwOpen: DWORD): MMRESULT; stdcall;

function waveOutClose(hwo: HWAVEOUT): MMRESULT; stdcall;


function waveOutPrepareHeader(hwo: HWAVEOUT;
  {_Inout_} pwh: LPWAVEHDR;
                              cbwh: UINT): MMRESULT; stdcall;

function waveOutUnprepareHeader(hwo: HWAVEOUT;
  {_Inout_} pwh: LPWAVEHDR;
                                cbwh: UINT): MMRESULT; stdcall;

function waveOutWrite(hwo: HWAVEOUT;
  {_Inout_} pwh: LPWAVEHDR;
                      cbwh: UINT): MMRESULT; stdcall;

function waveOutPause(hwo: HWAVEOUT): MMRESULT; stdcall;

function waveOutRestart(hwo: HWAVEOUT): MMRESULT; stdcall;

function waveOutReset(hwo: HWAVEOUT): MMRESULT; stdcall;

function waveOutBreakLoop(hwo: HWAVEOUT): MMRESULT; stdcall;

function waveOutGetPosition(hwo: HWAVEOUT;
  {_Inout_} pmmt: LPMMTIME;
                            cbmmt: UINT): MMRESULT; stdcall;

function waveOutGetPitch(hwo: HWAVEOUT;
                         out pdwPitch: PDWORD): MMRESULT; stdcall;

function waveOutSetPitch(hwo: HWAVEOUT;
                         dwPitch: DWORD): MMRESULT; stdcall;

function waveOutGetPlaybackRate(hwo: HWAVEOUT;
                                out pdwRate: PDWORD): MMRESULT; stdcall;

function waveOutSetPlaybackRate(hwo: HWAVEOUT;
                                dwRate: DWORD): MMRESULT; stdcall;

function waveOutGetID(hwo: HWAVEOUT;
  {out} puDeviceID: PUINT): MMRESULT; stdcall;

function waveOutMessage({_In_opt_} hwo: HWAVEOUT;
                        uMsg: UINT;
                        dw1: DWORD_PTR;
                        dw2: DWORD_PTR): MMRESULT; stdcall;

function waveInGetNumDevs(): UINT; stdcall;


function waveInGetDevCapsA(uDeviceID: UINT_PTR;
                           out pwic: LPWAVEINCAPSA;
                           cbwic: UINT): MMRESULT; stdcall;

function waveInGetDevCapsW(uDeviceID: UINT_PTR;
                           out pwic: LPWAVEINCAPSW;
                           cbwic: UINT): MMRESULT; stdcall;

{ Delphi }
function waveInGetDevCaps(uDeviceID: UINT_PTR;
                          out pwic: LPWAVEINCAPSW;
                          cbwic: UINT): MMRESULT; stdcall;


function waveInGetErrorTextA(mmrError: MMRESULT;
                             out pszText: PAnsiChar;
                             cchText: UINT): MMRESULT; stdcall;

function waveInGetErrorTextW(mmrError: MMRESULT;
                             out pszText: PWideChar;
                             cchText: UINT): MMRESULT; stdcall;

{ Delphi }
function waveInGetErrorText(mmrError: MMRESULT;
                            out pszText: PWideChar;
                            cchText: UINT): MMRESULT; stdcall;


function waveInOpen({outopt_} phwi: LPHWAVEIN;
                    uDeviceID: UINT;
                    pwfx: LPCWAVEFORMATEX;
  {_In_opt_} dwCallback: DWORD_PTR;
  {_In_opt_} dwInstance: DWORD_PTR;
                    fdwOpen: DWORD): MMRESULT; stdcall;

function waveInClose(hwi: HWAVEIN): MMRESULT; stdcall;

function waveInPrepareHeader(hwi: HWAVEIN;
  {_Inout_} pwh: LPWAVEHDR;
                             cbwh: UINT): MMRESULT; stdcall;

function waveInUnprepareHeader(hwi: HWAVEIN;
  {_Inout_} pwh: LPWAVEHDR;
                               cbwh: UINT): MMRESULT; stdcall;

function waveInAddBuffer(hwi: HWAVEIN;
  {_Inout_} pwh: LPWAVEHDR;
                         cbwh: UINT): MMRESULT; stdcall;

function waveInStart(hwi: HWAVEIN): MMRESULT; stdcall;

function waveInStop(hwi: HWAVEIN): MMRESULT; stdcall;

function waveInReset(hwi: HWAVEIN): MMRESULT; stdcall;

function waveInGetPosition(hwi: HWAVEIN;
  {_Inout_} pmmt: LPMMTIME;
                           cbmmt: UINT): MMRESULT; stdcall;

function waveInGetID(hwi: HWAVEIN;
                     puDeviceID: PUINT): MMRESULT; stdcall;

function waveInMessage({_In_opt_} const hwi: HWAVEIN;
                       uMsg: UINT;
  {_In_opt_} dw1: DWORD_PTR;
  {_In_opt_} dw2: DWORD_PTR): MMRESULT; stdcall;

//****************************************************************************
//
//                        MIDI audio support
//
//****************************************************************************

{ MIDI error return values }

const

  MIDIERR_UNPREPARED = (MIDIERR_BASE + 0);  { header not prepared }
  MIDIERR_STILLPLAYING = (MIDIERR_BASE + 1);  { still something playing }
  MIDIERR_NOMAP = (MIDIERR_BASE + 2);  { no configured instruments }
  MIDIERR_NOTREADY = (MIDIERR_BASE + 3);  { hardware is still busy }
  MIDIERR_NODEVICE = (MIDIERR_BASE + 4);  { port no longer connected }
  MIDIERR_INVALIDSETUP = (MIDIERR_BASE + 5);  { invalid MIF }
  MIDIERR_BADOPENMODE = (MIDIERR_BASE + 6);  { operation unsupported w/ open mode }
  MIDIERR_DONT_CONTINUE = (MIDIERR_BASE + 7);  { thru device 'eating' a message }
  MIDIERR_LASTERROR = (MIDIERR_BASE + 7);  { last error in range }

  { MIDI audio data types }

type
  PHMIDI = ^HMIDI;
  HMIDI = IntPtr;
  LPHMIDI = ^HMIDI;

  PHMIDIIN = ^HMIDIIN;
  HMIDIIN = IntPtr;
  LPHMIDIIN = ^HMIDIIN;

  PHMIDIOUT = ^HMIDIOUT;
  HMIDIOUT = IntPtr;
  LPHMIDIOUT = ^HMIDIOUT;

  PHMIDISTRM = ^HMIDISTRM;
  HMIDISTRM = IntPtr;
  LPHMIDISTRM = ^HMIDISTRM;

  MIDICALLBACK = DRVCALLBACK;
  LPMIDICALLBACK = ^MIDICALLBACK;

const

  MIDIPATCHSIZE = 128;

type

  PATCHARRAY = array[0..MIDIPATCHSIZE - 1] of WORD;
  LPPATCHARRAY = ^WORD;
  KEYARRAY = array[0..MIDIPATCHSIZE - 1] of WORD;
  LPKEYARRAY = ^WORD;

  { MIDI callback messages }

const

  MIM_OPEN = MM_MIM_OPEN;
  MIM_CLOSE = MM_MIM_CLOSE;
  MIM_DATA = MM_MIM_DATA;
  MIM_LONGDATA = MM_MIM_LONGDATA;
  MIM_ERROR = MM_MIM_ERROR;
  MIM_LONGERROR = MM_MIM_LONGERROR;
  MOM_OPEN = MM_MOM_OPEN;
  MOM_CLOSE = MM_MOM_CLOSE;
  MOM_DONE = MM_MOM_DONE;


  MIM_MOREDATA = MM_MIM_MOREDATA;
  MOM_POSITIONCB = MM_MOM_POSITIONCB;


  { device ID for MIDI mapper }
  MIDIMAPPER = UINT(-1);
  MIDI_MAPPER = UINT(-1);


  { flags for dwFlags parm of midiInOpen() }
  MIDI_IO_STATUS = $00000020;

  { flags for wFlags parm of midiOutCachePatches(), midiOutCacheDrumPatches() }

  MIDI_CACHE_ALL = 1;
  MIDI_CACHE_BESTFIT = 2;
  MIDI_CACHE_QUERY = 3;
  MIDI_UNCACHE = 4;


  { MIDI output device capabilities structure }

type

  PMIDIOUTCAPSA = ^tagMIDIOUTCAPSA;

  tagMIDIOUTCAPSA = record
    wMid: WORD;                                      { manufacturer ID }
    wPid: WORD;                                      { product ID }
    vDriverVersion: MMVERSION;                       { version of the driver }
    szPname: array[0..MAXPNAMELEN - 1] of AnsiChar;  { product name (NULL terminated string) }
    wTechnology: WORD;                               { type of device }
    wVoices: WORD;                                   { # of voices (internal synth only) }
    wNotes: WORD;                                    { max # of notes (internal synth only) }
    wChannelMask: WORD;                              { channels used (internal synth only) }
    dwSupport: DWORD;                                { functionality supported by driver }
  end;
  MIDIOUTCAPSA = tagMIDIOUTCAPSA;
  NPMIDIOUTCAPSA = ^tagMIDIOUTCAPSA;
  LPMIDIOUTCAPSA = ^tagMIDIOUTCAPSA;

  { UniCode }
  PMIDIOUTCAPSW = ^tagMIDIOUTCAPSW;

  tagMIDIOUTCAPSW = record
    wMid: WORD;                                      { manufacturer ID }
    wPid: WORD;                                      { product ID }
    vDriverVersion: MMVERSION;                       { version of the driver }
    szPname: array[0..MAXPNAMELEN - 1] of WideChar;  { product name (NULL terminated string) }
    wTechnology: WORD;                               { type of device }
    wVoices: WORD;                                   { # of voices (internal synth only) }
    wNotes: WORD;                                    { max # of notes (internal synth only) }
    wChannelMask: WORD;                              { channels used (internal synth only) }
    dwSupport: DWORD;                                { functionality supported by driver }
  end;
  MIDIOUTCAPSW = tagMIDIOUTCAPSW;
  NPMIDIOUTCAPSW = ^tagMIDIOUTCAPSW;
  LPMIDIOUTCAPSW = ^tagMIDIOUTCAPSW;

  { Delphi }
  MIDIOUTCAPS = tagMIDIOUTCAPSW;
  NPMIDIOUTCAPS = ^tagMIDIOUTCAPSW;
  LPMIDIOUTCAPW = ^tagMIDIOUTCAPSW;


  PMIDIOUTCAPS2A = ^tagMIDIOUTCAPS2A;

  tagMIDIOUTCAPS2A = record
    wMid: WORD;                                       { manufacturer ID }
    wPid: WORD;                                       { product ID }
    vDriverVersion: MMVERSION;                        { version of the driver }
    szPname: array[0..MAXPNAMELEN - 1] of AnsiChar;   { product name (NULL terminated string) }
    wTechnology: WORD;                                { type of device }
    wVoices: WORD;                                    { # of voices (internal synth only) }
    wNotes: WORD;                                     { max # of notes (internal synth only) }
    wChannelMask: WORD;                               { channels used (internal synth only) }
    dwSupport: DWORD;                                 { functionality supported by driver }
    ManufacturerGuid: TGUID;                          { for extensible MID mapping }
    ProductGuid: TGUID;                               { for extensible PID mapping }
    NameGuid: TGUID;                                 { for name lookup in registry }
  end;
  MIDIOUTCAPS2A = tagMIDIOUTCAPS2A;
  NPMIDIOUTCAPS2A = ^tagMIDIOUTCAPS2A;
  LPMIDIOUTCAPS2A = ^tagMIDIOUTCAPS2A;

  PMIDIOUTCAPS2W = ^tagMIDIOUTCAPS2W;

  tagMIDIOUTCAPS2W = record
    wMid: WORD;                                       { manufacturer ID }
    wPid: WORD;                                       { product ID }
    vDriverVersion: MMVERSION;                        { version of the driver }
    szPname: array[0..MAXPNAMELEN - 1] of WideChar;   { product name (NULL terminated string) }
    wTechnology: WORD;                                { type of device }
    wVoices: WORD;                                    { # of voices (internal synth only) }
    wNotes: WORD;                                     { max # of notes (internal synth only) }
    wChannelMask: WORD;                               { channels used (internal synth only) }
    dwSupport: DWORD;                                 { functionality supported by driver }
    ManufacturerGuid: TGUID;                          { for extensible MID mapping }
    ProductGuid: TGUID;                               { for extensible PID mapping }
    NameGuid: TGUID;                                 { for name lookup in registry }
  end;
  MIDIOUTCAPS2W = tagMIDIOUTCAPS2W;
  NPMIDIOUTCAPS2W = ^tagMIDIOUTCAPS2W;
  LPMIDIOUTCAPS2W = ^tagMIDIOUTCAPS2W;

  { Delphi }
  MIDIOUTCAPS2 = tagMIDIOUTCAPS2W;
  PMIDIOUTCAPS2 = ^tagMIDIOUTCAPS2W;
  LPMIDIOUTCAPS2 = ^tagMIDIOUTCAPS2W;


  { flags for wTechnology field of MIDIOUTCAPS structure }

const

  MOD_MIDIPORT = 1;  { output port }
  MOD_SYNTH = 2;  { generic internal synth }
  MOD_SQSYNTH = 3;  { square wave internal synth }
  MOD_FMSYNTH = 4;  { FM internal synth }
  MOD_MAPPER = 5;  { MIDI mapper }
  MOD_WAVETABLE = 6;  { hardware wavetable synth }
  MOD_SWSYNTH = 7;  { software synth }

  { flags for dwSupport field of MIDIOUTCAPS structure }
  MIDICAPS_VOLUME = $0001;  { supports volume control }
  MIDICAPS_LRVOLUME = $0002;  { separate left-right volume control }
  MIDICAPS_CACHE = $0004;
  MIDICAPS_STREAM = $0008;  { driver supports midiStreamOut directly }


  { MIDI input device capabilities structure }

type

  PMIDIINCAPSA = ^tagMIDIINCAPSA;

  tagMIDIINCAPSA = record
    wMid: WORD;                                      { manufacturer ID }
    wPid: WORD;                                      { product ID }
    vDriverVersion: MMVERSION;                       { version of the driver }
    szPname: array[0..MAXPNAMELEN - 1] of AnsiChar;  { product name (NULL terminated string) }
    dwSupport: DWORD;                                { functionality supported by driver }
  end;
  MIDIINCAPSA = tagMIDIINCAPSA;
  NPMIDIINCAPSA = ^tagMIDIINCAPSA;
  LPMIDIINCAPSA = ^tagMIDIINCAPSA;

  { UniCode }
  PMIDIINCAPSW = ^tagMIDIINCAPSW;

  tagMIDIINCAPSW = record
    wMid: WORD;                                      { manufacturer ID }
    wPid: WORD;                                      { product ID }
    vDriverVersion: MMVERSION;                       { version of the driver }
    szPname: array[0..MAXPNAMELEN - 1] of WideChar;  { product name (NULL terminated string) }
    dwSupport: DWORD;                                { functionality supported by driver }
  end;
  MIDIINCAPSW = tagMIDIINCAPSW;
  NPMIDIINCAPSW = ^tagMIDIINCAPSW;
  LPMIDIINCAPSW = ^tagMIDIINCAPSW;

  { Delphi }
  MIDIINCAPS = tagMIDIINCAPSW;
  NPMIDIINCAPS = ^tagMIDIINCAPSW;
  LPMIDIINCAPS = ^tagMIDIINCAPSW;


  PMIDIINCAPS2A = ^tagMIDIINCAPS2A;

  tagMIDIINCAPS2A = record
    wMid: WORD;                                      { manufacturer ID }
    wPid: WORD;                                      { product ID }
    vDriverVersion: MMVERSION;                       { version of the driver }
    szPname: array[0..MAXPNAMELEN - 1] of AnsiChar;  { product name (NULL terminated string) }
    dwSupport: DWORD;                                { functionality supported by driver }
    ManufacturerGuid: TGUID;                         { for extensible MID mapping }
    ProductGuid: TGUID;                              { for extensible PID mapping }
    NameGuid: TGUID;                                 { for name lookup in registry }
  end;
  MIDIINCAPS2A = tagMIDIINCAPS2A;
  NPMIDIINCAPS2A = ^tagMIDIINCAPS2A;
  LPMIDIINCAPS2A = ^tagMIDIINCAPS2A;

  PMIDIINCAPS2W = ^tagMIDIINCAPS2W;

  tagMIDIINCAPS2W = record
    wMid: WORD;                                      { manufacturer ID }
    wPid: WORD;                                      { product ID }
    vDriverVersion: MMVERSION;                       { version of the driver }
    szPname: array[0..MAXPNAMELEN - 1] of WideChar;  { product name (NULL terminated string) }
    dwSupport: DWORD;                                { functionality supported by driver }
    ManufacturerGuid: TGUID;                         { for extensible MID mapping }
    ProductGuid: TGUID;                              { for extensible PID mapping }
    NameGuid: TGUID;                                 { for name lookup in registry }
  end;
  MIDIINCAPS2W = tagMIDIINCAPS2W;
  NPMIDIINCAPS2W = ^tagMIDIINCAPS2W;
  LPMIDIINCAPS2W = ^tagMIDIINCAPS2W;

  { Delphi }
  MIDIINCAPS2 = tagMIDIINCAPS2W;
  NPMIDIINCAPS2 = ^tagMIDIINCAPS2W;
  LPMIDIINCAPS2 = ^tagMIDIINCAPS2W;


  { MIDI data block header }

  PMIDIHDR = ^midihdr_tag;

  midihdr_tag = record
    lpData: PAnsiChar;                      { pointer to locked data block }
    dwBufferLength: DWORD;                  { length of data in data block }
    dwBytesRecorded: DWORD;                 { used for input only }
    dwUser: DWORD_PTR;                      { for client's use }
    dwFlags: DWORD;                         { assorted flags (see defines) }
    lpNext: PMIDIHDR;                       { reserved for driver }
    reserved: DWORD_PTR;                    { reserved for driver }
    dwOffset: DWORD;                        { Callback offset into buffer }
    dwReserved: array[0..7] of DWORD_PTR;  { Reserved for MMSYSTEM }
  end;
  MIDIHDR = midihdr_tag;
  LPMIDIHDR = ^midihdr_tag;

  PMIDIEVENT = ^midievent_tag;

  midievent_tag = record
    dwDeltaTime: DWORD;             { Ticks since last event }
    dwStreamID: DWORD;              { Reserved; must be zero }
    dwEvent: DWORD;                 { Event type and parameters }
    dwParms: array[0..0] of DWORD;  { Parameters if this is a long event }
  end;
  MIDIEVENT = midievent_tag;

  PMIDISTRMBUFFVER = ^midistrmbuffver_tag;

  midistrmbuffver_tag = record
    dwVersion: DWORD;                { Stream buffer format version }
    dwMid: DWORD;                    { Manufacturer ID as defined in MMREG.H }
    dwOEMVersion: DWORD;            { Manufacturer version for custom ext }
  end;
  MIDISTRMBUFFVER = midistrmbuffver_tag;


  { flags for dwFlags field of MIDIHDR structure }

const

  MHDR_DONE = $00000001;  { done bit }
  MHDR_PREPARED = $00000002;  { set if header prepared }
  MHDR_INQUEUE = $00000004;  { reserved for driver }
  MHDR_ISSTRM = $00000008;  { Buffer is stream buffer }


  // Type codes which go in the high byte of the event DWORD of a stream buffer
  //
  // Type codes 00-7F contain parameters within the low 24 bits
  // Type codes 80-FF contain a length of their parameter in the low 24
  // bits, followed by their parameter data in the buffer. The event
  // DWORD contains the exact byte length; the parm data itself must be
  // padded to be an even multiple of 4 bytes long.

const

  MEVT_F_SHORT = $00000000;
  MEVT_F_LONG = $80000000;
  MEVT_F_CALLBACK = $40000000;

{ Macro's }
function MEVT_EVENTTYPE(x: DWORD): DWORD; inline;

function MEVT_EVENTPARM(x: DWORD): DWORD; inline;


const

  MEVT_SHORTMSG = $00;  { parm = shortmsg for midiOutShortMsg }
  MEVT_TEMPO = $01;  { parm = new tempo in microsec/qn     }
  MEVT_NOP = $02;  { parm = unused; does nothing         }

  { 0x04-0x7F reserved }

  MEVT_LONGMSG = $80;  { parm = bytes to send verbatim       }
  MEVT_COMMENT = $82;  { parm = comment data                 }
  MEVT_VERSION = $84;  { parm = MIDISTRMBUFFVER struct       }

  { 0x81-0xFF reserved }

  MIDISTRM_ERROR = (-2);


  { Structures and defines for midiStreamProperty }

  MIDIPROP_SET = $80000000;
  MIDIPROP_GET = $40000000;

  { These are intentionally both non-zero so the app cannot accidentally }
  { leave the operation off and happen to appear to work due to default }
  { action. }

  MIDIPROP_TIMEDIV = $00000001;
  MIDIPROP_TEMPO = $00000002;

type

  PMIDIPROPTIMEDIV = ^midiproptimediv_tag;

  midiproptimediv_tag = record
    cbStruct: DWORD;
    dwTimeDiv: DWORD;
  end;
  MIDIPROPTIMEDIV = midiproptimediv_tag;
  LPMIDIPROPTIMEDIV = ^midiproptimediv_tag;

  PMIDIPROPTEMPO = ^midiproptempo_tag;

  midiproptempo_tag = record
    cbStruct: DWORD;
    dwTempo: DWORD;
  end;
  MIDIPROPTEMPO = midiproptempo_tag;
  LPMIDIPROPTEMPO = ^midiproptempo_tag;


  { MIDI function prototypes }

function midiOutGetNumDevs(): MMRESULT; stdcall;

function midiStreamOpen(phms: LPHMIDISTRM;
                        puDeviceID: PUINT;
                        cMidi: DWORD;
  {_In_opt_} dwCallback: DWORD_PTR;
  {_In_opt_} dwInstance: DWORD_PTR;
                        fdwOpen: DWORD): MMRESULT; stdcall;

function midiStreamClose(hms: HMIDISTRM): MMRESULT; stdcall;

function midiStreamProperty(hms: HMIDISTRM;
                            lppropdata: PByte;
                            dwProperty: DWORD): MMRESULT; stdcall;

function midiStreamPosition(hms: HMIDISTRM;
                            lpmmt: LPMMTIME;
                            cbmmt: UINT): MMRESULT; stdcall;

function midiStreamOut(hms: HMIDISTRM;
  {out} pmh: LPMIDIHDR;
                       cbmh: UINT): MMRESULT; stdcall;

function midiStreamPause(hms: HMIDISTRM): MMRESULT; stdcall;

function midiStreamRestart(hms: HMIDISTRM): MMRESULT; stdcall;

function midiStreamStop(hms: HMIDISTRM): MMRESULT; stdcall;


function midiConnect(hmi: HMIDI;
                     hmo: HMIDIOUT;
  {_In_opt_} pReserved: Pointer): MMRESULT; stdcall;

function midiDisconnect(hmi: HMIDI;
                        hmo: HMIDIOUT;
  {_In_opt_} pReserved: Pointer): MMRESULT; stdcall;


function midiOutGetDevCapsA(uDeviceID: UINT_PTR;
  {out} pmoc: LPMIDIOUTCAPSA;
                            cbmoc: UINT): MMRESULT; stdcall;

function midiOutGetDevCapsW(uDeviceID: UINT_PTR;
  {out} pmoc: LPMIDIOUTCAPSW;
                            cbmoc: UINT): MMRESULT; stdcall;

function midiOutGetDevCaps(uDeviceID: UINT_PTR;
  {out} pmoc: LPMIDIOUTCAPSW;
                           cbmoc: UINT): MMRESULT; stdcall;


function midiOutGetVolume({_In_opt_} hmo: HMIDIOUT;
  {out} pdwVolume: PDWORD): MMRESULT; stdcall;

function midiOutSetVolume({_In_opt_} hmo: HMIDIOUT;
                          dwVolume: DWORD): MMRESULT; stdcall;


function midiOutGetErrorTextA(mmrError: MMRESULT;
  {out} pszText: PAnsiChar;
                              cchText: UINT): MMRESULT; stdcall;

function midiOutGetErrorTextW(mmrError: MMRESULT;
  {out} pszText: PWideChar;
                              cchText: UINT): MMRESULT; stdcall;

function midiOutGetErrorText(mmrError: MMRESULT;
  {out} pszText: PWideChar;
                             cchText: UINT): MMRESULT; stdcall;


function midiOutOpen({out} phmo: LPHMIDIOUT;
                     uDeviceID: UINT;
  {_In_opt_} dwCallback: DWORD_PTR;
  {_In_opt_} dwInstance: DWORD_PTR;
                     fdwOpen: DWORD): MMRESULT; stdcall;

function midiOutClose(hmo: HMIDIOUT): MMRESULT; stdcall;

function midiOutPrepareHeader(hmo: HMIDIOUT;
  {_Inout_} pmh: LPMIDIHDR;
                              cbmh: UINT): MMRESULT; stdcall;

function midiOutUnprepareHeader(hmo: HMIDIOUT;
  {_Inout_} pmh: LPMIDIHDR;
                                cbmh: UINT): MMRESULT; stdcall;

function midiOutShortMsg(hmo: HMIDIOUT;
                         dwMsg: DWORD): MMRESULT; stdcall;

function midiOutLongMsg(hmo: HMIDIOUT;
                        pmh: LPMIDIHDR;
                        cbmh: UINT): MMRESULT; stdcall;

function midiOutReset(hmo: HMIDIOUT): MMRESULT; stdcall;

function midiOutCachePatches(hmo: HMIDIOUT;
                             uBank: UINT;
                             pwpa: PWORD;
                             fuCache: UINT): MMRESULT; stdcall;

function midiOutCacheDrumPatches(hmo: HMIDIOUT;
                                 uPatch: UINT;
                                 pwkya: PWORD;
                                 fuCache: UINT): MMRESULT; stdcall;

function midiOutGetID(hmo: HMIDIOUT;
  {out} puDeviceID: PUINT): MMRESULT; stdcall;

function midiOutMessage({_In_opt_} hmo: HMIDIOUT;
                        uMsg: UINT;
  {_In_opt_} dw1: DWORD_PTR;
  {_In_opt_} dw2: DWORD_PTR): MMRESULT; stdcall;

function midiInGetNumDevs(): UINT; stdcall;

function midiInGetDevCapsA(uDeviceID: UINT_PTR;
  {out} pmic: LPMIDIINCAPSA;
                           cbmic: UINT): MMRESULT; stdcall;

function midiInGetDevCapsW(uDeviceID: UINT_PTR;
  {out} pmic: LPMIDIINCAPSW;
                           cbmic: UINT): MMRESULT; stdcall;

{ Delphi }
function midiInGetDevCaps(uDeviceID: UINT_PTR;
  {out} pmic: LPMIDIINCAPSW;
                          cbmic: UINT): MMRESULT; stdcall;


function midiInGetErrorTextA(mmrError: MMRESULT;
  {out} pszText: PAnsiChar;
                             cchText: UINT): MMRESULT; stdcall;

function midiInGetErrorTextW(mmrError: MMRESULT;
  {out} pszText: PWideChar;
                             cchText: UINT): MMRESULT; stdcall;

{ Delphi }
function midiInGetErrorText(mmrError: MMRESULT;
  {out} pszText: PWideChar;
                            cchText: UINT): MMRESULT; stdcall;


function midiInOpen({out} phmi: LPHMIDIIN;
                    uDeviceID: UINT;
  {_In_opt_} dwCallback: DWORD_PTR;
  {_In_opt_} dwInstance: DWORD_PTR;
                    fdwOpen: DWORD): MMRESULT; stdcall;

function midiInClose(hmi: HMIDIIN): MMRESULT; stdcall;

function midiInPrepareHeader(hmi: HMIDIIN;
  {_Inout_} pmh: LPMIDIHDR;
                             cbmh: UINT): MMRESULT; stdcall;

function midiInUnprepareHeader(hmi: HMIDIIN;
  {_Inout_} pmh: LPMIDIHDR;
                               cbmh: UINT): MMRESULT; stdcall;

function midiInAddBuffer(hmi: HMIDIIN;
  {out} pmh: LPMIDIHDR;
                         cbmh: UINT): MMRESULT; stdcall;

function midiInStart(hmi: HMIDIIN): MMRESULT; stdcall;

function midiInStop(hmi: HMIDIIN): MMRESULT; stdcall;

function midiInReset(hmi: HMIDIIN): MMRESULT; stdcall;

function midiInGetID(hmi: HMIDIIN;
  {out} puDeviceID: PUINT): MMRESULT; stdcall;

function midiInMessage({_In_opt_} hmi: HMIDIIN;
                       uMsg: UINT;
  {_In_opt_} dw1: DWORD_PTR;
  {_In_opt_} dw2: DWORD_PTR): MMRESULT; stdcall;


//****************************************************************************
//
//                    Auxiliary audio support
//
//****************************************************************************

{ device ID for aux device mapper }

const

  AUX_MAPPER = UINT(-1);


  { Auxiliary audio device capabilities structure }

type

  PAUXCAPSA = ^tagAUXCAPSA;

  tagAUXCAPSA = record
    wMid: WORD;                                       { manufacturer ID }
    wPid: WORD;                                       { product ID }
    vDriverVersion: MMVERSION;                        { version of the driver }
    szPname: array[0..MAXPNAMELEN - 1] of AnsiChar;   { product name (NULL terminated string) }
    wTechnology: WORD;                                { type of device }
    wReserved1: WORD;                                 { padding }
    dwSupport: DWORD;                                { functionality supported by driver }
  end;
  AUXCAPSA = tagAUXCAPSA;
  NPAUXCAPSA = ^tagAUXCAPSA;
  LPAUXCAPSA = ^tagAUXCAPSA;

  PAUXCAPSW = ^tagAUXCAPSW;

  tagAUXCAPSW = record
    wMid: WORD;                                      { manufacturer ID }
    wPid: WORD;                                      { product ID }
    vDriverVersion: MMVERSION;                       { version of the driver }
    szPname: array[0..MAXPNAMELEN - 1] of WideChar;  { product name (NULL terminated string) }
    wTechnology: WORD;                               { type of device }
    wReserved1: WORD;                                { padding }
    dwSupport: DWORD;                                { functionality supported by driver }
  end;
  AUXCAPSW = tagAUXCAPSW;
  NPAUXCAPSW = ^tagAUXCAPSW;
  LPAUXCAPSW = ^tagAUXCAPSW;

  { Delphi }
  AUXCAPS = tagAUXCAPSW;
  PAUXCAPS = ^tagAUXCAPSW;
  NPAUXCAPS = ^tagAUXCAPSW;
  LPAUXCAPS = ^tagAUXCAPSW;


  PAUXCAPS2A = ^tagAUXCAPS2A;

  tagAUXCAPS2A = record
    wMid: WORD;                                       { manufacturer ID }
    wPid: WORD;                                       { product ID }
    vDriverVersion: MMVERSION;                        { version of the driver }
    szPname: array[0..MAXPNAMELEN - 1] of AnsiChar;   { product name (NULL terminated string) }
    wTechnology: WORD;                                { type of device }
    wReserved1: WORD;                                 { padding }
    dwSupport: DWORD;                                 { functionality supported by driver }
    ManufacturerGuid: TGUID;                          { for extensible MID mapping }
    ProductGuid: TGUID;                               { for extensible PID mapping }
    NameGuid: TGUID;                                 { for name lookup in registry }
  end;
  AUXCAPS2A = tagAUXCAPS2A;
  NPAUXCAPS2A = ^tagAUXCAPS2A;
  LPAUXCAPS2A = ^tagAUXCAPS2A;

  PAUXCAPS2W = ^tagAUXCAPS2W;

  tagAUXCAPS2W = record
    wMid: WORD;                                       { manufacturer ID }
    wPid: WORD;                                       { product ID }
    vDriverVersion: MMVERSION;                        { version of the driver }
    szPname: array[0..MAXPNAMELEN - 1] of WideChar;   { product name (NULL terminated string) }
    wTechnology: WORD;                                { type of device }
    wReserved1: WORD;                                 { padding }
    dwSupport: DWORD;                                 { functionality supported by driver }
    ManufacturerGuid: TGUID;                          { for extensible MID mapping }
    ProductGuid: TGUID;                               { for extensible PID mapping }
    NameGuid: TGUID;                                 { for name lookup in registry }
  end;
  AUXCAPS2W = tagAUXCAPS2W;
  NPAUXCAPS2W = ^tagAUXCAPS2W;
  LPAUXCAPS2W = ^tagAUXCAPS2W;

  { Delphi}
  AUXCAPS2 = tagAUXCAPS2W;
  PAUXCAPS2 = ^tagAUXCAPS2W;
  LPAUXCAPS2 = ^tagAUXCAPS2W;


  { flags for wTechnology field in AUXCAPS structure }

const

  AUXCAPS_CDAUDIO = 1;  { audio from internal CD-ROM drive }
  AUXCAPS_AUXIN = 2;  { audio from auxiliary input jacks }

  { flags for dwSupport field in AUXCAPS structure }
  AUXCAPS_VOLUME = $0001;  { supports volume control }
  AUXCAPS_LRVOLUME = $0002;  { separate left-right volume control }

  { auxiliary audio function prototypes }

function auxGetNumDevs(): MMRESULT; stdcall;


function auxGetDevCapsA(uDeviceID: UINT_PTR;
  {out} pac: LPAUXCAPSA;
                        cbac: UINT): MMRESULT; stdcall;

function auxGetDevCapsW(uDeviceID: UINT_PTR;
  {out} pac: LPAUXCAPSW;
                        cbac: UINT): MMRESULT; stdcall;

{ Delphi }
function auxGetDevCaps(uDeviceID: UINT_PTR;
  {out} pac: LPAUXCAPSW;
                       cbac: UINT): MMRESULT; stdcall;


function auxSetVolume(uDeviceID: UINT;
                      dwVolume: DWORD): MMRESULT; stdcall;

function auxGetVolume(uDeviceID: UINT;
  {out} pdwVolume: PDWORD): MMRESULT; stdcall;


function auxOutMessage(uDeviceID: UINT;
                       uMsg: UINT;
  {_In_opt_} dw1: DWORD_PTR;
  {_In_opt_} dw2: DWORD_PTR): MMRESULT; stdcall;


//****************************************************************************
//
//                        Mixer Support
//
//****************************************************************************/

type

  PHMIXEROBJ = ^HMIXEROBJ;
  HMIXEROBJ = IntPtr;
  LPHMIXEROBJ = ^HMIXEROBJ;

  PHMIXER = ^HMIXER;
  HMIXER = IntPtr;
  LPHMIXER = ^HMIXER;

const

  MIXER_SHORT_NAME_CHARS = 16;
  MIXER_LONG_NAME_CHARS = 64;

  {  MMRESULT error return values specific to the mixer API }

const

  MIXERR_INVALLINE = (MIXERR_BASE + 0);
  MIXERR_INVALCONTROL = (MIXERR_BASE + 1);
  MIXERR_INVALVALUE = (MIXERR_BASE + 2);
  MIXERR_LASTERROR = (MIXERR_BASE + 2);

  MIXER_OBJECTF_HANDLE = $80000000;
  MIXER_OBJECTF_MIXER = $00000000;
  MIXER_OBJECTF_HMIXER = (MIXER_OBJECTF_HANDLE or MIXER_OBJECTF_MIXER);
  MIXER_OBJECTF_WAVEOUT = $10000000;
  MIXER_OBJECTF_HWAVEOUT = (MIXER_OBJECTF_HANDLE or MIXER_OBJECTF_WAVEOUT);
  MIXER_OBJECTF_WAVEIN = $20000000;
  MIXER_OBJECTF_HWAVEIN = (MIXER_OBJECTF_HANDLE or MIXER_OBJECTF_WAVEIN);
  MIXER_OBJECTF_MIDIOUT = $30000000;
  MIXER_OBJECTF_HMIDIOUT = (MIXER_OBJECTF_HANDLE or MIXER_OBJECTF_MIDIOUT);
  MIXER_OBJECTF_MIDIIN = $40000000;
  MIXER_OBJECTF_HMIDIIN = (MIXER_OBJECTF_HANDLE or MIXER_OBJECTF_MIDIIN);
  MIXER_OBJECTF_AUX = $50000000;

function mixerGetNumDevs(): UINT; stdcall;

type

  PMIXERCAPSA = ^tagMIXERCAPSA;

  tagMIXERCAPSA = record
    wMid: WORD;                                       { manufacturer id }
    wPid: WORD;                                       { product id }
    vDriverVersion: MMVERSION;                        { version of the driver }
    szPname: array[0..MAXPNAMELEN - 1] of AnsiChar;   { product name }
    fdwSupport: DWORD;                                { misc. support bits }
    cDestinations: DWORD;                            { count of destinations }
  end;
  MIXERCAPSA = tagMIXERCAPSA;
  LPMIXERCAPSA = ^tagMIXERCAPSA;

  PMIXERCAPSW = ^tagMIXERCAPSW;

  tagMIXERCAPSW = record
    wMid: WORD;                                       { manufacturer id }
    wPid: WORD;                                       { product id }
    vDriverVersion: MMVERSION;                        { version of the driver }
    szPname: array[0..MAXPNAMELEN - 1] of WideChar;   { product name }
    fdwSupport: DWORD;                                { misc. support bits }
    cDestinations: DWORD;                            { count of destinations }
  end;
  MIXERCAPSW = tagMIXERCAPSW;
  LPMIXERCAPSW = ^tagMIXERCAPSW;

  { Delphi }
  MIXERCAPS = tagMIXERCAPSW;
  PMIXERCAPS = ^tagMIXERCAPSW;
  LPMIXERCAPS = ^tagMIXERCAPSW;


  tagMIXERCAPS2A = record
    wMid: WORD;                                       { manufacturer id }
    wPid: WORD;                                       { product id }
    vDriverVersion: MMVERSION;                        { version of the driver }
    szPname: array[0..MAXPNAMELEN - 1] of AnsiChar;   { product name }
    fdwSupport: DWORD;                                { misc. support bits }
    cDestinations: DWORD;                             { count of destinations }
    ManufacturerGuid: TGUID;                          { for extensible MID mapping }
    ProductGuid: TGUID;                               { for extensible PID mapping }
    NameGuid: TGUID;                                 { for name lookup in registry }
  end;
  MIXERCAPS2A = tagMIXERCAPS2A;
  PMIXERCAPS2A = ^tagMIXERCAPS2A;
  LPMIXERCAPS2A = ^tagMIXERCAPS2A;

  tagMIXERCAPS2W = record
    wMid: WORD;                                       { manufacturer id }
    wPid: WORD;                                       { product id }
    vDriverVersion: MMVERSION;                        { version of the driver }
    szPname: array[0..MAXPNAMELEN - 1] of WideChar;   { product name }
    fdwSupport: DWORD;                                { misc. support bits }
    cDestinations: DWORD;                             { count of destinations }
    ManufacturerGuid: TGUID;                          { for extensible MID mapping }
    ProductGuid: TGUID;                               { for extensible PID mapping }
    NameGuid: TGUID;                                 { for name lookup in registry }
  end;
  MIXERCAPS2W = tagMIXERCAPS2W;
  PMIXERCAPS2W = ^tagMIXERCAPS2W;
  LPMIXERCAPS2W = ^tagMIXERCAPS2W;

  { Delphi }
  MIXERCAPS2 = tagMIXERCAPS2W;
  PMIXERCAPS2 = ^tagMIXERCAPS2W;
  LPMIXERCAPS2 = ^tagMIXERCAPS2W;


function mixerGetDevCapsA(uMxId: UINT_PTR;
  {out} pmxcaps: LPMIXERCAPSA;
                          cbmxcaps: UINT): MMRESULT; stdcall;

function mixerGetDevCapsW(uMxId: UINT_PTR;
  {out} pmxcaps: LPMIXERCAPSW;
                          cbmxcaps: UINT): MMRESULT; stdcall;

function mixerGetDevCaps(uMxId: UINT_PTR;
  {out} pmxcaps: PMIXERCAPS;
                         cbmxcaps: UINT): MMRESULT; stdcall;

function mixerOpen({outopt_} phmx: LPHMIXER;
                   uMxId: UINT;
  {_In_opt_} dwCallback: DWORD_PTR;
  {_In_opt_} dwInstance: DWORD_PTR;
                   fdwOpen: DWORD): MMRESULT; stdcall;

function mixerClose(hmx: HMIXER): MMRESULT; stdcall;

function mixerMessage({_In_opt_} hmx: HMIXER;
                      uMsg: UINT;
  {_In_opt_} dwParam1: DWORD_PTR;
  {_In_opt_} dwParam2: DWORD_PTR): DWORD; stdcall;

type

  PMIXERLINEA = ^tagMIXERLINEA;

  tagMIXERLINEA = record
    cbStruct: DWORD;                                    { size of MIXERLINE structure }
    dwDestination: DWORD;                               { zero based destination index }
    dwSource: DWORD;                                    { zero based source index (if source) }
    dwLineID: DWORD;                                    { unique line id for mixer device }
    fdwLine: DWORD;                                     { state/information about line }
    dwUser: DWORD_PTR;                                  { driver specific information }
    dwComponentType: DWORD;                             { component type line connects to }
    cChannels: DWORD;                                   { number of channels line supports }
    cConnections: DWORD;                                { number of connections [possible] }
    cControls: DWORD;                                   { number of controls at this line }
    szShortName: array[0..MIXER_SHORT_NAME_CHARS - 1] of AnsiChar;
    szName: array[0..MIXER_LONG_NAME_CHARS - 1] of AnsiChar;
    Target: record
      dwType: DWORD;                                    { MIXERLINE_TARGETTYPE_xxxx }
      dwDeviceID: DWORD;                                { target device ID of device type }
      wMid: WORD;                                       { of target device }
      wPid: WORD;                                       {      " }
      vDriverVersion: MMVERSION;                        {      " }
      szPname: array[0..MAXPNAMELEN - 1] of AnsiChar;   {      " }
      end;
  end;
  MIXERLINEA = tagMIXERLINEA;
  LPMIXERLINEA = ^tagMIXERLINEA;

  PMIXERLINEW = ^tagMIXERLINEW;

  tagMIXERLINEW = record
    cbStruct: DWORD;                                    { size of MIXERLINE structure }
    dwDestination: DWORD;                               { zero based destination index }
    dwSource: DWORD;                                    { zero based source index (if source) }
    dwLineID: DWORD;                                    { unique line id for mixer device }
    fdwLine: DWORD;                                     { state/information about line }
    dwUser: DWORD_PTR;                                  { driver specific information }
    dwComponentType: DWORD;                             { component type line connects to }
    cChannels: DWORD;                                   { number of channels line supports }
    cConnections: DWORD;                                { number of connections [possible] }
    cControls: DWORD;                                   { number of controls at this line }
    szShortName: array[0..MIXER_SHORT_NAME_CHARS - 1] of WideChar;
    szName: array[0..MIXER_LONG_NAME_CHARS - 1] of WideChar;
    Target: record
      dwType: DWORD;                                    { MIXERLINE_TARGETTYPE_xxxx }
      dwDeviceID: DWORD;                                { target device ID of device type }
      wMid: WORD;                                       { of target device }
      wPid: WORD;                                       {      " }
      vDriverVersion: MMVERSION;                        {      " }
      szPname: array[0..MAXPNAMELEN - 1] of WideChar;   {      " }
      end;
  end;
  MIXERLINEW = tagMIXERLINEW;
  LPMIXERLINEW = ^tagMIXERLINEW;

  { Delphi }
  MIXERLINE = tagMIXERLINEW;
  PMIXERLINE = ^tagMIXERLINEW;
  LPMIXERLINE = ^tagMIXERLINEW;


  {  MIXERLINE.fdwLine }

const

  MIXERLINE_LINEF_ACTIVE = $00000001;
  MIXERLINE_LINEF_DISCONNECTED = $00008000;
  MIXERLINE_LINEF_SOURCE = $80000000;


  {  MIXERLINE.dwComponentType }

  {  component types for destinations and sources }

const

  MIXERLINE_COMPONENTTYPE_DST_FIRST = $00000000;
  MIXERLINE_COMPONENTTYPE_DST_UNDEFINED = (MIXERLINE_COMPONENTTYPE_DST_FIRST + 0);
  MIXERLINE_COMPONENTTYPE_DST_DIGITAL = (MIXERLINE_COMPONENTTYPE_DST_FIRST + 1);
  MIXERLINE_COMPONENTTYPE_DST_LINE = (MIXERLINE_COMPONENTTYPE_DST_FIRST + 2);
  MIXERLINE_COMPONENTTYPE_DST_MONITOR = (MIXERLINE_COMPONENTTYPE_DST_FIRST + 3);
  MIXERLINE_COMPONENTTYPE_DST_SPEAKERS = (MIXERLINE_COMPONENTTYPE_DST_FIRST + 4);
  MIXERLINE_COMPONENTTYPE_DST_HEADPHONES = (MIXERLINE_COMPONENTTYPE_DST_FIRST + 5);
  MIXERLINE_COMPONENTTYPE_DST_TELEPHONE = (MIXERLINE_COMPONENTTYPE_DST_FIRST + 6);
  MIXERLINE_COMPONENTTYPE_DST_WAVEIN = (MIXERLINE_COMPONENTTYPE_DST_FIRST + 7);
  MIXERLINE_COMPONENTTYPE_DST_VOICEIN = (MIXERLINE_COMPONENTTYPE_DST_FIRST + 8);
  MIXERLINE_COMPONENTTYPE_DST_LAST = (MIXERLINE_COMPONENTTYPE_DST_FIRST + 8);

  MIXERLINE_COMPONENTTYPE_SRC_FIRST = $00001000;
  MIXERLINE_COMPONENTTYPE_SRC_UNDEFINED = (MIXERLINE_COMPONENTTYPE_SRC_FIRST + 0);
  MIXERLINE_COMPONENTTYPE_SRC_DIGITAL = (MIXERLINE_COMPONENTTYPE_SRC_FIRST + 1);
  MIXERLINE_COMPONENTTYPE_SRC_LINE = (MIXERLINE_COMPONENTTYPE_SRC_FIRST + 2);
  MIXERLINE_COMPONENTTYPE_SRC_MICROPHONE = (MIXERLINE_COMPONENTTYPE_SRC_FIRST + 3);
  MIXERLINE_COMPONENTTYPE_SRC_SYNTHESIZER = (MIXERLINE_COMPONENTTYPE_SRC_FIRST + 4);
  MIXERLINE_COMPONENTTYPE_SRC_COMPACTDISC = (MIXERLINE_COMPONENTTYPE_SRC_FIRST + 5);
  MIXERLINE_COMPONENTTYPE_SRC_TELEPHONE = (MIXERLINE_COMPONENTTYPE_SRC_FIRST + 6);
  MIXERLINE_COMPONENTTYPE_SRC_PCSPEAKER = (MIXERLINE_COMPONENTTYPE_SRC_FIRST + 7);
  MIXERLINE_COMPONENTTYPE_SRC_WAVEOUT = (MIXERLINE_COMPONENTTYPE_SRC_FIRST + 8);
  MIXERLINE_COMPONENTTYPE_SRC_AUXILIARY = (MIXERLINE_COMPONENTTYPE_SRC_FIRST + 9);
  MIXERLINE_COMPONENTTYPE_SRC_ANALOG = (MIXERLINE_COMPONENTTYPE_SRC_FIRST + 10);
  MIXERLINE_COMPONENTTYPE_SRC_LAST = (MIXERLINE_COMPONENTTYPE_SRC_FIRST + 10);


  {  MIXERLINE.Target.dwType }
const
  MIXERLINE_TARGETTYPE_UNDEFINED = 0;
  MIXERLINE_TARGETTYPE_WAVEOUT = 1;
  MIXERLINE_TARGETTYPE_WAVEIN = 2;
  MIXERLINE_TARGETTYPE_MIDIOUT = 3;
  MIXERLINE_TARGETTYPE_MIDIIN = 4;
  MIXERLINE_TARGETTYPE_AUX = 5;


function mixerGetLineInfoA({_In_opt_} hmxobj: HMIXEROBJ;
  {_Inout_} pmxl: LPMIXERLINEA;
                           fdwInfo: DWORD): MMRESULT; stdcall;

function mixerGetLineInfoW({_In_opt_} hmxobj: HMIXEROBJ;
  {_Inout_} pmxl: LPMIXERLINEW;
                           fdwInfo: DWORD): MMRESULT; stdcall;

{ Delphi }
function mixerGetLineInfo({_In_opt_} hmxobj: HMIXEROBJ;
  {_Inout_} pmxl: LPMIXERLINEW;
                          fdwInfo: DWORD): MMRESULT; stdcall;


const

  MIXER_GETLINEINFOF_DESTINATION = $00000000;
  MIXER_GETLINEINFOF_SOURCE = $00000001;
  MIXER_GETLINEINFOF_LINEID = $00000002;
  MIXER_GETLINEINFOF_COMPONENTTYPE = $00000003;
  MIXER_GETLINEINFOF_TARGETTYPE = $00000004;

  MIXER_GETLINEINFOF_QUERYMASK = $0000000F;


function mixerGetID({_In_opt_} hmxobj: HMIXEROBJ;
                    out puMxId: UINT;
                    fdwId: DWORD): MMRESULT; stdcall;


{ MIXERCONTROL }

type

  PMIXERCONTROLA = ^tagMIXERCONTROLA;

  tagMIXERCONTROLA = record
    cbStruct: DWORD;                      { size in bytes of MIXERCONTROL }
    dwControlID: DWORD;                   { unique control id for mixer device }
    dwControlType: DWORD;                 { MIXERCONTROL_CONTROLTYPE_xxx }
    fdwControl: DWORD;                    { MIXERCONTROL_CONTROLF_xxx }
    cMultipleItems: DWORD;                { if MIXERCONTROL_CONTROLF_MULTIPLE set }
    szShortName: array[0..MIXER_SHORT_NAME_CHARS - 1] of AnsiChar;
    szName: array[0..MIXER_LONG_NAME_CHARS - 1] of AnsiChar;

    Bounds: record
      case Integer of
        0: (lMinimum: LONG;
          lMaximum: LONG);

        1: (dwMinimum: DWORD;
          dwMaximum: DWORD);

        2: (dwReserved: array[0..5] of DWORD);
      end;

    Metrics: record
      case Integer of
        0: (cSteps: DWORD);        { # of steps between min & max }

        1: (cbCustomData: DWORD);  { size in bytes of custom data }

        2: (dwReserved: array[0..5] of DWORD);
      end;
  end;
  MIXERCONTROLA = tagMIXERCONTROLA;
  LPMIXERCONTROLA = ^tagMIXERCONTROLA;

  PMIXERCONTROLW = ^tagMIXERCONTROLW;

  tagMIXERCONTROLW = record
    cbStruct: DWORD;                      { size in bytes of MIXERCONTROL }
    dwControlID: DWORD;                   { unique control id for mixer device }
    dwControlType: DWORD;                 { MIXERCONTROL_CONTROLTYPE_xxx }
    fdwControl: DWORD;                    { MIXERCONTROL_CONTROLF_xxx }
    cMultipleItems: DWORD;                { if MIXERCONTROL_CONTROLF_MULTIPLE set }
    szShortName: array[0..MIXER_SHORT_NAME_CHARS - 1] of WideChar;
    szName: array[0..MIXER_LONG_NAME_CHARS - 1] of WideChar;

    Bounds: record
      case Integer of
        0: (lMinimum: LONG;
          lMaximum: LONG);

        1: (dwMinimum: DWORD;
          dwMaximum: DWORD);

        2: (dwReserved: array[0..5] of DWORD);
      end;

    Metrics: record
      case Integer of
        0: (cSteps: DWORD);        { # of steps between min & max }

        1: (cbCustomData: DWORD);  { size in bytes of custom data }

        2: (dwReserved: array[0..5] of DWORD);
      end;
  end;
  MIXERCONTROLW = tagMIXERCONTROLW;
  LPMIXERCONTROLW = ^tagMIXERCONTROLW;

  { Delphi }
  MIXERCONTROL = tagMIXERCONTROLW;
  PMIXERCONTROL = ^tagMIXERCONTROLW;
  LPMIXERCONTROL = ^tagMIXERCONTROLW;


  {  MIXERCONTROL.fdwControl }

const

  MIXERCONTROL_CONTROLF_UNIFORM = $00000001;
  MIXERCONTROL_CONTROLF_MULTIPLE = $00000002;
  MIXERCONTROL_CONTROLF_DISABLED = $80000000;

  {  MIXERCONTROL_CONTROLTYPE_xxx building block defines }

  MIXERCONTROL_CT_CLASS_MASK = $F0000000;
  MIXERCONTROL_CT_CLASS_CUSTOM = $00000000;
  MIXERCONTROL_CT_CLASS_METER = $10000000;
  MIXERCONTROL_CT_CLASS_SWITCH = $20000000;
  MIXERCONTROL_CT_CLASS_NUMBER = $30000000;
  MIXERCONTROL_CT_CLASS_SLIDER = $40000000;
  MIXERCONTROL_CT_CLASS_FADER = $50000000;
  MIXERCONTROL_CT_CLASS_TIME = $60000000;
  MIXERCONTROL_CT_CLASS_LIST = $70000000;

  MIXERCONTROL_CT_SUBCLASS_MASK = $0F000000;

  MIXERCONTROL_CT_SC_SWITCH_BOOLEAN = $00000000;
  MIXERCONTROL_CT_SC_SWITCH_BUTTON = $01000000;

  MIXERCONTROL_CT_SC_METER_POLLED = $00000000;

  MIXERCONTROL_CT_SC_TIME_MICROSECS = $00000000;
  MIXERCONTROL_CT_SC_TIME_MILLISECS = $01000000;

  MIXERCONTROL_CT_SC_LIST_SINGLE = $00000000;
  MIXERCONTROL_CT_SC_LIST_MULTIPLE = $01000000;

  MIXERCONTROL_CT_UNITS_MASK = $00FF0000;
  MIXERCONTROL_CT_UNITS_CUSTOM = $00000000;
  MIXERCONTROL_CT_UNITS_BOOLEAN = $00010000;
  MIXERCONTROL_CT_UNITS_SIGNED = $00020000;
  MIXERCONTROL_CT_UNITS_UNSIGNED = $00030000;
  MIXERCONTROL_CT_UNITS_DECIBELS = $00040000;  { in 10ths }
  MIXERCONTROL_CT_UNITS_PERCENT = $00050000;  { in 10ths }


  {  Commonly used control types for specifying MIXERCONTROL.dwControlType }

const

  MIXERCONTROL_CONTROLTYPE_CUSTOM = (MIXERCONTROL_CT_CLASS_CUSTOM or MIXERCONTROL_CT_UNITS_CUSTOM);
  MIXERCONTROL_CONTROLTYPE_BOOLEANMETER = (MIXERCONTROL_CT_CLASS_METER or MIXERCONTROL_CT_SC_METER_POLLED or MIXERCONTROL_CT_UNITS_BOOLEAN);
  MIXERCONTROL_CONTROLTYPE_SIGNEDMETER = (MIXERCONTROL_CT_CLASS_METER or MIXERCONTROL_CT_SC_METER_POLLED or MIXERCONTROL_CT_UNITS_SIGNED);
  MIXERCONTROL_CONTROLTYPE_PEAKMETER = (MIXERCONTROL_CONTROLTYPE_SIGNEDMETER + 1);
  MIXERCONTROL_CONTROLTYPE_UNSIGNEDMETER = (MIXERCONTROL_CT_CLASS_METER or MIXERCONTROL_CT_SC_METER_POLLED or MIXERCONTROL_CT_UNITS_UNSIGNED);
  MIXERCONTROL_CONTROLTYPE_BOOLEAN = (MIXERCONTROL_CT_CLASS_SWITCH or MIXERCONTROL_CT_SC_SWITCH_BOOLEAN or MIXERCONTROL_CT_UNITS_BOOLEAN);
  MIXERCONTROL_CONTROLTYPE_ONOFF = (MIXERCONTROL_CONTROLTYPE_BOOLEAN + 1);
  MIXERCONTROL_CONTROLTYPE_MUTE = (MIXERCONTROL_CONTROLTYPE_BOOLEAN + 2);
  MIXERCONTROL_CONTROLTYPE_MONO = (MIXERCONTROL_CONTROLTYPE_BOOLEAN + 3);
  MIXERCONTROL_CONTROLTYPE_LOUDNESS = (MIXERCONTROL_CONTROLTYPE_BOOLEAN + 4);
  MIXERCONTROL_CONTROLTYPE_STEREOENH = (MIXERCONTROL_CONTROLTYPE_BOOLEAN + 5);
  MIXERCONTROL_CONTROLTYPE_BASS_BOOST = (MIXERCONTROL_CONTROLTYPE_BOOLEAN + $00002277);
  MIXERCONTROL_CONTROLTYPE_BUTTON = (MIXERCONTROL_CT_CLASS_SWITCH or MIXERCONTROL_CT_SC_SWITCH_BUTTON or MIXERCONTROL_CT_UNITS_BOOLEAN);
  MIXERCONTROL_CONTROLTYPE_DECIBELS = (MIXERCONTROL_CT_CLASS_NUMBER or MIXERCONTROL_CT_UNITS_DECIBELS);
  MIXERCONTROL_CONTROLTYPE_SIGNED = (MIXERCONTROL_CT_CLASS_NUMBER or MIXERCONTROL_CT_UNITS_SIGNED);
  MIXERCONTROL_CONTROLTYPE_UNSIGNED = (MIXERCONTROL_CT_CLASS_NUMBER or MIXERCONTROL_CT_UNITS_UNSIGNED);
  MIXERCONTROL_CONTROLTYPE_PERCENT = (MIXERCONTROL_CT_CLASS_NUMBER or MIXERCONTROL_CT_UNITS_PERCENT);
  MIXERCONTROL_CONTROLTYPE_SLIDER = (MIXERCONTROL_CT_CLASS_SLIDER or MIXERCONTROL_CT_UNITS_SIGNED);
  MIXERCONTROL_CONTROLTYPE_PAN = (MIXERCONTROL_CONTROLTYPE_SLIDER + 1);
  MIXERCONTROL_CONTROLTYPE_QSOUNDPAN = (MIXERCONTROL_CONTROLTYPE_SLIDER + 2);
  MIXERCONTROL_CONTROLTYPE_FADER = (MIXERCONTROL_CT_CLASS_FADER or MIXERCONTROL_CT_UNITS_UNSIGNED);
  MIXERCONTROL_CONTROLTYPE_VOLUME = (MIXERCONTROL_CONTROLTYPE_FADER + 1);
  MIXERCONTROL_CONTROLTYPE_BASS = (MIXERCONTROL_CONTROLTYPE_FADER + 2);
  MIXERCONTROL_CONTROLTYPE_TREBLE = (MIXERCONTROL_CONTROLTYPE_FADER + 3);
  MIXERCONTROL_CONTROLTYPE_EQUALIZER = (MIXERCONTROL_CONTROLTYPE_FADER + 4);
  MIXERCONTROL_CONTROLTYPE_SINGLESELECT = (MIXERCONTROL_CT_CLASS_LIST or MIXERCONTROL_CT_SC_LIST_SINGLE or MIXERCONTROL_CT_UNITS_BOOLEAN);
  MIXERCONTROL_CONTROLTYPE_MUX = (MIXERCONTROL_CONTROLTYPE_SINGLESELECT + 1);
  MIXERCONTROL_CONTROLTYPE_MULTIPLESELECT = (MIXERCONTROL_CT_CLASS_LIST or MIXERCONTROL_CT_SC_LIST_MULTIPLE or MIXERCONTROL_CT_UNITS_BOOLEAN);
  MIXERCONTROL_CONTROLTYPE_MIXER = (MIXERCONTROL_CONTROLTYPE_MULTIPLESELECT + 1);
  MIXERCONTROL_CONTROLTYPE_MICROTIME = (MIXERCONTROL_CT_CLASS_TIME or MIXERCONTROL_CT_SC_TIME_MICROSECS or MIXERCONTROL_CT_UNITS_UNSIGNED);
  MIXERCONTROL_CONTROLTYPE_MILLITIME = (MIXERCONTROL_CT_CLASS_TIME or MIXERCONTROL_CT_SC_TIME_MILLISECS or MIXERCONTROL_CT_UNITS_UNSIGNED);


  {  MIXERLINECONTROLS }

type

  PMIXERLINECONTROLSA = ^tagMIXERLINECONTROLSA;

  tagMIXERLINECONTROLSA = record

    cbStruct: DWORD;                    { size in bytes of MIXERLINECONTROLS }
    dwLineID: DWORD;                    { line id (from MIXERLINE.dwLineID) }

    case Integer of
      0: (dwControlID: DWORD);          { MIXER_GETLINECONTROLSF_ONEBYID }
      1: (dwControlType: DWORD;         { MIXER_GETLINECONTROLSF_ONEBYTYPE }
        cControls: DWORD;             { count of controls pmxctrl points to }
        cbmxctrl: DWORD;              { size in bytes of _one_ MIXERCONTROL }
        pamxctrl: LPMIXERCONTROLA);   { pointer to first MIXERCONTROL array }
  end;
  MIXERLINECONTROLSA = tagMIXERLINECONTROLSA;
  LPMIXERLINECONTROLSA = ^tagMIXERLINECONTROLSA;

  PMIXERLINECONTROLSW = ^tagMIXERLINECONTROLSW;

  tagMIXERLINECONTROLSW = record

    cbStruct: DWORD;                   { size in bytes of MIXERLINECONTROLS }
    dwLineID: DWORD;                   { line id (from MIXERLINE.dwLineID) }

    case Integer of
      0: (dwControlID: DWORD);          { MIXER_GETLINECONTROLSF_ONEBYID }
      1: (dwControlType: DWORD;         { MIXER_GETLINECONTROLSF_ONEBYTYPE }
        cControls: DWORD;             { count of controls pmxctrl points to }
        cbmxctrl: DWORD;              { size in bytes of _one_ MIXERCONTROL }
        pamxctrl: LPMIXERCONTROLW);   { pointer to first MIXERCONTROL array }
  end;
  MIXERLINECONTROLSW = tagMIXERLINECONTROLSW;
  LPMIXERLINECONTROLSW = ^tagMIXERLINECONTROLSW;

  { Delphi }
  MIXERLINECONTROLS = tagMIXERLINECONTROLSW;
  PMIXERLINECONTROLS = ^tagMIXERLINECONTROLSW;
  LPMIXERLINECONTROLS = ^tagMIXERLINECONTROLSW;


function mixerGetLineControlsA({_In_opt_} hmxobj: HMIXEROBJ;
  {_Inout_} pmxlc: LPMIXERLINECONTROLSA;
                               fdwControls: DWORD): MMRESULT; stdcall;

function mixerGetLineControlsW({_In_opt_} hmxobj: HMIXEROBJ;
  {_Inout_} pmxlc: LPMIXERLINECONTROLSW;
                               fdwControls: DWORD): MMRESULT; stdcall;

{ Delphi }
function mixerGetLineControls({_In_opt_} hmxobj: HMIXEROBJ;
  {_Inout_} pmxlc: LPMIXERLINECONTROLSW;
                              fdwControls: DWORD): MMRESULT; stdcall;

const

  MIXER_GETLINECONTROLSF_ALL = $00000000;
  MIXER_GETLINECONTROLSF_ONEBYID = $00000001;
  MIXER_GETLINECONTROLSF_ONEBYTYPE = $00000002;

  MIXER_GETLINECONTROLSF_QUERYMASK = $0000000F;

type

  PMIXERCONTROLDETAILS = ^tMIXERCONTROLDETAILS;

  tMIXERCONTROLDETAILS = record

    cbStruct: DWORD;                   { size in bytes of MIXERCONTROLDETAILS }
    dwControlID: DWORD;                { control id to get/set details on }
    cChannels: DWORD;                  { number of channels in paDetails array }

    case Integer of
      0: (hwndOwner: HWND;             { for MIXER_SETCONTROLDETAILSF_CUSTOM }
        cbDetails: DWORD;            { size of _one_ details_XX struct }
        paDetails: Pointer);         { pointer to array of details_XX structs }

      1: (cMultipleItems: DWORD);      { if _MULTIPLE, the number of items per channel }
  end;
  MIXERCONTROLDETAILS = tMIXERCONTROLDETAILS;
  LPMIXERCONTROLDETAILS = ^tMIXERCONTROLDETAILS;


  {  MIXER_GETCONTROLDETAILSF_LISTTEXT }

type

  PMIXERCONTROLDETAILS_LISTTEXTA = ^tagMIXERCONTROLDETAILS_LISTTEXTA;

  tagMIXERCONTROLDETAILS_LISTTEXTA = record
    dwParam1: DWORD;
    dwParam2: DWORD;
    szName: array[0..MIXER_LONG_NAME_CHARS - 1] of AnsiChar;
  end;
  MIXERCONTROLDETAILS_LISTTEXTA = tagMIXERCONTROLDETAILS_LISTTEXTA;
  LPMIXERCONTROLDETAILS_LISTTEXTA = ^tagMIXERCONTROLDETAILS_LISTTEXTA;

  PMIXERCONTROLDETAILS_LISTTEXTW = ^tagMIXERCONTROLDETAILS_LISTTEXTW;

  tagMIXERCONTROLDETAILS_LISTTEXTW = record
    dwParam1: DWORD;
    dwParam2: DWORD;
    szName: array[0..MIXER_LONG_NAME_CHARS - 1] of WideChar;
  end;
  MIXERCONTROLDETAILS_LISTTEXTW = tagMIXERCONTROLDETAILS_LISTTEXTW;
  LPMIXERCONTROLDETAILS_LISTTEXTW = ^tagMIXERCONTROLDETAILS_LISTTEXTW;

  { Delphi }
  MIXERCONTROLDETAILS_LISTTEXT = tagMIXERCONTROLDETAILS_LISTTEXTW;
  PMIXERCONTROLDETAILS_LISTTEXT = ^tagMIXERCONTROLDETAILS_LISTTEXTW;
  LPMIXERCONTROLDETAILS_LISTTEXT = ^tagMIXERCONTROLDETAILS_LISTTEXTW;


  { MIXER_GETCONTROLDETAILSF_VALUE }

type

  PMIXERCONTROLDETAILS_BOOLEAN = ^tMIXERCONTROLDETAILS_BOOLEAN;

  tMIXERCONTROLDETAILS_BOOLEAN = record
    fValue: LONG;
  end;
  MIXERCONTROLDETAILS_BOOLEAN = tMIXERCONTROLDETAILS_BOOLEAN;
  LPMIXERCONTROLDETAILS_BOOLEAN = ^tMIXERCONTROLDETAILS_BOOLEAN;


  PMIXERCONTROLDETAILS_SIGNED = ^tMIXERCONTROLDETAILS_SIGNED;

  tMIXERCONTROLDETAILS_SIGNED = record
    lValue: LONG;
  end;
  MIXERCONTROLDETAILS_SIGNED = tMIXERCONTROLDETAILS_SIGNED;
  LPMIXERCONTROLDETAILS_SIGNED = ^tMIXERCONTROLDETAILS_SIGNED;


  PMIXERCONTROLDETAILS_UNSIGNED = ^tMIXERCONTROLDETAILS_UNSIGNED;

  tMIXERCONTROLDETAILS_UNSIGNED = record
    dwValue: DWORD;
  end;
  MIXERCONTROLDETAILS_UNSIGNED = tMIXERCONTROLDETAILS_UNSIGNED;
  LPMIXERCONTROLDETAILS_UNSIGNED = ^tMIXERCONTROLDETAILS_UNSIGNED;


function mixerGetControlDetailsA({_In_opt_} hmxobj: HMIXEROBJ;
  {_Inout_} pmxcd: LPMIXERCONTROLDETAILS;
                                 fdwDetails: DWORD): MMRESULT; stdcall;

function mixerGetControlDetailsW({_In_opt_} hmxobj: HMIXEROBJ;
  {_Inout_} pmxcd: LPMIXERCONTROLDETAILS;
                                 fdwDetails: DWORD): MMRESULT; stdcall;

{ Delphi }
function mixerGetControlDetails({_In_opt_} hmxobj: HMIXEROBJ;
  {_Inout_} pmxcd: LPMIXERCONTROLDETAILS;
                                fdwDetails: DWORD): MMRESULT; stdcall;

const

  MIXER_GETCONTROLDETAILSF_VALUE = $00000000;
  MIXER_GETCONTROLDETAILSF_LISTTEXT = $00000001;

  MIXER_GETCONTROLDETAILSF_QUERYMASK = $0000000F;


function mixerSetControlDetails({_In_opt_} hmxobj: HMIXEROBJ;
                                pmxcd: LPMIXERCONTROLDETAILS;
                                fdwDetails: DWORD): MMRESULT; stdcall;

const

  MIXER_SETCONTROLDETAILSF_VALUE = $00000000;
  MIXER_SETCONTROLDETAILSF_CUSTOM = $00000001;

  MIXER_SETCONTROLDETAILSF_QUERYMASK = $0000000F;


  // Additional Prototypes for ALL interfaces

  // End of Additional Prototypes

implementation

const
  MMeApiLib = 'winmm.dll';


function MEVT_EVENTTYPE(x: DWORD): DWORD;

begin

  Result := ((byte(x) shr 24) and $FF);
end;


function MEVT_EVENTPARM(x: DWORD): DWORD;

begin

  Result := DWORD(x) and $00FFFFFF;
end;

function waveOutGetNumDevs; external MMeApiLib name 'waveOutGetNumDevs';

function waveOutGetDevCapsA; external MMeApiLib name 'waveOutGetDevCapsA';
function waveOutGetDevCapsW; external MMeApiLib name 'waveOutGetDevCapsW';
function waveOutGetDevCaps; external MMeApiLib name 'waveOutGetDevCapsW';

function waveOutGetVolume; external MMeApiLib name 'waveOutGetVolume';
function waveOutSetVolume; external MMeApiLib name 'waveOutSetVolume';

function waveOutGetErrorTextA; external MMeApiLib name 'waveOutGetErrorTextA';
function waveOutGetErrorTextW; external MMeApiLib name 'waveOutGetErrorTextW';
function waveOutGetErrorText; external MMeApiLib name 'waveOutGetErrorTextW';

function waveOutOpen; external MMeApiLib name 'waveOutOpen';
function waveOutClose; external MMeApiLib name 'waveOutClose';

function waveOutPrepareHeader; external MMeApiLib name 'waveOutPrepareHeader';
function waveOutUnprepareHeader; external MMeApiLib name 'waveOutUnprepareHeader';

function waveOutWrite; external MMeApiLib name 'waveOutWrite';
function waveOutPause; external MMeApiLib name 'waveOutPause';
function waveOutRestart; external MMeApiLib name 'waveOutRestart';
function waveOutReset; external MMeApiLib name 'waveOutReset';
function waveOutBreakLoop; external MMeApiLib name 'waveOutBreakLoop';
function waveOutGetPosition; external MMeApiLib name 'waveOutGetPosition';
function waveOutGetPitch; external MMeApiLib name 'waveOutGetPitch';
function waveOutSetPitch; external MMeApiLib name 'waveOutSetPitch';
function waveOutGetPlaybackRate; external MMeApiLib name 'waveOutGetPlaybackRate';
function waveOutSetPlaybackRate; external MMeApiLib name 'waveOutSetPlaybackRate';

function waveOutGetID; external MMeApiLib name 'waveOutGetID';
function waveOutMessage; external MMeApiLib name 'waveOutMessage';
function waveInGetNumDevs; external MMeApiLib name 'waveInGetNumDevs';

function waveInGetDevCapsA; external MMeApiLib name 'waveInGetDevCapsA';
function waveInGetDevCapsW; external MMeApiLib name 'waveInGetDevCapsW';
function waveInGetDevCaps; external MMeApiLib name 'waveInGetDevCapsW';

function waveInGetErrorTextA; external MMeApiLib name 'waveInGetErrorTextA';
function waveInGetErrorTextW; external MMeApiLib name 'waveInGetErrorTextW';
function waveInGetErrorText; external MMeApiLib name 'waveInGetErrorTextW';

function waveInOpen; external MMeApiLib name 'waveInOpen';
function waveInClose; external MMeApiLib name 'waveInClose';

function waveInPrepareHeader; external MMeApiLib name 'waveInPrepareHeader';
function waveInUnprepareHeader; external MMeApiLib name 'waveInUnprepareHeader';
function waveInAddBuffer; external MMeApiLib name 'waveInAddBuffer';

function waveInStart; external MMeApiLib name 'waveInStart';
function waveInStop; external MMeApiLib name 'waveInStop';
function waveInReset; external MMeApiLib name 'waveInReset';
function waveInGetPosition; external MMeApiLib name 'waveInGetPosition';
function waveInGetID; external MMeApiLib name 'waveInGetID';
function waveInMessage; external MMeApiLib name 'waveInMessage';

function midiOutGetNumDevs; external MMeApiLib name 'midiOutGetNumDevs';
function midiStreamOpen; external MMeApiLib name 'midiStreamOpen';
function midiStreamClose; external MMeApiLib name 'midiStreamClose';
function midiStreamProperty; external MMeApiLib name 'midiStreamProperty';
function midiStreamPosition; external MMeApiLib name 'midiStreamPosition';
function midiStreamOut; external MMeApiLib name 'midiStreamOut';
function midiStreamPause; external MMeApiLib name 'midiStreamPause';
function midiStreamRestart; external MMeApiLib name 'midiStreamRestart';
function midiStreamStop; external MMeApiLib name 'midiStreamStop';
function midiConnect; external MMeApiLib name 'midiConnect';
function midiDisconnect; external MMeApiLib name 'midiDisconnect';

function midiOutGetDevCapsA; external MMeApiLib name 'midiOutGetDevCapsA';
function midiOutGetDevCapsW; external MMeApiLib name 'midiOutGetDevCapsW';
function midiOutGetDevCaps; external MMeApiLib name 'midiOutGetDevCapsW';

function midiOutGetVolume; external MMeApiLib name 'midiOutGetVolume';
function midiOutSetVolume; external MMeApiLib name 'midiOutSetVolume';

function midiOutGetErrorTextA; external MMeApiLib name 'midiOutGetErrorTextA';
function midiOutGetErrorTextW; external MMeApiLib name 'midiOutGetErrorTextW';
function midiOutGetErrorText; external MMeApiLib name 'midiOutGetErrorTextW';

function midiOutOpen; external MMeApiLib name 'midiOutOpen';
function midiOutClose; external MMeApiLib name 'midiOutClose';
function midiOutPrepareHeader; external MMeApiLib name 'midiOutPrepareHeader';
function midiOutUnprepareHeader; external MMeApiLib name 'midiOutUnprepareHeader';
function midiOutShortMsg; external MMeApiLib name 'midiOutShortMsg';
function midiOutLongMsg; external MMeApiLib name 'midiOutLongMsg';
function midiOutReset; external MMeApiLib name 'midiOutReset';
function midiOutCachePatches; external MMeApiLib name 'midiOutCachePatches';
function midiOutCacheDrumPatches; external MMeApiLib name 'midiOutCacheDrumPatches';
function midiOutGetID; external MMeApiLib name 'midiOutGetID';
function midiOutMessage; external MMeApiLib name 'midiOutMessage';
function midiInGetNumDevs; external MMeApiLib name 'midiInGetNumDevs';

function midiInGetDevCapsA; external MMeApiLib name 'midiInGetDevCapsA';
function midiInGetDevCapsW; external MMeApiLib name 'midiInGetDevCapsW';
function midiInGetDevCaps; external MMeApiLib name 'midiInGetDevCapsW';

function midiInGetErrorTextA; external MMeApiLib name 'midiInGetErrorTextA';
function midiInGetErrorTextW; external MMeApiLib name 'midiInGetErrorTextW';
function midiInGetErrorText; external MMeApiLib name 'midiInGetErrorTextW';

function midiInOpen; external MMeApiLib name 'midiInOpen';
function midiInClose; external MMeApiLib name 'midiInClose';
function midiInPrepareHeader; external MMeApiLib name 'midiInPrepareHeader';
function midiInUnprepareHeader; external MMeApiLib name 'midiInUnprepareHeader';
function midiInAddBuffer; external MMeApiLib name 'midiInAddBuffer';

function midiInStart; external MMeApiLib name 'midiInStart';
function midiInStop; external MMeApiLib name 'midiInStop';
function midiInReset; external MMeApiLib name 'midiInReset';
function midiInGetID; external MMeApiLib name 'midiInGetID';
function midiInMessage; external MMeApiLib name 'midiInMessage';

function auxGetNumDevs; external MMeApiLib name 'auxGetNumDevs';

function auxGetDevCapsA; external MMeApiLib name 'auxGetDevCapsA';
function auxGetDevCapsW; external MMeApiLib name 'auxGetDevCapsW';
function auxGetDevCaps; external MMeApiLib name 'auxGetDevCapsW';

function auxSetVolume; external MMeApiLib name 'auxSetVolume';
function auxGetVolume; external MMeApiLib name 'auxGetVolume';
function auxOutMessage; external MMeApiLib name 'auxOutMessage';

function mixerGetNumDevs; external MMeApiLib name 'mixerGetNumDevs';
function mixerGetDevCapsA; external MMeApiLib name 'mixerGetDevCapsA';
function mixerGetDevCapsW; external MMeApiLib name 'mixerGetDevCapsW';
function mixerGetDevCaps; external MMeApiLib name 'mixerGetDevCapsW';

function mixerOpen; external MMeApiLib name 'mixerOpen';
function mixerClose; external MMeApiLib name 'mixerClose';
function mixerMessage; external MMeApiLib name 'mixerMessage';

function mixerGetLineInfoA; external MMeApiLib name 'mixerGetLineInfoA';
function mixerGetLineInfoW; external MMeApiLib name 'mixerGetLineInfoW';
function mixerGetLineInfo; external MMeApiLib name 'mixerGetLineInfoW';

function mixerGetID; external MMeApiLib name 'mixerGetID';

function mixerGetLineControlsA; external MMeApiLib name 'mixerGetLineControlsA';
function mixerGetLineControlsW; external MMeApiLib name 'mixerGetLineControlsW';
function mixerGetLineControls; external MMeApiLib name 'mixerGetLineControlsW';

function mixerGetControlDetailsA; external MMeApiLib name 'mixerGetControlDetailsA';
function mixerGetControlDetailsW; external MMeApiLib name 'mixerGetControlDetailsW';
function mixerGetControlDetails; external MMeApiLib name 'mixerGetControlDetailsW';

function mixerSetControlDetails; external MMeApiLib name 'mixerSetControlDetails';

// Implement Additional Prototypes here.

end.
