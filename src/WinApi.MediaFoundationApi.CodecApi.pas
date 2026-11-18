// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.MediaFoundationApi.CodecApi.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 17-10-2015
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: CodecAPI Definitions.
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
//          Maybe we need the Macro's later (see the original headerfile.)
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
// Source: codecapi.h
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
unit WinApi.MediaFoundationApi.CodecApi;

{$I MfPack.Fpc.inc}


interface

uses

  {WinApi}
  WinApi.WinApiTypes;

  {$PACKENUM 4}

  {$IFDEF WIN32}
    {$ALIGN 1}
  {$ELSE}
    {$ALIGN 8} // Win64
  {$ENDIF}

  {$I 'WinApiTypes.inc'}

// Windows CodecAPI Properties

// Legend
//  Reference       VariantType   VariantField
//  UINT8           VT_UI1        bVal
//  UINT16          VT_UI2        uiVal
//  UINT32          VT_UI4        ulVal
//  UINT64          VT_UI8        ullVal
//  INT8            VT_I1         eVal
//  INT16           VT_I2         iVal
//  INT32           VT_I4         lVal
//  INT64           VT_I8         llVal
//  BOOL            VT_BOOL       boolVal
//  GUID            VT_BSTR       bstrVal (guid string)
//  UINT32/UNINT32  VT_UI8        ullVal  (ratio)


