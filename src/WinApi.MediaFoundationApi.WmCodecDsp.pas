// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.MediaFoundationApi.WmCodecDsp.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 25-10-2015
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: Contains the definitions for the speech interfaces.
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
// Related objects: -
// Related projects: MfPack FPC/Lazarus port
// Known Issues: -
//
// Compiler version: FPC 3.2.2 (Windows x64 port baseline)
// SDK version: 10.0.28000.2705
//
// Todo: -
//
// =============================================================================
// Source: wmcodecdsp.h
//
// Copyright (c) Microsoft Corporation. All rights reserved.
// =============================================================================
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
// =============================================================================
unit WinApi.MediaFoundationApi.WmCodecDsp;

{$I MfPack.Fpc.inc}


interface

uses

  {WinApi}
  WinApi.WinApiTypes,
  WinApi.MediaObj,
  {ActiveX}
  WinApi.ActiveX.PropKeyDef,
  {MediaFoundationApi}
  WinApi.MediaFoundationApi.MfError;

  {$PACKENUM 4}

  {$IFDEF WIN32}
    {$ALIGN 1}
  {$ELSE}
  {$ALIGN 8}
  // Win64
  {$ENDIF}

  {$I 'WinApiTypes.inc'}

  // MP43DECD.dll

  // header files for imported files


  // ========================================================================
  //
  //  THIS SOFTWARE HAS BEEN LICENSED FROM MICROSOFT CORPORATION PURSUANT
  //  TO THE TERMS OF AN END USER LICENSE AGREEMENT ("EULA").
  //  PLEASE REFER TO THE TEXT OF THE EULA TO DETERMINE THE RIGHTS TO USE THE SOFTWARE.
  //
  // Copyright (C) Microsoft Corporation, All Rights Reserved.
  //
  // ========================================================================


type
  PWmtPropDatatype = ^TWmtPropDatatype;
  WMT_PROP_DATATYPE = (
    WMT_PROP_TYPE_DWORD = 0,
                       WMT_PROP_TYPE_STRING = 1,
                       WMT_PROP_TYPE_BINARY = 2,
                       WMT_PROP_TYPE_BOOL = 3,
                       WMT_PROP_TYPE_QWORD = 4,
                       WMT_PROP_TYPE_WORD = 5,
                       WMT_PROP_TYPE_GUID = 6
    );
  TWmtPropDatatype = WMT_PROP_DATATYPE;

  ////////////////////////////////////////////////////////////////
  //
  // The Speech code supports the following format property.
  //

const
  //static const WCHAR *g_wszSpeechFormatCaps = L"SpeechFormatCap";
  //static const WCHAR *g_wszWMCPCodecName = L"_CODECNAME";
  //static const WCHAR *g_wszWMCPSupportedVBRModes = L"_SUPPORTEDVBRMODES";

  g_wszSpeechFormatCaps = 'SpeechFormatCap';
  g_wszWMCPCodecName = '_CODECNAME';
  g_wszWMCPSupportedVBRModes = '_SUPPORTEDVBRMODES';


  WM_CODEC_ONEPASS_CBR = 1;
  WM_CODEC_ONEPASS_VBR = 2;
  WM_CODEC_TWOPASS_CBR = 4;
  WM_CODEC_TWOPASS_VBR_UNCONSTRAINED = 8;
  WM_CODEC_TWOPASS_VBR_PEAKCONSTRAINED = 16;


  g_wszWMCPAudioVBRSupported = '_VBRENABLED';
  g_wszWMCPAudioVBRQuality = '_VBRQUALITY';
  g_wszWMCPMaxPasses = '_PASSESRECOMMENDED';
  g_wszWMCPDefaultCrisp = '_DEFAULTCRISP';

type

  // Interface IWMValidate
  // =====================
  //
  IWMValidate = interface(IUnknown)
    ['{CEE3DEF2-3808-414d-BE66-FAFD472210BC}']

    function SetIdentifier(guidValidationID: TGuid): HResult; stdcall;

  end;

  IID_IWMValidate = IWMValidate;


  // Interface IValidateBinding
  // ==========================
  //
  IValidateBinding = interface(IUnknown)
    ['{04A578B2-E778-422a-A805-B3EE54D90BD9}']

    function GetIdentifier(guidLicensorID: TGUID;
                           pbEphemeron: PByte;
                           cbEphemeron: DWORD;
                           out ppbBlobValidationID: PByte;
                           out pcbBlobSize: DWORD): HResult; stdcall;

  end;

  IID_IValidateBinding = IValidateBinding;


  // Interface IWMVideoDecoderHurryup
  // ================================
  //
  IWMVideoDecoderHurryup = interface(IUnknown)
    ['{352bb3bd-2d4d-4323-9e71-dcdcfbd53ca6}']

    function SetHurryup(lHurryup: LONG): HResult; stdcall;

    function GetHurryup(out plHurryup: LONG): HResult; stdcall;

  end;

  IID_IWMVideoDecoderHurryup = IWMVideoDecoderHurryup;


  // Interface IWMVideoForceKeyFrame
  // ===============================
  //
  IWMVideoForceKeyFrame = interface(IUnknown)
    ['{9F8496BE-5B9A-41b9-A9E8-F21CD80596C2}']

    function SetKeyFrame(): HResult; stdcall;

  end;

  IID_IWMVideoForceKeyFrame = IWMVideoForceKeyFrame;


  // Interface IWMCodecStrings
  // =========================
  //
  IWMCodecStrings = interface(IUnknown)
    ['{A7B2504B-E58A-47fb-958B-CAC7165A057D}']

    function GetName(pmt: DMO_MEDIA_TYPE;
                     cchLength: ULONG;
                     var szName: PWideChar;
                     out pcchLength: ULONG): HResult; stdcall;

    function GetDescription(pmt: DMO_MEDIA_TYPE;
                            cchLength: ULONG;
                            var szDescription: PWideChar;
                            out pcchLength: ULONG): HResult; stdcall;
  end;
  // IWMCodecStrings
  IID_IWMCodecStrings = IWMCodecStrings;


  // Interface IWMCodecProps
  // =======================
  //
  IWMCodecProps = interface(IUnknown)
    ['{2573e11a-f01a-4fdd-a98d-63b8e0ba9589}']
    function GetFormatProp(pmt: DMO_MEDIA_TYPE;
                           pszName: PWideChar;
                           out pType: WMT_PROP_DATATYPE;
                           var pValue: PByte;
                           var pdwSize: DWORD): HResult; stdcall;


    function GetCodecProp(dwFormat: DWORD;
                          pszName: PWideChar;
                          out pType: WMT_PROP_DATATYPE;
                          pValue: PByte;
                          var pdwSize: DWORD): HResult; stdcall;
  end;
  // IWMCodecProps
  IID_IWMCodecProps = IWMCodecProps;


  // Interface IWMCodecLeakyBucket
  // =============================
  //
  IWMCodecLeakyBucket = interface(IUnknown)
    ['{A81BA647-6227-43b7-B231-C7B15135DD7D}']

    function SetBufferSizeBits(ulBufferSize: ULONG): HResult; stdcall;

    function GetBufferSizeBits(out pulBufferSize: ULONG): HResult; stdcall;

    function SetBufferFullnessBits(ulBufferFullness: ULONG): HResult; stdcall;

    function GetBufferFullnessBits(out pulBufferFullness: ULONG): HResult; stdcall;

  end;
  // IWMCodecLeakyBucket
  IID_IWMCodecLeakyBucket = IWMCodecLeakyBucket;


  // Interface IWMCodecOutputTimestamp
  // =================================
  //
  IWMCodecOutputTimestamp = interface(IUnknown)
    ['{B72ADF95-7ADC-4a72-BC05-577D8EA6BF68}']

    function GetNextOutputTime(out prtTime: REFERENCE_TIME): HResult; stdcall;

  end;

  IID_IWMCodecOutputTimestamp = IWMCodecOutputTimestamp;


  // Interface IWMVideoDecoderReconBuffer
  // ====================================
  //
  IWMVideoDecoderReconBuffer = interface(IUnknown)
    ['{45BDA2AC-88E2-4923-98BA-3949080711A3}']

    function GetReconstructedVideoFrameSize(out pdwSize: DWORD): HResult; stdcall;

    function GetReconstructedVideoFrame(pBuf: IMediaBuffer): HResult; stdcall;

    function SetReconstructedVideoFrame(pBuf: IMediaBuffer): HResult; stdcall;

  end;

  IID_IWMVideoDecoderReconBuffer = IWMVideoDecoderReconBuffer;


  // Interface IWMCodecPrivateData
  // =============================
  //
  IWMCodecPrivateData = interface(IUnknown)
    ['{73F0BE8E-57F7-4f01-AA66-9F57340CFE0E}']

    function SetPartialOutputType(pmt: DMO_MEDIA_TYPE): HResult; stdcall;

    function GetPrivateData(pbData: PByte;
                            var pcbData: ULONG): HResult; stdcall;

  end;

  IID_IWMCodecPrivateData = IWMCodecPrivateData;


  // Interface IWMSampleExtensionSupport
  // ===================================
  //
  IWMSampleExtensionSupport = interface(IUnknown)
    ['{9bca9884-0604-4c2a-87da-793ff4d586c3}']

    function SetUseSampleExtensions(fUseExtensions: BOOL): HResult; stdcall;

  end;

  IID_IWMSampleExtensionSupport = IWMSampleExtensionSupport;


  PChMtxType = ^ChMtxType;
  ChMtxType = Single;

  // Interface IWMResamplerProps
  // ===========================
  //
  IWMResamplerProps = interface(IUnknown)
    ['{E7E9984F-F09F-4da4-903F-6E2E0EFE56B5}']

    function SetHalfFilterLength(lhalfFilterLen: LONG): HResult; stdcall;

    function SetUserChannelMtx(userChannelMtx: ChMtxType): HResult; stdcall;

  end;

  IID_IWMResamplerProps = IWMResamplerProps;


  // Interface IWMResizerProps
  // ===========================
  //
  IWMResizerProps = interface(IUnknown)
    ['{57665D4C-0414-4faa-905B-10E546F81C33}']

    function SetResizerQuality(lquality: LONG): HResult; stdcall;

    function SetInterlaceMode(lmode: LONG): HResult; stdcall;

    function SetClipRegion(lClipOriXSrc: LONG;
                           lClipOriYSrc: LONG;
                           lClipWidthSrc: LONG;
                           lClipHeightSrc: LONG): HResult; stdcall;

    function SetFullCropRegion(lClipOriXSrc: LONG;
                               lClipOriYSrc: LONG;
                               lClipWidthSrc: LONG;
                               lClipHeightSrc: LONG;
                               lClipOriXDst: LONG;
                               lClipOriYDst: LONG;
                               lClipWidthDst: LONG;
                               lClipHeightDst: LONG): HResult; stdcall;

    function GetFullCropRegion(out lClipOriXSrc: LONG;
                               out lClipOriYSrc: LONG;
                               out lClipWidthSrc: LONG;
                               out lClipHeightSrc: LONG;
                               out lClipOriXDst: LONG;
                               out lClipOriYDst: LONG;
                               out lClipWidthDst: LONG;
                               out lClipHeightDst: LONG): HResult; stdcall;
  end;

  IID_IWMResizerProps = IWMResizerProps;


  // Interface IWMColorLegalizerProps
  // ================================
  //
  IWMColorLegalizerProps = interface(IUnknown)
    ['{776C93B3-B72D-4508-B6D0-208785F553E7}']

    function SetColorLegalizerQuality(lquality: LONG): HResult; stdcall;

  end;

  IID_IWMColorLegalizerProps = IWMColorLegalizerProps;


  // Interface IWMInterlaceProps
  // ===========================
  //
  IWMInterlaceProps = interface(IUnknown)
    ['{7B12E5D1-BD22-48ea-BC06-98E893221C89}']

    function SetProcessType(iProcessType: Integer): HResult; stdcall;

    function SetInitInverseTeleCinePattern(iInitPattern: Integer): HResult; stdcall;

    function SetLastFrame(): HResult; stdcall;

  end;

  IID_IWMInterlaceProps = IWMInterlaceProps;


  // Interface IWMFrameInterpProps
  // =============================
  //
  IWMFrameInterpProps = interface(IUnknown)
    ['{4C06BB9B-626C-4614-8329-CC6A21B93FA0}']

    function SetFrameRateIn(lFrameRate: LONG;
                            lScale: LONG): HResult; stdcall;

    function SetFrameRateOut(lFrameRate: LONG;
                             lScale: LONG): HResult; stdcall;

    function SetFrameInterpEnabled(bFIEnabled: BOOL): HResult; stdcall;

    function SetComplexityLevel(iComplexity: Integer): HResult; stdcall;

  end;

  IID_IWMFrameInterpProps = IWMFrameInterpProps;


  // Interface IWMColorConvProps
  // ===========================
  //
  IWMColorConvProps = interface(IUnknown)
    ['{E6A49E22-C099-421d-AAD3-C061FB4AE85B}']
    function SetMode(const lMode: LONG): HResult; stdcall;

    function SetFullCroppingParam(lSrcCropLeft: LONG;
                                  lSrcCropTop: LONG;
                                  lDstCropLeft: LONG;
                                  lDstCropTop: LONG;
                                  lCropWidth: LONG;
                                  lCropHeight: LONG): HResult; stdcall;
  end;

  IID_IWMColorConvProps = IWMColorConvProps;



