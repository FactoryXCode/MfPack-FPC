// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.MediaFoundationApi.MfObjects.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 29-06-2012
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: -
//
// Organisation: FactoryX
// Initiator(s): Tony (maXcomX), Peter (OzShips)
// Contributor(s): Tony Kalf (maXcomX), Peter Larson (ozships), (Ciaran), (TopPlay)
//
//------------------------------------------------------------------------------
// CHANGE LOG
// Date       Person              Reason
// ---------- ------------------- ----------------------------------------------
// 15/11/2026 All                 Eels release  SDK 10.0.28000.2705 (Windows 11)
//------------------------------------------------------------------------------
//
// Remarks: Requires Windows Vista or higher.
//
//         Using packed records is not a recommended practice,
//         because it can prevent compatibility with other languages or
//         platforms, it slows data access, and, in the case of a character array,
//         it affects type compatibility.
//         For more information, see Memory management and Implicit Packing of
//         Fields with a Common Type Specification.
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
// Source: mfobjects.h
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
unit WinApi.MediaFoundationApi.MfObjects;

{$I MfPack.Fpc.inc}


interface


uses

  {WinApi}
  Windows,
  WinApi.WinApiTypes,
  WinApi.WinMM.MMeApi,
  SysUtils,
  {ActiveX}
  WinApi.ActiveX.PropIdl,
  WinApi.ActiveX.ObjIdlbase;

  {$PACKENUM 4}

  {$IFDEF WIN32}
    {$ALIGN 1}
  {$ELSE}
  {$ALIGN 8}
  // Win64
  {$ENDIF}


  {$I 'WinApiTypes.inc'}

const
  MF_ATTRIBUTE_UINT32 = LongInt(VT_UI4);
  MF_ATTRIBUTE_UINT64 = LongInt(VT_UI8);
  MF_ATTRIBUTE_DOUBLE = LongInt(VT_R8);
  MF_ATTRIBUTE_GUID = LongInt(VT_CLSID);
  MF_ATTRIBUTE_STRING = LongInt(VT_LPWSTR);
  MF_ATTRIBUTE_BLOB = LongInt((VT_VECTOR or VT_UI1));
  MF_ATTRIBUTE_IUNKNOWN = LongInt(VT_UNKNOWN);
  MF2DBuffer_LockFlags_LockTypeMask = LongInt($1 or $2 or $3);
  MF2DBuffer_LockFlags_Read = LongInt($1);
  MF2DBuffer_LockFlags_Write = LongInt($2);
  MF2DBuffer_LockFlags_ReadWrite = LongInt($3);
  MF2DBuffer_LockFlags_ForceDWORD = LongInt($7FFFFFFF);


const

  // Interface IMFMediaType

  //
  // IsEqual flags
  //

  // For audio
  // Major type match = both are audio
  // Subtype match = format types match = iscompressed for both matches
  // Format_data match = format blocks match exactly

  // For video
  // Major type match = both are video
  // Sub type match = bit format for both are the same
  // Format type match = both of them have format blocks
  // Format_data match = both format blocks match exactly

  MF_MEDIATYPE_EQUAL_MAJOR_TYPES = $00000001;
  MF_MEDIATYPE_EQUAL_FORMAT_TYPES = $00000002;
  MF_MEDIATYPE_EQUAL_FORMAT_DATA = $00000004;
  MF_MEDIATYPE_EQUAL_FORMAT_USER_DATA = $00000008;

  // Interface IMFAsyncCallback

  //
  // Async callback flags
  //

  MFASYNC_FAST_IO_PROCESSING_CALLBACK = $00000001;
  MFASYNC_SIGNAL_CALLBACK = $00000002;
  MFASYNC_BLOCKING_CALLBACK = $00000004;
  MFASYNC_REPLY_CALLBACK = $00000008; // Callback will reply via IMFAsyncCallback in GetObject()
  MFASYNC_LOCALIZE_REMOTE_CALLBACK = $00000010; // The callback object is not apartment-agile and the callback pointer must be localized after an RPC

  //
  // Async callback invocation queue IDs
  //

  MFASYNC_CALLBACK_QUEUE_UNDEFINED = $00000000;
  MFASYNC_CALLBACK_QUEUE_STANDARD = $00000001;
  MFASYNC_CALLBACK_QUEUE_RT = $00000002;
  MFASYNC_CALLBACK_QUEUE_IO = $00000003;
  MFASYNC_CALLBACK_QUEUE_TIMER = $00000004;
  MFASYNC_CALLBACK_QUEUE_MULTITHREADED = $00000005;
  MFASYNC_CALLBACK_QUEUE_LONG_FUNCTION = $00000007;
  MFASYNC_CALLBACK_QUEUE_PRIVATE_MASK = $FFFF0000;
  MFASYNC_CALLBACK_QUEUE_ALL = MAXDW; // 0xFFFFFFFF

type
  // MediaEventType
  PMediaEventType = ^MediaEventType;
  MediaEventType = DWord;

const
  //-------------------------------------------------------------------------
  // generic events
  //-------------------------------------------------------------------------

  MEUnknown = MediaEventType(0);
  MEError = MediaEventType(1);
  MEExtendedType = MediaEventType(2);
  MENonFatalError = MediaEventType(3);
  MEGenericV1Anchor = MENonFatalError;

  //-------------------------------------------------------------------------
  // Media Session events:
  // Events of interest to applications using the Media Session
  //-------------------------------------------------------------------------

  MESessionUnknown = MediaEventType(100);
  MESessionTopologySet = MediaEventType(101);
  MESessionTopologiesCleared = MediaEventType(102);
  MESessionStarted = MediaEventType(103);
  MESessionPaused = MediaEventType(104);
  MESessionStopped = MediaEventType(105);
  MESessionClosed = MediaEventType(106);
  MESessionEnded = MediaEventType(107);
  MESessionRateChanged = MediaEventType(108);
  MESessionScrubSampleComplete = MediaEventType(109);
  MESessionCapabilitiesChanged = MediaEventType(110);
  MESessionTopologyStatus = MediaEventType(111);
  MESessionNotifyPresentationTime = MediaEventType(112);
  MENewPresentation = MediaEventType(113);
  MELicenseAcquisitionStart = MediaEventType(114);
  MELicenseAcquisitionCompleted = MediaEventType(115);
  MEIndividualizationStart = MediaEventType(116);
  MEIndividualizationCompleted = MediaEventType(117);
  MEEnablerProgress = MediaEventType(118);
  MEEnablerCompleted = MediaEventType(119);
  MEPolicyError = MediaEventType(120);
  MEPolicyReport = MediaEventType(121);
  MEBufferingStarted = MediaEventType(122);
  MEBufferingStopped = MediaEventType(123);
  MEConnectStart = MediaEventType(124);
  MEConnectEnd = MediaEventType(125);
  MEReconnectStart = MediaEventType(126);
  MEReconnectEnd = MediaEventType(127);
  MERendererEvent = MediaEventType(128);
  MESessionStreamSinkFormatChanged = MediaEventType(129);
  MESessionV1Anchor = MESessionStreamSinkFormatChanged;
  MESourceUnknown = MediaEventType(200);
  MESourceStarted = MediaEventType(201);
  MEStreamStarted = MediaEventType(202);
  MESourceSeeked = MediaEventType(203);
  MEStreamSeeked = MediaEventType(204);
  MENewStream = MediaEventType(205);
  MEUpdatedStream = MediaEventType(206);
  MESourceStopped = MediaEventType(207);
  MEStreamStopped = MediaEventType(208);
  MESourcePaused = MediaEventType(209);
  MEStreamPaused = MediaEventType(210);
  MEEndOfPresentation = MediaEventType(211);
  MEEndOfStream = MediaEventType(212);
  MEMediaSample = MediaEventType(213);  // Sent when a media stream delivers a new sample in response to a call to IMFMediaStream.RequestSample.
  MEStreamTick = MediaEventType(214);  // Signals that a media stream does not have data available at a specified time.
  MEStreamThinMode = MediaEventType(215);
  MEStreamFormatChanged = MediaEventType(216);
  MESourceRateChanged = MediaEventType(217);
  MEEndOfPresentationSegment = MediaEventType(218);
  MESourceCharacteristicsChanged = MediaEventType(219);
  MESourceRateChangeRequested = MediaEventType(220);
  MESourceMetadataChanged = MediaEventType(221);
  MESequencerSourceTopologyUpdated = MediaEventType(222);
  MESourceV1Anchor = MESequencerSourceTopologyUpdated;
  MESinkUnknown = MediaEventType(300);
  MEStreamSinkStarted = MediaEventType(301);
  MEStreamSinkStopped = MediaEventType(302);
  MEStreamSinkPaused = MediaEventType(303);
  MEStreamSinkRateChanged = MediaEventType(304);
  MEStreamSinkRequestSample = MediaEventType(305);
  MEStreamSinkMarker = MediaEventType(306);
  MEStreamSinkPrerolled = MediaEventType(307);
  MEStreamSinkScrubSampleComplete = MediaEventType(308);
  MEStreamSinkFormatChanged = MediaEventType(309);
  MEStreamSinkDeviceChanged = MediaEventType(310);
  MEQualityNotify = MediaEventType(311);
  MESinkInvalidated = MediaEventType(312);
  MEAudioSessionNameChanged = MediaEventType(313);
  MEAudioSessionVolumeChanged = MediaEventType(314);
  MEAudioSessionDeviceRemoved = MediaEventType(315);
  MEAudioSessionServerShutdown = MediaEventType(316);
  MEAudioSessionGroupingParamChanged = MediaEventType(317);
  MEAudioSessionIconChanged = MediaEventType(318);
  MEAudioSessionFormatChanged = MediaEventType(319);
  MEAudioSessionDisconnected = MediaEventType(320);
  MEAudioSessionExclusiveModeOverride = MediaEventType(321);
  MESinkV1Anchor = MEAudioSessionExclusiveModeOverride;
  MECaptureAudioSessionVolumeChanged = MediaEventType(322);
  MECaptureAudioSessionDeviceRemoved = MediaEventType(323);
  MECaptureAudioSessionFormatChanged = MediaEventType(324);
  MECaptureAudioSessionDisconnected = MediaEventType(325);
  MECaptureAudioSessionExclusiveModeOverride = MediaEventType(326);
  MECaptureAudioSessionServerShutdown = MediaEventType(327);
  MESinkV2Anchor = MECaptureAudioSessionServerShutdown;
  METrustUnknown = MediaEventType(400);
  MEPolicyChanged = MediaEventType(401);
  MEContentProtectionMessage = MediaEventType(402);
  MEPolicySet = MediaEventType(403);
  METrustV1Anchor = MEPolicySet;
  MEWMDRMLicenseBackupCompleted = MediaEventType(500);
  MEWMDRMLicenseBackupProgress = MediaEventType(501);
  MEWMDRMLicenseRestoreCompleted = MediaEventType(502);
  MEWMDRMLicenseRestoreProgress = MediaEventType(503);
  MEWMDRMLicenseAcquisitionCompleted = MediaEventType(506);
  MEWMDRMIndividualizationCompleted = MediaEventType(508);
  MEWMDRMIndividualizationProgress = MediaEventType(513);
  MEWMDRMProximityCompleted = MediaEventType(514);
  MEWMDRMLicenseStoreCleaned = MediaEventType(515);
  MEWMDRMRevocationDownloadCompleted = MediaEventType(516);
  MEWMDRMV1Anchor = MEWMDRMRevocationDownloadCompleted;
  METransformUnknown = MediaEventType(600);
  METransformNeedInput = METransformUnknown + 1;
  METransformHaveOutput = METransformNeedInput + 1;
  METransformDrainComplete = METransformHaveOutput + 1;
  METransformMarker = METransformDrainComplete + 1;
  METransformInputStreamStateChanged = METransformMarker + 1;
  MEByteStreamCharacteristicsChanged = MediaEventType(700);
  MEVideoCaptureDeviceRemoved = MediaEventType(800);
  MEVideoCaptureDevicePreempted = MediaEventType(801);
  MEStreamSinkFormatInvalidated = MediaEventType(802);
  MEEncodingParameters = MediaEventType(803);
  MEContentProtectionMetadata = MediaEventType(900);
  MEDeviceThermalStateChanged = MediaEventType(950);

  //-------------------------------------------------------------------------
  // MF reserves a range of events for internal and future use
  //-------------------------------------------------------------------------

  // <member name="MEReservedMax">
  //     All event type codes up to and including this value are
  //     reserved.
  // </member>
  MEReservedMax = MediaEventType(10000);