// Static definitions
const

  AVENC_H264V_LEVELCOUNT              = 16;
  AVENC_H264V_MAX_MBBITS              = 3200;  // Only applies to Baseline, Main, Extended profiles

  // See: https://docs.microsoft.com/en-us/windows/win32/directshow/codec-api-properties

  CODECAPI_AVEncCommonFormatConstraint         :  TGUID = (D1: $57CBB9B8;
                                                                  D2: $116F;
                                                                  D3: $4951;
                                                                  D4: ($B4, $0C, $C2, $A0, $35, $ED, $8F, $17));

  CODECAPI_GUID_AVEncCommonFormatUnSpecified   :  TGUID = (D1: $AF46A35A;
                                                                  D2: $6024;
                                                                  D3: $4525;
                                                                  D4: ($A4, $8A, $09, $4B, $97, $F5, $B3, $C2));

  CODECAPI_GUID_AVEncCommonFormatDVD_V         :  TGUID = (D1: $cc9598c4;
                                                                  D2: $e7fe;
                                                                  D3: $451d;
                                                                  D4: ($b1, $ca, $76, $1b, $c8, $40, $b7, $f3));

  CODECAPI_GUID_AVEncCommonFormatDVD_DashVR    :  TGUID = (D1: $e55199d6;
                                                                  D2: $044c;
                                                                  D3: $4dae;
                                                                  D4: ($a4, $88, $53, $1e, $d3, $06, $23, $5b));

  CODECAPI_GUID_AVEncCommonFormatDVD_PlusVR    :  TGUID = (D1: $e74c6f2e;
                                                                  D2: $ec37;
                                                                  D3: $478d;
                                                                  D4: ($9a, $f4, $a5, $e1, $35, $b6, $27, $1c));

  CODECAPI_GUID_AVEncCommonFormatVCD           :  TGUID = (D1: $95035bf7;
                                                                  D2: $9d90;
                                                                  D3: $40ff;
                                                                  D4: ($ad, $5c, $5c, $f8, $cf, $71, $ca, $1d));

  CODECAPI_GUID_AVEncCommonFormatSVCD          :  TGUID = (D1: $51d85818;
                                                                  D2: $8220;
                                                                  D3: $448c;
                                                                  D4: ($80, $66, $d6, $9b, $ed, $16, $c9, $ad));

  CODECAPI_GUID_AVEncCommonFormatATSC          :  TGUID = (D1: $8d7b897c;
                                                                  D2: $a019;
                                                                  D3: $4670;
                                                                  D4: ($aa, $76, $2e, $dc, $ac, $7a, $c2, $96));

  CODECAPI_GUID_AVEncCommonFormatDVB           :  TGUID = (D1: $71830d8f;
                                                                  D2: $6c33;
                                                                  D3: $430d;
                                                                  D4: ($84, $4b, $c2, $70, $5b, $aa, $e6, $db));

  CODECAPI_GUID_AVEncCommonFormatMP3           :  TGUID = (D1: $349733cd;
                                                                  D2: $eb08;
                                                                  D3: $4dc2;
                                                                  D4: ($81, $97, $e4, $98, $35, $ef, $82, $8b));

  CODECAPI_GUID_AVEncCommonFormatHighMAT       :  TGUID = (D1: $1eabe760;
                                                                  D2: $fb2b;
                                                                  D3: $4928;
                                                                  D4: ($90, $d1, $78, $db, $88, $ee, $e8, $89));

  CODECAPI_GUID_AVEncCommonFormatHighMPV       :  TGUID = (D1: $a2d25db8;
                                                                  D2: $b8f9;
                                                                  D3: $42c2;
                                                                  D4: ($8b, $c7, $0b, $93, $cf, $60, $47, $88));
  CODECAPI_AVEncCodecType                      :  TGUID = (D1: $08af4ac1;
                                                                  D2: $f3f2;
                                                                  D3: $4c74;
                                                                  D4: ($9d, $cf, $37, $f2, $ec, $79, $f8, $26));

  CODECAPI_GUID_AVEncMPEG1Video                :  TGUID = (D1: $c8dafefe;
                                                                  D2: $da1e;
                                                                  D3: $4774;
                                                                  D4: ($b2, $7d, $11, $83, $0c, $16, $b1, $fe));

  CODECAPI_GUID_AVEncMPEG2Video                :  TGUID = (D1: $046dc19a;
                                                                  D2: $6677;
                                                                  D3: $4aaa;
                                                                  D4: ($a3, $1d, $c1, $ab, $71, $6f, $45, $60));

  CODECAPI_GUID_AVEncMPEG1Audio                :  TGUID = (D1: $d4dd1362;
                                                                  D2: $cd4a;
                                                                  D3: $4cd6;
                                                                  D4: ($81, $38, $b9, $4d, $b4, $54, $2b, $04));

  CODECAPI_GUID_AVEncMPEG2Audio                :  TGUID = (D1: $ee4cbb1f;
                                                                  D2: $9c3f;
                                                                  D3: $4770;
                                                                  D4: ($92, $b5, $fc, $b7, $c2, $a8, $d3, $81));

  CODECAPI_GUID_AVEncWMV                       :  TGUID = (D1: $4e0fef9b;
                                                                  D2: $1d43;
                                                                  D3: $41bd;
                                                                  D4: ($b8, $bd, $4d, $7b, $f7, $45, $7a, $2a));

  CODECAPI_GUID_AVEndMPEG4Video                :  TGUID = (D1: $dd37b12a;
                                                                  D2: $9503;
                                                                  D3: $4f8b;
                                                                  D4: ($b8, $d0, $32, $4a, $00, $c0, $a1, $cf));

  CODECAPI_GUID_AVEncH264Video                 :  TGUID = (D1: $95044eab;
                                                                  D2: $31b3;
                                                                  D3: $47de;
                                                                  D4: ($8e, $75, $38, $a4, $2b, $b0, $3e, $28));

  CODECAPI_GUID_AVEncDV                        :  TGUID = (D1: $09b769c7;
                                                                  D2: $3329;
                                                                  D3: $44fb;
                                                                  D4: ($89, $54, $fa, $30, $93, $7d, $3d, $5a));

  CODECAPI_GUID_AVEncWMAPro                    :  TGUID = (D1: $1955f90c;
                                                                  D2: $33f7;
                                                                  D3: $4a68;
                                                                  D4: ($ab, $81, $53, $f5, $65, $71, $25, $c4));
  CODECAPI_GUID_AVEncWMALossless               :  TGUID = (D1: $55ca7265;
                                                                  D2: $23d8;
                                                                  D3: $4761;
                                                                  D4: ($90, $31, $b7, $4f, $be, $12, $f4, $c1));
  CODECAPI_GUID_AVEncWMAVoice                  :  TGUID = (D1: $13ed18cb;
                                                                  D2: $50e8;
                                                                  D3: $4276;
                                                                  D4: ($a2, $88, $a6, $aa, $22, $83, $82, $d9));
  CODECAPI_GUID_AVEncDolbyDigitalPro           :  TGUID = (D1: $f5be76cc;
                                                                  D2: $0ff8;
                                                                  D3: $40eb;
                                                                  D4: ($9c, $b1, $bb, $a9, $40, $04, $d4, $4f));
  CODECAPI_GUID_AVEncDolbyDigitalConsumer      :  TGUID = (D1: $c1a7bf6c;
                                                                  D2: $0059;
                                                                  D3: $4bfa;
                                                                  D4: ($94, $ef, $ef, $74, $7a, $76, $8d, $52));
  CODECAPI_GUID_AVEncDolbyDigitalPlus          :  TGUID = (D1: $698d1b80;
                                                                  D2: $f7dd;
                                                                  D3: $415c;
                                                                  D4: ($97, $1c, $42, $49, $2a, $20, $56, $c6));
  CODECAPI_GUID_AVEncDTSHD                     :  TGUID = (D1: $2052e630;
                                                                  D2: $469d;
                                                                  D3: $4bfb;
                                                                  D4: ($80, $ca, $1d, $65, $6e, $7e, $91, $8f));
  CODECAPI_GUID_AVEncDTS                       :  TGUID = (D1: $45fbcaa2;
                                                                  D2: $5e6e;
                                                                  D3: $4ab0;
                                                                  D4: ($88, $93, $59, $03, $be, $e9, $3a, $cf));
  CODECAPI_GUID_AVEncMLP                       :  TGUID = (D1: $05f73e29;
                                                                  D2: $f0d1;
                                                                  D3: $431e;
                                                                  D4: ($a4, $1c, $a4, $74, $32, $ec, $5a, $66));
  CODECAPI_GUID_AVEncPCM                       :  TGUID = (D1: $844be7f4;
                                                                  D2: $26cf;
                                                                  D3: $4779;
                                                                  D4: ($b3, $86, $cc, $05, $d1, $87, $99, $0c));
  CODECAPI_GUID_AVEncSDDS                      :  TGUID = (D1: $1dc1b82f;
                                                                  D2: $11c8;
                                                                  D3: $4c71;
                                                                  D4: ($b7, $b6, $ee, $3e, $b9, $bc, $2b, $94));
  CODECAPI_AVEncCommonRateControlMode          :  TGUID = (D1: $1c0608e9;
                                                                  D2: $370c;
                                                                  D3: $4710;
                                                                  D4: ($8a, $58, $cb, $61, $81, $c4, $24, $23));
  CODECAPI_AVEncCommonLowLatency               :  TGUID = (D1: $9d3ecd55;
                                                                  D2: $89e8;
                                                                  D3: $490a;
                                                                  D4: ($97, $0a, $0c, $95, $48, $d5, $a5, $6e));
  CODECAPI_AVEncCommonMultipassMode            :  TGUID = (D1: $22533d4c;
                                                                  D2: $47e1;
                                                                  D3: $41b5;
                                                                  D4: ($93, $52, $a2, $b7, $78, $0e, $7a, $c4));
  CODECAPI_AVEncCommonPassStart                :  TGUID = (D1: $6a67739f;
                                                                  D2: $4eb5;
                                                                  D3: $4385;
                                                                  D4: ($99, $28, $f2, $76, $a9, $39, $ef, $95));
  CODECAPI_AVEncCommonPassEnd                  :  TGUID = (D1: $0e3d01bc;
                                                                  D2: $c85c;
                                                                  D3: $467d;
                                                                  D4: ($8b, $60, $c4, $10, $12, $ee, $3b, $f6));
  CODECAPI_AVEncCommonRealTime                 :  TGUID = (D1: $143a0ff6;
                                                                  D2: $a131;
                                                                  D3: $43da;
                                                                  D4: ($b8, $1e, $98, $fb, $b8, $ec, $37, $8e));
  CODECAPI_AVEncCommonQuality                  :  TGUID = (D1: $fcbf57a3;
                                                                  D2: $7ea5;
                                                                  D3: $4b0c;
                                                                  D4: ($96, $44, $69, $b4, $0c, $39, $c3, $91));
  CODECAPI_AVEncCommonQualityVsSpeed           :  TGUID = (D1: $98332df8;
                                                                  D2: $03cd;
                                                                  D3: $476b;
                                                                  D4: ($89, $fa, $3f, $9e, $44, $2d, $ec, $9f));
  CODECAPI_AVEncCommonTranscodeEncodingProfile :  TGUID = (D1: $6947787C;
                                                                  D2: $F508;
                                                                  D3: $4EA9;
                                                                  D4: ($B1, $E9, $A1, $FE, $3A, $49, $FB, $C9));
  CODECAPI_AVEncCommonMeanBitRate              :  TGUID = (D1: $f7222374;
                                                                  D2: $2144;
                                                                  D3: $4815;
                                                                  D4: ($b5, $50, $a3, $7f, $8e, $12, $ee, $52));
  CODECAPI_AVEncCommonMeanBitRateInterval      :  TGUID = (D1: $bfaa2f0c;
                                                                  D2: $cb82;
                                                                  D3: $4bc0;
                                                                  D4: ($84, $74, $f0, $6a, $8a, $0d, $02, $58));
  CODECAPI_AVEncCommonMaxBitRate               :  TGUID = (D1: $9651eae4;
                                                                  D2: $39b9;
                                                                  D3: $4ebf;
                                                                  D4: ($85, $ef, $d7, $f4, $44, $ec, $74, $65));
  CODECAPI_AVEncCommonMinBitRate               :  TGUID = (D1: $101405b2;
                                                                  D2: $2083;
                                                                  D3: $4034;
                                                                  D4: ($a8, $06, $ef, $be, $dd, $d7, $c9, $ff));
  CODECAPI_AVEncCommonBufferSize               :  TGUID = (D1: $0db96574;
                                                                  D2: $b6a4;
                                                                  D3: $4c8b;
                                                                  D4: ($81, $06, $37, $73, $de, $03, $10, $cd));
  CODECAPI_AVEncCommonBufferInLevel            :  TGUID = (D1: $d9c5c8db;
                                                                  D2: $fc74;
                                                                  D3: $4064;
                                                                  D4: ($94, $e9, $cd, $19, $f9, $47, $ed, $45));
  CODECAPI_AVEncCommonBufferOutLevel           :  TGUID = (D1: $ccae7f49;
                                                                  D2: $d0bc;
                                                                  D3: $4e3d;
                                                                  D4: ($a5, $7e, $fb, $57, $40, $14, $00, $69));
  CODECAPI_AVEncCommonStreamEndHandling        :  TGUID = (D1: $6aad30af;
                                                                  D2: $6ba8;
                                                                  D3: $4ccc;
                                                                  D4: ($8f, $ca, $18, $d1, $9b, $ea, $eb, $1c));
  CODECAPI_AVEncStatCommonCompletedPasses      :  TGUID = (D1: $3e5de533;
                                                                  D2: $9df7;
                                                                  D3: $438c;
                                                                  D4: ($85, $4f, $9f, $7d, $d3, $68, $3d, $34));
  CODECAPI_AVEncVideoOutputFrameRate           :  TGUID = (D1: $ea85e7c3;
                                                                  D2: $9567;
                                                                  D3: $4d99;
                                                                  D4: ($87, $c4, $02, $c1, $c2, $78, $ca, $7c));
  CODECAPI_AVEncVideoOutputFrameRateConversion :  TGUID = (D1: $8c068bf4;
                                                                  D2: $369a;
                                                                  D3: $4ba3;
                                                                  D4: ($82, $fd, $b2, $51, $8f, $b3, $39, $6e));
  CODECAPI_AVEncVideoPixelAspectRatio          :  TGUID = (D1: $3cdc718f;
                                                                  D2: $b3e9;
                                                                  D3: $4eb6;
                                                                  D4: ($a5, $7f, $cf, $1f, $1b, $32, $1b, $87));
  CODECAPI_AVEncVideoForceSourceScanType       :  TGUID = (D1: $1ef2065f;
                                                                  D2: $058a;
                                                                  D3: $4765;
                                                                  D4: ($a4, $fc, $8a, $86, $4c, $10, $30, $12));
  CODECAPI_AVEncVideoNoOfFieldsToEncode        :  TGUID = (D1: $61e4bbe2;
                                                                  D2: $4ee0;
                                                                  D3: $40e7;
                                                                  D4: ($80, $ab, $51, $dd, $ee, $be, $62, $91));
  CODECAPI_AVEncVideoNoOfFieldsToSkip          :  TGUID = (D1: $a97e1240;
                                                                  D2: $1427;
                                                                  D3: $4c16;
                                                                  D4: ($a7, $f7, $3d, $cf, $d8, $ba, $4c, $c5));

  CODECAPI_AVEncVideoEncodeDimension           :  TGUID = (D1: $1074df28;
                                                                  D2: $7e0f;
                                                                  D3: $47a4;
                                                                  D4: ($a4, $53, $cd, $d7, $38, $70, $f5, $ce));

  CODECAPI_AVEncVideoEncodeOffsetOrigin        :  TGUID = (D1: $6bc098fe;
                                                                  D2: $a71a;
                                                                  D3: $4454;
                                                                  D4: ($85, $2e, $4d, $2d, $de, $b2, $cd, $24));
  CODECAPI_AVEncVideoDisplayDimension          :  TGUID = (D1: $de053668;
                                                                  D2: $f4ec;
                                                                  D3: $47a9;
                                                                  D4: ($86, $d0, $83, $67, $70, $f0, $c1, $d5));
  CODECAPI_AVEncVideoOutputScanType            :  TGUID = (D1: $460b5576;
                                                                  D2: $842e;
                                                                  D3: $49ab;
                                                                  D4: ($a6, $2d, $b3, $6f, $73, $12, $c9, $db));
  CODECAPI_AVEncVideoInverseTelecineEnable     :  TGUID = (D1: $2ea9098b;
                                                                  D2: $e76d;
                                                                  D3: $4ccd;
                                                                  D4: ($a0, $30, $d3, $b8, $89, $c1, $b6, $4c));
  CODECAPI_AVEncVideoInverseTelecineThreshold  :  TGUID = (D1: $40247d84;
                                                                  D2: $e895;
                                                                  D3: $497f;
                                                                  D4: ($b4, $4c, $b7, $45, $60, $ac, $fe, $27));
  CODECAPI_AVEncVideoSourceFilmContent         :  TGUID = (D1: $1791c64b;
                                                                  D2: $ccfc;
                                                                  D3: $4827;
                                                                  D4: ($a0, $ed, $25, $57, $79, $3b, $2b, $1c));
  CODECAPI_AVEncVideoSourceIsBW                :  TGUID = (D1: $42ffc49b;
                                                                  D2: $1812;
                                                                  D3: $4fdc;
                                                                  D4: ($8d, $24, $70, $54, $c5, $21, $e6, $eb));
  CODECAPI_AVEncVideoFieldSwap                 :  TGUID = (D1: $fefd7569;
                                                                  D2: $4e0a;
                                                                  D3: $49f2;
                                                                  D4: ($9f, $2b, $36, $0e, $a4, $8c, $19, $a2));
  CODECAPI_AVEncVideoInputChromaResolution     :  TGUID = (D1: $bb0cec33;
                                                                  D2: $16f1;
                                                                  D3: $47b0;
                                                                  D4: ($8a, $88, $37, $81, $5b, $ee, $17, $39));
  CODECAPI_AVEncVideoOutputChromaResolution    :  TGUID = (D1: $6097b4c9;
                                                                  D2: $7c1d;
                                                                  D3: $4e64;
                                                                  D4: ($bf, $cc, $9e, $97, $65, $31, $8a, $e7));
  CODECAPI_AVEncVideoInputChromaSubsampling    :  TGUID = (D1: $a8e73a39;
                                                                  D2: $4435;
                                                                  D3: $4ec3;
                                                                  D4: ($a6, $ea, $98, $30, $0f, $4b, $36, $f7));
  CODECAPI_AVEncVideoOutputChromaSubsampling   :  TGUID = (D1: $fa561c6c;
                                                                  D2: $7d17;
                                                                  D3: $44f0;
                                                                  D4: ($83, $c9, $32, $ed, $12, $e9, $63, $43));
  CODECAPI_AVEncVideoInputColorPrimaries       :  TGUID = (D1: $c24d783f;
                                                                  D2: $7ce6;
                                                                  D3: $4278;
                                                                  D4: ($90, $ab, $28, $a4, $f1, $e5, $f8, $6c));
  CODECAPI_AVEncVideoOutputColorPrimaries      :  TGUID = (D1: $be95907c;
                                                                  D2: $9d04;
                                                                  D3: $4921;
                                                                  D4: ($89, $85, $a6, $d6, $d8, $7d, $1a, $6c));
  CODECAPI_AVEncVideoInputColorTransferFunction:  TGUID = (D1: $8c056111;
                                                                  D2: $a9c3;
                                                                  D3: $4b08;
                                                                  D4: ($a0, $a0, $ce, $13, $f8, $a2, $7c, $75));
  CODECAPI_AVEncVideoOutputColorTransferFunction :  TGUID = (D1: $4a7f884a;
                                                                  D2: $ea11;
                                                                  D3: $460d;
                                                                  D4: ($bf, $57, $b8, $8b, $c7, $59, $00, $de));
  CODECAPI_AVEncVideoInputColorTransferMatrix  :  TGUID = (D1: $52ed68b9;
                                                                  D2: $72d5;
                                                                  D3: $4089;
                                                                  D4: ($95, $8d, $f5, $40, $5d, $55, $08, $1c));
  CODECAPI_AVEncVideoOutputColorTransferMatrix :  TGUID = (D1: $a9b90444;
                                                                  D2: $af40;
                                                                  D3: $4310;
                                                                  D4: ($8f, $be, $ed, $6d, $93, $3f, $89, $2b));
  CODECAPI_AVEncVideoInputColorLighting        :  TGUID = (D1: $46a99549;
                                                                  D2: $0015;
                                                                  D3: $4a45;
                                                                  D4: ($9c, $30, $1d, $5c, $fa, $25, $83, $16));
  CODECAPI_AVEncVideoOutputColorLighting       :  TGUID = (D1: $0e5aaac6;
                                                                  D2: $ace6;
                                                                  D3: $4c5c;
                                                                  D4: ($99, $8e, $1a, $8c, $9c, $6c, $0f, $89));
  CODECAPI_AVEncVideoInputColorNominalRange    :  TGUID = (D1: $16cf25c6;
                                                                  D2: $a2a6;
                                                                  D3: $48e9;
                                                                  D4: ($ae, $80, $21, $ae, $c4, $1d, $42, $7e));
  CODECAPI_AVEncVideoOutputColorNominalRange   :  TGUID = (D1: $972835ed;
                                                                  D2: $87b5;
                                                                  D3: $4e95;
                                                                  D4: ($95, $00, $c7, $39, $58, $56, $6e, $54));
  CODECAPI_AVEncInputVideoSystem               :  TGUID = (D1: $bede146d;
                                                                  D2: $b616;
                                                                  D3: $4dc7;
                                                                  D4: ($92, $b2, $f5, $d9, $fa, $92, $98, $f7));
  CODECAPI_AVEncVideoHeaderDropFrame           :  TGUID = (D1: $6ed9e124;
                                                                  D2: $7925;
                                                                  D3: $43fe;
                                                                  D4: ($97, $1b, $e0, $19, $f6, $22, $22, $b4));
  CODECAPI_AVEncVideoHeaderHours               :  TGUID = (D1: $2acc7702;
                                                                  D2: $e2da;
                                                                  D3: $4158;
                                                                  D4: ($bf, $9b, $88, $88, $01, $29, $d7, $40));
  CODECAPI_AVEncVideoHeaderMinutes             :  TGUID = (D1: $dc1a99ce;
                                                                  D2: $0307;
                                                                  D3: $408b;
                                                                  D4: ($88, $0b, $b8, $34, $8e, $e8, $ca, $7f));
  CODECAPI_AVEncVideoHeaderSeconds             :  TGUID = (D1: $4a2e1a05;
                                                                  D2: $a780;
                                                                  D3: $4f58;
                                                                  D4: ($81, $20, $9a, $44, $9d, $69, $65, $6b));
  CODECAPI_AVEncVideoHeaderFrames              :  TGUID = (D1: $afd5f567;
                                                                  D2: $5c1b;
                                                                  D3: $4adc;
                                                                  D4: ($bd, $af, $73, $56, $10, $38, $14, $36));
  CODECAPI_AVEncVideoDefaultUpperFieldDominant :  TGUID = (D1: $810167c4;
                                                                  D2: $0bc1;
                                                                  D3: $47ca;
                                                                  D4: ($8f, $c2, $57, $05, $5a, $14, $74, $a5));
  CODECAPI_AVEncVideoCBRMotionTradeoff         :  TGUID = (D1: $0d49451e;
                                                                  D2: $18d5;
                                                                  D3: $4367;
                                                                  D4: ($a4, $ef, $32, $40, $df, $16, $93, $c4));
  CODECAPI_AVEncVideoCodedVideoAccessUnitSize  :  TGUID = (D1: $b4b10c15;
                                                                  D2: $14a7;
                                                                  D3: $4ce8;
                                                                  D4: ($b1, $73, $dc, $90, $a0, $b4, $fc, $db));
  CODECAPI_AVEncVideoMaxKeyframeDistance       :  TGUID = (D1: $2987123a;
                                                                  D2: $ba93;
                                                                  D3: $4704;
                                                                  D4: ($b4, $89, $ec, $1e, $5f, $25, $29, $2c));
  CODECAPI_AVEncH264CABACEnable                :  TGUID = (D1: $ee6cad62;
                                                                  D2: $d305;
                                                                  D3: $4248;
                                                                  D4: ($a5, $e, $e1, $b2, $55, $f7, $ca, $f8));
  CODECAPI_AVEncVideoContentType               :  TGUID = (D1: $66117aca;
                                                                  D2: $eb77;
                                                                  D3: $459d;
                                                                  D4: ($93, $c, $a4, $8d, $9d, $6, $83, $fc));
  CODECAPI_AVEncNumWorkerThreads               :  TGUID = (D1: $b0c8bf60;
                                                                  D2: $16f7;
                                                                  D3: $4951;
                                                                  D4: ($a3, $b, $1d, $b1, $60, $92, $93, $d6));
  CODECAPI_AVEncVideoEncodeQP                  :  TGUID = (D1: $2cb5696b;
                                                                  D2: $23fb;
                                                                  D3: $4ce1;
                                                                  D4: ($a0, $f9, $ef, $5b, $90, $fd, $55, $ca));

  CODECAPI_AVEncVideoMinQP                     :  TGUID = (D1: $0ee22c6a;
                                                                  D2: $a37c;
                                                                  D3: $4568;
                                                                  D4: ($b5, $f1, $9d, $4c, $2b, $3a, $b8, $86));

  CODECAPI_AVEncVideoForceKeyFrame             :  TGUID = (D1: $398c1b98;
                                                                  D2: $8353;
                                                                  D3: $475a;
                                                                  D4: ($9e, $f2, $8f, $26, $5d, $26, $3, $45));

  CODECAPI_AVEncH264SPSID                      :  TGUID = (D1: $50f38f51;
                                                                  D2: $2b79;
                                                                  D3: $40e3;
                                                                  D4: ($b3, $9c, $7e, $9f, $a0, $77, $5, $1));

  CODECAPI_AVEncH264PPSID                      :  TGUID = (D1: $bfe29ec2;
                                                                  D2: $56c;
                                                                  D3: $4d68;
                                                                  D4: ($a3, $8d, $ae, $59, $44, $c8, $58, $2e));

  CODECAPI_AVEncAdaptiveMode                   :  TGUID = (D1: $4419b185;
                                                                  D2: $da1f;
                                                                  D3: $4f53;
                                                                  D4: ($bc, $76, $9, $7d, $c, $1e, $fb, $1e));

  CODECAPI_AVEncVideoTemporalLayerCount        :  TGUID = (D1: $19caebff;
                                                                  D2: $b74d;
                                                                  D3: $4cfd;
                                                                  D4: ($8c, $27, $c2, $f9, $d9, $7d, $5f, $52));

  CODECAPI_AVEncVideoUsage                     :  TGUID = (D1: $1f636849;
                                                                  D2: $5dc1;
                                                                  D3: $49f1;
                                                                  D4: ($b1, $d8, $ce, $3c, $f6, $2e, $a3, $85));

  CODECAPI_AVEncVideoSelectLayer               :  TGUID = (D1: $eb1084f5;
                                                                  D2: $6aaa;
                                                                  D3: $4914;
                                                                  D4: ($bb, $2f, $61, $47, $22, $7f, $12, $e7));

  CODECAPI_AVEncVideoRateControlParams         :  TGUID = (D1: $87d43767;
                                                                  D2: $7645;
                                                                  D3: $44ec;
                                                                  D4: ($b4, $38, $d3, $32, $2f, $bc, $a2, $9f));

  CODECAPI_AVEncVideoSupportedControls         :  TGUID = (D1: $d3f40fdd;
                                                                  D2: $77b9;
                                                                  D3: $473d;
                                                                  D4: ($81, $96, $6, $12, $59, $e6, $9c, $ff));

  CODECAPI_AVEncVideoEncodeFrameTypeQP         :  TGUID = (D1: $aa70b610;
                                                                  D2: $e03f;
                                                                  D3: $450c;
                                                                  D4: ($ad, $07, $07, $31, $4e, $63, $9c, $e7));

  CODECAPI_AVEncSliceControlMode               :  TGUID = (D1: $e9e782ef;
                                                                  D2: $5f18;
                                                                  D3: $44c9;
                                                                  D4: ($a9, $0b, $e9, $c3, $c2, $c1, $7b, $0b));

  CODECAPI_AVEncSliceControlSize               :  TGUID = (D1: $92f51df3;
                                                                  D2: $07a5;
                                                                  D3: $4172;
                                                                  D4: ($ae, $fe, $c6, $9c, $a3, $b6, $0e, $35));

  CODECAPI_AVEncSliceGenerationMode            :  TGUID = (D1: $8a6bc67f;
                                                                  D2: $9497;
                                                                  D3: $4286;
                                                                  D4: ($b4, $6b, $02, $db, $8d, $60, $ed, $bc));

  CODECAPI_AVEncVideoMaxNumRefFrame            :  TGUID = (D1: $964829ed;
                                                                  D2: $94f9;
                                                                  D3: $43b4;
                                                                  D4: ($b7, $4d, $ef, $40, $94, $4b, $69, $a0));

  CODECAPI_AVEncVideoMeanAbsoluteDifference    :  TGUID = (D1: $e5c0c10f;
                                                                  D2: $81a4;
                                                                  D3: $422d;
                                                                  D4: ($8c, $3f, $b4, $74, $a4, $58, $13, $36));

  CODECAPI_AVEncVideoMaxQP                     :  TGUID = (D1: $3daf6f66;
                                                                  D2: $a6a7;
                                                                  D3: $45e0;
                                                                  D4: ($a8, $e5, $f2, $74, $3f, $46, $a3, $a2));

  CODECAPI_AVEncVideoLTRBufferControl          :  TGUID = (D1: $a4a0e93d;
                                                                  D2: $4cbc;
                                                                  D3: $444c;
                                                                  D4: ($89, $f4, $82, $6d, $31, $0e, $92, $a7));

  CODECAPI_AVEncVideoMarkLTRFrame              :  TGUID = (D1: $e42f4748;
                                                                  D2: $a06d;
                                                                  D3: $4ef9;
                                                                  D4: ($8c, $ea, $3d, $05, $fd, $e3, $bd, $3b));

  CODECAPI_AVEncVideoUseLTRFrame               :  TGUID = (D1: $00752db8;
                                                                  D2: $55f7;
                                                                  D3: $4f80;
                                                                  D4: ($89, $5b, $27, $63, $91, $95, $f2, $ad));

  CODECAPI_AVEncVideoROIEnabled                :  TGUID = (D1: $d74f7f18;
                                                                  D2: $44dd;
                                                                  D3: $4b85;
                                                                  D4: ($ab, $a3, $5, $d9, $f4, $2a, $82, $80));

  CODECAPI_AVEncVideoDirtyRectEnabled          :  TGUID = (D1: $8acb8fdd;
                                                                  D2: $5e0c;
                                                                  D3: $4c66;
                                                                  D4: ($87, $29, $b8, $f6, $29, $ab, $04, $fb));

  CODECAPI_AVScenarioInfo                      :  TGUID = (D1: $b28a6e64;
                                                                  D2: $3ff9;
                                                                  D3: $446a;
                                                                  D4: ($8a, $4b, $0d, $7a, $53, $41, $32, $36));

  CODECAPI_AVEncMPVGOPSizeMin                  :  TGUID = (D1: $7155cf20;
                                                                  D2: $d440;
                                                                  D3: $4852;
                                                                  D4: ($ad, $0f, $9c, $4a, $bf, $e3, $7a, $6a));

  CODECAPI_AVEncMPVGOPSizeMax                  :  TGUID = (D1: $fe7de4c4;
                                                                  D2: $1936;
                                                                  D3: $4fe2;
                                                                  D4: ($bd, $f7, $1f, $18, $ca, $1d, $00, $1f));

  CODECAPI_AVEncVideoMaxCTBSize                :  TGUID = (D1: $822363ff;
                                                                  D2: $cec8;
                                                                  D3: $43e5;
                                                                  D4: ($92, $fd, $e0, $97, $48, $84, $85, $e9));

  CODECAPI_AVEncVideoCTBSize                   :  TGUID = (D1: $d47db8b2;
                                                                  D2: $e73b;
                                                                  D3: $4cb9;
                                                                  D4: ($8c, $3e, $bd, $87, $7d, $06, $d7, $7b));

  CODECAPI_VideoEncoderDisplayContentType      :  TGUID = (D1: $79b90b27;
                                                                  D2: $f4b1;
                                                                  D3: $42dc;
                                                                  D4: ($9d, $d7, $cd, $af, $81, $35, $c4, $00));

  CODECAPI_AVEncEnableVideoProcessing          :  TGUID = (D1: $006f4bf6;
                                                                  D2: $0ea3;
                                                                  D3: $4d42;
                                                                  D4: ($87, $02, $b5, $d8, $be, $0f, $7a, $92));

  CODECAPI_AVEncVideoGradualIntraRefresh       :  TGUID = (D1: $8f347dee;
                                                                  D2: $cb0d;
                                                                  D3: $49ba;
                                                                  D4: ($b4, $62, $db, $69, $27, $ee, $21, $01));

  CODECAPI_GetOPMContext                       :  TGUID = (D1: $2f036c05;
                                                                  D2: $4c14;
                                                                  D3: $4689;
                                                                  D4: ($88, $39, $29, $4c, $6d, $73, $e0, $53));

  CODECAPI_SetHDCPManagerContext               :  TGUID = (D1: $6d2d1fc8;
                                                                  D2: $3dc9;
                                                                  D3: $47eb;
                                                                  D4: ($a1, $a2, $47, $1c, $80, $cd, $60, $d0));

  CODECAPI_AVEncVideoMaxTemporalLayers         :  TGUID = (D1: $9c668cfe;
                                                                  D2: $08e1;
                                                                  D3: $424a;
                                                                  D4: ($93, $4e, $b7, $64, $b0, $64, $80, $2a));

  CODECAPI_AVEncVideoNumGOPsPerIDR             :  TGUID = (D1: $83bc5bdb;
                                                                  D2: $5b89;
                                                                  D3: $4521;
                                                                  D4: ($8f, $66, $33, $15, $1c, $37, $31, $76));

  CODECAPI_AVEncCommonAllowFrameDrops          :  TGUID = (D1: $d8477dcb;
                                                                  D2: $9598;
                                                                  D3: $48e3;
                                                                  D4: ($8d, $0c, $75, $2b, $f2, $06, $09, $3e));

  CODECAPI_AVEncVideoIntraLayerPrediction      :  TGUID = (D1: $d3af46b8;
                                                                  D2: $bf47;
                                                                  D3: $44bb;
                                                                  D4: ($a2, $83, $69, $f0, $b0, $22, $8f, $f9));

  CODECAPI_AVEncVideoInstantTemporalUpSwitching  :	TGUID = (D1: $a3308307;
                                                                   D2: $0d96;
                                                                   D3: $4ba4;
                                                                   D4: ($b1, $f0, $b9, $1a, $5e, $49, $df, $10));

  CODECAPI_AVEncLowPowerEncoder                 :	TGUID = (D1: $b668d582;
                                                                   D2: $8bad;
                                                                   D3: $4f6a;
                                                                   D4: ($91, $41, $37, $5a, $95, $35, $8b, $6d));

  CODECAPI_AVEnableInLoopDeblockFilter          :	TGUID = (D1: $d2e8e399;
                                                                   D2: $0623;
                                                                   D3: $4bf3;
                                                                   D4: ($92, $a8, $4d, $18, $18, $52, $9d, $ed));

  CODECAPI_AVEncMuxOutputStreamType            :  TGUID = (D1: $cedd9e8f;
                                                                  D2: $34d3;
                                                                  D3: $44db;
                                                                  D4: ($a1, $d8, $f8, $15, $20, $25, $4f, $3e));

  CODECAPI_AVEncStatVideoOutputFrameRate       :  TGUID = (D1: $be747849;
                                                                  D2: $9ab4;
                                                                  D3: $4a63;
                                                                  D4: ($98, $fe, $f1, $43, $f0, $4f, $8e, $e9));

  CODECAPI_AVEncStatVideoCodedFrames           :  TGUID = (D1: $d47f8d61;
                                                                  D2: $6f5a;
                                                                  D3: $4a26;
                                                                  D4: ($bb, $9f, $cd, $95, $18, $46, $2b, $cd));
  CODECAPI_AVEncStatVideoTotalFrames           :  TGUID = (D1: $fdaa9916;
                                                                  D2: $119a;
                                                                  D3: $4222;
                                                                  D4: ($9a, $d6, $3f, $7c, $ab, $99, $cc, $8b));

  CODECAPI_AVEncAudioIntervalToEncode          :  TGUID = (D1: $866e4b4d;
                                                                  D2: $725a;
                                                                  D3: $467c;
                                                                  D4: ($bb, $01, $b4, $96, $b2, $3b, $25, $f9));

  CODECAPI_AVEncAudioIntervalToSkip            :  TGUID = (D1: $88c15f94;
                                                                  D2: $c38c;
                                                                  D3: $4796;
                                                                  D4: ($a9, $e8, $96, $e9, $67, $98, $3f, $26));

  CODECAPI_AVEncAudioDualMono                  :  TGUID = (D1: $3648126b;
                                                                  D2: $a3e8;
                                                                  D3: $4329;
                                                                  D4: ($9b, $3a, $5c, $e5, $66, $a4, $3b, $d3));

  CODECAPI_AVEncAudioMeanBitRate               :  TGUID = (D1: $921295bb;
                                                                  D2: $4fca;
                                                                  D3: $4679;
                                                                  D4: ($aa, $b8, $9e, $2a, $1d, $75, $33, $84));

  CODECAPI_AVEncAudioMapDestChannel0           :  TGUID = (D1: $bc5d0b60;
                                                                  D2: $df6a;
                                                                  D3: $4e16;
                                                                  D4: ($98, $03, $b8, $20, $07, $a3, $0c, $8d));

  CODECAPI_AVEncAudioMapDestChannel1           :  TGUID = (D1: $bc5d0b61;
                                                                  D2: $df6a;
                                                                  D3: $4e16;
                                                                  D4: ($98, $03, $b8, $20, $07, $a3, $0c, $8d));

  CODECAPI_AVEncAudioMapDestChannel2           :  TGUID = (D1: $bc5d0b62;
                                                                  D2: $df6a;
                                                                  D3: $4e16;
                                                                  D4: ($98, $03, $b8, $20, $07, $a3, $0c, $8d));

  CODECAPI_AVEncAudioMapDestChannel3           :  TGUID = (D1: $bc5d0b63;
                                                                  D2: $df6a;
                                                                  D3: $4e16;
                                                                  D4: ($98, $03, $b8, $20, $07, $a3, $0c, $8d));

  CODECAPI_AVEncAudioMapDestChannel4           :  TGUID = (D1: $bc5d0b64;
                                                                  D2: $df6a;
                                                                  D3: $4e16;
                                                                  D4: ($98, $03, $b8, $20, $07, $a3, $0c, $8d));

  CODECAPI_AVEncAudioMapDestChannel5           :  TGUID = (D1: $bc5d0b65;
                                                                  D2: $df6a;
                                                                  D3: $4e16;
                                                                  D4: ($98, $03, $b8, $20, $07, $a3, $0c, $8d));

  CODECAPI_AVEncAudioMapDestChannel6           :  TGUID = (D1: $bc5d0b66;
                                                                  D2: $df6a;
                                                                  D3: $4e16;
                                                                  D4: ($98, $03, $b8, $20, $07, $a3, $0c, $8d));

  CODECAPI_AVEncAudioMapDestChannel7           :  TGUID = (D1: $bc5d0b67;
                                                                  D2: $df6a;
                                                                  D3: $4e16;
                                                                  D4: ($98, $03, $b8, $20, $07, $a3, $0c, $8d));

  CODECAPI_AVEncAudioMapDestChannel8           :  TGUID = (D1: $bc5d0b68;
                                                                  D2: $df6a;
                                                                  D3: $4e16;
                                                                  D4: ($98, $03, $b8, $20, $07, $a3, $0c, $8d));

  CODECAPI_AVEncAudioMapDestChannel9           :  TGUID = (D1: $bc5d0b69;
                                                                  D2: $df6a;
                                                                  D3: $4e16;
                                                                  D4: ($98, $03, $b8, $20, $07, $a3, $0c, $8d));

  CODECAPI_AVEncAudioMapDestChannel10          :  TGUID = (D1: $bc5d0b6a;
                                                                  D2: $df6a;
                                                                  D3: $4e16;
                                                                  D4: ($98, $03, $b8, $20, $07, $a3, $0c, $8d));

  CODECAPI_AVEncAudioMapDestChannel11          :  TGUID = (D1: $bc5d0b6b;
                                                                  D2: $df6a;
                                                                  D3: $4e16;
                                                                  D4: ($98, $03, $b8, $20, $07, $a3, $0c, $8d));

  CODECAPI_AVEncAudioMapDestChannel12          :  TGUID = (D1: $bc5d0b6c;
                                                                  D2: $df6a;
                                                                  D3: $4e16;
                                                                  D4: ($98, $03, $b8, $20, $07, $a3, $0c, $8d));
  CODECAPI_AVEncAudioMapDestChannel13          :  TGUID = (D1: $bc5d0b6d;
                                                                  D2: $df6a;
                                                                  D3: $4e16;
                                                                  D4: ($98, $03, $b8, $20, $07, $a3, $0c, $8d));

  CODECAPI_AVEncAudioMapDestChannel14          :  TGUID = (D1: $bc5d0b6e;
                                                                  D2: $df6a;
                                                                  D3: $4e16;
                                                                  D4: ($98, $03, $b8, $20, $07, $a3, $0c, $8d));

  CODECAPI_AVEncAudioMapDestChannel15          :  TGUID = (D1: $bc5d0b6f;
                                                                  D2: $df6a;
                                                                  D3: $4e16;
                                                                  D4: ($98, $03, $b8, $20, $07, $a3, $0c, $8d));

  CODECAPI_AVEncAudioInputContent              :  TGUID = (D1: $3e226c2b;
                                                                  D2: $60b9;
                                                                  D3: $4a39;
                                                                  D4: ($b0, $0b, $a7, $b4, $0f, $70, $d5, $66));
  CODECAPI_AVEncStatAudioPeakPCMValue          :  TGUID = (D1: $dce7fd34;
                                                                  D2: $dc00;
                                                                  D3: $4c16;
                                                                  D4: ($82, $1b, $35, $d9, $eb, $00, $fb, $1a));
  CODECAPI_AVEncStatAudioAveragePCMValue       :  TGUID = (D1: $979272f8;
                                                                  D2: $d17f;
                                                                  D3: $4e32;
                                                                  D4: ($bb, $73, $4e, $73, $1c, $68, $ba, $2d));
  CODECAPI_AVEncStatAudioAverageBPS            :  TGUID = (D1: $ca6724db;
                                                                  D2: $7059;
                                                                  D3: $4351;
                                                                  D4: ($8b, $43, $f8, $21, $98, $82, $6a, $14));

  CODECAPI_AVEncStatAverageBPS                 :  TGUID = (D1: $ca6724db;
                                                                  D2: $7059;
                                                                  D3: $4351;
                                                                  D4: ($8b, $43, $f8, $21, $98, $82, $6a, $14));

  CODECAPI_AVEncStatHardwareProcessorUtilitization :  TGUID = (D1: $995dc027;
                                                                      D2: $cb95;
                                                                      D3: $49e6;
                                                                      D4: ($b9, $1b, $59, $67, $75, $3c, $dc, $b8));

  CODECAPI_AVEncStatHardwareBandwidthUtilitization :  TGUID = (D1: $0124ba9b;
                                                                      D2: $dc41;
                                                                      D3: $4826;
                                                                      D4: ($b4, $5f, $18, $ac, $01, $b3, $d5, $a8));

  CODECAPI_AVEncMPVGOPSize                     :  TGUID = (D1: $95f31b26;
                                                                  D2: $95a4;
                                                                  D3: $41aa;
                                                                  D4: ($93, $03, $24, $6a, $7f, $c6, $ee, $f1));
  CODECAPI_AVEncMPVGOPOpen                     :  TGUID = (D1: $b1d5d4a6;
                                                                  D2: $3300;
                                                                  D3: $49b1;
                                                                  D4: ($ae, $61, $a0, $99, $37, $ab, $0e, $49));
  CODECAPI_AVEncMPVDefaultBPictureCount        :  TGUID = (D1: $8d390aac;
                                                                  D2: $dc5c;
                                                                  D3: $4200;
                                                                  D4: ($b5, $7f, $81, $4d, $04, $ba, $ba, $b2));
  CODECAPI_AVEncMPVProfile                     :  TGUID = (D1: $dabb534a;
                                                                  D2: $1d99;
                                                                  D3: $4284;
                                                                  D4: ($97, $5a, $d9, $0e, $22, $39, $ba, $a1));
  CODECAPI_AVEncMPVLevel                       :  TGUID = (D1: $6ee40c40;
                                                                  D2: $a60c;
                                                                  D3: $41ef;
                                                                  D4: ($8f, $50, $37, $c2, $24, $9e, $2c, $b3));
  CODECAPI_AVEncMPVFrameFieldMode              :  TGUID = (D1: $acb5de96;
                                                                  D2: $7b93;
                                                                  D3: $4c2f;
                                                                  D4: ($88, $25, $b0, $29, $5f, $a9, $3b, $f4));
  CODECAPI_AVEncMPVAddSeqEndCode               :  TGUID = (D1: $a823178f;
                                                                  D2: $57df;
                                                                  D3: $4c7a;
                                                                  D4: ($b8, $fd, $e5, $ec, $88, $87, $70, $8d));

  CODECAPI_AVEncMPVGOPSInSeq                   :  TGUID = (D1: $993410d4;
                                                                  D2: $2691;
                                                                  D3: $4192;
                                                                  D4: ($99, $78, $98, $dc, $26, $03, $66, $9f));

  CODECAPI_AVEncMPVUseConcealmentMotionVectors :  TGUID = (D1: $ec770cf3;
                                                                  D2: $6908;
                                                                  D3: $4b4b;
                                                                  D4: ($aa, $30, $7f, $b9, $86, $21, $4f, $ea));

  CODECAPI_AVEncMPVSceneDetection              :  TGUID = (D1: $552799f1;
                                                                  D2: $db4c;
                                                                  D3: $405b;
                                                                  D4: ($8a, $3a, $c9, $3f, $2d, $06, $74, $dc));

  CODECAPI_AVEncMPVGenerateHeaderSeqExt        :  TGUID = (D1: $d5e78611;
                                                                  D2: $082d;
                                                                  D3: $4e6b;
                                                                  D4: ($98, $af, $0f, $51, $ab, $13, $92, $22));

  CODECAPI_AVEncMPVGenerateHeaderSeqDispExt    :  TGUID = (D1: $6437aa6f;
                                                                  D2: $5a3c;
                                                                  D3: $4de9;
                                                                  D4: ($8a, $16, $53, $d9, $c4, $ad, $32, $6f));

  CODECAPI_AVEncMPVGenerateHeaderPicExt        :  TGUID = (D1: $1b8464ab;
                                                                  D2: $944f;
                                                                  D3: $45f0;
                                                                  D4: ($b7, $4e, $3a, $58, $da, $d1, $1f, $37));

  CODECAPI_AVEncMPVGenerateHeaderPicDispExt    :  TGUID = (D1: $c6412f84;
                                                                  D2: $c03f;
                                                                  D3: $4f40;
                                                                  D4: ($a0, $0c, $42, $93, $df, $83, $95, $bb));

  CODECAPI_AVEncMPVGenerateHeaderSeqScaleExt   :  TGUID = (D1: $0722d62f;
                                                                  D2: $dd59;
                                                                  D3: $4a86;
                                                                  D4: ($9c, $d5, $64, $4f, $8e, $26, $53, $d8));

  CODECAPI_AVEncMPVScanPattern                 :  TGUID = (D1: $7f8a478e;
                                                                  D2: $7bbb;
                                                                  D3: $4ae2;
                                                                  D4: ($b2, $fc, $96, $d1, $7f, $c4, $a2, $d6));

  CODECAPI_AVEncMPVIntraDCPrecision            :  TGUID = (D1: $a0116151;
                                                                  D2: $cbc8;
                                                                  D3: $4af3;
                                                                  D4: ($97, $dc, $d0, $0c, $ce, $b8, $2d, $79));

  CODECAPI_AVEncMPVQScaleType                  :  TGUID = (D1: $2b79ebb7;
                                                                  D2: $f484;
                                                                  D3: $4af7;
                                                                  D4: ($bb, $58, $a2, $a1, $88, $c5, $cb, $be));

  CODECAPI_AVEncMPVIntraVLCTable               :  TGUID = (D1: $a2b83ff5;
                                                                  D2: $1a99;
                                                                  D3: $405a;
                                                                  D4: ($af, $95, $c5, $99, $7d, $55, $8d, $3a));

  CODECAPI_AVEncMPVQuantMatrixIntra            :  TGUID = (D1: $9bea04f3;
                                                                  D2: $6621;
                                                                  D3: $442c;
                                                                  D4: ($8b, $a1, $3a, $c3, $78, $97, $96, $98));

  CODECAPI_AVEncMPVQuantMatrixNonIntra         :  TGUID = (D1: $87f441d8;
                                                                  D2: $0997;
                                                                  D3: $4beb;
                                                                  D4: ($a0, $8e, $85, $73, $d4, $09, $cf, $75));

  CODECAPI_AVEncMPVQuantMatrixChromaIntra      :  TGUID = (D1: $9eb9ecd4;
                                                                  D2: $018d;
                                                                  D3: $4ffd;
                                                                  D4: ($8f, $2d, $39, $e4, $9f, $07, $b1, $7a));

  CODECAPI_AVEncMPVQuantMatrixChromaNonIntra   :  TGUID = (D1: $1415b6b1;
                                                                  D2: $362a;
                                                                  D3: $4338;
                                                                  D4: ($ba, $9a, $1e, $f5, $87, $03, $c0, $5b));

  CODECAPI_AVEncMPALayer                       :  TGUID = (D1: $9d377230;
                                                                  D2: $f91b;
                                                                  D3: $453d;
                                                                  D4: ($9c, $e0, $78, $44, $54, $14, $c2, $2d));

  CODECAPI_AVEncMPACodingMode                  :  TGUID = (D1: $b16ade03;
                                                                  D2: $4b93;
                                                                  D3: $43d7;
                                                                  D4: ($a5, $50, $90, $b4, $fe, $22, $45, $37));

  CODECAPI_AVEncDDService                      :  TGUID = (D1: $d2e1bec7;
                                                                  D2: $5172;
                                                                  D3: $4d2a;
                                                                  D4: ($a5, $0e, $2f, $3b, $82, $b1, $dd, $f8));

  CODECAPI_AVEncDDDialogNormalization          :  TGUID = (D1: $d7055acf;
                                                                  D2: $f125;
                                                                  D3: $437d;
                                                                  D4: ($a7, $04, $79, $c7, $9f, $04, $04, $a8));

  CODECAPI_AVEncDDCentreDownMixLevel           :  TGUID = (D1: $e285072c;
                                                                  D2: $c958;
                                                                  D3: $4a81;
                                                                  D4: ($af, $d2, $e5, $e0, $da, $f1, $b1, $48));

  CODECAPI_AVEncDDSurroundDownMixLevel         :  TGUID = (D1: $7b20d6e5;
                                                                  D2: $0bcf;
                                                                  D3: $4273;
                                                                  D4: ($a4, $87, $50, $6b, $04, $79, $97, $e9));

  CODECAPI_AVEncDDProductionInfoExists         :  TGUID = (D1: $b0b7fe5f;
                                                                  D2: $b6ab;
                                                                  D3: $4f40;
                                                                  D4: ($96, $4d, $8d, $91, $f1, $7c, $19, $e8));

  CODECAPI_AVEncDDProductionRoomType           :  TGUID = (D1: $dad7ad60;
                                                                  D2: $23d8;
                                                                  D3: $4ab7;
                                                                  D4: ($a2, $84, $55, $69, $86, $d8, $a6, $fe));

  CODECAPI_AVEncDDProductionMixLevel           :  TGUID = (D1: $301d103a;
                                                                  D2: $cbf9;
                                                                  D3: $4776;
                                                                  D4: ($88, $99, $7c, $15, $b4, $61, $ab, $26));

  CODECAPI_AVEncDDCopyright                    :  TGUID = (D1: $8694f076;
                                                                  D2: $cd75;
                                                                  D3: $481d;
                                                                  D4: ($a5, $c6, $a9, $04, $dc, $c8, $28, $f0));

  CODECAPI_AVEncDDOriginalBitstream            :  TGUID = (D1: $966ae800;
                                                                  D2: $5bd3;
                                                                  D3: $4ff9;
                                                                  D4: ($95, $b9, $d3, $05, $66, $27, $38, $56));

  CODECAPI_AVEncDDDigitalDeemphasis            :  TGUID = (D1: $e024a2c2;
                                                                  D2: $947c;
                                                                  D3: $45ac;
                                                                  D4: ($87, $d8, $f1, $03, $0c, $5c, $00, $82));

  CODECAPI_AVEncDDDCHighPassFilter             :  TGUID = (D1: $9565239f;
                                                                  D2: $861c;
                                                                  D3: $4ac8;
                                                                  D4: ($bf, $da, $e0, $0c, $b4, $db, $85, $48));

  CODECAPI_AVEncDDChannelBWLowPassFilter       :  TGUID = (D1: $e197821d;
                                                                  D2: $d2e7;
                                                                  D3: $43e2;
                                                                  D4: ($ad, $2c, $00, $58, $2f, $51, $85, $45));

  CODECAPI_AVEncDDLFELowPassFilter             :  TGUID = (D1: $d3b80f6f;
                                                                  D2: $9d15;
                                                                  D3: $45e5;
                                                                  D4: ($91, $be, $01, $9c, $3f, $ab, $1f, $01));

  CODECAPI_AVEncDDSurround90DegreeePhaseShift  :  TGUID = (D1: $25ecec9d;
                                                                  D2: $3553;
                                                                  D3: $42c0;
                                                                  D4: ($bb, $56, $d2, $57, $92, $10, $4f, $80));

  CODECAPI_AVEncDDSurround3dBAttenuation       :  TGUID = (D1: $4d43b99d;
                                                                  D2: $31e2;
                                                                  D3: $48b9;
                                                                  D4: ($bf, $2e, $5c, $bf, $1a, $57, $27, $84));

  CODECAPI_AVEncDDDynamicRangeCompressionControl :  TGUID = (D1: $cfc2ff6d;
                                                                    D2: $79b8;
                                                                    D3: $4b8d;
                                                                    D4: ($a8, $aa, $a0, $c9, $bd, $1c, $29, $40));

  CODECAPI_AVEncDDRFPreEmphasisFilter          :  TGUID = (D1: $21af44c0;
                                                                  D2: $244e;
                                                                  D3: $4f3d;
                                                                  D4: ($a2, $cc, $3d, $30, $68, $b2, $e7, $3f));

  CODECAPI_AVEncDDSurroundExMode               :  TGUID = (D1: $91607cee;
                                                                  D2: $dbdd;
                                                                  D3: $4eb6;
                                                                  D4: ($bc, $a2, $aa, $df, $af, $a3, $dd, $68));

  CODECAPI_AVEncDDPreferredStereoDownMixMode   :  TGUID = (D1: $7f4e6b31;
                                                                  D2: $9185;
                                                                  D3: $403d;
                                                                  D4: ($b0, $a2, $76, $37, $43, $e6, $f0, $63));

  CODECAPI_AVEncDDLtRtCenterMixLvl_x10         :  TGUID = (D1: $dca128a2;
                                                                  D2: $491f;
                                                                  D3: $4600;
                                                                  D4: ($b2, $da, $76, $e3, $34, $4b, $41, $97));
  CODECAPI_AVEncDDLtRtSurroundMixLvl_x10       :  TGUID = (D1: $212246c7;
                                                                  D2: $3d2c;
                                                                  D3: $4dfa;
                                                                  D4: ($bc, $21, $65, $2a, $90, $98, $69, $0d));

  CODECAPI_AVEncDDLoRoCenterMixLvl_x10         :  TGUID = (D1: $1cfba222;
                                                                  D2: $25b3;
                                                                  D3: $4bf4;
                                                                  D4: ($9b, $fd, $e7, $11, $12, $67, $85, $8c));

  CODECAPI_AVEncDDLoRoSurroundMixLvl_x10       :  TGUID = (D1: $e725cff6;
                                                                  D2: $eb56;
                                                                  D3: $40c7;
                                                                  D4: ($84, $50, $2b, $93, $67, $e9, $15, $55));

  CODECAPI_AVEncDDAtoDConverterType            :  TGUID = (D1: $719f9612;
                                                                  D2: $81a1;
                                                                  D3: $47e0;
                                                                  D4: ($9a, $05, $d9, $4a, $d5, $fc, $a9, $48));

  CODECAPI_AVEncDDHeadphoneMode                :  TGUID = (D1: $4052dbec;
                                                                  D2: $52f5;
                                                                  D3: $42f5;
                                                                  D4: ($9b, $00, $d1, $34, $b1, $34, $1b, $9d));

  CODECAPI_AVEncWMVKeyFrameDistance            :  TGUID = (D1: $5569055e;
                                                                  D2: $e268;
                                                                  D3: $4771;
                                                                  D4: ($b8, $3e, $95, $55, $ea, $28, $ae, $d3));

  CODECAPI_AVEncWMVInterlacedEncoding          :  TGUID = (D1: $e3d00f8a;
                                                                  D2: $c6f5;
                                                                  D3: $4e14;
                                                                  D4: ($a5, $88, $0e, $c8, $7a, $72, $6f, $9b));

  CODECAPI_AVEncWMVDecoderComplexity           :  TGUID = (D1: $f32c0dab;
                                                                  D2: $f3cb;
                                                                  D3: $4217;
                                                                  D4: ($b7, $9f, $87, $62, $76, $8b, $5f, $67));

  CODECAPI_AVEncWMVKeyFrameBufferLevelMarker   :  TGUID = (D1: $51ff1115;
                                                                  D2: $33ac;
                                                                  D3: $426c;
                                                                  D4: ($a1, $b1, $09, $32, $1b, $df, $96, $b4));

  CODECAPI_AVEncWMVProduceDummyFrames          :  TGUID = (D1: $d669d001;
                                                                  D2: $183c;
                                                                  D3: $42e3;
                                                                  D4: ($a3, $ca, $2f, $45, $86, $d2, $39, $6c));

  CODECAPI_AVEncStatWMVCBAvg                   :  TGUID = (D1: $6aa6229f;
                                                                  D2: $d602;
                                                                  D3: $4b9d;
                                                                  D4: ($b6, $8c, $c1, $ad, $78, $88, $4b, $ef));

  CODECAPI_AVEncStatWMVCBMax                   :  TGUID = (D1: $e976bef8;
                                                                  D2: $00fe;
                                                                  D3: $44b4;
                                                                  D4: ($b6, $25, $8f, $23, $8b, $c0, $34, $99));

  CODECAPI_AVEncStatWMVDecoderComplexityProfile:  TGUID = (D1: $89e69fc3;
                                                                  D2: $0f9b;
                                                                  D3: $436c;
                                                                  D4: ($97, $4a, $df, $82, $12, $27, $c9, $0d));

  CODECAPI_AVEncStatMPVSkippedEmptyFrames      :  TGUID = (D1: $32195fd3;
                                                                  D2: $590d;
                                                                  D3: $4812;
                                                                  D4: ($a7, $ed, $6d, $63, $9a, $1f, $97, $11));

  CODECAPI_AVEncMP12PktzSTDBuffer              :  TGUID = (D1: $0b751bd0;
                                                                  D2: $819e;
                                                                  D3: $478c;
                                                                  D4: ($94, $35, $75, $20, $89, $26, $b3, $77));

  CODECAPI_AVEncMP12PktzStreamID               :  TGUID = (D1: $c834d038;
                                                                  D2: $f5e8;
                                                                  D3: $4408;
                                                                  D4: ($9b, $60, $88, $f3, $64, $93, $fe, $df));

  CODECAPI_AVEncMP12PktzInitialPTS             :  TGUID = (D1: $2a4f2065;
                                                                  D2: $9a63;
                                                                  D3: $4d20;
                                                                  D4: ($ae, $22, $0a, $1b, $c8, $96, $a3, $15));

  CODECAPI_AVEncMP12PktzPacketSize             :  TGUID = (D1: $ab71347a;
                                                                  D2: $1332;
                                                                  D3: $4dde;
                                                                  D4: ($a0, $e5, $cc, $f7, $da, $8a, $0f, $22));

  CODECAPI_AVEncMP12PktzCopyright              :  TGUID = (D1: $c8f4b0c1;
                                                                  D2: $094c;
                                                                  D3: $43c7;
                                                                  D4: ($8e, $68, $a5, $95, $40, $5a, $6e, $f8));

  CODECAPI_AVEncMP12PktzOriginal               :  TGUID = (D1: $6b178416;
                                                                  D2: $31b9;
                                                                  D3: $4964;
                                                                  D4: ($94, $cb, $6b, $ff, $86, $6c, $df, $83));

  CODECAPI_AVEncMP12MuxPacketOverhead          :  TGUID = (D1: $e40bd720;
                                                                  D2: $3955;
                                                                  D3: $4453;
                                                                  D4: ($ac, $f9, $b7, $91, $32, $a3, $8f, $a0));

  CODECAPI_AVEncMP12MuxNumStreams              :  TGUID = (D1: $f7164a41;
                                                                  D2: $dced;
                                                                  D3: $4659;
                                                                  D4: ($a8, $f2, $fb, $69, $3f, $2a, $4c, $d0));

  CODECAPI_AVEncMP12MuxEarliestPTS             :  TGUID = (D1: $157232b6;
                                                                  D2: $f809;
                                                                  D3: $474e;
                                                                  D4: ($94, $64, $a7, $f9, $30, $14, $a8, $17));

  CODECAPI_AVEncMP12MuxLargestPacketSize       :  TGUID = (D1: $35ceb711;
                                                                  D2: $f461;
                                                                  D3: $4b92;
                                                                  D4: ($a4, $ef, $17, $b6, $84, $1e, $d2, $54));

  CODECAPI_AVEncMP12MuxInitialSCR              :  TGUID = (D1: $3433ad21;
                                                                  D2: $1b91;
                                                                  D3: $4a0b;
                                                                  D4: ($b1, $90, $2b, $77, $06, $3b, $63, $a4));

  CODECAPI_AVEncMP12MuxMuxRate                 :  TGUID = (D1: $ee047c72;
                                                                  D2: $4bdb;
                                                                  D3: $4a9d;
                                                                  D4: ($8e, $21, $41, $92, $6c, $82, $3d, $a7));

  CODECAPI_AVEncMP12MuxPackSize                :  TGUID = (D1: $f916053a;
                                                                  D2: $1ce8;
                                                                  D3: $4faf;
                                                                  D4: ($aa, $0b, $ba, $31, $c8, $00, $34, $b8));

  CODECAPI_AVEncMP12MuxSysSTDBufferBound       :  TGUID = (D1: $35746903;
                                                                  D2: $b545;
                                                                  D3: $43e7;
                                                                  D4: ($bb, $35, $c5, $e0, $a7, $d5, $09, $3c));

  CODECAPI_AVEncMP12MuxSysRateBound            :  TGUID = (D1: $05f0428a;
                                                                  D2: $ee30;
                                                                  D3: $489d;
                                                                  D4: ($ae, $28, $20, $5c, $72, $44, $67, $10));

  CODECAPI_AVEncMP12MuxTargetPacketizer        :  TGUID = (D1: $d862212a;
                                                                  D2: $2015;
                                                                  D3: $45dd;
                                                                  D4: ($9a, $32, $1b, $3a, $a8, $82, $05, $a0));

  CODECAPI_AVEncMP12MuxSysFixed                :  TGUID = (D1: $cefb987e;
                                                                  D2: $894f;
                                                                  D3: $452e;
                                                                  D4: ($8f, $89, $a4, $ef, $8c, $ec, $06, $3a));

  CODECAPI_AVEncMP12MuxSysCSPS                 :  TGUID = (D1: $7952ff45;
                                                                  D2: $9c0d;
                                                                  D3: $4822;
                                                                  D4: ($bc, $82, $8a, $d7, $72, $e0, $29, $93));

  CODECAPI_AVEncMP12MuxSysVideoLock            :  TGUID = (D1: $b8296408;
                                                                  D2: $2430;
                                                                  D3: $4d37;
                                                                  D4: ($a2, $a1, $95, $b3, $e4, $35, $a9, $1d));

  CODECAPI_AVEncMP12MuxSysAudioLock            :  TGUID = (D1: $0fbb5752;
                                                                  D2: $1d43;
                                                                  D3: $47bf;
                                                                  D4: ($bd, $79, $f2, $29, $3d, $8c, $e3, $37));

  CODECAPI_AVEncMP12MuxDVDNavPacks             :  TGUID = (D1: $c7607ced;
                                                                  D2: $8cf1;
                                                                  D3: $4a99;
                                                                  D4: ($83, $a1, $ee, $54, $61, $be, $35, $74));


  CODECAPI_AVEncMPACopyright                   :  TGUID = (D1: $a6ae762a;
                                                                  D2: $d0a9;
                                                                  D3: $4454;
                                                                  D4: ($b8, $ef, $f2, $db, $ee, $fd, $d3, $bd));

  CODECAPI_AVEncMPAOriginalBitstream           :  TGUID = (D1: $3cfb7855;
                                                                  D2: $9cc9;
                                                                  D3: $47ff;
                                                                  D4: ($b8, $29, $b3, $67, $86, $c9, $23, $46));

  CODECAPI_AVEncMPAEnableRedundancyProtection  :  TGUID = (D1: $5e54b09e;
                                                                  D2: $b2e7;
                                                                  D3: $4973;
                                                                  D4: ($a8, $9b, $0b, $36, $50, $a3, $be, $da));

  CODECAPI_AVEncMPAPrivateUserBit              :  TGUID = (D1: $afa505ce;
                                                                  D2: $c1e3;
                                                                  D3: $4e3d;
                                                                  D4: ($85, $1b, $61, $b7, $00, $e5, $e6, $cc));

  CODECAPI_AVEncMPAEmphasisType                :  TGUID = (D1: $2d59fcda;
                                                                  D2: $bf4e;
                                                                  D3: $4ed6;
                                                                  D4: ($b5, $df, $5b, $03, $b3, $6b, $0a, $1f));



  CODECAPI_AVDecCommonMeanBitRate              :  TGUID = (D1: $59488217;
                                                           D2: $007a;
                                                           D3: $4f7a;
                                                           D4: ($8e, $41, $5c, $48, $b1, $ea, $c5, $c6));

  CODECAPI_AVDecCommonMeanBitRateInterval      :  TGUID = (D1: $0ee437c6;
                                                           D2: $38a7;
                                                           D3: $4c5c;
                                                           D4: ($94, $4c, $68, $ab, $42, $11, $6b, $85));

  CODECAPI_AVDecCommonInputFormat              :  TGUID = (D1: $e5005239;
                                                           D2: $bd89;
                                                           D3: $4be3;
                                                           D4: ($9c, $0f, $5d, $de, $31, $79, $88, $cc));

  CODECAPI_AVDecCommonOutputFormat             :  TGUID = (D1: $3c790028;
                                                           D2: $c0ce;
                                                           D3: $4256;
                                                           D4: ($b1, $a2, $1b, $0f, $c8, $b1, $dc, $dc));


  CODECAPI_GUID_AVDecAudioOutputFormat_PCM_Stereo_MatrixEncoded  :  TGUID = (D1: $696e1d30;
                                                                             D2: $548f;
                                                                             D3: $4036;
                                                                             D4: ($82, $5f, $70, $26, $c6, $00, $11, $bd));

  CODECAPI_GUID_AVDecAudioOutputFormat_PCM                       :  TGUID = (D1: $696e1d31;
                                                                             D2: $548f;
                                                                             D3: $4036;
                                                                             D4: ($82, $5f, $70, $26, $c6, $00, $11, $bd));

  CODECAPI_GUID_AVDecAudioOutputFormat_SPDIF_PCM                 :  TGUID = (D1: $696e1d32;
                                                                             D2: $548f;
                                                                             D3: $4036;
                                                                             D4: ($82, $5f, $70, $26, $c6, $00, $11, $bd));

  CODECAPI_GUID_AVDecAudioOutputFormat_SPDIF_Bitstream           :  TGUID = (D1: $696e1d33;
                                                                             D2: $548f;
                                                                             D3: $4036;
                                                                             D4: ($82, $5f, $70, $26, $c6, $00, $11, $bd));

  CODECAPI_GUID_AVDecAudioOutputFormat_PCM_Headphones            :  TGUID = (D1: $696e1d34;
                                                                             D2: $548f;
                                                                             D3: $4036;
                                                                             D4: ($82, $5f, $70, $26, $c6, $00, $11, $bd));

  CODECAPI_GUID_AVDecAudioOutputFormat_PCM_Stereo_Auto           :  TGUID = (D1: $696e1d35;
                                                                             D2: $548f;
                                                                             D3: $4036;
                                                                             D4: ($82, $5f, $70, $26, $c6, $00, $11, $bd));

  CODECAPI_AVDecVideoImageSize                                   :  TGUID = (D1: $5ee5747c;
                                                                             D2: $6801;
                                                                             D3: $4cab;
                                                                             D4: ($aa, $f1, $62, $48, $fa, $84, $1b, $a4));

  CODECAPI_AVDecVideoInputScanType                               :  TGUID = (D1: $38477e1f;
                                                                             D2: $0ea7;
                                                                             D3: $42cd;
                                                                             D4: ($8c, $d1, $13, $0c, $ed, $57, $c5, $80));

  CODECAPI_AVDecVideoPixelAspectRatio                            :  TGUID = (D1: $b0cf8245;
                                                                             D2: $f32d;
                                                                             D3: $41df;
                                                                             D4: ($b0, $2c, $87, $bd, $30, $4d, $12, $ab));

  CODECAPI_AVDecVideoAcceleration_MPEG2                          :  TGUID = (D1: $f7db8a2e;
                                                                             D2: $4f48;
                                                                             D3: $4ee8;
                                                                             D4: ($ae, $31, $8b, $6e, $be, $55, $8a, $e2));

  CODECAPI_AVDecVideoAcceleration_H264                           :  TGUID = (D1: $f7db8a2f;
                                                                             D2: $4f48;
                                                                             D3: $4ee8;
                                                                             D4: ($ae, $31, $8b, $6e, $be, $55, $8a, $e2));

  CODECAPI_AVDecVideoAcceleration_VC1                            :  TGUID = (D1: $f7db8a30;
                                                                             D2: $4f48;
                                                                             D3: $4ee8;
                                                                             D4: ($ae, $31, $8b, $6e, $be, $55, $8a, $e2));

  CODECAPI_AVDecVideoProcDeinterlaceCSC                          :  TGUID = (D1: $f7db8a31;
                                                                             D2: $4f48;
                                                                             D3: $4ee8;
                                                                             D4: ($ae, $31, $8b, $6e, $be, $55, $8a, $e2));

  CODECAPI_AVDecVideoThumbnailGenerationMode       :  TGUID = (D1: $2efd8eee;
                                                               D2: $1150;
                                                               D3: $4328;
                                                               D4: ($9c, $f5, $66, $dc, $e9, $33, $fc, $f4));

  CODECAPI_AVDecVideoDropPicWithMissingRef         :  TGUID = (D1: $f8226383;
                                                               D2: $14c2;
                                                               D3: $4567;
                                                               D4: ($97, $34, $50, $04, $e9, $6f, $f8, $87));

  CODECAPI_AVDecVideoSoftwareDeinterlaceMode       :  TGUID = (D1: $0c08d1ce;
                                                               D2: $9ced;
                                                               D3: $4540;
                                                               D4: ($ba, $e3, $ce, $b3, $80, $14, $11, $09));

  CODECAPI_AVDecVideoFastDecodeMode                :  TGUID = (D1: $6b529f7d;
                                                               D2: $d3b1;
                                                               D3: $49c6;
                                                               D4: ($a9, $99, $9e, $c6, $91, $1b, $ed, $bf));

  CODECAPI_AVLowLatencyMode                        :  TGUID = (D1: $9c27891a;
                                                               D2: $ed7a;
                                                               D3: $40e1;
                                                               D4: ($88, $e8, $b2, $27, $27, $a0, $24, $ee));

  CODECAPI_AVDecVideoH264ErrorConcealment          :  TGUID = (D1: $ececace8;
                                                               D2: $3436;
                                                               D3: $462c;
                                                               D4: ($92, $94, $cd, $7b, $ac, $d7, $58, $a9));

  CODECAPI_AVDecVideoMPEG2ErrorConcealment         :  TGUID = (D1: $9d2bfe18;
                                                               D2: $728d;
                                                               D3: $48d2;
                                                               D4: ($b3, $58, $bc, $7e, $43, $6c, $66, $74));

  CODECAPI_AVDecVideoCodecType                     :  TGUID = (D1: $434528e5;
                                                               D2: $21f0;
                                                               D3: $46b6;
                                                               D4: ($b6, $2c, $9b, $1b, $6b, $65, $8c, $d1));

  CODECAPI_AVDecVideoDXVAMode                      :  TGUID = (D1: $f758f09e;
                                                               D2: $7337;
                                                               D3: $4ae7;
                                                               D4: ($83, $87, $73, $dc, $2d, $54, $e6, $7d));

  CODECAPI_AVDecVideoDXVABusEncryption             :  TGUID = (D1: $42153c8b;
                                                               D2: $fd0b;
                                                               D3: $4765;
                                                               D4: ($a4, $62, $dd, $d9, $e8, $bc, $c3, $88));

  CODECAPI_AVDecVideoSWPowerLevel                  :  TGUID = (D1: $fb5d2347;
                                                               D2: $4dd8;
                                                               D3: $4509;
                                                               D4: ($ae, $d0, $db, $5f, $a9, $aa, $93, $f4));

  CODECAPI_AVDecVideoMaxCodedWidth                 :  TGUID = (D1: $5ae557b8;
                                                               D2: $77af;
                                                               D3: $41f5;
                                                               D4: ($9f, $a6, $4d, $b2, $fe, $1d, $4b, $ca));

  CODECAPI_AVDecVideoMaxCodedHeight                :  TGUID = (D1: $7262a16a;
                                                               D2: $d2dc;
                                                               D3: $4e75;
                                                               D4: ($9b, $a8, $65, $c0, $c6, $d3, $2b, $13));

  CODECAPI_AVDecNumWorkerThreads                   :  TGUID = (D1: $9561c3e8;
                                                               D2: $ea9e;
                                                               D3: $4435;
                                                               D4: ($9b, $1e, $a9, $3e, $69, $18, $94, $d8));

  CODECAPI_AVDecSoftwareDynamicFormatChange        :  TGUID = (D1: $862e2f0a;
                                                               D2: $507b;
                                                               D3: $47ff;
                                                               D4: ($af, $47, $01, $e2, $62, $42, $98, $b7));

  CODECAPI_AVDecDisableVideoPostProcessing         :	 TGUID = (D1: $f8749193;
                                                               D2: $667a;
                                                               D3: $4f2c;
                                                               D4: ($a9, $e8, $5d, $4a, $f9, $24, $f0, $8f));

  CODECAPI_GUID_AVDecAudioInputWMA                 :  TGUID = (D1: $c95e8dcf;
                                                               D2: $4058;
                                                               D3: $4204;
                                                               D4: ($8c, $42, $cb, $24, $d9, $1e, $4b, $9b));
  CODECAPI_GUID_AVDecAudioInputWMAPro              :  TGUID = (D1: $0128b7c7;
                                                               D2: $da72;
                                                               D3: $4fe3;
                                                               D4: ($be, $f8, $5c, $52, $e3, $55, $77, $04));

  CODECAPI_GUID_AVDecAudioInputDolby               :  TGUID = (D1: $8e4228a0;
                                                               D2: $f000;
                                                               D3: $4e0b;
                                                               D4: ($8f, $54, $ab, $8d, $24, $ad, $61, $a2));

  CODECAPI_GUID_AVDecAudioInputDTS                 :  TGUID = (D1: $600bc0ca;
                                                               D2: $6a1f;
                                                               D3: $4e91;
                                                               D4: ($b2, $41, $1b, $be, $b1, $cb, $19, $e0));

  CODECAPI_GUID_AVDecAudioInputPCM                 :  TGUID = (D1: $f2421da5;
                                                               D2: $bbb4;
                                                               D3: $4cd5;
                                                               D4: ($a9, $96, $93, $3c, $6b, $5d, $13, $47));

  CODECAPI_GUID_AVDecAudioInputMPEG                :  TGUID = (D1: $91106f36;
                                                               D2: $02c5;
                                                               D3: $4f75;
                                                               D4: ($97, $19, $3b, $7a, $bf, $75, $e1, $f6));

  CODECAPI_GUID_AVDecAudioInputAAC                 :  TGUID = (D1: $97df7828;
                                                               D2: $b94a;
                                                               D3: $47e2;
                                                               D4: ($a4, $bc, $51, $19, $4d, $b2, $2a, $4d));

  CODECAPI_GUID_AVDecAudioInputHEAAC               :  TGUID = (D1: $16efb4aa;
                                                               D2: $330e;
                                                               D3: $4f5c;
                                                               D4: ($98, $a8, $cf, $6a, $c5, $5c, $be, $60));

  CODECAPI_GUID_AVDecAudioInputDolbyDigitalPlus    :  TGUID = (D1: $0803e185;
                                                               D2: $8f5d;
                                                               D3: $47f5;
                                                               D4: ($99, $08, $19, $a5, $bb, $c9, $fe, $34));

  CODECAPI_AVDecAACDownmixMode                     :  TGUID = (D1: $01274475;
                                                               D2: $f6bb;
                                                               D3: $4017;
                                                               D4: ($b0, $84, $81, $a7, $63, $c9, $42, $d4));
  CODECAPI_AVDecHEAACDynamicRangeControl           :  TGUID = (D1: $287c8abe;
                                                               D2: $69a4;
                                                               D3: $4d39;
                                                               D4: ($80, $80, $d3, $d9, $71, $21, $78, $a0));

  CODECAPI_AVDecAudioDualMono                      :  TGUID = (D1: $4a52cda8;
                                                               D2: $30f8;
                                                               D3: $4216;
                                                               D4: ($be, $0f, $ba, $0b, $20, $25, $92, $1d));
  CODECAPI_AVDecAudioDualMonoReproMode             :  TGUID = (D1: $a5106186;
                                                               D2: $cc94;
                                                               D3: $4bc9;
                                                               D4: ($8c, $d9, $aa, $2f, $61, $f6, $80, $7e));

  CODECAPI_AVAudioChannelCount                     :  TGUID = (D1: $1d3583c4;
                                                               D2: $1583;
                                                               D3: $474e;
                                                               D4: ($b7, $1a, $5e, $e4, $63, $c1, $98, $e4));
  CODECAPI_AVAudioChannelConfig                    :  TGUID = (D1: $17f89cb3;
                                                               D2: $c38d;
                                                               D3: $4368;
                                                               D4: ($9e, $de, $63, $b9, $4d, $17, $7f, $9f));
  CODECAPI_AVAudioSampleRate                       :  TGUID = (D1: $971d2723;
                                                               D2: $1acb;
                                                               D3: $42e7;
                                                               D4: ($85, $5c, $52, $0a, $4b, $70, $a5, $f2));

  CODECAPI_AVDDSurroundMode                        :  TGUID = (D1: $99f2f386;
                                                               D2: $98d1;
                                                               D3: $4452;
                                                               D4: ($a1, $63, $ab, $c7, $8a, $6e, $b7, $70));
  CODECAPI_AVDecDDOperationalMode                  :  TGUID = (D1: $d6d6c6d1;
                                                               D2: $064e;
                                                               D3: $4fdd;
                                                               D4: ($a4, $0e, $3e, $cb, $fc, $b7, $eb, $d0));
  CODECAPI_AVDecDDMatrixDecodingMode               :  TGUID = (D1: $ddc811a5;
                                                               D2: $04ed;
                                                               D3: $4bf3;
                                                               D4: ($a0, $ca, $d0, $04, $49, $f9, $35, $5f));
  CODECAPI_AVDecDDDynamicRangeScaleHigh            :  TGUID = (D1: $50196c21;
                                                               D2: $1f33;
                                                               D3: $4af5;
                                                               D4: ($b2, $96, $11, $42, $6d, $6c, $87, $89));
  CODECAPI_AVDecDDDynamicRangeScaleLow             :  TGUID = (D1: $044e62e4;
                                                               D2: $11a5;
                                                               D3: $42d5;
                                                               D4: ($a3, $b2, $3b, $b2, $c7, $c2, $d7, $cf));

  CODECAPI_AVDecDDStereoDownMixMode                :  TGUID = (D1: $6ce4122c;
                                                               D2: $3ee9;
                                                               D3: $4182;
                                                               D4: ($b4, $ae, $c1, $0f, $c0, $88, $64, $9d));

  CODECAPI_AVDSPLoudnessEqualization               :  TGUID = (D1: $8afd1a15;
                                                               D2: $1812;
                                                               D3: $4cbf;
                                                               D4: ($93, $19, $43, $3a, $5b, $2a, $3b, $27));

  CODECAPI_AVDSPSpeakerFill                        :  TGUID = (D1: $5612bca1;
                                                               D2: $56da;
                                                               D3: $4582;
                                                               D4: ($8d, $a1, $ca, $80, $90, $f9, $27, $68));

  CODECAPI_AVPriorityControl                       :  TGUID = (D1: $54ba3dc8;
                                                               D2: $bdde;
                                                               D3: $4329;
                                                               D4: ($b1, $87, $20, $18, $bc, $5c, $2b, $a1));

  CODECAPI_AVRealtimeControl                       :  TGUID = (D1: $6f440632;
                                                               D2: $c4ad;
                                                               D3: $4bf7;
                                                               D4: ($9e, $52, $45, $69, $42, $b4, $54, $b0));

  CODECAPI_AVEncMaxFrameRate                       :  TGUID = (D1: $b98e1b31;
                                                               D2: $19fa;
                                                               D3: $4d4f;
                                                               D4: ($99, $31, $d6, $a5, $b8, $aa, $b9, $3c));

  CODECAPI_AVEncNoInputCopy                        :  TGUID = (D1: $d2b46a2a;
                                                               D2: $e8ee;
                                                               D3: $4ec5;
                                                               D4: ($86, $9e, $44, $9b, $6c, $62, $c8, $1a));

  CODECAPI_AVEncChromaEncodeMode                   :  TGUID = (D1: $8a47ab5a;
                                                               D2: $4798;
                                                               D3: $4c93;
                                                               D4: ($b5, $a5, $55, $4f, $9a, $3b, $9f, $50));


  CODECAPI_AVEncProgressiveUpdateTime              :  TGUID = (D1: $649faf66;
                                                               D2: $afc6;
                                                               D3: $4828;
                                                               D4: ($8f, $dc, $07, $71, $cd, $9a, $b1, $7d));


  CODECAPI_AVEncChromaUpdateTime                   :  TGUID = (D1: $4b4fd998;
                                                               D2: $4274;
                                                               D3: $40bb;
                                                               D4: ($8e, $e4, $07, $55, $3e, $7e, $2d, $3a));

  CODECAPI_AVEncAACEnableVBR                        : TGUID = (D1: $e836bb98;
                                                               D2: $fca3;
                                                               D3: $44b6;
                                                               D4: ($9a, $39, $24, $78, $6b, $e4, $1b, $e1));

 CODECAPI_AVEncVideoConsecutiveFramesForLayer      : TGUID = (D1: $0AF35522;
                                                               D2: $D984;
                                                               D3: $45ae;
                                                               D4: ($BB, $B8, $53, $93, $3E, $0A, $B1, $B5));

  CODECAPI_AVEncVideoMaxNumRefFrameForLayer         : TGUID = (D1: $3141C639;
                                                               D2: $6329;
                                                               D3: $40d1;
                                                               D4: ($B7, $E7, $2F, $0E, $3A, $C1, $8E, $02));

  CODECAPI_AVEncTileRows                            : TGUID = (D1: $FBC650FC;
                                                               D2: $41AB;
                                                               D3: $4f9b;
                                                               D4: ($84, $B5, $06, $5B, $E9, $CD, $99, $EE));

  CODECAPI_AVEncTileColumns                         : TGUID = (D1: $B4B31205;
                                                               D2: $01E8;
                                                               D3: $452c;
                                                               D4: ($B8, $76, $8C, $65, $06, $54, $59, $25));

  CODECAPI_FeatureMapFlagsUsed                      : TGUID = (D1: $8bfda3b8;
                                                               D2: $7387;
                                                               D3: $4c07;
                                                               D4: ($92, $4f, $fe, $63, $0, $6c, $f2, $2b));

  CODECAPI_AVEncVideoEnableSpatialAdaptiveQuantization  : TGUID = (D1: $659cb943;
                                                                   D2: $15ca;
                                                                   D3: $448d;
                                                                   D4: ($b9, $9a, $87, $56, $19, $db, $4d, $e4));

  CODECAPI_AVEncVideoEnableFramePsnrYuv            : TGUID = (D1: $2bbcdd1d;
                                                              D2: $bc47;
                                                              D3: $430e;
                                                              D4: ($b2, $e8, $64, $80, $1b, $47, $f5, $f0));

  CODECAPI_AVEncVideoOutputQPMapBlockSize          : TGUID = (D1: $97038743;
                                                              D2: $4ae3;
                                                              D3: $44c3;
                                                              D4: ($a0, $f2, $5b, $d5, $8a, $46, $34, $ef));

  CODECAPI_AVEncVideoOutputBitsUsedMapBlockSize    : TGUID = (D1: $6c2cd11a;
                                                              D2: $ca3b;
                                                              D3: $44bd;
                                                              D4: ($9a, $9e, $93, $b0, $36, $34, $c3, $6e));

  { 10.0.28000.0  }
  CODECAPI_AVEncVideoSatdMapBlockSize              : TGUID = (D1: $596f1106;
                                                              D2: $8ce0;
                                                              D3: $4302;
                                                              D4: ($af, $79, $c4, $ec, $67, $aa, $dc, $6d));

  CODECAPI_AVEncVideoInputDeltaQPBlockSettings     : TGUID = (D1: $5a4787dc;
                                                              D2: $0648;
                                                              D3: $47aa;
                                                              D4: ($b9, $45, $55, $2b, $fa, $d2, $a6, $d8));

  CODECAPI_AVEncVideoInputAbsoluteQPBlockSettings  : TGUID = (D1: $ef95a145;
                                                              D2: $4f91;
                                                              D3: $4dea;
                                                              D4: ($81, $73, $ac, $ff, $11, $43, $42, $10));

  CODECAPI_AVEncVideoD3D12ReconstructedPictureOutputMode : TGUID = (D1: $4a7b2e8f;
                                                                    D2: $1d93;
                                                                    D3: $4c6a;
                                                                    D4: ($b5, $48, $91, $e2, $f8, $c5, $a7, $d3));

  CODECAPI_AVEncAV1EncoderOperatingMode            : TGUID = (D1: $8f2e1f91;
                                                              D2: $5b4c;
                                                              D3: $4e1a;
                                                              D4: ($9c, $3d, $2f, $6a, $8b, $1d, $4e, $7c));

