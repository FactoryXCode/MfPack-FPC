// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: WinApi.DirectX - DXGI
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.DirectX.DXGI1_3.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 30-04-2019
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: Microsoft DirectX Graphics Infrastructure API
//
// Organisation: FactoryX
// Initiator(s): Tony (maXcomX), Peter (OzShips)
// Contributor(s): Tony Kalf (maXcomX), Peter Larson (ozships), (kxMAXX)
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
// Source: dxgi1_3.h
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
unit WinApi.DirectX.DXGI1_3;

{$I MfPack.Fpc.inc}


interface

uses

  {WinApi}
  Windows,
  {DirectX}
  WinApi.DirectX.DXGI,
  WinApi.DirectX.DXGI1_2,
  WinApi.DirectX.DXGIFormat;

  {$PACKENUM 4}

  {$IFDEF WIN32}
    {$ALIGN 1}
  {$ELSE}
    {$ALIGN 8} // Win64
  {$ENDIF}

const

  DXGI_CREATE_FACTORY_DEBUG           = $1;

  function CreateDXGIFactory2(Flags: UINT;
                              const riid: TGuid;
                              var ppFactory: pointer): HResult; stdcall;

  function DXGIGetDebugInterface1(Flags: UINT;
                                  const riid: TGuid;
                                  var pDebug: pointer): HResult; stdcall;

// Enums =======================================================================

type
  //+-----------------------------------------------------------------------------
  //
  //  Flags: DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAGS
  //
  //------------------------------------------------------------------------------
  PDXGI_MULTIPLANE_OVERLAY_YCbCr_FLAGS = ^DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAGS;
  DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAGS = DWord;
const
  DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAG_NOMINAL_RANGE = DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAGS($1);  // 16 - 235 vs. 0 - 255
  DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAG_BT709         = DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAGS($2);  // BT.709 vs. BT.601
  DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAG_xvYCC         = DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAGS($4);   // xvYCC vs. conventional YCbCr

type
  PDxgiFramePresentationMode = ^DXGI_FRAME_PRESENTATION_MODE;
  DXGI_FRAME_PRESENTATION_MODE = DWord;
  DxgiFramePresentationMode                        = DXGI_FRAME_PRESENTATION_MODE;
const
  DXGI_FRAME_PRESENTATION_MODE_COMPOSED            = DXGI_FRAME_PRESENTATION_MODE(0);
  DXGI_FRAME_PRESENTATION_MODE_OVERLAY             = DXGI_FRAME_PRESENTATION_MODE(1);
  DXGI_FRAME_PRESENTATION_MODE_NONE                = DXGI_FRAME_PRESENTATION_MODE(2);
  DXGI_FRAME_PRESENTATION_MODE_COMPOSITION_FAILURE = DXGI_FRAME_PRESENTATION_MODE(3);

type
  PDXGI_OVERLAY_SUPPORT_FLAG = ^DXGI_OVERLAY_SUPPORT_FLAG;
  DXGI_OVERLAY_SUPPORT_FLAG = DWord;
const
  DXGI_OVERLAY_SUPPORT_FLAG_DIRECT  = DXGI_OVERLAY_SUPPORT_FLAG($1);
  DXGI_OVERLAY_SUPPORT_FLAG_SCALING = DXGI_OVERLAY_SUPPORT_FLAG($2);


// =============================================================================