const

  MFPKEY_STARTTIME: PROPERTYKEY = (fmtid: (D1: $5cefee10;
    D2: $e210;
    D3: $45c6;
    D4: ($9e,
         $28,
         $f5,
         $a8,
         $73,
         $1c,
         $96,
         $c7));
    pid: $01);
  MFPKEY_STOPTIME: PROPERTYKEY = (fmtid: (D1: $5cefee10;
    D2: $e210;
    D3: $45c6;
    D4: ($9e,
         $28,
         $f5,
         $a8,
         $73,
         $1c,
         $96,
         $c7));
    pid: $02);
  MFPKEY_PROGRESS: PROPERTYKEY = (fmtid: (D1: $5cefee10;
    D2: $e210;
    D3: $45c6;
    D4: ($9e,
         $28,
         $f5,
         $a8,
         $73,
         $1c,
         $96,
         $c7));
    pid: $03);
  MFPKEY_PHANTOMING_ON: PROPERTYKEY = (fmtid: (D1: $12b53cb2;
    D2: $e12e;
    D3: $4579;
    D4: ($8a,
         $c3,
         $d0,
         $2f,
         $94,
         $f1,
         $e8,
         $9e));
    pid: PID_FIRST_USABLE);

  PHANTOMING_ENABLED_KEY_GUID: PROPERTYKEY = (fmtid: (D1: $12b53cb2;
    D2: $e12e;
    D3: $4579;
    D4: ($8a,
         $c3,
         $d0,
         $2f,
         $94,
         $f1,
         $e8,
         $9e));
    pid: PID_FIRST_USABLE);

  MFPKEY_ROOMCORR_PROFILE: PROPERTYKEY = (fmtid: (D1: $f311cdc7;
    D2: $f45f;
    D3: $4eb7;
    D4: ($a8,
         $64,
         $9d,
         $c1,
         $ae,
         $eb,
         $7e,
         $6d));
    pid: PID_FIRST_USABLE);

  ROOM_PROFILE_KEY_GUID: PROPERTYKEY = (fmtid: (D1: $f311cdc7;
    D2: $f45f;
    D3: $4eb7;
    D4: ($a8,
         $64,
         $9d,
         $c1,
         $ae,
         $eb,
         $7e,
         $6d));
    pid: PID_FIRST_USABLE);

  MFPKEY_BASSMGMT_CROSSOVER_FREQ: PROPERTYKEY = (fmtid: (D1: $61e8acb9;
    D2: $f04f;
    D3: $4f40;
    D4: ($a6,
         $5f,
         $8f,
         $49,
         $fa,
         $b3,
         $ba,
         $10));
    pid: PID_FIRST_USABLE);

  CROSSOVER_FREQ_KEY_GUID: PROPERTYKEY = (fmtid: (D1: $61e8acb9;
    D2: $f04f;
    D3: $4f40;
    D4: ($a6,
         $5f,
         $8f,
         $49,
         $fa,
         $b3,
         $ba,
         $10));
    pid: PID_FIRST_USABLE);

  MFPKEY_BASSMGMT_SPKRBASSCONFIG: PROPERTYKEY = (fmtid: (D1: $7bfd170d;
    D2: $4770;
    D3: $4dc5;
    D4: ($92,
         $4d,
         $0b,
         $7b,
         $25,
         $2e,
         $e9,
         $18));
    pid: PID_FIRST_USABLE);

  FULL_RANGE_SPEAKERS_KEY_GUID: PROPERTYKEY = (fmtid: (D1: $7bfd170d;
    D2: $4770;
    D3: $4dc5;
    D4: ($92,
         $4d,
         $0b,
         $7b,
         $25,
         $2e,
         $e9,
         $18));
    pid: PID_FIRST_USABLE);

  MFPKEY_BASSMGMT_BIGROOM: PROPERTYKEY = (fmtid: (D1: $c816a1a7;
    D2: $a119;
    D3: $48a5;
    D4: ($9a,
         $d2,
         $85,
         $45,
         $1f,
         $4b,
         $5a,
         $2e));
    pid: PID_FIRST_USABLE);

  BIG_ROOM_KEY_GUID: PROPERTYKEY = (fmtid: (D1: $c816a1a7;
    D2: $a119;
    D3: $48a5;
    D4: ($9a,
         $d2,
         $85,
         $45,
         $1f,
         $4b,
         $5a,
         $2e));
    pid: PID_FIRST_USABLE);

  MFPKEY_BASSMGMT_NO_SUB: PROPERTYKEY = (fmtid: (D1: $5c3fd32e;
    D2: $0d40;
    D3: $4e2d;
    D4: ($99,
         $fb,
         $c9,
         $1e,
         $96,
         $42,
         $0b,
         $e7));
    pid: PID_FIRST_USABLE);

  NO_SUB_KEY_GUID: PROPERTYKEY = (fmtid: (D1: $5c3fd32e;
    D2: $0d40;
    D3: $4e2d;
    D4: ($99,
         $fb,
         $c9,
         $1e,
         $96,
         $42,
         $0b,
         $e7));
    pid: PID_FIRST_USABLE);

  MFPKEY_BASSMGMT_INVERT_SUB: PROPERTYKEY = (fmtid: (D1: $b1103003;
    D2: $c191;
    D3: $4275;
    D4: ($9f,
         $a0,
         $8c,
         $28,
         $2c,
         $72,
         $4b,
         $ce));
    pid: PID_FIRST_USABLE);

  INVERTED_SUB_KEY_GUID: PROPERTYKEY = (fmtid: (D1: $b1103003;
    D2: $c191;
    D3: $4275;
    D4: ($9f,
         $a0,
         $8c,
         $28,
         $2c,
         $72,
         $4b,
         $ce));
    pid: PID_FIRST_USABLE);

  MFPKEY_CORR_HEADPHONE: PROPERTYKEY = (fmtid: (D1: $445f3559;
    D2: $b43f;
    D3: $4b67;
    D4: ($b0,
         $f8,
         $32,
         $b6,
         $7c,
         $f9,
         $4b,
         $48));
    pid: PID_FIRST_USABLE + 0);

  MFPKEY_CORR_BASS_MANAGEMENT_MODE: PROPERTYKEY = (fmtid: (D1: $1864a4e0;
    D2: $efc1;
    D3: $45e6;
    D4: ($a6,
         $75,
         $57,
         $86,
         $cb,
         $f3,
         $b9,
         $f0));
    pid: PID_FIRST_USABLE);

  BASSMGMT_MODE_KEY_GUID: PROPERTYKEY = (fmtid: (D1: $1864a4e0;
    D2: $efc1;
    D3: $45e6;
    D4: ($a6,
         $75,
         $57,
         $86,
         $cb,
         $f3,
         $b9,
         $f0));
    pid: PID_FIRST_USABLE);

  MFPKEY_CORR_MULTICHANNEL_MODE: PROPERTYKEY = (fmtid: (D1: $1b5c2483;
    D2: $0839;
    D3: $4523;
    D4: ($ba,
         $87,
         $95,
         $f8,
         $9d,
         $27,
         $bd,
         $8c));
    pid: PID_FIRST_USABLE);

  MULTICHANNEL_MODE_KEY_GUID: PROPERTYKEY = (fmtid: (D1: $1b5c2483;
    D2: $0839;
    D3: $4523;
    D4: ($ba,
         $87,
         $95,
         $f8,
         $9d,
         $27,
         $bd,
         $8c));
    pid: PID_FIRST_USABLE);

  MFPKEY_CORR_LOUDNESS_EQUALIZATION_ON: PROPERTYKEY = (fmtid: (D1: $fc52a749;
    D2: $4be9;
    D3: $4510;
    D4: ($89,
         $6e,
         $96,
         $6b,
         $a6,
         $52,
         $59,
         $80));
    pid: PID_FIRST_USABLE);

  LEQ_ENABLED_KEY_GUID: PROPERTYKEY = (fmtid: (D1: $fc52a749;
    D2: $4be9;
    D3: $4510;
    D4: ($89,
         $6e,
         $96,
         $6b,
         $a6,
         $52,
         $59,
         $80));
    pid: PID_FIRST_USABLE);

  MFPKEY_CORR_ROOM_CORRECTION_ON: PROPERTYKEY = (fmtid: (D1: $01fb17e3;
    D2: $796c;
    D3: $4451;
    D4: ($81,
         $63,
         $68,
         $cd,
         $c1,
         $32,
         $1a,
         $60));
    pid: PID_FIRST_USABLE);

  ROOM_CORRECTION_ENABLED_KEY_GUID: PROPERTYKEY = (fmtid: (D1: $01fb17e3;
    D2: $796c;
    D3: $4451;
    D4: ($81,
         $63,
         $68,
         $cd,
         $c1,
         $32,
         $1a,
         $60));
    pid: PID_FIRST_USABLE);

  MFPKEY_CORR_SPKRMASK: PROPERTYKEY = (fmtid: (D1: $d328d8fb;
    D2: $d49f;
    D3: $4aa9;
    D4: ($b7,
         $21,
         $e1,
         $71,
         $e9,
         $3a,
         $d5,
         $63));
    pid: PID_FIRST_USABLE + 5);

  MFPKEY_CORR_NORMALIZATION_GAIN: PROPERTYKEY = (fmtid: (D1: $d61b266c;
    D2: $5aee;
    D3: $456b;
    D4: ($84,
         $24,
         $72,
         $25,
         $47,
         $7d,
         $ae,
         $77));
    pid: PID_FIRST_USABLE + 0);

  MFPKEY_BASS_BOOST_AMOUNT: PROPERTYKEY = (fmtid: (D1: $ae7f0b2a;
    D2: $96fc;
    D3: $493a;
    D4: ($92,
         $47,
         $a0,
         $19,
         $f1,
         $f7,
         $01,
         $e1));
    pid: PID_FIRST_USABLE);

  BOOST_LEVEL_KEY_GUID: PROPERTYKEY = (fmtid: (D1: $ae7f0b2a;
    D2: $96fc;
    D3: $493a;
    D4: ($92,
         $47,
         $a0,
         $19,
         $f1,
         $f7,
         $01,
         $e1));
    pid: PID_FIRST_USABLE);

  MFPKEY_LOUDNESS_EQUALIZATION_RELEASE: PROPERTYKEY = (fmtid: (D1: $9c00eeed;
    D2: $edce;
    D3: $4cd8;
    D4: ($ae,
         $08,
         $cb,
         $05,
         $e8,
         $ef,
         $57,
         $a0));
    pid: PID_FIRST_USABLE);

  LEQ_RELEASE_KEY_GUID: PROPERTYKEY = (fmtid: (D1: $9c00eeed;
    D2: $edce;
    D3: $4cd8;
    D4: ($ae,
         $08,
         $cb,
         $05,
         $e8,
         $ef,
         $57,
         $a0));
    pid: PID_FIRST_USABLE);

  PKEY_SYSFXUI_HIDE_MASK: PROPERTYKEY = (fmtid: (D1: $cb9c6bce;
    D2: $7a25;
    D3: $47aa;
    D4: ($b2,
         $be,
         $6a,
         $d8,
         $44,
         $31,
         $ed,
         $de));
    pid: PID_FIRST_USABLE);


  SYSFXUI_DONOTSHOW_LOUDNESSEQUALIZATION = $01;
  SYSFXUI_DONOTSHOW_ROOMCORRECTION = $02;
  SYSFXUI_DONOTSHOW_BASSMANAGEMENT = $04;
  SYSFXUI_DONOTSHOW_BASSBOOST = $08;
  SYSFXUI_DONOTSHOW_HEADPHONEVIRTUALIZATION = $10;
  SYSFXUI_DONOTSHOW_VIRTUALSURROUND = $20;
  SYSFXUI_DONOTSHOW_SPEAKERFILLING = $40;
  SYSFXUI_DONOTSHOW_CHANNELPHANTOMING = $80;


  MFPKEY_AUVRHP_SKIPHRTFREVERB: PROPERTYKEY = (fmtid: (D1: $30bbfebf;
    D2: $24b4;
    D3: $4198;
    D4: ($89,
         $ba,
         $ad,
         $11,
         $a2,
         $ac,
         $d6,
         $01));
    pid: $01);
  MFPKEY_AUVRHP_SKIPPOSTREVERB: PROPERTYKEY = (fmtid: (D1: $30bbfebf;
    D2: $24b4;
    D3: $4198;
    D4: ($89,
         $ba,
         $ad,
         $11,
         $a2,
         $ac,
         $d6,
         $01));
    pid: $02);
  MFPKEY_AUVRHP_ROOMMODEL: PROPERTYKEY = (fmtid: (D1: $73ae880e;
    D2: $8258;
    D3: $4e57;
    D4: ($b8,
         $5f,
         $7d,
         $aa,
         $6b,
         $7d,
         $5e,
         $f0));
    pid: PID_FIRST_USABLE);

  VIRTUALIZATION_MODE_KEY_GUID: PROPERTYKEY = (fmtid: (D1: $73ae880e;
    D2: $8258;
    D3: $4e57;
    D4: ($b8,
         $5f,
         $7d,
         $aa,
         $6b,
         $7d,
         $5e,
         $f0));
    pid: PID_FIRST_USABLE);

  MFPKEY_AUVRHP_LFWEIGHT: PROPERTYKEY = (fmtid: (D1: $30bbfebf;
    D2: $24b4;
    D3: $4198;
    D4: ($89,
         $ba,
         $ad,
         $11,
         $a2,
         $ac,
         $d6,
         $01));
    pid: $04);
  MFPKEY_AUVRHP_DOHRTFREVERB: PROPERTYKEY = (fmtid: (D1: $30bbfebf;
    D2: $24b4;
    D3: $4198;
    D4: ($89,
         $ba,
         $ad,
         $11,
         $a2,
         $ac,
         $d6,
         $01));
    pid: $05);
  MFPKEY_AUVRHP_DOPOSTREVERB: PROPERTYKEY = (fmtid: (D1: $30bbfebf;
    D2: $24b4;
    D3: $4198;
    D4: ($89,
         $ba,
         $ad,
         $11,
         $a2,
         $ac,
         $d6,
         $01));
    pid: $06);
  MFPKEY_AUVRHP_POSTREVERB_START: PROPERTYKEY = (fmtid: (D1: $30bbfebf;
    D2: $24b4;
    D3: $4198;
    D4: ($89,
         $ba,
         $ad,
         $11,
         $a2,
         $ac,
         $d6,
         $01));
    pid: $07);
  MFPKEY_AUVRHP_POSTREVERB_LEN: PROPERTYKEY = (fmtid: (D1: $30bbfebf;
    D2: $24b4;
    D3: $4198;
    D4: ($89,
         $ba,
         $ad,
         $11,
         $a2,
         $ac,
         $d6,
         $01));
    pid: $08);

  MFPKEY_WMRESAMP_FILTERQUALITY: PROPERTYKEY = (fmtid: (D1: $af1adc73;
    D2: $a210;
    D3: $4b05;
    D4: ($96,
         $6e,
         $54,
         $91,
         $cf,
         $f4,
         $8b,
         $1d));
    pid: $01);
  MFPKEY_WMRESAMP_CHANNELMTX: PROPERTYKEY = (fmtid: (D1: $af1adc73;
    D2: $a210;
    D3: $4b05;
    D4: ($96,
         $6e,
         $54,
         $91,
         $cf,
         $f4,
         $8b,
         $1d));
    pid: $02);
  MFPKEY_WMRESAMP_LOWPASS_BANDWIDTH: PROPERTYKEY = (fmtid: (D1: $af1adc73;
    D2: $a210;
    D3: $4b05;
    D4: ($96,
         $6e,
         $54,
         $91,
         $cf,
         $f4,
         $8b,
         $1d));
    pid: $03);

  MFPKEY_WMAENC_AVGBYTESPERSEC: PROPERTYKEY = (fmtid: (D1: $11caf780;
    D2: $921b;
    D3: $42ef;
    D4: ($b7,
         $55,
         $f3,
         $a0,
         $53,
         $ea,
         $1a,
         $41));
    pid: $00);

  MFPKEY_WMAENC_ORIGWAVEFORMAT: PROPERTYKEY = (fmtid: (D1: $f5c760a2;
    D2: $3635;
    D3: $48e1;
    D4: ($8f,
         $bd,
         $0e,
         $49,
         $81,
         $24,
         $e0,
         $a2));
    pid: $00);

  MFPKEY_PEAKCONSTRAINED: PROPERTYKEY = (fmtid: (D1: $6dbdf03b;
    D2: $b05c;
    D3: $4a03;
    D4: ($8e,
         $c1,
         $bb,
         $e6,
         $3d,
         $b1,
         $0c,
         $b4));
    pid: $00);

  MFPKEY_STAT_RAVG: PROPERTYKEY = (fmtid: (D1: $23a0e3b5;
    D2: $fc62;
    D3: $4ab8;
    D4: ($b7,
         $7c,
         $6e,
         $0c,
         $28,
         $ab,
         $30,
         $16));
    pid: $00);
  MFPKEY_STAT_BAVG: PROPERTYKEY = (fmtid: (D1: $036f6b60;
    D2: $ad43;
    D3: $485c;
    D4: ($86,
         $c6,
         $21,
         $a6,
         $db,
         $2c,
         $1b,
         $a3));
    pid: $00);
  MFPKEY_STAT_RMAX: PROPERTYKEY = (fmtid: (D1: $82ff7c67;
    D2: $6554;
    D3: $4749;
    D4: ($a3,
         $2b,
         $36,
         $90,
         $dd,
         $1a,
         $e8,
         $de));
    pid: $00);
  MFPKEY_STAT_BMAX: PROPERTYKEY = (fmtid: (D1: $cd95e5b7;
    D2: $9143;
    D3: $47fb;
    D4: ($a9,
         $d2,
         $9d,
         $b7,
         $5f,
         $2e,
         $74,
         $be));
    pid: $00);
  MFPKEY_CONSTRAINENCLATENCY: PROPERTYKEY = (fmtid: (D1: $6dbdf03b;
    D2: $b05c;
    D3: $4a03;
    D4: ($8e,
         $c1,
         $bb,
         $e6,
         $3d,
         $b1,
         $0c,
         $b4));
    pid: $00 + 1);
  MFPKEY_CONSTRAINDECLATENCY: PROPERTYKEY = (fmtid: (D1: $6dbdf03b;
    D2: $b05c;
    D3: $4a03;
    D4: ($8e,
         $c1,
         $bb,
         $e6,
         $3d,
         $b1,
         $0c,
         $b4));
    pid: $00 + 2);
  MFPKEY_CONSTRAINENCCOMPLEXITY: PROPERTYKEY = (fmtid: (D1: $6dbdf03b;
    D2: $b05c;
    D3: $4a03;
    D4: ($8e,
         $c1,
         $bb,
         $e6,
         $3d,
         $b1,
         $0c,
         $b4));
    pid: $00 + 3);
  MFPKEY_MAXENCLATENCYMS: PROPERTYKEY = (fmtid: (D1: $6dbdf03b;
    D2: $b05c;
    D3: $4a03;
    D4: ($8e,
         $c1,
         $bb,
         $e6,
         $3d,
         $b1,
         $0c,
         $b4));
    pid: $00 + 4);
  MFPKEY_MAXDECLATENCYMS: PROPERTYKEY = (fmtid: (D1: $6dbdf03b;
    D2: $b05c;
    D3: $4a03;
    D4: ($8e,
         $c1,
         $bb,
         $e6,
         $3d,
         $b1,
         $0c,
         $b4));
    pid: $00 + 5);
  MFPKEY_ENCCOMPLEXITY: PROPERTYKEY = (fmtid: (D1: $6dbdf03b;
    D2: $b05c;
    D3: $4a03;
    D4: ($8e,
         $c1,
         $bb,
         $e6,
         $3d,
         $b1,
         $0c,
         $b4));
    pid: $00 + 6);
  MFPKEY_CHECKDATACONSISTENCY2P: PROPERTYKEY = (fmtid: (D1: $6dbdf03b;
    D2: $b05c;
    D3: $4a03;
    D4: ($8e,
         $c1,
         $bb,
         $e6,
         $3d,
         $b1,
         $0c,
         $b4));
    pid: $00 + 7);
  MFPKEY_AVGCONSTRAINED: PROPERTYKEY = (fmtid: (D1: $6dbdf03b;
    D2: $b05c;
    D3: $4a03;
    D4: ($8e,
         $c1,
         $bb,
         $e6,
         $3d,
         $b1,
         $0c,
         $b4));
    pid: $00 + 8);

  MFPKEY_ENHANCED_WMA: PROPERTYKEY = (fmtid: (D1: $6dbdf03b;
    D2: $b05c;
    D3: $4a03;
    D4: ($8e,
         $c1,
         $bb,
         $e6,
         $3d,
         $b1,
         $0c,
         $b4));
    pid: $00 + 20);
  MFPKEY_REQUESTING_A_FRAMESIZE: PROPERTYKEY = (fmtid: (D1: $6dbdf03b;
    D2: $b05c;
    D3: $4a03;
    D4: ($8e,
         $c1,
         $bb,
         $e6,
         $3d,
         $b1,
         $0c,
         $b4));
    pid: $00 + 21);
  MFPKEY_PREFERRED_FRAMESIZE: PROPERTYKEY = (fmtid: (D1: $6dbdf03b;
    D2: $b05c;
    D3: $4a03;
    D4: ($8e,
         $c1,
         $bb,
         $e6,
         $3d,
         $b1,
         $0c,
         $b4));
    pid: $00 + 22);
  MFPKEY_WMA_ELEMENTARY_STREAM: PROPERTYKEY = (fmtid: (D1: $6dbdf03b;
    D2: $b05c;
    D3: $4a03;
    D4: ($8e,
         $c1,
         $bb,
         $e6,
         $3d,
         $b1,
         $0c,
         $b4));
    pid: $00 + 23);
  MFPKEY_MOST_RECENTLY_ENUMERATED_VBRQUALITY: PROPERTYKEY = (fmtid: (D1: $6dbdf03b;
    D2: $b05c;
    D3: $4a03;
    D4: ($8e,
         $c1,
         $bb,
         $e6,
         $3d,
         $b1,
         $0c,
         $b4));
    pid: $00 + 24);
  MFPKEY_DESIRED_VBRQUALITY: PROPERTYKEY = (fmtid: (D1: $6dbdf03b;
    D2: $b05c;
    D3: $4a03;
    D4: ($8e,
         $c1,
         $bb,
         $e6,
         $3d,
         $b1,
         $0c,
         $b4));
    pid: $00 + 25);
  MFPKEY_CONSTRAIN_ENUMERATED_VBRQUALITY: PROPERTYKEY = (fmtid: (D1: $6dbdf03b;
    D2: $b05c;
    D3: $4a03;
    D4: ($8e,
         $c1,
         $bb,
         $e6,
         $3d,
         $b1,
         $0c,
         $b4));
    pid: $00 + 26);

  MFPKEY_WMAENC_GENERATE_DRC_PARAMS: PROPERTYKEY = (fmtid: (D1: $6dbdf03b;
    D2: $b05c;
    D3: $4a03;
    D4: ($8e,
         $c1,
         $bb,
         $e6,
         $3d,
         $b1,
         $0c,
         $b4));
    pid: $00 + 28);
  MFPKEY_WMAENC_BUFFERLESSCBR: PROPERTYKEY = (fmtid: (D1: $6dbdf03b;
    D2: $b05c;
    D3: $4a03;
    D4: ($8e,
         $c1,
         $bb,
         $e6,
         $3d,
         $b1,
         $0c,
         $b4));
    pid: $00 + 29);
  MFPKEY_WMAENC_RTSPDIF: PROPERTYKEY = (fmtid: (D1: $6dbdf03b;
    D2: $b05c;
    D3: $4a03;
    D4: ($8e,
         $c1,
         $bb,
         $e6,
         $3d,
         $b1,
         $0c,
         $b4));
    pid: $00 + 30);

  MFPKEY_DYN_VBR_RAVG: PROPERTYKEY = (fmtid: (D1: $6dbdf03b;
    D2: $b05c;
    D3: $4a03;
    D4: ($8e,
         $c1,
         $bb,
         $e6,
         $3d,
         $b1,
         $0c,
         $b4));
    pid: $00 + 9);
  MFPKEY_DYN_BANDTRUNCATION: PROPERTYKEY = (fmtid: (D1: $6dbdf03b;
    D2: $b05c;
    D3: $4a03;
    D4: ($8e,
         $c1,
         $bb,
         $e6,
         $3d,
         $b1,
         $0c,
         $b4));
    pid: $00 + 10);
  MFPKEY_DYN_BANDTRUNC_QFLOOR: PROPERTYKEY = (fmtid: (D1: $6dbdf03b;
    D2: $b05c;
    D3: $4a03;
    D4: ($8e,
         $c1,
         $bb,
         $e6,
         $3d,
         $b1,
         $0c,
         $b4));
    pid: $00 + 11);
  MFPKEY_DYN_BANDTRUNC_QCEIL: PROPERTYKEY = (fmtid: (D1: $6dbdf03b;
    D2: $b05c;
    D3: $4a03;
    D4: ($8e,
         $c1,
         $bb,
         $e6,
         $3d,
         $b1,
         $0c,
         $b4));
    pid: $00 + 12);
  MFPKEY_DYN_BANDTRUNC_BWFLOOR: PROPERTYKEY = (fmtid: (D1: $6dbdf03b;
    D2: $b05c;
    D3: $4a03;
    D4: ($8e,
         $c1,
         $bb,
         $e6,
         $3d,
         $b1,
         $0c,
         $b4));
    pid: $00 + 13);
  MFPKEY_DYN_BANDTRUNC_BWCEIL: PROPERTYKEY = (fmtid: (D1: $6dbdf03b;
    D2: $b05c;
    D3: $4a03;
    D4: ($8e,
         $c1,
         $bb,
         $e6,
         $3d,
         $b1,
         $0c,
         $b4));
    pid: $00 + 14);
  MFPKEY_DYN_SIMPLEMASK: PROPERTYKEY = (fmtid: (D1: $6dbdf03b;
    D2: $b05c;
    D3: $4a03;
    D4: ($8e,
         $c1,
         $bb,
         $e6,
         $3d,
         $b1,
         $0c,
         $b4));
    pid: $00 + 15);
  MFPKEY_DYN_STEREO_PREPROC: PROPERTYKEY = (fmtid: (D1: $6dbdf03b;
    D2: $b05c;
    D3: $4a03;
    D4: ($8e,
         $c1,
         $bb,
         $e6,
         $3d,
         $b1,
         $0c,
         $b4));
    pid: $00 + 16);

  MFPKEY_DYN_VBR_BAVG: PROPERTYKEY = (fmtid: (D1: $6dbdf03b;
    D2: $b05c;
    D3: $4a03;
    D4: ($8e,
         $c1,
         $bb,
         $e6,
         $3d,
         $b1,
         $0c,
         $b4));
    pid: $00 + 18);
  MFPKEY_DYN_ALLOW_NOISESUB: PROPERTYKEY = (fmtid: (D1: $6dbdf03b;
    D2: $b05c;
    D3: $4a03;
    D4: ($8e,
         $c1,
         $bb,
         $e6,
         $3d,
         $b1,
         $0c,
         $b4));
    pid: $00 + 19);

  MFPKEY_DYN_ALLOW_PCMRANGELIMITING: PROPERTYKEY = (fmtid: (D1: $6dbdf03b;
    D2: $b05c;
    D3: $4a03;
    D4: ($8e,
         $c1,
         $bb,
         $e6,
         $3d,
         $b1,
         $0c,
         $b4));
    pid: $00 + 27);

  MFPKEY_WMADEC_HIRESOUTPUT: PROPERTYKEY = (fmtid: (D1: $8d3fe592;
    D2: $eecc;
    D3: $4f4e;
    D4: ($9a,
         $ff,
         $5a,
         $f1,
         $67,
         $9d,
         $38,
         $d2));
    pid: $00);
  MFPKEY_WMADEC_SPKRCFG: PROPERTYKEY = (fmtid: (D1: $8fff67be;
    D2: $977f;
    D3: $41dc;
    D4: ($8f,
         $af,
         $23,
         $ba,
         $c9,
         $a6,
         $df,
         $73));
    pid: $00);
  MFPKEY_WMADEC_FOLDDOWN_MATRIX: PROPERTYKEY = (fmtid: (D1: $51647e9b;
    D2: $6a7f;
    D3: $4739;
    D4: ($9e,
         $0b,
         $29,
         $4b,
         $27,
         $89,
         $69,
         $eb));
    pid: $00);

  MFPKEY_WMADEC_DRCMODE: PROPERTYKEY = (fmtid: (D1: $7b613713;
    D2: $3d38;
    D3: $4cda;
    D4: ($aa,
         $61,
         $04,
         $78,
         $b1,
         $bc,
         $fc,
         $42));
    pid: $00);
  MFPKEY_WMADRC_AVGTARGET: PROPERTYKEY = (fmtid: (D1: $7b613713;
    D2: $3d38;
    D3: $4cda;
    D4: ($aa,
         $61,
         $04,
         $78,
         $b1,
         $bc,
         $fc,
         $42));
    pid: $01);
  MFPKEY_WMADRC_PEAKTARGET: PROPERTYKEY = (fmtid: (D1: $7b613713;
    D2: $3d38;
    D3: $4cda;
    D4: ($aa,
         $61,
         $04,
         $78,
         $b1,
         $bc,
         $fc,
         $42));
    pid: $02);
  MFPKEY_WMADRC_AVGREF: PROPERTYKEY = (fmtid: (D1: $7b613713;
    D2: $3d38;
    D3: $4cda;
    D4: ($aa,
         $61,
         $04,
         $78,
         $b1,
         $bc,
         $fc,
         $42));
    pid: $03);
  MFPKEY_WMADRC_PEAKREF: PROPERTYKEY = (fmtid: (D1: $7b613713;
    D2: $3d38;
    D3: $4cda;
    D4: ($aa,
         $61,
         $04,
         $78,
         $b1,
         $bc,
         $fc,
         $42));
    pid: $04);
  MFPKEY_WMADEC_LTRTOUTPUT: PROPERTYKEY = (fmtid: (D1: $7b613713;
    D2: $3d38;
    D3: $4cda;
    D4: ($aa,
         $61,
         $04,
         $78,
         $b1,
         $bc,
         $fc,
         $42));
    pid: $05);


  MFPKEY_WMAVOICE_ENC_MusicSpeechClassMode: PROPERTYKEY = (fmtid: (D1: $d9c8f5fe;
    D2: $8682;
    D3: $4347;
    D4: ($85,
         $7,
         $60,
         $a3,
         $f5,
         $1f,
         $33,
         $f1));
    pid: PID_FIRST_USABLE);
  MFPKEY_WMAVOICE_ENC_BufferWindow: PROPERTYKEY = (fmtid: (D1: $d9c8f5fe;
    D2: $8682;
    D3: $4347;
    D4: ($85,
         $7,
         $60,
         $a3,
         $f5,
         $1f,
         $33,
         $f1));
    pid: PID_FIRST_USABLE + 1);
  MFPKEY_WMAVOICE_ENC_DecoderDelay: PROPERTYKEY = (fmtid: (D1: $d9c8f5fe;
    D2: $8682;
    D3: $4347;
    D4: ($85,
         $7,
         $60,
         $a3,
         $f5,
         $1f,
         $33,
         $f1));
    pid: PID_FIRST_USABLE + 2);
  MFPKEY_WMAVOICE_ENC_EDL: PROPERTYKEY = (fmtid: (D1: $d9c8f5fe;
    D2: $8682;
    D3: $4347;
    D4: ($85,
         $7,
         $60,
         $a3,
         $f5,
         $1f,
         $33,
         $f1));
    pid: PID_FIRST_USABLE + 3);

  MFPKEY_WMAVOICE_ENC_RT_VariableRate: PROPERTYKEY = (fmtid: (D1: $d9c8f5fe;
    D2: $8682;
    D3: $4347;
    D4: ($85,
         $7,
         $60,
         $a3,
         $f5,
         $1f,
         $33,
         $f1));
    pid: PID_FIRST_USABLE + 4);
  MFPKEY_WMAVOICE_ENC_RT_BandWidth: PROPERTYKEY = (fmtid: (D1: $d9c8f5fe;
    D2: $8682;
    D3: $4347;
    D4: ($85,
         $7,
         $60,
         $a3,
         $f5,
         $1f,
         $33,
         $f1));
    pid: PID_FIRST_USABLE + 5);
  MFPKEY_WMAVOICE_ENC_RT_PacketLossMode: PROPERTYKEY = (fmtid: (D1: $d9c8f5fe;
    D2: $8682;
    D3: $4347;
    D4: ($85,
         $7,
         $60,
         $a3,
         $f5,
         $1f,
         $33,
         $f1));
    pid: PID_FIRST_USABLE + 6);
  MFPKEY_WMAVOICE_ENC_RT_MinBufferSize: PROPERTYKEY = (fmtid: (D1: $d9c8f5fe;
    D2: $8682;
    D3: $4347;
    D4: ($85,
         $7,
         $60,
         $a3,
         $f5,
         $1f,
         $33,
         $f1));
    pid: PID_FIRST_USABLE + 7);

  MFPKEY_WMAVOICE_DEC_RT_JitterControl: PROPERTYKEY = (fmtid: (D1: $165f69b;
    D2: $80a1;
    D3: $4ef8;
    D4: ($a4,
         $a9,
         $ad,
         $a3,
         $b8,
         $a6,
         $89,
         $dd));
    pid: PID_FIRST_USABLE);
  MFPKEY_WMAVOICE_DEC_RT_JitterMode: PROPERTYKEY = (fmtid: (D1: $165f69b;
    D2: $80a1;
    D3: $4ef8;
    D4: ($a4,
         $a9,
         $ad,
         $a3,
         $b8,
         $a6,
         $89,
         $dd));
    pid: PID_FIRST_USABLE + 1);
  MFPKEY_WMAVOICE_DEC_RT_PacketLossMode: PROPERTYKEY = (fmtid: (D1: $165f69b;
    D2: $80a1;
    D3: $4ef8;
    D4: ($a4,
         $a9,
         $ad,
         $a3,
         $b8,
         $a6,
         $89,
         $dd));
    pid: PID_FIRST_USABLE + 2);


  MFPKEY_Decoder_MaxNumPCMSamplesWithPaddedSilence: PROPERTYKEY = (fmtid: (D1: $c678ba85;
    D2: $1212;
    D3: $43da;
    D4: (90,
         $c3,
         $e7,
         $48,
         $b9,
         $24,
         $49,
         $ec));
    pid: $00);

  MFPKEY_WMAAECMA_SYSTEM_MODE: PROPERTYKEY = (fmtid: (D1: $6f52c567;
    D2: $360;
    D3: $4bd2;
    D4: ($96,
         $17,
         $cc,
         $bf,
         $14,
         $21,
         $c9,
         $39));
    pid: PID_FIRST_USABLE + 0);
  MFPKEY_WMAAECMA_DMO_SOURCE_MODE: PROPERTYKEY = (fmtid: (D1: $6f52c567;
    D2: $360;
    D3: $4bd2;
    D4: ($96,
         $17,
         $cc,
         $bf,
         $14,
         $21,
         $c9,
         $39));
    pid: PID_FIRST_USABLE + 1);
  MFPKEY_WMAAECMA_DEVICE_INDEXES: PROPERTYKEY = (fmtid: (D1: $6f52c567;
    D2: $360;
    D3: $4bd2;
    D4: ($96,
         $17,
         $cc,
         $bf,
         $14,
         $21,
         $c9,
         $39));
    pid: PID_FIRST_USABLE + 2);
  MFPKEY_WMAAECMA_FEATURE_MODE: PROPERTYKEY = (fmtid: (D1: $6f52c567;
    D2: $360;
    D3: $4bd2;
    D4: ($96,
         $17,
         $cc,
         $bf,
         $14,
         $21,
         $c9,
         $39));
    pid: PID_FIRST_USABLE + 3);
  MFPKEY_WMAAECMA_FEATR_FRAME_SIZE: PROPERTYKEY = (fmtid: (D1: $6f52c567;
    D2: $360;
    D3: $4bd2;
    D4: ($96,
         $17,
         $cc,
         $bf,
         $14,
         $21,
         $c9,
         $39));
    pid: PID_FIRST_USABLE + 4);
  MFPKEY_WMAAECMA_FEATR_ECHO_LENGTH: PROPERTYKEY = (fmtid: (D1: $6f52c567;
    D2: $360;
    D3: $4bd2;
    D4: ($96,
         $17,
         $cc,
         $bf,
         $14,
         $21,
         $c9,
         $39));
    pid: PID_FIRST_USABLE + 5);
  MFPKEY_WMAAECMA_FEATR_NS: PROPERTYKEY = (fmtid: (D1: $6f52c567;
    D2: $360;
    D3: $4bd2;
    D4: ($96,
         $17,
         $cc,
         $bf,
         $14,
         $21,
         $c9,
         $39));
    pid: PID_FIRST_USABLE + 6);
  MFPKEY_WMAAECMA_FEATR_AGC: PROPERTYKEY = (fmtid: (D1: $6f52c567;
    D2: $360;
    D3: $4bd2;
    D4: ($96,
         $17,
         $cc,
         $bf,
         $14,
         $21,
         $c9,
         $39));
    pid: PID_FIRST_USABLE + 7);
  MFPKEY_WMAAECMA_FEATR_AES: PROPERTYKEY = (fmtid: (D1: $6f52c567;
    D2: $360;
    D3: $4bd2;
    D4: ($96,
         $17,
         $cc,
         $bf,
         $14,
         $21,
         $c9,
         $39));
    pid: PID_FIRST_USABLE + 8);
  MFPKEY_WMAAECMA_FEATR_VAD: PROPERTYKEY = (fmtid: (D1: $6f52c567;
    D2: $360;
    D3: $4bd2;
    D4: ($96,
         $17,
         $cc,
         $bf,
         $14,
         $21,
         $c9,
         $39));
    pid: PID_FIRST_USABLE + 9);
  MFPKEY_WMAAECMA_FEATR_CENTER_CLIP: PROPERTYKEY = (fmtid: (D1: $6f52c567;
    D2: $360;
    D3: $4bd2;
    D4: ($96,
         $17,
         $cc,
         $bf,
         $14,
         $21,
         $c9,
         $39));
    pid: PID_FIRST_USABLE + 10);
  MFPKEY_WMAAECMA_FEATR_NOISE_FILL: PROPERTYKEY = (fmtid: (D1: $6f52c567;
    D2: $360;
    D3: $4bd2;
    D4: ($96,
         $17,
         $cc,
         $bf,
         $14,
         $21,
         $c9,
         $39));
    pid: PID_FIRST_USABLE + 11);
  MFPKEY_WMAAECMA_RETRIEVE_TS_STATS: PROPERTYKEY = (fmtid: (D1: $6f52c567;
    D2: $360;
    D3: $4bd2;
    D4: ($96,
         $17,
         $cc,
         $bf,
         $14,
         $21,
         $c9,
         $39));
    pid: PID_FIRST_USABLE + 12);
  MFPKEY_WMAAECMA_QUALITY_METRICS: PROPERTYKEY = (fmtid: (D1: $6f52c567;
    D2: $360;
    D3: $4bd2;
    D4: ($96,
         $17,
         $cc,
         $bf,
         $14,
         $21,
         $c9,
         $39));
    pid: PID_FIRST_USABLE + 13);
  MFPKEY_WMAAECMA_MICARRAY_DESCPTR: PROPERTYKEY = (fmtid: (D1: $6f52c567;
    D2: $360;
    D3: $4bd2;
    D4: ($96,
         $17,
         $cc,
         $bf,
         $14,
         $21,
         $c9,
         $39));
    pid: PID_FIRST_USABLE + 14);
  MFPKEY_WMAAECMA_DEVICEPAIR_GUID: PROPERTYKEY = (fmtid: (D1: $6f52c567;
    D2: $360;
    D3: $4bd2;
    D4: ($96,
         $17,
         $cc,
         $bf,
         $14,
         $21,
         $c9,
         $39));
    pid: PID_FIRST_USABLE + 15);
  MFPKEY_WMAAECMA_FEATR_MICARR_MODE: PROPERTYKEY = (fmtid: (D1: $6f52c567;
    D2: $360;
    D3: $4bd2;
    D4: ($96,
         $17,
         $cc,
         $bf,
         $14,
         $21,
         $c9,
         $39));
    pid: PID_FIRST_USABLE + 16);
  MFPKEY_WMAAECMA_FEATR_MICARR_BEAM: PROPERTYKEY = (fmtid: (D1: $6f52c567;
    D2: $360;
    D3: $4bd2;
    D4: ($96,
         $17,
         $cc,
         $bf,
         $14,
         $21,
         $c9,
         $39));
    pid: PID_FIRST_USABLE + 17);
  MFPKEY_WMAAECMA_FEATR_MICARR_PREPROC: PROPERTYKEY = (fmtid: (D1: $6f52c567;
    D2: $360;
    D3: $4bd2;
    D4: ($96,
         $17,
         $cc,
         $bf,
         $14,
         $21,
         $c9,
         $39));
    pid: PID_FIRST_USABLE + 18);
  MFPKEY_WMAAECMA_MIC_GAIN_BOUNDER: PROPERTYKEY = (fmtid: (D1: $6f52c567;
    D2: $360;
    D3: $4bd2;
    D4: ($96,
         $17,
         $cc,
         $bf,
         $14,
         $21,
         $c9,
         $39));
    pid: PID_FIRST_USABLE + 19);

  MFPKEY_COLOR_BRIGHTNESS: PROPERTYKEY = (fmtid: (D1: $174fb0ec;
    D2: $2695;
    D3: $476c;
    D4: ($88,
         $aa,
         $d2,
         $b4,
         $1c,
         $e7,
         $5e,
         $67));
    pid: $01);
  MFPKEY_COLOR_CONTRAST: PROPERTYKEY = (fmtid: (D1: $174fb0ec;
    D2: $2695;
    D3: $476c;
    D4: ($88,
         $aa,
         $d2,
         $b4,
         $1c,
         $e7,
         $5e,
         $67));
    pid: $02);
  MFPKEY_COLOR_HUE: PROPERTYKEY = (fmtid: (D1: $174fb0ec;
    D2: $2695;
    D3: $476c;
    D4: ($88,
         $aa,
         $d2,
         $b4,
         $1c,
         $e7,
         $5e,
         $67));
    pid: $03);
  MFPKEY_COLOR_SATURATION: PROPERTYKEY = (fmtid: (D1: $174fb0ec;
    D2: $2695;
    D3: $476c;
    D4: ($88,
         $aa,
         $d2,
         $b4,
         $1c,
         $e7,
         $5e,
         $67));
    pid: $04);

  MFPKEY_COLORLEGALIZER_COMPLEXITY: PROPERTYKEY = (fmtid: (D1: $add0e6c1;
    D2: $cc30;
    D3: $475d;
    D4: ($9e,
         $5a,
         $f1,
         $b1,
         $9f,
         $58,
         $7b,
         $e0));
    pid: $01);
  MFPKEY_COLORLEGALIZER_COMPLEXITYEX: PROPERTYKEY = (fmtid: (D1: $add0e6c1;
    D2: $cc30;
    D3: $475d;
    D4: ($9e,
         $5a,
         $f1,
         $b1,
         $9f,
         $58,
         $7b,
         $e0));
    pid: $02);
  MFPKEY_COLORLEGALIZER_COMPLEXITYMAX: PROPERTYKEY = (fmtid: (D1: $add0e6c1;
    D2: $cc30;
    D3: $475d;
    D4: ($9e,
         $5a,
         $f1,
         $b1,
         $9f,
         $58,
         $7b,
         $e0));
    pid: $03);
  MFPKEY_COLORLEGALIZER_COMPLEXITYLIVE: PROPERTYKEY = (fmtid: (D1: $add0e6c1;
    D2: $cc30;
    D3: $475d;
    D4: ($9e,
         $5a,
         $f1,
         $b1,
         $9f,
         $58,
         $7b,
         $e0));
    pid: $04);
  MFPKEY_COLORLEGALIZER_COMPLEXITYOFFLINE: PROPERTYKEY = (fmtid: (D1: $add0e6c1;
    D2: $cc30;
    D3: $475d;
    D4: ($9e,
         $5a,
         $f1,
         $b1,
         $9f,
         $58,
         $7b,
         $e0));
    pid: $05);
  MFPKEY_COLORLEGALIZER_bSVideo: PROPERTYKEY = (fmtid: (D1: $add0e6c1;
    D2: $cc30;
    D3: $475d;
    D4: ($9e,
         $5a,
         $f1,
         $b1,
         $9f,
         $58,
         $7b,
         $e0));
    pid: $06);

  MFPKEY_CONV_INPUTFRAMERATE: PROPERTYKEY = (fmtid: (D1: $52f8d29b;
    D2: $2e76;
    D3: $43f7;
    D4: ($a4,
         $f6,
         $17,
         $17,
         $90,
         $4e,
         $35,
         $df));
    pid: $01);
  MFPKEY_CONV_OUTPUTFRAMERATE: PROPERTYKEY = (fmtid: (D1: $52f8d29b;
    D2: $2e76;
    D3: $43f7;
    D4: ($a4,
         $f6,
         $17,
         $17,
         $90,
         $4e,
         $35,
         $df));
    pid: $02);
  MFPKEY_CONV_REVERSEPLAYBACK: PROPERTYKEY = (fmtid: (D1: $52f8d29b;
    D2: $2e76;
    D3: $43f7;
    D4: ($a4,
         $f6,
         $17,
         $17,
         $90,
         $4e,
         $35,
         $df));
    pid: $03);
  MFPKEY_SMPTE_MASKNUM: PROPERTYKEY = (fmtid: (D1: $427ce859;
    D2: $d55c;
    D3: $4f8e;
    D4: ($b0,
         $0e,
         $9c,
         $df,
         $76,
         $15,
         $48,
         $a6));
    pid: $01);
  MFPKEY_SMPTE_OFFSETX: PROPERTYKEY = (fmtid: (D1: $427ce859;
    D2: $d55c;
    D3: $4f8e;
    D4: ($b0,
         $0e,
         $9c,
         $df,
         $76,
         $15,
         $48,
         $a6));
    pid: $02);
  MFPKEY_SMPTE_OFFSETY: PROPERTYKEY = (fmtid: (D1: $427ce859;
    D2: $d55c;
    D3: $4f8e;
    D4: ($b0,
         $0e,
         $9c,
         $df,
         $76,
         $15,
         $48,
         $a6));
    pid: $03);
  MFPKEY_SMPTE_REPLICATEX: PROPERTYKEY = (fmtid: (D1: $427ce859;
    D2: $d55c;
    D3: $4f8e;
    D4: ($b0,
         $0e,
         $9c,
         $df,
         $76,
         $15,
         $48,
         $a6));
    pid: $04);
  MFPKEY_SMPTE_REPLICATEY: PROPERTYKEY = (fmtid: (D1: $427ce859;
    D2: $d55c;
    D3: $4f8e;
    D4: ($b0,
         $0e,
         $9c,
         $df,
         $76,
         $15,
         $48,
         $a6));
    pid: $05);
  MFPKEY_SMPTE_REVERSE: PROPERTYKEY = (fmtid: (D1: $427ce859;
    D2: $d55c;
    D3: $4f8e;
    D4: ($b0,
         $0e,
         $9c,
         $df,
         $76,
         $15,
         $48,
         $a6));
    pid: $06);
  MFPKEY_SMPTE_BORDERSOFTNESS: PROPERTYKEY = (fmtid: (D1: $427ce859;
    D2: $d55c;
    D3: $4f8e;
    D4: ($b0,
         $0e,
         $9c,
         $df,
         $76,
         $15,
         $48,
         $a6));
    pid: $07);
  MFPKEY_SMPTE_BORDERWIDTH: PROPERTYKEY = (fmtid: (D1: $427ce859;
    D2: $d55c;
    D3: $4f8e;
    D4: ($b0,
         $0e,
         $9c,
         $df,
         $76,
         $15,
         $48,
         $a6));
    pid: $08);
  MFPKEY_SMPTE_BORDERCOLOR: PROPERTYKEY = (fmtid: (D1: $427ce859;
    D2: $d55c;
    D3: $4f8e;
    D4: ($b0,
         $0e,
         $9c,
         $df,
         $76,
         $15,
         $48,
         $a6));
    pid: $09);

  MFPKEY_DENOISE_FILTER: PROPERTYKEY = (fmtid: (D1: $7213c6ef;
    D2: $cdd4;
    D3: $4d09;
    D4: ($a8,
         $9e,
         $f3,
         $eb,
         $eb,
         $e5,
         $f5,
         $65));
    pid: $01);
  MFPKEY_DENOISE_CACHEFRAMES: PROPERTYKEY = (fmtid: (D1: $7213c6ef;
    D2: $cdd4;
    D3: $4d09;
    D4: ($a8,
         $9e,
         $f3,
         $eb,
         $eb,
         $e5,
         $f5,
         $65));
    pid: $02);
  MFPKEY_DENOISE_PROCFRAMES: PROPERTYKEY = (fmtid: (D1: $7213c6ef;
    D2: $cdd4;
    D3: $4d09;
    D4: ($a8,
         $9e,
         $f3,
         $eb,
         $eb,
         $e5,
         $f5,
         $65));
    pid: $03);
  MFPKEY_DENOISE_CAUSAL: PROPERTYKEY = (fmtid: (D1: $7213c6ef;
    D2: $cdd4;
    D3: $4d09;
    D4: ($a8,
         $9e,
         $f3,
         $eb,
         $eb,
         $e5,
         $f5,
         $65));
    pid: $04);
  MFPKEY_DENOISE_ITERATIVE: PROPERTYKEY = (fmtid: (D1: $7213c6ef;
    D2: $cdd4;
    D3: $4d09;
    D4: ($a8,
         $9e,
         $f3,
         $eb,
         $eb,
         $e5,
         $f5,
         $65));
    pid: $05);
  MFPKEY_DENOISE_PARA1: PROPERTYKEY = (fmtid: (D1: $7213c6ef;
    D2: $cdd4;
    D3: $4d09;
    D4: ($a8,
         $9e,
         $f3,
         $eb,
         $eb,
         $e5,
         $f5,
         $65));
    pid: $06);
  MFPKEY_DENOISE_PARA2: PROPERTYKEY = (fmtid: (D1: $7213c6ef;
    D2: $cdd4;
    D3: $4d09;
    D4: ($a8,
         $9e,
         $f3,
         $eb,
         $eb,
         $e5,
         $f5,
         $65));
    pid: $07);
  MFPKEY_DENOISE_PARA3: PROPERTYKEY = (fmtid: (D1: $7213c6ef;
    D2: $cdd4;
    D3: $4d09;
    D4: ($a8,
         $9e,
         $f3,
         $eb,
         $eb,
         $e5,
         $f5,
         $65));
    pid: $08);
  MFPKEY_DENOISE_PARA4: PROPERTYKEY = (fmtid: (D1: $7213c6ef;
    D2: $cdd4;
    D3: $4d09;
    D4: ($a8,
         $9e,
         $f3,
         $eb,
         $eb,
         $e5,
         $f5,
         $65));
    pid: $09);
  MFPKEY_DENOISE_PARA5: PROPERTYKEY = (fmtid: (D1: $7213c6ef;
    D2: $cdd4;
    D3: $4d09;
    D4: ($a8,
         $9e,
         $f3,
         $eb,
         $eb,
         $e5,
         $f5,
         $65));
    pid: $10);

  MFPKEY_CLUSTERDETECTOR_MAXCLUSTERS: PROPERTYKEY = (fmtid: (D1: $b79a666d;
    D2: $8a9d;
    D3: $463c;
    D4: ($9d,
         $97,
         $e1,
         $b1,
         $0,
         $45,
         $c1,
         $3a));
    pid: $01);
  MFPKEY_CLUSTERDETECTOR_MINCLUSTERDURATION: PROPERTYKEY = (fmtid: (D1: $b79a666d;
    D2: $8a9d;
    D3: $463c;
    D4: ($9d,
         $97,
         $e1,
         $b1,
         $0,
         $45,
         $c1,
         $3a));
    pid: $02);
  MFPKEY_CLUSTERDETECTOR_MAXCLUSTERDURATION: PROPERTYKEY = (fmtid: (D1: $b79a666d;
    D2: $8a9d;
    D3: $463c;
    D4: ($9d,
         $97,
         $e1,
         $b1,
         $0,
         $45,
         $c1,
         $3a));
    pid: $03);

  MFPKEY_FACEDETECTOR_SKIPFRAMES: PROPERTYKEY = (fmtid: (D1: $e1a124a6;
    D2: $4fa8;
    D3: $4ba5;
    D4: ($a2,
         $d8,
         $dc,
         $34,
         $53,
         $6f,
         $74,
         $26));
    pid: $01);

  MFPKEY_SHOTDETECTOR_TYPE: PROPERTYKEY = (fmtid: (D1: $7bcc7b0f;
    D2: $dedf;
    D3: $4a68;
    D4: ($96,
         $a2,
         $fc,
         $e0,
         $19,
         $ed,
         $95,
         $6f));
    pid: $01);
  MFPKEY_SHOTDETECTOR_CLASSIFICATIONMETHOD: PROPERTYKEY = (fmtid: (D1: $7bcc7b0f;
    D2: $dedf;
    D3: $4a68;
    D4: ($96,
         $a2,
         $fc,
         $e0,
         $19,
         $ed,
         $95,
         $6f));
    pid: $02);
  MFPKEY_SHOTDETECTOR_GLOBALTHRESHOLD: PROPERTYKEY = (fmtid: (D1: $7bcc7b0f;
    D2: $dedf;
    D3: $4a68;
    D4: ($96,
         $a2,
         $fc,
         $e0,
         $19,
         $ed,
         $95,
         $6f));
    pid: $03);
  MFPKEY_SHOTDETECTOR_ADAPTIVETHRESHOLD: PROPERTYKEY = (fmtid: (D1: $7bcc7b0f;
    D2: $dedf;
    D3: $4a68;
    D4: ($96,
         $a2,
         $fc,
         $e0,
         $19,
         $ed,
         $95,
         $6f));
    pid: $04);
  MFPKEY_SHOTDETECTOR_ADAPTIVEWINDOWSIZE: PROPERTYKEY = (fmtid: (D1: $7bcc7b0f;
    D2: $dedf;
    D3: $4a68;
    D4: ($96,
         $a2,
         $fc,
         $e0,
         $19,
         $ed,
         $95,
         $6f));
    pid: $05);
  MFPKEY_SHOTDETECTOR_MINCLIPWEIGHT: PROPERTYKEY = (fmtid: (D1: $7bcc7b0f;
    D2: $dedf;
    D3: $4a68;
    D4: ($96,
         $a2,
         $fc,
         $e0,
         $19,
         $ed,
         $95,
         $6f));
    pid: $06);
  MFPKEY_SHOTDETECTOR_MINCLIPDURATION: PROPERTYKEY = (fmtid: (D1: $7bcc7b0f;
    D2: $dedf;
    D3: $4a68;
    D4: ($96,
         $a2,
         $fc,
         $e0,
         $19,
         $ed,
         $95,
         $6f));
    pid: $07);
  MFPKEY_SHOTDETECTOR_MAXCLIPDURATION: PROPERTYKEY = (fmtid: (D1: $7bcc7b0f;
    D2: $dedf;
    D3: $4a68;
    D4: ($96,
         $a2,
         $fc,
         $e0,
         $19,
         $ed,
         $95,
         $6f));
    pid: $08);
  MFPKEY_SHOTDETECTOR_MAXCLIPSPERHOUR: PROPERTYKEY = (fmtid: (D1: $7bcc7b0f;
    D2: $dedf;
    D3: $4a68;
    D4: ($96,
         $a2,
         $fc,
         $e0,
         $19,
         $ed,
         $95,
         $6f));
    pid: $09);
  MFPKEY_SHOTDETECTOR_PRESERVEMONOCLIPS: PROPERTYKEY = (fmtid: (D1: $7bcc7b0f;
    D2: $dedf;
    D3: $4a68;
    D4: ($96,
         $a2,
         $fc,
         $e0,
         $19,
         $ed,
         $95,
         $6f));
    pid: $0a);

  MFPKEY_THUMBNAILGENERATOR_SEARCHWINDOWSIZE: PROPERTYKEY = (fmtid: (D1: $d9d7473f;
    D2: $7d68;
    D3: $4226;
    D4: ($98,
         $5c,
         $31,
         $85,
         $2c,
         $4c,
         $9e,
         $74));
    pid: $01);
  MFPKEY_THUMBNAILGENERATOR_MINCOLORENTROPY: PROPERTYKEY = (fmtid: (D1: $d9d7473f;
    D2: $7d68;
    D3: $4226;
    D4: ($98,
         $5c,
         $31,
         $85,
         $2c,
         $4c,
         $9e,
         $74));
    pid: $02);
  MFPKEY_THUMBNAILGENERATOR_MAXMOTIONACTIVITY: PROPERTYKEY = (fmtid: (D1: $d9d7473f;
    D2: $7d68;
    D3: $4226;
    D4: ($98,
         $5c,
         $31,
         $85,
         $2c,
         $4c,
         $9e,
         $74));
    pid: $03);
  MFPKEY_THUMBNAILGENERATOR_THUMBNAILWIDTH: PROPERTYKEY = (fmtid: (D1: $d9d7473f;
    D2: $7d68;
    D3: $4226;
    D4: ($98,
         $5c,
         $31,
         $85,
         $2c,
         $4c,
         $9e,
         $74));
    pid: $04);
  MFPKEY_THUMBNAILGENERATOR_THUMBNAILHEIGHT: PROPERTYKEY = (fmtid: (D1: $d9d7473f;
    D2: $7d68;
    D3: $4226;
    D4: ($98,
         $5c,
         $31,
         $85,
         $2c,
         $4c,
         $9e,
         $74));
    pid: $05);
  MFPKEY_THUMBNAILGENERATOR_THUMBNAILREADY: PROPERTYKEY = (fmtid: (D1: $d9d7473f;
    D2: $7d68;
    D3: $4226;
    D4: ($98,
         $5c,
         $31,
         $85,
         $2c,
         $4c,
         $9e,
         $74));
    pid: $06);
  MFPKEY_THUMBNAILGENERATOR_THUMBNAILFILENAME: PROPERTYKEY = (fmtid: (D1: $d9d7473f;
    D2: $7d68;
    D3: $4226;
    D4: ($98,
         $5c,
         $31,
         $85,
         $2c,
         $4c,
         $9e,
         $74));
    pid: $ff);

  MFPKEY_TOCGENERATOR_TOCREADY: PROPERTYKEY = (fmtid: (D1: $7c109759;
    D2: $3c27;
    D3: $42ef;
    D4: ($a6,
         $a3,
         $ce,
         $de,
         $f7,
         $5a,
         $35,
         $e9));
    pid: $01);
  MFPKEY_TOCGENERATOR_TOCOBJECT: PROPERTYKEY = (fmtid: (D1: $7c109759;
    D2: $3c27;
    D3: $42ef;
    D4: ($a6,
         $a3,
         $ce,
         $de,
         $f7,
         $5a,
         $35,
         $e9));
    pid: $02);
  MFPKEY_TOCGENERATOR_SHOTDETECTOR_ON: PROPERTYKEY = (fmtid: (D1: $7c109759;
    D2: $3c27;
    D3: $42ef;
    D4: ($a6,
         $a3,
         $ce,
         $de,
         $f7,
         $5a,
         $35,
         $e9));
    pid: $03);
  MFPKEY_TOCGENERATOR_CLUSTERDETECTOR_ON: PROPERTYKEY = (fmtid: (D1: $7c109759;
    D2: $3c27;
    D3: $42ef;
    D4: ($a6,
         $a3,
         $ce,
         $de,
         $f7,
         $5a,
         $35,
         $e9));
    pid: $04);
  MFPKEY_TOCGENERATOR_THUMBNAILGENERATOR_ON: PROPERTYKEY = (fmtid: (D1: $7c109759;
    D2: $3c27;
    D3: $42ef;
    D4: ($a6,
         $a3,
         $ce,
         $de,
         $f7,
         $5a,
         $35,
         $e9));
    pid: $05);
  MFPKEY_TOCGENERATOR_FEATUREEXTRACTOR_ON: PROPERTYKEY = (fmtid: (D1: $7c109759;
    D2: $3c27;
    D3: $42ef;
    D4: ($a6,
         $a3,
         $ce,
         $de,
         $f7,
         $5a,
         $35,
         $e9));
    pid: $06);
  MFPKEY_TOCGENERATOR_FACEDETECTOR_ON: PROPERTYKEY = (fmtid: (D1: $7c109759;
    D2: $3c27;
    D3: $42ef;
    D4: ($a6,
         $a3,
         $ce,
         $de,
         $f7,
         $5a,
         $35,
         $e9));
    pid: $07);
  MFPKEY_TOCGENERATOR_USEENDSIGNAL: PROPERTYKEY = (fmtid: (D1: $7c109759;
    D2: $3c27;
    D3: $42ef;
    D4: ($a6,
         $a3,
         $ce,
         $de,
         $f7,
         $5a,
         $35,
         $e9));
    pid: $fa);
  MFPKEY_TOCGENERATOR_ENDSIGNAL: PROPERTYKEY = (fmtid: (D1: $7c109759;
    D2: $3c27;
    D3: $42ef;
    D4: ($a6,
         $a3,
         $ce,
         $de,
         $f7,
         $5a,
         $35,
         $e9));
    pid: $fb);
  MFPKEY_TOCGENERATOR_ENDTIME: PROPERTYKEY = (fmtid: (D1: $7c109759;
    D2: $3c27;
    D3: $42ef;
    D4: ($a6,
         $a3,
         $ce,
         $de,
         $f7,
         $5a,
         $35,
         $e9));
    pid: $fc);
  MFPKEY_TOCGENERATOR_CURRENTTIME: PROPERTYKEY = (fmtid: (D1: $7c109759;
    D2: $3c27;
    D3: $42ef;
    D4: ($a6,
         $a3,
         $ce,
         $de,
         $f7,
         $5a,
         $35,
         $e9));
    pid: $fd);
  MFPKEY_TOCGENERATOR_PROCESSEDFRAMES: PROPERTYKEY = (fmtid: (D1: $7c109759;
    D2: $3c27;
    D3: $42ef;
    D4: ($a6,
         $a3,
         $ce,
         $de,
         $f7,
         $5a,
         $35,
         $e9));
    pid: $fe);
  MFPKEY_TOCGENERATOR_INDEXFILENAME: PROPERTYKEY = (fmtid: (D1: $7c109759;
    D2: $3c27;
    D3: $42ef;
    D4: ($a6,
         $a3,
         $ce,
         $de,
         $f7,
         $5a,
         $35,
         $e9));
    pid: $ff);

  MFPKEY_DXVA_ENABLED: PROPERTYKEY = (fmtid: (D1: $58e28605;
    D2: $1d51;
    D3: $48ed;
    D4: ($a3,
         $eb,
         $0f,
         $9b,
         $af,
         $78,
         $5f,
         $bd));
    pid: $01);
  MFPKEY_FI_SUPPORTED: PROPERTYKEY = (fmtid: (D1: $5ce18788;
    D2: $b992;
    D3: $49a7;
    D4: ($a4,
         $f1,
         $60,
         $ea,
         $21,
         $ca,
         $a5,
         $5f));
    pid: $02);
  MFPKEY_FI_ENABLED: PROPERTYKEY = (fmtid: (D1: $e020c4ca;
    D2: $3bdd;
    D3: $40ec;
    D4: ($bc,
         $f4,
         $40,
         $39,
         $b1,
         $45,
         $0e,
         $b8));
    pid: $03);

  MFPKEY_DECODER_DEINTERLACING: PROPERTYKEY = (fmtid: (D1: $00c6281f;
    D2: $4be6;
    D3: $4e44;
    D4: ($9e,
         $d8,
         $9e,
         $c5,
         $42,
         $23,
         $16,
         $e4));
    pid: $04);
  MFPKEY_POSTPROCESSMODE: PROPERTYKEY = (fmtid: (D1: $00c6281f;
    D2: $4be6;
    D3: $4e44;
    D4: ($9e,
         $d8,
         $9e,
         $c5,
         $42,
         $23,
         $16,
         $e4));
    pid: $05);
  MFPKEY_NUMTHREADSDEC: PROPERTYKEY = (fmtid: (D1: $00c6281f;
    D2: $4be6;
    D3: $4e44;
    D4: ($9e,
         $d8,
         $9e,
         $c5,
         $42,
         $23,
         $16,
         $e4));
    pid: $06);
  MFPKEY_AVDecVideoSWPowerLevel: PROPERTYKEY = (fmtid: (D1: $fb5d2347;
    D2: $4dd8;
    D3: $4509;
    D4: ($ae,
         $d0,
         $db,
         $5f,
         $a9,
         $aa,
         $93,
         $f4));
    pid: $08);

  MFPKEY_AVGFRAMERATE: PROPERTYKEY = (fmtid: (D1: $41d700d6;
    D2: $95b1;
    D3: $4e3f;
    D4: ($b7,
         $59,
         $2d,
         $66,
         $d8,
         $c7,
         $ad,
         $a2));
    pid: $01);
  MFPKEY_BUFFERFULLNESSINFIRSTBYTE: PROPERTYKEY = (fmtid: (D1: $b69dc3c5;
    D2: $64c4;
    D3: $4757;
    D4: ($99,
         $cb,
         $5d,
         $58,
         $0f,
         $d5,
         $65,
         $9e));
    pid: $02);
  MFPKEY_PASSESRECOMMENDED: PROPERTYKEY = (fmtid: (D1: $38bdceea;
    D2: $393e;
    D3: $4f9a;
    D4: ($8d,
         $c3,
         $80,
         $2c,
         $c4,
         $05,
         $83,
         $8f));
    pid: $03);
  MFPKEY_DECODERCOMPLEXITYPROFILE: PROPERTYKEY = (fmtid: (D1: $c0d912d6;
    D2: $14da;
    D3: $4d31;
    D4: ($8d,
         $83,
         $d1,
         $08,
         $91,
         $5e,
         $8d,
         $77));
    pid: $04);
  MFPKEY_TOTALFRAMES: PROPERTYKEY = (fmtid: (D1: $ce5f1e3c;
    D2: $d3d4;
    D3: $4c3f;
    D4: ($88,
         $c8,
         $01,
         $e9,
         $89,
         $d9,
         $98,
         $d2));
    pid: $05);
  MFPKEY_CODEDFRAMES: PROPERTYKEY = (fmtid: (D1: $62872b55;
    D2: $fe0e;
    D3: $4930;
    D4: ($a6,
         $d2,
         $cc,
         $aa,
         $37,
         $e8,
         $f5,
         $35));
    pid: $06);
  MFPKEY_ZEROBYTEFRAMES: PROPERTYKEY = (fmtid: (D1: $8f04aba4;
    D2: $313d;
    D3: $40fb;
    D4: ($80,
         $31,
         $31,
         $51,
         $78,
         $13,
         $d9,
         $ef));
    pid: $07);
  MFPKEY_ENDOFPASS: PROPERTYKEY = (fmtid: (D1: $b2030f2a;
    D2: $8bbc;
    D3: $46f8;
    D4: ($a6,
         $4b,
         $a9,
         $8f,
         $f7,
         $fc,
         $f0,
         $2a));
    pid: $08);
  MFPKEY_DATARATE: PROPERTYKEY = (fmtid: (D1: $e0db0807;
    D2: $8003;
    D3: $4880;
    D4: ($ac,
         $11,
         $61,
         $b7,
         $3f,
         $33,
         $dc,
         $60));
    pid: $09);
  MFPKEY_KEYDIST: PROPERTYKEY = (fmtid: (D1: $18d6f8c5;
    D2: $2416;
    D3: $4d7b;
    D4: ($90,
         $d7,
         $9f,
         $3f,
         $21,
         $e7,
         $52,
         $b4));
    pid: $0a);
  MFPKEY_CRISP: PROPERTYKEY = (fmtid: (D1: $2985f772;
    D2: $3af2;
    D3: $4d15;
    D4: ($8c,
         $fa,
         $8a,
         $96,
         $2f,
         $f3,
         $20,
         $40));
    pid: $0b);
  MFPKEY_FOURCC: PROPERTYKEY = (fmtid: (D1: $593e3f2e;
    D2: $f84d;
    D3: $4e85;
    D4: ($b6,
         $8d,
         $f6,
         $69,
         $40,
         $0e,
         $da,
         $bc));
    pid: $0c);
  MFPKEY_VIDEOWINDOW: PROPERTYKEY = (fmtid: (D1: $c1c96060;
    D2: $76f0;
    D3: $47d4;
    D4: ($a8,
         $75,
         $5b,
         $dd,
         $a9,
         $0d,
         $f5,
         $e9));
    pid: $0d);
  MFPKEY_FRAMECOUNT: PROPERTYKEY = (fmtid: (D1: $75028eb4;
    D2: $4853;
    D3: $44d3;
    D4: ($88,
         $a3,
         $e4,
         $99,
         $f8,
         $9d,
         $22,
         $7f));
    pid: $0e);
  MFPKEY_LIVEENCODE: PROPERTYKEY = (fmtid: (D1: $3ffa1e60;
    D2: $5514;
    D3: $4634;
    D4: ($86,
         $e6,
         $1f,
         $3b,
         $7c,
         $54,
         $51,
         $43));
    pid: $0f);
  MFPKEY_COMPLEXITY: PROPERTYKEY = (fmtid: (D1: $44fa08c7;
    D2: $92f5;
    D3: $45dc;
    D4: ($83,
         $76,
         $8d,
         $1d,
         $32,
         $4c,
         $65,
         $2a));
    pid: $10);
  MFPKEY_COMPLEXITYEX: PROPERTYKEY = (fmtid: (D1: $d6e48f93;
    D2: $fd47;
    D3: $47a3;
    D4: ($92,
         $62,
         $8a,
         $ef,
         $b5,
         $53,
         $03,
         $32));
    pid: $11);
  MFPKEY_ASFOVERHEADPERFRAME: PROPERTYKEY = (fmtid: (D1: $0eac7502;
    D2: $1957;
    D3: $4beb;
    D4: ($91,
         $4d,
         $88,
         $5f,
         $85,
         $e7,
         $54,
         $36));
    pid: $12);
  MFPKEY_PASSESUSED: PROPERTYKEY = (fmtid: (D1: $b1653ac1;
    D2: $cb7d;
    D3: $43ee;
    D4: ($84,
         $54,
         $3f,
         $9d,
         $81,
         $1b,
         $03,
         $31));
    pid: $13);
  MFPKEY_VBRENABLED: PROPERTYKEY = (fmtid: (D1: $e48d9459;
    D2: $6abe;
    D3: $4eb5;
    D4: ($92,
         $11,
         $60,
         $08,
         $0c,
         $1a,
         $b9,
         $84));
    pid: $14);
  MFPKEY_VBRQUALITY: PROPERTYKEY = (fmtid: (D1: $f97b3f3a;
    D2: $9eff;
    D3: $4ac9;
    D4: ($82,
         $47,
         $35,
         $b3,
         $0e,
         $b9,
         $25,
         $f4));
    pid: $15);
  MFPKEY_RAVG: PROPERTYKEY = (fmtid: (D1: $14b2aae6;
    D2: $2987;
    D3: $460a;
    D4: ($8b,
         $22,
         $9c,
         $07,
         $7c,
         $55,
         $d0,
         $5e));
    pid: $16);
  MFPKEY_BAVG: PROPERTYKEY = (fmtid: (D1: $10174e76;
    D2: $e0ca;
    D3: $4a39;
    D4: ($94,
         $8c,
         $85,
         $10,
         $c2,
         $32,
         $32,
         $76));
    pid: $17);
  MFPKEY_RMAX: PROPERTYKEY = (fmtid: (D1: $7d8dd246;
    D2: $aaf4;
    D3: $4a24;
    D4: ($81,
         $66,
         $19,
         $39,
         $6b,
         $06,
         $ef,
         $69));
    pid: $18);
  MFPKEY_BMAX: PROPERTYKEY = (fmtid: (D1: $ff365211;
    D2: $21b6;
    D3: $4134;
    D4: ($ab,
         $7c,
         $52,
         $39,
         $3a,
         $8f,
         $80,
         $f6));
    pid: $19);
  MFPKEY_INTERLACEDCODINGENABLED: PROPERTYKEY = (fmtid: (D1: $56976073;
    D2: $06c3;
    D3: $4b3b;
    D4: ($ad,
         $41,
         $b7,
         $41,
         $7f,
         $ce,
         $84,
         $74));
    pid: $1a);
  MFPKEY_PRODUCEDUMMYFRAMES: PROPERTYKEY = (fmtid: (D1: $61714bc6;
    D2: $08a1;
    D3: $49d1;
    D4: ($b8,
         $27,
         $a3,
         $3a,
         $ad,
         $a9,
         $55,
         $26));
    pid: $1b);
  MFPKEY_DECODERCOMPLEXITYREQUESTED: PROPERTYKEY = (fmtid: (D1: $b0d7d4a7;
    D2: $422b;
    D3: $44c3;
    D4: ($97,
         $b4,
         $b9,
         $76,
         $0c,
         $ce,
         $ee,
         $a9));
    pid: $1c);
  MFPKEY_DROPPEDFRAMES: PROPERTYKEY = (fmtid: (D1: $bdb5afd3;
    D2: $4027;
    D3: $4882;
    D4: ($80,
         $6c,
         $41,
         $62,
         $e4,
         $a7,
         $a3,
         $f0));
    pid: $1d);
  MFPKEY_CODEDNONZEROFRAMES: PROPERTYKEY = (fmtid: (D1: $7adf5b69;
    D2: $1e3f;
    D3: $42d3;
    D4: ($99,
         $1d,
         $f8,
         $1e,
         $0c,
         $eb,
         $e9,
         $3e));
    pid: $1e);
  MFPKEY_QPPERFRAME: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $1f);
  MFPKEY_VOLHEADERFORREENCODE: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $21);
  MFPKEY_REENCDURATION: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $22);
  MFPKEY_REENCSTARTBUFFERSIZE: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $23);
  MFPKEY_REENCENDBUFFERSIZE: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $24);
  MFPKEY_REENCQPREF: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $25);
  MFPKEY_DENOISEOPTION: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $26);
  MFPKEY_FULLFRAMERATE: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $2d);
  MFPKEY_MOTIONSEARCHRANGE: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $2e);
  MFPKEY_DELTAMVRANGEINDEX: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $2f);
  MFPKEY_NUMBFRAMES: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $30);
  MFPKEY_RDSUBPIXELSEARCH: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $31);
  MFPKEY_BDELTAQP: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $32);
  MFPKEY_FORCEFRAMEWIDTH: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $33);
  MFPKEY_FORCEFRAMEHEIGHT: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $34);
  MFPKEY_RANGEREDUX: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $35);
  MFPKEY_LOOKAHEAD: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $36);
  MFPKEY_VIDEOSCALING: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $37);
  MFPKEY_PERCEPTUALOPTLEVEL: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $38);
  MFPKEY_FORCEMEDIANSETTING: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $39);
  MFPKEY_NUMTHREADS: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $3a);
  MFPKEY_LOOPFILTER: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $3b);
  MFPKEY_NOISEEDGEREMOVAL: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $3c);
  MFPKEY_VTYPE: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $3d);
  MFPKEY_CLOSEDENTRYPOINT: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $3f);
  MFPKEY_MOTIONSEARCHLEVEL: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $40);
  MFPKEY_MOTIONMATCHMETHOD: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $41);
  MFPKEY_MACROBLOCKMODECOSTMETHOD: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $42);
  MFPKEY_COMPRESSIONOPTIMIZATIONTYPE: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $43);
  MFPKEY_PERIODICALSPDISTANCE: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $46);
  MFPKEY_ENCODERCOMPLEXITY: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $47);
  MFPKEY_USERDATASIZE: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $48);
  MFPKEY_LETTERBOXPRESENT: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $49);
  MFPKEY_SCENECHANGE: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $4a);
  MFPKEY_VARIABLEGOP: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $4b);
  MFPKEY_SCENECHANGEI: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $4c);
  MFPKEY_LOOKAHEADRC: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $4d);
  MFPKEY_DQUANTOPTION: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $4e);
  MFPKEY_DQUANTSTRENGTH: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $4f);
  MFPKEY_FORCEOVERLAP: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $50);
  MFPKEY_MOTIONVECTORCOSTMETHOD: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $51);
  MFPKEY_DYNCOMPLEXLEVEL: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $52);
  MFPKEY_TARGETENCRATE: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $53);
  MFPKEY_DYNENCMODE: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $54);
  MFPKEY_TARGETENCDELTA: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $55);
  MFPKEY_ADAPTIVERESOLUTION: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $56);
  MFPKEY_SETDYNVIDRES: PROPERTYKEY = (fmtid: (D1: $4e91bf89;
    D2: $665a;
    D3: $49da;
    D4: ($bb,
         $94,
         $88,
         $c5,
         $50,
         $cf,
         $cd,
         $28));
    pid: $57);

  MFPKEY_CLIP_XORIG: PROPERTYKEY = (fmtid: (D1: $716fe5c8;
    D2: $755c;
    D3: $482f;
    D4: ($8d,
         $f3,
         $b3,
         $1d,
         $53,
         $59,
         $f0,
         $d6));
    pid: $01);
  MFPKEY_CLIP_YORIG: PROPERTYKEY = (fmtid: (D1: $716fe5c8;
    D2: $755c;
    D3: $482f;
    D4: ($8d,
         $f3,
         $b3,
         $1d,
         $53,
         $59,
         $f0,
         $d6));
    pid: $02);
  MFPKEY_CLIP_WIDTH: PROPERTYKEY = (fmtid: (D1: $716fe5c8;
    D2: $755c;
    D3: $482f;
    D4: ($8d,
         $f3,
         $b3,
         $1d,
         $53,
         $59,
         $f0,
         $d6));
    pid: $03);
  MFPKEY_CLIP_HEIGHT: PROPERTYKEY = (fmtid: (D1: $716fe5c8;
    D2: $755c;
    D3: $482f;
    D4: ($8d,
         $f3,
         $b3,
         $1d,
         $53,
         $59,
         $f0,
         $d6));
    pid: $04);

  MFPKEY_FI_FRAMERATE_VALU_SRC: PROPERTYKEY = (fmtid: (D1: $305bca55;
    D2: $1e5b;
    D3: $428e;
    D4: ($a9,
         $4c,
         $65,
         $b9,
         $4d,
         $2,
         $64,
         $ed));
    pid: $01);
  MFPKEY_FI_FRAMERATE_SCAL_SRC: PROPERTYKEY = (fmtid: (D1: $305bca55;
    D2: $1e5b;
    D3: $428e;
    D4: ($a9,
         $4c,
         $65,
         $b9,
         $4d,
         $2,
         $64,
         $ed));
    pid: $02);
  MFPKEY_FI_FRAMERATE_VALU_DST: PROPERTYKEY = (fmtid: (D1: $305bca55;
    D2: $1e5b;
    D3: $428e;
    D4: ($a9,
         $4c,
         $65,
         $b9,
         $4d,
         $2,
         $64,
         $ed));
    pid: $03);
  MFPKEY_FI_FRAMERATE_SCAL_DST: PROPERTYKEY = (fmtid: (D1: $305bca55;
    D2: $1e5b;
    D3: $428e;
    D4: ($a9,
         $4c,
         $65,
         $b9,
         $4d,
         $2,
         $64,
         $ed));
    pid: $04);
  MFPKEY_FI_ALLOWED: PROPERTYKEY = (fmtid: (D1: $305bca55;
    D2: $1e5b;
    D3: $428e;
    D4: ($a9,
         $4c,
         $65,
         $b9,
         $4d,
         $2,
         $64,
         $ed));
    pid: $05);
  MFPKEY_FI_COMPLEXITY: PROPERTYKEY = (fmtid: (D1: $305bca55;
    D2: $1e5b;
    D3: $428e;
    D4: ($a9,
         $4c,
         $65,
         $b9,
         $4d,
         $2,
         $64,
         $ed));
    pid: $06);

  MFPKEY_RESIZE_SRC_LEFT: PROPERTYKEY = (fmtid: (D1: $6612a6bc;
    D2: $e57d;
    D3: $407d;
    D4: ($a9,
         $58,
         $28,
         $5d,
         $f0,
         $d9,
         $b4,
         $00));
    pid: $01);
  MFPKEY_RESIZE_SRC_TOP: PROPERTYKEY = (fmtid: (D1: $6612a6bc;
    D2: $e57d;
    D3: $407d;
    D4: ($a9,
         $58,
         $28,
         $5d,
         $f0,
         $d9,
         $b4,
         $00));
    pid: $02);
  MFPKEY_RESIZE_SRC_WIDTH: PROPERTYKEY = (fmtid: (D1: $6612a6bc;
    D2: $e57d;
    D3: $407d;
    D4: ($a9,
         $58,
         $28,
         $5d,
         $f0,
         $d9,
         $b4,
         $00));
    pid: $03);
  MFPKEY_RESIZE_SRC_HEIGHT: PROPERTYKEY = (fmtid: (D1: $6612a6bc;
    D2: $e57d;
    D3: $407d;
    D4: ($a9,
         $58,
         $28,
         $5d,
         $f0,
         $d9,
         $b4,
         $00));
    pid: $04);
  MFPKEY_RESIZE_DST_LEFT: PROPERTYKEY = (fmtid: (D1: $6612a6bc;
    D2: $e57d;
    D3: $407d;
    D4: ($a9,
         $58,
         $28,
         $5d,
         $f0,
         $d9,
         $b4,
         $00));
    pid: $05);
  MFPKEY_RESIZE_DST_TOP: PROPERTYKEY = (fmtid: (D1: $6612a6bc;
    D2: $e57d;
    D3: $407d;
    D4: ($a9,
         $58,
         $28,
         $5d,
         $f0,
         $d9,
         $b4,
         $00));
    pid: $06);
  MFPKEY_RESIZE_DST_WIDTH: PROPERTYKEY = (fmtid: (D1: $6612a6bc;
    D2: $e57d;
    D3: $407d;
    D4: ($a9,
         $58,
         $28,
         $5d,
         $f0,
         $d9,
         $b4,
         $00));
    pid: $07);
  MFPKEY_RESIZE_DST_HEIGHT: PROPERTYKEY = (fmtid: (D1: $6612a6bc;
    D2: $e57d;
    D3: $407d;
    D4: ($a9,
         $58,
         $28,
         $5d,
         $f0,
         $d9,
         $b4,
         $00));
    pid: $08);
  MFPKEY_RESIZE_QUALITY: PROPERTYKEY = (fmtid: (D1: $6612a6bc;
    D2: $e57d;
    D3: $407d;
    D4: ($a9,
         $58,
         $28,
         $5d,
         $f0,
         $d9,
         $b4,
         $00));
    pid: $09);
  MFPKEY_RESIZE_INTERLACE: PROPERTYKEY = (fmtid: (D1: $6612a6bc;
    D2: $e57d;
    D3: $407d;
    D4: ($a9,
         $58,
         $28,
         $5d,
         $f0,
         $d9,
         $b4,
         $00));
    pid: $0a);
  MFPKEY_RESIZE_PANSCANAPX: PROPERTYKEY = (fmtid: (D1: $6612a6bc;
    D2: $e57d;
    D3: $407d;
    D4: ($a9,
         $58,
         $28,
         $5d,
         $f0,
         $d9,
         $b4,
         $00));
    pid: $0b);
  MFPKEY_RESIZE_PANSCANAPY: PROPERTYKEY = (fmtid: (D1: $6612a6bc;
    D2: $e57d;
    D3: $407d;
    D4: ($a9,
         $58,
         $28,
         $5d,
         $f0,
         $d9,
         $b4,
         $00));
    pid: $0c);
  MFPKEY_RESIZE_PANSCANAPWIDTH: PROPERTYKEY = (fmtid: (D1: $6612a6bc;
    D2: $e57d;
    D3: $407d;
    D4: ($a9,
         $58,
         $28,
         $5d,
         $f0,
         $d9,
         $b4,
         $00));
    pid: $0d);
  MFPKEY_RESIZE_PANSCANAPHEIGHT: PROPERTYKEY = (fmtid: (D1: $6612a6bc;
    D2: $e57d;
    D3: $407d;
    D4: ($a9,
         $58,
         $28,
         $5d,
         $f0,
         $d9,
         $b4,
         $00));
    pid: $0e);
  MFPKEY_RESIZE_GEOMAPX: PROPERTYKEY = (fmtid: (D1: $6612a6bc;
    D2: $e57d;
    D3: $407d;
    D4: ($a9,
         $58,
         $28,
         $5d,
         $f0,
         $d9,
         $b4,
         $00));
    pid: $0f);
  MFPKEY_RESIZE_GEOMAPY: PROPERTYKEY = (fmtid: (D1: $6612a6bc;
    D2: $e57d;
    D3: $407d;
    D4: ($a9,
         $58,
         $28,
         $5d,
         $f0,
         $d9,
         $b4,
         $00));
    pid: $10);
  MFPKEY_RESIZE_GEOMAPWIDTH: PROPERTYKEY = (fmtid: (D1: $6612a6bc;
    D2: $e57d;
    D3: $407d;
    D4: ($a9,
         $58,
         $28,
         $5d,
         $f0,
         $d9,
         $b4,
         $00));
    pid: $11);
  MFPKEY_RESIZE_GEOMAPHEIGHT: PROPERTYKEY = (fmtid: (D1: $6612a6bc;
    D2: $e57d;
    D3: $407d;
    D4: ($a9,
         $58,
         $28,
         $5d,
         $f0,
         $d9,
         $b4,
         $00));
    pid: $12);
  MFPKEY_RESIZE_MINAPX: PROPERTYKEY = (fmtid: (D1: $6612a6bc;
    D2: $e57d;
    D3: $407d;
    D4: ($a9,
         $58,
         $28,
         $5d,
         $f0,
         $d9,
         $b4,
         $00));
    pid: $13);
  MFPKEY_RESIZE_MINAPY: PROPERTYKEY = (fmtid: (D1: $6612a6bc;
    D2: $e57d;
    D3: $407d;
    D4: ($a9,
         $58,
         $28,
         $5d,
         $f0,
         $d9,
         $b4,
         $00));
    pid: $14);
  MFPKEY_RESIZE_MINAPWIDTH: PROPERTYKEY = (fmtid: (D1: $6612a6bc;
    D2: $e57d;
    D3: $407d;
    D4: ($a9,
         $58,
         $28,
         $5d,
         $f0,
         $d9,
         $b4,
         $00));
    pid: $15);
  MFPKEY_RESIZE_MINAPHEIGHT: PROPERTYKEY = (fmtid: (D1: $6612a6bc;
    D2: $e57d;
    D3: $407d;
    D4: ($a9,
         $58,
         $28,
         $5d,
         $f0,
         $d9,
         $b4,
         $00));
    pid: $16);
  MFPKEY_PIXELASPECTRATIO: PROPERTYKEY = (fmtid: (D1: $6612a6bc;
    D2: $e57d;
    D3: $407d;
    D4: ($a9,
         $58,
         $28,
         $5d,
         $f0,
         $d9,
         $b4,
         $00));
    pid: $17);

  MFPKEY_COLORCONV_SRCLEFT: PROPERTYKEY = (fmtid: (D1: $dc9100be;
    D2: $1228;
    D3: $416c;
    D4: ($99,
         $48,
         $6f,
         $38,
         $f4,
         $79,
         $65,
         $4f));
    pid: $01);
  MFPKEY_COLORCONV_SRCTOP: PROPERTYKEY = (fmtid: (D1: $dc9100be;
    D2: $1228;
    D3: $416c;
    D4: ($99,
         $48,
         $6f,
         $38,
         $f4,
         $79,
         $65,
         $4f));
    pid: $02);
  MFPKEY_COLORCONV_DSTLEFT: PROPERTYKEY = (fmtid: (D1: $dc9100be;
    D2: $1228;
    D3: $416c;
    D4: ($99,
         $48,
         $6f,
         $38,
         $f4,
         $79,
         $65,
         $4f));
    pid: $03);
  MFPKEY_COLORCONV_DSTTOP: PROPERTYKEY = (fmtid: (D1: $dc9100be;
    D2: $1228;
    D3: $416c;
    D4: ($99,
         $48,
         $6f,
         $38,
         $f4,
         $79,
         $65,
         $4f));
    pid: $04);
  MFPKEY_COLORCONV_WIDTH: PROPERTYKEY = (fmtid: (D1: $dc9100be;
    D2: $1228;
    D3: $416c;
    D4: ($99,
         $48,
         $6f,
         $38,
         $f4,
         $79,
         $65,
         $4f));
    pid: $05);
  MFPKEY_COLORCONV_HEIGHT: PROPERTYKEY = (fmtid: (D1: $dc9100be;
    D2: $1228;
    D3: $416c;
    D4: ($99,
         $48,
         $6f,
         $38,
         $f4,
         $79,
         $65,
         $4f));
    pid: $06);
  MFPKEY_COLORCONV_MODE: PROPERTYKEY = (fmtid: (D1: $dc9100be;
    D2: $1228;
    D3: $416c;
    D4: ($99,
         $48,
         $6f,
         $38,
         $f4,
         $79,
         $65,
         $4f));
    pid: $07);

  MFPKEY_DEINTERLACE_PROCESSTYPE: PROPERTYKEY = (fmtid: (D1: $6141f4c3;
    D2: $d3a2;
    D3: $48a9;
    D4: ($96,
         $ac,
         $2f,
         $0,
         $14,
         $17,
         $6c,
         $26));
    pid: 01);
  MFPKEY_DEINTERLACE_TELECINEPATTERN: PROPERTYKEY = (fmtid: (D1: $6141f4c3;
    D2: $d3a2;
    D3: $48a9;
    D4: ($96,
         $ac,
         $2f,
         $0,
         $14,
         $17,
         $6c,
         $26));
    pid: 02);
  MFPKEY_DEINTERLACE_LASTFRAME: PROPERTYKEY = (fmtid: (D1: $6141f4c3;
    D2: $d3a2;
    D3: $48a9;
    D4: ($96,
         $ac,
         $2f,
         $0,
         $14,
         $17,
         $6c,
         $26));
    pid: 03);
  MFPKEY_DEINTERLACE_DETELECINE_FLAG: PROPERTYKEY = (fmtid: (D1: $6141f4c3;
    D2: $d3a2;
    D3: $48a9;
    D4: ($96,
         $ac,
         $2f,
         $0,
         $14,
         $17,
         $6c,
         $26));
    pid: 04);
  MFPKEY_DEINTERLACE_SMOOTHLEVEL: PROPERTYKEY = (fmtid: (D1: $6141f4c3;
    D2: $d3a2;
    D3: $48a9;
    D4: ($96,
         $ac,
         $2f,
         $0,
         $14,
         $17,
         $6c,
         $26));
    pid: 05);
  MFPKEY_DEINTERLACE_EDGETHRESHOLD: PROPERTYKEY = (fmtid: (D1: $6141f4c3;
    D2: $d3a2;
    D3: $48a9;
    D4: ($96,
         $ac,
         $2f,
         $0,
         $14,
         $17,
         $6c,
         $26));
    pid: 06);

  MFPKEY_DVDEC_SIZE: PROPERTYKEY = (fmtid: (D1: $75f2421a;
    D2: $e73a;
    D3: $45b3;
    D4: ($ae,
         $f0,
         $91,
         $3c,
         $66,
         $84,
         $64,
         $61));
    pid: $00);
  MFPKEY_DVENC_FORMAT: PROPERTYKEY = (fmtid: (D1: $f449a927;
    D2: $7b22;
    D3: $46ef;
    D4: ($b2,
         $e7,
         $4d,
         $2b,
         $72,
         $8b,
         $69,
         $9c));
    pid: $00);


  g_wszWMVCDatarate = ('_DATARATE');
  g_wszWMVCKeyframeDistance = ('_KEYDIST');
  g_wszWMVCCrisp = ('_CRISP');
  g_wszWMVCDefaultCrisp = ('_DEFAULTCRISP');
  g_wszWMVCFOURCC = ('_FOURCC');
  g_wszWMVCTotalWindow = ('_TOTALWINDOW');
  g_wszWMVCVideoWIndow = ('_VIDEOWINDOW');
  g_wszWMVCFrameCount = ('_FRAMECOUNT');
  g_wszWMVCLiveEncode = ('_LIVEENCODE');
  g_wszWMVCComplexityMode = ('_COMPLEXITY');
  g_wszWMVCComplexityEx = ('_COMPLEXITYEX');
  g_wszWMVCComplexityMax = ('_COMPLEXITYEXMAX');
  g_wszWMVCComplexityLive = ('_COMPLEXITYEXLIVE');
  g_wszWMVCComplexityOffline = ('_COMPLEXITYEXOFFLINE');
  g_wszWMVCPacketOverhead = ('_ASFOVERHEADPERFRAME');
  g_wszWMVCLegacy411InterlacedFormat = ('_LEGACY411INTERLACEDFORMAT');
  g_wszWMVCPassesRecommended = ('_PASSESRECOMMENDED');
  g_wszWMVCPassesUsed = ('_PASSESUSED');
  g_wszWMVCEndOfPass = ('_ENDOFPASS');
  g_wszWMVCFrameInterpolationSupported = ('_FRAMEINTERPOLATIONSUPPORTED');
  g_wszWMVCFrameInterpolationEnabled = ('_FRAMEINTERPOLATIONENABLED');
  g_wszWMVCQPPerFrame = ('_QPPERFRAME');
  g_wszWMVCReencDuration = ('_REENCDURATION');
  g_wszWMVCReencStartBufferSize = ('_REENCSTARTBUFFERSIZE');
  g_wszWMVCReencEndBufferSize = ('_REENCENDBUFFERSIZE');
  g_wszWMVCReencQPRef = ('_REENCQPREF');
  g_wszWMVCDenoiseOption = ('_DENOISEOPTION');
  g_wszWMVCMirrorDisplayOn = ('_MIRRORDISPLAYON');
  g_wszWMVCChangeFrameRate = ('_CHANGEFRAMERATE');
  g_wszWMVCChangeBitRate = ('_CHANGEBITRATE');
  g_wszWMVCChangeMaxBitRate = ('_CHANGEMAXBITRATE');
  g_wszWMVCFullFrameRate = ('_FULLFRAMERATE');
  g_wszWMVCMotionSearchRange = ('_MOTIONSEARCHRANGE');
  g_wszWMVCDeltaMVRangeIndex = ('_DELTAMVRANGEINDEX');
  g_wszWMVCNumBFrames = ('_NUMBFRAMES');
  g_wszWMVCRDSubpixelSearch = ('_RDSUBPIXELSEARCH');
  g_wszWMVCBDeltaQP = ('_BDELTAQP');
  g_wszWMVCForceFrameWidth = ('_FORCEFRAMEWIDTH');
  g_wszWMVCForceFrameHeight = ('_FORCEFRAMEHEIGHT');
  g_wszWMVCRangeRedux = ('_RANGEREDUX');
  g_wszWMVCLookAhead = ('_LOOKAHEAD');
  g_wszWMVCVideoScaling = ('_VIDEOSCALING');
  g_wszWMVCPerceptualOptLevel = ('_PERCEPTUALOPTLEVEL');
  g_wszWMVCForceMedianSetting = ('_FORCEMEDIANSETTING');
  g_wszWMVCNumThreads = ('_NUMTHREADS');
  g_wszWMVCLoopFilter = ('_LOOPFILTER');
  g_wszWMVCNoiseEdgeRemoval = ('_NOISEEDGEREMOVAL');
  g_wszWMVCVType = ('_VTYPE');
  g_wszWMVCMotionSearchLevel = ('_MOTIONSEARCHLEVEL');
  g_wszWMVCMotionMatchMethod = ('_MOTIONMATCHMETHOD');
  g_wszWMVCMacroblockModeCostMethod = ('_MACROBLOCKMODECOSTMETHOD');
  g_wszWMVCCompressionOptimizationType = ('_COMPRESSIONOPTIMIZATIONTYPE');
  g_wszWMVCPeriodicalSPDistance = ('_PERIODICALSPDISTANCE');
  g_wszWMVCQueryTimeStampTag = ('_QUERYTIMESTAMPTAG');
  g_wszWMVCSupportOneInMultiOut = ('_SUPPORTONEINMULTIOUT');
  g_wszWMVCEncodingWidth = ('_ENCODINGWIDTH');
  g_wszWMVCEncodingHeight = ('_ENCODINGHEIGHT');
  g_wszWMVCThreadAffinityMask = ('_THREADAFFINITYMASK');
  g_wszWMVCDecoderForceNoResizeOutput = ('_FORCENORESIZE');
  g_wszWMVCDynComplexityLevel = ('_DYNCOMPLEXLEVEL');
  g_wszWMVCTargetEncodeRate = ('_TARGETENCRATE');
  g_wszWMVCDynamicEncoderMode = ('_DYNENCMODE');
  g_wszWMVCTargetEncodeDelta = ('_TARGETENCDELTA');
  g_wszWMVCAdaptiveResolution = ('_ADAPTIVERESOLUTION');
  g_wszWMVCDynamicVideoResolution = ('_SETDYNVIDRES');
  g_wszWMACInputFormatName = ('_INPUTFORMATNAME');
  g_wszWMACSourceFormatTag = ('_SOURCEFORMATTAG');
  g_wszWMVCVBREnabled = ('_VBRENABLED');
  g_wszWMVCVBRQuality = ('_VBRQUALITY');
  g_wszWMVCAvgBitrate = ('_RAVG');
  g_wszWMVCMaxBitrate = ('_RMAX');
  g_wszWMVCBAvg = ('_BAVG');
  g_wszWMVCBMax = ('_BMAX');
  g_wszWMVCTotalFrames = ('_TOTALFRAMES');
  g_wszWMVCCodedFrames = ('_CODEDFRAMES');
  g_wszWMVCAvgFrameRate = ('_AVGFRAMERATE');
  g_wszWMVCDecoderComplexityProfile = ('_DECODERCOMPLEXITYPROFILE');
  g_wszWMVCDecoderComplexityRequested = ('_DECODERCOMPLEXITYREQUESTED');
  g_wszWMVCBufferFullnessInFirstByte = ('_BUFFERFULLNESSINFIRSTBYTE');
  g_wszWMACPeakPCMValue = ('PeakValue');
  g_wszWMACAvgPCMValue = ('AverageLevel');
  g_wszWMADRCAverageReference = ('WMADRCAverageReference');
  g_wszWMADRCPeakReference = ('WMADRCPeakReference');
  g_wszWMADRCAverageTarget = ('WMADRCAverageTarget');
  g_wszWMADRCPeakTarget = ('WMADRCPeakTarget');
  g_wszWMACHiResOutput = ('_HIRESOUTPUT');
  g_wszWMACAvgBytesPerSec = ('AvgBytesPerSec');
  g_wszWMACSpeakerConfig = ('SpeakerConfig');
  g_wszWMACMixTable = ('MixTable');
  g_wszWMACDRCSetting = ('DynamicRangeControl');
  g_wszWMVCWatermarkConfig = ('WatermarkConfig');
  g_wszWMVCWatermarkDelay = ('WatermarkDelay');
  g_wszWMVCInterlacedCodingEnabled = ('_INTERLACEDCODINGENABLED');
  g_wszWMVCProduceDummyFrames = ('_PRODUCEDUMMYFRAMES');
  g_wszWMVCDecoderDeinterlacing = ('_DECODERDEINTERLACING');
  g_wszWMACOriginalWaveFormat = ('_ORIGINALWAVEFORMAT');
  g_wszWMACIncludeNumPasses = ('_INCLUDENUMPASSES');
  g_wszWMVCInverseTelecinedInput = ('_INVERSETELECINEDINPUT');
  g_wszWMVCForcePostProcessMode = ('_POSTPROCESSMODE');
  g_wszWMVCNumThreadsDec = ('_NUMTHREADSDEC');
  g_wszWMVCClosedEntryPoint = ('_CLOSEDENTRYPOINT');
  g_wszWMVCQueryTimeStampTagDec = ('_QUERYTIMESTAMPTAGDEC');
  g_wszWMVCSupportOneInMultiOut_Dec = ('_SUPPORTONEINMULTIOUT_DEC');
  g_wszWMVCEncodedWidth_Dec = ('_ENCODEDWIDTH_DEC');
  g_wszWMVCEncodedHeight_Dec = ('_ENCODEDHEIGHT_DEC');
  g_wszWMVCNeedsDrain = ('_DECODERNEEDSDRAIN');
  g_wszWMVCEncodercomplexity = ('_ENCODERCOMPLEXITY');
  g_wszWMVCUserdatasize = ('_USERDATASIZE');
  g_wszWMVCLetterboxpresent = ('_LETTERBOXPRESENT');
  g_wszWMVCScenechange = ('_SCENECHANGE');
  g_wszWMVCVariableGOP = ('_VARIABLEGOP');
  g_wszWMVCSceneChangeI = ('_SCENECHANGEI');
  g_wszWMVCLookaheadRC = ('_LOOKAHEADRC');
  g_wszWMVCDquantOption = ('_DQUANTOPTION');
  g_wszWMVCDquantStrength = ('_DQUANTSTRENGTH');
  g_wszWMVCForceOverlap = ('_FORCEOVERLAP');
  g_wszWMVCMotionVectorCostMethod = ('_MOTIONVECTORCOSTMETHOD');
  g_wszWMVForceStartCode = ('_FORCESTARTCODE');
  g_wszWMVCHonorKeyFrameSettings = ('_HONORKEYSETTINGS');
  g_wszWMVCHonorTSFrameQP = ('_HONORTSFRAMEQP');
  g_wszWMVDisplayWidth = ('_DisplayWidth');
  g_wszWMVDisplayHeight = ('_DisplayHeight');
  g_wszWMVEncodeWidth = ('_EncodeWidth');
  g_wszWMVEncodeHeight = ('_EncodeHeight');
  g_wszWMVTranscodeMode = ('_TranscodeMode');
  g_wszWMVAspectHorizSize = ('_AspectHorizSize');
  g_wszWMVAspectVertSize = ('_AspectVertSize');
  g_wszWMVTimeStampFixed = ('TSFixed');
  g_wszWMACMusicSpeechClassMode = ('MusicSpeechClassMode');
  g_wszWMACVoiceBuffer = ('BufferWindow');
  g_wszWMACVoiceEDL = ('_EDL');
  //g_wszSpeechFormatCaps               = ('SpeechFormatCap');   //re-declared