const
  // Interface IMFMediaEventGenerator
  MF_EVENT_FLAG_NO_WAIT = $00000001;

  // Interface IMFByteStream
  MFBYTESTREAM_IS_READABLE = $00000001;
  MFBYTESTREAM_IS_WRITABLE = $00000002;
  MFBYTESTREAM_IS_SEEKABLE = $00000004;
  MFBYTESTREAM_IS_REMOTE = $00000008;
  MFBYTESTREAM_IS_DIRECTORY = $00000080;
  MFBYTESTREAM_HAS_SLOW_SEEK = $00000100;
  MFBYTESTREAM_IS_PARTIALLY_DOWNLOADED = $00000200;

  MFBYTESTREAM_SHARE_WRITE = $00000400;    // (WINVER >= _WIN32_WINNT_WIN7)

  MFBYTESTREAM_DOES_NOT_USE_NETWORK = $00000800;    // (WINVER >= _WIN32_WINNT_WIN8)

  MFBYTESTREAM_SEEK_FLAG_CANCEL_PENDING_IO = $00000001;

  // Interface IMFByteStream

  //
  // Byte Stream attributes (query the Byte Stream for IMFAttributes)
  //

  MF_BYTESTREAM_ORIGIN_NAME: TGUID = '{fc358288-3cb6-460c-a424-b6681260375a}';
  MF_BYTESTREAM_CONTENT_TYPE: TGUID = '{fc358289-3cb6-460c-a424-b6681260375a}';
  MF_BYTESTREAM_DURATION: TGUID = '{fc35828a-3cb6-460c-a424-b6681260375a}';
  MF_BYTESTREAM_LAST_MODIFIED_TIME: TGUID = '{fc35828b-3cb6-460c-a424-b6681260375a}';

  // >= Windows 7
  //#if (WINVER >= _WIN32_WINNT_WIN7)
  MF_BYTESTREAM_IFO_FILE_URI: TGUID = '{fc35828c-3cb6-460c-a424-b6681260375a}';
  MF_BYTESTREAM_DLNA_PROFILE_ID: TGUID = '{fc35828d-3cb6-460c-a424-b6681260375a}';
  MF_BYTESTREAM_EFFECTIVE_URL: TGUID = '{9AFA0209-89D1-42AF-8456-1DE6B562D691}';
  MF_BYTESTREAM_TRANSCODED: TGUID = '{b6c5c282-4dc9-4db9-ab48-cf3b6d8bc5e0}';
  //#endif // (WINVER >= _WIN32_WINNT_WIN7)
  //end >= Windows 7


  CLSID_MFByteStreamProxyClassFactory: TGUID = '{770e8e77-4916-441c-a9a7-b342d0eebc71}';



  // Interface IMFByteStream
type
  QWORD = ULONGLONG;

  // PRGBQUAD = ^RGBQUAD;
  // RGBQUAD = DWORD;
  // RGBQUAD is defined ins Windows (Wingdi.h) and WinApi.WinApiTypes.pas
  // To store a RGBQUAD in a DWORD, use procedure CopyRGBQuadToClrRef in WinApi.MediaFoundationApi.MfUtils.pas

  PMF_ATTRIBUTE_TYPE = ^_MF_ATTRIBUTE_TYPE;
  _MF_ATTRIBUTE_TYPE = LongInt; // Windows 32-bit enum; aliases and SDK values are preserved.

  MF_ATTRIBUTE_TYPE = _MF_ATTRIBUTE_TYPE;


  PMF_ATTRIBUTES_MATCH_TYPE = ^_MF_ATTRIBUTES_MATCH_TYPE;
  _MF_ATTRIBUTES_MATCH_TYPE = (
    MF_ATTRIBUTES_MATCH_OUR_ITEMS = 0,    // do all of our items exist in their store and have identical data?
    MF_ATTRIBUTES_MATCH_THEIR_ITEMS = 1,    // do all of their items exist in our store and have identical data?
    MF_ATTRIBUTES_MATCH_ALL_ITEMS = 2,    // do both stores have the same set of identical items?
    MF_ATTRIBUTES_MATCH_INTERSECTION = 3,    // do the attributes that intersect match?
    MF_ATTRIBUTES_MATCH_SMALLER = 4     // do all the attributes in the type that has fewer attributes match?
    );
  MF_ATTRIBUTES_MATCH_TYPE = _MF_ATTRIBUTES_MATCH_TYPE;

type
  PMF_ATTRIBUTE_SERIALIZE_OPTIONS = ^cwMF_ATTRIBUTE_SERIALIZE_OPTIONS;
  cwMF_ATTRIBUTE_SERIALIZE_OPTIONS = DWord;
  MF_ATTRIBUTE_SERIALIZE_OPTIONS = cwMF_ATTRIBUTE_SERIALIZE_OPTIONS;

const
  MF_ATTRIBUTE_SERIALIZE_UNKNOWN_BYREF = MF_ATTRIBUTE_SERIALIZE_OPTIONS($1);

type

  PBITMAPINFOHEADER = ^BITMAPINFOHEADER;

  cwBITMAPINFOHEADER = record
    biSize: DWORD;
    biWidth: LONG;
    biHeight: LONG;
    biPlanes: WORD;
    biBitCount: WORD;
    biCompression: DWORD;
    biSizeImage: DWORD;
    biXPelsPerMeter: LONG;
    biYPelsPerMeter: LONG;
    biClrUsed: DWORD;
    biClrImportant: DWORD;
  end;
  BITMAPINFOHEADER = cwBITMAPINFOHEADER;


  PBitmapinfo = ^TBitmapinfo;

  BITMAPINFO = record
    bmiHeader: BITMAPINFOHEADER;
    bmiColors: array[0..0] of RGBQUAD;
  end;
  TBitmapinfo = BITMAPINFO;

  //
  // New version of MFT_REGISTER_TYPE_INFO for MF
  //
  PMFT_REGISTER_TYPE_INFO = ^MFT_REGISTER_TYPE_INFO;

  cwMFT_REGISTER_TYPE_INFO = record
    guidMajorType: TGUID;
    guidSubtype: TGUID;
  end;
  MFT_REGISTER_TYPE_INFO = cwMFT_REGISTER_TYPE_INFO;


type
  PMFVideoInterlaceMode = ^MFVideoInterlaceMode;
  _MFVideoInterlaceMode = UINT32;
  MFVideoInterlaceMode = _MFVideoInterlaceMode;

const
  MFVideoInterlace_Unknown = MFVideoInterlaceMode(0);  // The type of interlacing is not known.
  MFVideoInterlace_Progressive = MFVideoInterlaceMode(2);  // Progressive frames.
  MFVideoInterlace_FieldInterleavedUpperFirst = MFVideoInterlaceMode(3);  // Interlaced frames. Each frame contains two fields.
  // The field lines are interleaved, with the upper field appearing on the first line.
  MFVideoInterlace_FieldInterleavedLowerFirst = MFVideoInterlaceMode(4);  // Interlaced frames. Each frame contains two fields.
  // The field lines are interleaved, with the lower field appearing on the first line.
  MFVideoInterlace_FieldSingleUpper = MFVideoInterlaceMode(5);  // Interlaced frames. Each frame contains one field, with the upper field appearing first.
  MFVideoInterlace_FieldSingleLower = MFVideoInterlaceMode(6);  // Interlaced frames. Each frame contains one field, with the lower field appearing first.
  MFVideoInterlace_MixedInterlaceOrProgressive = MFVideoInterlaceMode(7);  // The stream contains a mix of interlaced and progressive modes.
  MFVideoInterlace_Last = MFVideoInterlace_MixedInterlaceOrProgressive + 1; // Reserved
  //MFVideoInterlace_ForceDWORD                  = FORCEDWORD);

