// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: WinApi.DirectX - D2D1
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.DirectX.D2D1Effects_1.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 07-07-2018
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: Image effects parts of the Direct2D API for Windows 8 and later.
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
// Source: d2d1effects_1.h
//
// Copyright (c) Microsoft Corporation. All rights reserved.
//==============================================================================
//
// FPC port updated: 2026-11-15
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
unit WinApi.DirectX.D2D1Effects_1;

{$I MfPack.Fpc.inc}


interface

uses
  {WinApi}
  Windows;

  {$PACKENUM 4}

  {$IFDEF WIN32}
    {$ALIGN 1}
  {$ELSE}
    {$ALIGN 8} // Win64
  {$ENDIF}


const
  // Built in effect CLSIDs
  CLSID_D2D1YCbCr : TGUID = (D1: $99503cc1;
                             D2: $66c7;
                             D3: $45c9;
                             D4: ($a8, $75, $8a, $d8, $a7, $91, $44, $01));

type
  /// <summary>
  /// The enumeration of the YCbCr effect's top level properties.
  /// Effect description: An effect that takes a Y plane as input 0 and a CbCr plane
  /// as input 1 and outputs RGBA.  The CbCr plane can be chroma subsampled.  Useful
  /// for JPEG color conversion.
  /// </summary>
  PD2D1_YCBCR_PROP = ^D2D1_YCBCR_PROP;
  D2D1_YCBCR_PROP = DWord;
const
  /// <summary>
  /// Property Name: "ChromaSubsampling"
  /// Property Type: D2D1_YCBCR_CHROMA_SUBSAMPLING
  /// </summary>
  D2D1_YCBCR_PROP_CHROMA_SUBSAMPLING = D2D1_YCBCR_PROP(0);
  /// <summary>
  /// Property Name: "TransformMatrix"
  /// Property Type: D2D1_MATRIX_3X2_F
  /// </summary>
  D2D1_YCBCR_PROP_TRANSFORM_MATRIX   = D2D1_YCBCR_PROP(1);
  /// <summary>
  /// Property Name: "InterpolationMode"
  /// Property Type: D2D1_YCBCR_INTERPOLATION_MODE
  /// </summary>
  D2D1_YCBCR_PROP_INTERPOLATION_MODE = D2D1_YCBCR_PROP(2);
  //D2D1_YCBCR_PROP_FORCE_DWORD    = FORCEDWORD;

type
  PD2D1_YCBCR_CHROMA_SUBSAMPLING = ^D2D1_YCBCR_CHROMA_SUBSAMPLING;
  D2D1_YCBCR_CHROMA_SUBSAMPLING = DWord;
const
  D2D1_YCBCR_CHROMA_SUBSAMPLING_AUTO    = D2D1_YCBCR_CHROMA_SUBSAMPLING(0);
  D2D1_YCBCR_CHROMA_SUBSAMPLING_420     = D2D1_YCBCR_CHROMA_SUBSAMPLING(1);
  D2D1_YCBCR_CHROMA_SUBSAMPLING_422     = D2D1_YCBCR_CHROMA_SUBSAMPLING(2);
  D2D1_YCBCR_CHROMA_SUBSAMPLING_444     = D2D1_YCBCR_CHROMA_SUBSAMPLING(3);
  D2D1_YCBCR_CHROMA_SUBSAMPLING_440     = D2D1_YCBCR_CHROMA_SUBSAMPLING(4);
  //D2D1_YCBCR_CHROMA_SUBSAMPLING_FORCE_DWORD = FORCEDWORD;

type
  PD2D1_YCBCR_INTERPOLATION_MODE = ^D2D1_YCBCR_INTERPOLATION_MODE;
  D2D1_YCBCR_INTERPOLATION_MODE = DWord;
const
  D2D1_YCBCR_INTERPOLATION_MODE_NEAREST_NEIGHBOR  = D2D1_YCBCR_INTERPOLATION_MODE(0);
  D2D1_YCBCR_INTERPOLATION_MODE_LINEAR        = D2D1_YCBCR_INTERPOLATION_MODE(1);
  D2D1_YCBCR_INTERPOLATION_MODE_CUBIC         = D2D1_YCBCR_INTERPOLATION_MODE(2);
  D2D1_YCBCR_INTERPOLATION_MODE_MULTI_SAMPLE_LINEAR = D2D1_YCBCR_INTERPOLATION_MODE(3);
  D2D1_YCBCR_INTERPOLATION_MODE_ANISOTROPIC     = D2D1_YCBCR_INTERPOLATION_MODE(4);
  D2D1_YCBCR_INTERPOLATION_MODE_HIGH_QUALITY_CUBIC  = D2D1_YCBCR_INTERPOLATION_MODE(5);
  //D2D1_YCBCR_INTERPOLATION_MODE_FORCE_DWORD     = FORCEDWORD;


  // Additional Prototypes for ALL interfaces

  // End of Additional Prototypes

implementation

  // Implement Additional Prototypes here.

end.