type

  // Interface IDXGIDevice3
  // ======================
  //
  IDXGIDevice3 = interface(IDXGIDevice2)
  ['{6007896c-3244-4afd-bf18-a6d3beda5023}']

    procedure Trim(); stdcall;

  end;
  IID_IDXGIDevice3 = IDXGIDevice3;

  //+-----------------------------------------------------------------------------
  //
  //  Struct:
  //      DXGI_MATRIX_3X2_F
  //
  //------------------------------------------------------------------------------
  PDXGI_MATRIX_3X2_F = ^DXGI_MATRIX_3X2_F;
  DXGI_MATRIX_3X2_F = record
    _11: Single;
    _12: Single;
    _21: Single;
    _22: Single;
    _31: Single;
    _32: Single;
  end;


  // Interface IDXGISwapChain2
  // =========================
  //
  IDXGISwapChain2 = interface(IDXGISwapChain1)
  ['{a8be2ac4-199f-4946-b331-79599fb98de7}']

    function SetSourceSize(Width: UINT;
                           Height: UINT): HResult; stdcall;

    function GetSourceSize(out pWidth: UINT;
                           out pHeight: UINT): HResult; stdcall;

    function SetMaximumFrameLatency(MaxLatency: UINT): HResult; stdcall;

    function GetMaximumFrameLatency(out pMaxLatency: UINT): HResult; stdcall;

    function GetFrameLatencyWaitableObject(): THandle; stdcall;

    function SetMatrixTransform(const pMatrix: DXGI_MATRIX_3X2_F): HResult; stdcall;

    function GetMatrixTransform(out pMatrix: DXGI_MATRIX_3X2_F): HResult; stdcall;

  end;
  IID_IDXGISwapChain2 = IDXGISwapChain2;


  // Interface IDXGIOutput2
  // ======================
  //
  IDXGIOutput2 = interface(IDXGIOutput1)
  ['{595e39d1-2724-4663-99b1-da969de28364}']

    function SupportsOverlays(): BOOL; stdcall;

  end;
  IID_IDXGIOutput2 = IDXGIOutput2;


  // Interface IDXGIFactory3
  // =======================
  //
  IDXGIFactory3 = interface(IDXGIFactory2)
  ['{25483823-cd46-4c7d-86ca-47aa95b837bd}']

    function GetCreationFlags(): UINT; stdcall;

  end;
  IID_IDXGIFactory3 = IDXGIFactory3;


  //+-----------------------------------------------------------------------------
  //
  //  Struct: DXGI_DECODE_SWAP_CHAIN_DESC
  //
  //------------------------------------------------------------------------------
  PDXGI_DECODE_SWAP_CHAIN_DESC = ^DXGI_DECODE_SWAP_CHAIN_DESC;
  DXGI_DECODE_SWAP_CHAIN_DESC = record
    Flags: UINT;
  end;


  // Interface IDXGIDecodeSwapChain
  // ==============================
  //
  IDXGIDecodeSwapChain = interface(IUnknown)
  ['{2633066b-4514-4c7a-8fd8-12ea98059d18}']

    function PresentBuffer(BufferToPresent: UINT;
                           SyncInterval: UINT;
                           Flags: UINT): HResult; stdcall;

    function SetSourceRect(pRect: TRect): HResult; stdcall; // ID3D11VideoContext.VideoProcessorSetStreamSourceRect

    function SetTargetRect(const pRect: PRect): HResult; stdcall; // ID3D11VideoContext.VideoProcessorSetOutputTargetRect

    function SetDestSize(Width: UINT;
                         Height: UINT): HResult; stdcall; // ID3D11VideoContext.VideoProcessorSetStreamDestRect

    function GetSourceRect(out pRect: TRect): HResult; stdcall;

    function GetTargetRect(out pRect: TRect): HResult; stdcall;

    function GetDestSize(out pWidth: UINT;
                         out pHeight: UINT): HResult; stdcall;

    // Set and get color space
    function SetColorSpace(ColorSpace: DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAGS): HResult; stdcall;

    function GetColorSpace(ColorSpace: DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAGS): HResult; stdcall;

  end;
  IID_IDXGIDecodeSwapChain = IDXGIDecodeSwapChain;


  // Interface IDXGIFactoryMedia
  // ===========================
  //
  IDXGIFactoryMedia = interface(IUnknown)
  ['{41e7d1f2-a591-4f7b-a2e5-fa9c843e1c12}']

    function CreateSwapChainForCompositionSurfaceHandle({in} pDevice: IUnknown;
                                                        {in} hSurface: THandle;
                                                        {in} pDesc: DXGI_SWAP_CHAIN_DESC1;
                                                        {in} pRestrictToOutput: IDXGIOutput;
                                                         out ppSwapChain: IDXGISwapChain1): HResult; stdcall;

    function CreateDecodeSwapChainForCompositionSurfaceHandle({in} pDevice: IUnknown;
                                                              {in} hSurface: THandle;
                                                              {in} pDesc: DXGI_DECODE_SWAP_CHAIN_DESC;
                                                              {in} pYuvDecodeBuffers: IDXGIResource;
                                                              {in} pRestrictToOutput: IDXGIOutput;
                                                              out ppSwapChain: IDXGIDecodeSwapChain): HResult; stdcall;

  end;
  IID_IDXGIFactoryMedia = IDXGIFactoryMedia;

  //+-----------------------------------------------------------------------------
  //
  //  Struct: DXGI_FRAME_PRESENTATION_MODE & DXGI_FRAME_STATISTICS_MEDIA
  //
  //------------------------------------------------------------------------------

  PDxgiFrameStatisticsMedia = ^DXGI_FRAME_STATISTICS_MEDIA;
  DXGI_FRAME_STATISTICS_MEDIA = record
    PresentCount: UINT;
    PresentRefreshCount: UINT;
    SyncRefreshCount: UINT;
    SyncQPCTime: LARGE_INTEGER;
    SyncGPUTime: LARGE_INTEGER;
    CompositionMode: DXGI_FRAME_PRESENTATION_MODE;
    ApprovedPresentDuration: UINT;
  end;
  DxgiFrameStatisticsMedia = DXGI_FRAME_STATISTICS_MEDIA;


  // Interface IDXGISwapChainMedia
  // =============================
  //
  IDXGISwapChainMedia = interface(IUnknown)
  ['{dd95b90b-f05f-4f6a-bd65-25bfb264bd84}']

    function GetFrameStatisticsMedia(out pStats: DXGI_FRAME_STATISTICS_MEDIA): HResult; stdcall;

    function SetPresentDuration(Duration: UINT): HResult; stdcall;

    function CheckPresentDurationSupport(DesiredPresentDuration: UINT;
                                         out pClosestSmallerPresentDuration: UINT;
                                         out pClosestLargerPresentDuration: UINT): HResult; stdcall;

  end;
  IID_IDXGISwapChainMedia = IDXGISwapChainMedia;


  // Interface IDXGIOutput3
  // ======================
  //
  IDXGIOutput3 = interface(IDXGIOutput2)
  ['{8a6bb301-7e7e-41F4-a8e0-5b32f7f99b18}']

    function CheckOverlaySupport({in} EnumFormat: DXGI_FORMAT;
                                 {in} pConcernedDevice: IUnknown;
                                 out pFlags: UINT): HResult; stdcall;

  end;
  IID_IDXGIOutput3 = IDXGIOutput3;


  // Additional Prototypes for ALL interfaces

  // End of Additional Prototypes

implementation

const
  DXGI1_3Lib = 'Dxgi.dll';

  function CreateDXGIFactory2; external DXGI1_3Lib name 'CreateDXGIFactory2' ;
  function DXGIGetDebugInterface1; external DXGI1_3Lib name 'DXGIGetDebugInterface1' ;

  // Implement Additional functions here.

end.