const
  MFVideoInterlace_FieldSingleUpperFirst = MFVideoInterlace_FieldSingleUpper;
  MFVideoInterlace_FieldSingleLowerFirst = MFVideoInterlace_FieldSingleLower;


  // MFVideoTransferFunction enumeration.
  // For more information about these values, see the remarks for the DXVA2_VideoTransferFunction enumeration,
  // which is the DirectX Video Acceleration (DXVA) equivalent of this enumeration.
type
  PMFVideoTransferFunction = ^MFVideoTransferFunction;
  _MFVideoTransferFunction = UINT32;
  MFVideoTransferFunction = _MFVideoTransferFunction;

const
  MFVideoTransFunc_Unknown = MFVideoTransferFunction(0); // Unknown. Treat as MFVideoTransFunc_709.
  MFVideoTransFunc_10 = MFVideoTransferFunction(1); // Linear RGB (gamma = 1.0).
  MFVideoTransFunc_18 = MFVideoTransferFunction(2); // True 1.8 gamma, L' = L^1/1.8.
  MFVideoTransFunc_20 = MFVideoTransferFunction(3); // True 2.0 gamma, L' = L^1/2.0.
  MFVideoTransFunc_22 = MFVideoTransferFunction(4); // True 2.2 gamma, L' = L^1/2.2. This transfer function is used in ITU-R BT.470-2 System M (NTSC).
  MFVideoTransFunc_709 = MFVideoTransferFunction(5); // ITU-R BT.709 transfer function.
  // Gamma 2.2 curve with a linear segment in the lower range.
  // This transfer function is used in BT.709, BT.601, SMPTE 296M, SMPTE 170M, BT.470, and SPMTE 274M.
  // In addition BT-1361 uses this function within the range [0...1].
  MFVideoTransFunc_240M = MFVideoTransferFunction(6); // SPMTE 240M transfer function. Gamma 2.2 curve with a linear segment in the lower range.
  MFVideoTransFunc_sRGB = MFVideoTransferFunction(7); // sRGB transfer function. Gamma 2.4 curve with a linear segment in the lower range.
  MFVideoTransFunc_28 = MFVideoTransferFunction(8); // True 2.8 gamma. L' = L^1/2.8. This transfer function is used in ITU-R BT.470-2 System B, G (PAL).
  MFVideoTransFunc_Log_100 = MFVideoTransferFunction(9); // Logarithmic transfer (100:1 range); for example, as used in H.264 video.

  {The following elements requires Windows 7 or later.}

  MFVideoTransFunc_Log_316 = MFVideoTransferFunction(10); // Logarithmic transfer (316.22777:1 range); for example, as used in H.264 video.
  MFVideoTransFunc_709_sym = MFVideoTransferFunction(11); // Symmetric ITU-R BT.709.
  MFVideoTransFunc_2020_const = MFVideoTransferFunction(12); // Constant luminance ITU-R BT.2020. See Recommendation ITU-R BT.2020-2.
  // See: https://www.itu.int/dms_pubrec/itu-r/rec/bt/R-REC-BT.2020-2-201510-I!!PDF-E.pdf

  {The following elements requires Windows 8 or later.}

  MFVideoTransFunc_2020 = MFVideoTransferFunction(13); // Non-constant luminance ITU-R BT.2020.
  // See: https://www.itu.int/dms_pubrec/itu-r/rec/bt/R-REC-BT.2020-2-201510-I!!PDF-E.pdf
  MFVideoTransFunc_26 = MFVideoTransferFunction(14); // True 2.6 gamma, L’=L^1/2.6
  MFVideoTransFunc_2084 = MFVideoTransferFunction(15); // SMPTE ST.2084
  MFVideoTransFunc_HLG = MFVideoTransferFunction(16); // Hybrid Log-Gamma, ARIB STD-B67

  {The following elements requires Windows 10, version 1703 (NTDDI_WIN10_RS4) or later.}

  MFVideoTransFunc_10_rel = MFVideoTransferFunction(17); // No gamma, display referred (relative)

  MFVideoTransFunc_BT1361_ECG = MFVideoTransferFunction(18); // BT.1361 Extended Color Gamut
  MFVideoTransFunc_SMPTE428 = MFVideoTransferFunction(19); // SMPTE ST 428-1

  FVideoTransFunc_Last = MFVideoTransFunc_HLG + 1;    // Reserved.
  // MFVideoTransFunc_ForceMFVideoTransferFunction = FORCEMFVideoTransferFunction;


type
  PMFVideoPrimaries = ^MFVideoPrimaries;
  _MFVideoPrimaries = UINT32;
  MFVideoPrimaries = _MFVideoPrimaries;

const
  MFVideoPrimaries_Unknown = MFVideoPrimaries(0);
  MFVideoPrimaries_reserved = MFVideoPrimaries(1);
  MFVideoPrimaries_BT709 = MFVideoPrimaries(2);
  MFVideoPrimaries_BT470_2_SysM = MFVideoPrimaries(3);
  MFVideoPrimaries_BT470_2_SysBG = MFVideoPrimaries(4);
  MFVideoPrimaries_SMPTE170M = MFVideoPrimaries(5); // includes BT.601-5
  MFVideoPrimaries_SMPTE240M = MFVideoPrimaries(6);
  MFVideoPrimaries_EBU3213 = MFVideoPrimaries(7);
  MFVideoPrimaries_SMPTE_C = MFVideoPrimaries(8);
  MFVideoPrimaries_BT2020 = MFVideoPrimaries(9);
  MFVideoPrimaries_XYZ = MFVideoPrimaries(10);
  MFVideoPrimaries_DCI_P3 = MFVideoPrimaries(11);
  MFVideoPrimaries_ACES = MFVideoPrimaries(12);
  MFVideoPrimaries_Display_P3 = MFVideoPrimaries(13); // SMPTE EG 432-1
  MFVideoPrimaries_Last = MFVideoPrimaries_ACES + 1;
  //MFVideoPrimaries_ForceMFVideoPrimaries    = FORCEMFVideoPrimaries);

type
  PMFVideoLighting = ^MFVideoLighting;
  _MFVideoLighting = UINT32;
  MFVideoLighting = _MFVideoLighting;

const
  MFVideoLighting_Unknown = MFVideoLighting(0);
  MFVideoLighting_bright = MFVideoLighting(1);
  MFVideoLighting_office = MFVideoLighting(2);
  MFVideoLighting_dim = MFVideoLighting(3);
  MFVideoLighting_dark = MFVideoLighting(4);
  MFVideoLighting_Last = MFVideoLighting_dark + 1;
  //MFVideoLighting_ForceDWORD = FORCEDWORD);

type
  PMFVideoTransferMatrix = ^MFVideoTransferMatrix;
  _MFVideoTransferMatrix = UINT32;
  MFVideoTransferMatrix = _MFVideoTransferMatrix;

const
  MFVideoTransferMatrix_Unknown = MFVideoTransferMatrix(0);
  MFVideoTransferMatrix_BT709 = MFVideoTransferMatrix(1);
  MFVideoTransferMatrix_BT601 = MFVideoTransferMatrix(2);
  MFVideoTransferMatrix_SMPTE240M = MFVideoTransferMatrix(3);
  MFVideoTransferMatrix_BT2020_10 = MFVideoTransferMatrix(4);
  MFVideoTransferMatrix_BT2020_12 = MFVideoTransferMatrix(5);
  MFVideoTransferMatrix_Identity = MFVideoTransferMatrix(6);
  MFVideoTransferMatrix_FCC47 = MFVideoTransferMatrix(7); // FCC Title 47
  MFVideoTransferMatrix_YCgCo = MFVideoTransferMatrix(8); // IEC 23091-2
  MFVideoTransferMatrix_SMPTE2085 = MFVideoTransferMatrix(9); // SMPTE ST 2085
  MFVideoTransferMatrix_Chroma = MFVideoTransferMatrix(10); // Chromacity-derived, non-constant luminance, IEC 23091-2
  MFVideoTransferMatrix_Chroma_const = MFVideoTransferMatrix(11); // Chromacity-derived, constant luminance, IEC 23091-2
  MFVideoTransferMatrix_ICtCp = MFVideoTransferMatrix(12); // BT.2100 ICtCp
  MFVideoTransferMatrix_Last = MFVideoTransferMatrix_BT2020_12 + 1;
  //MFVideoTransferMatrix_ForceDWORD = FORCEDWORD);

type
  PMFVideoChromaSubsampling = ^MFVideoChromaSubsampling;
  _MFVideoChromaSubsampling = UINT32;
  MFVideoChromaSubsampling = _MFVideoChromaSubsampling;

const
  MFVideoChromaSubsampling_Unknown = MFVideoChromaSubsampling(0);
  MFVideoChromaSubsampling_ProgressiveChroma = MFVideoChromaSubsampling($8);
  MFVideoChromaSubsampling_Horizontally_Cosited = MFVideoChromaSubsampling($4);
  MFVideoChromaSubsampling_Vertically_Cosited = MFVideoChromaSubsampling($2);
  MFVideoChromaSubsampling_Vertically_AlignedChromaPlanes = MFVideoChromaSubsampling($1);
  MFVideoChromaSubsampling_MPEG2 = MFVideoChromaSubsampling_Horizontally_Cosited or
    MFVideoChromaSubsampling_Vertically_AlignedChromaPlanes;
  MFVideoChromaSubsampling_MPEG1 = MFVideoChromaSubsampling_Vertically_AlignedChromaPlanes;
  MFVideoChromaSubsampling_DV_PAL = MFVideoChromaSubsampling_Horizontally_Cosited or
    MFVideoChromaSubsampling_Vertically_Cosited;
  MFVideoChromaSubsampling_Cosited = MFVideoChromaSubsampling_Horizontally_Cosited or
    MFVideoChromaSubsampling_Vertically_Cosited or
    MFVideoChromaSubsampling_Vertically_AlignedChromaPlanes;
  MFVideoChromaSubsampling_Last = MFVideoChromaSubsampling_Cosited + 1;
  //MFVideoChromaSubsampling_ForceDWORD                     = FORCEDWORD);