type
  PWmvDynamicFlags = ^WMV_DYNAMIC_FLAGS;
  WMV_DYNAMIC_FLAGS = DWord;

const
  WMV_DYNAMIC_BITRATE = WMV_DYNAMIC_FLAGS($1);
  WMV_DYNAMIC_RESOLUTION = WMV_DYNAMIC_FLAGS($2);
  WMV_DYNAMIC_COMPLEXITY = WMV_DYNAMIC_FLAGS($4);

type
  PMF_AUVRHP_ROOMMODEL = ^MF_AUVRHP_ROOMMODEL;
  PMfAuvrhpRoommodel = ^MF_AUVRHP_ROOMMODEL;
  MF_AUVRHP_ROOMMODEL = DWord;

const
  VRHP_SMALLROOM = MF_AUVRHP_ROOMMODEL(0);
  VRHP_MEDIUMROOM = VRHP_SMALLROOM + 1;
  VRHP_BIGROOM = VRHP_MEDIUMROOM + 1;
  VRHP_CUSTUMIZEDROOM = VRHP_BIGROOM + 1;


const

  AEC_MAX_SYSTEM_MODES = 6;

type
  PAEC_SYSTEM_MODE = ^AEC_SYSTEM_MODE;
  PAecSystemMode = ^AEC_SYSTEM_MODE;
  AEC_SYSTEM_MODE = DWord; // VT_I4

