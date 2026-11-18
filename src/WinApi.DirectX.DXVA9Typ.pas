// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: WinApi.DirectX - DirectX
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.DirectX.DXVA9Typ.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 28-07-2020
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: Direct3D include file.
//              https://docs.microsoft.com/en-us/windows/win32/medfound/directx-video-acceleration-2-0
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
// Source: dxva9typ.h
//
// Copyright (c) Microsoft Corporation. All rights reserved.
//==============================================================================
//
// FPC port updated: 2026-11-14
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
unit WinApi.DirectX.DXVA9Typ;

{$I MfPack.Fpc.inc}


interface

uses

  {WinApi}
  Windows,
  {DirectX}
  WinApi.DirectX.D3D9Types;

  {$PACKENUM 4}

  {$IFDEF WIN32}
    {$ALIGN 1}
  {$ELSE}
    {$ALIGN 8} // Win64
  {$ENDIF}


{$IFNDEF DIRECT3D_VERSION}
const
  DIRECT3D_VERSION = $0900;
{$ENDIF}  //DIRECT3D_VERSION


  function DXVABit(__x: DWord): DWord; inline;


  // -------------------------------------------------------------------------
  //
  // The definitions that follow describe the DirectX Video Acceleration
  // decoding interface.
  // This interface is accessable via the IAMVideoAccelerator interface.
  //
  // -------------------------------------------------------------------------
  //

{$IFNDEF __DIRECTX_VA_DECODER__}
{$DEFINE __DIRECTX_VA_DECODER__}

  // AYUV sample for 16-entry YUV palette or graphic surface

type

  LPDXVA_AYUVsample2 = ^_DXVA_AYUVsample2;
  _DXVA_AYUVsample2 = record
    bCrValue: Byte;
    bCbValue: Byte;
    bY_Value: Byte;
    bSampleAlpha8: Byte;
  end;
  DXVA_AYUVsample2 = _DXVA_AYUVsample2;
  PDXVA_AYUVsample2 = ^DXVA_AYUVsample2;

const
  DXVAp_ModeMPEG2_A  : TGUID = '{1b81be0A-a0c7-11d3-b984-00c04f2e73c5}';
  DXVAp_ModeMPEG2_C  : TGUID = '{1b81be0C-a0c7-11d3-b984-00c04f2e73c5}';
  DXVAp_NoEncrypt    : TGUID = '{1b81beD0-a0c7-11d3-b984-00c04f2e73c5}';

// #pragma pack(push, BeforeDXVApacking, 1)
{$Z1}
{$A1}

type

  LPDXVA_BufferDescription = ^_DXVA_BufferDescription;

  _DXVA_BufferDescription = record
    dwTypeIndex: DWORD;
    dwBufferIndex: DWORD;
    dwDataOffset: DWORD;
    dwDataSize: DWORD;
    dwFirstMBaddress: DWORD;
    dwNumMBsInBuffer: DWORD;
    dwWidth: DWORD;
    dwHeight: DWORD;
    dwStride: DWORD;
    dwReservedBits: DWORD;
  end;
  DXVA_BufferDescription = _DXVA_BufferDescription;
  PDXVA_BufferDescription = ^DXVA_BufferDescription;


  LPDXVA_ConfigQueryOrReplyFunc = ^DWORD;
  PDXVA_ConfigQueryOrReplyFunc = ^DWORD;
  DXVA_ConfigQueryOrReplyFunc = DWORD;


const

  DXVA_QUERYORREPLYFUNCFLAG_DECODER_PROBE_QUERY= $FFFFF1;
  DXVA_QUERYORREPLYFUNCFLAG_DECODER_LOCK_QUERY= $FFFFF5;
  DXVA_QUERYORREPLYFUNCFLAG_ACCEL_PROBE_OK_COPY= $FFFFF8;
  DXVA_QUERYORREPLYFUNCFLAG_ACCEL_PROBE_OK_PLUS= $FFFFF9;
  DXVA_QUERYORREPLYFUNCFLAG_ACCEL_LOCK_OK_COPY= $FFFFFC;
  DXVA_QUERYORREPLYFUNCFLAG_ACCEL_PROBE_FALSE_PLUS= $FFFFFB;
  DXVA_QUERYORREPLYFUNCFLAG_ACCEL_LOCK_FALSE_PLUS= $FFFFFF;

  DXVA_PICTURE_DECODE_BUFFER          = 1;
  DXVA_MACROBLOCK_CONTROL_BUFFER      = 2;
  DXVA_RESIDUAL_DIFFERENCE_BUFFER     = 3;
  DXVA_DEBLOCKING_CONTROL_BUFFER      = 4;
  DXVA_INVERSE_QUANTIZATION_MATRIX_BUFFER= 5;
  DXVA_SLICE_CONTROL_BUFFER           = 6;
  DXVA_BITSTREAM_DATA_BUFFER          = 7;
  DXVA_AYUV_BUFFER                    = 8;
  DXVA_IA44_SURFACE_BUFFER            = 9;
  DXVA_DPXD_SURFACE_BUFFER            = 10;
  DXVA_HIGHLIGHT_BUFFER               = 11;
  DXVA_DCCMD_SURFACE_BUFFER           = 12;
  DXVA_ALPHA_BLEND_COMBINATION_BUFFER = 13;
  DXVA_PICTURE_RESAMPLE_BUFFER        = 14;
  DXVA_READ_BACK_BUFFER               = 15;

type

  LPDXVA_ConfigPictureDecode = ^_DXVA_ConfigPictureDecode;

  _DXVA_ConfigPictureDecode = record
    // Operation Indicated
    dwFunction: DXVA_ConfigQueryOrReplyFunc;
    // Alignment
    dwReservedBits: array[0..2] of DWORD;
    // Encryption GUIDs
    guidConfigBitstreamEncryption: TGUID;
    guidConfigMBcontrolEncryption: TGUID;
    guidConfigResidDiffEncryption: TGUID;
    // Bitstream Processing Indicator
    bConfigBitstreamRaw: Byte;
    // Macroblock Control Config
    bConfigMBcontrolRasterOrder: Byte;
    // Host Resid Diff Config
    bConfigResidDiffHost: Byte;
    bConfigSpatialResid8: Byte;
    bConfigResid8Subtraction: Byte;
    bConfigSpatialHost8or9Clipping: Byte;
    bConfigSpatialResidInterleaved: Byte;
    bConfigIntraResidUnsigned: Byte;
    // Accelerator Resid Diff Config
    bConfigResidDiffAccelerator: Byte;
    bConfigHostInverseScan: Byte;
    bConfigSpecificIDCT: Byte;
    bConfig4GroupedCoefs: Byte;
  end;
  DXVA_ConfigPictureDecode = _DXVA_ConfigPictureDecode;
  PDXVA_ConfigPictureDecode = ^DXVA_ConfigPictureDecode;


  LPDXVA_PictureParameters = ^_DXVA_PictureParameters;

  _DXVA_PictureParameters = record
    wDecodedPictureIndex: WORD;
    wDeblockedPictureIndex: WORD;
    wForwardRefPictureIndex: WORD;
    wBackwardRefPictureIndex: WORD;
    wPicWidthInMBminus1: WORD;
    wPicHeightInMBminus1: WORD;
    bMacroblockWidthMinus1: Byte;
    bMacroblockHeightMinus1: Byte;
    bBlockWidthMinus1: Byte;
    bBlockHeightMinus1: Byte;
    bBPPminus1: Byte;
    bPicStructure: Byte;
    bSecondField: Byte;
    bPicIntra: Byte;
    bPicBackwardPrediction: Byte;
    bBidirectionalAveragingMode: Byte;
    bMVprecisionAndChromaRelation: Byte;
    bChromaFormat: Byte;
    bPicScanFixed: Byte;
    bPicScanMethod: Byte;
    bPicReadbackRequests: Byte;
    bRcontrol: Byte;
    bPicSpatialResid8: Byte;
    bPicOverflowBlocks: Byte;
    bPicExtrapolation: Byte;
    bPicDeblocked: Byte;
    bPicDeblockConfined: Byte;
    bPic4MVallowed: Byte;
    bPicOBMC: Byte;
    bPicBinPB: Byte;
    bMV_RPS: Byte;
    bReservedBits: Byte;
    wBitstreamFcodes: WORD;
    wBitstreamPCEelements: WORD;
    bBitstreamConcealmentNeed: Byte;
    bBitstreamConcealmentMethod: Byte;
  end;
  DXVA_PictureParameters = _DXVA_PictureParameters;
  PDXVA_PictureParameters = ^DXVA_PictureParameters;