type
  PMFNominalRange = ^MFNominalRange;
  _MFNominalRange = UINT32;
  MFNominalRange = _MFNominalRange;

const
  MFNominalRange_Unknown = MFNominalRange(0);
  MFNominalRange_Normal = MFNominalRange(1);
  MFNominalRange_Wide = MFNominalRange(2);
  MFNominalRange_0_255 = MFNominalRange(1);
  MFNominalRange_16_235 = MFNominalRange(2);
  MFNominalRange_48_208 = MFNominalRange(3);
  MFNominalRange_64_127 = MFNominalRange(4);
  MFNominalRange_Last = MFNominalRange_64_127 + 1;
  // MFNominalRange_ForceMFNominalRange = FORCEMFNominalRange);

type
  PMFVideoFlags = ^MFVideoFlags;
  _MFVideoFlags = QWORD;
  MFVideoFlags = _MFVideoFlags;

const
  // static flags
  MFVideoFlag_PAD_TO_Mask = MFVideoFlags($1 or $2);
  MFVideoFlag_PAD_TO_None = MFVideoFlags(0 * $1);
  MFVideoFlag_PAD_TO_4x3 = MFVideoFlags(1 * $1);
  MFVideoFlag_PAD_TO_16x9 = MFVideoFlags(2 * $1);

  MFVideoFlag_SrcContentHintMask = MFVideoFlags(($4 or $8) or $10);
  MFVideoFlag_SrcContentHintNone = MFVideoFlags(0 * $4);
  MFVideoFlag_SrcContentHint16x9 = MFVideoFlags(1 * $4);
  MFVideoFlag_SrcContentHint235_1 = MFVideoFlags(2 * $4);

  // static/dynamic flags
  MFVideoFlag_AnalogProtected = MFVideoFlags($20);
  MFVideoFlag_DigitallyProtected = MFVideoFlags($40);

  // dynamic flags
  MFVideoFlag_ProgressiveContent = MFVideoFlags($80);
  MFVideoFlag_FieldRepeatCountMask = MFVideoFlags(($100 or $200) or $400);
  MFVideoFlag_FieldRepeatCountShift = MFVideoFlags(8);
  MFVideoFlag_ProgressiveSeqReset = MFVideoFlags($800);
  MFVideoFlag_PanScanEnabled = MFVideoFlags($20000);
  MFVideoFlag_LowerFieldFirst = MFVideoFlags($40000);
  MFVideoFlag_BottomUpLinearRep = MFVideoFlags($80000);

  // ******************************************
  // static surface creation flags - UNAPPROVED
  // --------------- DO NOT USE ---------------
  // ******************************************
  MFVideoFlags_DXVASurface = MFVideoFlags($100000);
  MFVideoFlags_RenderTargetSurface = MFVideoFlags($400000);
  //  MFVideoFlags_ForceQWORD           = $7FFFFFFF);

type
  PMFRatio = ^MFRatio;

  _MFRatio = record
    Numerator: DWORD;
    Denominator: DWORD;
  end;
  MFRatio = _MFRatio;

  PMFOffset = ^MFOffset;

  _MFOffset = record
    fract: WORD;
    value: SHORT;
  end;
  MFOffset = _MFOffset;

  PMFVideoArea = ^MFVideoArea;

  _MFVideoArea = record
    OffsetX: MFOffset;  // Contains the x-coordinate of the upper-left corner of the rectangle.
    // This coordinate might have a fractional value.
    OffsetY: MFOffset;  // Contains the y-coordinate of the upper-left corner of the rectangle.
    // This coordinate might have a fractional value.
    Area: SIZE;         // A SIZE structure that contains the width and height of the rectangle.
  end;
  MFVideoArea = _MFVideoArea;


  PMFVideoInfo = ^MFVideoInfo;

  _MFVideoInfo = record
    dwWidth: DWORD;
    dwHeight: DWORD;
    PixelAspectRatio: MFRatio;
    SourceChromaSubsampling: MFVideoChromaSubsampling;
    InterlaceMode: MFVideoInterlaceMode;
    TransferFunction: MFVideoTransferFunction;
    ColorPrimaries: MFVideoPrimaries;
    TransferMatrix: MFVideoTransferMatrix;
    SourceLighting: MFVideoLighting;
    FramesPerSecond: MFRatio;
    NominalRange: MFNominalRange;
    GeometricAperture: MFVideoArea;
    MinimumDisplayAperture: MFVideoArea;
    PanScanAperture: MFVideoArea;
    VideoFlags: UInt64;
  end;
  //####old  MFVideoInfo = _MFVideoInfo;
  MFVideoInfo = _MFVideoInfo;


  PMFAYUVSample = ^MFAYUVSample;

  __MFAYUVSample = record
    bCrValue: Byte;
    bCbValue: Byte;
    bYValue: Byte;
    bSampleAlpha8: Byte;
  end;
  MFAYUVSample = __MFAYUVSample;


  PMFARGB = ^MFARGB;

  _MFARGB = record
    rgbBlue: Byte;
    rgbGreen: Byte;
    rgbRed: Byte;
    rgbAlpha: Byte;
  end;
  MFARGB = _MFARGB;


  PMFPaletteEntry = ^MFPaletteEntry;

  _MFPaletteEntry = record
    ARGB: MFARGB;
    AYCbCr: MFAYUVSample;
  end;
  MFPaletteEntry = _MFPaletteEntry;


  PMFVideoSurfaceInfo = ^MFVideoSurfaceInfo;

  _MFVideoSurfaceInfo = record
    Format: DWORD;
    PaletteEntries: DWORD;
    Palette: array [0..0] of MFPaletteEntry;
  end;
  MFVideoSurfaceInfo = _MFVideoSurfaceInfo;


  PMFVideoCompressedInfo = ^MFVideoCompressedInfo;

  _MFVideoCompressedInfo = record
    AvgBitrate: LONGLONG;
    AvgBitErrorRate: LONGLONG;
    MaxKeyFrameSpacing: DWORD;
  end;
  MFVideoCompressedInfo = _MFVideoCompressedInfo;

  // Applications should avoid using this structure.
  // Instead, it is recommended that applications use attributes to describe the video format.
  // See: https://learn.microsoft.com/en-us/windows/win32/api/mfobjects/ns-mfobjects-mfvideoformat
  PMFVIDEOFORMAT = ^MFVIDEOFORMAT;

  _MFVIDEOFORMAT = record
    dwSize: DWORD;
    videoInfo: MFVideoInfo;
    guidFormat: TGUID;
    compressedInfo: MFVideoCompressedInfo;
    surfaceInfo: MFVideoSurfaceInfo;
  end;
  MFVIDEOFORMAT = _MFVIDEOFORMAT;


  PMFStandardVideoFormat = ^MFStandardVideoFormat;
  _MFStandardVideoFormat = (
    MFStdVideoFormat_reserved = 0,
                            MFStdVideoFormat_NTSC = (MFStdVideoFormat_reserved + 1),
                            MFStdVideoFormat_PAL = (MFStdVideoFormat_NTSC + 1),
                            MFStdVideoFormat_DVD_NTSC = (MFStdVideoFormat_PAL + 1),
                            MFStdVideoFormat_DVD_PAL = (MFStdVideoFormat_DVD_NTSC + 1),
                            MFStdVideoFormat_DV_PAL = (MFStdVideoFormat_DVD_PAL + 1),
                            MFStdVideoFormat_DV_NTSC = (MFStdVideoFormat_DV_PAL + 1),
                            MFStdVideoFormat_ATSC_SD480i = (MFStdVideoFormat_DV_NTSC + 1),
                            MFStdVideoFormat_ATSC_HD1080i = (MFStdVideoFormat_ATSC_SD480i + 1),
                            MFStdVideoFormat_ATSC_HD720p = (MFStdVideoFormat_ATSC_HD1080i + 1));
  MFStandardVideoFormat = _MFStandardVideoFormat;


  PMFBYTESTREAM_SEEK_ORIGIN = ^MFBYTESTREAM_SEEK_ORIGIN;
  _MFBYTESTREAM_SEEK_ORIGIN = (
    msoBegin = 0,
                               msoCurrent = (msoBegin + 1));
  MFBYTESTREAM_SEEK_ORIGIN = _MFBYTESTREAM_SEEK_ORIGIN;

  //
  // File access modes for the file creation functions (MFCreateFile and related
  // functions in mfapi.h).
  // Regardless of the access mode with which the file is opened, the sharing
  // permissions will allow shared reading and deleting.
  //

  PMF_FILE_ACCESSMODE = ^MF_FILE_ACCESSMODE;
  __MIDL___MIDL_itf_mfobjects_0000_0017_0001 = (
    MF_ACCESSMODE_READ = 1,
                                                MF_ACCESSMODE_WRITE = 2,
                                                MF_ACCESSMODE_READWRITE = 3);
  MF_FILE_ACCESSMODE = __MIDL___MIDL_itf_mfobjects_0000_0017_0001;


  PMF_FILE_OPENMODE = ^MF_FILE_OPENMODE;
  __MIDL___MIDL_itf_mfobjects_0000_0017_0002 = (
    MF_OPENMODE_FAIL_IF_NOT_EXIST = 0,
                                                MF_OPENMODE_FAIL_IF_EXIST = 1,
                                                MF_OPENMODE_RESET_IF_EXIST = 2,
                                                MF_OPENMODE_APPEND_IF_EXIST = 3,
                                                MF_OPENMODE_DELETE_IF_EXIST = 4);
  MF_FILE_OPENMODE = __MIDL___MIDL_itf_mfobjects_0000_0017_0002;

type
  PMF_FILE_FLAGS = ^MF_FILE_FLAGS;
  __MIDL___MIDL_itf_mfobjects_0000_0017_0003 = DWord;
  MF_FILE_FLAGS = __MIDL___MIDL_itf_mfobjects_0000_0017_0003;

const
  MF_FILEFLAGS_NONE = MF_FILE_FLAGS(0);
  MF_FILEFLAGS_NOBUFFERING = MF_FILE_FLAGS($1);
  MF_FILEFLAGS_ALLOW_WRITE_SHARING = MF_FILE_FLAGS($2);


  // >= Windows 7