const
  SINGLE_CHANNEL_AEC = AEC_SYSTEM_MODE(0);
  ADAPTIVE_ARRAY_ONLY = SINGLE_CHANNEL_AEC + 1;
  OPTIBEAM_ARRAY_ONLY = ADAPTIVE_ARRAY_ONLY + 1;
  ADAPTIVE_ARRAY_AND_AEC = OPTIBEAM_ARRAY_ONLY + 1;
  OPTIBEAM_ARRAY_AND_AEC = ADAPTIVE_ARRAY_AND_AEC + 1;
  SINGLE_CHANNEL_NSAGC = OPTIBEAM_ARRAY_AND_AEC + 1;
  MODE_NOT_SET = SINGLE_CHANNEL_NSAGC + 1;


type
  PAecQualityMetricsStruct = ^tagAecQualityMetrics_Struct;

  tagAecQualityMetrics_Struct = record
    i64Timestamp: LONGLONG;
    ConvergenceFlag: Byte;
    MicClippedFlag: Byte;
    MicSilenceFlag: Byte;
    PstvFeadbackFlag: Byte;
    SpkClippedFlag: Byte;
    SpkMuteFlag: Byte;
    GlitchFlag: Byte;
    DoubleTalkFlag: Byte;
    uGlitchCount: ULONG;
    uMicClipCount: ULONG;
    fDuration: Single;
    fTSVariance: Single;
    fTSDriftRate: Single;
    fVoiceLevel: Single;
    fNoiseLevel: Single;
    fERLE: Single;
    fAvgERLE: Single;
    dwReserved: DWORD;
  end;
  AecQualityMetrics_Struct = tagAecQualityMetrics_Struct;