// #pragma pack(pop, BeforeDXVApacking)
{$Z4}
{$A4}

{$ENDIF}  //* __DIRECTX_VA_DECODER__ *//


{$IFNDEF __DIRECTX_VA_DECODER9__}
{$DEFINE __DIRECTX_VA_DECODER9__}

  // -------------------------------------------------------------------------
  // Decoding data types used with RenderMoComp
  // -------------------------------------------------------------------------
  //

  _DXVAUncompDataInfo = record
    UncompWidth: DWORD;              { Width of uncompressed data }
    UncompHeight: DWORD;             { Height of uncompressed data }
    UncompFormat: D3DFORMAT;         { Format of uncompressed data }
  end;
  DXVAUncompDataInfo = _DXVAUncompDataInfo;
  PDXVAUncompDataInfo = ^DXVAUncompDataInfo;

  _DXVACompBufferInfo = record
    NumCompBuffers: DWORD;           { Number of buffers reqd for compressed data }
    WidthToCreate: DWORD;            { Width of surface to create }
    HeightToCreate: DWORD;           { Height of surface to create }
    BytesToAllocate: DWORD;          { Total number of bytes used by each surface }
    Usage: DWORD;                    { Usage used to create the compressed buffer }
    Pool: D3DPOOL;                   { Pool where the compressed buffer belongs }
    Format: D3DFORMAT;               { Format used to create the compressed buffer }
  end;
  DXVACompBufferInfo = _DXVACompBufferInfo;
  PDXVACompBufferInfo = ^DXVACompBufferInfo;

  _DXVABufferInfo = record
    pCompSurface: Pointer;           { Pointer to buffer containing compressed data }
    DataOffset: DWORD;               { Offset of relevant data from the beginning of buffer }
    DataSize: DWORD;                 { Size of relevant data }
  end;
  DXVABufferInfo = _DXVABufferInfo;
  PDXVABufferInfo = ^DXVABufferInfo;

{$ENDIF}  //* __DIRECTX_VA_DECODER9__ *//


  // -------------------------------------------------------------------------
  //
  // D3DFORMAT describes a pixel memory layout, DXVA sample format contains
  // additional information that describes how the pixels should be interpreted.
  //
  // DXVA Extended color data - occupies the SampleFormat DWORD
  // data fields.
  // -------------------------------------------------------------------------

{$IFNDEF __DIRECTX_VA_SAMPLEFORMAT__}
{$DEFINE __DIRECTX_VA_SAMPLEFORMAT__}


  _DXVA_SampleFormat = DWORD;
const
  DXVA_SampleFormatMask = $FF;
  DXVA_SampleUnknown = 0;
  DXVA_SamplePreviousFrame = 1;
  DXVA_SampleProgressiveFrame = 2;
  DXVA_SampleFieldInterleavedEvenFirst = 3;
  DXVA_SampleFieldInterleavedOddFirst = 4;
  DXVA_SampleFieldSingleEven = 5;
  DXVA_SampleFieldSingleOdd = 6;
  DXVA_SampleSubStream = 7;
type
  DXVA_SampleFormat = _DXVA_SampleFormat;
  PDXVA_SampleFormat = ^DXVA_SampleFormat;

  function DXVA_ExtractSampleFormat(_sf: DWORD): DWORD; inline;

  function DXVA_ExtractExtColorData(_sf: DWORD; _Mask: DWORD; _Shift: DWORD): DWORD; inline;

  function DXVABitMask(__n: DWORD): DWORD; inline;

const
  DXVA_ExtColorData_ShiftBase         = 8;

  function DXVAColorMask(__bits: DWORD; __base: DWORD): DWORD; inline;


type

  _DXVA_VideoTransferFunction = DWORD;
const
  DXVA_VideoTransFuncShift = (DXVA_ExtColorData_ShiftBase + 19);
  DXVA_VideoTransFuncMask = ((($FFFFFFFF shl 5) xor $FFFFFFFF) shl ord(DXVA_VideoTransFuncShift));
  DXVA_VideoTransFunc_Unknown = 0;
  DXVA_VideoTransFunc_10 = 1;
  DXVA_VideoTransFunc_18 = 2;
  DXVA_VideoTransFunc_20 = 3;
  DXVA_VideoTransFunc_22 = 4;
  DXVA_VideoTransFunc_22_709 = 5;
  DXVA_VideoTransFunc_22_240M = 6;
  DXVA_VideoTransFunc_22_8bit_sRGB = 7;
  DXVA_VideoTransFunc_28 = 8;
type
  DXVA_VideoTransferFunction = _DXVA_VideoTransferFunction;

  _DXVA_VideoPrimaries = DWORD;
const
  DXVA_VideoPrimariesShift = (DXVA_ExtColorData_ShiftBase + 14);
  DXVA_VideoPrimariesMask = ((($FFFFFFFF shl 5) xor $FFFFFFFF) shl ord(DXVA_VideoPrimariesShift));
  DXVA_VideoPrimaries_Unknown = 0;
  DXVA_VideoPrimaries_reserved = 1;
  DXVA_VideoPrimaries_BT709 = 2;
  DXVA_VideoPrimaries_BT470_2_SysM = 3;
  DXVA_VideoPrimaries_BT470_2_SysBG = 4;
  DXVA_VideoPrimaries_SMPTE170M = 5;
  DXVA_VideoPrimaries_SMPTE240M = 6;
  DXVA_VideoPrimaries_EBU3213 = 7;
  DXVA_VideoPrimaries_SMPTE_C = 8;
type
  DXVA_VideoPrimaries = _DXVA_VideoPrimaries;

  _DXVA_VideoLighting = DWORD;
const
  DXVA_VideoLightingShift = (DXVA_ExtColorData_ShiftBase + 10);
  DXVA_VideoLightingMask = ((($FFFFFFFF shl 4) xor $FFFFFFFF) shl ord(DXVA_VideoLightingShift));
  DXVA_VideoLighting_Unknown = 0;
  DXVA_VideoLighting_bright = 1;
  DXVA_VideoLighting_office = 2;
  DXVA_VideoLighting_dim = 3;
  DXVA_VideoLighting_dark = 4;
type
  DXVA_VideoLighting = _DXVA_VideoLighting;

  _DXVA_VideoTransferMatrix = DWORD;