// end of static definitions }


//
// Common Parameters
//

// AVEncCommonFormatConstraint (GUID)

  AVEncCommonFormatConstraint        :  TGUID = '{57cbb9b8-116f-4951-b40c-c2a035ed8f17}';
  AVEncCommonFormatUnSpecified  :  TGUID = '{af46a35a-6024-4525-a48a-094b97f5b3c2}';
  AVEncCommonFormatDVD_V        :  TGUID = '{cc9598c4-e7fe-451d-b1ca-761bc840b7f3}';
  AVEncCommonFormatDVD_DashVR   :  TGUID = '{e55199d6-044c-4dae-a488-531ed306235b}';
  AVEncCommonFormatDVD_PlusVR   :  TGUID = '{e74c6f2e-ec37-478d-9af4-a5e135b6271c}';
  AVEncCommonFormatVCD          :  TGUID = '{95035bf7-9d90-40ff-ad5c-5cf8cf71ca1d}';
  AVEncCommonFormatSVCD         :  TGUID = '{51d85818-8220-448c-8066-d69bed16c9ad}';
  AVEncCommonFormatATSC         :  TGUID = '{8d7b897c-a019-4670-aa76-2edcac7ac296}';
  AVEncCommonFormatDVB          :  TGUID = '{71830d8f-6c33-430d-844b-c2705baae6db}';
  AVEncCommonFormatMP3          :  TGUID = '{349733cd-eb08-4dc2-8197-e49835ef828b}';
  AVEncCommonFormatHighMAT      :  TGUID = '{1eabe760-fb2b-4928-90d1-78db88eee889}';
  AVEncCommonFormatHighMPV      :  TGUID = '{a2d25db8-b8f9-42c2-8bc7-0b93cf604788}';


  // AVEncCodecType (GUID)
  AVEncCodecType                     :  TGUID = '{08af4ac1-f3f2-4c74-9dcf-37f2ec79f826}';
  AVEncMPEG1Video               :  TGUID = '{c8dafefe-da1e-4774-b27d-11830c16b1fe}';
  AVEncMPEG2Video               :  TGUID = '{046dc19a-6677-4aaa-a31d-c1ab716f4560}';
  AVEncMPEG1Audio               :  TGUID = '{d4dd1362-cd4a-4cd6-8138-b94db4542b04}';
  AVEncMPEG2Audio               :  TGUID = '{ee4cbb1f-9c3f-4770-92b5-fcb7c2a8d381}';
  AVEncWMV                      :  TGUID = '{4e0fef9b-1d43-41bd-b8bd-4d7bf7457a2a}';
  AVEndMPEG4Video               :  TGUID = '{dd37b12a-9503-4f8b-b8d0-324a00c0a1cf}';
  AVEncH264Video                :  TGUID = '{95044eab-31b3-47de-8e75-38a42bb03e28}';
  AVEncDV                       :  TGUID = '{09b769c7-3329-44fb-8954-fa30937d3d5a}';
  AVEncWMAPro                   :  TGUID = '{1955f90c-33f7-4a68-ab81-53f5657125c4}';
  AVEncWMALossless              :  TGUID = '{55ca7265-23d8-4761-9031-b74fbe12f4c1}';
  AVEncWMAVoice                 :  TGUID = '{13ed18cb-50e8-4276-a288-a6aa228382d9}';
  AVEncDolbyDigitalPro          :  TGUID = '{f5be76cc-0ff8-40eb-9cb1-bba94004d44f}';
  AVEncDolbyDigitalConsumer     :  TGUID = '{c1a7bf6c-0059-4bfa-94ef-ef747a768d52}';
  AVEncDolbyDigitalPlus         :  TGUID = '{698d1b80-f7dd-415c-971c-42492a2056c6}';
  AVEncDTSHD                    :  TGUID = '{2052e630-469d-4bfb-80ca-1d656e7e918f}';
  AVEncDTS                      :  TGUID = '{45fbcaa2-5e6e-4ab0-8893-5903bee93acf}';
  AVEncMLP                      :  TGUID = '{05f73e29-f0d1-431e-a41c-a47432ec5a66}';
  AVEncPCM                      :  TGUID = '{844be7f4-26cf-4779-b386-cc05d187990c}';
  AVEncSDDS                     :  TGUID = '{1dc1b82f-11c8-4c71-b7b6-ee3eb9bc2b94}';

  // AVEncCommonRateControlMode (UINT32)
  AVEncCommonRateControlMode           :  TGUID = '{1c0608e9-370c-4710-8a58-cb6181c42423}';

  // AVEncCommonLowLatency (BOOL)
  AVEncCommonLowLatency                :  TGUID = '{9d3ecd55-89e8-490a-970a-0c9548d5a56e}';

  // AVEncCommonMultipassMode (UINT32)
  AVEncCommonMultipassMode             :  TGUID = '{22533d4c-47e1-41b5-9352-a2b7780e7ac4}';

  // AVEncCommonPassStart (UINT32)
  AVEncCommonPassStart                 :  TGUID = '{6a67739f-4eb5-4385-9928-f276a939ef95}';

  // AVEncCommonPassEnd (UINT32)
  AVEncCommonPassEnd                   :  TGUID = '{0e3d01bc-c85c-467d-8b60-c41012ee3bf6}';

  // AVEncCommonRealTime (BOOL)
  AVEncCommonRealTime                  :  TGUID = '{143a0ff6-a131-43da-b81e-98fbb8ec378e}';

  // AVEncCommonQuality (UINT32)
  AVEncCommonQuality                   :  TGUID = '{fcbf57a3-7ea5-4b0c-9644-69b40c39c391}';

  // AVEncCommonQualityVsSpeed (UINT32)
  AVEncCommonQualityVsSpeed            :  TGUID = '{98332df8-03cd-476b-89fa-3f9e442dec9f}';

  // AVEncCommonTranscodeEncodingProfile (BSTR)
  AVEncCommonTranscodeEncodingProfile  :  TGUID = '{6947787C-F508-4EA9-B1E9-A1FE3A49FBC9}';

  // AVEncCommonMeanBitRate (UINT32)
  AVEncCommonMeanBitRate               :  TGUID = '{f7222374-2144-4815-b550-a37f8e12ee52}';

  // AVEncCommonMeanBitRateInterval (UINT64)
  AVEncCommonMeanBitRateInterval       :  TGUID = '{bfaa2f0c-cb82-4bc0-8474-f06a8a0d0258}';

  // AVEncCommonMaxBitRate (UINT32)
  AVEncCommonMaxBitRate                :  TGUID = '{9651eae4-39b9-4ebf-85ef-d7f444ec7465}';

  // AVEncCommonMinBitRate (UINT32)
  AVEncCommonMinBitRate                :  TGUID = '{101405b2-2083-4034-a806-efbeddd7c9ff}';

  // AVEncCommonBufferSize (UINT32)
  AVEncCommonBufferSize                :  TGUID = '{0db96574-b6a4-4c8b-8106-3773de0310cd}';

  // AVEncCommonBufferInLevel (UINT32)
  AVEncCommonBufferInLevel             :  TGUID = '{d9c5c8db-fc74-4064-94e9-cd19f947ed45}';

  // AVEncCommonBufferOutLevel (UINT32)
  AVEncCommonBufferOutLevel            :  TGUID = '{ccae7f49-d0bc-4e3d-a57e-fb5740140069}';

  // AVEncCommonStreamEndHandling (UINT32)
  AVEncCommonStreamEndHandling         :  TGUID = '{6aad30af-6ba8-4ccc-8fca-18d19beaeb1c}';

  // Common Post Encode Statistical Parameters
  // AVEncStatCommonCompletedPasses (UINT32)
  AVEncStatCommonCompletedPasses       :  TGUID = '{3e5de533-9df7-438c-854f-9f7dd3683d34}';

  // AVEncVideoOutputFrameRate (UINT32)
  AVEncVideoOutputFrameRate            :  TGUID = '{ea85e7c3-9567-4d99-87c4-02c1c278ca7c}';

  // AVEncVideoOutputFrameRateConversion (UINT32)
  AVEncVideoOutputFrameRateConversion  :  TGUID = '{8c068bf4-369a-4ba3-82fd-b2518fb3396e}';

  // AVEncVideoPixelAspectRatio (UINT32 as UINT16/UNIT16) <---- You have WORD in the doc
  AVEncVideoPixelAspectRatio           :  TGUID = '{3cdc718f-b3e9-4eb6-a57f-cf1f1b321b87}';

  // AVDecVideoAcceleration_MPEG2 (UINT32)
  AVDecVideoAcceleration_MPEG2         :  TGUID = '{f7db8a2e-4f48-4ee8-ae31-8b6ebe558ae2}';
  AVDecVideoAcceleration_H264          :  TGUID = '{f7db8a2f-4f48-4ee8-ae31-8b6ebe558ae2}';
  AVDecVideoAcceleration_VC1           :  TGUID = '{f7db8a30-4f48-4ee8-ae31-8b6ebe558ae2}';

  // AVDecVideoProcDeinterlaceCSC (UINT32)
  AVDecVideoProcDeinterlaceCSC         :  TGUID = '{f7db8a31-4f48-4ee8-ae31-8b6ebe558ae2}';


  // AVDecVideoThumbnailGenerationMode (BOOL)
  // Related to video thumbnail generation.
  // Video decoders can have special configurations for fast thumbnail generation.
  // For example:
  //   - They can use only one decoding thread so that multiple instances can be used at the same time.
  //   - They can also decode I frames only.
  AVDecVideoThumbnailGenerationMode    :  TGUID = '{2efd8eee-1150-4328-9cf5-66dce933fcf4}';

  // AVDecVideoMaxCodedWidth and AVDecVideoMaxCodedHeight
  // Maximum codec width and height for current stream.
  // This is used to optimize memory usage for a particular stream.
  AVDecVideoMaxCodedWidth              :  TGUID = '{5ae557b8-77af-41f5-9fa6-4db2fe1d4bca}';
  AVDecVideoMaxCodedHeight             :  TGUID = '{7262a16a-d2dc-4e75-9ba8-65c0c6d32b13}';

  // AVDecNumWorkerThreads (INT32)
  // Number of worker threads used in decoder core.
  // If this number is set to -1, it means that the decoder will decide how many threads to create.
  AVDecNumWorkerThreads                :  TGUID = '{9561c3e8-ea9e-4435-9b1e-a93e691894d8}';

  // AVDecSoftwareDynamicFormatChange (BOOL)
  // Set whether to use software dynamic format change to internal resizing
  AVDecSoftwareDynamicFormatChange     :  TGUID = '{862e2f0a-507b-47ff-af47-01e2624298b7}';

  // AVDecDisableVideoPostProcessing (UINT32)
  // Default value is 0
  // If this is non-zero, decoder should not do post processing like deblocking/deringing. This only controls the out of loop post processing
  // all processing required by video standard (like in-loop deblocking) should still be performed.
  AVDecDisableVideoPostProcessing      :  TGUID = '{F8749193-667A-4F2C-A9E8-5D4AF924F08F}';

  // AVDecVideoDropPicWithMissingRef (BOOL)
  // Related to Video decoding mode of whether to drop pictures with missing references.
  // For DVD playback, we may want to do so to avoid bad blocking.  For Digital TV, we may
  // want to decode all pictures no matter what.
  AVDecVideoDropPicWithMissingRef      :  TGUID = '{f8226383-14c2-4567-9734-5004e96ff887}';

  // AVDecSoftwareVideoDeinterlaceMode (UINT32)
  AVDecVideoSoftwareDeinterlaceMode    :  TGUID = '{0c08d1ce-9ced-4540-bae3-ceb380141109}';

  // AVDecVideoFastDecodeMode (UINT32)
  // 0: normal decoding
  // 1-32 : Where 32 is fastest decoding. Any value between (and including) 1 to 32 is valid
  AVDecVideoFastDecodeMode             :  TGUID = '{6b529f7d-d3b1-49c6-a999-9ec6911bedbf}';

  // AVLowLatencyMode (DWORD)
  // Related to low latency processing/decoding.
  // This GUID lets the application to decrease latency.
  AVLowLatencyMode                     :  TGUID = '{9c27891a-ed7a-40e1-88e8-b22727a024ee}';

  // AVDecVideoH264ErrorConcealment (UINT32)
  // Related to Video decoding mode of whether to conceal pictures with corruptions.
  // For DVD playback, we may not want to do so to avoid unnecessary computation.  For Digital TV, we may
  // want to perform error concealment.
  AVDecVideoH264ErrorConcealment       :  TGUID = '{ececace8-3436-462c-9294-cd7bacd758a9}';

  // AVDecVideoMPEG2ErrorConcealment (UINT32)
  // Related to Video decoding mode of whether to conceal pictures with corruptions.
  // For DVD playback, we may not want to do so to avoid unnecessary computation.  For Digital TV, we may
  // want to perform error concealment.
  AVDecVideoMPEG2ErrorConcealment      :  TGUID = '{9d2bfe18-728d-48d2-b358-bc7e436c6674}';

  // CODECAPI_AVDecVideoCodecType (UINT32)
  AVDecVideoCodecType                  :  TGUID = '{434528e5-21f0-46b6-b62c-9b1b6b658cd1}';

  // CODECAPI_AVDecVideoDXVAMode (UINT32)
  AVDecVideoDXVAMode                   :  TGUID = '{f758f09e-7337-4ae7-8387-73dc2d54e67d}';

  // CODECAPI_AVDecVideoDXVABusEncryption (UINT32)
  AVDecVideoDXVABusEncryption          :  TGUID = '{42153c8b-fd0b-4765-a462-ddd9e8bcc388}';

  // AVEncVideoForceSourceScanType (UINT32)
  AVEncVideoForceSourceScanType        :  TGUID = '{1ef2065f-058a-4765-a4fc-8a864c103012}';

  // AVEncVideoNoOfFieldsToEncode (UINT64)
  AVEncVideoNoOfFieldsToEncode         :  TGUID = '{61e4bbe2-4ee0-40e7-80ab-51ddeebe6291}';

  // AVEncVideoNoOfFieldsToSkip (UINT64)
  AVEncVideoNoOfFieldsToSkip           :  TGUID = '{a97e1240-1427-4c16-a7f7-3dcfd8ba4cc5}';

  // AVEncVideoEncodeDimension (UINT32)
  AVEncVideoEncodeDimension            :  TGUID = '{1074df28-7e0f-47a4-a453-cdd73870f5ce}';

  // AVEncVideoEncodeOffsetOrigin (UINT32)
  AVEncVideoEncodeOffsetOrigin         :  TGUID = '{6bc098fe-a71a-4454-852e-4d2ddeb2cd24}';

  // AVEncVideoDisplayDimension (UINT32)
  AVEncVideoDisplayDimension           :  TGUID = '{de053668-f4ec-47a9-86d0-836770f0c1d5}';

  // AVEncVideoOutputScanType (UINT32)
  AVEncVideoOutputScanType             :  TGUID = '{460b5576-842e-49ab-a62d-b36f7312c9db}';

  // AVEncVideoInverseTelecineEnable (BOOL)
  AVEncVideoInverseTelecineEnable      :  TGUID = '{2ea9098b-e76d-4ccd-a030-d3b889c1b64c}';

  // AVEncVideoInverseTelecineThreshold (UINT32)
  AVEncVideoInverseTelecineThreshold   :  TGUID = '{40247d84-e895-497f-b44c-b74560acfe27}';

  // AVEncVideoSourceFilmContent (UINT32)
  AVEncVideoSourceFilmContent          :  TGUID = '{1791c64b-ccfc-4827-a0ed-2557793b2b1c}';

  // AVEncVideoSourceIsBW (BOOL)
  deoSourceIsBW                        :  TGUID = '{42ffc49b-1812-4fdc-8d24-7054c521e6eb}';

  // AVEncVideoFieldSwap (BOOL)
  deoFieldSwap                         :  TGUID = '{fefd7569-4e0a-49f2-9f2b-360ea48c19a2}';

  // AVEncVideoInputChromaResolution (UINT32)
  deoInputChromaResolution             :  TGUID = '{bb0cec33-16f1-47b0-8a88-37815bee1739}';

  // AVEncVideoOutputChromaSubsamplingFormat (UINT32)
  deoOutputChromaResolution            :  TGUID = '{6097b4c9-7c1d-4e64-bfcc-9e9765318ae7}';

  // AVEncVideoInputChromaSubsampling (UINT32)
  AVEncVideoInputChromaSubsampling     :  TGUID = '{a8e73a39-4435-4ec3-a6ea-98300f4b36f7}';

  // AVEncVideoOutputChromaSubsampling (UINT32)
  AVEncVideoOutputChromaSubsampling    :  TGUID = '{fa561c6c-7d17-44f0-83c9-32ed12e96343}';

  // AVEncVideoInputColorPrimaries (UINT32)
  AVEncVideoInputColorPrimaries        :  TGUID = '{c24d783f-7ce6-4278-90ab-28a4f1e5f86c}';

  // AVEncVideoOutputColorPrimaries (UINT32)
  AVEncVideoOutputColorPrimaries       :  TGUID = '{be95907c-9d04-4921-8985-a6d6d87d1a6c}';

  // AVEncVideoInputColorTransferFunction (UINT32)
  AVEncVideoInputColorTransferFunction   :  TGUID = '{8c056111-a9c3-4b08-a0a0-ce13f8a27c75}';

  // AVEncVideoOutputColorTransferFunction (UINT32)
  AVEncVideoOutputColorTransferFunction  :  TGUID = '{4a7f884a-ea11-460d-bf57-b88bc75900de}';

  // AVEncVideoInputColorTransferMatrix (UINT32)
  AVEncVideoInputColorTransferMatrix   :  TGUID = '{52ed68b9-72d5-4089-958d-f5405d55081c}';

  // AVEncVideoOutputColorTransferMatrix (UINT32)
  AVEncVideoOutputColorTransferMatrix  :  TGUID = '{a9b90444-af40-4310-8fbe-ed6d933f892b}';

  // AVEncVideoInputColorLighting (UINT32)
  AVEncVideoInputColorLighting         :  TGUID = '{46a99549-0015-4a45-9c30-1d5cfa258316}';

  // AVEncVideoOutputColorLighting (UINT32)
  AVEncVideoOutputColorLighting        :  TGUID = '{0e5aaac6-ace6-4c5c-998e-1a8c9c6c0f89}';

  // AVEncVideoInputColorNominalRange (UINT32)
  AVEncVideoInputColorNominalRange     :  TGUID = '{16cf25c6-a2a6-48e9-ae80-21aec41d427e}';

  // AVEncVideoOutputColorNominalRange (UINT32)
  AVEncVideoOutputColorNominalRange    :  TGUID = '{972835ed-87b5-4e95-9500-c73958566e54}';

  // AVEncInputVideoSystem (UINT32)
  AVEncInputVideoSystem                :  TGUID = '{bede146d-b616-4dc7-92b2-f5d9fa9298f7}';

  // AVEncVideoHeaderDropFrame (UINT32)
  AVEncVideoHeaderDropFrame            :  TGUID = '{6ed9e124-7925-43fe-971b-e019f62222b4}';

  // AVEncVideoHeaderHours (UINT32)
  AVEncVideoHeaderHours                :  TGUID = '{2acc7702-e2da-4158-bf9b-88880129d740}';

  // AVEncVideoHeaderMinutes (UINT32)
  AVEncVideoHeaderMinutes              :  TGUID = '{dc1a99ce-0307-408b-880b-b8348ee8ca7f}';

  // AVEncVideoHeaderSeconds (UINT32)
  AVEncVideoHeaderSeconds              :  TGUID = '{4a2e1a05-a780-4f58-8120-9a449d69656b}';

  // AVEncVideoHeaderFrames (UINT32)
  AVEncVideoHeaderFrames               :  TGUID = '{afd5f567-5c1b-4adc-bdaf-735610381436}';

  // AVEncVideoDefaultUpperFieldDominant (BOOL)
  AVEncVideoDefaultUpperFieldDominant  :  TGUID = '{810167c4-0bc1-47ca-8fc2-57055a1474a5}';

  // AVEncVideoCBRMotionTradeoff (UINT32)
  AVEncVideoCBRMotionTradeoff          :  TGUID = '{0d49451e-18d5-4367-a4ef-3240df1693c4}';

  // AVEncVideoCodedVideoAccessUnitSize (UINT32)
  AVEncVideoCodedVideoAccessUnitSize   :  TGUID = '{b4b10c15-14a7-4ce8-b173-dc90a0b4fcdb}';

  // AVEncVideoMaxKeyframeDistance (UINT32)
  AVEncVideoMaxKeyframeDistance        :  TGUID = '{2987123a-ba93-4704-b489-ec1e5f25292c}';

  // AVEncH264CABACEnable (BOOL)
  AVEncH264CABACEnable                 :  TGUID = '{ee6cad62-d305-4248-a50e-e1b255f7caf8}';

  // AVEncVideoContentType (UINT32)
  AVEncVideoContentType                :  TGUID = '{66117aca-eb77-459d-930c-a48d9d0683fc}';

  // AVEncNumWorkerThreads (UINT32)
  AVEncNumWorkerThreads                :  TGUID = '{b0c8bf60-16f7-4951-a30b-1db1609293d6}';

  // AVEncVideoEncodeQP (UINT64)
  AVEncVideoEncodeQP                   :  TGUID = '{2cb5696b-23fb-4ce1-a0f9-ef5b90fd55ca}';

  // AVEncVideoMinQP (UINT32)
  AVEncVideoMinQP                      :  TGUID = '{0ee22c6a-a37c-4568-b5f1-9d4c2b3ab886}';

  // AVEncVideoForceKeyFrame (UINT32)
  AVEncVideoForceKeyFrame              :  TGUID = '{398c1b98-8353-475a-9ef2-8f265d260345}';

  // AVEncH264SPSID (UINT32)
  AVEncH264SPSID                       :  TGUID = '{50f38f51-2b79-40e3-b39c-7e9fa0770501}';

  // AVEncH264PPSID (UINT32)
  AVEncH264PPSID                       :  TGUID = '{bfe29ec2-056c-4d68-a38d-ae5944c8582e}';

  // AVEncAdaptiveMode (UINT32)
  AVEncAdaptiveMode                    :  TGUID = '{4419b185-da1f-4f53-bc76-097d0c1efb1e}';


  // AVEncVideoSelectLayer (UINT32)
  AVEncVideoSelectLayer                :  TGUID = '{eb1084f5-6aaa-4914-bb2f-6147227f12e7}';

  // AVEncVideoTemporalLayerCount (UINT32)
  AVEncVideoTemporalLayerCount         :  TGUID = '{19caebff-b74d-4cfd-8c27-c2f9d97d5f52}';

  // AVEncVideoUsage (UINT32)
  AVEncVideoUsage                      :  TGUID = '{1f636849-5dc1-49f1-b1d8-ce3cf62ea385}';

  // AVEncVideoRateControlParams (UINT64)
  AVEncVideoRateControlParams          :  TGUID = '{87d43767-7645-44ec-b438-d3322fbca29f}';

  // AVEncVideoSupportedControls (UINT64)
  AVEncVideoSupportedControls          :  TGUID = '{d3f40fdd-77b9-473d-8196-061259e69cff}';

  // AVEncVideoEncodeFrameTypeQP (UINT64)
  AVEncVideoEncodeFrameTypeQP          :  TGUID = '{aa70b610-e03f-450c-ad07-07314e639ce7}';

  // AVEncSliceControlMode (UINT32)
  AVEncSliceControlMode                :  TGUID = '{e9e782ef-5f18-44c9-a90b-e9c3c2c17b0b}';

  // AVEncSliceControlSize (UINT32)
  AVEncSliceControlSize                :  TGUID = '{92f51df3-07a5-4172-aefe-c69ca3b60e35}';

  // CODECAPI_AVEncSliceGenerationMode (UINT32)
  AVEncSliceGenerationMode         :  TGUID = '{8a6bc67f-9497-4286-b46b-02db8d60edbc}';

  // AVEncVideoMaxNumRefFrame (UINT32)
  AVEncVideoMaxNumRefFrame         :  TGUID = '{964829ed-94f9-43b4-b74d-ef40944b69a0}';

  // AVEncVideoMeanAbsoluteDifference (UINT32)
  AVEncVideoMeanAbsoluteDifference :  TGUID = '{e5c0c10f-81a4-422d-8c3f-b474a4581336}';

  // AVEncVideoMaxQP (UINT32)
  AVEncVideoMaxQP            :  TGUID = '{3daf6f66-a6a7-45e0-a8e5-f2743f46a3a2}';

  // AVEncVideoLTRBufferControl (UINT32)
  AVEncVideoLTRBufferControl :  TGUID = '{a4a0e93d-4cbc-444c-89f4-826d310e92a7}';

  // AVEncVideoMarkLTRFrame (UINT32)
  AVEncVideoMarkLTRFrame     :  TGUID = '{e42f4748-a06d-4ef9-8cea-3d05fde3bd3b}';

  // AVEncVideoUseLTRFrame (UINT32)
  AVEncVideoUseLTRFrame      :  TGUID = '{00752db8-55f7-4f80-895b-27639195f2ad}';

  // AVEncVideoROIEnabled (UINT32)
  AVEncVideoROIEnabled       :  TGUID = '{d74f7f18-44dd-4b85-aba3-05d9f42a8280}';

  // AVEncMaxFrameRate (UINT64)
  AVEncMaxFrameRate          :  TGUID = '{B98E1B31-19FA-4D4F-9931-D6A5B8AAB93C}';



  // Audio/Video Mux

  // AVEncMuxOutputStreamType (UINT32)
  AVEncMuxOutputStreamType :  TGUID = '{cedd9e8f-34d3-44db-a1d8-f81520254f3e}';

  //
  // Common Post-Encode Video Statistical Parameters
  //

  // AVEncStatVideoOutputFrameRate (UINT32/UINT32)
  AVEncStatVideoOutputFrameRate :  TGUID = '{be747849-9ab4-4a63-98fe-f143f04f8ee9}';

  // AVEncStatVideoCodedFrames (UINT32)
  AVEncStatVideoCodedFrames :  TGUID = '{d47f8d61-6f5a-4a26-bb9f-cd9518462bcd}';

  // AVEncStatVideoTotalFrames (UINT32)
  AVEncStatVideoTotalFrames :  TGUID = '{fdaa9916-119a-4222-9ad6-3f7cab99cc8b}';

  //
  // Common Audio Parameters
  //

  // AVEncAudioIntervalToEncode (UINT64)
  AVEncAudioIntervalToEncode :  TGUID = '{866e4b4d-725a-467c-bb01-b496b23b25f9}';

  // AVEncAudioIntervalToSkip (UINT64)
  AVEncAudioIntervalToSkip :  TGUID = '{88c15f94-c38c-4796-a9e8-96e967983f26}';

  // AVEncAudioDualMono (UINT32) - Read/Write
  // Some audio encoders can encode 2 channel input as "dual mono". Use this
  // property to set the appropriate field in the bitstream header to indicate that the
  // 2 channel bitstream is or isn't dual mono.
  // For encoding MPEG audio, use the DualChannel option in AVEncMPACodingMode instead
  AVEncAudioDualMono :  TGUID = '{3648126b-a3e8-4329-9b3a-5ce566a43bd3}';

  // AVEncAudioMeanBitRate (UINT32) - Read/Write - Used to specify audio bitrate (in bits per second) when the encoder is instantiated as an audio+video encoder.
  AVEncAudioMeanBitRate :  TGUID = '{921295bb-4fca-4679-aab8-9e2a1d753384}';

  // AVEncAudioMapDestChannel0..15 (UINT32)
  AVEncAudioMapDestChannel0 :  TGUID = '{bc5d0b60-df6a-4e16-9803-b82007a30c8d}';

  AVEncAudioMapDestChannel1 :  TGUID = '{bc5d0b61-df6a-4e16-9803-b82007a30c8d}';

  AVEncAudioMapDestChannel2 :  TGUID = '{bc5d0b62-df6a-4e16-9803-b82007a30c8d}';

  AVEncAudioMapDestChannel3 :  TGUID = '{bc5d0b63-df6a-4e16-9803-b82007a30c8d}';

  AVEncAudioMapDestChannel4 :  TGUID = '{bc5d0b64-df6a-4e16-9803-b82007a30c8d}';

  AVEncAudioMapDestChannel5 :  TGUID = '{bc5d0b65-df6a-4e16-9803-b82007a30c8d}';

  AVEncAudioMapDestChannel6 :  TGUID = '{bc5d0b66-df6a-4e16-9803-b82007a30c8d}';

  AVEncAudioMapDestChannel7 :  TGUID = '{bc5d0b67-df6a-4e16-9803-b82007a30c8d}';

  AVEncAudioMapDestChannel8 :  TGUID = '{bc5d0b68-df6a-4e16-9803-b82007a30c8d}';

  AVEncAudioMapDestChannel9 :  TGUID = '{bc5d0b69-df6a-4e16-9803-b82007a30c8d}';

  AVEncAudioMapDestChannel10 :  TGUID = '{bc5d0b6a-df6a-4e16-9803-b82007a30c8d}';

  AVEncAudioMapDestChannel11 :  TGUID = '{bc5d0b6b-df6a-4e16-9803-b82007a30c8d}';

  AVEncAudioMapDestChannel12 :  TGUID = '{bc5d0b6c-df6a-4e16-9803-b82007a30c8d}';

  AVEncAudioMapDestChannel13 :  TGUID = '{bc5d0b6d-df6a-4e16-9803-b82007a30c8d}';

  AVEncAudioMapDestChannel14          :  TGUID = '{bc5d0b6e-df6a-4e16-9803-b82007a30c8d}';

  AVEncAudioMapDestChannel15          :  TGUID = '{bc5d0b6f-df6a-4e16-9803-b82007a30c8d}';


  // AVEncAudioInputContent (UINT32) <---- You have ENUM in the doc
  AVEncAudioInputContent :  TGUID = '{3e226c2b-60b9-4a39-b00b-a7b40f70d566}';

  // Common Post-Encode Audio Statistical Parameters

  // AVEncStatAudioPeakPCMValue (UINT32)
  AVEncStatAudioPeakPCMValue :  TGUID = '{dce7fd34-dc00-4c16-821b-35d9eb00fb1a}';

  // AVEncStatAudioAveragePCMValue (UINT32)
  AVEncStatAudioAveragePCMValue :  TGUID = '{979272f8-d17f-4e32-bb73-4e731c68ba2d}';

  // AVEncStatAverageBPS (UINT32)
  AVEncStatAudioAverageBPS :  TGUID = '{ca6724db-7059-4351-8b43-f82198826a14}';

  // AVEncStatAverageBPS (UINT32)
  AVEncStatAverageBPS :  TGUID = '{ca6724db-7059-4351-8b43-f82198826a14}';

  // AVEncStatHardwareProcessorUtilitization (UINT32)
  // HW usage % x 1000
  AVEncStatHardwareProcessorUtilitization :  TGUID = '{995dc027-cb95-49e6-b91b-5967753cdcb8}';

  // AVEncStatHardwareBandwidthUtilitization (UINT32)
  // HW usage % x 1000
  AVEncStatHardwareBandwidthUtilitization :  TGUID = '{0124ba9b-dc41-4826-b45f-18ac01b3d5a8}';

  //
  // MPV Encoder Specific Parameters
  //

  // AVEncMPVGOPSize (UINT32)
  AVEncMPVGOPSize :  TGUID = '{95f31b26-95a4-41aa-9303-246a7fc6eef1}';

  // AVEncMPVGOPOpen (BOOL)
  AVEncMPVGOPOpen :  TGUID = '{b1d5d4a6-3300-49b1-ae61-a09937ab0e49}';

  // AVEncMPVDefaultBPictureCount (UINT32)
  AVEncMPVDefaultBPictureCount :  TGUID = '{8d390aac-dc5c-4200-b57f-814d04babab2}';

  // AVEncMPVProfile (UINT32) <---- You have GUID in the doc
  AVEncMPVProfile :  TGUID = '{dabb534a-1d99-4284-975a-d90e2239baa1}';

  // AVEncMPVLevel (UINT32) <---- You have GUID in the doc
  AVEncMPVLevel :  TGUID = '{6ee40c40-a60c-41ef-8f50-37c2249e2cb3}';

  //
  // Advanced MPV Encoder Specific Parameters
  //

  // AVEncMPVAddSeqEndCode (BOOL)
  AVEncMPVAddSeqEndCode :  TGUID = '{a823178f-57df-4c7a-b8fd-e5ec8887708d}';

  // AVEncMPVGOPSInSeq (UINT32)
  AVEncMPVGOPSInSeq :  TGUID = '{993410d4-2691-4192-9978-98dc2603669f}';

  // AVEncMPVUseConcealmentMotionVectors (BOOL)
  AVEncMPVUseConcealmentMotionVectors :  TGUID = '{ec770cf3-6908-4b4b-aa30-7fb986214fea}';

  // AVEncMPVSceneDetection (UINT32)
  AVEncMPVSceneDetection :  TGUID = '{552799f1-db4c-405b-8a3a-c93f2d0674dc}';

  // Dolby Digital(TM) Audio Specific Parameters
  //
  // AVEncDDService (UINT)
  AVEncDDService :  TGUID = '{d2e1bec7-5172-4d2a-a50e-2f3b82b1ddf8}';

  // AVEncMPVFrameFieldMode (UINT32)
  AVEncMPVFrameFieldMode :  TGUID = '{acb5de96-7b93-4c2f-8825-b0295fa93bf4}';

  // AVEncMPVGenerateHeaderSeqExt (BOOL)
  AVEncMPVGenerateHeaderSeqExt :  TGUID = '{d5e78611-082d-4e6b-98af-0f51ab139222}';

  // AVEncMPVGenerateHeaderSeqDispExt (BOOL)
  AVEncMPVGenerateHeaderSeqDispExt :  TGUID = '{6437aa6f-5a3c-4de9-8a16-53d9c4ad326f}';

  // AVEncMPVGenerateHeaderPicExt (BOOL)
  AVEncMPVGenerateHeaderPicExt :  TGUID = '{1b8464ab-944f-45f0-b74e-3a58dad11f37}';

  // AVEncMPVGenerateHeaderPicDispExt (BOOL)
  AVEncMPVGenerateHeaderPicDispExt :  TGUID = '{c6412f84-c03f-4f40-a00c-4293df8395bb}';

  // AVEncMPVGenerateHeaderSeqScaleExt (BOOL)
  AVEncMPVGenerateHeaderSeqScaleExt :  TGUID = '{0722d62f-dd59-4a86-9cd5-644f8e2653d8}';

  // AVEncMPVScanPattern (UINT32)
  AVEncMPVScanPattern :  TGUID = '{7f8a478e-7bbb-4ae2-b2fc-96d17fc4a2d6}';

  // AVEncMPVIntraDCPrecision (UINT32)
  AVEncMPVIntraDCPrecision :  TGUID = '{a0116151-cbc8-4af3-97dc-d00cceb82d79}';

  // AVEncMPVQScaleType (UINT32)
  AVEncMPVQScaleType :  TGUID = '{2b79ebb7-f484-4af7-bb58-a2a188c5cbbe}';

  // AVEncMPVIntraVLCTable (UINT32)
  AVEncMPVIntraVLCTable :  TGUID = '{a2b83ff5-1a99-405a-af95-c5997d558d3a}';

  // AVEncMPVQuantMatrixIntra (BYTE[64] encoded as a string of 128 hex digits)
  AVEncMPVQuantMatrixIntra :  TGUID = '{9bea04f3-6621-442c-8ba1-3ac378979698}';

  // AVEncMPVQuantMatrixNonIntra (BYTE[64] encoded as a string of 128 hex digits)
  AVEncMPVQuantMatrixNonIntra :  TGUID = '{87f441d8-0997-4beb-a08e-8573d409cf75}';

  // AVEncMPVQuantMatrixChromaIntra (BYTE[64] encoded as a string of 128 hex digits)
  AVEncMPVQuantMatrixChromaIntra :  TGUID = '{9eb9ecd4-018d-4ffd-8f2d-39e49f07b17a}';

  // AVEncMPVQuantMatrixChromaNonIntra (BYTE[64] encoded as a string of 128 hex digits)
  AVEncMPVQuantMatrixChromaNonIntra :  TGUID = '{1415b6b1-362a-4338-ba9a-1ef58703c05b}';

  // AVEncMPALayer (UINT)
  AVEncMPALayer :  TGUID = '{9d377230-f91b-453d-9ce0-78445414c22d}';

  // AVEncMPACodingMode (UINT)
  AVEncMPACodingMode :  TGUID = '{b16ade03-4b93-43d7-a550-90b4fe224537}';

  // AVEncMPACopyright (BOOL) - default state to encode into the stream (may be overridden by input)
  // 1 (True)  - copyright protected
  // 0 (False) - not copyright protected
  AVEncMPACopyright :  TGUID = '{a6ae762a-d0a9-4454-b8ef-f2dbeefdd3bd}';

  // AVEncMPAOriginalBitstream (BOOL) - default value to encode into the stream (may be overridden by input)
  // 1 (True)  - for original bitstream
  // 0 (False) - for copy bitstream
  AVEncMPAOriginalBitstream :  TGUID = '{3cfb7855-9cc9-47ff-b829-b36786c92346}';

  // AVEncMPAEnableRedundancyProtection (BOOL)
  // 1 (True)  -  Redundancy should be added to facilitate error detection and concealment (CRC)
  // 0 (False) -  No redundancy should be added
  AVEncMPAEnableRedundancyProtection :  TGUID = '{5e54b09e-b2e7-4973-a89b-0b3650a3beda}';

  // AVEncMPAPrivateUserBit (UINT) - User data bit value to encode in the stream
  AVEncMPAPrivateUserBit :  TGUID = '{afa505ce-c1e3-4e3d-851b-61b700e5e6cc}';

  // AVEncMPAEmphasisType (UINT)
  // Indicates type of de-emphasis filter to be used
  AVEncMPAEmphasisType :  TGUID = '{2d59fcda-bf4e-4ed6-b5df-5b03b36b0a1f}';

  // AVEncDDDialogNormalization (UINT32)
  AVEncDDDialogNormalization :  TGUID = '{d7055acf-f125-437d-a704-79c79f0404a8}';

  // AVEncDDCentreDownMixLevel (UINT32)
  AVEncDDCentreDownMixLevel :  TGUID = '{e285072c-c958-4a81-afd2-e5e0daf1b148}';

  // AVEncDDSurroundDownMixLevel (UINT32)
  AVEncDDSurroundDownMixLevel :  TGUID = '{7b20d6e5-0bcf-4273-a487-506b047997e9}';

  // AVEncDDProductionInfoExists (BOOL)
  AVEncDDProductionInfoExists :  TGUID = '{b0b7fe5f-b6ab-4f40-964d-8d91f17c19e8}';

  // AVEncDDProductionRoomType (UINT32)
  AVEncDDProductionRoomType :  TGUID = '{dad7ad60-23d8-4ab7-a284-556986d8a6fe}';

  // AVEncDDProductionMixLevel (UINT32)
  AVEncDDProductionMixLevel :  TGUID = '{301d103a-cbf9-4776-8899-7c15b461ab26}';

  // AVEncDDCopyright (BOOL)
  AVEncDDCopyright :  TGUID = '{8694f076-cd75-481d-a5c6-a904dcc828f0}';

  // AVEncDDOriginalBitstream (BOOL)
  AVEncDDOriginalBitstream :  TGUID = '{966ae800-5bd3-4ff9-95b9-d30566273856}';

  // AVEncDDDigitalDeemphasis (BOOL)
  AVEncDDDigitalDeemphasis :  TGUID = '{e024a2c2-947c-45ac-87d8-f1030c5c0082}';

  // AVEncDDDCHighPassFilter (BOOL)
  AVEncDDDCHighPassFilter :  TGUID = '{9565239f-861c-4ac8-bfda-e00cb4db8548}';

  // AVEncDDChannelBWLowPassFilter (BOOL)
  AVEncDDChannelBWLowPassFilter :  TGUID = '{e197821d-d2e7-43e2-ad2c-00582f518545}';

  // AVEncDDLFELowPassFilter (BOOL)
  AVEncDDLFELowPassFilter :  TGUID = '{d3b80f6f-9d15-45e5-91be-019c3fab1f01}';

  // AVEncDDSurround90DegreeePhaseShift (BOOL)
  AVEncDDSurround90DegreeePhaseShift :  TGUID = '{25ecec9d-3553-42c0-bb56-d25792104f80}';

  // AVEncDDSurround3dBAttenuation (BOOL)
  AVEncDDSurround3dBAttenuation :  TGUID = '{4d43b99d-31e2-48b9-bf2e-5cbf1a572784}';

  // AVEncDDDynamicRangeCompressionControl (UINT32)
  AVEncDDDynamicRangeCompressionControl :  TGUID = '{cfc2ff6d-79b8-4b8d-a8aa-a0c9bd1c2940}';

  // AVEncDDRFPreEmphasisFilter (BOOL)
  AVEncDDRFPreEmphasisFilter :  TGUID = '{21af44c0-244e-4f3d-a2cc-3d3068b2e73f}';

  // AVEncDDSurroundExMode (UINT32)
  AVEncDDSurroundExMode :  TGUID = '{91607cee-dbdd-4eb6-bca2-aadfafa3dd68}';

  // AVEncDDPreferredStereoDownMixMode (UINT32)
  AVEncDDPreferredStereoDownMixMode :  TGUID = '{7f4e6b31-9185-403d-b0a2-763743e6f063}';

  // AVEncDDLtRtCenterMixLvl_x10 (INT32)
  AVEncDDLtRtCenterMixLvl_x10 :  TGUID = '{dca128a2-491f-4600-b2da-76e3344b4197}';

  // AVEncDDLtRtSurroundMixLvl_x10 (INT32)
  AVEncDDLtRtSurroundMixLvl_x10 :  TGUID = '{212246c7-3d2c-4dfa-bc21-652a9098690d}';

  // AVEncDDLoRoCenterMixLvl (INT32)
  AVEncDDLoRoCenterMixLvl_x10 :  TGUID = '{1cfba222-25b3-4bf4-9bfd-e7111267858c}';

  // AVEncDDLoRoSurroundMixLvl_x10 (INT32)
  AVEncDDLoRoSurroundMixLvl_x10 :  TGUID = '{e725cff6-eb56-40c7-8450-2b9367e91555}';

  // AVEncDDAtoDConverterType (UINT32)
  AVEncDDAtoDConverterType :  TGUID = '{719f9612-81a1-47e0-9a05-d94ad5fca948}';

  // AVEncDDHeadphoneMode (UINT32)
  AVEncDDHeadphoneMode :  TGUID = '{4052dbec-52f5-42f5-9b00-d134b1341b9d}';

  // AVEncWMVKeyFrameDistance (UINT32)
  AVEncWMVKeyFrameDistance :  TGUID = '{5569055e-e268-4771-b83e-9555ea28aed3}';

  // AVEncWMVInterlacedEncoding (UINT32)
  AVEncWMVInterlacedEncoding :  TGUID = '{e3d00f8a-c6f5-4e14-a588-0ec87a726f9b}';

  // AVEncWMVDecoderComplexity (UINT32)
  AVEncWMVDecoderComplexity :  TGUID = '{f32c0dab-f3cb-4217-b79f-8762768b5f67}';

  // AVEncWMVHasKeyFrameBufferLevelMarker (BOOL)
  AVEncWMVKeyFrameBufferLevelMarker :  TGUID = '{51ff1115-33ac-426c-a1b1-09321bdf96b4}';

  // AVEncWMVProduceDummyFrames (UINT32)
  AVEncWMVProduceDummyFrames :  TGUID = '{d669d001-183c-42e3-a3ca-2f4586d2396c}';

  //
  // WMV Post-Encode Statistical Parameters
  //

  // AVEncStatWMVCBAvg (UINT32/UINT32)
  AVEncStatWMVCBAvg :  TGUID = '{6aa6229f-d602-4b9d-b68c-c1ad78884bef}';

  // AVEncStatWMVCBMax (UINT32/UINT32)
  AVEncStatWMVCBMax :  TGUID = '{e976bef8-00fe-44b4-b625-8f238bc03499}';

  // AVEncStatWMVDecoderComplexityProfile (UINT32)
  AVEncStatWMVDecoderComplexityProfile :  TGUID = '{89e69fc3-0f9b-436c-974a-df821227c90d}';

  // AVEncStatMPVSkippedEmptyFrames (UINT32)
  AVEncStatMPVSkippedEmptyFrames :  TGUID = '{32195fd3-590d-4812-a7ed-6d639a1f9711}';

  //
  // MPEG1/2 Multiplexer Interfaces
  //

  //
  // MPEG1/2 Packetizer Interface
  //

  // Shared with Mux:
  // AVEncMP12MuxEarliestPTS (UINT32)
  // AVEncMP12MuxLargestPacketSize (UINT32)
  // AVEncMP12MuxSysSTDBufferBound (UINT32)

  // AVEncMP12PktzSTDBuffer (UINT32)
  AVEncMP12PktzSTDBuffer :  TGUID = '{0b751bd0-819e-478c-9435-75208926b377}';

  // AVEncMP12PktzStreamID (UINT32)
  AVEncMP12PktzStreamID :  TGUID = '{c834d038-f5e8-4408-9b60-88f36493fedf}';

  // AVEncMP12PktzInitialPTS (UINT32)
  AVEncMP12PktzInitialPTS :  TGUID = '{2a4f2065-9a63-4d20-ae22-0a1bc896a315}';

  // AVEncMP12PktzPacketSize (UINT32)
  AVEncMP12PktzPacketSize :  TGUID = '{ab71347a-1332-4dde-a0e5-ccf7da8a0f22}';

  // AVEncMP12PktzCopyright (BOOL)
  AVEncMP12PktzCopyright :  TGUID = '{c8f4b0c1-094c-43c7-8e68-a595405a6ef8}';

  // AVEncMP12PktzOriginal (BOOL)
  AVEncMP12PktzOriginal :  TGUID = '{6b178416-31b9-4964-94cb-6bff866cdf83}';

  //
  // MPEG1/2 Multiplexer Interface
  //

  // AVEncMP12MuxPacketOverhead (UINT32)
  AVEncMP12MuxPacketOverhead :  TGUID = '{e40bd720-3955-4453-acf9-b79132a38fa0}';

  // AVEncMP12MuxNumStreams (UINT32)
  AVEncMP12MuxNumStreams :  TGUID = '{f7164a41-dced-4659-a8f2-fb693f2a4cd0}';

  // AVEncMP12MuxEarliestPTS (UINT32)
  AVEncMP12MuxEarliestPTS :  TGUID = '{157232b6-f809-474e-9464-a7f93014a817}';

  // AVEncMP12MuxLargestPacketSize (UINT32)
  AVEncMP12MuxLargestPacketSize :  TGUID = '{35ceb711-f461-4b92-a4ef-17b6841ed254}';

  // AVEncMP12MuxInitialSCR (UINT32)
  AVEncMP12MuxInitialSCR :  TGUID = '{3433ad21-1b91-4a0b-b190-2b77063b63a4}';

  // AVEncMP12MuxMuxRate (UINT32)
  AVEncMP12MuxMuxRate :  TGUID = '{ee047c72-4bdb-4a9d-8e21-41926c823da7}';

  // AVEncMP12MuxPackSize (UINT32)
  AVEncMP12MuxPackSize :  TGUID = '{f916053a-1ce8-4faf-aa0b-ba31c80034b8}';

  // AVEncMP12MuxSysSTDBufferBound (UINT32)
  AVEncMP12MuxSysSTDBufferBound :  TGUID = '{35746903-b545-43e7-bb35-c5e0a7d5093c}';

  // AVEncMP12MuxSysRateBound (UINT32)
  AVEncMP12MuxSysRateBound :  TGUID = '{05f0428a-ee30-489d-ae28-205c72446710}';

  // AVEncMP12MuxTargetPacketizer (UINT32)
  AVEncMP12MuxTargetPacketizer :  TGUID = '{d862212a-2015-45dd-9a32-1b3aa88205a0}';

  // AVEncMP12MuxSysFixed (UINT32)
  AVEncMP12MuxSysFixed :  TGUID = '{cefb987e-894f-452e-8f89-a4ef8cec063a}';

  // AVEncMP12MuxSysCSPS (UINT32)
  AVEncMP12MuxSysCSPS :  TGUID = '{7952ff45-9c0d-4822-bc82-8ad772e02993}';

  // AVEncMP12MuxSysVideoLock (BOOL)
  AVEncMP12MuxSysVideoLock :  TGUID = '{b8296408-2430-4d37-a2a1-95b3e435a91d}';

  // AVEncMP12MuxSysAudioLock (BOOL)
  AVEncMP12MuxSysAudioLock :  TGUID = '{0fbb5752-1d43-47bf-bd79-f2293d8ce337}';

  // AVEncMP12MuxDVDNavPacks (BOOL)
  AVEncMP12MuxDVDNavPacks :  TGUID = '{c7607ced-8cf1-4a99-83a1-ee5461be3574}';

  //
  // Decoding Interface
  //

  // format values are GUIDs as VARIANT BSTRs
  AVDecCommonInputFormat :  TGUID = '{e5005239-bd89-4be3-9c0f-5dde317988cc}';
  AVDecCommonOutputFormat :  TGUID = '{3c790028-c0ce-4256-b1a2-1b0fc8b1dcdc}';

  // AVDecCommonMeanBitRate - Mean bitrate in mbits/sec (UINT32)
  AVDecCommonMeanBitRate :  TGUID = '{59488217-007a-4f7a-8e41-5c48b1eac5c6}';
  // AVDecCommonMeanBitRateInterval - Mean bitrate interval (in 100ns) (UINT64)
  AVDecCommonMeanBitRateInterval :  TGUID = '{0ee437c6-38a7-4c5c-944c-68ab42116b85}';

  //
  // Audio Decoding Interface
  //

  // Value GUIDS
  // The following 6 GUIDs are values of the AVDecCommonOutputFormat property
  //
  // Stereo PCM output using matrix-encoded stereo down mix (aka Lt/Rt)
  AVDecAudioOutputFormat_PCM_Stereo_MatrixEncoded :  TGUID = '{696e1d30-548f-4036-825f-7026c60011bd}';
  //
  // Regular PCM output (any number of channels)
  AVDecAudioOutputFormat_PCM :  TGUID = '{696e1d31-548f-4036-825f-7026c60011bd}';
  //
  // SPDIF PCM (IEC 60958) stereo output. Type of stereo down mix should
  // be specified by the application.
  AVDecAudioOutputFormat_SPDIF_PCM :  TGUID = '{696e1d32-548f-4036-825f-7026c60011bd}';
  //
  // SPDIF bitstream (IEC 61937) output, such as AC3, MPEG or DTS.
  AVDecAudioOutputFormat_SPDIF_Bitstream :  TGUID = '{696e1d33-548f-4036-825f-7026c60011bd}';
  //
  // Stereo PCM output using regular stereo down mix (aka Lo/Ro)
  AVDecAudioOutputFormat_PCM_Headphones :  TGUID = '{696e1d34-548f-4036-825f-7026c60011bd}';

  // Stereo PCM output using automatic selection of stereo down mix
  // mode (Lo/Ro or Lt/Rt). Use this when the input stream includes
  // information about the preferred downmix mode (such as Annex D of AC3).
  // Default down mix mode should be specified by the application.
  AVDecAudioOutputFormat_PCM_Stereo_Auto :  TGUID = '{696e1d35-548f-4036-825f-7026c60011bd}';

  //
  // Video Decoder properties
  //

  // AVDecVideoImageSize (UINT32) - High UINT16 width, low UINT16 height
  AVDecVideoImageSize :  TGUID = '{5ee5747c-6801-4cab-aaf1-6248fa841ba4}';

  // AVDecVideoPixelAspectRatio (UINT32 as UINT16/UNIT16) - High UINT16 width, low UINT16 height
  AVDecVideoPixelAspectRatio :  TGUID = '{b0cf8245-f32d-41df-b02c-87bd304d12ab}';

  // AVDecVideoInputScanType (UINT32)
  AVDecVideoInputScanType :  TGUID = '{38477e1f-0ea7-42cd-8cd1-130ced57c580}';

  // AVDecVideoSWPowerLevel (UINT32)
  // Related to video decoder software power saving level in MPEG4 Part 2, VC1 and H264.
  // "SW Power Level" will take a range from 0 to 100 to indicate the current power saving level.
  // 0 - Optimize for battery life, 50 - balanced, 100 - Optimize for video quality.
  AVDecVideoSWPowerLevel :  TGUID = '{fb5d2347-4dd8-4509-aed0-db5fa9aa93f4}';

  AVDecAudioInputWMA              :  TGUID = '{c95e8dcf-4058-4204-8c42-cb24d91e4b9b}';
  AVDecAudioInputWMAPro           :  TGUID = '{0128b7c7-da72-4fe3-bef8-5c52e3557704}';
  AVDecAudioInputDolby            :  TGUID = '{8e4228a0-f000-4e0b-8f54-ab8d24ad61a2}';
  AVDecAudioInputDTS              :  TGUID = '{600bc0ca-6a1f-4e91-b241-1bbeb1cb19e0}';
  AVDecAudioInputPCM              :  TGUID = '{f2421da5-bbb4-4cd5-a996-933c6b5d1347}';
  AVDecAudioInputMPEG             :  TGUID = '{91106f36-02c5-4f75-9719-3b7abf75e1f6}';
  AVDecAudioInputAAC              :  TGUID = '{97df7828-b94a-47e2-a4bc-51194db22a4d}';
  AVDecAudioInputHEAAC            :  TGUID = '{16efb4aa-330e-4f5c-98a8-cf6ac55cbe60}';
  AVDecAudioInputDolbyDigitalPlus :  TGUID = '{0803e185-8f5d-47f5-9908-19a5bbc9fe34}';

  // AVDecAACDownmixMode (UINT32)
  // AAC/HE-AAC Decoder uses standard ISO/IEC MPEG-2/MPEG-4 stereo downmix equations or uses
  // non-standard downmix. An example of a non standard downmix would be the one defined by ARIB document STD-B21 version 4.4.
  AVDecAACDownmixMode :  TGUID = '{01274475-f6bb-4017-b084-81a763c942d4}';

  // AVDecHEAACDynamicRangeControl (UINT32)
  // Set this property on an AAC/HE-AAC decoder to select whether Dynamic Range Control (DRC) should be applied or not.
  // If DRC is ON and the AAC/HE-AAC stream includes extension payload of type EXT_DYNAMIC_RANGE, DRC will be applied.
  AVDecHEAACDynamicRangeControl :  TGUID = '{287c8abe-69a4-4d39-8080-d3d9712178a0}';

  // AVDecAudioDualMono (UINT32) - Read only
  // The input bitstream header might have a field indicating whether the 2-ch bitstream
  // is dual mono or not. Use this property to read this field.
  // If it's dual mono, the application can set AVDecAudioDualMonoReproMode to determine
  // one of 4 reproduction modes
  AVDecAudioDualMono :  TGUID = '{4a52cda8-30f8-4216-be0f-ba0b2025921d}';

  // AVDecAudioDualMonoReproMode (UINT32)
  // Reproduction modes for programs containing two independent mono channels (Ch1 & Ch2).
  // In case of 2-ch input, the decoder should get AVDecAudioDualMono to check if the input
  // is regular stereo or dual mono. If dual mono, the application can ask the user to set the playback
  // mode by setting AVDecAudioDualReproMonoMode. If output is not stereo, use AVDecDDMatrixDecodingMode or
  // equivalent.
  AVDecAudioDualMonoReproMode :  TGUID = '{a5106186-cc94-4bc9-8cd9-aa2f61f6807e}';

  // AVAudioChannelCount (UINT32)
  // Total number of audio channels, including LFE if it exists.
  AVAudioChannelCount :  TGUID = '{1d3583c4-1583-474e-b71a-5ee463c198e4}';

  // AVAudioChannelConfig (UINT32)
  // A bit-wise OR of any number of enum values specified by eAVAudioChannelConfig
  AVAudioChannelConfig :  TGUID = '{17f89cb3-c38d-4368-9ede-63b94d177f9f}';

  // AVAudioSampleRate (UINT32)
  // In samples per second (Hz)
  AVAudioSampleRate :  TGUID = '{971d2723-1acb-42e7-855c-520a4b70a5f2}';

  //
  // Dolby Digital(TM) Audio Specific Parameters
  //

  // AVDDSurroundMode (UINT32) common to encoder/decoder
  AVDDSurroundMode :  TGUID = '{99f2f386-98d1-4452-a163-abc78a6eb770}';

  // AVDecDDOperationalMode (UINT32)
  AVDecDDOperationalMode :  TGUID = '{d6d6c6d1-064e-4fdd-a40e-3ecbfcb7ebd0}';

  // AVDecDDMatrixDecodingMode(UINT32)
  // A ProLogic decoder has a built-in auto-detection feature. When the Dolby Digital decoder
  // is set to the 6-channel output configuration and it is fed a 2/0 bit stream to decode, it can
  // do one of the following:
  // a) decode the bit stream and output it on the two front channels (eAVDecDDMatrixDecodingMode_OFF),
  // b) decode the bit stream followed by ProLogic decoding to create 6-channels (eAVDecDDMatrixDecodingMode_ON).
  // c) the decoder will look at the Surround bit ("dsurmod") in the bit stream to determine whether
  //    apply ProLogic decoding or not (eAVDecDDMatrixDecodingMode_AUTO).
  AVDecDDMatrixDecodingMode :  TGUID = '{ddc811a5-04ed-4bf3-a0ca-d00449f9355f}';

  // AVDecDDDynamicRangeScaleHigh (UINT32)
  // Indicates what fraction of the dynamic range compression
  // to apply. Relevant for negative values of dynrng only.
  // Linear range 0-100, where:
  //   0 - No dynamic range compression (preserve full dynamic range)
  // 100 - Apply full dynamic range compression
  AVDecDDDynamicRangeScaleHigh :  TGUID = '{50196c21-1f33-4af5-b296-11426d6c8789}';

  // AVDecDDDynamicRangeScaleLow (UINT32)
  // Indicates what fraction of the dynamic range compression
  // to apply. Relevant for positive values of dynrng only.
  // Linear range 0-100, where:
  //   0 - No dynamic range compression (preserve full dynamic range)
  // 100 - Apply full dynamic range compression
  AVDecDDDynamicRangeScaleLow :  TGUID = '{044e62e4-11a5-42d5-a3b2-3bb2c7c2d7cf}';


  // AVDecDDStereoDownMixMode (UINT32)
  // A Dolby Digital Decoder may apply stereo downmix in one of several ways, after decoding multichannel PCM.
  // Use one of the UINT32 values specified by eAVDecDDStereoDownMixMode to set stereo downmix mode.
  // Only relevant when the decoder's output is set to stereo.
  AVDecDDStereoDownMixMode :  TGUID = '{6ce4122c-3ee9-4182-b4ae-c10fc088649d}';

  // AVDSPLoudnessEqualization (UINT32)
  // Related to audio digital signal processing (DSP).
  // Apply "Loudness Equalization" to the audio stream, so users will not have to adjust volume control when audio stream changes.
  AVDSPLoudnessEqualization :  TGUID = '{8afd1a15-1812-4cbf-9319-433a5b2a3b27}';

  // AVDSPSpeakerFill (UINT32)
  // Related to audio digital signal processing (DSP).
  // "Speaker Fill" will take a mono or stereo audio stream and convert it to a multi channel (e.g. 5.1) audio stream.
  AVDSPSpeakerFill :  TGUID = '{5612bca1-56da-4582-8da1-ca8090f92768}';

  // AVPriorityControl (UINT32)
  // Indicates the task priority when not realtime (0..15)
  // Linear range 0-15, where:
  //   0 - idle
  // 15 - Highest
  AVPriorityControl :  TGUID = '{54ba3dc8-bdde-4329-b187-2018bc5c2ba1}';

  // AVRealtimeControl (UINT32)
  // Indicates the task is realtime or not
  // Linear range 0-1, where:
  //   0 - no realtime
  //   1 - realtime
  AVRealtimeControl :  TGUID = '{6f440632-c4ad-4bf7-9e52-456942b454b0}';

  // FeatureMapFlagsUsed (UINT32)
  // Indicates which flags may and won't be present in the per-frame FeatureMap data for the sequence.
  // The value is a bitwise OR of the MACROBLOCK_FLAG_* fields specified in mfapi.h
  FeatureMapFlagsUsed : TGUID = '{8BFDA3B8-7387-4c07-924F-FE63006CF22B}';

  // AVEncNoInputCopy (UINT32)
  // Enables the encoder to avoid copying the input buffer
  // 0 - default behavior (copy input buffer to encoder internal buffer)
  // 1 - use input buffer directly
  // Input color space must be IYUV or YV12 for this to be effective.  Input buffers must be fully contiguous.  Input buffers
  // must be macroblock-aligned (width and height divisible by 16).
  AVEncNoInputCopy :  TGUID = '{d2b46a2a-e8ee-4ec5-869e-449b6c62c81a}';