type
  PAEC_VAD_MODE = ^AEC_VAD_MODE;
  PAecVadMode = ^AEC_VAD_MODE;
  AEC_VAD_MODE = DWord;

const
  AEC_VAD_DISABLED = AEC_VAD_MODE(0);
  AEC_VAD_NORMAL = AEC_VAD_DISABLED + 1;
  AEC_VAD_FOR_AGC = AEC_VAD_NORMAL + 1;
  AEC_VAD_FOR_SILENCE_SUPPRESSION = AEC_VAD_FOR_AGC + 1;


type
  PAEC_INPUT_STREAM = ^AEC_INPUT_STREAM;
  PAecInputStream = ^AEC_INPUT_STREAM;
  AEC_INPUT_STREAM = DWord;

const
  AEC_CAPTURE_STREAM = AEC_INPUT_STREAM(0);
  AEC_REFERENCE_STREAM = AEC_INPUT_STREAM(1);


type
  PMIC_ARRAY_MODE = ^MIC_ARRAY_MODE;
  PMicArrayMode = ^MIC_ARRAY_MODE;
  MIC_ARRAY_MODE = DWord;

const
  MICARRAY_SINGLE_CHAN = MIC_ARRAY_MODE(0);
  MICARRAY_SIMPLE_SUM = MIC_ARRAY_MODE($100);
  MICARRAY_SINGLE_BEAM = MIC_ARRAY_MODE($200);
  MICARRAY_FIXED_BEAM = MIC_ARRAY_MODE($400);
  MICARRAY_EXTERN_BEAM = MIC_ARRAY_MODE($800);


