// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.MediaFoundationApi.Evr9.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 07-07-2012
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: The enhanced video renderer (EVR) is a component that displays video on the user's
//              monitor.
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
// SDK version: 10.0.19041.0
//
// Todo: -
//
//==============================================================================
// Source: evr9.h
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
unit WinApi.MediaFoundationApi.Evr9;

{$I MfPack.Fpc.inc}


interface

uses

  {WinApi}
  Windows,
  WinApi.WinApiTypes,
  {System}
  {DirectX}
  {Use WinApi, Clootie Dx or MfPack}
  WinApi.DirectX.DXVa2Api;

  {$PACKENUM 4}

  {$IFDEF WIN32}
    {$ALIGN 1}
  {$ELSE}
  {$ALIGN 8}
  // Win64
  {$ENDIF}

  {$I 'WinApiTypes.inc'}

  // defined in WinApi.WinApiTypes
  // FLOAT
  // PPTGUID
  // LPGUID


type
  PMFVideoAlphaBitmapParams = ^MFVideoAlphaBitmapParams;

  MFVideoAlphaBitmapParams = record
    dwFlags: DWORD;
    clrSrcKey: COLORREF;
    rcSrc: TRect;
    nrcDest: MFVideoNormalizedRect;
    fAlpha: FLOAT;
    dwFilterMode: DWORD;
  end;

  PMFVideoAlphaBitmap = ^MFVideoAlphaBitmap;

  MFVideoAlphaBitmap = record
    GetBitmapFromDC: BOOL;
    bitmap: record
      case Byte of
        0: (hdc: HDC);
        1: (pDDS: Pointer); // Non-owning IDirect3DSurface9 pointer, as in the SDK union.
      end;
    params: MFVideoAlphaBitmapParams;
  end;

type
  PMFVideoAlphaBitmapFlags = ^MFVideoAlphaBitmapFlags;
  MFVideoAlphaBitmapFlags = DWord;

const
  MFVideoAlphaBitmap_EntireDDS = MFVideoAlphaBitmapFlags($1);
  MFVideoAlphaBitmap_SrcColorKey = MFVideoAlphaBitmapFlags($2);
  MFVideoAlphaBitmap_SrcRect = MFVideoAlphaBitmapFlags($4);
  MFVideoAlphaBitmap_DestRect = MFVideoAlphaBitmapFlags($8);
  MFVideoAlphaBitmap_FilterMode = MFVideoAlphaBitmapFlags($10);
  MFVideoAlphaBitmap_Alpha = MFVideoAlphaBitmapFlags($20);
  MFVideoAlphaBitmap_BitMask = MFVideoAlphaBitmapFlags($3F);


type

  // INTERFACES ////////////////////////////////////////////////////////////////

  // Interface IEVRVideoStreamControl
  // ================================
  //
  IEVRVideoStreamControl = interface(IUnknown)
    ['{d0cfe38b-93e7-4772-8957-0400c49a4485}']

    function SetStreamActiveState(fActive: BOOL): HResult; stdcall;

    function GetStreamActiveState(out lpfActive: BOOL): HResult; stdcall;

  end;

  IID_IEVRVideoStreamControl = IEVRVideoStreamControl;


  // Interface IMFVideoProcessor
  // ===========================
  //
  IMFVideoProcessor = interface(IUnknown)
    ['{6AB0000C-FECE-4d1f-A2AC-A9573530656E}']

    function GetAvailableVideoProcessorModes(lpdwNumProcessingModes: PUINT;
                                             out ppVideoProcessingModes: PGUID): HResult; stdcall;

    function GetVideoProcessorCaps(const lpVideoProcessorMode: LPGUID;
                                   out lpVideoProcessorCaps: DXVA2_VideoProcessorCaps): HResult; stdcall;

    function GetVideoProcessorMode(out lpMode: TGUID): HResult; stdcall;

    function SetVideoProcessorMode(const lpMode: LPGUID): HResult; stdcall;

    function GetProcAmpRange(dwProperty: DWORD;
                             out pPropRange: DXVA2_ValueRange): HResult; stdcall;

    function GetProcAmpValues(dwFlags: DWORD;
                              out Values: DXVA2_ProcAmpValues): HResult; stdcall;

    function SetProcAmpValues(dwFlags: DWORD;
                              const pValues: DXVA2_ProcAmpValues): HResult; stdcall;

    function GetFilteringRange(dwProperty: DWORD;
                               out pPropRange: DXVA2_ValueRange): HResult; stdcall;

    function GetFilteringValue(dwProperty: DWORD;
                               out pValue: DXVA2_Fixed32): HResult; stdcall;

    function SetFilteringValue(dwProperty: DWORD;
                               pValue: PDXVA2_Fixed32): HResult; stdcall;

    function GetBackgroundColor(out lpClrBkg: COLORREF): HResult; stdcall;

    function SetBackgroundColor(ClrBkg: COLORREF): HResult; stdcall;

  end;

  IID_IMFVideoProcessor = IMFVideoProcessor;


  // Interface IMFVideoMixerBitmap
  // =============================
  IMFVideoMixerBitmap = interface(IUnknown)
    ['{814C7B20-0FDB-4eec-AF8F-F957C8F69EDC}']

    function SetAlphaBitmap(var pBmpParms: MFVideoAlphaBitmap): HResult; stdcall;

    function ClearAlphaBitmap(): HResult; stdcall;

    function UpdateAlphaBitmapParameters(var pBmpParms: MFVideoAlphaBitmapParams): HResult; stdcall;

    function GetAlphaBitmapParameters(out pBmpParms: MFVideoAlphaBitmapParams): HResult; stdcall;

  end;

  IID_IMFVideoMixerBitmap = IMFVideoMixerBitmap;


  // Additional Prototypes for ALL interfaces

  // End of Additional Prototypes

implementation

// Implement Additional Prototypes here.

end.