type
  //
  //  List IDs for IMFPluginControl
  //
  PMF_Plugin_Type = ^MF_Plugin_Type;
  _MF_Plugin_Type = (
    MF_Plugin_Type_MFT = 0,
                     MF_Plugin_Type_MediaSource = 1,
                     MF_Plugin_Type_MFT_MatchOutputType = 2,
                     MF_Plugin_Type_Other = DWORD(-1)
    );
  MF_Plugin_Type = _MF_Plugin_Type;

  //end  >= Windows 7

type


  //============================================================================
  // Interfaces
  //============================================================================


  // Interface IMFAttributes
  // =======================
  // Provides a generic way to store key/value pairs on an object.
  // The keys are GUIDs, and the values can be any of the following data types:
  // UINT32, UINT64, double, GUID, wide-character string, byte array, or IUnknown pointer.
  // The standard implementation of this interface holds a thread lock while values are added,
  // deleted, or retrieved.
  //
  PIMFAttributes = ^IMFAttributes;

  IMFAttributes = interface(IUnknown)
    ['{2cd2d921-c447-44a7-a13c-4adabfc247e3}']

    function GetItem(const guidKey: REFGUID;
                     pValue: PPROPVARIANT): HResult; stdcall;

    function GetItemType(const guidKey: REFGUID;
                         out pType: MF_ATTRIBUTE_TYPE): HResult; stdcall;

    function CompareItem(const guidKey: REFGUID;
                         const Value: {REF}PROPVARIANT;
                         out pbResult: BOOL): HResult; stdcall;

    function Compare(const pTheirs: IMFAttributes;
                     const MatchType: MF_ATTRIBUTES_MATCH_TYPE;
                     out pbResult: BOOL): HResult; stdcall;

    function GetUINT32(const guidKey: TGUID;
                       out punValue: UINT32): HResult; stdcall;

    function GetUINT64(const guidKey: TGUID;
                       out punValue: UINT64): HResult; stdcall;

    function GetDouble(const guidKey: TGUID;
                       out pfValue: Double): HResult; stdcall;

    function GetGUID(const guidKey: REFGUID;
                     out pguidValue: TGuid): HResult; stdcall;

    function GetStringLength(const guidKey: TGUID;
                             out pcchLength: UINT32): HResult; stdcall;

    function GetString(const guidKey: REFGUID;
                       pwszValue: LPWSTR;
                       cchBufSize: UINT32;
                       pcchLength: PUINT32 = nil): HResult; stdcall;

    function GetAllocatedString(const guidKey: REFGUID;
                                out ppwszValue: LPWSTR;
                                out pcchLength: UINT32 {This parameter must not be 0}): HResult; stdcall;

    function GetBlobSize(const guidKey: TGUID;
                         out pcbBlobSize: UINT32): HResult; stdcall;

    function GetBlob(const guidKey: TGUID;
    {out} pBuf: PUINT8;
    {in} cbBufSize: UINT32;
    {out} pcbBlobSize: PUINT32 = nil): HResult; stdcall;
    // Usage example:
    // var
    //    pArea: MFVideoArea;
    //
    // Result := pType.GetBlob(MF_MT_PAN_SCAN_APERTURE,
    //                         @pArea,
    //                         sizeof(MFVideoArea),
    //                         nil);

    function GetAllocatedBlob(const guidKey: TGUID;
                              out ppBuf: PUINT8;
                              out pcbSize: UINT32): HResult; stdcall;

    function GetUnknown(const guidKey: TGUID;
                        const riid: REFIID;
                        out ppv: LPVOID): HResult; stdcall;

    function SetItem(const guidKey: TGUID;
                     const Value: PROPVARIANT): HResult; stdcall;

    function DeleteItem(const guidKey: TGUID): HResult; stdcall;

    function DeleteAllItems(): HResult; stdcall;

    function SetUINT32(const guidKey: TGUID;
                       unValue: UINT32): HResult; stdcall;

    function SetUINT64(const guidKey: TGUID;
                       unValue: UINT64): HResult; stdcall;

    function SetDouble(const guidKey: TGUID;
                       fValue: Double): HResult; stdcall;

    function SetGUID(const guidKey: TGUID;
                     const guidValue: REFGUID): HResult; stdcall;

    function SetString(const guidKey: TGUID;
                       wszValue: LPCWSTR): HResult; stdcall;

    function SetBlob(const guidKey: TGUID;
                     pBuf: PUINT8;  // Pointer to a byte array to associate with this key. The method stores a copy of the array.
      cbBufSize: UINT32): HResult; stdcall;

    function SetUnknown(const constguidKey: TGUID;
                        pUnk: IUnknown): HResult; stdcall;

    function LockStore(): HResult; stdcall;

    function UnlockStore(): HResult; stdcall;

    function GetCount(out pcItems: UINT32): HResult; stdcall;

    function GetItemByIndex(unIndex: UINT32;
                            out guidKey: TGUID;
                            pValue: PPROPVARIANT = nil): HResult; stdcall;

    function CopyAllItems(pDest: IMFAttributes): HResult; stdcall;

  end;

  IID_IMFAttributes = IMFAttributes;


  // Interface IMFMediaBuffer
  // ========================
  // The IMFMediaBuffer interface represent a buffer of multimedia data
  // for any possible multimedia type.
  // It provides methods for accessing the buffer pointer, the current
  // length, and the maximum length of the buffer.
  //
  PIMFMediaBuffer = ^IMFMediaBuffer;

  IMFMediaBuffer = interface(IUnknown)
    ['{045FA593-8799-42b8-BC8D-8968C6453507}']

    function Lock(out ppbBuffer: PByte;      // Receives a pointer to the start of the buffer.
    {out} pcbMaxLength: PDWord;     // Receives the maximum amount of data that can be written to the buffer. This parameter can be nil.
    {out} pcbCurrentLength: PDWord  // Receives the length of the valid data in the buffer, in bytes. This parameter can be nil.
      ): HResult; stdcall;

    function Unlock(): HResult; stdcall;

    function GetCurrentLength(out pcbCurrentLength: DWord): HResult; stdcall;

    function SetCurrentLength(const cbCurrentLength: DWord): HResult; stdcall;

    function GetMaxLength(out pcbMaxLength: DWord): HResult; stdcall;

  end;

  IID_IMFMediaBuffer = IMFMediaBuffer;


  // Interface IMFSample
  // ===================
  // Represents a media sample, which is a container object for media data.
  // For video, a sample typically contains one video frame.
  // For audio data, a sample typically contains multiple audio samples, rather than a single sample of audio.
  // A media sample contains zero or more buffers.
  // Each buffer manages a block of memory, and is represented by the IMFMediaBuffer interface.
  // A sample can have multiple buffers.
  // The buffers are kept in an ordered list and accessed by index value.
  // It is also valid to have an empty sample with no buffers.
  //
  PIMFSample = ^IMFSample;
  PPIMFSample = ^PIMFSample; //a test issue

  IMFSample = interface(IMFAttributes)
    ['{c40a00f2-b93a-4d80-ae8c-5a1c634f58e4}']

    function GetSampleFlags({out} pdwSampleFlags: PDWord): HResult; stdcall;

    function SetSampleFlags(dwSampleFlags: DWord): HResult; stdcall;

    function GetSampleTime({out} phnsSampleTime: PLONGLONG): HResult; stdcall;

    function SetSampleTime(hnsSampleTime: LONGLONG): HResult; stdcall;

    function GetSampleDuration({out} phnsSampleDuration: PLONGLONG): HResult; stdcall;

    function SetSampleDuration(hnsSampleDuration: LONGLONG): HResult; stdcall;
    //
    // Methods to manage the sample's buffers
    //
    function GetBufferCount({out} pdwBufferCount: PDWord): HResult; stdcall;

    function GetBufferByIndex(dwIndex: DWord;
    {out} ppBuffer: PIMFMediaBuffer): HResult; stdcall;

    function ConvertToContiguousBuffer({out} ppBuffer: PIMFMediaBuffer): HResult; stdcall;

    function AddBuffer(pBuffer: IMFMediaBuffer): HResult; stdcall; // If sample does not support adding buffers, it returns MF_E_SAMPLE_UNSUPPORTED_OP.

    function RemoveBufferByIndex(dwIndex: DWord): HResult; stdcall;

    function RemoveAllBuffers(): HResult; stdcall;

    function GetTotalLength({out} pcbTotalLength: PDWord): HResult; stdcall;

    function CopyToBuffer(pBuffer: IMFMediaBuffer): HResult; stdcall;

  end;

  IID_IMFSample = IMFSample;


  // Interface IMF2DBuffer
  // ======================
  // Represents a buffer that contains a two-dimensional surface, such as a video frame.
  //
  // <summary>
  //   The IMF2DBuffer interface is supported by a media buffer whose multimedia data represents a 2D media type e.g. video.
  //   For these media types it is important to know the "pitch" of the buffer which indicates the number of
  //   bytes required to go from scanline to scanline.
  //   The IMF2DBuffer interface is obtained from a buffer by calling QueryInterface().
  //   For each 2D media type a contiguous standard representation is defined which is designed to be compatible with the
  //   standard layout of a DirectX surface when represented by system memory.
  //   In this representation the surface pitch is always positive and
  //   equal to the number of bytes taken up by a single row of pixels padded out to a 4-byte boundary.
  //
  //   Applications may still access 2D buffers using IMFBuffer.Lock().
  //   In that case the data in the buffer will always be in the standard contiguous format for the format of
  //   data represented by the buffer. An internal copy may be required on IMFBuffer.Lock()
  //   and IMFBuffer.Unlock() to achieve this.
  //   The copy will not occur if the buffer is already in the correct format.
  //   When a copy occurs an event will be generated to aid debugging performance issues resulting from the copy.
  //   Components that process 2D data should aim to use the IMF2DBuffer interface to access sample data.
  // </summary>
  //
  PIMF2DBuffer = ^IMF2DBuffer;

  IMF2DBuffer = interface(IUnknown)
    ['{7DC9D5F9-9ED9-44ec-9BBF-0600BB589FBB}']

    function Lock2D(out pbScanline0: PByte; // Receives a pointer to the first byte of the top row of pixels in the image. The top row is defined as the top row when the image is presented to the viewer, and might not be the first row in memory.
      out plPitch: LONG       // Receives the surface stride, in bytes.
      ): HResult; stdcall;    // The stride might be negative, indicating that the image is oriented from the bottom up in memory.


    function Unlock2D(): HResult; stdcall;

    function GetScanline0AndPitch(out pbScanline0: PByte;
                                  out plPitch: LONG): HResult; stdcall;

    function IsContiguousFormat(out pfIsContiguous: BOOL): HResult; stdcall;

    function GetContiguousLength(out pcbLength: DWord): HResult; stdcall;

    function ContiguousCopyTo(out pbDestBuffer: PByte;
                              const cbDestBuffer: DWord): HResult; stdcall;

    function ContiguousCopyFrom(pbSrcBuffer: PByte;
                                cbSrcBuffer: DWord): HResult; stdcall;

  end;

  IID_IMF2DBuffer = IMF2DBuffer;


  PMF2DBufferLockFlags = ^_MF2DBuffer_LockFlags;
  _MF2DBuffer_LockFlags = LongInt; // Windows 32-bit enum; aliases and SDK values are preserved.

  MF2DBuffer_LockFlags = _MF2DBuffer_LockFlags;


  // Interface IMF2DBuffer2
  // =======================
  //
  IMF2DBuffer2 = interface(IMF2DBuffer)
    ['{33ae5ea6-4316-436f-8ddd-d73d22f829ec}']

    function Lock2DSize(lockFlags: MF2DBuffer_LockFlags;
                        out ppbScanline0: PByte;
                        out plPitch: LONG;
                        out ppbBufferStart: PByte;
                        out pcbBufferLength: DWORD): HRESULT; stdcall;

    function Copy2DTo(pDestBuffer: IMF2DBuffer2): HRESULT; stdcall;

  end;

  IID_IMF2DBuffer2 = IMF2DBuffer2;


  // Interface IMFDXGIBuffer
  // ========================
  //
  IMFDXGIBuffer = interface(IUnknown)
    ['{e7174cfa-1c9e-48b1-8866-626226bfc258}']

    function GetResource(const riid: REFIID;
                         out ppvObject: Pointer): HRESULT; stdcall;

    function GetSubresourceIndex(out puSubresource: UINT): HRESULT; stdcall;

    function GetUnknown(const guid: REFIID;
                        const riid: REFIID;
                        out ppvObject: PPointer): HRESULT; stdcall;

    function SetUnknown(const guid: REFIID;
                        pUnkData: IUnknown): HRESULT; stdcall;
  end;

  IID_IMFDXGIBuffer = IMFDXGIBuffer;

  // Interface IMFDXGIBuffer
  // ========================
  //
  /// <summary>
  ///     The IMFMediaBufferInternal is used by MF's circular sample allocator to set the parent sample on the buffer. This is needed for properly determining when a
  ///     sample can be returned to the allocator (since the application can take reference to the buffers and release the sample, we need to avoid returning the sample
  ///     to the allocator while there are external references to the buffer.
  /// </summary>
  IMFDXGICrossAdapterBuffer = interface(IUnknown)
    ['{B25D03FB-D148-45EF-BFED-F778B7566C07}']

    function GetResourceForDevice(const pUnkDevice: IUnknown;
                                  const riid: REFIID;
                                  out ppvObject: Pointer): HResult; stdcall;

    function GetSubresourceIndexForDevice(const pUnkDevice: IUnknown;
                                          out puSubresource: UINT): HResult; stdcall;

    function GetUnknownForDevice(const pUnkDevice: IUnknown;
                                 const guid: REFIID;
                                 const riid: REFIID;
                                 out ppvObject: Pointer): HResult; stdcall;

    function SetUnknownForDevice(const pUnkDevice: IUnknown;
                                 const guid: REFIID;
    {_In_opt_} pUnkData: IUnknown {GUID_NULL when not used}): HResult; stdcall;
  end;


  // Interface IMFMediaType
  // ======================
  // Represents a description of a media format.
  //
  PIMFMediaType = ^IMFMediaType;

  IMFMediaType = interface(IMFAttributes)
    ['{44ae0fa8-ea31-4109-8d2e-4cae4997c555}']
    function GetMajorType(out pguidMajorType: TGuid): HResult; stdcall;

    function IsCompressedFormat(out pfCompressed: BOOL): HResult; stdcall;

    function IsEqual(pIMediaType: IMFMediaType;
                     out pdwFlags: DWord): HResult; stdcall;

    function GetRepresentation(const guidRepresentation: TGuid;
                               out ppvRepresentation: LPVOID): HResult; stdcall;

    function FreeRepresentation(const guidRepresentation: TGuid;
                                pvRepresentation: LPVOID): HResult; stdcall;
  end;

  IID_IMFMediaType = IMFMediaType;


  // Interface IMFAudioMediaType
  // ===========================
  // Represents a description of an audio format.
  // (Vista only)
  // NOTE:  No longer available for use as of Windows 7
  //        Instead, use the media type attributes to get the properties of the audio format.
  //
  PIMFAudioMediaType = ^IMFAudioMediaType;

  IMFAudioMediaType = interface(IMFMediaType)
    ['{26a0adc3-ce26-4672-9304-69552edd3faf}']
    //
    // This method has been deprecated, and its use should be avoided.
    // There are no guarantees about how long the memory pointed to by the
    // return value will be valid.
    // Applications are advised to use MFCreateWaveFormatExFromMFMediaType()
    // instead.
    //
    function GetAudioFormat(): PWAVEFORMATEX; stdcall;

  end;

  IID_IMFAudioMediaType = IMFAudioMediaType;


  // Interface IMFVideoMediaType
  // ===========================
  // Represents a description of a video format.
  // NOTE: Applications should avoid using this interface except when a method or function requires an
  //       IMFVideoMediaType pointer as a parameter. You can get all of the format information from a
  //       video media type through the IMFAttributes interface, which IMFMediaType inherits.
  //
  PIMFVideoMediaType = ^IMFVideoMediaType;

  IMFVideoMediaType = interface(IMFMediaType)
    ['{b99f381f-a8f9-47a2-a5af-ca3a225a3890}']

    //Returns a pointer to an MFVIDEOFORMAT structure that describes the video format. (Deprecated)
    function GetVideoFormat(): PMFVIDEOFORMAT; stdcall;
    //Retrieves an alternative representation of the media type. (Deprecated)

    function GetVideoRepresentation(const guidRepresentation: TGuid;
                                    out ppvRepresentation: LPVOID;
                                    lStride: LONG): HResult; stdcall;
  end;

  IID_IMFVideoMediaType = IMFVideoMediaType;


  // Interface IMFAsyncResult
  // ========================
  // <summary>
  //     This interface is used to represent the result from an asynchronous
  //     operation.
  //     For most Media Foundation components and applications that need to
  //     create an IMFAsyncResult implementation, MFCreateAsyncResult, which
  //     instantiates the MF implementation of this interface, will suffice.
  //     Any implementation of IMFAsyncResult must inherit from the
  //     MFASYNCRESULT structure defined in mfapi.h
  // </summary>
  PIMFAsyncResult = ^IMFAsyncResult;

  IMFAsyncResult = interface(IUnknown)
    ['{ac6b7889-0740-4d51-8619-905994a55cc6}']

    function GetState(out ppunkState: IUnknown): HResult; stdcall;

    function GetStatus(): HResult; stdcall;

    function SetStatus(hrStatus: HRESULT): HResult; stdcall;

    function GetObject(out ppObject: IUnknown): HResult; stdcall;

    function GetStateNoAddRef(): IUnknown; stdcall;

  end;

  IID_IMFAsyncResult = IMFAsyncResult;


  // Interface IMFAsyncCallback
  // ==========================
  // Callback interface to notify the application when an asynchronous method completes.
  //
  PIMFAsyncCallback = ^IMFAsyncCallback;

  IMFAsyncCallback = interface(IUnknown)
    ['{a27003cf-2354-4f2a-8d6a-ab7cff15437e}']

    function GetParameters(out pdwFlags: DWord;
                           out pdwQueue: DWord): HResult; stdcall;

    function Invoke(pAsyncResult: IMFAsyncResult): HResult; stdcall;

  end;

  IID_IMFAsyncCallback = IMFAsyncCallback;


  // Interface IMFMediaEvent
  // =======================
  // Represents an event generated by a Media Foundation object.
  // Use this interface to get information about the event.
  // To get a pointer to this interface, call IMFMediaEventGenerator.BeginGetEvent or
  // IMFMediaEventGenerator.GetEvent on the event generator.
  //
  PIMFMediaEvent = ^IMFMediaEvent;

  IMFMediaEvent = interface(IMFAttributes)
    ['{DF598932-F10C-4E39-BBA2-C308F101DAA3}']

    function GetType(out pmet: MediaEventType): HResult; stdcall;

    function GetExtendedType(out pguidExtendedType: TGuid): HResult; stdcall;

    function GetStatus(out phrStatus: HRESULT): HResult; stdcall;

    function GetValue(out pvValue: PROPVARIANT): HResult; stdcall;

  end;

  IID_IMFMediaEvent = IMFMediaEvent;


  // Interface IMFMediaEventGenerator
  // ================================
  // Retrieves events from any Media Foundation object that generates events.
  // NOTE: An object that supports this interface maintains a queue of events.
  //       The client of the object can retrieve the events either synchronously or asynchronously.
  //       The synchronous method is GetEvent.
  //       The asynchronous methods are BeginGetEvent and EndGetEvent.
  //
  PIMFMediaEventGenerator = ^IMFMediaEventGenerator;

  IMFMediaEventGenerator = interface(IUnknown)
    ['{2CD0BD52-BCD5-4B89-B62C-EADC0C031E7D}']

    function GetEvent(dwFlags: DWord;
                      out ppEvent: IMFMediaEvent): HResult; stdcall;

    function BeginGetEvent(pCallback: IMFAsyncCallback;
                           punkState: IUnknown): HResult; stdcall;

    function EndGetEvent(pResult: IMFAsyncResult;
                         out ppEvent: IMFMediaEvent): HResult; stdcall;

    function QueueEvent(met: MediaEventType;
                        const guidExtendedType: REFGUID;
                        hrStatus: HRESULT;
                        pvValue: PROPVARIANT): HResult; stdcall;
  end;

  IID_IMFMediaEventGenerator = IMFMediaEventGenerator;


  // Interface IMFRemoteAsyncCallback
  // ================================
  // <summary>
  //     Remote async callback function for use with
  //     IMFMediaEventGenerator.RemoteBeginGetEvent.
  //     Media Foundation applications need not implement this interface.
  // </summary>
  PIMFRemoteAsyncCallback = ^IMFRemoteAsyncCallback;

  IMFRemoteAsyncCallback = interface(IUnknown)
    ['{a27003d0-2354-4f2a-8d6a-ab7cff15437e}']

    function Invoke(const hr: HRESULT;
                    pRemoteResult: IUnknown): HResult; stdcall;
  end;

  IID_IMFRemoteAsyncCallback = IMFRemoteAsyncCallback;


  // Interface IMFByteStream
  // =======================
  // Represents a byte stream from some data source, which might be a local file, a network file,
  // or some other source.
  // The IMFByteStream interface supports the typical stream operations, such as reading, writing, and seeking.
  //
  PIMFByteStream = ^IMFByteStream;

  IMFByteStream = interface(IUnknown)
    ['{ad4c1b00-4bf7-422f-9175-756693d9130d}']

    function GetCapabilities(out pdwCapabilities: DWord): HResult; stdcall;

    function GetLength(out pqwLength: QWORD): HResult; stdcall;

    function SetLength(qwLength: QWORD): HResult; stdcall;

    function GetCurrentPosition(out pqwPosition: QWORD): HResult; stdcall;

    function SetCurrentPosition(const qwPosition: QWORD): HResult; stdcall;

    function IsEndOfStream(out pfEndOfStream: BOOL): HResult; stdcall;

    function Read(pb: PByte;
                  cb: ULONG;
                  out pcbRead: ULONG): HResult; stdcall;

    function BeginRead(pb: PByte;
                       cb: ULONG;
                       pCallback: IMFAsyncCallback;
                       punkState: IUnknown): HResult; stdcall;

    function EndRead(pResult: IMFAsyncResult;
                     out pcbRead: ULONG): HResult; stdcall;

    function Write(pb: PByte;
                   cb: ULONG;
                   out pcbWritten: ULONG): HResult; stdcall;

    function BeginWrite(pb: PByte;
                        cb: ULONG;
                        pCallback: IMFAsyncCallback;
                        punkState: IUnknown): HResult; stdcall;

    function EndWrite(pResult: IMFAsyncResult;
                      out pcbWritten: ULONG): HResult; stdcall;

    function Seek(SeekOrigin: MFBYTESTREAM_SEEK_ORIGIN;
                  llSeekOffset: LONGLONG;
                  dwSeekFlags: DWord;
                  out pqwCurrentPosition: QWORD): HResult; stdcall;

    function Flush(): HResult; stdcall;

    function Close(): HResult; stdcall;

  end;

  IID_IMFByteStream = IMFByteStream;


  // Interface IMFCollection
  // =======================
  // Represents a generic collection of IUnknown pointers.
  // NOTE: To create an empty collection object, call MFCreateCollection.
  //
  PIMFCollection = ^IMFCollection;

  IMFCollection = interface(IUnknown)
    ['{5BC8A76B-869A-46a3-9B03-FA218A66AEBE}']

    function GetElementCount(out pcElements: DWord): HResult; stdcall;

    function GetElement(dwElementIndex: DWord;
                        out ppUnkElement: IUnknown): HResult; stdcall;

    function AddElement(pUnkElement: IUnknown): HResult; stdcall;

    function RemoveElement(dwElementIndex: DWord;
                           out ppUnkElement: IUnknown): HResult; stdcall;

    function InsertElementAt(dwIndex: DWord;
                             pUnfknown_: IUnknown): HResult; stdcall;

    function RemoveAllElements(): HResult; stdcall;

  end;

  IID_IMFCollection = IMFCollection;


  // Interface IMFMediaEventQueue
  // ============================
  // Provides an event queue for applications that need to implement the IMFMediaEventGenerator interface.
  // This interface is exposed by a helper object that implements an event queue.
  // If you are writing a component that implements the IMFMediaEventGenerator interface,
  // you can use this object in your implementation.
  // The event queue object is thread safe and provides methods to queue events and to pull them from
  // the queue either synchronously or asynchronously.
  // To create the event queue object, call MFCreateEventQueue.
  //
  PIMFMediaEventQueue = ^IMFMediaEventQueue;

  IMFMediaEventQueue = interface(IUnknown)
    ['{36f846fc-2256-48b6-b58e-e2b638316581}']
    // <summary>
    //     Media Event Generator components that use the Media Event Queue
    //     object should just forward IMFMediaEventGenerator::GetEvent
    //     calls to this method on the Media Event Queue.
    //     See IMFMediaEventGenerator::GetEvent parameter descriptions.
    // </summary>
    function GetEvent(dwFlags: DWord;
                      out ppEvent: IMFMediaEvent): HResult; stdcall;

    // <summary>
    //     Media Event Generator components that use the Media Event Queue
    //     object should just forward IMFMediaEventGenerator::BeginGetEvent
    //     calls to this method on the Media Event Queue.
    //     See IMFMediaEventGenerator::BeginGetEvent parameter descriptions.
    // </summary>
    function BeginGetEvent(pCallback: IMFAsyncCallback;
                           punkState: IUnknown): HResult; stdcall;

    // <summary>
    //     Media Event Generator components that use the Media Event Queue
    //     object should just forward IMFMediaEventGenerator::EndGetEvent
    //     calls to this method on the Media Event Queue.
    //     See IMFMediaEventGenerator::EndGetEvent parameter descriptions.
    // </summary>
    function EndGetEvent(pResult: IMFAsyncResult;
                         out ppEvent: IMFMediaEvent): HResult; stdcall;

    // <summary>
    //     Queues the specified event on the Media Event Queue object.
    //     This event will be retrievable using Begin/EndGetEvent or
    //     GetEvent
    // </summary>
    // <param name="pEvent">
    //     Pointer to the Media Event object to queue
    // </param>
    function QueueEvent(pEvent: IMFMediaEvent): HResult; stdcall;

    // <summary>
    //     Queues an event with the specified event data on the Media Event
    //     Queue object.
    //     This event will be retrievable using Begin/EndGetEvent or
    //     GetEvent
    // </summary>
    // <param name="met">
    //     Event type
    // </param>
    // <param name="guidExtendedType">
    //     Extended event type
    // </param>
    // <param name="hrStatus">
    //     Event status
    // </param>
    // <param name="pvValue">
    //     Event value
    // </param>
    function QueueEventParamVar(met: MediaEventType;
                                const guidExtendedType: REFGUID;
                                hrStatus: HRESULT;
                                pvValue: PROPVARIANT): HResult; stdcall;

    // <summary>
    //     Queues an event with the specified event data on the Media Event
    //     Queue object.
    //     This event will be retrievable using Begin/EndGetEvent or
    //     GetEvent
    // </summary>
    // <param name="met">
    //     Event type
    // </param>
    // <param name="guidExtendedType">
    //     Extended event type
    // </param>
    // <param name="hrStatus">
    //     Event status
    // </param>
    // <param name="pUnk">
    //     Event value, specified as an IUnknown *
    // </param>
    function QueueEventParamUnk(met: MediaEventType;
                                const guidExtendedType: REFGUID;
                                hrStatus: HRESULT;
                                pUnk: IUnknown): HResult; stdcall;

    // <summary>
    //     Shutdown must be called when the component is done using the
    //     Media Event Queue object to break circular references and
    //     prevent memory leaks.
    // </summary>
    function Shutdown(): HResult; stdcall;

  end;

  IID_IMFMediaEventQueue = IMFMediaEventQueue;


  // Interface IMFActivate
  // =====================
  // The IMFActivate interface is a base interface for Activate objects.
  // An Activate object is a helper object which creates and keeps a pointer to the real object.
  // MF pipeline uses activate objects instead of real objects in partial topologies.
  // The ActivateObject(...) method should always return the same instance of the object until either
  // ShutdownObject() or DetachObject() is called, then it can create a new instance.
  //
  PIMFActivate = ^IMFActivate;

  IMFActivate = interface(IMFAttributes)
    ['{7FEE9E9A-4A89-47a6-899C-B6A53A70FB67}']

    // <summary>
    //     Creates the object that this activate represents.
    //     The ActivateObject(...) method should always return the same instance of the object
    //     until either ShutdownObject() or DetachObject() is called.
    // </summary>
    // <param name="riid">
    //     The interface ID that the requested object will be QI'ed for
    // </param>
    // <param name="ppv">
    //     Will contain the requested interface
    // </param>
    function ActivateObject(const riid: REFIID;
                            out ppv): HResult; stdcall;

    // <summary>
    //     Shuts down the internal represented object
    //     (that is returned on ActivateObject(...))
    //     and then releases all references to it.
    // </summary>
    function ShutdownObject(): HResult; stdcall;

    // <summary>
    //     Releases all references to the internal represented
    //     object (without shutting it down.)
    //     If this action is not supported, E_NOTIMPL should be returned.
    // </summary>
    function DetachObject(): HResult; stdcall;

  end;

  IID_IMFActivate = IMFActivate;


  // >= Windows 8

  // Interface IMFPluginControl
  // ==========================
  // Controls how media sources and transforms are enumerated in Microsoft Media Foundation.
  // To get a pointer to this interface, call MFGetPluginControl.
  //
  PIMFPluginControl = ^IMFPluginControl;

  IMFPluginControl = interface(IUnknown)
    ['{5c6c44bf-1db6-435b-9249-e8cd10fdec96}']

    function GetPreferredClsid(pluginType: DWord;
                               selector: LPCWSTR;
                               out clsid: CLSID): HResult; stdcall;

    function GetPreferredClsidByIndex(pluginType: DWord;
                                      const index: Dword;
                                      out selector: LPWSTR;
                                      out clsid: CLSID): HResult; stdcall;

    function SetPreferredClsid(pluginType: DWord;
                               selector: LPCWSTR;
                               const clsid: CLSID): HResult; stdcall;

    function IsDisabled(pluginType: DWord;
                        const clsid: REFCLSID): HResult; stdcall;

    function GetDisabledByIndex(pluginType: DWord;
                                const index: DWord;
                                out clsid: CLSID): HResult; stdcall;

    function SetDisabled(pluginType: DWord;
                         const clsid: REFCLSID;
                         disabled: BOOL): HResult; stdcall;
  end;

  IID_IMFPluginControl = IMFPluginControl;
  // end >= Windows 8


  // NEW since SDK 8
  // ===============
  //
  PMfPluginControlPolicy = ^MF_PLUGIN_CONTROL_POLICY;
  MF_PLUGIN_CONTROL_POLICY = (
    MF_PLUGIN_CONTROL_POLICY_USE_ALL_PLUGINS = 0,
                              MF_PLUGIN_CONTROL_POLICY_USE_APPROVED_PLUGINS = 1,
                              MF_PLUGIN_CONTROL_POLICY_USE_WEB_PLUGINS = 2,
                              MF_PLUGIN_CONTROL_POLICY_USE_WEB_PLUGINS_EDGEMODE = 3
    );



  // Interface IMFPluginControl2
  // ===========================
  PIMFPluginControl2 = ^IMFPluginControl2;

  IMFPluginControl2 = interface(IMFPluginControl)
    ['{C6982083-3DDC-45CB-AF5E-0F7A8CE4DE77}']

    function SetPolicy(policy: MF_PLUGIN_CONTROL_POLICY): HResult; stdcall;

  end;

  IID_IMFPluginControl2 = IMFPluginControl2;



  // Interface IMFDXGIDeviceManager
  // ==============================
  //
  PIMFDXGIDeviceManager = ^IMFDXGIDeviceManager;

  IMFDXGIDeviceManager = interface(IUnknown)
    ['{eb533d5d-2db6-40f8-97a9-494692014f07}']

    function CloseDeviceHandle(hDevice: THandle): HResult; stdcall;

    function GetVideoService(hDevice: THandle;
                             const riid: REFIID;
                             out ppService): HResult; stdcall;

    function LockDevice(hDevice: THandle;
                        const riid: REFIID;
                        out ppUnkDevice;
                        fBlock: BOOL): HResult; stdcall;

    function OpenDeviceHandle(phDevice: THandle): HResult; stdcall;

    function ResetDevice(pUnkDevice: IUnknown;
                         const resetToken: UINT): HResult; stdcall;

    function TestDevice(hDevice: THandle): HResult; stdcall;

    function UnlockDevice(hDevice: THandle;
                          fSaveState: BOOL): HResult; stdcall;


  end;

  IID_IMFDXGIDeviceManager = IMFDXGIDeviceManager;


  PMF_DXGI_DEVICE_MANAGER_MODE = ^MF_DXGI_DEVICE_MANAGER_MODE;
  MF_DXGI_DEVICE_MANAGER_MODE = (
    MF_DXGI_DEVICE_MANAGER_MODE_INVALID = 0,
                                 MF_DXGI_DEVICE_MANAGER_MODE_D3D11,
                                 MF_DXGI_DEVICE_MANAGER_MODE_D3D12
    );

  PMfStreamState = ^MF_STREAM_STATE;
  _MF_STREAM_STATE = (
    MF_STREAM_STATE_STOPPED = 0,
                      MF_STREAM_STATE_PAUSED = 1,
                      MF_STREAM_STATE_RUNNING = 2
    );
  MF_STREAM_STATE = _MF_STREAM_STATE;


  // Interface IMFMuxStreamAttributesManager
  // =======================================
  //
  PIMFMuxStreamAttributesManager = ^IMFMuxStreamAttributesManager;

  IMFMuxStreamAttributesManager = interface(IUnknown)
    ['{CE8BD576-E440-43B3-BE34-1E53F565F7E8}']

    function GetStreamCount(out pdwMuxStreamCount: DWORD): HResult; stdcall;

    function GetAttributes(dwMuxStreamIndex: DWORD;
                           out ppStreamAttributes: IMFAttributes): HResult; stdcall;

  end;

  IID_IMFMuxStreamAttributesManager = IMFMuxStreamAttributesManager;


  // Interface IMFMuxStreamMediaTypeManager
  // ======================================
  //
  PIMFMuxStreamMediaTypeManager = ^IMFMuxStreamMediaTypeManager;

  IMFMuxStreamMediaTypeManager = interface(IUnknown)
    ['{505A2C72-42F7-4690-AEAB-8F513D0FFDB8}']

    function GetStreamCount(out pdwMuxStreamCount: DWORD): HResult; stdcall;

    function GetMediaType(dwMuxStreamIndex: DWORD;
                          out ppMediaType: IMFMediaType): HResult; stdcall;

    function GetStreamConfigurationCount(out pdwCount: DWORD): HResult; stdcall;

    function AddStreamConfiguration(ullStreamMask: ULONGLONG): HResult; stdcall;

    function RemoveStreamConfiguration(ullStreamMask: ULONGLONG): HResult; stdcall;

    function GetStreamConfiguration(ulIndex: DWORD;
                                    out pullStreamMask: ULONGLONG): HResult; stdcall;

  end;

  IID_IMFMuxStreamMediaTypeManager = IMFMuxStreamMediaTypeManager;


  // Interface IMFMuxStreamSampleManager
  // ===================================
  //
  PIMFMuxStreamSampleManager = ^IMFMuxStreamSampleManager;

  IMFMuxStreamSampleManager = interface(IUnknown)
    ['{74ABBC19-B1CC-4E41-BB8B-9D9B86A8F6CA}']

    function GetStreamCount(out pdwMuxStreamCount: DWORD): HResult; stdcall;

    function GetSample(dwMuxStreamIndex: DWORD;
                       out ppSample: PIMFSample): HResult; stdcall;

    function GetStreamConfiguration(): ULONGLONG; stdcall;

  end;

  IID_IMFMuxStreamSampleManager = IMFMuxStreamSampleManager;


  // Interface IMFSecureBuffer
  // This interface encapsulates a secure buffer allocated by the frame server
  // trustlet.
  // =========================
  //
  IMFSecureBuffer = interface(IUnknown)
    ['{C1209904-E584-4752-A2D6-7F21693F8B21}']
    // <summary>
    // Get the identifier for a secure buffer. This GUID can be used by
    // a device's trustlet to open a secure section containing the buffer.
    // </summary>
    function GetIdentifier(out pGuidIdentifier: TGUID): HResult; stdcall;

  end;

  IID_IMFSecureBuffer = IMFSecureBuffer;


  IMFByteStreamProxyClassFactory = interface(IUnknown)
    ['{a6b43f84-5c0a-42e8-a44d-b1857a76992f}']
    function CreateByteStreamProxy(pByteStream: IMFByteStream;
                                   pAttributes: IMFAttributes;
                                   const riid: REFIID;
                                   out ppvObject: LPVOID): HResult; stdcall;

  end;

  IID_IMFByteStreamProxyClassFactory = IMFByteStreamProxyClassFactory;


  IMFSampleOutputStream = interface(IUnknown)
    ['{8feed468-6f7e-440d-869a-49bdd283ad0d}']
    /// <summary>
    ///     Begin async write operation.
    /// </summary>
    function BeginWriteSample(pSample: IMFSample;
                              pCallback: IMFAsyncCallback;
                              punkState: IUnknown): HResult; stdcall;

    /// <summary>
    ///     Complete async write operation.
    /// </summary>
    function EndWriteSample(pResult: IMFAsyncResult): HResult; stdcall;

    function Close(): HResult; stdcall;

  end;

  IID_IMFSampleOutputStream = IMFSampleOutputStream;



  // functions /////////////////////////////////////////////////////////////////