const

  WMAAECMA_E_NO_ACTIVE_RENDER_STREAM = $87CC000A;


  MEDIASUBTYPE_Y41T: TGUID = '{54313459-0000-0010-8000-00aa00389b70}';
  MEDIASUBTYPE_Y42T: TGUID = '{54323459-0000-0010-8000-00aa00389b71}';

  {$IFNDEF MEDIASUBTYPE_NV11_DEFINED}
  MEDIASUBTYPE_NV11: TGUID = '{3131564E-0000-0010-8000-00aa00389b71}';
  {$DEFINE MEDIASUBTYPE_NV11_DEFINED}
  {$ENDIF}

  // The programming language of C++ and C are case sensitive.
  // In both commands and variable names are case sensitive.
  // Syntax Example:
  // The following standard C++ codesnippet works:
  // printf("test\n"); > Ok
  // Printf("test\n"); > Will not work!
  // So here we have to tackle this problem, because Delphi is not case sensitive, and
  // will generate an error (Identifier redeclared)

  MEDIASUBTYPE_V216: TGUID = '{36313256-0000-0010-8000-00aa00389b71}';
  MEDIASUBTYPE_V410: TGUID = '{30313456-0000-0010-8000-00aa00389b71}';
  MEDIASUBTYPE_v210: TGUID = '{30313276-0000-0010-8000-00aa00389b71}';
  MEDIASUBTYPE_I420: TGUID = '{30323449-0000-0010-8000-00aa00389b71}';

  MEDIASUBTYPE_WVC1: TGUID = '{31435657-0000-0010-8000-00aa00389b71}'; // or '{31637677-0000-0010-8000-00aa00389b71}'
  _MEDIASUBTYPE_wvc1: TGUID = '{31637677-0000-0010-8000-00aa00389b71}';

  MEDIASUBTYPE_WMVA: TGUID = '{41564D57-0000-0010-8000-00aa00389b71}';
  _MEDIASUBTYPE_wmva: TGUID = '{61766D77-0000-0010-8000-00aa00389b71}';
  MEDIASUBTYPE_WMVB: TGUID = '{42564D57-0000-0010-8000-00aa00389b71}';
  _MEDIASUBTYPE_wmvb: TGUID = '{62766D77-0000-0010-8000-00aa00389b71}';
  MEDIASUBTYPE_WMVR: TGUID = '{52564D57-0000-0010-8000-00aa00389b71}';
  _MEDIASUBTYPE_wmvr: TGUID = '{72766D77-0000-0010-8000-00aa00389b71}';
  MEDIASUBTYPE_WMVP: TGUID = '{50564D57-0000-0010-8000-00aa00389b71}';
  _MEDIASUBTYPE_wmvp: TGUID = '{70766D77-0000-0010-8000-00aa00389b71}';
  MEDIASUBTYPE_WVP2: TGUID = '{32505657-0000-0010-8000-00aa00389b71}';
  _MEDIASUBTYPE_wvp2: TGUID = '{32707677-0000-0010-8000-00aa00389b71}';
  MEDIASUBTYPE_WMV3: TGUID = '{33564D57-0000-0010-8000-00aa00389b71}';
  _MEDIASUBTYPE_wmv3: TGUID = '{33766D77-0000-0010-8000-00aa00389b71}';
  MEDIASUBTYPE_WMV2: TGUID = '{32564D57-0000-0010-8000-00aa00389b71}';
  _MEDIASUBTYPE_wmv2: TGUID = '{32766D77-0000-0010-8000-00aa00389b71}';
  MEDIASUBTYPE_WMV1: TGUID = '{31564D57-0000-0010-8000-00aa00389b71}';
  _MEDIASUBTYPE_wmv1: TGUID = '{31766D77-0000-0010-8000-00aa00389b71}';
  MEDIASUBTYPE_MPG4: TGUID = '{3447504D-0000-0010-8000-00aa00389b71}';
  _MEDIASUBTYPE_mpg4: TGUID = '{3467706D-0000-0010-8000-00aa00389b71}';
  MEDIASUBTYPE_MP42: TGUID = '{3234504D-0000-0010-8000-00aa00389b71}';
  _MEDIASUBTYPE_mp42: TGUID = '{3234706D-0000-0010-8000-00aa00389b71}';
  MEDIASUBTYPE_MP43: TGUID = '{3334504D-0000-0010-8000-00aa00389b71}';
  _MEDIASUBTYPE_mp43: TGUID = '{3334706D-0000-0010-8000-00aa00389b71}';
  MEDIASUBTYPE_MP4S: TGUID = '{5334504D-0000-0010-8000-00aa00389b71}';
  _MEDIASUBTYPE_mp4s: TGUID = '{7334706D-0000-0010-8000-00aa00389b71}';
  MEDIASUBTYPE_M4S2: TGUID = '{3253344D-0000-0010-8000-00aa00389b71}';
  _MEDIASUBTYPE_m4s2: TGUID = '{3273346D-0000-0010-8000-00aa00389b71}';
  MEDIASUBTYPE_MSS1: TGUID = '{3153534D-0000-0010-8000-00aa00389b71}';
  MEDIASUBTYPE_MSS2: TGUID = '{3253534D-0000-0010-8000-00aa00389b71}';
  MEDIASUBTYPE_MSAUDIO1: TGUID = '{00000160-0000-0010-8000-00aa00389b71}';
  MEDIASUBTYPE_WMAUDIO2: TGUID = '{00000161-0000-0010-8000-00aa00389b71}';
  MEDIASUBTYPE_WMAUDIO3: TGUID = '{00000162-0000-0010-8000-00aa00389b71}';
  MEDIASUBTYPE_WMAUDIO_LOSSLESS: TGUID = '{00000163-0000-0010-8000-00aa00389b71}';
  MEDIASUBTYPE_WMASPDIF: TGUID = '{00000164-0000-0010-8000-00aa00389b71}';
  MEDIASUBTYPE_WMAUDIO4: TGUID = '{00000168-0000-0010-8000-00aa00389b71}';
  MEDIASUBTYPE_MPEG_ADTS_AAC: TGUID = '{00001600-0000-0010-8000-00aa00389b71}';
  MEDIASUBTYPE_MPEG_RAW_AAC: TGUID = '{00001601-0000-0010-8000-00aa00389b71}';
  MEDIASUBTYPE_MPEG_LOAS: TGUID = '{00001602-0000-0010-8000-00aa00389b71}';
  MEDIASUBTYPE_NOKIA_MPEG_ADTS_AAC: TGUID = '{00001608-0000-0010-8000-00aa00389b71}';
  MEDIASUBTYPE_NOKIA_MPEG_RAW_AAC: TGUID = '{00001609-0000-0010-8000-00aa00389b71}';
  MEDIASUBTYPE_VODAFONE_MPEG_ADTS_AAC: TGUID = '{0000160A-0000-0010-8000-00aa00389b71}';
  MEDIASUBTYPE_VODAFONE_MPEG_RAW_AAC: TGUID = '{0000160B-0000-0010-8000-00aa00389b71}';
  MEDIASUBTYPE_MPEG_HEAAC: TGUID = '{00001610-0000-0010-8000-00aa00389b71}';
  MEDIASUBTYPE_RAW_AAC1: TGUID = '{000000FF-0000-0010-8000-00aa00389b71}';
  MEDIASUBTYPE_DVM: TGUID = '{00002000-0000-0010-8000-00aa00389b71}';
  MEDIASUBTYPE_DTS2: TGUID = '{00002001-0000-0010-8000-00aa00389b71}';
  MEDIASUBTYPE_DOLBY_DDPLUS: TGUID = '{a7fb87af-2d02-42fb-a4d4-05cd93843bdd}';
  MEDIASUBTYPE_DOLBY_TRUEHD: TGUID = '{eb27cec4-163e-4ca3-8b74-8e25f91b517e}';
  MEDIASUBTYPE_DTS_HD: TGUID = '{a2e58eb7-0fa9-48bb-a40c-fa0e156d0645}';
  MEDIASUBTYPE_DTS_HD_HRA: TGUID = '{A61AC364-AD0E-4744-89FF-213CE0DF8804}';
  MEDIASUBTYPE_h264: TGUID = '{34363268-0000-0010-8000-00aa00389b71}';
  MEDIASUBTYPE_AVC1: TGUID = '{31435641-0000-0010-8000-00aa00389b71}';
  MEDIASUBTYPE_X264: TGUID = '{34363258-0000-0010-8000-00aa00389b71}';
  _MEDIASUBTYPE_x264: TGUID = '{34363278-0000-0010-8000-00aa00389b71}';