type
  // AVEncChromaEncodeMode (UINT32)
  // Change the mode used to encode chroma-only frames
  // A member of the eAVChromaEncodeMode structure, where:
  //   eAVChromaEncodeMode_420 - default encoding
  //   eAVChromaEncodeMode_444 - enhanced encoding of chroma for repeated input frames
  //   eAVChromaEncodeMode_444_v2 - encoder will skip non-chroma macroblocks, in addition to functionality for eAVChromaEncodeMode_444
  PeAVEncChromaEncodeMode = ^eAVEncChromaEncodeMode;
  eAVEncChromaEncodeMode = UINT32;
const
    eAVEncChromaEncodeMode_420    = UINT32(0);
    eAVEncChromaEncodeMode_444    = UINT32(1);
    eAVEncChromaEncodeMode_444_v2 = UINT32(2);

const

  AVEncChromaEncodeMode :  TGUID = '{8a47ab5a-4798-4c93-b5a5-554f9a3b9f50}';

  // AVEncNextProgressiveTime (UINT32)
  // Read-only
  // Provides the time until the encoder plans to update progressive
  // areas of the video frame.
  AVEncProgressiveUpdateTime :  TGUID = '{649faf66-afc6-4828-8fdc-0771cd9ab17d}';

  // AVEncNextChromaTime (UINT32)
  // Read-only
  // Provides the time until the encoder plans to update chroma
  // in the video frame.
  AVEncChromaUpdateTime :  TGUID = '{4b4fd998-4274-40bb-8ee4-07553e7e2d3a}';

  // AVEncAACEnableVBR (BOOL)
  // Indicates whether the AAC encoder should use VBR encoding.
  AVEncAACEnableVBR :  TGUID = '{e836bb98-fca3-44b6-9a39-24786be41be1}';

  // AVEncVideoConsecutiveFramesForLayer (UINT32)
  // Indicates the number of consecutive frames at a given temporal layer.
  // Set the CODECAPI_AVEncVideoSelectLayer property first to specify the temporal layer.
  AVEncVideoConsecutiveFramesForLayer :  TGUID = '{0AF35522-D984-45ae-BBB8-53933E0AB1B5}';

  // AVEncVideoMaxNumRefFrameForLayer (UINT32)
  // Used to limit the number of reference frames for a given temporal layer.
  // Set the CODECAPI_AVEncVideoSelectLayer property first to specify the temporal layer.
  AVEncVideoMaxNumRefFrameForLayer :  TGUID = '{3141C639-6329-40d1-B7E7-2F0E3AC18E02}';

  // AVEncTileRows (UINT32)
  // Specifies the number of tile rows to encode.
  AVEncTileRows :  TGUID = '{FBC650FC-41AB-4f9b-84B5-065BE9CD99EE}';

  // AVEncTileColumns (UINT32)
  // Specifies the number of tile columns to encode.
  AVEncTileColumns :  TGUID = '{B4B31205-01E8-452c-B876-8C6506545925}';

  // AVEncVideoEnableFramePsnrYuv (BOOL)
  // Indicates whether to enable or disable reporting frame PSNR of YUV planes for video encoding.
  // VARIANT_FALSE: disable; VARIANT_TRUE: enable
  AVEncVideoEnableFramePsnrYuv :  TGUID = '{2BBCDD1D-BC47-430E-B2E8-64801B47F5F0}';

  // AVEncVideoEnableSpatialAdaptiveQuantization (BOOL)
  // Indicates whether to enable or disable spatial adaptive quantization for video encoding.
  // VARIANT_FALSE: disable; VARIANT_TRUE: enable
  AVEncVideoEnableSpatialAdaptiveQuantization :  TGUID = '{659CB943-15CA-448D-B99A-875619DB4DE4}';

  // AVEncVideoOutputQPMapBlockSize (VT_UI4)
  // The block size used in reporting the output QP map for each block in an encoded video frame.
  // ulVal should be power of 2, such as 16 or 32, etc.
  // Zero value is used to disable the QP map reporting.
  AVEncVideoOutputQPMapBlockSize :  TGUID = '{97038743-4AE3-44C3-A0F2-5BD58A4634EF}';

  // AVEncVideoOutputBitsUsedMapBlockSize (VT_UI4)
  // The block size used in reporting the output bits used map for each block in an encoded video frame.
  // ulVal should be power of 2, such as 16 or 32, etc.
  // Zero value is used to disable the bits used map reporting.
  AVEncVideoOutputBitsUsedMapBlockSize :  TGUID = '{6C2CD11A-CA3B-44BD-9A9E-93B03634C36E}';

  { 10.0.28000.0  }
  // AVEncVideoSatdMapBlockSize (VT_UI4)
  // Zero disables SATD map reporting; other values are powers of two such as 16 or 32.
  AVEncVideoSatdMapBlockSize : TGUID = '{596F1106-8CE0-4302-AF79-C4EC67AADC6D}';

  // AVEncVideoInputDeltaQPBlockSettings (VT_BLOB)
  AVEncVideoInputDeltaQPBlockSettings : TGUID = '{5A4787DC-0648-47AA-B945-552BFAD2A6D8}';

  // AVEncVideoInputAbsoluteQPBlockSettings (VT_BLOB)
  AVEncVideoInputAbsoluteQPBlockSettings : TGUID = '{EF95A145-4F91-4DEA-8173-ACFF11434210}';