const
  DXVA_VideoTransferMatrixShift = (DXVA_ExtColorData_ShiftBase + 7);
  DXVA_VideoTransferMatrixMask = ((($FFFFFFFF shl 3) xor $FFFFFFFF) shl ord(DXVA_VideoTransferMatrixShift));
  DXVA_VideoTransferMatrix_Unknown = 0;
  DXVA_VideoTransferMatrix_BT709 = 1;
  DXVA_VideoTransferMatrix_BT601 = 2;
  DXVA_VideoTransferMatrix_SMPTE240M = 3;
type
  DXVA_VideoTransferMatrix = _DXVA_VideoTransferMatrix;

  _DXVA_NominalRange = DWORD;
const
  DXVA_NominalRangeShift = (DXVA_ExtColorData_ShiftBase + 4);
  DXVA_NominalRangeMask = ((($FFFFFFFF shl 3) xor $FFFFFFFF) shl ord(DXVA_NominalRangeShift));
  DXVA_NominalRange_Unknown = 0;
  DXVA_NominalRange_Normal = 1;
  DXVA_NominalRange_Wide = 2;
  DXVA_NominalRange_0_255 = 1;
  DXVA_NominalRange_16_235 = 2;
  DXVA_NominalRange_48_208 = 3;
type
  DXVA_NominalRange = _DXVA_NominalRange;

type
  _DXVA_VideoChromaSubsampling = DWord;
  DXVA_VideoChromaSubsampling = _DXVA_VideoChromaSubsampling;
const
  DXVA_VideoChromaSubsamplingShift = (DXVA_ExtColorData_ShiftBase + 0);
  DXVA_VideoChromaSubsamplingMask = ((($FFFFFFFF shl 4) xor $FFFFFFFF) shl ord(DXVA_VideoChromaSubsamplingShift)); // DXVAColorMask(4, DXVA_VideoChromaSubsamplingShift),

  DXVA_VideoChromaSubsampling_Unknown                        = 0;
  DXVA_VideoChromaSubsampling_ProgressiveChroma              = $8;
  DXVA_VideoChromaSubsampling_Horizontally_Cosited           = $4;
  DXVA_VideoChromaSubsampling_Vertically_Cosited             = $2;
  DXVA_VideoChromaSubsampling_Vertically_AlignedChromaPlanes = $1;

  // 4:2:0 variations
  DXVA_VideoChromaSubsampling_MPEG2   = (DXVA_VideoChromaSubsampling_Horizontally_Cosited or
                                         DXVA_VideoChromaSubsampling_Vertically_AlignedChromaPlanes);

  DXVA_VideoChromaSubsampling_MPEG1   = (DXVA_VideoChromaSubsampling_Vertically_AlignedChromaPlanes);

  DXVA_VideoChromaSubsampling_DV_PAL  = (DXVA_VideoChromaSubsampling_Horizontally_Cosited or
                                         DXVA_VideoChromaSubsampling_Vertically_Cosited);

  // 4:4:4, 4:2:2, 4:1:1
  DXVA_VideoChromaSubsampling_Cosited = (DXVA_VideoChromaSubsampling_Horizontally_Cosited or
                                         DXVA_VideoChromaSubsampling_Vertically_Cosited or
                                         DXVA_VideoChromaSubsampling_Vertically_AlignedChromaPlanes);


type
  // See also MfPack.DxVa _DXVA_ExtendedFormat record and comments.

  PDXVA_ExtendedFormat = ^_DXVA_ExtendedFormat;
  _DXVA_ExtendedFormat = record
    public
      value: integer;
    private
      function ReadBits(const iIndex: Integer): Integer;
      procedure WriteBits(const iIndex: Integer; const iValue: Integer);
    public
      property SampleFormat:           Integer index $0008 read ReadBits write WriteBits; // 8 bits at offset 0, See DXVA_SampleFormat
      property VideoChromaSubsampling: Integer index $0804 read ReadBits write WriteBits; // 4 bits at offset 8, See DXVA_VideoChromaSubSampling
      property NominalRange:           Integer index $0c03 read ReadBits write WriteBits; // 3 bits at offset 12, See DXVA_NominalRange
      property VideoTransferMatrix:    Integer index $0f03 read ReadBits write WriteBits; // 3 bits at offset 15, See DXVA_VideoTransferMatrix
      property VideoLighting:          Integer index $1204 read ReadBits write WriteBits; // 4 bits at offset 18, See DXVA_VideoLighting
      property VideoPrimaries:         Integer index $1605 read ReadBits write WriteBits; // 5 bits at offset 22, See DXVA_VideoPrimaries
      property VideoTransferFunction:  Integer index $1b05 read ReadBits write WriteBits; // 5 bits at offset 27, See DXVA_VideoTransferFunction
  end;
 DXVA_ExtendedFormat = _DXVA_ExtendedFormat;

{$ENDIF}  //* __DIRECTX_VA_SAMPLEFORMAT__ *//


  // -------------------------------------------------------------------------
  //
  // The definitions that follow describe the video de-interlace interface
  // between the VMR and the graphics device driver.  This interface is not
  // accessable via the IAMVideoAccelerator interface.
  //
  // -------------------------------------------------------------------------
  //

{$IFNDEF __DIRECTX_VA_DEINTERLACE__}
{$DEFINE __DIRECTX_VA_DEINTERLACE__}


{$IFNDEF MFP_REFERENCE_TIME}
    type REFERENCE_TIME = LONGLONG;
{$ENDIF}

const

  DXVAp_DeinterlaceBobDevice       : TGUID = '{335aa36e-7884-43a4-9c91-7f87faf3e37e}';
  DXVAp_DeinterlaceContainerDevice : TGUID = '{0e85cb93-3046-4ff0-aecc-d58cb5f035fd}';


  DXVA_DeinterlaceBobDevice        : TGUID = '{335aa36e-7884-43a4-9c91-7f87faf3e37e}'; // = DXVAp_DeinterlaceBobDevice
  DXVA_DeinterlaceContainerDevice  : TGUID = '{0e85cb93-3046-4ff0-aecc-d58cb5f035fd}'; // = DXVAp_DeinterlaceContainerDevice

//#if (DIRECT3D_VERSION < 0x0800) || !defined(DIRECT3D_VERSION)
type D3DFORMAT = DWORD;
const
  D3DPOOL_DEFAULT                 = 0;
  D3DPOOL_MANAGED                 = 1;
  D3DPOOL_SYSTEMMEM               = 2;
  D3DPOOL_SCRATCH                 = 3;
  D3DPOOL_LOCALVIDMEM             = 4;
  D3DPOOL_NONLOCALVIDMEM          = 5;
  //D3DPOOL_FORCE_DWORD             = $7fffffff;


  // -------------------------------------------------------------------------
  // data structures shared by User mode and Kernel mode.
  // -------------------------------------------------------------------------
  //

type

  _DXVA_Frequency = record
    Numerator: DWORD;
    Denominator: DWORD;
  end;
  DXVA_Frequency = _DXVA_Frequency;
  PDXVAFrequency = ^DXVA_Frequency;


  LPDXVA_VideoDesc = ^_DXVA_VideoDesc;

  _DXVA_VideoDesc = record
    Size: DWORD;
    SampleWidth: DWORD;
    SampleHeight: DWORD;
    SampleFormat: DWORD;            // also contains extend color data
    d3dFormat: D3DFORMAT;
    InputSampleFreq: DXVA_Frequency;
    OutputFrameFreq: DXVA_Frequency;
  end;
  DXVA_VideoDesc = _DXVA_VideoDesc;
  PDXVAVideoDesc = ^DXVA_VideoDesc;


