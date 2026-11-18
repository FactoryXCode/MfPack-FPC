// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: WinApi.DirectX - DirectComposition
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.DirectX.DCompTypes.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 30-04-2019
// Language: ENU
//
// Upstream revision: 4.1.0
//
// Description: Enables high-performance bitmap composition with transforms,
//              effects, and animations.
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
// Remarks: Requires Windows 8 or later.
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
// Source: dcomptypes.h
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
unit WinApi.DirectX.DCompTypes;

{$I MfPack.Fpc.inc}

interface

uses
  
  {WinApi}
  WinApi.WinApiTypes,
  {DirectX}
  WinApi.DirectX.DXGICommon;

  {$ALIGN ON}
  {$PACKENUM 4}

  {$IFDEF WIN32}
    {$ALIGN 1}
  {$ELSE}
    {$ALIGN 8} // Win64
  {$ENDIF}


// #if (NTDDI_VERSION >= NTDDI_WIN8)

//
// DirectComposition types
//

type
  PDCOMPOSITION_BITMAP_INTERPOLATION_MODE = ^DCOMPOSITION_BITMAP_INTERPOLATION_MODE;
  DCOMPOSITION_BITMAP_INTERPOLATION_MODE = DWord;
const
  DCOMPOSITION_BITMAP_INTERPOLATION_MODE_NEAREST_NEIGHBOR = DCOMPOSITION_BITMAP_INTERPOLATION_MODE(0);
  DCOMPOSITION_BITMAP_INTERPOLATION_MODE_LINEAR           = DCOMPOSITION_BITMAP_INTERPOLATION_MODE(1);
  DCOMPOSITION_BITMAP_INTERPOLATION_MODE_INHERIT = DWORD($FFFFFFFF);

type
  PDCOMPOSITION_BORDER_MODE = ^DCOMPOSITION_BORDER_MODE;
  DCOMPOSITION_BORDER_MODE = DWord;
const
  DCOMPOSITION_BORDER_MODE_SOFT     = DCOMPOSITION_BORDER_MODE(0);
  DCOMPOSITION_BORDER_MODE_HARD     = DCOMPOSITION_BORDER_MODE(1);
  DCOMPOSITION_BORDER_MODE_INHERIT = DWORD($FFFFFFFF);

type
  PDCOMPOSITION_COMPOSITE_MODE = ^DCOMPOSITION_COMPOSITE_MODE;
  DCOMPOSITION_COMPOSITE_MODE = DWord;
const
  DCOMPOSITION_COMPOSITE_MODE_SOURCE_OVER        = DCOMPOSITION_COMPOSITE_MODE(0);
  DCOMPOSITION_COMPOSITE_MODE_DESTINATION_INVERT = DCOMPOSITION_COMPOSITE_MODE(1);
// #if (_WIN32_WINNT >= _WIN32_WINNT_WINBLUE)
  DCOMPOSITION_COMPOSITE_MODE_MIN_BLEND          = DCOMPOSITION_COMPOSITE_MODE(2);
// #endif  // (_WIN32_WINNT >= _WIN32_WINNT_WINBLUE)
  DCOMPOSITION_COMPOSITE_MODE_INHERIT = DWORD($FFFFFFFF);

type
// #if (_WIN32_WINNT >= _WIN32_WINNT_WINBLUE)
  PDCOMPOSITION_BACKFACE_VISIBILITY = ^DCOMPOSITION_BACKFACE_VISIBILITY;
  DCOMPOSITION_BACKFACE_VISIBILITY  = DWord;
const
  DCOMPOSITION_BACKFACE_VISIBILITY_VISIBLE  = DCOMPOSITION_BACKFACE_VISIBILITY(0);
  DCOMPOSITION_BACKFACE_VISIBILITY_HIDDEN   = DCOMPOSITION_BACKFACE_VISIBILITY(1);
  DCOMPOSITION_BACKFACE_VISIBILITY_INHERIT = DWORD($FFFFFFFF);

type
  PDCOMPOSITION_OPACITY_MODE = ^DCOMPOSITION_OPACITY_MODE;
  DCOMPOSITION_OPACITY_MODE = DWord;
const
  DCOMPOSITION_OPACITY_MODE_LAYER     = DCOMPOSITION_OPACITY_MODE(0);
  DCOMPOSITION_OPACITY_MODE_MULTIPLY  = DCOMPOSITION_OPACITY_MODE(1);
  DCOMPOSITION_OPACITY_MODE_INHERIT = DWORD($FFFFFFFF);

// #endif  // (_WIN32_WINNT >= _WIN32_WINNT_WINBLUE)

// #if (_WIN32_WINNT >= _WIN32_WINNT_WINTHRESHOLD)
type
  PDCOMPOSITION_DEPTH_MODE = ^DCOMPOSITION_DEPTH_MODE;
  DCOMPOSITION_DEPTH_MODE = DWord;