type
  PMFVideoDSPMode = ^MFVideoDSPMode;
  _MFVideoDSPMode = UINT32;
  MFVideoDSPMode = _MFVideoDSPMode;

const
  MFVideoDSPMode_Passthrough = MFVideoDSPMode(1);
  MFVideoDSPMode_Stabilization = MFVideoDSPMode(4);


const

  MF_VIDEODSP_MODE: TGUID = '{16d720f0-768c-11de-8a39-0800200c9a66}';
  MFSampleExtension_VideoDSPMode: TGUID = '{c12d55cb-d7d9-476d-81f3-69117f163ea0}';
  CLSID_CTocEntry: TGUID = '{F22F5E05-585C-4def-8523-6555CFBC0CB3}';
  CLSID_CTocEntryList: TGUID = '{3A8CCCBC-0EFD-43a3-B838-F38A552BA237}';
  CLSID_CToc: TGUID = '{4FE24495-28CE-4920-A4C4-E556E1F0DF2A}';
  CLSID_CTocCollection: TGUID = '{5058292D-A244-4840-AB44-480975C4FFE4}';
  CLSID_CTocParser: TGUID = '{499EAEEA-2737-4849-8BB6-47F107EAF358}';
  CLSID_CAsfTocParser: TGUID = '{9B77C0F2-8735-46c5-B90F-5F0B303EF6AB}';
  CLSID_CAviTocParser: TGUID = '{3ADCE5CC-13C8-4573-B328-ED438EB694F9}';
  CLSID_CFileIo: TGUID = '{11993195-1244-4840-AB44-480975C4FFE4}';
  CLSID_CFileClient: TGUID = '{BFCCD195-1244-4840-AB44-480975C4FFE4}';
  CLSID_CClusterDetectorEx: TGUID = '{47354492-827E-4b8a-B318-C80EBA1381F0}';

type

  {$IFNDEF _QWORD_DEFINED}
  PQword = ^QWORD;
  QWORD = UInt64;
  {$DEFINE _QWORD_DEFINED}
  {$ENDIF}
  //QWORD

const

  {$IFNDEF E_TOCPARSER_INVALIDASFFILE_DEFINED}
  E_TOCPARSER_INVALIDASFFILE = _HRESULT_TYPEDEF_($99000001);
  {$DEFINE E_TOCPARSER_INVALIDASFFILE_DEFINED}
  {$ENDIF}
  //E_TOCPARSER_INVALIDASFFILE

  {$IFNDEF E_TOCPARSER_INVALIDRIFFFILE_DEFINED}
  E_TOCPARSER_INVALIDRIFFFILE = _HRESULT_TYPEDEF_($99000002);
  {$DEFINE E_TOCPARSER_INVALIDRIFFFILE_DEFINED}
  {$ENDIF}
  //E_TOCPARSER_INVALIDRIFFFILE

  {$IFNDEF TOC_MAX_DESCRIPTION_SIZE_DEFINED}
  TOC_MAX_DESCRIPTION_SIZE = 65535;
  {$DEFINE TOC_MAX_DESCRIPTION_SIZE_DEFINED}
  {$ENDIF}
  //TOC_MAX_DESCRIPTION_SIZE

  {$IFNDEF TOC_ENTRY_MAX_TITLE_SIZE_DEFINED}
  TOC_ENTRY_MAX_TITLE_SIZE = 65535;
  {$DEFINE TOC_ENTRY_MAX_TITLE_SIZE_DEFINED}
  {$ENDIF}
  //TOC_ENTRY_MAX_TITLE_SIZE