type

  _DXVA_VideoProcessCaps = DWord;
  DXVA_VideoProcessCaps = _DXVA_VideoProcessCaps;
  PDXVAVideoProcessCaps = ^DXVA_VideoProcessCaps;
const
  DXVA_VideoProcess_None               : _DXVA_VideoProcessCaps = $0000;
  DXVA_VideoProcess_YUV2RGB            : _DXVA_VideoProcessCaps = $0001;
  DXVA_VideoProcess_StretchX           : _DXVA_VideoProcessCaps = $0002;
  DXVA_VideoProcess_StretchY           : _DXVA_VideoProcessCaps = $0004;
  DXVA_VideoProcess_AlphaBlend         : _DXVA_VideoProcessCaps = $0008;
  DXVA_VideoProcess_SubRects           : _DXVA_VideoProcessCaps = $0010;
  DXVA_VideoProcess_SubStreams         : _DXVA_VideoProcessCaps = $0020;
  DXVA_VideoProcess_SubStreamsExtended : _DXVA_VideoProcessCaps = $0040;
  DXVA_VideoProcess_YUV2RGBExtended    : _DXVA_VideoProcessCaps = $0080;
  DXVA_VideoProcess_AlphaBlendExtended : _DXVA_VideoProcessCaps = $0100;


type


  _DXVA_DeinterlaceTech = DWORD;
const
  DXVA_DeinterlaceTech_Unknown = $0000;
  DXVA_DeinterlaceTech_BOBLineReplicate = $0001;
  DXVA_DeinterlaceTech_BOBVerticalStretch = $0002;
  DXVA_DeinterlaceTech_BOBVerticalStretch4Tap = $0100;
  DXVA_DeinterlaceTech_MedianFiltering = $0004;
  DXVA_DeinterlaceTech_EdgeFiltering = $0010;
  DXVA_DeinterlaceTech_FieldAdaptive = $0020;
  DXVA_DeinterlaceTech_PixelAdaptive = $0040;
  DXVA_DeinterlaceTech_MotionVectorSteered = $0080;
type
  DXVA_DeinterlaceTech = _DXVA_DeinterlaceTech;
  PDXVADeinterlaceTech = ^DXVA_DeinterlaceTech;


  LPDXVA_VideoSample = ^_DXVA_VideoSample;

  _DXVA_VideoSample = record
    rtStart: REFERENCE_TIME;
    rtEnd: REFERENCE_TIME;
    SampleFormat: DXVA_SampleFormat;  // only lower 8 bits used
    lpDDSSrcSurface: Pointer;
  end;
  DXVA_VideoSample = _DXVA_VideoSample;
  PDXVAVideoSample = ^DXVA_VideoSample;

  // -------------------------------------------------------------------------
  // DeinterlaceBltEx declarations
  // -------------------------------------------------------------------------
  //

type

  _DXVA_SampleFlags  = DWord;
  DXVA_SampleFlags = _DXVA_SampleFlags;
  PDXVASampleFlags = ^DXVA_SampleFlags;
const
  DXVA_SampleFlagsMask              = (1 shl 3) or (1 shl 2) or (1 shl 1) or (1 shl 0); // DXVABit(3)|DXVABit(2)|DXVABit(1)|DXVABit(0)
  DXVA_SampleFlag_Palette_Changed   = $0001;
  DXVA_SampleFlag_SrcRect_Changed   = $0002;
  DXVA_SampleFlag_DstRect_Changed   = $0004;
  DXVA_SampleFlag_ColorData_Changed = $0008;


type

  _DXVA_DestinationFlags = DWord;
  DXVA_DestinationFlags = _DXVA_DestinationFlags;
  PDXVADestinationFlags = ^DXVA_DestinationFlags;
const
  DXVA_DestinationFlagMask                = (1 shl 3) or (1 shl 2) or (1 shl 1) or (1 shl 0); // DXVABit(3)|DXVABit(2)|DXVABit(1)|DXVABit(0)
  DXVA_DestinationFlag_Background_Changed = $0001;
  DXVA_DestinationFlag_TargetRect_Changed = $0002;
  DXVA_DestinationFlag_ColorData_Changed  = $0004;
  DXVA_DestinationFlag_Alpha_Changed      = $0008;

type

  LPDXVA_VideoSample2 = ^_DXVA_VideoSample2;

  _DXVA_VideoSample2 = record
{$IFDEF WIN64}
    Size: DWORD;
    Reserved: DWORD;
{$ENDIF}
    rtStart: REFERENCE_TIME;
    rtEnd: REFERENCE_TIME;
    SampleFormat: DWORD;    // cast to DXVA_ExtendedFormat, or use Extract macros
    SampleFlags: DWORD;
    lpDDSSrcSurface: Pointer;
    rcSrc: TRect;
    rcDst: TRect;
    Palette: array [0..15] of DXVA_AYUVsample2;
  end;
  DXVA_VideoSample2 = _DXVA_VideoSample2;
  PDXVA_VideoSample2 = ^DXVA_VideoSample2;


  LPDXVA_DeinterlaceCaps = ^_DXVA_DeinterlaceCaps;

  _DXVA_DeinterlaceCaps = record
    Size: DWORD;
    NumPreviousOutputFrames: DWORD;
    InputPool: DWORD;
    NumForwardRefSamples: DWORD;
    NumBackwardRefSamples: DWORD;
    d3dOutputFormat: D3DFORMAT;
    VideoProcessingCaps: DXVA_VideoProcessCaps;
    DeinterlaceTechnology: DXVA_DeinterlaceTech;
  end;
  DXVA_DeinterlaceCaps = _DXVA_DeinterlaceCaps;
  PDXVADeinterlaceCaps = ^DXVA_DeinterlaceCaps;

  // -------------------------------------------------------------------------
  // Data types used with RenderMoComp in kernel mode
  // -------------------------------------------------------------------------
  //

  // Function codes for RenderMoComp

const
  MAX_DEINTERLACE_SURFACES            = 32;


{$IFDEF WIN64}
  //
  // These structures are used for thunking 32 bit DeinterlaceBltEx calls on
  // 64 bit drivers.
  //
type

  _DXVA_VideoSample32 = record
    rtStart: REFERENCE_TIME;
    rtEnd: REFERENCE_TIME;
    SampleFormat: DWORD;
    SampleFlags: DWORD;
    lpDDSSrcSurface: DWORD;         // 32 bit pointer size
    rcSrc: TRect;
    rcDst: TRect;
    Palette: array[0..15] of DXVA_AYUVsample2;
    // DWORD Pad;
    // 4 bytes of padding added by the compiler to align the struct to 8 bytes.
  end;
  DXVA_VideoSample32 = _DXVA_VideoSample32;
  PDXVAVideoSample32 = ^DXVA_VideoSample32;

  _DXVA_DeinterlaceBltEx32 = record
    Size: DWORD;
    BackgroundColor: DXVA_AYUVsample2;
    rcTarget: TRect;
    rtTarget: REFERENCE_TIME;
    NumSourceSurfaces: DWORD;
    Alpha: Single;
    Source: array[0..MAX_DEINTERLACE_SURFACES - 1] of DXVA_VideoSample32;
    DestinationFormat: DWORD;
    DestinationFlags: DWORD;
  end;
  DXVA_DeinterlaceBltEx32 = _DXVA_DeinterlaceBltEx32;
  PDXVADeinterlaceBltEx32 = ^DXVA_DeinterlaceBltEx32;