type
  PeAVEncVideoD3D12ReconstructedPictureOutputMode = ^eAVEncVideoD3D12ReconstructedPictureOutputMode;
  eAVEncVideoD3D12ReconstructedPictureOutputMode = UINT32;
const
  eAVEncVideoEncodeD3D12ReconstructedPictureMode_None = eAVEncVideoD3D12ReconstructedPictureOutputMode(0);
  eAVEncVideoEncodeD3D12ReconstructedPictureMode_Copy = eAVEncVideoD3D12ReconstructedPictureOutputMode(1);
  eAVEncVideoEncodeD3D12ReconstructedPictureMode_Shared = eAVEncVideoD3D12ReconstructedPictureOutputMode(2);

  AVEncVideoD3D12ReconstructedPictureOutputMode : TGUID = '{4A7B2E8F-1D93-4C6A-B548-91E2F8C5A7D3}';

type
  PeAV1EncoderOperatingMode = ^eAV1EncoderOperatingMode;
  eAV1EncoderOperatingMode = UINT32;
const
  eAV1EncoderOperatingMode_Auto = eAV1EncoderOperatingMode(0);
  eAV1EncoderOperatingMode_Reference = eAV1EncoderOperatingMode(1);
  eAV1EncoderOperatingMode_Optimized = eAV1EncoderOperatingMode(2);

  AVEncAV1EncoderOperatingMode : TGUID = '{8F2E1F91-5B4C-4E1A-9C3D-2F6A8B1D4E7C}';

  // AVScenarioInfo (UINT32)
  AVScenarioInfo :  TGUID = '{b28a6e64-3ff9-446a-8a4b-0d7a53413236}';

  // AVEncMPVGOPSizeMin (UINT32)
  AVEncMPVGOPSizeMin :  TGUID = '{7155cf20-d440-4852-ad0f-9c4abfe37a6a}';

  //AVEncMPVGOPSizeMax (UINT32)
  AVEncMPVGOPSizeMax :  TGUID = '{fe7de4c4-1936-4fe2-bdf7-1f18ca1d001f}';

  // AVEncVideoMaxCTBSize (UINT32)
  AVEncVideoMaxCTBSize :  TGUID = '{822363ff-cec8-43e5-92fd-e097488485e9}';

  // AVEncVideoCTBSize (UINT32)
  AVEncVideoCTBSize :  TGUID = '{d47db8b2-e73b-4cb9-8c3e-bd877d06d77b}';

  // VideoEncoderDisplayContentType (UINT32)
  VideoEncoderDisplayContentType :  TGUID = '{79b90b27-f4b1-42dc-9dd7-cdaf8135c400}';

  // AVEncEnableVideoProcessing (UINT32)
  AVEncEnableVideoProcessing :  TGUID = '{006f4bf6-0ea3-4d42-8702-b5d8be0f7a92}';

  // AVEncVideoGradualIntraRefresh (UINT32)
  AVEncVideoGradualIntraRefresh :  TGUID = '{8f347dee-cb0d-49ba-b462-db6927ee2101}';

  // GetOPMContext (UINT64)
  GetOPMContext :  TGUID = '{2f036c05-4c14-4689-8839-294c6d73e053}';

  // SetHDCPManagerContext (VOID)
  SetHDCPManagerContext :  TGUID = '{6d2d1fc8-3dc9-47eb-a1a2-471c80cd60d0}';

  // AVEncVideoMaxTemporalLayers (UINT32)
  AVEncVideoMaxTemporalLayers :  TGUID = '{9c668cfe-08e1-424a-934e-b764b064802a}';

  // AVEncVideoNumGOPsPerIDR (UINT32)
  AVEncVideoNumGOPsPerIDR :  TGUID = '{83bc5bdb-5b89-4521-8f66-33151c373176}';

  // AVEncCommonAllowFrameDrops (UINT32)
  AVEncCommonAllowFrameDrops :  TGUID = '{d8477dcb-9598-48e3-8d0c-752bf206093e}';

  // AVEncVideoIntraLayerPrediction (UINT32)
  AVEncVideoIntraLayerPrediction :  TGUID = '{d3af46b8-bf47-44bb-a283-69f0b0228ff9}';

  // AVEncVideoInstantTemporalUpSwitching (UINT32)
  AVEncVideoInstantTemporalUpSwitching :  TGUID = '{a3308307-0d96-4ba4-b1f0-b91a5e49df10}';

  // AVEncLowPowerEncoder (UINT32)
  AVEncLowPowerEncoder :  TGUID = '{b668d582-8bad-4f6a-9141-375a95358b6d}';

  // AVEnableInLoopDeblockFilter (UINT32)
  AVEnableInLoopDeblockFilter :  TGUID = '{d2e8e399-0623-4bf3-92a8-4d1818529ded}';


