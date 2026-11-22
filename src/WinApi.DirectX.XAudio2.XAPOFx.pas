// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: WinApi.DirectX - XAudio2
// Project location: https://sourceforge.net/projects/MFPack
// Module: WinApi.DirectX.XAudio2.XAPOFx.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 07-07-2018
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: Cross-platform Audio Processing Objects
// Declarations for the audio effects included with XAudio2.
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
// Remarks: This version of XAudio2 is available only in Windows 8, XBox one and later.
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
// Source: xapofx.h
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
unit WinApi.DirectX.XAudio2.XAPOFx;

{$I MfPack.Fpc.inc}


interface

uses

  {WinApi}
  Windows,
  WinApi.WinApiTypes;

  {$PACKENUM 4}

  {$IFDEF WIN32}
    {$ALIGN 1}
  {$ELSE}
  {$ALIGN 8}
  // Win64
  {$ENDIF}

  {$I 'XAudio2.inc'}


  //--------------<D-E-F-I-N-I-T-I-O-N-S>-------------------------------------//


  // FX class IDs

const

  IID_FXEQ: TGUID = '{F5E01117-D6C4-485A-A3F5-695196F3DBFA}';
  IID_FXMasteringLimiter: TGUID = '{C4137916-2BE1-46FD-8599-441536F49856}';
  IID_FXReverb: TGUID = '{7D9ACA56-CB68-4807-B632-B137352E8596}';
  IID_FXEcho: TGUID = '{5039D740-F736-449A-84D3-A56202557B87}';


  CLSID_FXEQ: TGUID = '{F5E01117-D6C4-485A-A3F5-695196F3DBFA}';
  CLSID_FXMasteringLimiter: TGUID = '{C4137916-2BE1-46FD-8599-441536F49856}';
  CLSID_FXReverb: TGUID = '{7D9ACA56-CB68-4807-B632-B137352E8596}';
  CLSID_FXEcho: TGUID = '{5039D740-F736-449A-84D3-A56202557B87}';

  // EQ parameter bounds (inclusive), used with FXEQ:
  FXEQ_MIN_FRAMERATE = 22000;
  FXEQ_MAX_FRAMERATE = 48000;

  FXEQ_MIN_FREQUENCY_CENTER = 20.0;
  FXEQ_MAX_FREQUENCY_CENTER = 20000.0;
  FXEQ_DEFAULT_FREQUENCY_CENTER_0 = 100.0;    // band 0
  FXEQ_DEFAULT_FREQUENCY_CENTER_1 = 800.0;    // band 1
  FXEQ_DEFAULT_FREQUENCY_CENTER_2 = 2000.0;   // band 2
  FXEQ_DEFAULT_FREQUENCY_CENTER_3 = 10000.0;  // band 3

  FXEQ_MIN_GAIN = 0.126;  // -18dB
  FXEQ_MAX_GAIN = 7.94;   // +18dB
  FXEQ_DEFAULT_GAIN = 1.0;    // 0dB change, all bands

  FXEQ_MIN_BANDWIDTH = 0.1;
  FXEQ_MAX_BANDWIDTH = 2.0;
  FXEQ_DEFAULT_BANDWIDTH = 1.0;  // all bands


  // Mastering limiter parameter bounds (inclusive), used with FXMasteringLimiter:
  FXMASTERINGLIMITER_MIN_RELEASE = 1;
  FXMASTERINGLIMITER_MAX_RELEASE = 20;
  FXMASTERINGLIMITER_DEFAULT_RELEASE = 6;

  FXMASTERINGLIMITER_MIN_LOUDNESS = 1;
  FXMASTERINGLIMITER_MAX_LOUDNESS = 1800;
  FXMASTERINGLIMITER_DEFAULT_LOUDNESS = 1000;


  // Reverb parameter bounds (inclusive), used with FXReverb:
  FXREVERB_MIN_DIFFUSION = 0.0;
  FXREVERB_MAX_DIFFUSION = 1.0;
  FXREVERB_DEFAULT_DIFFUSION = 0.9;

  FXREVERB_MIN_ROOMSIZE = 0.0001;
  FXREVERB_MAX_ROOMSIZE = 1.0;
  FXREVERB_DEFAULT_ROOMSIZE = 0.6;


  // Echo initialization data/parameter bounds (inclusive), used with FXEcho:
  FXECHO_MIN_WETDRYMIX = 0.0;
  FXECHO_MAX_WETDRYMIX = 1.0;
  FXECHO_DEFAULT_WETDRYMIX = 0.5;

  FXECHO_MIN_FEEDBACK = 0.0;
  FXECHO_MAX_FEEDBACK = 1.0;
  FXECHO_DEFAULT_FEEDBACK = 0.5;

  FXECHO_MIN_DELAY = 1.0;
  FXECHO_MAX_DELAY = 2000.0;
  FXECHO_DEFAULT_DELAY = 500.0;


  //--------------<D-A-T-A---T-Y-P-E-S>---------------------------------------//
  // #pragma pack(push, 1) // set packing alignment to ensure consistency across arbitrary build environments
  // Within Delphi the default alignment is 8 bytes (quad word), unless the project alignment settings are changed.
  // Disable field aligned. All record and class structures will be packed.
  {$ALIGN 1}