{$ENDIF} //* WIN64 *//

type

  _DXVA_DeinterlaceBlt = record
    Size: DWORD;
    Reserved: DWORD;
    rtTarget: REFERENCE_TIME;
    DstRect: TRect;
    SrcRect: TRect;
    NumSourceSurfaces: DWORD;
    Alpha: Single;
    Source: array[0..MAX_DEINTERLACE_SURFACES - 1] of DXVA_VideoSample;
  end;
  DXVA_DeinterlaceBlt = _DXVA_DeinterlaceBlt;
  PDXVADeinterlaceBlt = ^DXVA_DeinterlaceBlt;

const
  DXVA_DeinterlaceBltFnCode           = $01;
  // lpInput => DXVA_DeinterlaceBlt*
  // lpOuput => NULL /* not currently used */

type

  _DXVA_DeinterlaceBltEx = record
    Size: DWORD;
    BackgroundColor: DXVA_AYUVsample2;
    rcTarget: TRect;
    rtTarget: REFERENCE_TIME;
    NumSourceSurfaces: DWORD;
    Alpha: Single;
    Source: array[0..MAX_DEINTERLACE_SURFACES - 1] of DXVA_VideoSample2;
    DestinationFormat: DWORD;
    DestinationFlags: DWORD;
  end;
  DXVA_DeinterlaceBltEx = _DXVA_DeinterlaceBltEx;
  PDXVADeinterlaceBltEx = ^DXVA_DeinterlaceBltEx;

const
  DXVA_DeinterlaceBltExFnCode         = $02;
  // lpInput => DXVA_DeinterlaceBltEx*
  // lpOuput => NULL /* not currently used */

  MAX_DEINTERLACE_DEVICE_GUIDS        = 32;

type

  _DXVA_DeinterlaceQueryAvailableModes = record
    Size: DWORD;
    NumGuids: DWORD;
    Guids: array[0..MAX_DEINTERLACE_DEVICE_GUIDS - 1] of TGUID;
  end;
  DXVA_DeinterlaceQueryAvailableModes = _DXVA_DeinterlaceQueryAvailableModes;
  PDXVADeinterlaceQueryAvailableModes = ^DXVA_DeinterlaceQueryAvailableModes;

const
  DXVA_DeinterlaceQueryAvailableModesFnCode = $01;
  // lpInput => DXVA_VideoDesc*
  // lpOuput => DXVA_DeinterlaceQueryAvailableModes*


type

  _DXVA_DeinterlaceQueryModeCaps = record
    Size: DWORD;
    Guid: TGUID;
    VideoDesc: DXVA_VideoDesc;
  end;
  DXVA_DeinterlaceQueryModeCaps = _DXVA_DeinterlaceQueryModeCaps;
  PDXVADeinterlaceQueryModeCaps = ^DXVA_DeinterlaceQueryModeCaps;

const
  DXVA_DeinterlaceQueryModeCapsFnCode = $02;
  // lpInput => DXVA_DeinterlaceQueryModeCaps*
  // lpOuput => DXVA_DeinterlaceCaps*

{$ENDIF} //* __DIRECTX_VA_DEINTERLACE__ *//


  // -------------------------------------------------------------------------
  //
  // The definitions that follow describe the video ProcAmp interface
  // between the VMR and the graphics device driver.  This interface is not
  // accessable via the IAMVideoAccelerator interface.
  //
  // -------------------------------------------------------------------------
  //
{$IFNDEF __DIRECTX_VA_PROCAMPCONTROL__}
{$DEFINE __DIRECTX_VA_PROCAMPCONTROL__}

const
  DXVA_ProcAmpControlDevice : TGUID = '{9f200913-2ffd-4056-9f1e-e1b508f22dcf}';

type


  _DXVA_ProcAmpControlProp = DWORD;
const
  DXVA_ProcAmp_None = $0000;
  DXVA_ProcAmp_Brightness = $0001;
  DXVA_ProcAmp_Contrast = $0002;
  DXVA_ProcAmp_Hue = $0004;
  DXVA_ProcAmp_Saturation = $0008;
type
  DXVA_ProcAmpControlProp = _DXVA_ProcAmpControlProp;
  PDXVAProcAmpControlProp = ^DXVA_ProcAmpControlProp;


  LPDXVA_ProcAmpControlCaps = ^_DXVA_ProcAmpControlCaps;

  _DXVA_ProcAmpControlCaps = record
    Size: DWORD;
    InputPool: DWORD;
    d3dOutputFormat: D3DFORMAT;
    ProcAmpControlProps: DWORD;     // see DXVA_ProcAmpControlProp
    VideoProcessingCaps: DWORD;     // see DXVA_VideoProcessCaps
  end;
  DXVA_ProcAmpControlCaps = _DXVA_ProcAmpControlCaps;
  PDXVAProcAmpControlCaps = ^DXVA_ProcAmpControlCaps;

const

  DXVA_ProcAmpControlQueryCapsFnCode  = $03;
  // lpInput => DXVA_VideoDesc*
  // lpOuput => DXVA_ProcAmpControlCaps*

type
  LPDXVA_ProcAmpControlQueryRange = ^_DXVA_ProcAmpControlQueryRange;

  _DXVA_ProcAmpControlQueryRange = record
    Size: DWORD;
    ProcAmpControlProp: DXVA_ProcAmpControlProp;
    VideoDesc: DXVA_VideoDesc;
  end;
  DXVA_ProcAmpControlQueryRange = _DXVA_ProcAmpControlQueryRange;
  PDXVAProcAmpControlQueryRange = ^DXVA_ProcAmpControlQueryRange;

  LPDXVA_VideoPropertyRange = ^_DXVA_VideoPropertyRange;

  _DXVA_VideoPropertyRange = record
    MinValue: Single;
    MaxValue: Single;
    DefaultValue: Single;
    StepSize: Single;
  end;
  DXVA_VideoPropertyRange = _DXVA_VideoPropertyRange;
  PDXVAVideoPropertyRange = ^DXVA_VideoPropertyRange;

const

  DXVA_ProcAmpControlQueryRangeFnCode = $04;
  // lpInput => DXVA_ProcAmpControlQueryRange*
  // lpOuput => DXVA_VideoPropertyRange*

type

  _DXVA_ProcAmpControlBlt = record
    Size: DWORD;
    DstRect: TRect;
    SrcRect: TRect;
    Alpha: Single;
    Brightness: Single;
    Contrast: Single;
    Hue: Single;
    Saturation: Single;
  end;
  DXVA_ProcAmpControlBlt = _DXVA_ProcAmpControlBlt;
  PDXVAProcAmpControlBlt = ^DXVA_ProcAmpControlBlt;

const
  DXVA_ProcAmpControlBltFnCode        = $01;
  // lpInput => DXVA_ProcAmpControlBlt*
  // lpOuput => NULL /* not currently used */

{$ENDIF} //* __DIRECTX_VA_PROCAMPCONTROL__ *//


  // -------------------------------------------------------------------------
  //
  // The definitions that follow describe the Certified Output Protection
  // Protocol between the VMR and the graphics device driver.  This interface
  // is not accessable via the IAMVideoAccelerator interface.
  //
  // -------------------------------------------------------------------------
  //