type
  PeAVEncCommonStreamEndHandling = ^eAVEncCommonStreamEndHandling;
  eAVEncCommonStreamEndHandling = UINT32;
const
  eAVEncCommonStreamEndHandling_DiscardPartial = UINT32(0);
  eAVEncCommonStreamEndHandling_EnsureComplete = UINT32(1);


type
  PeAVEncVideoOutputFrameRateConversion = ^eAVEncVideoOutputFrameRateConversion;
  eAVEncVideoOutputFrameRateConversion = UINT32;
const
  eAVEncVideoOutputFrameRateConversion_Disable = eAVEncVideoOutputFrameRateConversion(0);
  eAVEncVideoOutputFrameRateConversion_Enable  = eAVEncVideoOutputFrameRateConversion(1);
  eAVEncVideoOutputFrameRateConversion_Alias   = eAVEncVideoOutputFrameRateConversion(2);


type
  PeAVDecVideoSoftwareDeinterlaceMode = ^eAVDecVideoSoftwareDeinterlaceMode;
  eAVDecVideoSoftwareDeinterlaceMode = UINT32;
const
  eAVDecVideoSoftwareDeinterlaceMode_NoDeinterlacing          = eAVDecVideoSoftwareDeinterlaceMode(0); // do not use software deinterlace
  eAVDecVideoSoftwareDeinterlaceMode_ProgressiveDeinterlacing = eAVDecVideoSoftwareDeinterlaceMode(1); // Use progressive deinterlace
  eAVDecVideoSoftwareDeinterlaceMode_BOBDeinterlacing         = eAVDecVideoSoftwareDeinterlaceMode(2); // BOB deinterlacing
  eAVDecVideoSoftwareDeinterlaceMode_SmartBOBDeinterlacing    = eAVDecVideoSoftwareDeinterlaceMode(3); // Smart BOB deinterlacing