function MFSerializeAttributesToStream(pAttr: IMFAttributes;
                                       dwOptions: DWord;  // Bitwise OR of zero or more flags from the MF_ATTRIBUTE_SERIALIZE_OPTIONS enumeration.
  pStm: IStream): HResult; stdcall;

function MFDeserializeAttributesFromStream(pAttr: IMFAttributes;
                                           dwOptions: DWord;  // Bitwise OR of zero or more flags from the MF_ATTRIBUTE_SERIALIZE_OPTIONS enumeration.
  pStm: IStream): HResult; stdcall;



// Additional Prototypes for ALL interfaces

type

  // The following array definitions can be used if you don't want to implement pointermath for
  // pointer to pointerarray definitions.
  // Otherwise use {$POINTERMATH ON/OFF} in your code.

  // Type identifiers for functions that needs the Array of IMFActivate or IMFMediaTypeArray.
  //
  // To declare parameters that must be dynamic arrays, you need to specify a type identifier.
  // Source: Delphi Help
  //
  PIMFActivateArray = ^TIMFActivateArray;
  // dynamic
  // TIMFActivateArray = array of IMFActivate;
  // or static (preferred)
  TIMFActivateArray = array[0..MaxInt div SizeOf(Pointer) - 1] of IMFActivate;


  // Used by function MfPack.MfIdl.MFCreateStreamDescriptor
  PIMFMediaTypeArray = ^TIMFMediaTypeArray;
  // dynamic
  // TIMFMediaTypeArray = array of IMFMediaType;
  // or static (preferred)
  TIMFMediaTypeArray = array[0..MaxInt div SizeOf(Pointer) - 1] of IMFMediaType;

  // Used by function MfPack.MfApi.Enum
  PCLSIDArray = ^TPCLSIDArray;
  // dynamic
  // TPCLSIDArray = array of IMFMediaType;
  // or static (preferred)
  TPCLSIDArray = array[0..MaxInt div SizeOf(CLSID) - 1] of CLSID;

  // End of Additional Prototypes


implementation

const
  MfObjectsLib = 'Mfplat.dll';

function MFSerializeAttributesToStream; external MfObjectsLib name 'MFSerializeAttributesToStream';
function MFDeserializeAttributesFromStream; external MfObjectsLib name 'MFDeserializeAttributesFromStream';

// Implement Additional Prototypes here.

end.