{$IFNDEF __DIRECTX_VA_CERTOUTPUTPROTECT__}
{$DEFINE __DIRECTX_VA_CERTOUTPUTPROTECT__}

const
  DXVA_COPPDevice : TGUID = '{d2457add-8999-45ed-8a8a-d1aa047ba4d5}';

  // -------------------------------------------------------------------------
  // COPPGetCertificateLength
  // -------------------------------------------------------------------------
  DXVA_COPPGetCertificateLengthFnCode = $01;
  // lpInput => NULL
  // lpOuput => DWORD*

  // -------------------------------------------------------------------------
  // COPPKeyExchange
  // -------------------------------------------------------------------------
  DXVA_COPPKeyExchangeFnCode          = $02;
  // lpInputData => NULL
  // lpOuputData => GUID*


  // -------------------------------------------------------------------------
  // COPPSequenceStart
  // -------------------------------------------------------------------------

type

  LPDXVA_COPPSignature = ^_DXVA_COPPSignature;

  _DXVA_COPPSignature = record
    Signature: array[0..255] of UCHAR;
  end;
  DXVA_COPPSignature = _DXVA_COPPSignature;
  PDXVACOPPSignature = ^DXVA_COPPSignature;

const
  DXVA_COPPSequenceStartFnCode        = $03;
  // lpInputData => DXVA_COPPSignature*
  // lpOuputData => NULL

  // -------------------------------------------------------------------------
  // COPPCommand
  // -------------------------------------------------------------------------

type

  LPDXVA_COPPCommand = ^_DXVA_COPPCommand;

  _DXVA_COPPCommand = record
    macKDI: TGUID;                         //   16 bytes
    guidCommandID: TGUID;                  //   16 bytes
    dwSequence: ULONG;                     //    4 bytes
    cbSizeData: ULONG;                     //    4 bytes
    CommandData: array[0..4055] of UCHAR;  // 4056 bytes (4056+4+4+16+16 = 4096)
  end;
  DXVA_COPPCommand = _DXVA_COPPCommand;
  PDXVACOPPCommand = ^DXVA_COPPCommand;

const
  DXVA_COPPCommandFnCode              = $04;
  // lpInputData => DXVA_COPPCommand*
  // lpOuputData => NULL

  DXVA_COPPSetProtectionLevel : TGUID = '{9bb9327c-4eb5-4727-9f00-b42b0919c0da}';

type

  _DXVA_COPPSetProtectionLevelCmdData = record
    ProtType: ULONG;
    ProtLevel: ULONG;
    ExtendedInfoChangeMask: ULONG;
    ExtendedInfoData: ULONG;
  end;
  DXVA_COPPSetProtectionLevelCmdData = _DXVA_COPPSetProtectionLevelCmdData;
  PDXVACOPPSetProtectionLevelCmdData = ^DXVA_COPPSetProtectionLevelCmdData;

  // Set the HDCP protection level - (0 - 1 DWORD, 4 bytes)

type

  _COPP_HDCP_Protection_Level = DWord;
  PCOPPHDCPProtectionLevel = ^_COPP_HDCP_Protection_Level;
  COPP_HDCP_Protection_Level = _COPP_HDCP_Protection_Level;
const
  COPP_HDCP_Level0     = COPP_HDCP_Protection_Level(0);
  COPP_HDCP_LevelMin   = COPP_HDCP_Protection_Level(COPP_HDCP_Level0);
  COPP_HDCP_Level1     = COPP_HDCP_Protection_Level(1);
  COPP_HDCP_LevelMax   = COPP_HDCP_Protection_Level(COPP_HDCP_Level1);
  //COPP_HDCP_ForceDWORD = $7FFFFFFF

type

  _COPP_CGMSA_Protection_Level = DWord;
  PCOPPCGMSAProtectionLevel = ^_COPP_CGMSA_Protection_Level;
  COPP_CGMSA_Protection_Level = _COPP_CGMSA_Protection_Level;
const
  COPP_CGMSA_Disabled                      = COPP_CGMSA_Protection_Level(0);
  COPP_CGMSA_LevelMin                      = COPP_CGMSA_Protection_Level(COPP_CGMSA_Disabled);
  COPP_CGMSA_CopyFreely                    = COPP_CGMSA_Protection_Level(1);
  COPP_CGMSA_CopyNoMore                    = COPP_CGMSA_Protection_Level(2);
  COPP_CGMSA_CopyOneGeneration             = COPP_CGMSA_Protection_Level(3);
  COPP_CGMSA_CopyNever                     = COPP_CGMSA_Protection_Level(4);
  COPP_CGMSA_RedistributionControlRequired = COPP_CGMSA_Protection_Level($08);
  COPP_CGMSA_LevelMax                      = COPP_CGMSA_Protection_Level(COPP_CGMSA_RedistributionControlRequired + COPP_CGMSA_CopyNever);
  //COPP_CGMSA_ForceDWORD                  = $7FFFFFFF;

type

  _COPP_ACP_Protection_Level = DWord;
  PCOPPACPProtectionLevel = ^_COPP_ACP_Protection_Level;
  COPP_ACP_Protection_Level = _COPP_ACP_Protection_Level;
const
  COPP_ACP_Level0     = COPP_ACP_Protection_Level(0);
  COPP_ACP_LevelMin   = COPP_ACP_Protection_Level(COPP_ACP_Level0);
  COPP_ACP_Level1     = COPP_ACP_Protection_Level(1);
  COPP_ACP_Level2     = COPP_ACP_Protection_Level(2);
  COPP_ACP_Level3     = COPP_ACP_Protection_Level(3);
  COPP_ACP_LevelMax   = COPP_ACP_Protection_Level(COPP_ACP_Level3);
  //COPP_ACP_ForceDWORD = $7FFFFFFF;


  COPP_NoProtectionLevelAvailable     = - 1;
  COPP_DefaultProtectionLevel         = 0;

  //
  // Bit flags of possible protection types.  Note that it is possible to apply
  // different protection settings to a single connector.
  //

  COPP_ProtectionType_Unknown      = $80000000;
  COPP_ProtectionType_None         = $00000000;
  COPP_ProtectionType_HDCP         = $00000001;
  COPP_ProtectionType_ACP          = $00000002;
  COPP_ProtectionType_CGMSA        = $00000004;
  COPP_ProtectionType_Mask         = $80000007;
  COPP_ProtectionType_Reserved     = $7FFFFFF8;


  DXVA_COPPSetSignaling : TGUID = '{09a631a5-d684-4c60-8e4d-d3bb0f0be3ee}';

type

  PDXVACOPPSetSignalingCmdData = ^_DXVA_COPPSetSignalingCmdData;
  _DXVA_COPPSetSignalingCmdData = record
    ActiveTVProtectionStandard: ULONG;  // See COPP_TVProtectionStandard
    AspectRatioChangeMask1: ULONG;
    AspectRatioData1: ULONG;            // See COPP_ImageAspectRatio_EN300294 for ETSI EN 300 294 values
    AspectRatioChangeMask2: ULONG;
    AspectRatioData2: ULONG;
    AspectRatioChangeMask3: ULONG;
    AspectRatioData3: ULONG;
    ExtendedInfoChangeMask: array[0..3] of ULONG;
    ExtendedInfoData: array[0..3] of ULONG;
    Reserved: ULONG;
  end;
  DXVA_COPPSetSignalingCmdData = _DXVA_COPPSetSignalingCmdData;

