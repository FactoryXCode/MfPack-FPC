// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: WinApi.DirectX - DXGI
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.DirectX.DXGICommon.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 30-04-2019
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: Microsoft DirectX Graphics Infrastructure API
//
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
// Source: dxgicommon.h
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
unit WinApi.DirectX.DXGICommon;

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
  // The following values are used with DXGI_SAMPLE_DESC.Quality:
  DXGI_STANDARD_MULTISAMPLE_QUALITY_PATTERN = $FFFFFFFF;
  DXGI_CENTER_MULTISAMPLE_QUALITY_PATTERN   = $FFFFFFFE;

type

  PDXGI_RATIONAL = ^DXGI_RATIONAL;
  DXGI_RATIONAL = record
    Numerator: UINT;
    Denominator: UINT;
  end;

  PDXGI_SAMPLE_DESC = ^DXGI_SAMPLE_DESC;
  DXGI_SAMPLE_DESC = record
    Count: UINT;
    Quality: UINT;
  end;

type
  PDXGI_COLOR_SPACE_TYPE = ^DXGI_COLOR_SPACE_TYPE;
  DXGI_COLOR_SPACE_TYPE = DWord;
const
  DXGI_COLOR_SPACE_RGB_FULL_G22_NONE_P709           = DXGI_COLOR_SPACE_TYPE(0);
  DXGI_COLOR_SPACE_RGB_FULL_G10_NONE_P709           = DXGI_COLOR_SPACE_TYPE(1);
  DXGI_COLOR_SPACE_RGB_STUDIO_G22_NONE_P709         = DXGI_COLOR_SPACE_TYPE(2);
  DXGI_COLOR_SPACE_RGB_STUDIO_G22_NONE_P2020        = DXGI_COLOR_SPACE_TYPE(3);
  DXGI_COLOR_SPACE_RESERVED                         = DXGI_COLOR_SPACE_TYPE(4);
  DXGI_COLOR_SPACE_YCBCR_FULL_G22_NONE_P709_X601    = DXGI_COLOR_SPACE_TYPE(5);
  DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P601       = DXGI_COLOR_SPACE_TYPE(6);
  DXGI_COLOR_SPACE_YCBCR_FULL_G22_LEFT_P601         = DXGI_COLOR_SPACE_TYPE(7);
  DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P709       = DXGI_COLOR_SPACE_TYPE(8);
  DXGI_COLOR_SPACE_YCBCR_FULL_G22_LEFT_P709         = DXGI_COLOR_SPACE_TYPE(9);
  DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P2020      = DXGI_COLOR_SPACE_TYPE(10);
  DXGI_COLOR_SPACE_YCBCR_FULL_G22_LEFT_P2020        = DXGI_COLOR_SPACE_TYPE(11);
  DXGI_COLOR_SPACE_RGB_FULL_G2084_NONE_P2020        = DXGI_COLOR_SPACE_TYPE(12);
  DXGI_COLOR_SPACE_YCBCR_STUDIO_G2084_LEFT_P2020    = DXGI_COLOR_SPACE_TYPE(13);
  DXGI_COLOR_SPACE_RGB_STUDIO_G2084_NONE_P2020      = DXGI_COLOR_SPACE_TYPE(14);
  DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_TOPLEFT_P2020   = DXGI_COLOR_SPACE_TYPE(15);
  DXGI_COLOR_SPACE_YCBCR_STUDIO_G2084_TOPLEFT_P2020 = DXGI_COLOR_SPACE_TYPE(16);
  DXGI_COLOR_SPACE_RGB_FULL_G22_NONE_P2020          = DXGI_COLOR_SPACE_TYPE(17);
  DXGI_COLOR_SPACE_YCBCR_STUDIO_GHLG_TOPLEFT_P2020  = DXGI_COLOR_SPACE_TYPE(18);
  DXGI_COLOR_SPACE_YCBCR_FULL_GHLG_TOPLEFT_P2020    = DXGI_COLOR_SPACE_TYPE(19);
  DXGI_COLOR_SPACE_RGB_STUDIO_G24_NONE_P709         = DXGI_COLOR_SPACE_TYPE(20);
  DXGI_COLOR_SPACE_RGB_STUDIO_G24_NONE_P2020        = DXGI_COLOR_SPACE_TYPE(21);
  DXGI_COLOR_SPACE_YCBCR_STUDIO_G24_LEFT_P709       = DXGI_COLOR_SPACE_TYPE(22);
  DXGI_COLOR_SPACE_YCBCR_STUDIO_G24_LEFT_P2020      = DXGI_COLOR_SPACE_TYPE(23);
  DXGI_COLOR_SPACE_YCBCR_STUDIO_G24_TOPLEFT_P2020   = DXGI_COLOR_SPACE_TYPE(24);
  { 10.0.28000.0  }
  DXGI_COLOR_SPACE_RGB_FULL_G10_NONE_P2020          = DXGI_COLOR_SPACE_TYPE(25);
  //DXGI_COLOR_SPACE_CUSTOM               = FORCEDWORD);


  // Additional Prototypes for ALL interfaces

  // End of Additional Prototypes

implementation

  // Implement Additional functions here.

end.