const

  CLSID_CMpeg4DecMediaObject: TGUID = '{f371728a-6052-4d47-827c-d039335dfe0a}';
  CLSID_CMpeg43DecMediaObject: TGUID = '{cba9e78b-49a3-49ea-93d4-6bcba8c4de07}';
  CLSID_CMpeg4sDecMediaObject: TGUID = '{2a11bae2-fe6e-4249-864b-9e9ed6e8dbc2}';
  CLSID_CMpeg4sDecMFT: TGUID = '{5686a0d9-fe39-409f-9dff-3fdbc849f9f5}';
  CLSID_CZuneM4S2DecMediaObject: TGUID = '{C56FC25C-0FC6-404a-9503-B10BF51A8AB9}';
  CLSID_CMpeg4EncMediaObject: TGUID = '{24f258d8-c651-4042-93e4-ca654abb682c}';
  CLSID_CMpeg4sEncMediaObject: TGUID = '{6ec5a7be-d81e-4f9e-ada3-cd1bf262b6d8}';
  CLSID_CMSSCDecMediaObject: TGUID = '{7bafb3b1-d8f4-4279-9253-27da423108de}';
  CLSID_CMSSCEncMediaObject: TGUID = '{8cb9cc06-d139-4ae6-8bb4-41e612e141d5}';
  CLSID_CMSSCEncMediaObject2: TGUID = '{f7ffe0a0-a4f5-44b5-949e-15ed2bc66f9d}';
  CLSID_CWMADecMediaObject: TGUID = '{2eeb4adf-4578-4d10-bca7-bb955f56320a}';
  CLSID_CWMAEncMediaObject: TGUID = '{70f598e9-f4ab-495a-99e2-a7c4d3d89abf}';
  CLSID_CWMATransMediaObject: TGUID = '{edcad9cb-3127-40df-b527-0152ccb3f6f5}';
  CLSID_CWMSPDecMediaObject: TGUID = '{874131cb-4ecc-443b-8948-746b89595d20}';
  CLSID_CWMSPEncMediaObject: TGUID = '{67841b03-c689-4188-ad3f-4c9ebeec710b}';
  CLSID_CWMSPEncMediaObject2: TGUID = '{1f1f4e1a-2252-4063-84bb-eee75f8856d5}';
  CLSID_CWMTDecMediaObject: TGUID = '{F9DBC64E-2DD0-45dd-9B52-66642EF94431}';
  CLSID_CWMTEncMediaObject: TGUID = '{60B67652-E46B-4e44-8609-F74BFFDC083C}';
  CLSID_CWMVDecMediaObject: TGUID = '{82d353df-90bd-4382-8bc2-3f6192b76e34}';
  CLSID_CWMVEncMediaObject2: TGUID = '{96b57cdd-8966-410c-bb1f-c97eea765c04}';
  CLSID_CWMVXEncMediaObject: TGUID = '{7e320092-596a-41b2-bbeb-175d10504eb6}';
  CLSID_CWMV9EncMediaObject: TGUID = '{d23b90d0-144f-46bd-841d-59e4eb19dc59}';
  CLSID_CWVC1DecMediaObject: TGUID = '{c9bfbccf-e60e-4588-a3df-5a03b1fd9585}';
  CLSID_CWVC1EncMediaObject: TGUID = '{44653D0D-8CCA-41e7-BACA-884337B747AC}';
  CLSID_CDeColorConvMediaObject: TGUID = '{49034c05-f43c-400f-84c1-90a683195a3a}';
  CLSID_CDVEncoderMediaObject: TGUID = '{c82ae729-c327-4cce-914d-8171fefebefb}';
  CLSID_CMpeg2DecMediaObject: TGUID = '{863d66cd-cdce-4617-b47f-c8929cfc28a6}';
  CLSID_CPK_DS_MPEG2Decoder: TGUID = '{9910c5cd-95c9-4e06-865a-efa1c8016bf4}';
  CLSID_CAC3DecMediaObject: TGUID = '{03d7c802-ecfa-47d9-b268-5fb3e310dee4}';
  CLSID_CPK_DS_AC3Decoder: TGUID = '{6c9c69d6-0ffc-4481-afdb-cdf1c79c6f3e}';
  CLSID_CMP3DecMediaObject: TGUID = '{bbeea841-0a63-4f52-a7ab-a9b3a84ed38a}';
  CLSID_CResamplerMediaObject: TGUID = '{f447b69e-1884-4a7e-8055-346f74d6edb3}';
  CLSID_CResizerMediaObject: TGUID = '{d3ec8b8b-7728-4fd8-9fe0-7b67d19f73a3}';
  CLSID_CInterlaceMediaObject: TGUID = '{b5a89c80-4901-407b-9abc-90d9a644bb46}';
  CLSID_CWMAudioLFXAPO: TGUID = '{62dc1a93-ae24-464c-a43e-452f824c4250}';
  CLSID_CWMAudioGFXAPO: TGUID = '{637c490d-eee3-4c0a-973f-371958802da2}';
  CLSID_CWMAudioCAPXLFXAPO: TGUID = '{C9453E73-8C5C-4463-9984-AF8BAB2F5447}';
  CLSID_CWMAudioCAPXGFXAPO: TGUID = '{13AB3EBD-137E-4903-9D89-60BE8277FD17}';
  CLSID_CWMAudioSpdTxDMO: TGUID = '{5210f8e4-b0bb-47c3-a8d9-7b2282cc79ed}';
  CLSID_CWMAudioAEC: TGUID = '{745057c7-f353-4f2d-a7ee-58434477730e}';
  CLSID_CClusterDetectorDmo: TGUID = '{36e820c4-165a-4521-863c-619e1160d4d4}';
  CLSID_CColorControlDmo: TGUID = '{798059f0-89ca-4160-b325-aeb48efe4f9a}';
  CLSID_CColorConvertDMO: TGUID = '{98230571-0087-4204-b020-3282538e57d3}';
  CLSID_CColorLegalizerDmo: TGUID = '{fdfaa753-e48e-4e33-9c74-98a27fc6726a}';
  CLSID_CFrameInterpDMO: TGUID = '{0a7cfe1b-6ab5-4334-9ed8-3f97cb37daa1}';
  CLSID_CFrameRateConvertDmo: TGUID = '{01f36ce2-0907-4d8b-979d-f151be91c883}';
  CLSID_CResizerDMO: TGUID = '{1ea1ea14-48f4-4054-ad1a-e8aee10ac805}';
  CLSID_CShotDetectorDmo: TGUID = '{56aefacd-110c-4397-9292-b0a0c61b6750}';
  CLSID_CSmpteTransformsDmo: TGUID = '{bde6388b-da25-485d-ba7f-fabc28b20318}';
  CLSID_CThumbnailGeneratorDmo: TGUID = '{559c6bad-1ea8-4963-a087-8a6810f9218b}';
  CLSID_CTocGeneratorDmo: TGUID = '{4dda1941-77a0-4fb1-a518-e2185041d70c}';
  CLSID_CMPEGAACDecMediaObject: TGUID = '{8DDE1772-EDAD-41c3-B4BE-1F30FB4EE0D6}';
  CLSID_CNokiaAACDecMediaObject: TGUID = '{3CB2BDE4-4E29-4c44-A73E-2D7C2C46D6EC}';
  CLSID_CVodafoneAACDecMediaObject: TGUID = '{7F36F942-DCF3-4d82-9289-5B1820278F7C}';
  CLSID_CZuneAACCCDecMediaObject: TGUID = '{A74E98F2-52D6-4b4e-885B-E0A6CA4F187A}';
  CLSID_CNokiaAACCCDecMediaObject: TGUID = '{EABF7A6F-CCBA-4d60-8620-B152CC977263}';
  CLSID_CVodafoneAACCCDecMediaObject: TGUID = '{7E76BF7F-C993-4e26-8FAB-470A70C0D59C}';
  CLSID_CMPEG2EncoderDS: TGUID = '{5F5AFF4A-2F7F-4279-88C2-CD88EB39D144}';
  CLSID_CMPEG2EncoderVideoDS: TGUID = '{42150cd9-ca9a-4ea5-9939-30ee037f6e74}';
  CLSID_CMPEG2EncoderAudioDS: TGUID = '{acd453bc-c58a-44d1-bbf5-bfb325be2d78}';
  CLSID_CMPEG2AudDecoderDS: TGUID = '{E1F1A0B8-BEEE-490d-BA7C-066C40B5E2B9}';
  CLSID_CMPEG2VidDecoderDS: TGUID = '{212690FB-83E5-4526-8FD7-74478B7939CD}';
  CLSID_CDTVAudDecoderDS: TGUID = '{8E269032-FE03-4753-9B17-18253C21722E}';
  CLSID_CDTVVidDecoderDS: TGUID = '{64777DC8-4E24-4beb-9D19-60A35BE1DAAF}';
  CLSID_CMSAC3Enc: TGUID = '{C6B400E2-20A7-4e58-A2FE-24619682CE6C}';
  CLSID_CMSH264DecoderMFT: TGUID = '{62CE7E72-4C71-4d20-B15D-452831A87D9D}';
  CLSID_CMSH264EncoderMFT: TGUID = '{6ca50344-051a-4ded-9779-a43305165e35}';
  CLSID_CMSH265EncoderMFT: TGUID = '{f2f84074-8bca-40bd-9159-e880f673dd3b}';
  CLSID_CMSVPXEncoderMFT: TGUID = '{aeb6c755-2546-4881-82cc-e15ae5ebff3d}';
  CLSID_CMSH264RemuxMFT: TGUID = '{05A47EBB-8BF0-4CBF-AD2F-3B71D75866F5}';
  CLSID_CMSAACDecMFT: TGUID = '{32d186a7-218f-4c75-8876-dd77273a8999}';
  CLSID_AACMFTEncoder: TGUID = '{93AF0C51-2275-45d2-A35B-F2BA21CAED00}';
  CLSID_CMSDDPlusDecMFT: TGUID = '{177C0AFE-900B-48d4-9E4C-57ADD250B3D4}';
  CLSID_CMPEG2VideoEncoderMFT: TGUID = '{E6335F02-80B7-4dc4-ADFA-DFE7210D20D5}';
  CLSID_CMPEG2AudioEncoderMFT: TGUID = '{46A4DD5C-73F8-4304-94DF-308F760974F4}';
  CLSID_CMSMPEGDecoderMFT: TGUID = '{2D709E52-123F-49b5-9CBC-9AF5CDE28FB9}';
  CLSID_CMSMPEGAudDecMFT: TGUID = '{70707B39-B2CA-4015-ABEA-F8447D22D88B}';
  CLSID_CMSDolbyDigitalEncMFT: TGUID = '{AC3315C9-F481-45D7-826C-0B406C1F64B8}';
  CLSID_MP3ACMCodecWrapper: TGUID = '{11103421-354c-4cca-a7a3-1aff9a5b6701}';

  CLSID_ALawCodecWrapper: TGUID = '{36CB6E0C-78C1-42B2-9943-846262F31786}';
  CLSID_MULawCodecWrapper: TGUID = '{92b66080-5e2d-449e-90c4-c41f268e5514}';

  CLSID_CMSVideoDSPMFT: TGUID = '{51571744-7FE4-4ff2-A498-2DC34FF74F1B}';

  CLSID_VorbisDecoderMFT: TGUID = '{1A198EF2-60E5-4EA8-90D8-DA1F2832C288}';
  CLSID_CMSFLACDecMFT: TGUID = '{6B0B3E6B-A2C5-4514-8055-AFE8A95242D9}';
  CLSID_CMSFLACEncMFT: TGUID = '{128509e9-c44e-45dc-95e9-c255b8f466a6}';
  CLSID_MFFLACBytestreamHandler: TGUID = '{0E41CFB8-0506-40F4-A516-77CC23642D91}';
  CLSID_MFFLACSinkClassFactory: TGUID = '{7d39c56f-6075-47c9-9bae-8cf9e531b5f5}';
  CLSID_CMSALACDecMFT: TGUID = '{C0CD7D12-31FC-4BBC-B363-7322EE3E1879}';
  CLSID_CMSALACEncMFT: TGUID = '{9AB6A28C-748E-4B6A-BFFF-CC443B8E8FB4}';
  CLSID_CMSOpusDecMFT: TGUID = '{63e17c10-2d43-4c42-8fe3-8d8b63e46a6a}';
  CLSID_MSAMRNBDecoder: TGUID = '{265011AE-5481-4f77-A295-ABB6FFE8D63E}';
  CLSID_MSAMRNBEncoder: TGUID = '{2FAE8AFE-04A3-423a-A814-85DB454712B0}';
  CLSID_MFAMRNBByteStreamHandler: TGUID = '{EFE6208A-0A2C-49FA-8A01-3768B559B6DA}';
  CLSID_MFAMRNBSinkClassFactory: TGUID = '{B0271158-70D2-4C5B-9F94-76F549D90FDF}';


type

  POC_DESCRIPTOR = ^TOC_DESCRIPTOR;
  PTocDescriptor = ^TOC_DESCRIPTOR;

  _TOC_DESCRIPTOR = record
    guidID: TGUID;
    wStreamNumber: WORD;
    guidType: TGUID;
    wLanguageIndex: WORD;
  end;
  TOC_DESCRIPTOR = _TOC_DESCRIPTOR;


  POC_ENTRY_DESCRIPTOR = ^TOC_ENTRY_DESCRIPTOR;
  PTocEntryDescriptor = ^TOC_ENTRY_DESCRIPTOR;

  _TOC_ENTRY_DESCRIPTOR = record
    qwStartTime: QWORD;
    qwEndTime: QWORD;
    qwStartPacketOffset: QWORD;
    qwEndPacketOffset: QWORD;
    qwRepresentativeFrameTime: QWORD;
  end;
  TOC_ENTRY_DESCRIPTOR = _TOC_ENTRY_DESCRIPTOR;


type
  POC_POS_TYPE = ^TOC_POS_TYPE;
  TOC_POS_TYPE = DWord;

const
  TOC_POS_INHEADER = DWord(0);
  TOC_POS_TOPLEVELOBJECT = TOC_POS_INHEADER + 1;

type
  // Interface ITocEntry
  // ===================
  //
  ITocEntry = interface(IUnknown)
    ['{F22F5E06-585C-4def-8523-6555CFBC0CB3}']

    function SetTitle(pwszTitle: PWideChar): HResult; stdcall;

    function GetTitle(var pwTitleSize: WORD;
                      out pwszTitle: PWideChar): HResult; stdcall;

    function SetDescriptor(pDescriptor: TOC_ENTRY_DESCRIPTOR): HResult; stdcall;

    function GetDescriptor(out pDescriptor: TOC_ENTRY_DESCRIPTOR): HResult; stdcall;

    function SetSubEntries(dwNumSubEntries: DWORD;
                           pwSubEntryIndices: WORD): HResult; stdcall;

    function GetSubEntries(var pdwNumSubEntries: DWORD;
                           out pwSubEntryIndices: WORD): HResult; stdcall;

    function SetDescriptionData(dwDescriptionDataSize: DWORD;
                                pbtDescriptionData: PByte;
                                pguidType: TGUID): HResult; stdcall;

    function GetDescriptionData(var pdwDescriptionDataSize: DWORD;
                                out pbtDescriptionData: PByte;
                                out pGuidType: TGUID): HResult; stdcall;

  end;
  // ITocEntry
  IID_ITocEntry = ITocEntry;


  // Interface ITocEntryList
  // =======================
  //
  ITocEntryList = interface(IUnknown)
    ['{3A8CCCBD-0EFD-43a3-B838-F38A552BA237}']

    function GetEntryCount(out pdwEntryCount: DWORD): HResult; stdcall;

    function GetEntryByIndex(dwEntryIndex: DWORD;
                             out ppEntry: ITocEntry): HResult; stdcall;

    function AddEntry(pEntry: ITocEntry;
                      out pdwEntryIndex: DWORD): HResult; stdcall;

    function AddEntryByIndex(dwEntryIndex: DWORD;
                             pEntry: ITocEntry): HResult; stdcall;

    function RemoveEntryByIndex(dwEntryIndex: DWORD): HResult; stdcall;

  end;
  // ITocEntryList
  IID_ITocEntryList = ITocEntryList;


  // Interface IToc
  // ==============
  //
  IToc = interface(IUnknown)
    ['{D6F05441-A919-423b-91A0-89D5B4A8AB77}']

    function SetDescriptor(pDescriptor: TOC_DESCRIPTOR): HResult; stdcall;

    function GetDescriptor(out pDescriptor: TOC_DESCRIPTOR): HResult; stdcall;

    function SetDescription(pwszDescription: PWideChar): HResult; stdcall;

    function GetDescription(var pwDescriptionSize: WORD;
                            out pwszDescription: PWideChar): HResult; stdcall;

    function SetContext(dwContextSize: DWORD;
                        pbtContext: PByte): HResult; stdcall;

    function GetContext(var pdwContextSize: DWORD;
                        out pbtContext: PByte): HResult; stdcall;

    function GetEntryListCount(out pwCount: WORD): HResult; stdcall;

    function GetEntryListByIndex(wEntryListIndex: WORD;
                                 out ppEntryList: ITocEntryList): HResult; stdcall;

    function AddEntryList(pEntryList: ITocEntryList;
                          out pwEntryListIndex: WORD): HResult; stdcall;

    function AddEntryListByIndex(wEntryListIndex: WORD;
                                 out pEntryList: ITocEntryList): HResult; stdcall;

    function RemoveEntryListByIndex(wEntryListIndex: WORD): HResult; stdcall;

  end;
  // IToc
  IID_IToc = IToc;


  // Interface ITocCollection
  // ========================
  //
  ITocCollection = interface(IUnknown)
    ['{23fee831-ae96-42df-b170-25a04847a3ca}']

    function GetEntryCount(out pdwEntryCount: DWORD): HResult; stdcall;

    function GetEntryByIndex(dwEntryIndex: DWORD;
                             out ppToc: IToc): HResult; stdcall;

    function AddEntry(pToc: IToc;
                      out pdwEntryIndex: DWORD): HResult; stdcall;

    function AddEntryByIndex(dwEntryIndex: DWORD;
                             pToc: IToc): HResult; stdcall;

    function RemoveEntryByIndex(dwEntryIndex: DWORD): HResult; stdcall;

  end;
  // ITocCollection
  IID_ITocCollection = ITocCollection;


  // Interface ITocParser
  // ========================
  //
  ITocParser = interface(IUnknown)
    ['{ECFB9A55-9298-4f49-887F-0B36206599D2}']

    function Init(pwszFileName: PWideChar): HResult; stdcall;

    function GetTocCount(enumTocPosType: TOC_POS_TYPE;
                         out pdwTocCount: DWORD): HResult; stdcall;

    function GetTocByIndex(enumTocPosType: TOC_POS_TYPE;
                           dwTocIndex: DWORD;
                           out ppToc: IToc): HResult; stdcall;

    function GetTocByType(enumTocPosType: TOC_POS_TYPE;
                          guidTocType: TGUID;
                          out ppTocs: ITocCollection): HResult; stdcall;

    function AddToc(enumTocPosType: TOC_POS_TYPE;
                    out pToc: IToc;
                    out pdwTocIndex: DWORD): HResult; stdcall;

    function RemoveTocByIndex(enumTocPosType: TOC_POS_TYPE;
                              dwTocIndex: DWORD): HResult; stdcall;

    function RemoveTocByType(enumTocPosType: TOC_POS_TYPE;
                             guidTocType: TGUID): HResult; stdcall;

    function Commit(): HResult; stdcall;

  end;
  // ITocParser
  IID_ITocParser = ITocParser;



  PFILE_OPENMODE = ^FILE_OPENMODE;
  __MIDL___MIDL_itf_mfobjects_0000_0017_0002 = (
    OPENMODE_FAIL_IF_NOT_EXIST = 0,
                                                OPENMODE_FAIL_IF_EXIST = 1,
                                                OPENMODE_RESET_IF_EXIST = 2,
                                                OPENMODE_APPEND_IF_EXIST = 3,
                                                OPENMODE_DELETE_IF_EXIST = 4
    );
  FILE_OPENMODE = __MIDL___MIDL_itf_mfobjects_0000_0017_0002;


  PSEEK_ORIGIN = ^SEEK_ORIGIN;
  SEEK_ORIGIN = (
    _msoBegin = 0,
                 _msoCurrent = 1);

  PFILE_ACCESSMODE = ^FILE_ACCESSMODE;
  FILE_ACCESSMODE = (
    ACCESSMODE_READ = 1,
                     ACCESSMODE_WRITE = 2,
                     ACCESSMODE_READWRITE = 3,
                     ACCESSMODE_WRITE_EXCLUSIVE = 4
    );


  // Interface IFileIo
  // =================
  //
  IFileIo = interface(IUnknown)
    ['{11993196-1244-4840-AB44-480975C4FFE4}']

    function Initialize(eAccessMode: FILE_ACCESSMODE;
                        eOpenMode: FILE_OPENMODE;
                        pwszFileName: PWideChar): HResult; stdcall;

    function GetLength(out pqwLength: QWORD): HResult; stdcall;

    function SetLength(qwLength: QWORD): HResult; stdcall;

    function GetCurrentPosition(out pqwPosition: QWORD): HResult; stdcall;

    function SetCurrentPosition(qwPosition: QWORD): HResult; stdcall;

    function IsEndOfStream(out pbEndOfStream: BOOL): HResult; stdcall;

    function Read(pbt: PByte;
                  ul: ULONG;
                  out pulRead: ULONG): HResult; stdcall;

    function Write(pbt: PByte;
                   ul: ULONG;
                   out pulWritten: ULONG): HResult; stdcall;

    function Seek(eSeekOrigin: SEEK_ORIGIN;
                  qwSeekOffset: QWORD;
                  dwSeekFlags: DWORD;
                  out pqwCurrentPosition: QWORD): HResult; stdcall;

    function Close(): HResult; stdcall;

  end;
  // IFileIo
  IID_IFileIo = IFileIo;


  // Interface IFileClient
  // =====================
  //
  IFileClient = interface(IUnknown)
    ['{BFCCD196-1244-4840-AB44-480975C4FFE4}']

    function GetObjectDiskSize(out pqwSize: QWORD): HResult; stdcall;

    function Write(pFio: IFileIo): HResult; stdcall;

    function Read(pFio: IFileIo): HResult; stdcall;

  end;
  // IFileClient
  IID_IFileClient = IFileClient;


  // Interface IClusterDetector
  // ==========================
  //
  IClusterDetector = interface(IUnknown)
    ['{3F07F7B7-C680-41d9-9423-915107EC9FF9}']

    function Initialize(wBaseEntryLevel: WORD;
                        wClusterEntryLevel: WORD): HResult; stdcall;

    function Detect(dwMaxNumClusters: DWORD;
                    fMinClusterDuration: FLOAT;
                    fMaxClusterDuration: FLOAT;
                    pSrcToc: IToc;
                    out ppDstToc: IToc): HResult; stdcall;

  end;
  // IClusterDetector
  IID_IClusterDetector = IClusterDetector;


  // Additional Prototypes for ALL interfaces

  // end of Additional Prototypes

implementation

const

  WmCodecDspLib = 'WMSPDMOE.DLL';

  // Implement Additional Prototypes here.

end.