type
  // Add format enum and data enum

  _COPP_TVProtectionStandard = DWord;
  PCOPPTVProtectionStandard = ^_COPP_TVProtectionStandard;
  COPP_TVProtectionStandard = _COPP_TVProtectionStandard;
const
  COPP_ProtectionStandard_Unknown             = COPP_TVProtectionStandard($80000000);
  COPP_ProtectionStandard_None                = COPP_TVProtectionStandard($00000000);
  COPP_ProtectionStandard_IEC61880_525i       = COPP_TVProtectionStandard($00000001);
  COPP_ProtectionStandard_IEC61880_2_525i     = COPP_TVProtectionStandard($00000002);
  COPP_ProtectionStandard_IEC62375_625p       = COPP_TVProtectionStandard($00000004);
  COPP_ProtectionStandard_EIA608B_525         = COPP_TVProtectionStandard($00000008);
  COPP_ProtectionStandard_EN300294_625i       = COPP_TVProtectionStandard($00000010);
  COPP_ProtectionStandard_CEA805A_TypeA_525p  = COPP_TVProtectionStandard($00000020);
  COPP_ProtectionStandard_CEA805A_TypeA_750p  = COPP_TVProtectionStandard($00000040);
  COPP_ProtectionStandard_CEA805A_TypeA_1125i = COPP_TVProtectionStandard($00000080);
  COPP_ProtectionStandard_CEA805A_TypeB_525p  = COPP_TVProtectionStandard($00000100);
  COPP_ProtectionStandard_CEA805A_TypeB_750p  = COPP_TVProtectionStandard($00000200);
  COPP_ProtectionStandard_CEA805A_TypeB_1125i = COPP_TVProtectionStandard($00000400);
  COPP_ProtectionStandard_ARIBTRB15_525i      = COPP_TVProtectionStandard($00000800);
  COPP_ProtectionStandard_ARIBTRB15_525p      = COPP_TVProtectionStandard($00001000);
  COPP_ProtectionStandard_ARIBTRB15_750p      = COPP_TVProtectionStandard($00002000);
  COPP_ProtectionStandard_ARIBTRB15_1125i     = COPP_TVProtectionStandard($00004000);
  COPP_ProtectionStandard_Mask                = COPP_TVProtectionStandard($80007FFF);
  COPP_ProtectionStandard_Reserved            = COPP_TVProtectionStandard($7FFF8000);


const
  COPP_ImageAspectRatio_EN300294_Mask = $00000007;


type

  _COPP_ImageAspectRatio_EN300294 = DWord;
  PCOPPImageAspectRatioEN300294 = ^_COPP_ImageAspectRatio_EN300294;
  COPP_ImageAspectRatio_EN300294 = _COPP_ImageAspectRatio_EN300294;
const
  COPP_AspectRatio_EN300294_FullFormat4by3                = COPP_ImageAspectRatio_EN300294(0);
  COPP_AspectRatio_EN300294_Box14by9Center                = COPP_ImageAspectRatio_EN300294(1);
  COPP_AspectRatio_EN300294_Box14by9Top                   = COPP_ImageAspectRatio_EN300294(2);
  COPP_AspectRatio_EN300294_Box16by9Center                = COPP_ImageAspectRatio_EN300294(3);
  COPP_AspectRatio_EN300294_Box16by9Top                   = COPP_ImageAspectRatio_EN300294(4);
  COPP_AspectRatio_EN300294_BoxGT16by9Center              = COPP_ImageAspectRatio_EN300294(5);
  COPP_AspectRatio_EN300294_FullFormat4by3ProtectedCenter = COPP_ImageAspectRatio_EN300294(6);
  COPP_AspectRatio_EN300294_FullFormat16by9Anamorphic     = COPP_ImageAspectRatio_EN300294(7);
  //COPP_AspectRatio_ForceDWORD                             = $7FFFFFFF


type
  // -------------------------------------------------------------------------
  // COPPQueryStatus
  // -------------------------------------------------------------------------
  LPDXVA_COPPStatusInput = ^_DXVA_COPPStatusInput;
  PDXVACOPPStatusInput = ^_DXVA_COPPStatusInput;
  _DXVA_COPPStatusInput = record
    rApp: TGUID;                           //   16 bytes
    guidStatusRequestID: TGUID;            //   16 bytes
    dwSequence: ULONG;                     //    4 bytes
    cbSizeData: ULONG;                     //    4 bytes
    StatusData: array[0..4055] of UCHAR;   // 4056 bytes (4056+4+4+16+16 = 4096)
  end;
  DXVA_COPPStatusInput = _DXVA_COPPStatusInput;


  LPDXVA_COPPStatusOutput = ^_DXVA_COPPStatusOutput;
  PDXVACOPPStatusOutput = ^_DXVA_COPPStatusOutput;
  _DXVA_COPPStatusOutput = record
    macKDI: TGUID;                         //   16 bytes
    cbSizeData: ULONG;                     //    4 bytes
    COPPStatus: array[0..4075] of UCHAR;  // 4076 bytes (4076+16+4 = 4096)
  end;
  DXVA_COPPStatusOutput = _DXVA_COPPStatusOutput;


type

  _COPP_StatusFlags = DWORD;
  PCOPPStatusFlags = ^_COPP_StatusFlags;
  COPP_StatusFlags = _COPP_StatusFlags;
const
  COPP_StatusNormal          = COPP_StatusFlags($00);
  COPP_LinkLost              = COPP_StatusFlags($01);
  COPP_RenegotiationRequired = COPP_StatusFlags($02);
  COPP_StatusFlagsReserved   = COPP_StatusFlags($FFFFFFFC);


type
  PDXVACOPPStatusData = ^_DXVA_COPPStatusData;
  _DXVA_COPPStatusData = record
    rApp: TGUID;
    dwFlags: ULONG;                 // See COPP_StatusFlags above
    dwData: ULONG;
    ExtendedInfoValidMask: ULONG;
    ExtendedInfoData: ULONG;
  end;
  DXVA_COPPStatusData = _DXVA_COPPStatusData;


  PDXVACOPPStatusDisplayData = ^_DXVA_COPPStatusDisplayData;
  _DXVA_COPPStatusDisplayData = record
    rApp: TGUID;
    dwFlags: ULONG;                  // See COPP_StatusFlags above
    DisplayWidth: ULONG;
    DisplayHeight: ULONG;
    Format: ULONG;                   // also contains extended color data
    d3dFormat: ULONG;
    FreqNumerator: ULONG;
    FreqDenominator: ULONG;
  end;
  DXVA_COPPStatusDisplayData = _DXVA_COPPStatusDisplayData;


type
  PCOPPStatusHDCPFlags = ^_COPP_StatusHDCPFlags;
  _COPP_StatusHDCPFlags    = DWord;
  COPP_StatusHDCPFlags = _COPP_StatusHDCPFlags;
const
  COPP_HDCPRepeater      = COPP_StatusHDCPFlags($01);
  COPP_HDCPFlagsReserved = COPP_StatusHDCPFlags($FFFFFFFE);