type
  // EQ parameters (4 bands), used with IXAPOParameters.SetParameters:
  // The EQ supports only FLOAT32 audio foramts.
  // The framerate must be within [22000, 48000] Hz.
  PFXEQ_PARAMETERS = ^FXEQ_PARAMETERS;

  FXEQ_PARAMETERS = record
    FrequencyCenter0: Single;        // Center frequency in Hz, band 0.
    Gain0: Single;                   // Boost/cut
    Bandwidth0: Single;              // Bandwidth, region of EQ is center frequency +/- bandwidth/2.
    FrequencyCenter1: Single;        // Band 1.
    Gain1: Single;
    Bandwidth1: Single;
    FrequencyCenter2: Single;        // Band 2.
    Gain2: Single;
    Bandwidth2: Single;
    FrequencyCenter3: Single;        // Band 3.
    Gain3: Single;
    Bandwidth3: Single;
  end;


  // Mastering limiter parameters, used with IXAPOParameters.SetParameters:
  // The mastering limiter supports only FLOAT32 audio formats.
  PFXMASTERINGLIMITER_PARAMETERS = ^FXMASTERINGLIMITER_PARAMETERS;

  FXMASTERINGLIMITER_PARAMETERS = record
    Release: UINT32;                // Release time (tuning factor with no specific units).
    Loudness: UINT32;               // Loudness target (threshold).
  end;


  // Reverb parameters, used with IXAPOParameters.SetParameters:
  // The reverb supports only FLOAT32 audio formats with the following
  // channel configurations:
  //     Input: Mono   Output: Mono
  //     Input: Stereo Output: Stereo
  PFXREVERB_PARAMETERS = ^FXREVERB_PARAMETERS;

  FXREVERB_PARAMETERS = record
    Diffusion: Single;               // Diffusion.
    RoomSize: Single;                // Room size.
  end;


  // Echo initialization data, used with CreateFX:
  // Use of this structure is optional, the default MaxDelay is FXECHO_DEFAULT_DELAY.
  PFXECHO_INITDATA = ^FXECHO_INITDATA;

  FXECHO_INITDATA = record
    MaxDelay: Single;               // Maximum delay (all channels) in milliseconds, must be within [FXECHO_MIN_DELAY, FXECHO_MAX_DELAY].
  end;


  // Echo parameters, used with IXAPOParameters.SetParameters:
  // The echo supports only FLOAT32 audio formats.
  PFXECHO_PARAMETERS = ^FXECHO_PARAMETERS;

  FXECHO_PARAMETERS = record
    WetDryMix: Single;               // Ratio of wet (processed) signal to dry (original) signal.
    Feedback: Single;                // aAmount of output fed back into input.
    Delay: Single;                   // Delay (all channels) in milliseconds, must be within [FXECHO_MIN_DELAY, FXECHO_PARAMETERS.MaxDelay].
  end;


  //--------------<F-U-N-C-T-I-O-N-S>-----------------------------------------//




// creates instance of requested XAPO, use Release to free instance
//  clsid            - ID of the effect to create. Use the __uuidof on the effect class name to get the CLSID for an effect.
//                     For example, IID_FXReverb is the CLSID for the FXReverb effect.
//  pEffect          - [out] Receives a pointer to the created XAPO instance. If CreateFX fails, pEffect is untouched.
//  pInitData        - [in] effect-specific initialization parameters, may be NULL if InitDataByteSize == 0
//  InitDataByteSize - [in] size of pInitData in bytes, may be 0 if pInitData is NULL
//
// Remarks
//  The created XAPO will have a reference count of 1. Client code must call IUnknown.Release after passing the XAPO
//  to XAudio2 to allow XAudio2 to dispose of the XAPO when it is no longer needed.
//  Use IXAudio2.CreateSourceVoice or IXAudio2Voice.SetEffectChain to pass an XAPO to XAudio2.
function CreateFX(const clsid: TGuid;
                  pEffect: PPointer;
                  pInitData: Pointer = nil;
                  InitDataByteSize: UINT32 = 0): HRESULT; cdecl;


//#pragma pack(pop) // revert packing alignment
// set back to default
{$IFDEF WIN32}
    {$ALIGN 1}
{$ELSE}
{$ALIGN 8}
// Win64
{$ENDIF}

//---------------------------------<-EOF->----------------------------------//


// Additional Prototypes for ALL interfaces


// End of Additional Prototypes

implementation


function CreateFX; external XAUDIO2_DLL name 'CreateFX';

// Implement Additional Prototypes here.

end.