const
  DCOMPOSITION_DEPTH_MODE_TREE    = DCOMPOSITION_DEPTH_MODE(0);
  DCOMPOSITION_DEPTH_MODE_SPATIAL = DCOMPOSITION_DEPTH_MODE(1);
  DCOMPOSITION_DEPTH_MODE_SORTED  = DCOMPOSITION_DEPTH_MODE(3);
  DCOMPOSITION_DEPTH_MODE_INHERIT = DWORD($FFFFFFFF);

// #endif  // (_WIN32_WINNT >= _WIN32_WINNT_WINTHRESHOLD)

type

  PDCOMPOSITION_FRAME_STATISTICS = ^DCOMPOSITION_FRAME_STATISTICS;
  DCOMPOSITION_FRAME_STATISTICS = record
  lastFrameTime: LARGE_INTEGER;
  currentCompositionRate: DXGI_RATIONAL;
  currentTime: LARGE_INTEGER;
  timeFrequency: LARGE_INTEGER;
  nextEstimatedFrameTime: LARGE_INTEGER;
  end;


  //
  // Composition object specific access flags
  //
const

  COMPOSITIONOBJECT_READ              = $0001;
  COMPOSITIONOBJECT_WRITE             = $0002;
  COMPOSITIONOBJECT_ALL_ACCESS        = (COMPOSITIONOBJECT_READ or COMPOSITIONOBJECT_WRITE);



  //
  // Composition Stats
  //

type

  PCOMPOSITION_FRAME_ID_TYPE = ^COMPOSITION_FRAME_ID_TYPE;
  COMPOSITION_FRAME_ID_TYPE        = (
    COMPOSITION_FRAME_ID_CREATED   = 0,
    COMPOSITION_FRAME_ID_CONFIRMED = 1,
    COMPOSITION_FRAME_ID_COMPLETED = 2
  );

  PCOMPOSITION_FRAME_ID = ^COMPOSITION_FRAME_ID;
  COMPOSITION_FRAME_ID = ULONG64;

  PCOMPOSITION_FRAME_STATS = ^tagCOMPOSITION_FRAME_STATS;
  tagCOMPOSITION_FRAME_STATS = record
    startTime: UINT64;
    targetTime: UINT64;
    framePeriod: UINT64;
  end;
  COMPOSITION_FRAME_STATS = tagCOMPOSITION_FRAME_STATS;


  PCOMPOSITION_TARGET_ID = ^COMPOSITION_TARGET_ID;
  tagCOMPOSITION_TARGET_ID = record
    displayAdapterLuid: LUID;
    renderAdapterLuid: LUID;
    vidPnSourceId: UINT;
    vidPnTargetId: UINT;
    uniqueId: UINT;

    function IsEqual(rhs: tagCOMPOSITION_TARGET_ID): Boolean;

   end;
  COMPOSITION_TARGET_ID = tagCOMPOSITION_TARGET_ID;


  PCOMPOSITION_STATS = ^COMPOSITION_STATS;
  tagCOMPOSITION_STATS = record
    presentCount: UINT;
    refreshCount: UINT;
    virtualRefreshCount: UINT;
    time: UINT64;
  end;
  COMPOSITION_STATS = tagCOMPOSITION_STATS;


  PCOMPOSITION_TARGET_STATS = ^COMPOSITION_TARGET_STATS;
  tagCOMPOSITION_TARGET_STATS = record
    outstandingPresents: UINT;
    presentTime: UINT64;
    vblankDuration: UINT64;
    presentedStats: COMPOSITION_STATS;
    completedStats: COMPOSITION_STATS;
  end;
  COMPOSITION_TARGET_STATS = tagCOMPOSITION_TARGET_STATS;

const

  // The maximum nubmer of objects we allow users to wait on the compositor clock
  DCOMPOSITION_MAX_WAITFORCOMPOSITORCLOCK_OBJECTS = 32;

  // Maximum number of targets kept per frame
  COMPOSITION_STATS_MAX_TARGETS       = 256;
// #endif // NTDDI_WIN8


  // Additional Prototypes for ALL interfaces

  // End of Additional Prototypes

implementation

  // Implement Additional functions here.

function tagCOMPOSITION_TARGET_ID.IsEqual(rhs: tagCOMPOSITION_TARGET_ID): Boolean;
  begin
    Result := (displayAdapterLuid.LowPart = rhs.displayAdapterLuid.LowPart)   AND
                (displayAdapterLuid.HighPart = rhs.displayAdapterLuid.HighPart) AND
                (renderAdapterLuid.LowPart = rhs.renderAdapterLuid.LowPart)   AND
                (renderAdapterLuid.HighPart = rhs.renderAdapterLuid.HighPart) AND
                (vidPnSourceId = rhs.vidPnSourceId)                           AND
                (vidPnTargetId = rhs.vidPnTargetId)                           AND
                ((uniqueId = rhs.uniqueId) OR (uniqueId = 0) OR (rhs.uniqueId = 0));
  end;

end.