type
  PDXVACOPPStatusHDCPKeyData = ^_DXVA_COPPStatusHDCPKeyData;
  _DXVA_COPPStatusHDCPKeyData = record
    rApp: TGUID;
    dwFlags: ULONG;                  // See COPP_StatusFlags above
    dwHDCPFlags: ULONG;              // See COPP_StatusHDCPFlags above
    BKey: TGUID;                     // Lower 40 bits
    Reserved1: TGUID;
    Reserved2: TGUID;
  end;
  DXVA_COPPStatusHDCPKeyData = _DXVA_COPPStatusHDCPKeyData;

const

  DXVA_COPPQueryStatusFnCode          = $05;
  // lpInputData => DXVA_COPPStatusInput*
  // lpOuputData => DXVA_COPPStatusOutput*

  //
  // Status GUID and enumerations
  //
  DXVA_COPPQueryConnectorType : TGUID = '{81d0bfd5-6afe-48c2-99c0-95a08f97c5da}';

type

  _COPP_ConnectorType = DWord;
  PCOPPConnectorType = ^_COPP_ConnectorType;
  COPP_ConnectorType = _COPP_ConnectorType;
const
  COPP_ConnectorType_Unknown        = COPP_ConnectorType(-1);
  COPP_ConnectorType_VGA            = COPP_ConnectorType(0);
  COPP_ConnectorType_SVideo         = COPP_ConnectorType(1);
  COPP_ConnectorType_CompositeVideo = COPP_ConnectorType(2);
  COPP_ConnectorType_ComponentVideo = COPP_ConnectorType(3);
  COPP_ConnectorType_DVI            = COPP_ConnectorType(4);
  COPP_ConnectorType_HDMI           = COPP_ConnectorType(5);
  COPP_ConnectorType_LVDS           = COPP_ConnectorType(6);
  COPP_ConnectorType_TMDS           = COPP_ConnectorType(7);
  COPP_ConnectorType_D_JPN          = COPP_ConnectorType(8);
  COPP_ConnectorType_Internal       = COPP_ConnectorType($80000000);  // can be combined with the other connector types
  COPP_ConnectorType_ForceDWORD     = COPP_ConnectorType($7FFFFFFF);   { force 32-bit size enum }


const
  DXVA_COPPQueryProtectionType        : TGUID = '{38f2a801-9a6c-48bb-9107-b6696e6f1797}';
  DXVA_COPPQueryLocalProtectionLevel  : TGUID = '{b2075857-3eda-4d5d-88db-748f8c1a0549}';
  DXVA_COPPQueryGlobalProtectionLevel : TGUID = '{1957210a-7766-452a-b99a-d27aed54f03a}';
  DXVA_COPPQueryDisplayData           : TGUID = '{d7bf1ba3-ad13-4f8e-af98-0dcb3ca204cc}';
  DXVA_COPPQueryHDCPKeyData           : TGUID = '{0db59d74-a992-492e-a0bd-c23fda564e00}';
  DXVA_COPPQueryBusData               : TGUID = '{c6f4d673-6174-4184-8e35-f6db5200bcba}';

type

  _COPP_BusType = DWord;
  PCOPPBusType = ^_COPP_BusType;
  COPP_BusType = _COPP_BusType;
const
  COPP_BusType_Unknown    = COPP_BusType(0);
  COPP_BusType_PCI        = COPP_BusType(1);
  COPP_BusType_PCIX       = COPP_BusType(2);
  COPP_BusType_PCIExpress = COPP_BusType(3);
  COPP_BusType_AGP        = COPP_BusType(4);
  COPP_BusType_Integrated = COPP_BusType($80000000);  // can be combined with the other bus types
  //COPP_BusType_ForceDWORD = $7FFFFFFF;   { force 32-bit size enum }


const
  DXVA_COPPQuerySignaling            : TGUID = '{6629a591-3b79-4cf3-924a-11e8e7811671}';

type

  PDXVACOPPStatusSignalingCmdData = ^_DXVA_COPPStatusSignalingCmdData;
  _DXVA_COPPStatusSignalingCmdData = record
    rApp: TGUID;
    dwFlags: ULONG;                          // See COPP_StatusFlags above
    AvailableTVProtectionStandards: ULONG;   // See COPP_TVProtectionStandard
    ActiveTVProtectionStandard: ULONG;       // See COPP_TVProtectionStandard
    TVType: ULONG;
    AspectRatioValidMask1: ULONG;
    AspectRatioData1: ULONG;                 // See COPP_AspectRatio_EN300294 for ETSI EN 300 294 values
    AspectRatioValidMask2: ULONG;
    AspectRatioData2: ULONG;
    AspectRatioValidMask3: ULONG;
    AspectRatioData3: ULONG;
    ExtendedInfoValidMask: array[0..3] of ULONG;
    ExtendedInfoData: array[0..3] of ULONG;
  end;
  DXVA_COPPStatusSignalingCmdData = _DXVA_COPPStatusSignalingCmdData;

{$ENDIF} //* __DIRECTX_VA_CERTOUTPUTPROTECT__ *//

  // Additional Prototypes for ALL interfaces

{$IFNDEF MFP_LONGLONG}
  PULONGLONG = ^ULONGLONG;

  LONGLONG = Int64;
  PLONGLONG = ^LONGLONG;
  {$IF true}
    {$IFDEF WIN64}
      ULONGLONG = UInt64;
    {$ENDIF}
    {$IFDEF WIN32}
      ULONGLONG = Int64;
    {$ENDIF}
  {$ELSE}
    {$IFDEF WIN64}
      ULONGLONG = Int64;
   {$ENDIF}
    {$IFDEF WIN32}
      ULONGLONG = Int64;
    {$ENDIF}
  {$ENDIF}
{$ENDIF}

// End of Additional Prototypes

implementation


function DXVABit(__x: DWord): DWord;
begin
  Result := 1 shl __x;
end;


function DXVA_ExtractSampleFormat(_sf: DWORD): DWORD;
begin
  Result := _sf and ord(DXVA_SampleFormatMask);
end;


function DXVA_ExtractExtColorData(_sf: DWORD; _Mask: DWORD; _Shift: DWORD): DWORD;
begin
  Result := (_sf and _Mask) shr _Shift;
end;


function DXVABitMask(__n: DWORD): DWORD;
begin
  Result := ($FFFFFFFF shl __n) xor $FFFFFFFF;
end;


function DXVAColorMask(__bits: DWORD; __base: DWORD): DWORD;
begin
  Result := (DXVABitMask(__bits) shl (__base));
end;



/////// DXVA2_ExtendedFormat ///////////////////////////////////////////////////

  function DXVA_ExtendedFormat.ReadBits(const iIndex: Integer): Integer;
  var
    Offset: Integer;
    NrBits: Integer;
    Mask: Integer;

  begin
    NrBits := iIndex and $FF;
    Offset := iIndex shr 8;
    Mask := ((1 shl NrBits) - 1);
    Result := (Value shr Offset) and Mask;
  end;

  procedure DXVA_ExtendedFormat.WriteBits(const iIndex: Integer; const iValue: Integer);
  var
    Offset: Integer;
    NrBits: Integer;
    Mask: Integer;

  begin
    NrBits := iIndex and $FF;
    Offset := iIndex shr 8;
    Mask := ((1 shl NrBits) - 1);
{$IFDEF DEBUG}
    Assert(iValue <= Mask);
{$ENDIF}
    Value := (Value and (not (Mask shl Offset))) or ((iValue and Mask) shl Offset);
  end;

// END DXVA2_ExtendedFormat ////////////////////////////////////////////////////

// Implement Additional functions here.

end.