type
  PeAVFastDecodeMode = ^eAVFastDecodeMode;
  eAVFastDecodeMode = UINT32;
const
  eVideoDecodeCompliant  = eAVFastDecodeMode(0);
  eVideoDecodeOptimalLF  = eAVFastDecodeMode(1); // Optimal Loop Filter
  eVideoDecodeDisableLF  = eAVFastDecodeMode(2); // Disable Loop Filter
  eVideoDecodeFastest    = eAVFastDecodeMode(32);


type
  PeAVDecVideoH264ErrorConcealment = ^eAVDecVideoH264ErrorConcealment;
  eAVDecVideoH264ErrorConcealment = UINT32;
const
  eErrorConcealmentTypeDrop          = eAVDecVideoH264ErrorConcealment(0);  // ERR_CONCEALMENT_TYPE_DROP
  eErrorConcealmentTypeBasic         = eAVDecVideoH264ErrorConcealment(1);  // ERR_CONCEALMENT_TYPE_BASIC  (the default, and good mode used most of the time)
  eErrorConcealmentTypeAdvanced      = eAVDecVideoH264ErrorConcealment(2);  // ERR_CONCEALMENT_TYPE_ADVANCED
  eErrorConcealmentTypeDXVASetBlack  = eAVDecVideoH264ErrorConcealment(3);  // ERR_CONCEALMENT_TYPE_DXVA_SET_BLACK


type
  PeAVDecVideoMPEG2ErrorConcealment = ^eAVDecVideoMPEG2ErrorConcealment;
  eAVDecVideoMPEG2ErrorConcealment = UINT32;
const
  eErrorConcealmentOff          = eAVDecVideoMPEG2ErrorConcealment(0);   //
  eErrorConcealmentOn           = eAVDecVideoMPEG2ErrorConcealment(1);   //  the default and good mode used most of the time


type
  PeAVDecVideoCodecType = ^eAVDecVideoCodecType;
  eAVDecVideoCodecType = UINT32;
const
  eAVDecVideoCodecType_NOTPLAYING   = eAVDecVideoCodecType(0);
  eAVDecVideoCodecType_MPEG2        = eAVDecVideoCodecType(1);
  eAVDecVideoCodecType_H264         = eAVDecVideoCodecType(2);


type
  PeAVDecVideoDXVAMode = ^eAVDecVideoDXVAMode;
  eAVDecVideoDXVAMode = UINT32;
const
  eAVDecVideoDXVAMode_NOTPLAYING = eAVDecVideoDXVAMode(0);
  eAVDecVideoDXVAMode_SW     = eAVDecVideoDXVAMode(1);
  eAVDecVideoDXVAMode_MC     = eAVDecVideoDXVAMode(2);
  eAVDecVideoDXVAMode_IDCT   = eAVDecVideoDXVAMode(3);
  eAVDecVideoDXVAMode_VLD    = eAVDecVideoDXVAMode(4);


type
  PeAVDecVideoDXVABusEncryption = ^eAVDecVideoDXVABusEncryption;
  eAVDecVideoDXVABusEncryption = UINT32;
const
  eAVDecVideoDXVABusEncryption_NONE     = eAVDecVideoDXVABusEncryption(0);
  eAVDecVideoDXVABusEncryption_PRIVATE  = eAVDecVideoDXVABusEncryption(1);
  eAVDecVideoDXVABusEncryption_AES      = eAVDecVideoDXVABusEncryption(2);


type
  PeAVEncVideoSourceScanType = ^eAVEncVideoSourceScanType;
  eAVEncVideoSourceScanType = UINT32;
const
  eAVEncVideoSourceScan_Automatic         = eAVEncVideoSourceScanType(0);
  eAVEncVideoSourceScan_Interlaced        = eAVEncVideoSourceScanType(1);
  eAVEncVideoSourceScan_Progressive       = eAVEncVideoSourceScanType(2);


type
  PeAVEncVideoOutputScanType = ^eAVEncVideoOutputScanType;
  eAVEncVideoOutputScanType = UINT32;
const
  eAVEncVideoOutputScan_Progressive       = eAVEncVideoOutputScanType(0);
  eAVEncVideoOutputScan_Interlaced        = eAVEncVideoOutputScanType(1);
  eAVEncVideoOutputScan_SameAsInput       = eAVEncVideoOutputScanType(2);
  eAVEncVideoOutputScan_Automatic         = eAVEncVideoOutputScanType(3);


type
  PeAVEncVideoFilmContent = ^eAVEncVideoFilmContent;
  eAVEncVideoFilmContent = UINT32;
const
  eAVEncVideoFilmContent_VideoOnly = eAVEncVideoFilmContent(0);
  eAVEncVideoFilmContent_FilmOnly  = eAVEncVideoFilmContent(1);
  eAVEncVideoFilmContent_Mixed     = eAVEncVideoFilmContent(2);


type
  PeAVEncVideoChromaResolution = ^eAVEncVideoChromaResolution;
  eAVEncVideoChromaResolution = UINT32;
const
  eAVEncVideoChromaResolution_SameAsSource = eAVEncVideoChromaResolution(0);
  eAVEncVideoChromaResolution_444          = eAVEncVideoChromaResolution(1);
  eAVEncVideoChromaResolution_422          = eAVEncVideoChromaResolution(2);
  eAVEncVideoChromaResolution_420          = eAVEncVideoChromaResolution(3);
  eAVEncVideoChromaResolution_411          = eAVEncVideoChromaResolution(4);


type
  PeAVEncVideoChromaSubsampling = ^eAVEncVideoChromaSubsampling;
  eAVEncVideoChromaSubsampling = UINT32;
const
  eAVEncVideoChromaSubsamplingFormat_SameAsSource                   = eAVEncVideoChromaSubsampling($0);
  eAVEncVideoChromaSubsamplingFormat_ProgressiveChroma              = eAVEncVideoChromaSubsampling($8);
  eAVEncVideoChromaSubsamplingFormat_Horizontally_Cosited           = eAVEncVideoChromaSubsampling($4);
  eAVEncVideoChromaSubsamplingFormat_Vertically_Cosited             = eAVEncVideoChromaSubsampling($2);
  eAVEncVideoChromaSubsamplingFormat_Vertically_AlignedChromaPlanes = eAVEncVideoChromaSubsampling($1);


type
  PeAVEncVideoColorPrimaries = ^eAVEncVideoColorPrimaries;
  eAVEncVideoColorPrimaries = UINT32;
const
  eAVEncVideoColorPrimaries_SameAsSource  = eAVEncVideoColorPrimaries(0);
  eAVEncVideoColorPrimaries_Reserved      = eAVEncVideoColorPrimaries(1);
  eAVEncVideoColorPrimaries_BT709         = eAVEncVideoColorPrimaries(2);
  eAVEncVideoColorPrimaries_BT470_2_SysM  = eAVEncVideoColorPrimaries(3);
  eAVEncVideoColorPrimaries_BT470_2_SysBG = eAVEncVideoColorPrimaries(4);
  eAVEncVideoColorPrimaries_SMPTE170M     = eAVEncVideoColorPrimaries(5);
  eAVEncVideoColorPrimaries_SMPTE240M     = eAVEncVideoColorPrimaries(6);
  eAVEncVideoColorPrimaries_EBU3231       = eAVEncVideoColorPrimaries(7);
  eAVEncVideoColorPrimaries_SMPTE_C       = eAVEncVideoColorPrimaries(8);


type
  PeAVEncVideoColorTransferFunction = ^eAVEncVideoColorTransferFunction;
  eAVEncVideoColorTransferFunction = UINT32;
const
  eAVEncVideoColorTransferFunction_SameAsSource = eAVEncVideoColorTransferFunction(0);
  eAVEncVideoColorTransferFunction_10           = eAVEncVideoColorTransferFunction(1);  // (Linear); scRGB)
  eAVEncVideoColorTransferFunction_18           = eAVEncVideoColorTransferFunction(2);
  eAVEncVideoColorTransferFunction_20           = eAVEncVideoColorTransferFunction(3);
  eAVEncVideoColorTransferFunction_22           = eAVEncVideoColorTransferFunction(4);  // (BT470-2 SysM)
  eAVEncVideoColorTransferFunction_22_709       = eAVEncVideoColorTransferFunction(5);  // (BT709);  SMPTE296M); SMPTE170M); BT470); SMPTE274M); BT.1361)
  eAVEncVideoColorTransferFunction_22_240M      = eAVEncVideoColorTransferFunction(6);  // (SMPTE240M); interim 274M)
  eAVEncVideoColorTransferFunction_22_8bit_sRGB = eAVEncVideoColorTransferFunction(7);  // (sRGB)
  eAVEncVideoColorTransferFunction_28           = eAVEncVideoColorTransferFunction(8);


type
  PeAVEncVideoColorTransferMatrix = ^eAVEncVideoColorTransferMatrix;
  eAVEncVideoColorTransferMatrix = UINT32;
const
  eAVEncVideoColorTransferMatrix_SameAsSource = eAVEncVideoColorTransferMatrix(0);
  eAVEncVideoColorTransferMatrix_BT709        = eAVEncVideoColorTransferMatrix(1);
  eAVEncVideoColorTransferMatrix_BT601        = eAVEncVideoColorTransferMatrix(2);  // (601, BT470-2 B,B, 170M)
  eAVEncVideoColorTransferMatrix_SMPTE240M    = eAVEncVideoColorTransferMatrix(3);


type
  PeAVEncVideoColorLighting = ^eAVEncVideoColorLighting;
  eAVEncVideoColorLighting = UINT32;
const
  eAVEncVideoColorLighting_SameAsSource = eAVEncVideoColorLighting(0);
  eAVEncVideoColorLighting_Unknown      = eAVEncVideoColorLighting(1);
  eAVEncVideoColorLighting_Bright       = eAVEncVideoColorLighting(2);
  eAVEncVideoColorLighting_Office       = eAVEncVideoColorLighting(3);
  eAVEncVideoColorLighting_Dim          = eAVEncVideoColorLighting(4);
  eAVEncVideoColorLighting_Dark         = eAVEncVideoColorLighting(5);


type
  PeAVEncVideoColorNominalRange = ^eAVEncVideoColorNominalRange;
  eAVEncVideoColorNominalRange = UINT32;
const
  eAVEncVideoColorNominalRange_SameAsSource = eAVEncVideoColorNominalRange(0);
  eAVEncVideoColorNominalRange_0_255        = eAVEncVideoColorNominalRange(1); // (8 bit: 0..255, 10 bit: 0..1023)
  eAVEncVideoColorNominalRange_16_235       = eAVEncVideoColorNominalRange(2); // (16..235, 64..940 (16*4...235*4)
  eAVEncVideoColorNominalRange_48_208       = eAVEncVideoColorNominalRange(3); // (48..208)


type
  PeAVEncInputVideoSystem = ^eAVEncInputVideoSystem;
  eAVEncInputVideoSystem = UINT32;
const
  eAVEncInputVideoSystem_Unspecified = eAVEncInputVideoSystem(0);
  eAVEncInputVideoSystem_PAL         = eAVEncInputVideoSystem(1);
  eAVEncInputVideoSystem_NTSC        = eAVEncInputVideoSystem(2);
  eAVEncInputVideoSystem_SECAM       = eAVEncInputVideoSystem(3);
  eAVEncInputVideoSystem_MAC         = eAVEncInputVideoSystem(4);
  eAVEncInputVideoSystem_HDV         = eAVEncInputVideoSystem(5);
  eAVEncInputVideoSystem_Component   = eAVEncInputVideoSystem(6);


type
  PeAVEncVideoContentType = ^eAVEncVideoContentType;
  eAVEncVideoContentType = UINT32;
const
  eAVEncVideoContentType_Unknown          = eAVEncVideoContentType(0);
  eAVEncVideoContentType_FixedCameraAngle = eAVEncVideoContentType(1);


type
  PeAVEncAdaptiveMode = ^eAVEncAdaptiveMode;
  eAVEncAdaptiveMode = UINT32;
const
  eAVEncAdaptiveMode_None         = eAVEncAdaptiveMode(0);
  eAVEncAdaptiveMode_Resolution   = eAVEncAdaptiveMode(1);
  eAVEncAdaptiveMode_FrameRate    = eAVEncAdaptiveMode(2);


type
  PeAVScenarioInfo = ^eAVScenarioInfo;
  eAVScenarioInfo = UINT32;
const
  eAVScenarioInfo_Unknown                       = eAVScenarioInfo(0);
  eAVScenarioInfo_DisplayRemoting               = eAVScenarioInfo(1);
  eAVScenarioInfo_VideoConference               = eAVScenarioInfo(2);
  eAVScenarioInfo_Archive                       = eAVScenarioInfo(3);
  eAVScenarioInfo_LiveStreaming                 = eAVScenarioInfo(4);
  eAVScenarioInfo_CameraRecord                  = eAVScenarioInfo(5);
  eAVScenarioInfo_DisplayRemotingWithFeatureMap = eAVScenarioInfo(6);


type
  PeVideoEncoderDisplayContentType = ^eVideoEncoderDisplayContentType;
  eVideoEncoderDisplayContentType = UINT32;
const
  eVideoEncoderDisplayContent_Unknown         = eVideoEncoderDisplayContentType(0);
  eVideoEncoderDisplayContent_FullScreenVideo = eVideoEncoderDisplayContentType(1);



  //
  // Audio/Video Mux
  //

type
  PeAVEncMuxOutput = ^eAVEncMuxOutput;
  eAVEncMuxOutput = UINT32;
const
  eAVEncMuxOutputAuto = eAVEncMuxOutput(0);    // Decision is made automatically be the mux (elementary stream, program stream or transport stream)
  eAVEncMuxOutputPS   = eAVEncMuxOutput(1);    // Program stream
  eAVEncMuxOutputTS   = eAVEncMuxOutput(2);    // Transport stream


type
  PeAVEncAudioDualMono = ^eAVEncAudioDualMono;
  eAVEncAudioDualMono = UINT32;
const
  eAVEncAudioDualMono_SameAsInput = eAVEncAudioDualMono(0);    // As indicated by input media type
  eAVEncAudioDualMono_Off         = eAVEncAudioDualMono(1);    // 2-ch output bitstream should not be dual mono
  eAVEncAudioDualMono_On          = eAVEncAudioDualMono(2);    // 2-ch output bitstream should be dual mono


type
  PeAVEncAudioInputContent = ^eAVEncAudioInputContent;
  eAVEncAudioInputContent = UINT32;
const
  AVEncAudioInputContent_Unknown = eAVEncAudioInputContent(0);
  AVEncAudioInputContent_Voice   = eAVEncAudioInputContent(1);
  AVEncAudioInputContent_Music   = eAVEncAudioInputContent(2);


type
  PeAVEncMPVProfile = ^eAVEncMPVProfile;
  eAVEncMPVProfile = UINT32;
const
  eAVEncMPVProfile_unknown = eAVEncMPVProfile(0);
  eAVEncMPVProfile_Simple  = eAVEncMPVProfile(1);
  eAVEncMPVProfile_Main    = eAVEncMPVProfile(2);
  eAVEncMPVProfile_High    = eAVEncMPVProfile(3);
  eAVEncMPVProfile_422     = eAVEncMPVProfile(4);


type
  PeAVEncMPVLevel = ^eAVEncMPVLevel;
  eAVEncMPVLevel = UINT32;
const
  eAVEncMPVLevel_Low      = eAVEncMPVLevel(1);
  eAVEncMPVLevel_Main     = eAVEncMPVLevel(2);
  eAVEncMPVLevel_High1440 = eAVEncMPVLevel(3);
  eAVEncMPVLevel_High     = eAVEncMPVLevel(4);


type
  PeAVEncH263VProfile = ^eAVEncH263VProfile;
  eAVEncH263VProfile = UINT32;
const
  eAVEncH263VProfile_Base            = eAVEncH263VProfile(0);
  eAVEncH263VProfile_CompatibilityV2 = eAVEncH263VProfile(1);
  eAVEncH263VProfile_CompatibilityV1 = eAVEncH263VProfile(2);
  eAVEncH263VProfile_WirelessV2      = eAVEncH263VProfile(3);
  eAVEncH263VProfile_WirelessV3      = eAVEncH263VProfile(4);
  eAVEncH263VProfile_HighCompression = eAVEncH263VProfile(5);
  eAVEncH263VProfile_Internet        = eAVEncH263VProfile(6);
  eAVEncH263VProfile_Interlace       = eAVEncH263VProfile(7);
  eAVEncH263VProfile_HighLatency     = eAVEncH263VProfile(8);


type
  PeAVEncH264VProfile = ^eAVEncH264VProfile;
  eAVEncH264VProfile = UINT32;
const
  eAVEncH264VProfile_unknown                   = eAVEncH264VProfile(0);
  eAVEncH264VProfile_Simple                    = eAVEncH264VProfile(66);
  eAVEncH264VProfile_Base                      = eAVEncH264VProfile(66);
  eAVEncH264VProfile_Main                      = eAVEncH264VProfile(77);
  eAVEncH264VProfile_High                      = eAVEncH264VProfile(100);
  eAVEncH264VProfile_422                       = eAVEncH264VProfile(122);
  eAVEncH264VProfile_High10                    = eAVEncH264VProfile(110);
  eAVEncH264VProfile_444                       = eAVEncH264VProfile(244);
  eAVEncH264VProfile_Extended                  = eAVEncH264VProfile(88);
  // UVC 1.2 H.264 extension
  eAVEncH264VProfile_ScalableBase              = eAVEncH264VProfile(83);
  eAVEncH264VProfile_ScalableHigh              = eAVEncH264VProfile(86);
  eAVEncH264VProfile_MultiviewHigh             = eAVEncH264VProfile(118);
  eAVEncH264VProfile_StereoHigh                = eAVEncH264VProfile(128);
  eAVEncH264VProfile_ConstrainedBase           = eAVEncH264VProfile(256);
  eAVEncH264VProfile_UCConstrainedHigh         = eAVEncH264VProfile(257);
  eAVEncH264VProfile_UCScalableConstrainedBase = eAVEncH264VProfile(258);
  eAVEncH264VProfile_UCScalableConstrainedHigh = eAVEncH264VProfile(259);

  eAVEncH264VProfile_ConstrainedHigh = eAVEncH264VProfile_UCConstrainedHigh;


type
  //H.265/HEVC
  PeAVEncH265VProfile = ^eAVEncH265VProfile;
  eAVEncH265VProfile = UINT32;
const
  eAVEncH265VProfile_unknown           = eAVEncH265VProfile(0);
  eAVEncH265VProfile_Main_420_8        = eAVEncH265VProfile(1);
  eAVEncH265VProfile_Main_420_10       = eAVEncH265VProfile(2);
  eAVEncH265VProfile_Main_420_12       = eAVEncH265VProfile(3);
  eAVEncH265VProfile_Main_422_10       = eAVEncH265VProfile(4);
  eAVEncH265VProfile_Main_422_12       = eAVEncH265VProfile(5);
  eAVEncH265VProfile_Main_444_8        = eAVEncH265VProfile(6);
  eAVEncH265VProfile_Main_444_10       = eAVEncH265VProfile(7);
  eAVEncH265VProfile_Main_444_12       = eAVEncH265VProfile(8);
  eAVEncH265VProfile_Monochrome_12     = eAVEncH265VProfile(9);
  eAVEncH265VProfile_Monochrome_16     = eAVEncH265VProfile(10);
  eAVEncH265VProfile_MainIntra_420_8   = eAVEncH265VProfile(11);
  eAVEncH265VProfile_MainIntra_420_10  = eAVEncH265VProfile(12);
  eAVEncH265VProfile_MainIntra_420_12  = eAVEncH265VProfile(13);
  eAVEncH265VProfile_MainIntra_422_10  = eAVEncH265VProfile(14);
  eAVEncH265VProfile_MainIntra_422_12  = eAVEncH265VProfile(15);
  eAVEncH265VProfile_MainIntra_444_8   = eAVEncH265VProfile(16);
  eAVEncH265VProfile_MainIntra_444_10  = eAVEncH265VProfile(17);
  eAVEncH265VProfile_MainIntra_444_12  = eAVEncH265VProfile(18);
  eAVEncH265VProfile_MainIntra_444_16  = eAVEncH265VProfile(19);
  eAVEncH265VProfile_MainStill_420_8   = eAVEncH265VProfile(20);
  eAVEncH265VProfile_MainStill_444_8   = eAVEncH265VProfile(21);
  eAVEncH265VProfile_MainStill_444_16  = eAVEncH265VProfile(22);


