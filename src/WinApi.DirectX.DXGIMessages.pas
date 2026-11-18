// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: WinApi.DirectX - DXGI
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.DirectX.DXGIMessages.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 27-02-2020
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: DXGI Debug Message Enumeration.
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
// Source: DXGIMessages.h
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
unit WinApi.DirectX.DXGIMessages;

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

// #if NTDDI_VERSION >= NTDDI_WIN7

type
  PDXGI_Message_Id = ^DXGI_Message_Id;
  PDXGIMessageId = PDXGI_Message_Id;
  PPDXGI_Message_Id = ^PDXGI_Message_Id;
  DXGI_Message_Id = DWord;
const
  DXGI_MSG_IDXGISwapChain_CreationOrResizeBuffers_InvalidOutputWindow = DXGI_Message_Id(0);
  DXGI_MSG_IDXGISwapChain_CreationOrResizeBuffers_BufferWidthInferred = DXGI_Message_Id(1);
  DXGI_MSG_IDXGISwapChain_CreationOrResizeBuffers_BufferHeightInferred = DXGI_Message_Id(2);
  DXGI_MSG_IDXGISwapChain_CreationOrResizeBuffers_NoScanoutFlagChanged = DXGI_Message_Id(3);
  DXGI_MSG_IDXGISwapChain_Creation_MaxBufferCountExceeded = DXGI_Message_Id(4);
  DXGI_MSG_IDXGISwapChain_Creation_TooFewBuffers = DXGI_Message_Id(5);
  DXGI_MSG_IDXGISwapChain_Creation_NoOutputWindow = DXGI_Message_Id(6);
  DXGI_MSG_IDXGISwapChain_Destruction_OtherMethodsCalled = DXGI_Message_Id(7);
  DXGI_MSG_IDXGISwapChain_GetDesc_pDescIsNULL = DXGI_Message_Id(8);
  DXGI_MSG_IDXGISwapChain_GetBuffer_ppSurfaceIsNULL = DXGI_Message_Id(9);
  DXGI_MSG_IDXGISwapChain_GetBuffer_NoAllocatedBuffers = DXGI_Message_Id(10);
  DXGI_MSG_IDXGISwapChain_GetBuffer_iBufferMustBeZero = DXGI_Message_Id(11);
  DXGI_MSG_IDXGISwapChain_GetBuffer_iBufferOOB = DXGI_Message_Id(12);
  DXGI_MSG_IDXGISwapChain_GetContainingOutput_ppOutputIsNULL = DXGI_Message_Id(13);
  DXGI_MSG_IDXGISwapChain_Present_SyncIntervalOOB = DXGI_Message_Id(14);
  DXGI_MSG_IDXGISwapChain_Present_InvalidNonPreRotatedFlag = DXGI_Message_Id(15);
  DXGI_MSG_IDXGISwapChain_Present_NoAllocatedBuffers = DXGI_Message_Id(16);
  DXGI_MSG_IDXGISwapChain_Present_GetDXGIAdapterFailed = DXGI_Message_Id(17);
  DXGI_MSG_IDXGISwapChain_ResizeBuffers_BufferCountOOB = DXGI_Message_Id(18);
  DXGI_MSG_IDXGISwapChain_ResizeBuffers_UnreleasedReferences = DXGI_Message_Id(19);
  DXGI_MSG_IDXGISwapChain_ResizeBuffers_InvalidSwapChainFlag = DXGI_Message_Id(20);
  DXGI_MSG_IDXGISwapChain_ResizeBuffers_InvalidNonPreRotatedFlag = DXGI_Message_Id(21);
  DXGI_MSG_IDXGISwapChain_ResizeTarget_RefreshRateDivideByZero = DXGI_Message_Id(22);
  DXGI_MSG_IDXGISwapChain_SetFullscreenState_InvalidTarget = DXGI_Message_Id(23);
  DXGI_MSG_IDXGISwapChain_GetFrameStatistics_pStatsIsNULL = DXGI_Message_Id(24);
  DXGI_MSG_IDXGISwapChain_GetLastPresentCount_pLastPresentCountIsNULL = DXGI_Message_Id(25);
  DXGI_MSG_IDXGISwapChain_SetFullscreenState_RemoteNotSupported = DXGI_Message_Id(26);
  DXGI_MSG_IDXGIOutput_TakeOwnership_FailedToAcquireFullscreenMutex = DXGI_Message_Id(27);
  DXGI_MSG_IDXGIFactory_CreateSoftwareAdapter_ppAdapterInterfaceIsNULL = DXGI_Message_Id(28);
  DXGI_MSG_IDXGIFactory_EnumAdapters_ppAdapterInterfaceIsNULL = DXGI_Message_Id(29);
  DXGI_MSG_IDXGIFactory_CreateSwapChain_ppSwapChainIsNULL = DXGI_Message_Id(30);
  DXGI_MSG_IDXGIFactory_CreateSwapChain_pDescIsNULL = DXGI_Message_Id(31);
  DXGI_MSG_IDXGIFactory_CreateSwapChain_UnknownSwapEffect = DXGI_Message_Id(32);
  DXGI_MSG_IDXGIFactory_CreateSwapChain_InvalidFlags = DXGI_Message_Id(33);
  DXGI_MSG_IDXGIFactory_CreateSwapChain_NonPreRotatedFlagAndWindowed = DXGI_Message_Id(34);
  DXGI_MSG_IDXGIFactory_CreateSwapChain_NullDeviceInterface = DXGI_Message_Id(35);
  DXGI_MSG_IDXGIFactory_GetWindowAssociation_phWndIsNULL = DXGI_Message_Id(36);
  DXGI_MSG_IDXGIFactory_MakeWindowAssociation_InvalidFlags = DXGI_Message_Id(37);
  DXGI_MSG_IDXGISurface_Map_InvalidSurface = DXGI_Message_Id(38);
  DXGI_MSG_IDXGISurface_Map_FlagsSetToZero = DXGI_Message_Id(39);
  DXGI_MSG_IDXGISurface_Map_DiscardAndReadFlagSet = DXGI_Message_Id(40);
  DXGI_MSG_IDXGISurface_Map_DiscardButNotWriteFlagSet = DXGI_Message_Id(41);
  DXGI_MSG_IDXGISurface_Map_NoCPUAccess = DXGI_Message_Id(42);
  DXGI_MSG_IDXGISurface_Map_ReadFlagSetButCPUAccessIsDynamic = DXGI_Message_Id(43);
  DXGI_MSG_IDXGISurface_Map_DiscardFlagSetButCPUAccessIsNotDynamic = DXGI_Message_Id(44);
  DXGI_MSG_IDXGIOutput_GetDisplayModeList_pNumModesIsNULL = DXGI_Message_Id(45);
  DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_ModeHasInvalidWidthOrHeight = DXGI_Message_Id(46);
  DXGI_MSG_IDXGIOutput_GetCammaControlCapabilities_NoOwnerDevice = DXGI_Message_Id(47);
  DXGI_MSG_IDXGIOutput_TakeOwnership_pDeviceIsNULL = DXGI_Message_Id(48);
  DXGI_MSG_IDXGIOutput_GetDisplaySurfaceData_NoOwnerDevice = DXGI_Message_Id(49);
  DXGI_MSG_IDXGIOutput_GetDisplaySurfaceData_pDestinationIsNULL = DXGI_Message_Id(50);
  DXGI_MSG_IDXGIOutput_GetDisplaySurfaceData_MapOfDestinationFailed = DXGI_Message_Id(51);
  DXGI_MSG_IDXGIOutput_GetFrameStatistics_NoOwnerDevice = DXGI_Message_Id(52);
  DXGI_MSG_IDXGIOutput_GetFrameStatistics_pStatsIsNULL = DXGI_Message_Id(53);
  DXGI_MSG_IDXGIOutput_SetGammaControl_NoOwnerDevice = DXGI_Message_Id(54);
  DXGI_MSG_IDXGIOutput_GetGammaControl_NoOwnerDevice = DXGI_Message_Id(55);
  DXGI_MSG_IDXGIOutput_GetGammaControl_NoGammaControls = DXGI_Message_Id(56);
  DXGI_MSG_IDXGIOutput_SetDisplaySurface_IDXGIResourceNotSupportedBypPrimary = DXGI_Message_Id(57);
  DXGI_MSG_IDXGIOutput_SetDisplaySurface_pPrimaryIsInvalid = DXGI_Message_Id(58);
  DXGI_MSG_IDXGIOutput_SetDisplaySurface_NoOwnerDevice = DXGI_Message_Id(59);
  DXGI_MSG_IDXGIOutput_TakeOwnership_RemoteDeviceNotSupported = DXGI_Message_Id(60);
  DXGI_MSG_IDXGIOutput_GetDisplayModeList_RemoteDeviceNotSupported = DXGI_Message_Id(61);
  DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_RemoteDeviceNotSupported = DXGI_Message_Id(62);
  DXGI_MSG_IDXGIDevice_CreateSurface_InvalidParametersWithpSharedResource = DXGI_Message_Id(63);
  DXGI_MSG_IDXGIObject_GetPrivateData_puiDataSizeIsNULL = DXGI_Message_Id(64);
  DXGI_MSG_IDXGISwapChain_Creation_InvalidOutputWindow = DXGI_Message_Id(65);
  DXGI_MSG_IDXGISwapChain_Release_SwapChainIsFullscreen = DXGI_Message_Id(66);
  DXGI_MSG_IDXGIOutput_GetDisplaySurfaceData_InvalidTargetSurfaceFormat = DXGI_Message_Id(67);
  DXGI_MSG_IDXGIFactory_CreateSoftwareAdapter_ModuleIsNULL = DXGI_Message_Id(68);
  DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_IDXGIDeviceNotSupportedBypConcernedDevice = DXGI_Message_Id(69);
  DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_pModeToMatchOrpClosestMatchIsNULL = DXGI_Message_Id(70);
  DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_ModeHasRefreshRateDenominatorZero = DXGI_Message_Id(71);
  DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_UnknownFormatIsInvalidForConfiguration = DXGI_Message_Id(72);
  DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_InvalidDisplayModeScanlineOrdering = DXGI_Message_Id(73);
  DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_InvalidDisplayModeScaling = DXGI_Message_Id(74);
  DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_InvalidDisplayModeFormatAndDeviceCombination = DXGI_Message_Id(75);
  DXGI_MSG_IDXGIFactory_Creation_CalledFromDllMain = DXGI_Message_Id(76);
  DXGI_MSG_IDXGISwapChain_SetFullscreenState_OutputNotOwnedBySwapChainDevice = DXGI_Message_Id(77);
  DXGI_MSG_IDXGISwapChain_Creation_InvalidWindowStyle = DXGI_Message_Id(78);
  DXGI_MSG_IDXGISwapChain_GetFrameStatistics_UnsupportedStatistics = DXGI_Message_Id(79);
  DXGI_MSG_IDXGISwapChain_GetContainingOutput_SwapchainAdapterDoesNotControlOutput = DXGI_Message_Id(80);
  DXGI_MSG_IDXGIOutput_SetOrGetGammaControl_pArrayIsNULL = DXGI_Message_Id(81);
  DXGI_MSG_IDXGISwapChain_SetFullscreenState_FullscreenInvalidForChildWindows = DXGI_Message_Id(82);
  DXGI_MSG_IDXGIFactory_Release_CalledFromDllMain = DXGI_Message_Id(83);
  DXGI_MSG_IDXGISwapChain_Present_UnreleasedHDC = DXGI_Message_Id(84);
  DXGI_MSG_IDXGISwapChain_ResizeBuffers_NonPreRotatedAndGDICompatibleFlags = DXGI_Message_Id(85);
  DXGI_MSG_IDXGIFactory_CreateSwapChain_NonPreRotatedAndGDICompatibleFlags = DXGI_Message_Id(86);
  DXGI_MSG_IDXGISurface1_GetDC_pHdcIsNULL = DXGI_Message_Id(87);
  DXGI_MSG_IDXGISurface1_GetDC_SurfaceNotTexture2D = DXGI_Message_Id(88);
  DXGI_MSG_IDXGISurface1_GetDC_GDICompatibleFlagNotSet = DXGI_Message_Id(89);
  DXGI_MSG_IDXGISurface1_GetDC_UnreleasedHDC = DXGI_Message_Id(90);
  DXGI_MSG_IDXGISurface_Map_NoCPUAccess2 = DXGI_Message_Id(91);
  DXGI_MSG_IDXGISurface1_ReleaseDC_GetDCNotCalled = DXGI_Message_Id(92);
  DXGI_MSG_IDXGISurface1_ReleaseDC_InvalidRectangleDimensions = DXGI_Message_Id(93);
  DXGI_MSG_IDXGIOutput_TakeOwnership_RemoteOutputNotSupported = DXGI_Message_Id(94);
  DXGI_MSG_IDXGIOutput_FindClosestMatchingMode_RemoteOutputNotSupported = DXGI_Message_Id(95);
  DXGI_MSG_IDXGIOutput_GetDisplayModeList_RemoteOutputNotSupported = DXGI_Message_Id(96);
  DXGI_MSG_IDXGIFactory_CreateSwapChain_pDeviceHasMismatchedDXGIFactory = DXGI_Message_Id(97);
  DXGI_MSG_IDXGISwapChain_Present_NonOptimalFSConfiguration = DXGI_Message_Id(98);
  DXGI_MSG_IDXGIFactory_CreateSwapChain_FlipSequentialNotSupportedOnD3D10 = DXGI_Message_Id(99);
  DXGI_MSG_IDXGIFactory_CreateSwapChain_BufferCountOOBForFlipSequential = DXGI_Message_Id(100);
  DXGI_MSG_IDXGIFactory_CreateSwapChain_InvalidFormatForFlipSequential = DXGI_Message_Id(101);
  DXGI_MSG_IDXGIFactory_CreateSwapChain_MultiSamplingNotSupportedForFlipSequential = DXGI_Message_Id(102);
  DXGI_MSG_IDXGISwapChain_ResizeBuffers_BufferCountOOBForFlipSequential = DXGI_Message_Id(103);
  DXGI_MSG_IDXGISwapChain_ResizeBuffers_InvalidFormatForFlipSequential = DXGI_Message_Id(104);
  DXGI_MSG_IDXGISwapChain_Present_PartialPresentationBeforeStandardPresentation = DXGI_Message_Id(105);
  DXGI_MSG_IDXGISwapChain_Present_FullscreenPartialPresentIsInvalid = DXGI_Message_Id(106);
  DXGI_MSG_IDXGISwapChain_Present_InvalidPresentTestOrDoNotSequenceFlag = DXGI_Message_Id(107);
  DXGI_MSG_IDXGISwapChain_Present_ScrollInfoWithNoDirtyRectsSpecified = DXGI_Message_Id(108);
  DXGI_MSG_IDXGISwapChain_Present_EmptyScrollRect = DXGI_Message_Id(109);
  DXGI_MSG_IDXGISwapChain_Present_ScrollRectOutOfBackbufferBounds = DXGI_Message_Id(110);
  DXGI_MSG_IDXGISwapChain_Present_ScrollRectOutOfBackbufferBoundsWithOffset = DXGI_Message_Id(111);
  DXGI_MSG_IDXGISwapChain_Present_EmptyDirtyRect = DXGI_Message_Id(112);
  DXGI_MSG_IDXGISwapChain_Present_DirtyRectOutOfBackbufferBounds = DXGI_Message_Id(113);
  DXGI_MSG_IDXGIFactory_CreateSwapChain_UnsupportedBufferUsageFlags = DXGI_Message_Id(114);
  DXGI_MSG_IDXGISwapChain_Present_DoNotSequenceFlagSetButPreviousBufferIsUndefined = DXGI_Message_Id(115);
  DXGI_MSG_IDXGISwapChain_Present_UnsupportedFlags = DXGI_Message_Id(116);
  DXGI_MSG_IDXGISwapChain_Present_FlipModelChainMustResizeOrCreateOnFSTransition = DXGI_Message_Id(117);
  DXGI_MSG_IDXGIFactory_CreateSwapChain_pRestrictToOutputFromOtherIDXGIFactory = DXGI_Message_Id(118);
  DXGI_MSG_IDXGIFactory_CreateSwapChain_RestrictOutputNotSupportedOnAdapter = DXGI_Message_Id(119);
  DXGI_MSG_IDXGISwapChain_Present_RestrictToOutputFlagSetButInvalidpRestrictToOutput = DXGI_Message_Id(120);
  DXGI_MSG_IDXGISwapChain_Present_RestrictToOutputFlagdWithFullscreen = DXGI_Message_Id(121);
  DXGI_MSG_IDXGISwapChain_Present_RestrictOutputFlagWithStaleSwapChain = DXGI_Message_Id(122);
  DXGI_MSG_IDXGISwapChain_Present_OtherFlagsCausingInvalidPresentTestFlag = DXGI_Message_Id(123);
  DXGI_MSG_IDXGIFactory_CreateSwapChain_UnavailableInSession0 = DXGI_Message_Id(124);
  DXGI_MSG_IDXGIFactory_MakeWindowAssociation_UnavailableInSession0 = DXGI_Message_Id(125);
  DXGI_MSG_IDXGIFactory_GetWindowAssociation_UnavailableInSession0 = DXGI_Message_Id(126);
  DXGI_MSG_IDXGIAdapter_EnumOutputs_UnavailableInSession0 = DXGI_Message_Id(127);
  DXGI_MSG_IDXGISwapChain_CreationOrSetFullscreenState_StereoDisabled = DXGI_Message_Id(128);
  DXGI_MSG_IDXGIFactory2_UnregisterStatus_CookieNotFound = DXGI_Message_Id(129);
  DXGI_MSG_IDXGISwapChain_Present_ProtectedContentInWindowedModeWithoutFSOrOverlay = DXGI_Message_Id(130);
  DXGI_MSG_IDXGISwapChain_Present_ProtectedContentInWindowedModeWithoutFlipSequential = DXGI_Message_Id(131);
  DXGI_MSG_IDXGISwapChain_Present_ProtectedContentWithRDPDriver = DXGI_Message_Id(132);
  DXGI_MSG_IDXGISwapChain_Present_ProtectedContentInWindowedModeWithDWMOffOrInvalidDisplayAffinity = DXGI_Message_Id(133);
  DXGI_MSG_IDXGIFactory_CreateSwapChainForComposition_WidthOrHeightIsZero = DXGI_Message_Id(134);
  DXGI_MSG_IDXGIFactory_CreateSwapChainForComposition_OnlyFlipSequentialSupported = DXGI_Message_Id(135);
  DXGI_MSG_IDXGIFactory_CreateSwapChainForComposition_UnsupportedOnAdapter = DXGI_Message_Id(136);
  DXGI_MSG_IDXGIFactory_CreateSwapChainForComposition_UnsupportedOnWindows7 = DXGI_Message_Id(137);
  DXGI_MSG_IDXGISwapChain_SetFullscreenState_FSTransitionWithCompositionSwapChain = DXGI_Message_Id(138);
  DXGI_MSG_IDXGISwapChain_ResizeTarget_InvalidWithCompositionSwapChain = DXGI_Message_Id(139);
  DXGI_MSG_IDXGISwapChain_ResizeBuffers_WidthOrHeightIsZero = DXGI_Message_Id(140);
  DXGI_MSG_IDXGIFactory_CreateSwapChain_ScalingNoneIsFlipModelOnly = DXGI_Message_Id(141);
  DXGI_MSG_IDXGIFactory_CreateSwapChain_ScalingUnrecognized = DXGI_Message_Id(142);
  DXGI_MSG_IDXGIFactory_CreateSwapChain_DisplayOnlyFullscreenUnsupported = DXGI_Message_Id(143);
  DXGI_MSG_IDXGIFactory_CreateSwapChain_DisplayOnlyUnsupported = DXGI_Message_Id(144);
  DXGI_MSG_IDXGISwapChain_Present_RestartIsFullscreenOnly = DXGI_Message_Id(145);
  DXGI_MSG_IDXGISwapChain_Present_ProtectedWindowlessPresentationRequiresDisplayOnly = DXGI_Message_Id(146);
  DXGI_MSG_IDXGISwapChain_SetFullscreenState_DisplayOnlyUnsupported = DXGI_Message_Id(147);
  DXGI_MSG_IDXGISwapChain1_SetBackgroundColor_OutOfRange = DXGI_Message_Id(148);
  DXGI_MSG_IDXGISwapChain_ResizeBuffers_DisplayOnlyFullscreenUnsupported = DXGI_Message_Id(149);
  DXGI_MSG_IDXGISwapChain_ResizeBuffers_DisplayOnlyUnsupported = DXGI_Message_Id(150);
  DXGI_MSG_IDXGISwapchain_Present_ScrollUnsupported = DXGI_Message_Id(151);
  DXGI_MSG_IDXGISwapChain1_SetRotation_UnsupportedOS = DXGI_Message_Id(152);
  DXGI_MSG_IDXGISwapChain1_GetRotation_UnsupportedOS = DXGI_Message_Id(153);
  DXGI_MSG_IDXGISwapchain_Present_FullscreenRotation = DXGI_Message_Id(154);
  DXGI_MSG_IDXGISwapChain_Present_PartialPresentationWithMSAABuffers = DXGI_Message_Id(155);
  DXGI_MSG_IDXGISwapChain1_SetRotation_FlipSequentialRequired = DXGI_Message_Id(156);
  DXGI_MSG_IDXGISwapChain1_SetRotation_InvalidRotation = DXGI_Message_Id(157);
  DXGI_MSG_IDXGISwapChain1_GetRotation_FlipSequentialRequired = DXGI_Message_Id(158);
  DXGI_MSG_IDXGISwapChain_GetHwnd_WrongType = DXGI_Message_Id(159);
  DXGI_MSG_IDXGISwapChain_GetCompositionSurface_WrongType = DXGI_Message_Id(160);
  DXGI_MSG_IDXGISwapChain_GetCoreWindow_WrongType = DXGI_Message_Id(161);
  DXGI_MSG_IDXGISwapChain_GetFullscreenDesc_NonHwnd = DXGI_Message_Id(162);
  DXGI_MSG_IDXGISwapChain_SetFullscreenState_CoreWindow = DXGI_Message_Id(163);
  DXGI_MSG_IDXGIFactory2_CreateSwapChainForCoreWindow_UnsupportedOnWindows7 = DXGI_Message_Id(164);
  DXGI_MSG_IDXGIFactory2_CreateSwapChainForCoreWindow_pWindowIsNULL = DXGI_Message_Id(165);
  DXGI_MSG_IDXGIFactory_CreateSwapChain_FSUnsupportedForModernApps = DXGI_Message_Id(166);
  DXGI_MSG_IDXGIFactory_MakeWindowAssociation_ModernApp = DXGI_Message_Id(167);
  DXGI_MSG_IDXGISwapChain_ResizeTarget_ModernApp = DXGI_Message_Id(168);
  DXGI_MSG_IDXGISwapChain_ResizeTarget_pNewTargetParametersIsNULL = DXGI_Message_Id(169);
  DXGI_MSG_IDXGIOutput_SetDisplaySurface_ModernApp = DXGI_Message_Id(170);
  DXGI_MSG_IDXGIOutput_TakeOwnership_ModernApp = DXGI_Message_Id(171);
  DXGI_MSG_IDXGIFactory2_CreateSwapChainForCoreWindow_pWindowIsInvalid = DXGI_Message_Id(172);
  DXGI_MSG_IDXGIFactory2_CreateSwapChainForCompositionSurface_InvalidHandle = DXGI_Message_Id(173);
  DXGI_MSG_IDXGISurface1_GetDC_ModernApp = DXGI_Message_Id(174);
  DXGI_MSG_IDXGIFactory_CreateSwapChain_ScalingNoneRequiresWindows8OrNewer = DXGI_Message_Id(175);
  DXGI_MSG_IDXGISwapChain_Present_TemporaryMonoAndPreferRight = DXGI_Message_Id(176);
  DXGI_MSG_IDXGISwapChain_Present_TemporaryMonoOrPreferRightWithDoNotSequence = DXGI_Message_Id(177);
  DXGI_MSG_IDXGISwapChain_Present_TemporaryMonoOrPreferRightWithoutStereo = DXGI_Message_Id(178);
  DXGI_MSG_IDXGISwapChain_Present_TemporaryMonoUnsupported = DXGI_Message_Id(179);
  DXGI_MSG_IDXGIOutput_GetDisplaySurfaceData_ArraySizeMismatch = DXGI_Message_Id(180);
  DXGI_MSG_IDXGISwapChain_Present_PartialPresentationWithSwapEffectDiscard = DXGI_Message_Id(181);
  DXGI_MSG_IDXGIFactory_CreateSwapChain_AlphaUnrecognized = DXGI_Message_Id(182);
  DXGI_MSG_IDXGIFactory_CreateSwapChain_AlphaIsWindowlessOnly = DXGI_Message_Id(183);
  DXGI_MSG_IDXGIFactory_CreateSwapChain_AlphaIsFlipModelOnly = DXGI_Message_Id(184);
  DXGI_MSG_IDXGIFactory_CreateSwapChain_RestrictToOutputAdapterMismatch = DXGI_Message_Id(185);
  DXGI_MSG_IDXGIFactory_CreateSwapChain_DisplayOnlyOnLegacy = DXGI_Message_Id(186);
  DXGI_MSG_IDXGISwapChain_ResizeBuffers_DisplayOnlyOnLegacy = DXGI_Message_Id(187);
  DXGI_MSG_IDXGIResource1_CreateSubresourceSurface_InvalidIndex = DXGI_Message_Id(188);
  DXGI_MSG_IDXGIFactory_CreateSwapChainForComposition_InvalidScaling = DXGI_Message_Id(189);
  DXGI_MSG_IDXGIFactory_CreateSwapChainForCoreWindow_InvalidSwapEffect = DXGI_Message_Id(190);
  DXGI_MSG_IDXGIResource1_CreateSharedHandle_UnsupportedOS = DXGI_Message_Id(191);
  DXGI_MSG_IDXGIFactory2_RegisterOcclusionStatusWindow_UnsupportedOS = DXGI_Message_Id(192);
  DXGI_MSG_IDXGIFactory2_RegisterOcclusionStatusEvent_UnsupportedOS = DXGI_Message_Id(193);
  DXGI_MSG_IDXGIOutput1_DuplicateOutput_UnsupportedOS = DXGI_Message_Id(194);
  DXGI_MSG_IDXGIDisplayControl_IsStereoEnabled_UnsupportedOS = DXGI_Message_Id(195);
  DXGI_MSG_IDXGIFactory_CreateSwapChainForComposition_InvalidAlphaMode = DXGI_Message_Id(196);
  DXGI_MSG_IDXGIFactory_GetSharedResourceAdapterLuid_InvalidResource = DXGI_Message_Id(197);
  DXGI_MSG_IDXGIFactory_GetSharedResourceAdapterLuid_InvalidLUID = DXGI_Message_Id(198);
  DXGI_MSG_IDXGIFactory_GetSharedResourceAdapterLuid_UnsupportedOS = DXGI_Message_Id(199);
  DXGI_MSG_IDXGIOutput1_GetDisplaySurfaceData1_2DOnly = DXGI_Message_Id(200);
  DXGI_MSG_IDXGIOutput1_GetDisplaySurfaceData1_StagingOnly = DXGI_Message_Id(201);
  DXGI_MSG_IDXGIOutput1_GetDisplaySurfaceData1_NeedCPUAccessWrite = DXGI_Message_Id(202);
  DXGI_MSG_IDXGIOutput1_GetDisplaySurfaceData1_NoShared = DXGI_Message_Id(203);
  DXGI_MSG_IDXGIOutput1_GetDisplaySurfaceData1_OnlyMipLevels1 = DXGI_Message_Id(204);
  DXGI_MSG_IDXGIOutput1_GetDisplaySurfaceData1_MappedOrOfferedResource = DXGI_Message_Id(205);
  DXGI_MSG_IDXGISwapChain_SetFullscreenState_FSUnsupportedForModernApps = DXGI_Message_Id(206);
  DXGI_MSG_IDXGIFactory_CreateSwapChain_FailedToGoFSButNonPreRotated = DXGI_Message_Id(207);
  DXGI_MSG_IDXGIFactory_CreateSwapChainOrRegisterOcclusionStatus_BlitModelUsedWhileRegisteredForOcclusionStatusEvents = DXGI_Message_Id(208);
  DXGI_MSG_IDXGISwapChain_Present_BlitModelUsedWhileRegisteredForOcclusionStatusEvents = DXGI_Message_Id(209);
  DXGI_MSG_IDXGIFactory_CreateSwapChain_WaitableSwapChainsAreFlipModelOnly = DXGI_Message_Id(210);
  DXGI_MSG_IDXGIFactory_CreateSwapChain_WaitableSwapChainsAreNotFullscreen = DXGI_Message_Id(211);
  DXGI_MSG_IDXGISwapChain_SetFullscreenState_Waitable = DXGI_Message_Id(212);
  DXGI_MSG_IDXGISwapChain_ResizeBuffers_CannotAddOrRemoveWaitableFlag = DXGI_Message_Id(213);
  DXGI_MSG_IDXGISwapChain_GetFrameLatencyWaitableObject_OnlyWaitable = DXGI_Message_Id(214);
  DXGI_MSG_IDXGISwapChain_GetMaximumFrameLatency_OnlyWaitable = DXGI_Message_Id(215);
  DXGI_MSG_IDXGISwapChain_GetMaximumFrameLatency_pMaxLatencyIsNULL = DXGI_Message_Id(216);
  DXGI_MSG_IDXGISwapChain_SetMaximumFrameLatency_OnlyWaitable = DXGI_Message_Id(217);
  DXGI_MSG_IDXGISwapChain_SetMaximumFrameLatency_MaxLatencyIsOutOfBounds = DXGI_Message_Id(218);
  DXGI_MSG_IDXGIFactory_CreateSwapChain_ForegroundIsCoreWindowOnly = DXGI_Message_Id(219);
  DXGI_MSG_IDXGIFactory2_CreateSwapChainForCoreWindow_ForegroundUnsupportedOnAdapter = DXGI_Message_Id(220);
  DXGI_MSG_IDXGIFactory2_CreateSwapChainForCoreWindow_InvalidScaling = DXGI_Message_Id(221);
  DXGI_MSG_IDXGIFactory2_CreateSwapChainForCoreWindow_InvalidAlphaMode = DXGI_Message_Id(222);
  DXGI_MSG_IDXGISwapChain_ResizeBuffers_CannotAddOrRemoveForegroundFlag = DXGI_Message_Id(223);
  DXGI_MSG_IDXGISwapChain_SetMatrixTransform_MatrixPointerCannotBeNull = DXGI_Message_Id(224);
  DXGI_MSG_IDXGISwapChain_SetMatrixTransform_RequiresCompositionSwapChain = DXGI_Message_Id(225);
  DXGI_MSG_IDXGISwapChain_SetMatrixTransform_MatrixMustBeFinite = DXGI_Message_Id(226);
  DXGI_MSG_IDXGISwapChain_SetMatrixTransform_MatrixMustBeTranslateAndOrScale = DXGI_Message_Id(227);
  DXGI_MSG_IDXGISwapChain_GetMatrixTransform_MatrixPointerCannotBeNull = DXGI_Message_Id(228);
  DXGI_MSG_IDXGISwapChain_GetMatrixTransform_RequiresCompositionSwapChain = DXGI_Message_Id(229);
  DXGI_MSG_DXGIGetDebugInterface1_NULL_ppDebug = DXGI_Message_Id(230);
  DXGI_MSG_DXGIGetDebugInterface1_InvalidFlags = DXGI_Message_Id(231);
  DXGI_MSG_IDXGISwapChain_Present_Decode = DXGI_Message_Id(232);
  DXGI_MSG_IDXGISwapChain_ResizeBuffers_Decode = DXGI_Message_Id(233);
  DXGI_MSG_IDXGISwapChain_SetSourceSize_FlipModel = DXGI_Message_Id(234);
  DXGI_MSG_IDXGISwapChain_SetSourceSize_Decode = DXGI_Message_Id(235);
  DXGI_MSG_IDXGISwapChain_SetSourceSize_WidthHeight = DXGI_Message_Id(236);
  DXGI_MSG_IDXGISwapChain_GetSourceSize_NullPointers = DXGI_Message_Id(237);
  DXGI_MSG_IDXGISwapChain_GetSourceSize_Decode = DXGI_Message_Id(238);
  DXGI_MSG_IDXGIDecodeSwapChain_SetColorSpace_InvalidFlags = DXGI_Message_Id(239);
  DXGI_MSG_IDXGIDecodeSwapChain_SetSourceRect_InvalidRect = DXGI_Message_Id(240);
  DXGI_MSG_IDXGIDecodeSwapChain_SetTargetRect_InvalidRect = DXGI_Message_Id(241);
  DXGI_MSG_IDXGIDecodeSwapChain_SetDestSize_InvalidSize = DXGI_Message_Id(242);
  DXGI_MSG_IDXGIDecodeSwapChain_GetSourceRect_InvalidPointer = DXGI_Message_Id(243);
  DXGI_MSG_IDXGIDecodeSwapChain_GetTargetRect_InvalidPointer = DXGI_Message_Id(244);
  DXGI_MSG_IDXGIDecodeSwapChain_GetDestSize_InvalidPointer = DXGI_Message_Id(245);
  DXGI_MSG_IDXGISwapChain_PresentBuffer_YUV = DXGI_Message_Id(246);
  DXGI_MSG_IDXGISwapChain_SetSourceSize_YUV = DXGI_Message_Id(247);
  DXGI_MSG_IDXGISwapChain_GetSourceSize_YUV = DXGI_Message_Id(248);
  DXGI_MSG_IDXGISwapChain_SetMatrixTransform_YUV = DXGI_Message_Id(249);
  DXGI_MSG_IDXGISwapChain_GetMatrixTransform_YUV = DXGI_Message_Id(250);
  DXGI_MSG_IDXGISwapChain_Present_PartialPresentation_YUV = DXGI_Message_Id(251);
  DXGI_MSG_IDXGISwapChain_ResizeBuffers_CannotAddOrRemoveFlag_YUV = DXGI_Message_Id(252);
  DXGI_MSG_IDXGISwapChain_ResizeBuffers_Alignment_YUV = DXGI_Message_Id(253);
  DXGI_MSG_IDXGIFactory_CreateSwapChain_ShaderInputUnsupported_YUV = DXGI_Message_Id(254);
  DXGI_MSG_IDXGIOutput3_CheckOverlaySupport_NullPointers = DXGI_Message_Id(255);
  DXGI_MSG_IDXGIOutput3_CheckOverlaySupport_IDXGIDeviceNotSupportedBypConcernedDevice = DXGI_Message_Id(256);
  DXGI_MSG_IDXGIAdapter_EnumOutputs2_InvalidEnumOutputs2Flag = DXGI_Message_Id(257);
  DXGI_MSG_IDXGISwapChain_CreationOrSetFullscreenState_FSUnsupportedForFlipDiscard = DXGI_Message_Id(258);
  DXGI_MSG_IDXGIOutput4_CheckOverlayColorSpaceSupport_NullPointers = DXGI_Message_Id(259);
  DXGI_MSG_IDXGIOutput4_CheckOverlayColorSpaceSupport_IDXGIDeviceNotSupportedBypConcernedDevice = DXGI_Message_Id(260);
  DXGI_MSG_IDXGISwapChain3_CheckColorSpaceSupport_NullPointers = DXGI_Message_Id(261);
  DXGI_MSG_IDXGISwapChain3_SetColorSpace1_InvalidColorSpace = DXGI_Message_Id(262);
  DXGI_MSG_IDXGIFactory_CreateSwapChain_InvalidHwProtect = DXGI_Message_Id(263);
  DXGI_MSG_IDXGIFactory_CreateSwapChain_HwProtectUnsupported = DXGI_Message_Id(264);
  DXGI_MSG_IDXGISwapChain_ResizeBuffers_InvalidHwProtect = DXGI_Message_Id(265);
  DXGI_MSG_IDXGISwapChain_ResizeBuffers_HwProtectUnsupported = DXGI_Message_Id(266);
  DXGI_MSG_IDXGISwapChain_ResizeBuffers1_D3D12Only = DXGI_Message_Id(267);
  DXGI_MSG_IDXGISwapChain_ResizeBuffers1_FlipModel = DXGI_Message_Id(268);
  DXGI_MSG_IDXGISwapChain_ResizeBuffers1_NodeMaskAndQueueRequired = DXGI_Message_Id(269);
  DXGI_MSG_IDXGISwapChain_CreateSwapChain_InvalidHwProtectGdiFlag = DXGI_Message_Id(270);
  DXGI_MSG_IDXGISwapChain_ResizeBuffers_InvalidHwProtectGdiFlag = DXGI_Message_Id(271);
  DXGI_MSG_IDXGIFactory_CreateSwapChain_10BitFormatNotSupported = DXGI_Message_Id(272);
  DXGI_MSG_IDXGIFactory_CreateSwapChain_FlipSwapEffectRequired = DXGI_Message_Id(273);
  DXGI_MSG_IDXGIFactory_CreateSwapChain_InvalidDevice = DXGI_Message_Id(274);
  DXGI_MSG_IDXGIOutput_TakeOwnership_Unsupported = DXGI_Message_Id(275);
  DXGI_MSG_IDXGIFactory_CreateSwapChain_InvalidQueue = DXGI_Message_Id(276);
  DXGI_MSG_IDXGISwapChain3_ResizeBuffers1_InvalidQueue = DXGI_Message_Id(277);
  DXGI_MSG_IDXGIFactory_CreateSwapChainForHwnd_InvalidScaling = DXGI_Message_Id(278);
  DXGI_MSG_IDXGISwapChain3_SetHDRMetaData_InvalidSize = DXGI_Message_Id(279);
  DXGI_MSG_IDXGISwapChain3_SetHDRMetaData_InvalidPointer = DXGI_Message_Id(280);
  DXGI_MSG_IDXGISwapChain3_SetHDRMetaData_InvalidType = DXGI_Message_Id(281);
  DXGI_MSG_IDXGISwapChain_Present_FullscreenAllowTearingIsInvalid = DXGI_Message_Id(282);
  DXGI_MSG_IDXGISwapChain_Present_AllowTearingRequiresPresentIntervalZero = DXGI_Message_Id(283);
  DXGI_MSG_IDXGISwapChain_Present_AllowTearingRequiresCreationFlag = DXGI_Message_Id(284);
  DXGI_MSG_IDXGISwapChain_ResizeBuffers_CannotAddOrRemoveAllowTearingFlag = DXGI_Message_Id(285);
  DXGI_MSG_IDXGIFactory_CreateSwapChain_AllowTearingFlagIsFlipModelOnly = DXGI_Message_Id(286);
  DXGI_MSG_IDXGIFactory_CheckFeatureSupport_InvalidFeature = DXGI_Message_Id(287);
  DXGI_MSG_IDXGIFactory_CheckFeatureSupport_InvalidSize = DXGI_Message_Id(288);
  DXGI_MSG_IDXGIOutput6_CheckHardwareCompositionSupport_NullPointer = DXGI_Message_Id(289);
  DXGI_MSG_IDXGISwapChain_SetFullscreenState_PerMonitorDpiShimApplied = DXGI_Message_Id(290);
  DXGI_MSG_IDXGIOutput_DuplicateOutput_PerMonitorDpiShimApplied = DXGI_Message_Id(291);
  DXGI_MSG_IDXGIOutput_DuplicateOutput1_PerMonitorDpiRequired = DXGI_Message_Id(292);
  DXGI_MSG_IDXGIFactory7_UnregisterAdaptersChangedEvent_CookieNotFound = DXGI_Message_Id(293);
  DXGI_MSG_IDXGIFactory_CreateSwapChain_LegacyBltModelSwapEffect = DXGI_Message_Id(294);
  DXGI_MSG_IDXGISwapChain4_SetHDRMetaData_MetadataUnchanged = DXGI_Message_Id(295);
  DXGI_MSG_IDXGISwapChain_Present_11On12_Released_Resource = DXGI_Message_Id(296);
  DXGI_MSG_IDXGIFactory_CreateSwapChain_MultipleSwapchainRefToSurface_DeferredDtr = DXGI_Message_Id(297);
  DXGI_MSG_IDXGIFactory_MakeWindowAssociation_NoOpBehavior = DXGI_Message_Id(298);

  { 10.0.28000.0  }
  DXGI_MSG_IDXGIFactory8_CreateSwapChain_InvalidColorSpaceFlag = DXGI_Message_Id(299);
  DXGI_MSG_IDXGIFactory8_CreateSwapChain_InvalidColorSpace = DXGI_Message_Id(300);
  DXGI_MSG_IDXGISwapChain5_ResizeBuffers2_InvalidColorSpace = DXGI_Message_Id(301);
  DXGI_MSG_IDXGISwapChain5_SetColorSpace1_Unsupported = DXGI_Message_Id(302);
  DXGI_MSG_IDXGIAdapter5_GetSingleAdapterHybridMode_Unsupported = DXGI_Message_Id(303);
  DXGI_MSG_IDXGIAdapter5_SetSingleAdapterHybridMode_Unsupported = DXGI_Message_Id(304);

  DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_NotForegroundWindow = DXGI_Message_Id(1000);
  DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_DISCARD_BufferCount = DXGI_Message_Id(1001);
  DXGI_MSG_Phone_IDXGISwapChain_SetFullscreenState_NotAvailable = DXGI_Message_Id(1002);
  DXGI_MSG_Phone_IDXGISwapChain_ResizeBuffers_NotAvailable = DXGI_Message_Id(1003);
  DXGI_MSG_Phone_IDXGISwapChain_ResizeTarget_NotAvailable = DXGI_Message_Id(1004);
  DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidLayerIndex = DXGI_Message_Id(1005);
  DXGI_MSG_Phone_IDXGISwapChain_Present_MultipleLayerIndex = DXGI_Message_Id(1006);
  DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidLayerFlag = DXGI_Message_Id(1007);
  DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidRotation = DXGI_Message_Id(1008);
  DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidBlend = DXGI_Message_Id(1009);
  DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidResource = DXGI_Message_Id(1010);
  DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidMultiPlaneOverlayResource = DXGI_Message_Id(1011);
  DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidIndexForPrimary = DXGI_Message_Id(1012);
  DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidIndexForOverlay = DXGI_Message_Id(1013);
  DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidSubResourceIndex = DXGI_Message_Id(1014);
  DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidSourceRect = DXGI_Message_Id(1015);
  DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidDestinationRect = DXGI_Message_Id(1016);
  DXGI_MSG_Phone_IDXGISwapChain_Present_MultipleResource = DXGI_Message_Id(1017);
  DXGI_MSG_Phone_IDXGISwapChain_Present_NotSharedResource = DXGI_Message_Id(1018);
  DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidFlag = DXGI_Message_Id(1019);
  DXGI_MSG_Phone_IDXGISwapChain_Present_InvalidInterval = DXGI_Message_Id(1020);
  DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_MSAA_NotSupported = DXGI_Message_Id(1021);
  DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_ScalingAspectRatioStretch_Supported_ModernApp = DXGI_Message_Id(1022);
  DXGI_MSG_Phone_IDXGISwapChain_GetFrameStatistics_NotAvailable_ModernApp = DXGI_Message_Id(1023);
  DXGI_MSG_Phone_IDXGISwapChain_Present_ReplaceInterval0With1 = DXGI_Message_Id(1024);
  DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_FailedRegisterWithCompositor = DXGI_Message_Id(1025);
  DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_NotForegroundWindow_AtRendering = DXGI_Message_Id(1026);
  DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_FLIP_SEQUENTIAL_BufferCount = DXGI_Message_Id(1027);
  DXGI_MSG_Phone_IDXGIFactory_CreateSwapChain_FLIP_Modern_CoreWindow_Only = DXGI_Message_Id(1028);
  DXGI_MSG_Phone_IDXGISwapChain_Present1_RequiresOverlays = DXGI_Message_Id(1029);
  DXGI_MSG_Phone_IDXGISwapChain_SetBackgroundColor_FlipSequentialRequired = DXGI_Message_Id(1030);
  DXGI_MSG_Phone_IDXGISwapChain_GetBackgroundColor_FlipSequentialRequired = DXGI_Message_Id(1031);

// #endif NTDDI_VERSION >= NTDDI_WIN7

  // Additional Prototypes for ALL interfaces

  // End of Additional Prototypes

implementation

  // Implement Additional functions here.

end.