type
  PeAVEncVP9VProfile = ^eAVEncVP9VProfile;
  eAVEncVP9VProfile = UINT32;
const
  eAVEncVP9VProfile_unknown  = eAVEncVP9VProfile(0);
  eAVEncVP9VProfile_420_8    = eAVEncVP9VProfile(1);
  eAVEncVP9VProfile_420_10   = eAVEncVP9VProfile(2);
  eAVEncVP9VProfile_420_12   = eAVEncVP9VProfile(3);



type
  PeAVEncAV1VProfile = ^eAVEncAV1VProfile;
  eAVEncAV1VProfile = UINT32;

const
  eAVEncAV1VProfile_unknown               = eAVEncAV1VProfile(0);
  eAVEncAV1VProfile_Main_420_8            = eAVEncAV1VProfile(1);
  eAVEncAV1VProfile_Main_420_10           = eAVEncAV1VProfile(2);
  eAVEncAV1VProfile_Main_400_8            = eAVEncAV1VProfile(3);
  eAVEncAV1VProfile_Main_400_10           = eAVEncAV1VProfile(4);
  eAVEncAV1VProfile_High_444_8            = eAVEncAV1VProfile(5);
  eAVEncAV1VProfile_High_444_10           = eAVEncAV1VProfile(6);
  eAVEncAV1VProfile_Professional_420_12   = eAVEncAV1VProfile(7);
  eAVEncAV1VProfile_Professional_400_12   = eAVEncAV1VProfile(8);
  eAVEncAV1VProfile_Professional_444_12   = eAVEncAV1VProfile(9);
  eAVEncAV1VProfile_Professional_422_8    = eAVEncAV1VProfile(10);
  eAVEncAV1VProfile_Professional_422_10   = eAVEncAV1VProfile(11);
  eAVEncAV1VProfile_Professional_422_12   = eAVEncAV1VProfile(12);


type
  PeAVEncH263PictureType = ^eAVEncH263PictureType;
  eAVEncH263PictureType = UINT32;
const
  eAVEncH263PictureType_I = eAVEncH263PictureType(0);
  eAVEncH263PictureType_P = eAVEncH263PictureType(1);
  eAVEncH263PictureType_B = eAVEncH263PictureType(2);


type
  PeAVEncH264PictureType = ^eAVEncH264PictureType;
  eAVEncH264PictureType = UINT32;
const
  eAVEncH264PictureType_IDR = eAVEncH264PictureType(0);
  eAVEncH264PictureType_P   = eAVEncH264PictureType(1);
  eAVEncH264PictureType_B   = eAVEncH264PictureType(2);


type
  PeAVEncAV1PictureType = ^eAVEncAV1PictureType;
  eAVEncAV1PictureType = UINT32;
const
  eAVEncAV1PictureType_Key         = eAVEncAV1PictureType(0);
  eAVEncAV1PictureType_Intra_Only  = eAVEncAV1PictureType(1);
  eAVEncAV1PictureType_Inter       = eAVEncAV1PictureType(2);
  eAVEncAV1PictureType_Switch      = eAVEncAV1PictureType(3);


type
  PeAVEncH264VLevel = ^eAVEncH264VLevel;
  eAVEncH264VLevel = UINT32;
const
  eAVEncH264VLevel1         = eAVEncH264VLevel(10);
  eAVEncH264VLevel1_b       = eAVEncH264VLevel(11);
  eAVEncH264VLevel1_1       = eAVEncH264VLevel(11);
  eAVEncH264VLevel1_2       = eAVEncH264VLevel(12);
  eAVEncH264VLevel1_3       = eAVEncH264VLevel(13);
  eAVEncH264VLevel2         = eAVEncH264VLevel(20);
  eAVEncH264VLevel2_1       = eAVEncH264VLevel(21);
  eAVEncH264VLevel2_2       = eAVEncH264VLevel(22);
  eAVEncH264VLevel3         = eAVEncH264VLevel(30);
  eAVEncH264VLevel3_1       = eAVEncH264VLevel(31);
  eAVEncH264VLevel3_2       = eAVEncH264VLevel(32);
  eAVEncH264VLevel4         = eAVEncH264VLevel(40);
  eAVEncH264VLevel4_1       = eAVEncH264VLevel(41);
  eAVEncH264VLevel4_2       = eAVEncH264VLevel(42);
  eAVEncH264VLevel5         = eAVEncH264VLevel(50);
  eAVEncH264VLevel5_1       = eAVEncH264VLevel(51);
  eAVEncH264VLevel5_2       = eAVEncH264VLevel(52);
  eAVEncH264VLevel6         = eAVEncH264VLevel(60);
  eAVEncH264VLevel6_1       = eAVEncH264VLevel(61);
  eAVEncH264VLevel6_2       = eAVEncH264VLevel(62);


type
  PeAVEncH265VLevel = ^eAVEncH265VLevel;
  eAVEncH265VLevel = UINT32;
const
  eAVEncH265VLevel1        = eAVEncH265VLevel(30);
  eAVEncH265VLevel2        = eAVEncH265VLevel(60);
  eAVEncH265VLevel2_1      = eAVEncH265VLevel(63);
  eAVEncH265VLevel3        = eAVEncH265VLevel(90);
  eAVEncH265VLevel3_1      = eAVEncH265VLevel(93);
  eAVEncH265VLevel4        = eAVEncH265VLevel(120);
  eAVEncH265VLevel4_1      = eAVEncH265VLevel(123);
  eAVEncH265VLevel5        = eAVEncH265VLevel(150);
  eAVEncH265VLevel5_1      = eAVEncH265VLevel(153);
  eAVEncH265VLevel5_2      = eAVEncH265VLevel(156);
  eAVEncH265VLevel6        = eAVEncH265VLevel(180);
  eAVEncH265VLevel6_1      = eAVEncH265VLevel(183);
  eAVEncH265VLevel6_2      = eAVEncH265VLevel(186);


type
  PeAVEncAV1VLevel = ^eAVEncAV1VLevel;
  eAVEncAV1VLevel = UINT32;
const
  eAVEncAV1VLevel2        = eAVEncAV1VLevel(0);
  eAVEncAV1VLevel2_1      = eAVEncAV1VLevel(1);
  eAVEncAV1VLevel3        = eAVEncAV1VLevel(4);
  eAVEncAV1VLevel3_1      = eAVEncAV1VLevel(5);
  eAVEncAV1VLevel4        = eAVEncAV1VLevel(8);
  eAVEncAV1VLevel4_1      = eAVEncAV1VLevel(9);
  eAVEncAV1VLevel5        = eAVEncAV1VLevel(12);
  eAVEncAV1VLevel5_1      = eAVEncAV1VLevel(13);
  eAVEncAV1VLevel5_2      = eAVEncAV1VLevel(14);
  eAVEncAV1VLevel5_3      = eAVEncAV1VLevel(15);
  eAVEncAV1VLevel6        = eAVEncAV1VLevel(16);
  eAVEncAV1VLevel6_1      = eAVEncAV1VLevel(17);
  eAVEncAV1VLevel6_2      = eAVEncAV1VLevel(18);
  eAVEncAV1VLevel6_3      = eAVEncAV1VLevel(19);



type
  // AVEncMPVFrameFieldMode (UINT32)
  PeAVEncMPVFrameFieldMode = ^eAVEncMPVFrameFieldMode;
  eAVEncMPVFrameFieldMode = UINT32;
const
  eAVEncMPVFrameFieldMode_FieldMode = eAVEncMPVFrameFieldMode(0);
  eAVEncMPVFrameFieldMode_FrameMode = eAVEncMPVFrameFieldMode(1);


  //
  // Advanced MPV Encoder Specific Parameters
  //

type
  PeAVEncMPVSceneDetection = ^eAVEncMPVSceneDetection;
  eAVEncMPVSceneDetection = UINT32;
const
  eAVEncMPVSceneDetection_None                 = eAVEncMPVSceneDetection(0);
  eAVEncMPVSceneDetection_InsertIPicture       = eAVEncMPVSceneDetection(1);
  eAVEncMPVSceneDetection_StartNewGOP          = eAVEncMPVSceneDetection(2);
  eAVEncMPVSceneDetection_StartNewLocatableGOP = eAVEncMPVSceneDetection(3);


type
  PeAVEncMPVScanPattern = ^eAVEncMPVScanPattern;
  eAVEncMPVScanPattern = UINT32;
const
  eAVEncMPVScanPattern_Auto          = eAVEncMPVScanPattern(0);
  eAVEncMPVScanPattern_ZigZagScan    = eAVEncMPVScanPattern(1);
  eAVEncMPVScanPattern_AlternateScan = eAVEncMPVScanPattern(2);


type
  PeAVEncMPVQScaleType = ^eAVEncMPVQScaleType;
  eAVEncMPVQScaleType = UINT32;
const
  eAVEncMPVQScaleType_Auto      = eAVEncMPVQScaleType(0);
  eAVEncMPVQScaleType_Linear    = eAVEncMPVQScaleType(1);
  eAVEncMPVQScaleType_NonLinear = eAVEncMPVQScaleType(2);


type
  PeAVEncMPVIntraVLCTable = ^eAVEncMPVIntraVLCTable;
  eAVEncMPVIntraVLCTable = UINT32;
const
  eAVEncMPVIntraVLCTable_Auto      = eAVEncMPVIntraVLCTable(0);
  eAVEncMPVIntraVLCTable_MPEG1     = eAVEncMPVIntraVLCTable(1);
  eAVEncMPVIntraVLCTable_Alternate = eAVEncMPVIntraVLCTable(2);


  //
  // MPEG1 Audio Encoding Interface
  //

  //
  // MPEG1 Audio Specific Parameters
  //

type
  PeAVEncMPALayer = ^eAVEncMPALayer;
  eAVEncMPALayer = UINT32;
const
  eAVEncMPALayer_1 = eAVEncMPALayer(1);
  eAVEncMPALayer_2 = eAVEncMPALayer(2);
  eAVEncMPALayer_3 = eAVEncMPALayer(3);


type
  PeAVEncMPACodingMode = ^eAVEncMPACodingMode;
  eAVEncMPACodingMode = UINT32;
const
  eAVEncMPACodingMode_Mono        = eAVEncMPACodingMode(0);
  eAVEncMPACodingMode_Stereo      = eAVEncMPACodingMode(1);
  eAVEncMPACodingMode_DualChannel = eAVEncMPACodingMode(2);
  eAVEncMPACodingMode_JointStereo = eAVEncMPACodingMode(3);
  eAVEncMPACodingMode_Surround    = eAVEncMPACodingMode(4);


type
  PeAVEncMPAEmphasisType = ^eAVEncMPAEmphasisType;
  eAVEncMPAEmphasisType = UINT32;
const
  eAVEncMPAEmphasisType_None        = eAVEncMPAEmphasisType(0);
  eAVEncMPAEmphasisType_50_15       = eAVEncMPAEmphasisType(1);
  eAVEncMPAEmphasisType_Reserved    = eAVEncMPAEmphasisType(2);
  eAVEncMPAEmphasisType_CCITT_J17   = eAVEncMPAEmphasisType(3);


  //
  // Dolby Digital(TM) Audio Encoding Interface
  //

  //
  // Dolby Digital(TM) Audio Specific Parameters
  //
type
  PeAVEncDDService = ^eAVEncDDService;
  eAVEncDDService = UINT32;
const
  eAVEncDDService_CM = eAVEncDDService(0);   // (Main Service: Complete Main)
  eAVEncDDService_ME = eAVEncDDService(1);   // (Main Service: Music and Effects (ME))
  eAVEncDDService_VI = eAVEncDDService(2);   // (Associated Service: Visually-Impaired (VI)
  eAVEncDDService_HI = eAVEncDDService(3);   // (Associated Service: Hearing-Impaired (HI))
  eAVEncDDService_D  = eAVEncDDService(4);   // (Associated Service: Dialog (D))
  eAVEncDDService_C  = eAVEncDDService(5);   // (Associated Service: Commentary (C))
  eAVEncDDService_E  = eAVEncDDService(6);   // (Associated Service: Emergency (E))
  eAVEncDDService_VO = eAVEncDDService(7);   // (Associated Service: Voice Over (VO) / Karaoke)

type
  PeAVEncDDProductionRoomType = ^eAVEncDDProductionRoomType;
  eAVEncDDProductionRoomType = UINT32;
const
  eAVEncDDProductionRoomType_NotIndicated = eAVEncDDProductionRoomType(0);
  eAVEncDDProductionRoomType_Large        = eAVEncDDProductionRoomType(1);
  eAVEncDDProductionRoomType_Small        = eAVEncDDProductionRoomType(2);


type
  PeAVEncDDDynamicRangeCompressionControl = ^eAVEncDDDynamicRangeCompressionControl;
  eAVEncDDDynamicRangeCompressionControl = UINT32;
const
  eAVEncDDDynamicRangeCompressionControl_None          = eAVEncDDDynamicRangeCompressionControl(0);
  eAVEncDDDynamicRangeCompressionControl_FilmStandard  = eAVEncDDDynamicRangeCompressionControl(1);
  eAVEncDDDynamicRangeCompressionControl_FilmLight     = eAVEncDDDynamicRangeCompressionControl(2);
  eAVEncDDDynamicRangeCompressionControl_MusicStandard = eAVEncDDDynamicRangeCompressionControl(3);
  eAVEncDDDynamicRangeCompressionControl_MusicLight    = eAVEncDDDynamicRangeCompressionControl(4);
  eAVEncDDDynamicRangeCompressionControl_Speech        = eAVEncDDDynamicRangeCompressionControl(5);


type
  PeAVEncDDSurroundExMode = ^eAVEncDDSurroundExMode;
  eAVEncDDSurroundExMode = UINT32;
const
  eAVEncDDSurroundExMode_NotIndicated = eAVEncDDSurroundExMode(0);
  eAVEncDDSurroundExMode_No           = eAVEncDDSurroundExMode(1);
  eAVEncDDSurroundExMode_Yes          = eAVEncDDSurroundExMode(2);


type
  PeAVEncDDPreferredStereoDownMixMode = ^eAVEncDDPreferredStereoDownMixMode;
  eAVEncDDPreferredStereoDownMixMode = UINT32;
const
  eAVEncDDPreferredStereoDownMixMode_LtRt = eAVEncDDPreferredStereoDownMixMode(0);
  eAVEncDDPreferredStereoDownMixMode_LoRo = eAVEncDDPreferredStereoDownMixMode(1);


type
  PeAVEncDDAtoDConverterType = ^eAVEncDDAtoDConverterType;
  eAVEncDDAtoDConverterType = UINT32;
const
  eAVEncDDAtoDConverterType_Standard = eAVEncDDAtoDConverterType(0);
  eAVEncDDAtoDConverterType_HDCD     = eAVEncDDAtoDConverterType(1);


type
  PeAVEncDDHeadphoneMode = ^eAVEncDDHeadphoneMode;
  eAVEncDDHeadphoneMode = UINT32;
const
  eAVEncDDHeadphoneMode_NotIndicated = eAVEncDDHeadphoneMode(0);
  eAVEncDDHeadphoneMode_NotEncoded   = eAVEncDDHeadphoneMode(1);
  eAVEncDDHeadphoneMode_Encoded      = eAVEncDDHeadphoneMode(2);

  //
  // WMV Video Encoding Interface
  //

  //
  // WMV Video Specific Parameters
  //

type
  PeAVDecVideoInputScanType = ^eAVDecVideoInputScanType;
  eAVDecVideoInputScanType = UINT32;
const
  eAVDecVideoInputScan_Unknown                    = eAVDecVideoInputScanType(0);
  eAVDecVideoInputScan_Progressive                = eAVDecVideoInputScanType(1);
  eAVDecVideoInputScan_Interlaced_UpperFieldFirst = eAVDecVideoInputScanType(2);
  eAVDecVideoInputScan_Interlaced_LowerFieldFirst = eAVDecVideoInputScanType(3);


type
  PeAVDecVideoSWPowerLevel = ^eAVDecVideoSWPowerLevel;
  eAVDecVideoSWPowerLevel = UINT32;
const
  eAVDecVideoSWPowerLevel_BatteryLife  = eAVDecVideoSWPowerLevel(0);
  eAVDecVideoSWPowerLevel_Balanced     = eAVDecVideoSWPowerLevel(50);
  eAVDecVideoSWPowerLevel_VideoQuality = eAVDecVideoSWPowerLevel(100);


  //
  // Audio Decoder properties
  //

type
  PeAVDecAACDownmixMode = ^eAVDecAACDownmixMode;
  eAVDecAACDownmixMode = UINT32;
const
  eAVDecAACUseISODownmix  = eAVDecAACDownmixMode(0);
  eAVDecAACUseARIBDownmix = eAVDecAACDownmixMode(1);


type
  PeAVDecHEAACDynamicRangeControl = ^eAVDecHEAACDynamicRangeControl;
  eAVDecHEAACDynamicRangeControl = UINT32;
const
  eAVDecHEAACDynamicRangeControl_OFF  = eAVDecHEAACDynamicRangeControl(0);
  eAVDecHEAACDynamicRangeControl_ON   = eAVDecHEAACDynamicRangeControl(1);


type
  PeAVDecAudioDualMono = ^eAVDecAudioDualMono;
  eAVDecAudioDualMono = UINT32;
const
  eAVDecAudioDualMono_IsNotDualMono = eAVDecAudioDualMono(0);    // 2-ch bitstream input is not dual mono
  eAVDecAudioDualMono_IsDualMono    = eAVDecAudioDualMono(1);    // 2-ch bitstream input is dual mono
  eAVDecAudioDualMono_UnSpecified   = eAVDecAudioDualMono(2);    // There is no indication in the bitstream


type
  PeAVDecAudioDualMonoReproMode = ^eAVDecAudioDualMonoReproMode;
  eAVDecAudioDualMonoReproMode = UINT32;
const
  eAVDecAudioDualMonoReproMode_STEREO      = eAVDecAudioDualMonoReproMode(0);   // Ch1+Ch2 for mono output, (Ch1 left,     Ch2 right) for stereo output
  eAVDecAudioDualMonoReproMode_LEFT_MONO   = eAVDecAudioDualMonoReproMode(1);   // Ch1 for mono output,     (Ch1 left,     Ch1 right) for stereo output
  eAVDecAudioDualMonoReproMode_RIGHT_MONO  = eAVDecAudioDualMonoReproMode(2);   // Ch2 for mono output,     (Ch2 left,     Ch2 right) for stereo output
  eAVDecAudioDualMonoReproMode_MIX_MONO    = eAVDecAudioDualMonoReproMode(3);   // Ch1+Ch2 for mono output, (Ch1+Ch2 left, Ch1+Ch2 right) for stereo output


  //
  // Audio Common Properties
  //

  // Enumerated values for  AVAudioChannelConfig are identical
  // to the speaker positions defined in ksmedia.h and used
  // in WAVE_FORMAT_EXTENSIBLE. Configurations for 5.1 and
  // 7.1 channels should be identical to KSAUDIO_SPEAKER_5POINT1_SURROUND
  // and KSAUDIO_SPEAKER_7POINT1_SURROUND in ksmedia.h. This means:
  // 5.1 ch -> LOW_FREQUENCY | FRONT_LEFT | FRONT_RIGHT | FRONT_CENTER | SIDE_LEFT | SIDE_RIGHT
  // 7.1 ch -> LOW_FREQUENCY | FRONT_LEFT | FRONT_RIGHT | FRONT_CENTER | SIDE_LEFT | SIDE_RIGHT | BACK_LEFT | BACK_RIGHT
  //
type
  PeAVAudioChannelConfig = ^eAVAudioChannelConfig;
  eAVAudioChannelConfig = UINT32;
const
  eAVAudioChannelConfig_FRONT_LEFT    = eAVAudioChannelConfig($1);
  eAVAudioChannelConfig_FRONT_RIGHT   = eAVAudioChannelConfig($2);
  eAVAudioChannelConfig_FRONT_CENTER  = eAVAudioChannelConfig($4);
  eAVAudioChannelConfig_LOW_FREQUENCY = eAVAudioChannelConfig($8);  // aka LFE
  eAVAudioChannelConfig_BACK_LEFT     = eAVAudioChannelConfig($10);
  eAVAudioChannelConfig_BACK_RIGHT    = eAVAudioChannelConfig($20);
  eAVAudioChannelConfig_FRONT_LEFT_OF_CENTER  = eAVAudioChannelConfig($40);
  eAVAudioChannelConfig_FRONT_RIGHT_OF_CENTER = eAVAudioChannelConfig($80);
  eAVAudioChannelConfig_BACK_CENTER = eAVAudioChannelConfig($100);  // aka Mono Surround
  eAVAudioChannelConfig_SIDE_LEFT   = eAVAudioChannelConfig($200);  // aka Left Surround
  eAVAudioChannelConfig_SIDE_RIGHT  = eAVAudioChannelConfig($400);  // aka Right Surround
  eAVAudioChannelConfig_TOP_CENTER  = eAVAudioChannelConfig($800);
  eAVAudioChannelConfig_TOP_FRONT_LEFT   = eAVAudioChannelConfig($1000);
  eAVAudioChannelConfig_TOP_FRONT_CENTER = eAVAudioChannelConfig($2000);
  eAVAudioChannelConfig_TOP_FRONT_RIGHT  = eAVAudioChannelConfig($4000);
  eAVAudioChannelConfig_TOP_BACK_LEFT    = eAVAudioChannelConfig($8000);
  eAVAudioChannelConfig_TOP_BACK_CENTER  = eAVAudioChannelConfig($10000);
  eAVAudioChannelConfig_TOP_BACK_RIGHT   = eAVAudioChannelConfig($20000);


type
  PeAVDDSurroundMode = ^eAVDDSurroundMode;
  eAVDDSurroundMode = UINT32;
const
  eAVDDSurroundMode_NotIndicated = eAVDDSurroundMode(0);
  eAVDDSurroundMode_No           = eAVDDSurroundMode(1);
  eAVDDSurroundMode_Yes          = eAVDDSurroundMode(2);


type
  PeAVDecDDOperationalMode = ^eAVDecDDOperationalMode;
  eAVDecDDOperationalMode  = UINT32;
const
  eAVDecDDOperationalMode_NONE       = eAVDecDDOperationalMode(0);
  eAVDecDDOperationalMode_LINE       = eAVDecDDOperationalMode(1);    // Dialnorm enabled, dialogue at -31dBFS, dynrng used, high/low scaling allowed
  eAVDecDDOperationalMode_RF         = eAVDecDDOperationalMode(2);    // Dialnorm enabled, dialogue at -20dBFS, dynrng & compr used, high/low scaling NOT allowed (always fully compressed)
  eAVDecDDOperationalMode_CUSTOM0    = eAVDecDDOperationalMode(3);    // Analog dialnorm (dialogue normalization not part of the decoder)
  eAVDecDDOperationalMode_CUSTOM1    = eAVDecDDOperationalMode(4);    // Digital dialnorm (dialogue normalization is part of the decoder)
  eAVDecDDOperationalMode_PORTABLE8  = eAVDecDDOperationalMode(5);    // Dialnorm enabled, dialogue at -8dBFS, dynrng & compr used, high/low scaling NOT allowed (always fully compressed)
  eAVDecDDOperationalMode_PORTABLE11 = eAVDecDDOperationalMode(6);    // Dialnorm enabled, dialogue at -11dBFS, dynrng & compr used, high/low scaling NOT allowed (always fully compressed)
  eAVDecDDOperationalMode_PORTABLE14 = eAVDecDDOperationalMode(7);    // Dialnorm enabled, dialogue at -14dBFS, dynrng & compr used, high/low scaling NOT allowed (always fully compressed)
  { 10.0.28000.0  }
  eAVDecDDOperationalMode_PORTABLE16 = eAVDecDDOperationalMode(8);    // Dialnorm enabled, dialogue at -16dBFS, dynrng & compr used, high/low scaling NOT allowed (always fully compressed)


type
  PeAVDecDDMatrixDecodingMode = ^eAVDecDDMatrixDecodingMode;
  eAVDecDDMatrixDecodingMode = UINT32;
const
  eAVDecDDMatrixDecodingMode_OFF  = eAVDecDDMatrixDecodingMode(0);
  eAVDecDDMatrixDecodingMode_ON   = eAVDecDDMatrixDecodingMode(1);
  eAVDecDDMatrixDecodingMode_AUTO = eAVDecDDMatrixDecodingMode(2);


type
  PeAVDecDDStereoDownMixMode = ^eAVDecDDStereoDownMixMode;
  eAVDecDDStereoDownMixMode = UINT32;
const
  eAVDecDDStereoDownMixMode_Auto  = eAVDecDDStereoDownMixMode(0);   // Automatic detection
  eAVDecDDStereoDownMixMode_LtRt  = eAVDecDDStereoDownMixMode(1);   // Surround compatible (Lt/Rt)
  eAVDecDDStereoDownMixMode_LoRo  = eAVDecDDStereoDownMixMode(2);   // Stereo (Lo/Ro)


type
  PeAVDSPLoudnessEqualization = ^eAVDSPLoudnessEqualization;
  eAVDSPLoudnessEqualization = UINT32;
const
  eAVDSPLoudnessEqualization_OFF  = eAVDSPLoudnessEqualization(0);
  eAVDSPLoudnessEqualization_ON   = eAVDSPLoudnessEqualization(1);
  eAVDSPLoudnessEqualization_AUTO = eAVDSPLoudnessEqualization(2);


type
  PeAVDSPSpeakerFill = ^eAVDSPSpeakerFill;
  eAVDSPSpeakerFill = UINT32;
const
  eAVDSPSpeakerFill_OFF  = eAVDSPSpeakerFill(0);
  eAVDSPSpeakerFill_ON   = eAVDSPSpeakerFill(1);
  eAVDSPSpeakerFill_AUTO = eAVDSPSpeakerFill(2);


  // Additional Prototypes for ALL interfaces

  // End of Additional Prototypes

implementation

  //Implement Additional functions here.

end.
