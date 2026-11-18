// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MfPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.DirectX.D3D12SDKLayers.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 13-08-2022
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: This header is used by Direct3D 12 Graphics.
//              See: https://learn.microsoft.com/en-us/windows/win32/api/_direct3d12/
//
// Organisation: FactoryX
// Initiator(s): Tony (maXcomX), Peter (OzShips)
// Contributor(s): Tony (maXcomX), (kxMaxx)
//
//------------------------------------------------------------------------------
// CHANGE LOG
// Date       Person              Reason
// ---------- ------------------- ----------------------------------------------
// 15/11/2026 All                 Eels release  SDK 10.0.28000.2705 (Windows 11)
//------------------------------------------------------------------------------
//
//          FPC port uses MfPack SDK declarations; validate optional interfaces before use.
//          Search "Update May 2024", to find updates until May 2024.
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
// Source: d3d12sdklayers.h
//
// Copyright (c) Microsoft Corporation. Licensed under the MIT license.
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

unit WinApi.DirectX.D3D12SDKLayers;

{$I MfPack.Fpc.inc}

interface


uses
  
  {WinApi}
  Windows,
  WinApi.WinApiTypes,
  {DirectX}
  WinApi.DirectX.D3D12;

  {$ALIGN ON}
  {$PACKENUM 4}

  {$IFDEF WIN32}
    {$ALIGN 1}
  {$ELSE}
    {$ALIGN 8} // Win64
  {$ENDIF}

  {$I 'WinApiTypes.inc'}

type

  //============================================================================
  //
  // Debugging Layer
  //
  //============================================================================

  // Interface ID3D12Debug
  // ======================
  // An interface used to turn on the debug layer.
  //
  ID3D12Debug = Interface(IUnknown)
  ['{344488B7-6846-474B-B989-F027448245E0}']

    procedure EnableDebugLayer(); stdcall;
  end;
  IID_ID3D12Debug = ID3D12Debug;

type
  PD3D12_GPU_BASED_VALIDATION_FLAGS = ^D3D12_GPU_BASED_VALIDATION_FLAGS;
  D3D12_GPU_BASED_VALIDATION_FLAGS = UINT;
const
    D3D12_GPU_BASED_VALIDATION_FLAGS_NONE                   = D3D12_GPU_BASED_VALIDATION_FLAGS($00);
    D3D12_GPU_BASED_VALIDATION_FLAGS_DISABLE_STATE_TRACKING = D3D12_GPU_BASED_VALIDATION_FLAGS($01);


type

  // Interface ID3D12Debug1
  // =======================
  //
  ID3D12Debug1 = Interface(IUnknown)
  ['{AFFAA4CA-63FE-4D8E-B8AD-159000AF4304}']

    procedure EnableDebugLayer(); stdcall;

    procedure SetEnableGPUBasedValidation(Enable: BOOL); stdcall;

    procedure SetEnableSynchronizedCommandQueueValidation(Enable: BOOL); stdcall;
  end;
  IID_ID3D12Debug1 = ID3D12Debug1;


  // Interface ID3D12Debug2
  // =======================
  //
  ID3D12Debug2 = Interface(IUnknown)
  ['{93A665C4-A3B2-4E5D-B692-A26AE14E3374}']

    procedure SetGPUBasedValidationFlags(Flags: D3D12_GPU_BASED_VALIDATION_FLAGS); stdcall;
  end;
  IID_ID3D12Debug2 = ID3D12Debug2;


  // Interface ID3D12Debug3
  // =======================
  //
  ID3D12Debug3 = Interface(ID3D12Debug)
  ['{5CF4E58F-F671-4FF1-A542-3686E3D153D1}']

    procedure SetEnableGPUBasedValidation(Enable: BOOL); stdcall;procedure SetEnableSynchronizedCommandQueueValidation(Enable: BOOL); stdcall;procedure SetGPUBasedValidationFlags(Flags: D3D12_GPU_BASED_VALIDATION_FLAGS); stdcall;
  end;
  IID_ID3D12Debug3 = ID3D12Debug3;


  // Interface ID3D12Debug4
  // =======================
  //
  ID3D12Debug4 = Interface(ID3D12Debug3)
  ['{014B816E-9EC5-4A2F-A845-FFBE441CE13A}']

    procedure DisableDebugLayer(); stdcall;
  end;
  IID_ID3D12Debug4 = ID3D12Debug4;


  // Interface ID3D12Debug5
  // =======================
  //
  ID3D12Debug5 = Interface(ID3D12Debug4)
  ['{548D6B12-09FA-40E0-9069-5DCD589A52C9}']

    procedure SetEnableAutoName(Enable: BOOL); stdcall;
  end;
  IID_ID3D12Debug5 = ID3D12Debug5;


  // Interface ID3D12Debug6
  // =======================
  //
  ID3D12Debug6 = Interface(ID3D12Debug5)
  ['{82A816D6-5D01-4157-97D0-4975463FD1ED}']

    procedure SetForceLegacyBarrierValidation(Enable: BOOL); stdcall;
  end;
  IID_ID3D12Debug6 = ID3D12Debug6;


const
  WKPDID_D3DAutoDebugObjectNameW  : TGUID = (D1: $d4902e36;
                                             D2: $757a;
                                             D3: $4942;
                                             D4: ($95, $94, $b6, $76, $9a, $fa, $43, $cd));


type
  PD3D12_RLDO_FLAGS = ^D3D12_RLDO_FLAGS;
  D3D12_RLDO_FLAGS = UINT;
const
    D3D12_RLDO_NONE            = D3D12_RLDO_FLAGS($0);
    D3D12_RLDO_SUMMARY         = D3D12_RLDO_FLAGS($1);
    D3D12_RLDO_DETAIL          = D3D12_RLDO_FLAGS($2);
    D3D12_RLDO_IGNORE_INTERNAL = D3D12_RLDO_FLAGS($4);


type

  PD3D12_DEBUG_DEVICE_PARAMETER_TYPE = ^D3D12_DEBUG_DEVICE_PARAMETER_TYPE;
  D3D12_DEBUG_DEVICE_PARAMETER_TYPE = (D3D12_DEBUG_DEVICE_PARAMETER_FEATURE_FLAGS,
                                       D3D12_DEBUG_DEVICE_PARAMETER_GPU_BASED_VALIDATION_SETTINGS,
                                       D3D12_DEBUG_DEVICE_PARAMETER_GPU_SLOWDOWN_PERFORMANCE_FACTOR,
                                       { 10.0.28000.0  }
                                       D3D12_DEBUG_DEVICE_PARAMETER_BYTECODE_VALIDATION_MODE
                                      );


type
  PD3D12_DEBUG_FEATURE = ^D3D12_DEBUG_FEATURE;
  D3D12_DEBUG_FEATURE = UINT;
const
    D3D12_DEBUG_FEATURE_NONE                                   = D3D12_DEBUG_FEATURE($00);
    D3D12_DEBUG_FEATURE_ALLOW_BEHAVIOR_CHANGING_DEBUG_AIDS     = D3D12_DEBUG_FEATURE($01);
    D3D12_DEBUG_FEATURE_CONSERVATIVE_RESOURCE_STATE_TRACKING   = D3D12_DEBUG_FEATURE($02);
    D3D12_DEBUG_FEATURE_DISABLE_VIRTUALIZED_BUNDLES_VALIDATION = D3D12_DEBUG_FEATURE($04);
    D3D12_DEBUG_FEATURE_EMULATE_WINDOWS7                       = D3D12_DEBUG_FEATURE($08);


type

  PD3D12_GPU_BASED_VALIDATION_SHADER_PATCH_MODE = ^D3D12_GPU_BASED_VALIDATION_SHADER_PATCH_MODE;
  D3D12_GPU_BASED_VALIDATION_SHADER_PATCH_MODE = (D3D12_GPU_BASED_VALIDATION_SHADER_PATCH_MODE_NONE,
                                                  D3D12_GPU_BASED_VALIDATION_SHADER_PATCH_MODE_STATE_TRACKING_ONLY,
                                                  D3D12_GPU_BASED_VALIDATION_SHADER_PATCH_MODE_UNGUARDED_VALIDATION,
                                                  D3D12_GPU_BASED_VALIDATION_SHADER_PATCH_MODE_GUARDED_VALIDATION,
                                                  NUM_D3D12_GPU_BASED_VALIDATION_SHADER_PATCH_MODES
                                                 );


type
  PD3D12_GPU_BASED_VALIDATION_PIPELINE_STATE_CREATE_FLAGS = ^D3D12_GPU_BASED_VALIDATION_PIPELINE_STATE_CREATE_FLAGS;
  D3D12_GPU_BASED_VALIDATION_PIPELINE_STATE_CREATE_FLAGS = UINT;
const
    D3D12_GPU_BASED_VALIDATION_PIPELINE_STATE_CREATE_FLAG_NONE                                           = D3D12_GPU_BASED_VALIDATION_PIPELINE_STATE_CREATE_FLAGS($00);
    D3D12_GPU_BASED_VALIDATION_PIPELINE_STATE_CREATE_FLAG_FRONT_LOAD_CREATE_TRACKING_ONLY_SHADERS        = D3D12_GPU_BASED_VALIDATION_PIPELINE_STATE_CREATE_FLAGS($01);
    D3D12_GPU_BASED_VALIDATION_PIPELINE_STATE_CREATE_FLAG_FRONT_LOAD_CREATE_UNGUARDED_VALIDATION_SHADERS = D3D12_GPU_BASED_VALIDATION_PIPELINE_STATE_CREATE_FLAGS($02);
    D3D12_GPU_BASED_VALIDATION_PIPELINE_STATE_CREATE_FLAG_FRONT_LOAD_CREATE_GUARDED_VALIDATION_SHADERS   = D3D12_GPU_BASED_VALIDATION_PIPELINE_STATE_CREATE_FLAGS($04);
    D3D12_GPU_BASED_VALIDATION_PIPELINE_STATE_CREATE_FLAGS_VALID_MASK                                    = D3D12_GPU_BASED_VALIDATION_PIPELINE_STATE_CREATE_FLAGS($07);


type

  PD3D12_DEBUG_DEVICE_GPU_BASED_VALIDATION_SETTINGS = ^D3D12_DEBUG_DEVICE_GPU_BASED_VALIDATION_SETTINGS;
  D3D12_DEBUG_DEVICE_GPU_BASED_VALIDATION_SETTINGS = record
    MaxMessagesPerCommandList: UINT;
    DefaultShaderPatchMode: D3D12_GPU_BASED_VALIDATION_SHADER_PATCH_MODE;
    PipelineStateCreateFlags: D3D12_GPU_BASED_VALIDATION_PIPELINE_STATE_CREATE_FLAGS;
  end;


  PD3D12_DEBUG_DEVICE_GPU_SLOWDOWN_PERFORMANCE_FACTOR = ^D3D12_DEBUG_DEVICE_GPU_SLOWDOWN_PERFORMANCE_FACTOR;
  D3D12_DEBUG_DEVICE_GPU_SLOWDOWN_PERFORMANCE_FACTOR = record
    SlowdownFactor: FLOAT;
  end;

  { 10.0.28000.0  }
  PD3D12_DEBUG_DEVICE_BYTECODE_VALIDATION_MODE = ^D3D12_DEBUG_DEVICE_BYTECODE_VALIDATION_MODE;
  D3D12_DEBUG_DEVICE_BYTECODE_VALIDATION_MODE = type Integer;


  // Interface ID3D12DebugDevice1
  // =============================
  //
  ID3D12DebugDevice1 = Interface(IUnknown)
  ['{A9B71770-D099-4A65-A698-3DEE10020F88}']

    function SetDebugParameter(Type_: D3D12_DEBUG_DEVICE_PARAMETER_TYPE;
                               pData: Pointer;
                               DataSize: UINT): HRESULT; stdcall;

    function GetDebugParameter(Type_: D3D12_DEBUG_DEVICE_PARAMETER_TYPE;
                               pData: Pointer;
                               DataSize: UINT): HRESULT; stdcall;

    function ReportLiveDeviceObjects(Flags: D3D12_RLDO_FLAGS): HRESULT; stdcall;
  end;
  IID_ID3D12DebugDevice1 = ID3D12DebugDevice1;


  // Interface ID3D12DebugDevice
  // ============================
  //
  ID3D12DebugDevice = Interface(IUnknown)
  ['{3FEBD6DD-4973-4787-8194-E45F9E28923E}']

    function SetFeatureMask(Mask: D3D12_DEBUG_FEATURE): HRESULT; stdcall;

    function GetFeatureMask(): D3D12_DEBUG_FEATURE; stdcall;

    function ReportLiveDeviceObjects(Flags: D3D12_RLDO_FLAGS): HRESULT; stdcall;
  end;
  IID_ID3D12DebugDevice = ID3D12DebugDevice;


  // Interface ID3D12DebugDevice2
  // =============================
  //
  ID3D12DebugDevice2 = Interface(ID3D12DebugDevice)
  ['{60ECCBC1-378D-4DF1-894C-F8AC5CE4D7DD}']

    function SetDebugParameter(Type_: D3D12_DEBUG_DEVICE_PARAMETER_TYPE;
                               pData: Pointer;
                               DataSize: UINT): HRESULT; stdcall;

    function GetDebugParameter(Type_: D3D12_DEBUG_DEVICE_PARAMETER_TYPE;
                               pData: Pointer;
                               DataSize: UINT): HRESULT; stdcall;
  end;
  IID_ID3D12DebugDevice2 = ID3D12DebugDevice2;


const
  DXGI_DEBUG_D3D12 : TGUID = (D1: $cf59a98c;
                              D2: $a950;
                              D3: $4326;
                              D4: ($91, $ef, $9b, $ba, $a1, $7b, $fd, $95));


type

  // Interface ID3D12DebugCommandQueue
  // ==================================
  //
  ID3D12DebugCommandQueue = Interface(IUnknown)
  ['{09E0BF36-54AC-484F-8847-4BAEEAB6053A}']

    function AssertResourceState(pResource: ID3D12Resource;
                                 Subresource: UINT;
                                 State: UINT): BOOL; stdcall;

    //  TODO: Stale  BOOL AssertResourceStateThroughView( [annotation("_In_")] ID3D12View* pView, UINT State );
  end;
  IID_ID3D12DebugCommandQueue = ID3D12DebugCommandQueue;


  // Update May 2024

  // Interface ID3D12DebugCommandQueue1
  // ==================================
  //
  ID3D12DebugCommandQueue1 = Interface(ID3D12DebugCommandQueue)
  ['{16BE35A2-BFD6-49F2-BCAE-EAAE4AFF862D}']

    procedure AssertResourceAccess(pResource: ID3D12Resource;
                                   Subresource: UINT;
                                   Access: D3D12_BARRIER_ACCESS); stdcall;

    procedure AssertTextureLayout(pResource: ID3D12Resource;
                                  Subresource: UINT;
                                  Layout: D3D12_BARRIER_LAYOUT); stdcall;
  end;
  IID_ID3D12DebugCommandQueue1 = ID3D12DebugCommandQueue1;

  // ==

  PD3D12_DEBUG_COMMAND_LIST_PARAMETER_TYPE = ^D3D12_DEBUG_COMMAND_LIST_PARAMETER_TYPE;
  D3D12_DEBUG_COMMAND_LIST_PARAMETER_TYPE = (D3D12_DEBUG_COMMAND_LIST_PARAMETER_GPU_BASED_VALIDATION_SETTINGS
                                            );


  PD3D12_DEBUG_COMMAND_LIST_GPU_BASED_VALIDATION_SETTINGS = ^D3D12_DEBUG_COMMAND_LIST_GPU_BASED_VALIDATION_SETTINGS;
  D3D12_DEBUG_COMMAND_LIST_GPU_BASED_VALIDATION_SETTINGS = record
    ShaderPatchMode: D3D12_GPU_BASED_VALIDATION_SHADER_PATCH_MODE;
  end;


  // Interface ID3D12DebugCommandList1
  // =================================
  //
  ID3D12DebugCommandList1 = Interface(IUnknown)
  ['{102CA951-311B-4B01-B11F-ECB83E061B37}']

    function AssertResourceState(pResource: ID3D12Resource;
                                 Subresource: UINT;
                                 State: UINT): BOOL; stdcall;

    function SetDebugParameter(Type_: D3D12_DEBUG_COMMAND_LIST_PARAMETER_TYPE;
                               pData: Pointer;
                               DataSize: UINT): HRESULT; stdcall;

    function GetDebugParameter(Type_: D3D12_DEBUG_COMMAND_LIST_PARAMETER_TYPE;
                               pData: Pointer;
                               DataSize: UINT): HRESULT; stdcall;
  end;
  IID_ID3D12DebugCommandList1 = ID3D12DebugCommandList1;


  // Interface ID3D12DebugCommandList
  // ================================
  //
  ID3D12DebugCommandList = Interface(IUnknown)
  ['{09E0BF36-54AC-484F-8847-4BAEEAB6053F}']

    function AssertResourceState(pResource: ID3D12Resource;
                                 Subresource: UINT;
                                 State: UINT): BOOL; stdcall;

    function SetFeatureMask(Mask: D3D12_DEBUG_FEATURE): HRESULT; stdcall;

    function GetFeatureMask(): D3D12_DEBUG_FEATURE; stdcall;
  end;
  IID_ID3D12DebugCommandList = ID3D12DebugCommandList;


  // Update May 2024

  // Interface ID3D12DebugCommandList2
  // =================================
  //
  ID3D12DebugCommandList2 = Interface(ID3D12DebugCommandList)
  ['{AEB575CF-4E06-48BE-BA3B-C450FC96652E}']

    function SetDebugParameter(Type_: D3D12_DEBUG_COMMAND_LIST_PARAMETER_TYPE;
                               pData: Pointer;
                               DataSize: UINT): HRESULT; stdcall;

    function GetDebugParameter(Type_: D3D12_DEBUG_COMMAND_LIST_PARAMETER_TYPE;
                               pData: Pointer;
                               DataSize: UINT): HRESULT; stdcall;
  end;
  IID_ID3D12DebugCommandList2 = ID3D12DebugCommandList2;


  // Interface ID3D12DebugCommandList3
  // =================================
  //
  ID3D12DebugCommandList3 = Interface(ID3D12DebugCommandList2)
  ['{197D5E15-4D37-4D34-AF78-724CD70FDB1F}']

    procedure AssertResourceAccess(pResource: ID3D12Resource;
                                   Subresource: UINT;
                                   Access: D3D12_BARRIER_ACCESS); stdcall;

    procedure AssertTextureLayout(pResource: ID3D12Resource;
                                  Subresource: UINT;
                                  Layout: D3D12_BARRIER_LAYOUT); stdcall;
  end;
  IID_ID3D12DebugCommandList3 = ID3D12DebugCommandList3;

  // ==


  // Interface ID3D12SharingContract
  // ================================
  //
  ID3D12SharingContract = Interface(IUnknown)
  ['{0ADF7D52-929C-4E61-ADDB-FFED30DE66EF}']

    procedure Present(pResource: ID3D12Resource;
                      Subresource: UINT;
                      window: HWND); stdcall;

    procedure SharedFenceSignal(pFence: ID3D12Fence;
                                FenceValue: UINT64); stdcall;

    procedure BeginCapturableWork(const guid: TGUID); stdcall;

    procedure EndCapturableWork(const guid: TGUID); stdcall;
  end;
  IID_ID3D12SharingContract = ID3D12SharingContract;


  // Update May 2024

  // Interface ID3D12ManualWriteTrackingResource
  // ============================================
  //
  ID3D12ManualWriteTrackingResource = Interface(IUnknown)
  ['{86CA3B85-49AD-4B6E-AED5-EDDB18540F41}']

    procedure TrackWrite(Subresource: UINT;
                         pWrittenRange: PD3D12_RANGE); stdcall;
  end;

  // ==

  //============================================================================
  //
  // Info Queue
  //
  //============================================================================

  PD3D12_MESSAGE_CATEGORY = ^D3D12_MESSAGE_CATEGORY;
  D3D12_MESSAGE_CATEGORY = (D3D12_MESSAGE_CATEGORY_APPLICATION_DEFINED,
                            D3D12_MESSAGE_CATEGORY_MISCELLANEOUS,
                            D3D12_MESSAGE_CATEGORY_INITIALIZATION,
                            D3D12_MESSAGE_CATEGORY_CLEANUP,
                            D3D12_MESSAGE_CATEGORY_COMPILATION,
                            D3D12_MESSAGE_CATEGORY_STATE_CREATION,
                            D3D12_MESSAGE_CATEGORY_STATE_SETTING,
                            D3D12_MESSAGE_CATEGORY_STATE_GETTING,
                            D3D12_MESSAGE_CATEGORY_RESOURCE_MANIPULATION,
                            D3D12_MESSAGE_CATEGORY_EXECUTION,
                            D3D12_MESSAGE_CATEGORY_SHADER
                           );


  PD3D12_MESSAGE_SEVERITY = ^D3D12_MESSAGE_SEVERITY;
  D3D12_MESSAGE_SEVERITY = (D3D12_MESSAGE_SEVERITY_CORRUPTION,
                            D3D12_MESSAGE_SEVERITY_ERROR,
                            D3D12_MESSAGE_SEVERITY_WARNING,
                            D3D12_MESSAGE_SEVERITY_INFO,
                            D3D12_MESSAGE_SEVERITY_MESSAGE
                           );


  // Unique ID for every error
  // CAUTION: New enum values should be appended to the list only.  Inserting
  // new enum values into the middle of the list results in changing the numeric
  // values of some ID's from one SDK release to the next.  This in-turn breaks
  // PIX and customer tools/filters.
  PD3D12_MESSAGE_ID = ^D3D12_MESSAGE_ID;
  D3D12_MESSAGE_ID = type Integer;


  PD3D12_MESSAGE = ^D3D12_MESSAGE;
  D3D12_MESSAGE = record
    Category: D3D12_MESSAGE_CATEGORY;
    Severity: D3D12_MESSAGE_SEVERITY;
    ID: D3D12_MESSAGE_ID;
    pDescription: LPCSTR;
    DescriptionByteLength: SIZE_T;
  end;


  PD3D12_INFO_QUEUE_FILTER_DESC = ^D3D12_INFO_QUEUE_FILTER_DESC;
  D3D12_INFO_QUEUE_FILTER_DESC = record
    NumCategories: UINT;
    pCategoryList: PD3D12_MESSAGE_CATEGORY;
    NumSeverities: UINT;
    pSeverityList: PD3D12_MESSAGE_SEVERITY;
    NumIDs: UINT;
    pIDList: PD3D12_MESSAGE_ID;
  end;


  // To use, memset to 0, then fill in what you need.
  PD3D12_INFO_QUEUE_FILTER = ^D3D12_INFO_QUEUE_FILTER;
  D3D12_INFO_QUEUE_FILTER = record
    AllowList: D3D12_INFO_QUEUE_FILTER_DESC;
    DenyList: D3D12_INFO_QUEUE_FILTER_DESC;
  end;


  //============================================================================
  // ID3D12InfoQueue
  //
  // Logs D3D12 Messages.
  // This interface can be queried from ID3D12Device, as long as the device
  // was created with the debug layer.
  //

const
  D3D12_INFO_QUEUE_DEFAULT_MESSAGE_COUNT_LIMIT = 1024;


type

  // Interface ID3D12InfoQueue
  // ==========================
  //
  ID3D12InfoQueue = Interface(IUnknown)
  ['{0742A90B-C387-483F-B946-30A7E4E61458}']

    //=========================================================================
    // Methods for configuring how much data is stored in the queue.

    // SetMessageCountLimit()
    // This sets how many messages are stored.  When the queue is full,
    // new messages coming in push old messages out.
    // Passing -1 to SetMessageCountLimit means the queue has
    // unlimited size (go until out of memory or ClearStoredMessages()).
    // The default message count size is
    // D3D12_INFO_QUEUE_DEFAULT_MESSAGE_COUNT_LIMIT
    // Returns S_OK or E_INVALIDARG.
    function SetMessageCountLimit(MessageCountLimit: UINT64): HRESULT; stdcall;

    // ClearStoredMessages
    procedure ClearStoredMessages(); stdcall;


    //=========================================================================
    // Methods for retrieving data or statistics from the queue.

    // GetMessage()
    // Retrieves messages, one at a time, from the queue which pass any
    // retrieval filter currently defined.  If there is no retrieval filter,
    // all messages can be retrieved.
    // The MessageIndex parameter is a 0 based index into the results passing
    // the filter.  The number of results is returned by
    // GetNumStoredMessagesAllowedByRetrievalFilter().
    //
    // Note this does not remove the message from the queue.
    //
    // pMessageByteLength inputs the size of the buffer passed in via
    // pMessage, and outputs the size of the message.  pMessage can be NULL
    // when the size of the required buffer is being queried (return S_FALSE).
    //
    // NOTE: The returned buffer pMessage is NOT just the size of D3D12_MESSAGE,
    // it includes extra memory after the D3D12_MESSAGE for storing the string
    // description, which is pointed to from within D3D12_MESSAGE.  Therefore
    // applications should check the size needed for pMessage as described above.
    //
    // Watch out for thread safety when making consecutive calls first to
    // determine the buffer size required and then to pass in the buffer and
    // retrieve the message, and also between calling
    // GetNumStoredMessagesAllowedByRetrievalFilter() and enumerating through
    // the results via GetMessagE().
    //
    // Returns: S_OK, S_FALSE, E_INVALIDARG or E_OUTOFMEMORY.
    function GetMessage(MessageIndex: UINT64;
                        pMessage: PD3D12_MESSAGE;
                        pMessageByteLength: PSIZE_T): HRESULT; stdcall;

    // GetNumMessagesAllowedByStorageFilter()
    // Returns how many messages sent to the queue passed
    // whatever storage filter was active upon receipt of
    // the message.
    // This can be a larger value than the message count limit,
    // returned by GetMessageCountLimit(), since old messages are discarded
    // when the queue is full to prevent overflow.
    function GetNumMessagesAllowedByStorageFilter(): UINT64; stdcall;

    // GetNumMessagesDeniedByStorageFilter()
    function GetNumMessagesDeniedByStorageFilter(): UINT64; stdcall;

    // GetNumStoredMessages()
    // Returns how many messages are currently stored in the queue.
    function GetNumStoredMessages(): UINT64; stdcall;

    // GetNumStoredMessagesAllowedByRetrievalFilter()
    // Returns how many messages that are currently in the queue
    // pass any retrieval filter that is currently set.
    // The MessageIndex parameter to GetMessage() indexes
    // an array of this many results.
    function GetNumStoredMessagesAllowedByRetrievalFilter(): UINT64; stdcall;

    // GetNumMessagesDiscardedByMessageCountLimit()
    function GetNumMessagesDiscardedByMessageCountLimit(): UINT64; stdcall;

    // GetMessageCountLimit
    // This is how many messages can be stored in the queue.
    // When the queue is full, new messages coming in push old messages out.
    // -1 means there is no limit.
    function GetMessageCountLimit(): UINT64; stdcall;


    //=========================================================================
    // Methods for filtering what gets stored in the queue

    // AddStorageFilterEntries()
    // Adds to the existing entries at top of stack
    // Returns: S_OK, E_INVALIDARG or E_OUTOFMEMORY.
    function AddStorageFilterEntries(pFilter: PD3D12_INFO_QUEUE_FILTER): HRESULT; stdcall;

    // GetStorageFilter()
    // Gets all entries at top of stack.
    // The application must allocate the output buffer.  The size required can be
    // queried by passing null for pFilter and looking at the returned
    // pFilterByteLength (HRESULT is S_FALSE). Note that D3D12_INFO_QUEUE_FILTER contains
    // pointers - these will point to locations within the same
    // contiguous buffer - *pFilterByteLength is the total storage needed for all
    // data.  So the application needs to only allocate/free the memory for pFilter.
    // Returns S_OK, S_FALSE, E_INVALIDARG or E_OUTOFMEMORY
    function GetStorageFilter(pFilter: PD3D12_INFO_QUEUE_FILTER;
                              pFilterByteLength: PSIZE_T): HRESULT; stdcall;

    // ClearStorageFilter()
    // Clears filter at the top of the stack (if there is one)
    procedure ClearStorageFilter(); stdcall;// PushEmptyStorageFilter()
    // Push an empty storage filter on the stack to allow local filtering changes.
    // For convenience, this is automatically called by SetStorageFilter()
    // if the stack is empty.  Thus if the stack is not needed, filters can be
    // defined without ever bothering to push or pop.
    // Returns S_OK or E_OUTOFMEMORY
    function PushEmptyStorageFilter(): HRESULT; stdcall;

    // PushCopyOfStorageFilter()
    // Push a copy of the current filter so that local modifications can be made
    // starting from what currently exists.
    // Returns S_OK or E_OUTOFMEMORY
    function PushCopyOfStorageFilter(): HRESULT; stdcall;

    // PushStorageFilter()
    // Push a filter passed as a parameter onto the stack.  This is
    // just a helper for calling PushEmptyStorageFilter() followed
    // by AddStorageFilterEntries()
    // Returns S_OK, E_INVALIDARG or E_OUTOFMEMORY.
    function PushStorageFilter(pFilter: PD3D12_INFO_QUEUE_FILTER): HRESULT; stdcall;

    // PopStorageFilter()
    // Pop the current storage filter off the stack (if there is one)
    procedure PopStorageFilter(); stdcall;

    // GetStorageFilterStackSize()
    function GetStorageFilterStackSize(): UINT; stdcall;


    //=========================================================================
    // Methods for filtering what gets read out of the queue by GetMessage().

    // AddRetrievalFilterEntries()
    // Adds to the existing entries at top of stack
    // Returns: S_OK, E_INVALIDARG or E_OUTOFMEMORY.
    function AddRetrievalFilterEntries(pFilter: PD3D12_INFO_QUEUE_FILTER): HRESULT; stdcall;

    // GetRetrievalFilter()
    // Gets all entries at top of stack.
    // The application must allocate the output buffer.  The size required can be
    // queried by passing null for pFilter and looking at the returned
    // pFilterByteLength (HRESULT is S_FALSE).  Note that D3D12_INFO_QUEUE_FILTER contains
    // pointers - these will point to locations within the same
    // contiguous buffer - *pFilterByteLength is the total storage needed for all
    // data.  So the application needs to only allocate/free the memory for pFilter.
    // Returns S_OK, S_FALSE, E_INVALIDARG or E_OUTOFMEMORY
    function GetRetrievalFilter(pFilter: PD3D12_INFO_QUEUE_FILTER;
                                pFilterByteLength: PSIZE_T): HRESULT; stdcall;

    // ClearRetrievalFilter()
    // Clears filter at the top of the stack (if there is one)
    procedure ClearRetrievalFilter(); stdcall;

    // PushEmptyRetrievalFilter()
    // Push an empty storage filter on the stack to allow local filtering changes.
    // For convenience, this is automatically called by SetRetrievalFilter()
    // if the stack is empty.  Thus if the stack is not needed, filters can be
    // defined without ever bothering to push or pop.
    // Returns S_OK or E_OUTOFMEMORY
    function PushEmptyRetrievalFilter(): HRESULT; stdcall;

    // PushCopyOfRetrievalFilter()
    // Push a copy of the current filter so that local modifications can be made
    // starting from what currently exists.
    // Returns S_OK or E_OUTOFMEMORY
    function PushCopyOfRetrievalFilter(): HRESULT; stdcall;

    // PushRetrievalFilter()
    // Push a filter passed as a parameter onto the stack.  This is
    // just a helper for calling PushEmptyRetrievalFilter() followed
    // by AddRetrievalFilterEntries()
    // Returns S_OK, E_INVALIDARG or E_OUTOFMEMORY.
    function PushRetrievalFilter(pFilter: PD3D12_INFO_QUEUE_FILTER): HRESULT; stdcall;

    // PopRetrievalFilter()
    procedure PopRetrievalFilter(); stdcall;

    // GetRetrievalFilterStackSize()
    function GetRetrievalFilterStackSize(): UINT; stdcall;


    //=========================================================================
    //  Methods for adding entries to the queue.

    // AddMessage()
    // This is used by D3D12 components to log messages. Nothing stops
    // applications from calling this, but it isnâ€™t particularly useful.
    // If an application wishes to insert custom strings into the queue,
    // AddApplicationMessage() below is suggested.  See below.
    //
    // Returns S_OK, E_INVALIDARG or E_OUTOFMEMORY
    function AddMessage(Category: D3D12_MESSAGE_CATEGORY;
                        Severity: D3D12_MESSAGE_SEVERITY;
                        ID: D3D12_MESSAGE_ID;
                        pDescription: LPCSTR): HRESULT; stdcall;

    // AddApplicationMessage()
    // This is a convenience for applications that want
    // to insert strings of their own into the queue, perhaps to log issues
    // of its own, or to mark out points in time in the queue.  This
    // has the same effect as calling AddMessage() above with the
    // following settings:
    //          Category = D3D12_MESSAGE_CATEGORY_APPLICATION_DEFINED
    //          Severity = <app selects from D3D12_MESSAGE_SEVERITY>
    //          ID       = D3D12_MESSAGE_ID_STRING_FROM_APPLICATION
    //          pDescription = <application provided string>
    //
    // Returns S_OK, E_INVALIDARG or E_OUTOFMEMORY
    function AddApplicationMessage(Severity: D3D12_MESSAGE_SEVERITY;
                                   pDescription: LPCSTR): HRESULT; stdcall;


    //=========================================================================
    //  Methods for breaking on errors that pass the storage filter.

    function SetBreakOnCategory(Category: D3D12_MESSAGE_CATEGORY;
                                bEnable: BOOL): HRESULT; stdcall;

    function SetBreakOnSeverity(Severity: D3D12_MESSAGE_SEVERITY;
                                bEnable: BOOL): HRESULT; stdcall;

    function SetBreakOnID(ID: D3D12_MESSAGE_ID;
                          bEnable: BOOL): HRESULT; stdcall;

    function GetBreakOnCategory(Category: D3D12_MESSAGE_CATEGORY): BOOL; stdcall;

    function GetBreakOnSeverity(Severity: D3D12_MESSAGE_SEVERITY): BOOL; stdcall;

    function GetBreakOnID(ID: D3D12_MESSAGE_ID): BOOL; stdcall;


    //=========================================================================
    //  Methods for globally muting debug spte from the InfoQueue

    procedure SetMuteDebugOutput(bMute: BOOL); stdcall;

    function GetMuteDebugOutput(): BOOL; stdcall;
  end;
  IID_ID3D12InfoQueue = ID3D12InfoQueue;


type
  PD3D12_MESSAGE_CALLBACK_FLAGS = ^D3D12_MESSAGE_CALLBACK_FLAGS;
  D3D12_MESSAGE_CALLBACK_FLAGS = UINT;
const
    D3D12_MESSAGE_CALLBACK_FLAG_NONE      = D3D12_MESSAGE_CALLBACK_FLAGS($00);
    D3D12_MESSAGE_CALLBACK_IGNORE_FILTERS = D3D12_MESSAGE_CALLBACK_FLAGS($01);


type

  D3D12MessageFunc = procedure(Category: D3D12_MESSAGE_CATEGORY;
                               Severity: D3D12_MESSAGE_SEVERITY;
                               ID: D3D12_MESSAGE_ID;
                               pDescription: LPCSTR;
                               pContext: Pointer); stdcall;


  // Interface ID3D12InfoQueue1
  // ===========================
  //
  ID3D12InfoQueue1 = Interface(ID3D12InfoQueue)
  ['{2852DD88-B484-4C0C-B6B1-67168500E600}']

    function RegisterMessageCallback(CallbackFunc: D3D12MessageFunc;
                                     CallbackFilterFlags: D3D12_MESSAGE_CALLBACK_FLAGS;
                                     pContext: Pointer;
                                     pCallbackCookie: PDWORD): HRESULT; stdcall;

    function UnregisterMessageCallback(CallbackCookie: DWORD): HRESULT; stdcall;
  end;
  IID_ID3D12InfoQueue1 = ID3D12InfoQueue1;


  // Additional Prototypes for ALL interfaces

  // End of Additional Prototypes

const
  D3D12_DEBUG_DEVICE_BYTECODE_VALIDATION_DISABLED: D3D12_DEBUG_DEVICE_BYTECODE_VALIDATION_MODE = 0;
  D3D12_DEBUG_DEVICE_BYTECODE_VALIDATION_WHEN_HASH_BYPASSED: D3D12_DEBUG_DEVICE_BYTECODE_VALIDATION_MODE = 1;
  D3D12_DEBUG_DEVICE_BYTECODE_VALIDATION_ALL_BYTECODE: D3D12_DEBUG_DEVICE_BYTECODE_VALIDATION_MODE = 2;
  D3D12_DEBUG_DEVICE_BYTECODE_VALIDATION_MODE_DEFAULT: D3D12_DEBUG_DEVICE_BYTECODE_VALIDATION_MODE = 1;
  D3D12_MESSAGE_ID_UNKNOWN: D3D12_MESSAGE_ID = 0;
  D3D12_MESSAGE_ID_STRING_FROM_APPLICATION: D3D12_MESSAGE_ID = 1;
  D3D12_MESSAGE_ID_CORRUPTED_THIS: D3D12_MESSAGE_ID = 2;
  D3D12_MESSAGE_ID_CORRUPTED_PARAMETER1: D3D12_MESSAGE_ID = 3;
  D3D12_MESSAGE_ID_CORRUPTED_PARAMETER2: D3D12_MESSAGE_ID = 4;
  D3D12_MESSAGE_ID_CORRUPTED_PARAMETER3: D3D12_MESSAGE_ID = 5;
  D3D12_MESSAGE_ID_CORRUPTED_PARAMETER4: D3D12_MESSAGE_ID = 6;
  D3D12_MESSAGE_ID_CORRUPTED_PARAMETER5: D3D12_MESSAGE_ID = 7;
  D3D12_MESSAGE_ID_CORRUPTED_PARAMETER6: D3D12_MESSAGE_ID = 8;
  D3D12_MESSAGE_ID_CORRUPTED_PARAMETER7: D3D12_MESSAGE_ID = 9;
  D3D12_MESSAGE_ID_CORRUPTED_PARAMETER8: D3D12_MESSAGE_ID = 10;
  D3D12_MESSAGE_ID_CORRUPTED_PARAMETER9: D3D12_MESSAGE_ID = 11;
  D3D12_MESSAGE_ID_CORRUPTED_PARAMETER10: D3D12_MESSAGE_ID = 12;
  D3D12_MESSAGE_ID_CORRUPTED_PARAMETER11: D3D12_MESSAGE_ID = 13;
  D3D12_MESSAGE_ID_CORRUPTED_PARAMETER12: D3D12_MESSAGE_ID = 14;
  D3D12_MESSAGE_ID_CORRUPTED_PARAMETER13: D3D12_MESSAGE_ID = 15;
  D3D12_MESSAGE_ID_CORRUPTED_PARAMETER14: D3D12_MESSAGE_ID = 16;
  D3D12_MESSAGE_ID_CORRUPTED_PARAMETER15: D3D12_MESSAGE_ID = 17;
  D3D12_MESSAGE_ID_CORRUPTED_MULTITHREADING: D3D12_MESSAGE_ID = 18;
  D3D12_MESSAGE_ID_MESSAGE_REPORTING_OUTOFMEMORY: D3D12_MESSAGE_ID = 19;
  D3D12_MESSAGE_ID_GETPRIVATEDATA_MOREDATA: D3D12_MESSAGE_ID = 20;
  D3D12_MESSAGE_ID_SETPRIVATEDATA_INVALIDFREEDATA: D3D12_MESSAGE_ID = 21;
  D3D12_MESSAGE_ID_SETPRIVATEDATA_CHANGINGPARAMS: D3D12_MESSAGE_ID = 24;
  D3D12_MESSAGE_ID_SETPRIVATEDATA_OUTOFMEMORY: D3D12_MESSAGE_ID = 25;
  D3D12_MESSAGE_ID_CREATESHADERRESOURCEVIEW_UNRECOGNIZEDFORMAT: D3D12_MESSAGE_ID = 26;
  D3D12_MESSAGE_ID_CREATESHADERRESOURCEVIEW_INVALIDDESC: D3D12_MESSAGE_ID = 27;
  D3D12_MESSAGE_ID_CREATESHADERRESOURCEVIEW_INVALIDFORMAT: D3D12_MESSAGE_ID = 28;
  D3D12_MESSAGE_ID_CREATESHADERRESOURCEVIEW_INVALIDVIDEOPLANESLICE: D3D12_MESSAGE_ID = 29;
  D3D12_MESSAGE_ID_CREATESHADERRESOURCEVIEW_INVALIDPLANESLICE: D3D12_MESSAGE_ID = 30;
  D3D12_MESSAGE_ID_CREATESHADERRESOURCEVIEW_INVALIDDIMENSIONS: D3D12_MESSAGE_ID = 31;
  D3D12_MESSAGE_ID_CREATESHADERRESOURCEVIEW_INVALIDRESOURCE: D3D12_MESSAGE_ID = 32;
  D3D12_MESSAGE_ID_CREATERENDERTARGETVIEW_UNRECOGNIZEDFORMAT: D3D12_MESSAGE_ID = 35;
  D3D12_MESSAGE_ID_CREATERENDERTARGETVIEW_UNSUPPORTEDFORMAT: D3D12_MESSAGE_ID = 36;
  D3D12_MESSAGE_ID_CREATERENDERTARGETVIEW_INVALIDDESC: D3D12_MESSAGE_ID = 37;
  D3D12_MESSAGE_ID_CREATERENDERTARGETVIEW_INVALIDFORMAT: D3D12_MESSAGE_ID = 38;
  D3D12_MESSAGE_ID_CREATERENDERTARGETVIEW_INVALIDVIDEOPLANESLICE: D3D12_MESSAGE_ID = 39;
  D3D12_MESSAGE_ID_CREATERENDERTARGETVIEW_INVALIDPLANESLICE: D3D12_MESSAGE_ID = 40;
  D3D12_MESSAGE_ID_CREATERENDERTARGETVIEW_INVALIDDIMENSIONS: D3D12_MESSAGE_ID = 41;
  D3D12_MESSAGE_ID_CREATERENDERTARGETVIEW_INVALIDRESOURCE: D3D12_MESSAGE_ID = 42;
  D3D12_MESSAGE_ID_CREATEDEPTHSTENCILVIEW_UNRECOGNIZEDFORMAT: D3D12_MESSAGE_ID = 45;
  D3D12_MESSAGE_ID_CREATEDEPTHSTENCILVIEW_INVALIDDESC: D3D12_MESSAGE_ID = 46;
  D3D12_MESSAGE_ID_CREATEDEPTHSTENCILVIEW_INVALIDFORMAT: D3D12_MESSAGE_ID = 47;
  D3D12_MESSAGE_ID_CREATEDEPTHSTENCILVIEW_INVALIDDIMENSIONS: D3D12_MESSAGE_ID = 48;
  D3D12_MESSAGE_ID_CREATEDEPTHSTENCILVIEW_INVALIDRESOURCE: D3D12_MESSAGE_ID = 49;
  D3D12_MESSAGE_ID_CREATEINPUTLAYOUT_OUTOFMEMORY: D3D12_MESSAGE_ID = 52;
  D3D12_MESSAGE_ID_CREATEINPUTLAYOUT_TOOMANYELEMENTS: D3D12_MESSAGE_ID = 53;
  D3D12_MESSAGE_ID_CREATEINPUTLAYOUT_INVALIDFORMAT: D3D12_MESSAGE_ID = 54;
  D3D12_MESSAGE_ID_CREATEINPUTLAYOUT_INCOMPATIBLEFORMAT: D3D12_MESSAGE_ID = 55;
  D3D12_MESSAGE_ID_CREATEINPUTLAYOUT_INVALIDSLOT: D3D12_MESSAGE_ID = 56;
  D3D12_MESSAGE_ID_CREATEINPUTLAYOUT_INVALIDINPUTSLOTCLASS: D3D12_MESSAGE_ID = 57;
  D3D12_MESSAGE_ID_CREATEINPUTLAYOUT_STEPRATESLOTCLASSMISMATCH: D3D12_MESSAGE_ID = 58;
  D3D12_MESSAGE_ID_CREATEINPUTLAYOUT_INVALIDSLOTCLASSCHANGE: D3D12_MESSAGE_ID = 59;
  D3D12_MESSAGE_ID_CREATEINPUTLAYOUT_INVALIDSTEPRATECHANGE: D3D12_MESSAGE_ID = 60;
  D3D12_MESSAGE_ID_CREATEINPUTLAYOUT_INVALIDALIGNMENT: D3D12_MESSAGE_ID = 61;
  D3D12_MESSAGE_ID_CREATEINPUTLAYOUT_DUPLICATESEMANTIC: D3D12_MESSAGE_ID = 62;
  D3D12_MESSAGE_ID_CREATEINPUTLAYOUT_UNPARSEABLEINPUTSIGNATURE: D3D12_MESSAGE_ID = 63;
  D3D12_MESSAGE_ID_CREATEINPUTLAYOUT_NULLSEMANTIC: D3D12_MESSAGE_ID = 64;
  D3D12_MESSAGE_ID_CREATEINPUTLAYOUT_MISSINGELEMENT: D3D12_MESSAGE_ID = 65;
  D3D12_MESSAGE_ID_CREATEVERTEXSHADER_OUTOFMEMORY: D3D12_MESSAGE_ID = 66;
  D3D12_MESSAGE_ID_CREATEVERTEXSHADER_INVALIDSHADERBYTECODE: D3D12_MESSAGE_ID = 67;
  D3D12_MESSAGE_ID_CREATEVERTEXSHADER_INVALIDSHADERTYPE: D3D12_MESSAGE_ID = 68;
  D3D12_MESSAGE_ID_CREATEGEOMETRYSHADER_OUTOFMEMORY: D3D12_MESSAGE_ID = 69;
  D3D12_MESSAGE_ID_CREATEGEOMETRYSHADER_INVALIDSHADERBYTECODE: D3D12_MESSAGE_ID = 70;
  D3D12_MESSAGE_ID_CREATEGEOMETRYSHADER_INVALIDSHADERTYPE: D3D12_MESSAGE_ID = 71;
  D3D12_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_OUTOFMEMORY: D3D12_MESSAGE_ID = 72;
  D3D12_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDSHADERBYTECODE: D3D12_MESSAGE_ID = 73;
  D3D12_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDSHADERTYPE: D3D12_MESSAGE_ID = 74;
  D3D12_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDNUMENTRIES: D3D12_MESSAGE_ID = 75;
  D3D12_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_OUTPUTSTREAMSTRIDEUNUSED: D3D12_MESSAGE_ID = 76;
  D3D12_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_OUTPUTSLOT0EXPECTED: D3D12_MESSAGE_ID = 79;
  D3D12_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDOUTPUTSLOT: D3D12_MESSAGE_ID = 80;
  D3D12_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_ONLYONEELEMENTPERSLOT: D3D12_MESSAGE_ID = 81;
  D3D12_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDCOMPONENTCOUNT: D3D12_MESSAGE_ID = 82;
  D3D12_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDSTARTCOMPONENTANDCOMPONENTCOUNT: D3D12_MESSAGE_ID = 83;
  D3D12_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDGAPDEFINITION: D3D12_MESSAGE_ID = 84;
  D3D12_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_REPEATEDOUTPUT: D3D12_MESSAGE_ID = 85;
  D3D12_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDOUTPUTSTREAMSTRIDE: D3D12_MESSAGE_ID = 86;
  D3D12_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_MISSINGSEMANTIC: D3D12_MESSAGE_ID = 87;
  D3D12_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_MASKMISMATCH: D3D12_MESSAGE_ID = 88;
  D3D12_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_CANTHAVEONLYGAPS: D3D12_MESSAGE_ID = 89;
  D3D12_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_DECLTOOCOMPLEX: D3D12_MESSAGE_ID = 90;
  D3D12_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_MISSINGOUTPUTSIGNATURE: D3D12_MESSAGE_ID = 91;
  D3D12_MESSAGE_ID_CREATEPIXELSHADER_OUTOFMEMORY: D3D12_MESSAGE_ID = 92;
  D3D12_MESSAGE_ID_CREATEPIXELSHADER_INVALIDSHADERBYTECODE: D3D12_MESSAGE_ID = 93;
  D3D12_MESSAGE_ID_CREATEPIXELSHADER_INVALIDSHADERTYPE: D3D12_MESSAGE_ID = 94;
  D3D12_MESSAGE_ID_CREATERASTERIZERSTATE_INVALIDFILLMODE: D3D12_MESSAGE_ID = 95;
  D3D12_MESSAGE_ID_CREATERASTERIZERSTATE_INVALIDCULLMODE: D3D12_MESSAGE_ID = 96;
  D3D12_MESSAGE_ID_CREATERASTERIZERSTATE_INVALIDDEPTHBIASCLAMP: D3D12_MESSAGE_ID = 97;
  D3D12_MESSAGE_ID_CREATERASTERIZERSTATE_INVALIDSLOPESCALEDDEPTHBIAS: D3D12_MESSAGE_ID = 98;
  D3D12_MESSAGE_ID_CREATEDEPTHSTENCILSTATE_INVALIDDEPTHWRITEMASK: D3D12_MESSAGE_ID = 100;
  D3D12_MESSAGE_ID_CREATEDEPTHSTENCILSTATE_INVALIDDEPTHFUNC: D3D12_MESSAGE_ID = 101;
  D3D12_MESSAGE_ID_CREATEDEPTHSTENCILSTATE_INVALIDFRONTFACESTENCILFAILOP: D3D12_MESSAGE_ID = 102;
  D3D12_MESSAGE_ID_CREATEDEPTHSTENCILSTATE_INVALIDFRONTFACESTENCILZFAILOP: D3D12_MESSAGE_ID = 103;
  D3D12_MESSAGE_ID_CREATEDEPTHSTENCILSTATE_INVALIDFRONTFACESTENCILPASSOP: D3D12_MESSAGE_ID = 104;
  D3D12_MESSAGE_ID_CREATEDEPTHSTENCILSTATE_INVALIDFRONTFACESTENCILFUNC: D3D12_MESSAGE_ID = 105;
  D3D12_MESSAGE_ID_CREATEDEPTHSTENCILSTATE_INVALIDBACKFACESTENCILFAILOP: D3D12_MESSAGE_ID = 106;
  D3D12_MESSAGE_ID_CREATEDEPTHSTENCILSTATE_INVALIDBACKFACESTENCILZFAILOP: D3D12_MESSAGE_ID = 107;
  D3D12_MESSAGE_ID_CREATEDEPTHSTENCILSTATE_INVALIDBACKFACESTENCILPASSOP: D3D12_MESSAGE_ID = 108;
  D3D12_MESSAGE_ID_CREATEDEPTHSTENCILSTATE_INVALIDBACKFACESTENCILFUNC: D3D12_MESSAGE_ID = 109;
  D3D12_MESSAGE_ID_CREATEBLENDSTATE_INVALIDSRCBLEND: D3D12_MESSAGE_ID = 111;
  D3D12_MESSAGE_ID_CREATEBLENDSTATE_INVALIDDESTBLEND: D3D12_MESSAGE_ID = 112;
  D3D12_MESSAGE_ID_CREATEBLENDSTATE_INVALIDBLENDOP: D3D12_MESSAGE_ID = 113;
  D3D12_MESSAGE_ID_CREATEBLENDSTATE_INVALIDSRCBLENDALPHA: D3D12_MESSAGE_ID = 114;
  D3D12_MESSAGE_ID_CREATEBLENDSTATE_INVALIDDESTBLENDALPHA: D3D12_MESSAGE_ID = 115;
  D3D12_MESSAGE_ID_CREATEBLENDSTATE_INVALIDBLENDOPALPHA: D3D12_MESSAGE_ID = 116;
  D3D12_MESSAGE_ID_CREATEBLENDSTATE_INVALIDRENDERTARGETWRITEMASK: D3D12_MESSAGE_ID = 117;
  D3D12_MESSAGE_ID_GET_PROGRAM_IDENTIFIER_ERROR: D3D12_MESSAGE_ID = 118;
  D3D12_MESSAGE_ID_GET_WORK_GRAPH_PROPERTIES_ERROR: D3D12_MESSAGE_ID = 119;
  D3D12_MESSAGE_ID_SET_PROGRAM_ERROR: D3D12_MESSAGE_ID = 120;
  D3D12_MESSAGE_ID_CLEARDEPTHSTENCILVIEW_INVALID: D3D12_MESSAGE_ID = 135;
  D3D12_MESSAGE_ID_COMMAND_LIST_DRAW_ROOT_SIGNATURE_NOT_SET: D3D12_MESSAGE_ID = 200;
  D3D12_MESSAGE_ID_COMMAND_LIST_DRAW_ROOT_SIGNATURE_MISMATCH: D3D12_MESSAGE_ID = 201;
  D3D12_MESSAGE_ID_COMMAND_LIST_DRAW_VERTEX_BUFFER_NOT_SET: D3D12_MESSAGE_ID = 202;
  D3D12_MESSAGE_ID_COMMAND_LIST_DRAW_VERTEX_BUFFER_STRIDE_TOO_SMALL: D3D12_MESSAGE_ID = 209;
  D3D12_MESSAGE_ID_COMMAND_LIST_DRAW_VERTEX_BUFFER_TOO_SMALL: D3D12_MESSAGE_ID = 210;
  D3D12_MESSAGE_ID_COMMAND_LIST_DRAW_INDEX_BUFFER_NOT_SET: D3D12_MESSAGE_ID = 211;
  D3D12_MESSAGE_ID_COMMAND_LIST_DRAW_INDEX_BUFFER_FORMAT_INVALID: D3D12_MESSAGE_ID = 212;
  D3D12_MESSAGE_ID_COMMAND_LIST_DRAW_INDEX_BUFFER_TOO_SMALL: D3D12_MESSAGE_ID = 213;
  D3D12_MESSAGE_ID_COMMAND_LIST_DRAW_INVALID_PRIMITIVETOPOLOGY: D3D12_MESSAGE_ID = 219;
  D3D12_MESSAGE_ID_COMMAND_LIST_DRAW_VERTEX_STRIDE_UNALIGNED: D3D12_MESSAGE_ID = 221;
  D3D12_MESSAGE_ID_COMMAND_LIST_DRAW_INDEX_OFFSET_UNALIGNED: D3D12_MESSAGE_ID = 222;
  D3D12_MESSAGE_ID_DEVICE_REMOVAL_PROCESS_AT_FAULT: D3D12_MESSAGE_ID = 232;
  D3D12_MESSAGE_ID_DEVICE_REMOVAL_PROCESS_POSSIBLY_AT_FAULT: D3D12_MESSAGE_ID = 233;
  D3D12_MESSAGE_ID_DEVICE_REMOVAL_PROCESS_NOT_AT_FAULT: D3D12_MESSAGE_ID = 234;
  D3D12_MESSAGE_ID_CREATEINPUTLAYOUT_TRAILING_DIGIT_IN_SEMANTIC: D3D12_MESSAGE_ID = 239;
  D3D12_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_TRAILING_DIGIT_IN_SEMANTIC: D3D12_MESSAGE_ID = 240;
  D3D12_MESSAGE_ID_CREATEINPUTLAYOUT_TYPE_MISMATCH: D3D12_MESSAGE_ID = 245;
  D3D12_MESSAGE_ID_CREATEINPUTLAYOUT_EMPTY_LAYOUT: D3D12_MESSAGE_ID = 253;
  D3D12_MESSAGE_ID_LIVE_OBJECT_SUMMARY: D3D12_MESSAGE_ID = 255;
  D3D12_MESSAGE_ID_LIVE_DEVICE: D3D12_MESSAGE_ID = 274;
  D3D12_MESSAGE_ID_LIVE_SWAPCHAIN: D3D12_MESSAGE_ID = 275;
  D3D12_MESSAGE_ID_CREATEDEPTHSTENCILVIEW_INVALIDFLAGS: D3D12_MESSAGE_ID = 276;
  D3D12_MESSAGE_ID_CREATEVERTEXSHADER_INVALIDCLASSLINKAGE: D3D12_MESSAGE_ID = 277;
  D3D12_MESSAGE_ID_CREATEGEOMETRYSHADER_INVALIDCLASSLINKAGE: D3D12_MESSAGE_ID = 278;
  D3D12_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDSTREAMTORASTERIZER: D3D12_MESSAGE_ID = 280;
  D3D12_MESSAGE_ID_CREATEPIXELSHADER_INVALIDCLASSLINKAGE: D3D12_MESSAGE_ID = 283;
  D3D12_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDSTREAM: D3D12_MESSAGE_ID = 284;
  D3D12_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_UNEXPECTEDENTRIES: D3D12_MESSAGE_ID = 285;
  D3D12_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_UNEXPECTEDSTRIDES: D3D12_MESSAGE_ID = 286;
  D3D12_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDNUMSTRIDES: D3D12_MESSAGE_ID = 287;
  D3D12_MESSAGE_ID_CREATEHULLSHADER_OUTOFMEMORY: D3D12_MESSAGE_ID = 289;
  D3D12_MESSAGE_ID_CREATEHULLSHADER_INVALIDSHADERBYTECODE: D3D12_MESSAGE_ID = 290;
  D3D12_MESSAGE_ID_CREATEHULLSHADER_INVALIDSHADERTYPE: D3D12_MESSAGE_ID = 291;
  D3D12_MESSAGE_ID_CREATEHULLSHADER_INVALIDCLASSLINKAGE: D3D12_MESSAGE_ID = 292;
  D3D12_MESSAGE_ID_CREATEDOMAINSHADER_OUTOFMEMORY: D3D12_MESSAGE_ID = 294;
  D3D12_MESSAGE_ID_CREATEDOMAINSHADER_INVALIDSHADERBYTECODE: D3D12_MESSAGE_ID = 295;
  D3D12_MESSAGE_ID_CREATEDOMAINSHADER_INVALIDSHADERTYPE: D3D12_MESSAGE_ID = 296;
  D3D12_MESSAGE_ID_CREATEDOMAINSHADER_INVALIDCLASSLINKAGE: D3D12_MESSAGE_ID = 297;
  D3D12_MESSAGE_ID_RESOURCE_UNMAP_NOTMAPPED: D3D12_MESSAGE_ID = 310;
  D3D12_MESSAGE_ID_DEVICE_CHECKFEATURESUPPORT_MISMATCHED_DATA_SIZE: D3D12_MESSAGE_ID = 318;
  D3D12_MESSAGE_ID_CREATECOMPUTESHADER_OUTOFMEMORY: D3D12_MESSAGE_ID = 321;
  D3D12_MESSAGE_ID_CREATECOMPUTESHADER_INVALIDSHADERBYTECODE: D3D12_MESSAGE_ID = 322;
  D3D12_MESSAGE_ID_CREATECOMPUTESHADER_INVALIDCLASSLINKAGE: D3D12_MESSAGE_ID = 323;
  D3D12_MESSAGE_ID_DEVICE_CREATEVERTEXSHADER_DOUBLEFLOATOPSNOTSUPPORTED: D3D12_MESSAGE_ID = 331;
  D3D12_MESSAGE_ID_DEVICE_CREATEHULLSHADER_DOUBLEFLOATOPSNOTSUPPORTED: D3D12_MESSAGE_ID = 332;
  D3D12_MESSAGE_ID_DEVICE_CREATEDOMAINSHADER_DOUBLEFLOATOPSNOTSUPPORTED: D3D12_MESSAGE_ID = 333;
  D3D12_MESSAGE_ID_DEVICE_CREATEGEOMETRYSHADER_DOUBLEFLOATOPSNOTSUPPORTED: D3D12_MESSAGE_ID = 334;
  D3D12_MESSAGE_ID_DEVICE_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_DOUBLEFLOATOPSNOTSUPPORTED: D3D12_MESSAGE_ID = 335;
  D3D12_MESSAGE_ID_DEVICE_CREATEPIXELSHADER_DOUBLEFLOATOPSNOTSUPPORTED: D3D12_MESSAGE_ID = 336;
  D3D12_MESSAGE_ID_DEVICE_CREATECOMPUTESHADER_DOUBLEFLOATOPSNOTSUPPORTED: D3D12_MESSAGE_ID = 337;
  D3D12_MESSAGE_ID_CREATEUNORDEREDACCESSVIEW_INVALIDRESOURCE: D3D12_MESSAGE_ID = 340;
  D3D12_MESSAGE_ID_CREATEUNORDEREDACCESSVIEW_INVALIDDESC: D3D12_MESSAGE_ID = 341;
  D3D12_MESSAGE_ID_CREATEUNORDEREDACCESSVIEW_INVALIDFORMAT: D3D12_MESSAGE_ID = 342;
  D3D12_MESSAGE_ID_CREATEUNORDEREDACCESSVIEW_INVALIDVIDEOPLANESLICE: D3D12_MESSAGE_ID = 343;
  D3D12_MESSAGE_ID_CREATEUNORDEREDACCESSVIEW_INVALIDPLANESLICE: D3D12_MESSAGE_ID = 344;
  D3D12_MESSAGE_ID_CREATEUNORDEREDACCESSVIEW_INVALIDDIMENSIONS: D3D12_MESSAGE_ID = 345;
  D3D12_MESSAGE_ID_CREATEUNORDEREDACCESSVIEW_UNRECOGNIZEDFORMAT: D3D12_MESSAGE_ID = 346;
  D3D12_MESSAGE_ID_CREATEUNORDEREDACCESSVIEW_INVALIDFLAGS: D3D12_MESSAGE_ID = 354;
  D3D12_MESSAGE_ID_CREATERASTERIZERSTATE_INVALIDFORCEDSAMPLECOUNT: D3D12_MESSAGE_ID = 401;
  D3D12_MESSAGE_ID_CREATEBLENDSTATE_INVALIDLOGICOPS: D3D12_MESSAGE_ID = 403;
  D3D12_MESSAGE_ID_DEVICE_CREATEVERTEXSHADER_DOUBLEEXTENSIONSNOTSUPPORTED: D3D12_MESSAGE_ID = 410;
  D3D12_MESSAGE_ID_DEVICE_CREATEHULLSHADER_DOUBLEEXTENSIONSNOTSUPPORTED: D3D12_MESSAGE_ID = 412;
  D3D12_MESSAGE_ID_DEVICE_CREATEDOMAINSHADER_DOUBLEEXTENSIONSNOTSUPPORTED: D3D12_MESSAGE_ID = 414;
  D3D12_MESSAGE_ID_DEVICE_CREATEGEOMETRYSHADER_DOUBLEEXTENSIONSNOTSUPPORTED: D3D12_MESSAGE_ID = 416;
  D3D12_MESSAGE_ID_DEVICE_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_DOUBLEEXTENSIONSNOTSUPPORTED: D3D12_MESSAGE_ID = 418;
  D3D12_MESSAGE_ID_DEVICE_CREATEPIXELSHADER_DOUBLEEXTENSIONSNOTSUPPORTED: D3D12_MESSAGE_ID = 420;
  D3D12_MESSAGE_ID_DEVICE_CREATECOMPUTESHADER_DOUBLEEXTENSIONSNOTSUPPORTED: D3D12_MESSAGE_ID = 422;
  D3D12_MESSAGE_ID_DEVICE_CREATEVERTEXSHADER_UAVSNOTSUPPORTED: D3D12_MESSAGE_ID = 425;
  D3D12_MESSAGE_ID_DEVICE_CREATEHULLSHADER_UAVSNOTSUPPORTED: D3D12_MESSAGE_ID = 426;
  D3D12_MESSAGE_ID_DEVICE_CREATEDOMAINSHADER_UAVSNOTSUPPORTED: D3D12_MESSAGE_ID = 427;
  D3D12_MESSAGE_ID_DEVICE_CREATEGEOMETRYSHADER_UAVSNOTSUPPORTED: D3D12_MESSAGE_ID = 428;
  D3D12_MESSAGE_ID_DEVICE_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_UAVSNOTSUPPORTED: D3D12_MESSAGE_ID = 429;
  D3D12_MESSAGE_ID_DEVICE_CREATEPIXELSHADER_UAVSNOTSUPPORTED: D3D12_MESSAGE_ID = 430;
  D3D12_MESSAGE_ID_DEVICE_CREATECOMPUTESHADER_UAVSNOTSUPPORTED: D3D12_MESSAGE_ID = 431;
  D3D12_MESSAGE_ID_DEVICE_CLEARVIEW_INVALIDSOURCERECT: D3D12_MESSAGE_ID = 447;
  D3D12_MESSAGE_ID_DEVICE_CLEARVIEW_EMPTYRECT: D3D12_MESSAGE_ID = 448;
  D3D12_MESSAGE_ID_UPDATETILEMAPPINGS_INVALID_PARAMETER: D3D12_MESSAGE_ID = 493;
  D3D12_MESSAGE_ID_COPYTILEMAPPINGS_INVALID_PARAMETER: D3D12_MESSAGE_ID = 494;
  D3D12_MESSAGE_ID_CREATEDEVICE_INVALIDARGS: D3D12_MESSAGE_ID = 506;
  D3D12_MESSAGE_ID_CREATEDEVICE_WARNING: D3D12_MESSAGE_ID = 507;
  D3D12_MESSAGE_ID_RESOURCE_BARRIER_INVALID_TYPE: D3D12_MESSAGE_ID = 519;
  D3D12_MESSAGE_ID_RESOURCE_BARRIER_NULL_POINTER: D3D12_MESSAGE_ID = 520;
  D3D12_MESSAGE_ID_RESOURCE_BARRIER_INVALID_SUBRESOURCE: D3D12_MESSAGE_ID = 521;
  D3D12_MESSAGE_ID_RESOURCE_BARRIER_RESERVED_BITS: D3D12_MESSAGE_ID = 522;
  D3D12_MESSAGE_ID_RESOURCE_BARRIER_MISSING_BIND_FLAGS: D3D12_MESSAGE_ID = 523;
  D3D12_MESSAGE_ID_RESOURCE_BARRIER_MISMATCHING_MISC_FLAGS: D3D12_MESSAGE_ID = 524;
  D3D12_MESSAGE_ID_RESOURCE_BARRIER_MATCHING_STATES: D3D12_MESSAGE_ID = 525;
  D3D12_MESSAGE_ID_RESOURCE_BARRIER_INVALID_COMBINATION: D3D12_MESSAGE_ID = 526;
  D3D12_MESSAGE_ID_RESOURCE_BARRIER_BEFORE_AFTER_MISMATCH: D3D12_MESSAGE_ID = 527;
  D3D12_MESSAGE_ID_RESOURCE_BARRIER_INVALID_RESOURCE: D3D12_MESSAGE_ID = 528;
  D3D12_MESSAGE_ID_RESOURCE_BARRIER_SAMPLE_COUNT: D3D12_MESSAGE_ID = 529;
  D3D12_MESSAGE_ID_RESOURCE_BARRIER_INVALID_FLAGS: D3D12_MESSAGE_ID = 530;
  D3D12_MESSAGE_ID_RESOURCE_BARRIER_INVALID_COMBINED_FLAGS: D3D12_MESSAGE_ID = 531;
  D3D12_MESSAGE_ID_RESOURCE_BARRIER_INVALID_FLAGS_FOR_FORMAT: D3D12_MESSAGE_ID = 532;
  D3D12_MESSAGE_ID_RESOURCE_BARRIER_INVALID_SPLIT_BARRIER: D3D12_MESSAGE_ID = 533;
  D3D12_MESSAGE_ID_RESOURCE_BARRIER_UNMATCHED_END: D3D12_MESSAGE_ID = 534;
  D3D12_MESSAGE_ID_RESOURCE_BARRIER_UNMATCHED_BEGIN: D3D12_MESSAGE_ID = 535;
  D3D12_MESSAGE_ID_RESOURCE_BARRIER_INVALID_FLAG: D3D12_MESSAGE_ID = 536;
  D3D12_MESSAGE_ID_RESOURCE_BARRIER_INVALID_COMMAND_LIST_TYPE: D3D12_MESSAGE_ID = 537;
  D3D12_MESSAGE_ID_INVALID_SUBRESOURCE_STATE: D3D12_MESSAGE_ID = 538;
  D3D12_MESSAGE_ID_COMMAND_ALLOCATOR_CONTENTION: D3D12_MESSAGE_ID = 540;
  D3D12_MESSAGE_ID_COMMAND_ALLOCATOR_RESET: D3D12_MESSAGE_ID = 541;
  D3D12_MESSAGE_ID_COMMAND_ALLOCATOR_RESET_BUNDLE: D3D12_MESSAGE_ID = 542;
  D3D12_MESSAGE_ID_COMMAND_ALLOCATOR_CANNOT_RESET: D3D12_MESSAGE_ID = 543;
  D3D12_MESSAGE_ID_COMMAND_LIST_OPEN: D3D12_MESSAGE_ID = 544;
  D3D12_MESSAGE_ID_INVALID_BUNDLE_API: D3D12_MESSAGE_ID = 546;
  D3D12_MESSAGE_ID_COMMAND_LIST_CLOSED: D3D12_MESSAGE_ID = 547;
  D3D12_MESSAGE_ID_WRONG_COMMAND_ALLOCATOR_TYPE: D3D12_MESSAGE_ID = 549;
  D3D12_MESSAGE_ID_COMMAND_ALLOCATOR_SYNC: D3D12_MESSAGE_ID = 552;
  D3D12_MESSAGE_ID_COMMAND_LIST_SYNC: D3D12_MESSAGE_ID = 553;
  D3D12_MESSAGE_ID_SET_DESCRIPTOR_HEAP_INVALID: D3D12_MESSAGE_ID = 554;
  D3D12_MESSAGE_ID_CREATE_COMMANDQUEUE: D3D12_MESSAGE_ID = 557;
  D3D12_MESSAGE_ID_CREATE_COMMANDALLOCATOR: D3D12_MESSAGE_ID = 558;
  D3D12_MESSAGE_ID_CREATE_PIPELINESTATE: D3D12_MESSAGE_ID = 559;
  D3D12_MESSAGE_ID_CREATE_COMMANDLIST12: D3D12_MESSAGE_ID = 560;
  D3D12_MESSAGE_ID_CREATE_RESOURCE: D3D12_MESSAGE_ID = 562;
  D3D12_MESSAGE_ID_CREATE_DESCRIPTORHEAP: D3D12_MESSAGE_ID = 563;
  D3D12_MESSAGE_ID_CREATE_ROOTSIGNATURE: D3D12_MESSAGE_ID = 564;
  D3D12_MESSAGE_ID_CREATE_LIBRARY: D3D12_MESSAGE_ID = 565;
  D3D12_MESSAGE_ID_CREATE_HEAP: D3D12_MESSAGE_ID = 566;
  D3D12_MESSAGE_ID_CREATE_MONITOREDFENCE: D3D12_MESSAGE_ID = 567;
  D3D12_MESSAGE_ID_CREATE_QUERYHEAP: D3D12_MESSAGE_ID = 568;
  D3D12_MESSAGE_ID_CREATE_COMMANDSIGNATURE: D3D12_MESSAGE_ID = 569;
  D3D12_MESSAGE_ID_LIVE_COMMANDQUEUE: D3D12_MESSAGE_ID = 570;
  D3D12_MESSAGE_ID_LIVE_COMMANDALLOCATOR: D3D12_MESSAGE_ID = 571;
  D3D12_MESSAGE_ID_LIVE_PIPELINESTATE: D3D12_MESSAGE_ID = 572;
  D3D12_MESSAGE_ID_LIVE_COMMANDLIST12: D3D12_MESSAGE_ID = 573;
  D3D12_MESSAGE_ID_LIVE_RESOURCE: D3D12_MESSAGE_ID = 575;
  D3D12_MESSAGE_ID_LIVE_DESCRIPTORHEAP: D3D12_MESSAGE_ID = 576;
  D3D12_MESSAGE_ID_LIVE_ROOTSIGNATURE: D3D12_MESSAGE_ID = 577;
  D3D12_MESSAGE_ID_LIVE_LIBRARY: D3D12_MESSAGE_ID = 578;
  D3D12_MESSAGE_ID_LIVE_HEAP: D3D12_MESSAGE_ID = 579;
  D3D12_MESSAGE_ID_LIVE_MONITOREDFENCE: D3D12_MESSAGE_ID = 580;
  D3D12_MESSAGE_ID_LIVE_QUERYHEAP: D3D12_MESSAGE_ID = 581;
  D3D12_MESSAGE_ID_LIVE_COMMANDSIGNATURE: D3D12_MESSAGE_ID = 582;
  D3D12_MESSAGE_ID_DESTROY_COMMANDQUEUE: D3D12_MESSAGE_ID = 583;
  D3D12_MESSAGE_ID_DESTROY_COMMANDALLOCATOR: D3D12_MESSAGE_ID = 584;
  D3D12_MESSAGE_ID_DESTROY_PIPELINESTATE: D3D12_MESSAGE_ID = 585;
  D3D12_MESSAGE_ID_DESTROY_COMMANDLIST12: D3D12_MESSAGE_ID = 586;
  D3D12_MESSAGE_ID_DESTROY_RESOURCE: D3D12_MESSAGE_ID = 588;
  D3D12_MESSAGE_ID_DESTROY_DESCRIPTORHEAP: D3D12_MESSAGE_ID = 589;
  D3D12_MESSAGE_ID_DESTROY_ROOTSIGNATURE: D3D12_MESSAGE_ID = 590;
  D3D12_MESSAGE_ID_DESTROY_LIBRARY: D3D12_MESSAGE_ID = 591;
  D3D12_MESSAGE_ID_DESTROY_HEAP: D3D12_MESSAGE_ID = 592;
  D3D12_MESSAGE_ID_DESTROY_MONITOREDFENCE: D3D12_MESSAGE_ID = 593;
  D3D12_MESSAGE_ID_DESTROY_QUERYHEAP: D3D12_MESSAGE_ID = 594;
  D3D12_MESSAGE_ID_DESTROY_COMMANDSIGNATURE: D3D12_MESSAGE_ID = 595;
  D3D12_MESSAGE_ID_CREATERESOURCE_INVALIDDIMENSIONS: D3D12_MESSAGE_ID = 597;
  D3D12_MESSAGE_ID_CREATERESOURCE_INVALIDMISCFLAGS: D3D12_MESSAGE_ID = 599;
  D3D12_MESSAGE_ID_CREATERESOURCE_INVALIDARG_RETURN: D3D12_MESSAGE_ID = 602;
  D3D12_MESSAGE_ID_CREATERESOURCE_OUTOFMEMORY_RETURN: D3D12_MESSAGE_ID = 603;
  D3D12_MESSAGE_ID_CREATERESOURCE_INVALIDDESC: D3D12_MESSAGE_ID = 604;
  D3D12_MESSAGE_ID_POSSIBLY_INVALID_SUBRESOURCE_STATE: D3D12_MESSAGE_ID = 607;
  D3D12_MESSAGE_ID_INVALID_USE_OF_NON_RESIDENT_RESOURCE: D3D12_MESSAGE_ID = 608;
  D3D12_MESSAGE_ID_POSSIBLE_INVALID_USE_OF_NON_RESIDENT_RESOURCE: D3D12_MESSAGE_ID = 609;
  D3D12_MESSAGE_ID_BUNDLE_PIPELINE_STATE_MISMATCH: D3D12_MESSAGE_ID = 610;
  D3D12_MESSAGE_ID_PRIMITIVE_TOPOLOGY_MISMATCH_PIPELINE_STATE: D3D12_MESSAGE_ID = 611;
  D3D12_MESSAGE_ID_RENDER_TARGET_FORMAT_MISMATCH_PIPELINE_STATE: D3D12_MESSAGE_ID = 613;
  D3D12_MESSAGE_ID_RENDER_TARGET_SAMPLE_DESC_MISMATCH_PIPELINE_STATE: D3D12_MESSAGE_ID = 614;
  D3D12_MESSAGE_ID_DEPTH_STENCIL_FORMAT_MISMATCH_PIPELINE_STATE: D3D12_MESSAGE_ID = 615;
  D3D12_MESSAGE_ID_DEPTH_STENCIL_SAMPLE_DESC_MISMATCH_PIPELINE_STATE: D3D12_MESSAGE_ID = 616;
  D3D12_MESSAGE_ID_CREATESHADER_INVALIDBYTECODE: D3D12_MESSAGE_ID = 622;
  D3D12_MESSAGE_ID_CREATEHEAP_NULLDESC: D3D12_MESSAGE_ID = 623;
  D3D12_MESSAGE_ID_CREATEHEAP_INVALIDSIZE: D3D12_MESSAGE_ID = 624;
  D3D12_MESSAGE_ID_CREATEHEAP_UNRECOGNIZEDHEAPTYPE: D3D12_MESSAGE_ID = 625;
  D3D12_MESSAGE_ID_CREATEHEAP_UNRECOGNIZEDCPUPAGEPROPERTIES: D3D12_MESSAGE_ID = 626;
  D3D12_MESSAGE_ID_CREATEHEAP_UNRECOGNIZEDMEMORYPOOL: D3D12_MESSAGE_ID = 627;
  D3D12_MESSAGE_ID_CREATEHEAP_INVALIDPROPERTIES: D3D12_MESSAGE_ID = 628;
  D3D12_MESSAGE_ID_CREATEHEAP_INVALIDALIGNMENT: D3D12_MESSAGE_ID = 629;
  D3D12_MESSAGE_ID_CREATEHEAP_UNRECOGNIZEDMISCFLAGS: D3D12_MESSAGE_ID = 630;
  D3D12_MESSAGE_ID_CREATEHEAP_INVALIDMISCFLAGS: D3D12_MESSAGE_ID = 631;
  D3D12_MESSAGE_ID_CREATEHEAP_INVALIDARG_RETURN: D3D12_MESSAGE_ID = 632;
  D3D12_MESSAGE_ID_CREATEHEAP_OUTOFMEMORY_RETURN: D3D12_MESSAGE_ID = 633;
  D3D12_MESSAGE_ID_CREATERESOURCEANDHEAP_NULLHEAPPROPERTIES: D3D12_MESSAGE_ID = 634;
  D3D12_MESSAGE_ID_CREATERESOURCEANDHEAP_UNRECOGNIZEDHEAPTYPE: D3D12_MESSAGE_ID = 635;
  D3D12_MESSAGE_ID_CREATERESOURCEANDHEAP_UNRECOGNIZEDCPUPAGEPROPERTIES: D3D12_MESSAGE_ID = 636;
  D3D12_MESSAGE_ID_CREATERESOURCEANDHEAP_UNRECOGNIZEDMEMORYPOOL: D3D12_MESSAGE_ID = 637;
  D3D12_MESSAGE_ID_CREATERESOURCEANDHEAP_INVALIDHEAPPROPERTIES: D3D12_MESSAGE_ID = 638;
  D3D12_MESSAGE_ID_CREATERESOURCEANDHEAP_UNRECOGNIZEDHEAPMISCFLAGS: D3D12_MESSAGE_ID = 639;
  D3D12_MESSAGE_ID_CREATERESOURCEANDHEAP_INVALIDHEAPMISCFLAGS: D3D12_MESSAGE_ID = 640;
  D3D12_MESSAGE_ID_CREATERESOURCEANDHEAP_INVALIDARG_RETURN: D3D12_MESSAGE_ID = 641;
  D3D12_MESSAGE_ID_CREATERESOURCEANDHEAP_OUTOFMEMORY_RETURN: D3D12_MESSAGE_ID = 642;
  D3D12_MESSAGE_ID_GETCUSTOMHEAPPROPERTIES_UNRECOGNIZEDHEAPTYPE: D3D12_MESSAGE_ID = 643;
  D3D12_MESSAGE_ID_GETCUSTOMHEAPPROPERTIES_INVALIDHEAPTYPE: D3D12_MESSAGE_ID = 644;
  D3D12_MESSAGE_ID_CREATE_DESCRIPTOR_HEAP_INVALID_DESC: D3D12_MESSAGE_ID = 645;
  D3D12_MESSAGE_ID_INVALID_DESCRIPTOR_HANDLE: D3D12_MESSAGE_ID = 646;
  D3D12_MESSAGE_ID_CREATERASTERIZERSTATE_INVALID_CONSERVATIVERASTERMODE: D3D12_MESSAGE_ID = 647;
  D3D12_MESSAGE_ID_CREATE_CONSTANT_BUFFER_VIEW_INVALID_RESOURCE: D3D12_MESSAGE_ID = 649;
  D3D12_MESSAGE_ID_CREATE_CONSTANT_BUFFER_VIEW_INVALID_DESC: D3D12_MESSAGE_ID = 650;
  D3D12_MESSAGE_ID_CREATE_UNORDEREDACCESS_VIEW_INVALID_COUNTER_USAGE: D3D12_MESSAGE_ID = 652;
  D3D12_MESSAGE_ID_COPY_DESCRIPTORS_INVALID_RANGES: D3D12_MESSAGE_ID = 653;
  D3D12_MESSAGE_ID_COPY_DESCRIPTORS_WRITE_ONLY_DESCRIPTOR: D3D12_MESSAGE_ID = 654;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_RTV_FORMAT_NOT_UNKNOWN: D3D12_MESSAGE_ID = 655;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_INVALID_RENDER_TARGET_COUNT: D3D12_MESSAGE_ID = 656;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_VERTEX_SHADER_NOT_SET: D3D12_MESSAGE_ID = 657;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_INPUTLAYOUT_NOT_SET: D3D12_MESSAGE_ID = 658;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_SHADER_LINKAGE_HS_DS_SIGNATURE_MISMATCH: D3D12_MESSAGE_ID = 659;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_SHADER_LINKAGE_REGISTERINDEX: D3D12_MESSAGE_ID = 660;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_SHADER_LINKAGE_COMPONENTTYPE: D3D12_MESSAGE_ID = 661;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_SHADER_LINKAGE_REGISTERMASK: D3D12_MESSAGE_ID = 662;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_SHADER_LINKAGE_SYSTEMVALUE: D3D12_MESSAGE_ID = 663;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_SHADER_LINKAGE_NEVERWRITTEN_ALWAYSREADS: D3D12_MESSAGE_ID = 664;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_SHADER_LINKAGE_MINPRECISION: D3D12_MESSAGE_ID = 665;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_SHADER_LINKAGE_SEMANTICNAME_NOT_FOUND: D3D12_MESSAGE_ID = 666;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_HS_XOR_DS_MISMATCH: D3D12_MESSAGE_ID = 667;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_HULL_SHADER_INPUT_TOPOLOGY_MISMATCH: D3D12_MESSAGE_ID = 668;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_HS_DS_CONTROL_POINT_COUNT_MISMATCH: D3D12_MESSAGE_ID = 669;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_HS_DS_TESSELLATOR_DOMAIN_MISMATCH: D3D12_MESSAGE_ID = 670;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_INVALID_USE_OF_CENTER_MULTISAMPLE_PATTERN: D3D12_MESSAGE_ID = 671;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_INVALID_USE_OF_FORCED_SAMPLE_COUNT: D3D12_MESSAGE_ID = 672;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_INVALID_PRIMITIVETOPOLOGY: D3D12_MESSAGE_ID = 673;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_INVALID_SYSTEMVALUE: D3D12_MESSAGE_ID = 674;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_OM_DUAL_SOURCE_BLENDING_CAN_ONLY_HAVE_RENDER_TARGET_0: D3D12_MESSAGE_ID = 675;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_OM_RENDER_TARGET_DOES_NOT_SUPPORT_BLENDING: D3D12_MESSAGE_ID = 676;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_PS_OUTPUT_TYPE_MISMATCH: D3D12_MESSAGE_ID = 677;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_OM_RENDER_TARGET_DOES_NOT_SUPPORT_LOGIC_OPS: D3D12_MESSAGE_ID = 678;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_RENDERTARGETVIEW_NOT_SET: D3D12_MESSAGE_ID = 679;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_DEPTHSTENCILVIEW_NOT_SET: D3D12_MESSAGE_ID = 680;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_GS_INPUT_PRIMITIVE_MISMATCH: D3D12_MESSAGE_ID = 681;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_POSITION_NOT_PRESENT: D3D12_MESSAGE_ID = 682;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_MISSING_ROOT_SIGNATURE_FLAGS: D3D12_MESSAGE_ID = 683;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_INVALID_INDEX_BUFFER_PROPERTIES: D3D12_MESSAGE_ID = 684;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_INVALID_SAMPLE_DESC: D3D12_MESSAGE_ID = 685;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_HS_ROOT_SIGNATURE_MISMATCH: D3D12_MESSAGE_ID = 686;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_DS_ROOT_SIGNATURE_MISMATCH: D3D12_MESSAGE_ID = 687;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_VS_ROOT_SIGNATURE_MISMATCH: D3D12_MESSAGE_ID = 688;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_GS_ROOT_SIGNATURE_MISMATCH: D3D12_MESSAGE_ID = 689;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_PS_ROOT_SIGNATURE_MISMATCH: D3D12_MESSAGE_ID = 690;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_MISSING_ROOT_SIGNATURE: D3D12_MESSAGE_ID = 691;
  D3D12_MESSAGE_ID_EXECUTE_BUNDLE_OPEN_BUNDLE: D3D12_MESSAGE_ID = 692;
  D3D12_MESSAGE_ID_EXECUTE_BUNDLE_DESCRIPTOR_HEAP_MISMATCH: D3D12_MESSAGE_ID = 693;
  D3D12_MESSAGE_ID_EXECUTE_BUNDLE_TYPE: D3D12_MESSAGE_ID = 694;
  D3D12_MESSAGE_ID_DRAW_EMPTY_SCISSOR_RECTANGLE: D3D12_MESSAGE_ID = 695;
  D3D12_MESSAGE_ID_CREATE_ROOT_SIGNATURE_BLOB_NOT_FOUND: D3D12_MESSAGE_ID = 696;
  D3D12_MESSAGE_ID_CREATE_ROOT_SIGNATURE_DESERIALIZE_FAILED: D3D12_MESSAGE_ID = 697;
  D3D12_MESSAGE_ID_CREATE_ROOT_SIGNATURE_INVALID_CONFIGURATION: D3D12_MESSAGE_ID = 698;
  D3D12_MESSAGE_ID_CREATE_ROOT_SIGNATURE_NOT_SUPPORTED_ON_DEVICE: D3D12_MESSAGE_ID = 699;
  D3D12_MESSAGE_ID_CREATERESOURCEANDHEAP_NULLRESOURCEPROPERTIES: D3D12_MESSAGE_ID = 700;
  D3D12_MESSAGE_ID_CREATERESOURCEANDHEAP_NULLHEAP: D3D12_MESSAGE_ID = 701;
  D3D12_MESSAGE_ID_GETRESOURCEALLOCATIONINFO_INVALIDRDESCS: D3D12_MESSAGE_ID = 702;
  D3D12_MESSAGE_ID_MAKERESIDENT_NULLOBJECTARRAY: D3D12_MESSAGE_ID = 703;
  D3D12_MESSAGE_ID_EVICT_NULLOBJECTARRAY: D3D12_MESSAGE_ID = 705;
  D3D12_MESSAGE_ID_SET_DESCRIPTOR_TABLE_INVALID: D3D12_MESSAGE_ID = 708;
  D3D12_MESSAGE_ID_SET_ROOT_CONSTANT_INVALID: D3D12_MESSAGE_ID = 709;
  D3D12_MESSAGE_ID_SET_ROOT_CONSTANT_BUFFER_VIEW_INVALID: D3D12_MESSAGE_ID = 710;
  D3D12_MESSAGE_ID_SET_ROOT_SHADER_RESOURCE_VIEW_INVALID: D3D12_MESSAGE_ID = 711;
  D3D12_MESSAGE_ID_SET_ROOT_UNORDERED_ACCESS_VIEW_INVALID: D3D12_MESSAGE_ID = 712;
  D3D12_MESSAGE_ID_SET_VERTEX_BUFFERS_INVALID_DESC: D3D12_MESSAGE_ID = 713;
  D3D12_MESSAGE_ID_SET_INDEX_BUFFER_INVALID_DESC: D3D12_MESSAGE_ID = 715;
  D3D12_MESSAGE_ID_SET_STREAM_OUTPUT_BUFFERS_INVALID_DESC: D3D12_MESSAGE_ID = 717;
  D3D12_MESSAGE_ID_CREATERESOURCE_UNRECOGNIZEDDIMENSIONALITY: D3D12_MESSAGE_ID = 718;
  D3D12_MESSAGE_ID_CREATERESOURCE_UNRECOGNIZEDLAYOUT: D3D12_MESSAGE_ID = 719;
  D3D12_MESSAGE_ID_CREATERESOURCE_INVALIDDIMENSIONALITY: D3D12_MESSAGE_ID = 720;
  D3D12_MESSAGE_ID_CREATERESOURCE_INVALIDALIGNMENT: D3D12_MESSAGE_ID = 721;
  D3D12_MESSAGE_ID_CREATERESOURCE_INVALIDMIPLEVELS: D3D12_MESSAGE_ID = 722;
  D3D12_MESSAGE_ID_CREATERESOURCE_INVALIDSAMPLEDESC: D3D12_MESSAGE_ID = 723;
  D3D12_MESSAGE_ID_CREATERESOURCE_INVALIDLAYOUT: D3D12_MESSAGE_ID = 724;
  D3D12_MESSAGE_ID_SET_INDEX_BUFFER_INVALID: D3D12_MESSAGE_ID = 725;
  D3D12_MESSAGE_ID_SET_VERTEX_BUFFERS_INVALID: D3D12_MESSAGE_ID = 726;
  D3D12_MESSAGE_ID_SET_STREAM_OUTPUT_BUFFERS_INVALID: D3D12_MESSAGE_ID = 727;
  D3D12_MESSAGE_ID_SET_RENDER_TARGETS_INVALID: D3D12_MESSAGE_ID = 728;
  D3D12_MESSAGE_ID_CREATEQUERY_HEAP_INVALID_PARAMETERS: D3D12_MESSAGE_ID = 729;
  D3D12_MESSAGE_ID_BEGIN_END_QUERY_INVALID_PARAMETERS: D3D12_MESSAGE_ID = 731;
  D3D12_MESSAGE_ID_CLOSE_COMMAND_LIST_OPEN_QUERY: D3D12_MESSAGE_ID = 732;
  D3D12_MESSAGE_ID_RESOLVE_QUERY_DATA_INVALID_PARAMETERS: D3D12_MESSAGE_ID = 733;
  D3D12_MESSAGE_ID_SET_PREDICATION_INVALID_PARAMETERS: D3D12_MESSAGE_ID = 734;
  D3D12_MESSAGE_ID_TIMESTAMPS_NOT_SUPPORTED: D3D12_MESSAGE_ID = 735;
  D3D12_MESSAGE_ID_CREATERESOURCE_UNRECOGNIZEDFORMAT: D3D12_MESSAGE_ID = 737;
  D3D12_MESSAGE_ID_CREATERESOURCE_INVALIDFORMAT: D3D12_MESSAGE_ID = 738;
  D3D12_MESSAGE_ID_GETCOPYABLEFOOTPRINTS_INVALIDSUBRESOURCERANGE: D3D12_MESSAGE_ID = 739;
  D3D12_MESSAGE_ID_GETCOPYABLEFOOTPRINTS_INVALIDBASEOFFSET: D3D12_MESSAGE_ID = 740;
  D3D12_MESSAGE_ID_GETCOPYABLELAYOUT_INVALIDSUBRESOURCERANGE: D3D12_MESSAGE_ID = 739;
  D3D12_MESSAGE_ID_GETCOPYABLELAYOUT_INVALIDBASEOFFSET: D3D12_MESSAGE_ID = 740;
  D3D12_MESSAGE_ID_RESOURCE_BARRIER_INVALID_HEAP: D3D12_MESSAGE_ID = 741;
  D3D12_MESSAGE_ID_CREATE_SAMPLER_INVALID: D3D12_MESSAGE_ID = 742;
  D3D12_MESSAGE_ID_CREATECOMMANDSIGNATURE_INVALID: D3D12_MESSAGE_ID = 743;
  D3D12_MESSAGE_ID_EXECUTE_INDIRECT_INVALID_PARAMETERS: D3D12_MESSAGE_ID = 744;
  D3D12_MESSAGE_ID_GETGPUVIRTUALADDRESS_INVALID_RESOURCE_DIMENSION: D3D12_MESSAGE_ID = 745;
  D3D12_MESSAGE_ID_CREATERESOURCE_INVALIDCLEARVALUE: D3D12_MESSAGE_ID = 815;
  D3D12_MESSAGE_ID_CREATERESOURCE_UNRECOGNIZEDCLEARVALUEFORMAT: D3D12_MESSAGE_ID = 816;
  D3D12_MESSAGE_ID_CREATERESOURCE_INVALIDCLEARVALUEFORMAT: D3D12_MESSAGE_ID = 817;
  D3D12_MESSAGE_ID_CREATERESOURCE_CLEARVALUEDENORMFLUSH: D3D12_MESSAGE_ID = 818;
  D3D12_MESSAGE_ID_CLEARRENDERTARGETVIEW_MISMATCHINGCLEARVALUE: D3D12_MESSAGE_ID = 820;
  D3D12_MESSAGE_ID_CLEARDEPTHSTENCILVIEW_MISMATCHINGCLEARVALUE: D3D12_MESSAGE_ID = 821;
  D3D12_MESSAGE_ID_MAP_INVALIDHEAP: D3D12_MESSAGE_ID = 822;
  D3D12_MESSAGE_ID_UNMAP_INVALIDHEAP: D3D12_MESSAGE_ID = 823;
  D3D12_MESSAGE_ID_MAP_INVALIDRESOURCE: D3D12_MESSAGE_ID = 824;
  D3D12_MESSAGE_ID_UNMAP_INVALIDRESOURCE: D3D12_MESSAGE_ID = 825;
  D3D12_MESSAGE_ID_MAP_INVALIDSUBRESOURCE: D3D12_MESSAGE_ID = 826;
  D3D12_MESSAGE_ID_UNMAP_INVALIDSUBRESOURCE: D3D12_MESSAGE_ID = 827;
  D3D12_MESSAGE_ID_MAP_INVALIDRANGE: D3D12_MESSAGE_ID = 828;
  D3D12_MESSAGE_ID_UNMAP_INVALIDRANGE: D3D12_MESSAGE_ID = 829;
  D3D12_MESSAGE_ID_MAP_INVALIDDATAPOINTER: D3D12_MESSAGE_ID = 832;
  D3D12_MESSAGE_ID_MAP_INVALIDARG_RETURN: D3D12_MESSAGE_ID = 833;
  D3D12_MESSAGE_ID_MAP_OUTOFMEMORY_RETURN: D3D12_MESSAGE_ID = 834;
  D3D12_MESSAGE_ID_EXECUTECOMMANDLISTS_BUNDLENOTSUPPORTED: D3D12_MESSAGE_ID = 835;
  D3D12_MESSAGE_ID_EXECUTECOMMANDLISTS_COMMANDLISTMISMATCH: D3D12_MESSAGE_ID = 836;
  D3D12_MESSAGE_ID_EXECUTECOMMANDLISTS_OPENCOMMANDLIST: D3D12_MESSAGE_ID = 837;
  D3D12_MESSAGE_ID_EXECUTECOMMANDLISTS_FAILEDCOMMANDLIST: D3D12_MESSAGE_ID = 838;
  D3D12_MESSAGE_ID_COPYBUFFERREGION_NULLDST: D3D12_MESSAGE_ID = 839;
  D3D12_MESSAGE_ID_COPYBUFFERREGION_INVALIDDSTRESOURCEDIMENSION: D3D12_MESSAGE_ID = 840;
  D3D12_MESSAGE_ID_COPYBUFFERREGION_DSTRANGEOUTOFBOUNDS: D3D12_MESSAGE_ID = 841;
  D3D12_MESSAGE_ID_COPYBUFFERREGION_NULLSRC: D3D12_MESSAGE_ID = 842;
  D3D12_MESSAGE_ID_COPYBUFFERREGION_INVALIDSRCRESOURCEDIMENSION: D3D12_MESSAGE_ID = 843;
  D3D12_MESSAGE_ID_COPYBUFFERREGION_SRCRANGEOUTOFBOUNDS: D3D12_MESSAGE_ID = 844;
  D3D12_MESSAGE_ID_COPYBUFFERREGION_INVALIDCOPYFLAGS: D3D12_MESSAGE_ID = 845;
  D3D12_MESSAGE_ID_COPYTEXTUREREGION_NULLDST: D3D12_MESSAGE_ID = 846;
  D3D12_MESSAGE_ID_COPYTEXTUREREGION_UNRECOGNIZEDDSTTYPE: D3D12_MESSAGE_ID = 847;
  D3D12_MESSAGE_ID_COPYTEXTUREREGION_INVALIDDSTRESOURCEDIMENSION: D3D12_MESSAGE_ID = 848;
  D3D12_MESSAGE_ID_COPYTEXTUREREGION_INVALIDDSTRESOURCE: D3D12_MESSAGE_ID = 849;
  D3D12_MESSAGE_ID_COPYTEXTUREREGION_INVALIDDSTSUBRESOURCE: D3D12_MESSAGE_ID = 850;
  D3D12_MESSAGE_ID_COPYTEXTUREREGION_INVALIDDSTOFFSET: D3D12_MESSAGE_ID = 851;
  D3D12_MESSAGE_ID_COPYTEXTUREREGION_UNRECOGNIZEDDSTFORMAT: D3D12_MESSAGE_ID = 852;
  D3D12_MESSAGE_ID_COPYTEXTUREREGION_INVALIDDSTFORMAT: D3D12_MESSAGE_ID = 853;
  D3D12_MESSAGE_ID_COPYTEXTUREREGION_INVALIDDSTDIMENSIONS: D3D12_MESSAGE_ID = 854;
  D3D12_MESSAGE_ID_COPYTEXTUREREGION_INVALIDDSTROWPITCH: D3D12_MESSAGE_ID = 855;
  D3D12_MESSAGE_ID_COPYTEXTUREREGION_INVALIDDSTPLACEMENT: D3D12_MESSAGE_ID = 856;
  D3D12_MESSAGE_ID_COPYTEXTUREREGION_INVALIDDSTDSPLACEDFOOTPRINTFORMAT: D3D12_MESSAGE_ID = 857;
  D3D12_MESSAGE_ID_COPYTEXTUREREGION_DSTREGIONOUTOFBOUNDS: D3D12_MESSAGE_ID = 858;
  D3D12_MESSAGE_ID_COPYTEXTUREREGION_NULLSRC: D3D12_MESSAGE_ID = 859;
  D3D12_MESSAGE_ID_COPYTEXTUREREGION_UNRECOGNIZEDSRCTYPE: D3D12_MESSAGE_ID = 860;
  D3D12_MESSAGE_ID_COPYTEXTUREREGION_INVALIDSRCRESOURCEDIMENSION: D3D12_MESSAGE_ID = 861;
  D3D12_MESSAGE_ID_COPYTEXTUREREGION_INVALIDSRCRESOURCE: D3D12_MESSAGE_ID = 862;
  D3D12_MESSAGE_ID_COPYTEXTUREREGION_INVALIDSRCSUBRESOURCE: D3D12_MESSAGE_ID = 863;
  D3D12_MESSAGE_ID_COPYTEXTUREREGION_INVALIDSRCOFFSET: D3D12_MESSAGE_ID = 864;
  D3D12_MESSAGE_ID_COPYTEXTUREREGION_UNRECOGNIZEDSRCFORMAT: D3D12_MESSAGE_ID = 865;
  D3D12_MESSAGE_ID_COPYTEXTUREREGION_INVALIDSRCFORMAT: D3D12_MESSAGE_ID = 866;
  D3D12_MESSAGE_ID_COPYTEXTUREREGION_INVALIDSRCDIMENSIONS: D3D12_MESSAGE_ID = 867;
  D3D12_MESSAGE_ID_COPYTEXTUREREGION_INVALIDSRCROWPITCH: D3D12_MESSAGE_ID = 868;
  D3D12_MESSAGE_ID_COPYTEXTUREREGION_INVALIDSRCPLACEMENT: D3D12_MESSAGE_ID = 869;
  D3D12_MESSAGE_ID_COPYTEXTUREREGION_INVALIDSRCDSPLACEDFOOTPRINTFORMAT: D3D12_MESSAGE_ID = 870;
  D3D12_MESSAGE_ID_COPYTEXTUREREGION_SRCREGIONOUTOFBOUNDS: D3D12_MESSAGE_ID = 871;
  D3D12_MESSAGE_ID_COPYTEXTUREREGION_INVALIDDSTCOORDINATES: D3D12_MESSAGE_ID = 872;
  D3D12_MESSAGE_ID_COPYTEXTUREREGION_INVALIDSRCBOX: D3D12_MESSAGE_ID = 873;
  D3D12_MESSAGE_ID_COPYTEXTUREREGION_FORMATMISMATCH: D3D12_MESSAGE_ID = 874;
  D3D12_MESSAGE_ID_COPYTEXTUREREGION_EMPTYBOX: D3D12_MESSAGE_ID = 875;
  D3D12_MESSAGE_ID_COPYTEXTUREREGION_INVALIDCOPYFLAGS: D3D12_MESSAGE_ID = 876;
  D3D12_MESSAGE_ID_RESOLVESUBRESOURCE_INVALID_SUBRESOURCE_INDEX: D3D12_MESSAGE_ID = 877;
  D3D12_MESSAGE_ID_RESOLVESUBRESOURCE_INVALID_FORMAT: D3D12_MESSAGE_ID = 878;
  D3D12_MESSAGE_ID_RESOLVESUBRESOURCE_RESOURCE_MISMATCH: D3D12_MESSAGE_ID = 879;
  D3D12_MESSAGE_ID_RESOLVESUBRESOURCE_INVALID_SAMPLE_COUNT: D3D12_MESSAGE_ID = 880;
  D3D12_MESSAGE_ID_CREATECOMPUTEPIPELINESTATE_INVALID_SHADER: D3D12_MESSAGE_ID = 881;
  D3D12_MESSAGE_ID_CREATECOMPUTEPIPELINESTATE_CS_ROOT_SIGNATURE_MISMATCH: D3D12_MESSAGE_ID = 882;
  D3D12_MESSAGE_ID_CREATECOMPUTEPIPELINESTATE_MISSING_ROOT_SIGNATURE: D3D12_MESSAGE_ID = 883;
  D3D12_MESSAGE_ID_CREATEPIPELINESTATE_INVALIDCACHEDBLOB: D3D12_MESSAGE_ID = 884;
  D3D12_MESSAGE_ID_CREATEPIPELINESTATE_CACHEDBLOBADAPTERMISMATCH: D3D12_MESSAGE_ID = 885;
  D3D12_MESSAGE_ID_CREATEPIPELINESTATE_CACHEDBLOBDRIVERVERSIONMISMATCH: D3D12_MESSAGE_ID = 886;
  D3D12_MESSAGE_ID_CREATEPIPELINESTATE_CACHEDBLOBDESCMISMATCH: D3D12_MESSAGE_ID = 887;
  D3D12_MESSAGE_ID_CREATEPIPELINESTATE_CACHEDBLOBIGNORED: D3D12_MESSAGE_ID = 888;
  D3D12_MESSAGE_ID_WRITETOSUBRESOURCE_INVALIDHEAP: D3D12_MESSAGE_ID = 889;
  D3D12_MESSAGE_ID_WRITETOSUBRESOURCE_INVALIDRESOURCE: D3D12_MESSAGE_ID = 890;
  D3D12_MESSAGE_ID_WRITETOSUBRESOURCE_INVALIDBOX: D3D12_MESSAGE_ID = 891;
  D3D12_MESSAGE_ID_WRITETOSUBRESOURCE_INVALIDSUBRESOURCE: D3D12_MESSAGE_ID = 892;
  D3D12_MESSAGE_ID_WRITETOSUBRESOURCE_EMPTYBOX: D3D12_MESSAGE_ID = 893;
  D3D12_MESSAGE_ID_READFROMSUBRESOURCE_INVALIDHEAP: D3D12_MESSAGE_ID = 894;
  D3D12_MESSAGE_ID_READFROMSUBRESOURCE_INVALIDRESOURCE: D3D12_MESSAGE_ID = 895;
  D3D12_MESSAGE_ID_READFROMSUBRESOURCE_INVALIDBOX: D3D12_MESSAGE_ID = 896;
  D3D12_MESSAGE_ID_READFROMSUBRESOURCE_INVALIDSUBRESOURCE: D3D12_MESSAGE_ID = 897;
  D3D12_MESSAGE_ID_READFROMSUBRESOURCE_EMPTYBOX: D3D12_MESSAGE_ID = 898;
  D3D12_MESSAGE_ID_TOO_MANY_NODES_SPECIFIED: D3D12_MESSAGE_ID = 899;
  D3D12_MESSAGE_ID_INVALID_NODE_INDEX: D3D12_MESSAGE_ID = 900;
  D3D12_MESSAGE_ID_GETHEAPPROPERTIES_INVALIDRESOURCE: D3D12_MESSAGE_ID = 901;
  D3D12_MESSAGE_ID_NODE_MASK_MISMATCH: D3D12_MESSAGE_ID = 902;
  D3D12_MESSAGE_ID_COMMAND_LIST_OUTOFMEMORY: D3D12_MESSAGE_ID = 903;
  D3D12_MESSAGE_ID_COMMAND_LIST_MULTIPLE_SWAPCHAIN_BUFFER_REFERENCES: D3D12_MESSAGE_ID = 904;
  D3D12_MESSAGE_ID_COMMAND_LIST_TOO_MANY_SWAPCHAIN_REFERENCES: D3D12_MESSAGE_ID = 905;
  D3D12_MESSAGE_ID_COMMAND_QUEUE_TOO_MANY_SWAPCHAIN_REFERENCES: D3D12_MESSAGE_ID = 906;
  D3D12_MESSAGE_ID_EXECUTECOMMANDLISTS_WRONGSWAPCHAINBUFFERREFERENCE: D3D12_MESSAGE_ID = 907;
  D3D12_MESSAGE_ID_COMMAND_LIST_SETRENDERTARGETS_INVALIDNUMRENDERTARGETS: D3D12_MESSAGE_ID = 908;
  D3D12_MESSAGE_ID_CREATE_QUEUE_INVALID_TYPE: D3D12_MESSAGE_ID = 909;
  D3D12_MESSAGE_ID_CREATE_QUEUE_INVALID_FLAGS: D3D12_MESSAGE_ID = 910;
  D3D12_MESSAGE_ID_CREATESHAREDRESOURCE_INVALIDFLAGS: D3D12_MESSAGE_ID = 911;
  D3D12_MESSAGE_ID_CREATESHAREDRESOURCE_INVALIDFORMAT: D3D12_MESSAGE_ID = 912;
  D3D12_MESSAGE_ID_CREATESHAREDHEAP_INVALIDFLAGS: D3D12_MESSAGE_ID = 913;
  D3D12_MESSAGE_ID_REFLECTSHAREDPROPERTIES_UNRECOGNIZEDPROPERTIES: D3D12_MESSAGE_ID = 914;
  D3D12_MESSAGE_ID_REFLECTSHAREDPROPERTIES_INVALIDSIZE: D3D12_MESSAGE_ID = 915;
  D3D12_MESSAGE_ID_REFLECTSHAREDPROPERTIES_INVALIDOBJECT: D3D12_MESSAGE_ID = 916;
  D3D12_MESSAGE_ID_KEYEDMUTEX_INVALIDOBJECT: D3D12_MESSAGE_ID = 917;
  D3D12_MESSAGE_ID_KEYEDMUTEX_INVALIDKEY: D3D12_MESSAGE_ID = 918;
  D3D12_MESSAGE_ID_KEYEDMUTEX_WRONGSTATE: D3D12_MESSAGE_ID = 919;
  D3D12_MESSAGE_ID_CREATE_QUEUE_INVALID_PRIORITY: D3D12_MESSAGE_ID = 920;
  D3D12_MESSAGE_ID_OBJECT_DELETED_WHILE_STILL_IN_USE: D3D12_MESSAGE_ID = 921;
  D3D12_MESSAGE_ID_CREATEPIPELINESTATE_INVALID_FLAGS: D3D12_MESSAGE_ID = 922;
  D3D12_MESSAGE_ID_HEAP_ADDRESS_RANGE_HAS_NO_RESOURCE: D3D12_MESSAGE_ID = 923;
  D3D12_MESSAGE_ID_COMMAND_LIST_DRAW_RENDER_TARGET_DELETED: D3D12_MESSAGE_ID = 924;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_ALL_RENDER_TARGETS_HAVE_UNKNOWN_FORMAT: D3D12_MESSAGE_ID = 925;
  D3D12_MESSAGE_ID_HEAP_ADDRESS_RANGE_INTERSECTS_MULTIPLE_BUFFERS: D3D12_MESSAGE_ID = 926;
  D3D12_MESSAGE_ID_EXECUTECOMMANDLISTS_GPU_WRITTEN_READBACK_RESOURCE_MAPPED: D3D12_MESSAGE_ID = 927;
  D3D12_MESSAGE_ID_UNMAP_RANGE_NOT_EMPTY: D3D12_MESSAGE_ID = 929;
  D3D12_MESSAGE_ID_MAP_INVALID_NULLRANGE: D3D12_MESSAGE_ID = 930;
  D3D12_MESSAGE_ID_UNMAP_INVALID_NULLRANGE: D3D12_MESSAGE_ID = 931;
  D3D12_MESSAGE_ID_NO_GRAPHICS_API_SUPPORT: D3D12_MESSAGE_ID = 932;
  D3D12_MESSAGE_ID_NO_COMPUTE_API_SUPPORT: D3D12_MESSAGE_ID = 933;
  D3D12_MESSAGE_ID_RESOLVESUBRESOURCE_RESOURCE_FLAGS_NOT_SUPPORTED: D3D12_MESSAGE_ID = 934;
  D3D12_MESSAGE_ID_GPU_BASED_VALIDATION_ROOT_ARGUMENT_UNINITIALIZED: D3D12_MESSAGE_ID = 935;
  D3D12_MESSAGE_ID_GPU_BASED_VALIDATION_DESCRIPTOR_HEAP_INDEX_OUT_OF_BOUNDS: D3D12_MESSAGE_ID = 936;
  D3D12_MESSAGE_ID_GPU_BASED_VALIDATION_DESCRIPTOR_TABLE_REGISTER_INDEX_OUT_OF_BOUNDS: D3D12_MESSAGE_ID = 937;
  D3D12_MESSAGE_ID_GPU_BASED_VALIDATION_DESCRIPTOR_UNINITIALIZED: D3D12_MESSAGE_ID = 938;
  D3D12_MESSAGE_ID_GPU_BASED_VALIDATION_DESCRIPTOR_TYPE_MISMATCH: D3D12_MESSAGE_ID = 939;
  D3D12_MESSAGE_ID_GPU_BASED_VALIDATION_SRV_RESOURCE_DIMENSION_MISMATCH: D3D12_MESSAGE_ID = 940;
  D3D12_MESSAGE_ID_GPU_BASED_VALIDATION_UAV_RESOURCE_DIMENSION_MISMATCH: D3D12_MESSAGE_ID = 941;
  D3D12_MESSAGE_ID_GPU_BASED_VALIDATION_INCOMPATIBLE_RESOURCE_STATE: D3D12_MESSAGE_ID = 942;
  D3D12_MESSAGE_ID_COPYRESOURCE_NULLDST: D3D12_MESSAGE_ID = 943;
  D3D12_MESSAGE_ID_COPYRESOURCE_INVALIDDSTRESOURCE: D3D12_MESSAGE_ID = 944;
  D3D12_MESSAGE_ID_COPYRESOURCE_NULLSRC: D3D12_MESSAGE_ID = 945;
  D3D12_MESSAGE_ID_COPYRESOURCE_INVALIDSRCRESOURCE: D3D12_MESSAGE_ID = 946;
  D3D12_MESSAGE_ID_RESOLVESUBRESOURCE_NULLDST: D3D12_MESSAGE_ID = 947;
  D3D12_MESSAGE_ID_RESOLVESUBRESOURCE_INVALIDDSTRESOURCE: D3D12_MESSAGE_ID = 948;
  D3D12_MESSAGE_ID_RESOLVESUBRESOURCE_NULLSRC: D3D12_MESSAGE_ID = 949;
  D3D12_MESSAGE_ID_RESOLVESUBRESOURCE_INVALIDSRCRESOURCE: D3D12_MESSAGE_ID = 950;
  D3D12_MESSAGE_ID_PIPELINE_STATE_TYPE_MISMATCH: D3D12_MESSAGE_ID = 951;
  D3D12_MESSAGE_ID_COMMAND_LIST_DISPATCH_ROOT_SIGNATURE_NOT_SET: D3D12_MESSAGE_ID = 952;
  D3D12_MESSAGE_ID_COMMAND_LIST_DISPATCH_ROOT_SIGNATURE_MISMATCH: D3D12_MESSAGE_ID = 953;
  D3D12_MESSAGE_ID_RESOURCE_BARRIER_ZERO_BARRIERS: D3D12_MESSAGE_ID = 954;
  D3D12_MESSAGE_ID_BEGIN_END_EVENT_MISMATCH: D3D12_MESSAGE_ID = 955;
  D3D12_MESSAGE_ID_RESOURCE_BARRIER_POSSIBLE_BEFORE_AFTER_MISMATCH: D3D12_MESSAGE_ID = 956;
  D3D12_MESSAGE_ID_RESOURCE_BARRIER_MISMATCHING_BEGIN_END: D3D12_MESSAGE_ID = 957;
  D3D12_MESSAGE_ID_GPU_BASED_VALIDATION_INVALID_RESOURCE: D3D12_MESSAGE_ID = 958;
  D3D12_MESSAGE_ID_USE_OF_ZERO_REFCOUNT_OBJECT: D3D12_MESSAGE_ID = 959;
  D3D12_MESSAGE_ID_OBJECT_EVICTED_WHILE_STILL_IN_USE: D3D12_MESSAGE_ID = 960;
  D3D12_MESSAGE_ID_GPU_BASED_VALIDATION_ROOT_DESCRIPTOR_ACCESS_OUT_OF_BOUNDS: D3D12_MESSAGE_ID = 961;
  D3D12_MESSAGE_ID_CREATEPIPELINELIBRARY_INVALIDLIBRARYBLOB: D3D12_MESSAGE_ID = 962;
  D3D12_MESSAGE_ID_CREATEPIPELINELIBRARY_DRIVERVERSIONMISMATCH: D3D12_MESSAGE_ID = 963;
  D3D12_MESSAGE_ID_CREATEPIPELINELIBRARY_ADAPTERVERSIONMISMATCH: D3D12_MESSAGE_ID = 964;
  D3D12_MESSAGE_ID_CREATEPIPELINELIBRARY_UNSUPPORTED: D3D12_MESSAGE_ID = 965;
  D3D12_MESSAGE_ID_CREATE_PIPELINELIBRARY: D3D12_MESSAGE_ID = 966;
  D3D12_MESSAGE_ID_LIVE_PIPELINELIBRARY: D3D12_MESSAGE_ID = 967;
  D3D12_MESSAGE_ID_DESTROY_PIPELINELIBRARY: D3D12_MESSAGE_ID = 968;
  D3D12_MESSAGE_ID_STOREPIPELINE_NONAME: D3D12_MESSAGE_ID = 969;
  D3D12_MESSAGE_ID_STOREPIPELINE_DUPLICATENAME: D3D12_MESSAGE_ID = 970;
  D3D12_MESSAGE_ID_LOADPIPELINE_NAMENOTFOUND: D3D12_MESSAGE_ID = 971;
  D3D12_MESSAGE_ID_LOADPIPELINE_INVALIDDESC: D3D12_MESSAGE_ID = 972;
  D3D12_MESSAGE_ID_PIPELINELIBRARY_SERIALIZE_NOTENOUGHMEMORY: D3D12_MESSAGE_ID = 973;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_PS_OUTPUT_RT_OUTPUT_MISMATCH: D3D12_MESSAGE_ID = 974;
  D3D12_MESSAGE_ID_SETEVENTONMULTIPLEFENCECOMPLETION_INVALIDFLAGS: D3D12_MESSAGE_ID = 975;
  D3D12_MESSAGE_ID_CREATE_QUEUE_VIDEO_NOT_SUPPORTED: D3D12_MESSAGE_ID = 976;
  D3D12_MESSAGE_ID_CREATE_COMMAND_ALLOCATOR_VIDEO_NOT_SUPPORTED: D3D12_MESSAGE_ID = 977;
  D3D12_MESSAGE_ID_CREATEQUERY_HEAP_VIDEO_DECODE_STATISTICS_NOT_SUPPORTED: D3D12_MESSAGE_ID = 978;
  D3D12_MESSAGE_ID_CREATE_VIDEODECODECOMMANDLIST: D3D12_MESSAGE_ID = 979;
  D3D12_MESSAGE_ID_CREATE_VIDEODECODER: D3D12_MESSAGE_ID = 980;
  D3D12_MESSAGE_ID_CREATE_VIDEODECODESTREAM: D3D12_MESSAGE_ID = 981;
  D3D12_MESSAGE_ID_LIVE_VIDEODECODECOMMANDLIST: D3D12_MESSAGE_ID = 982;
  D3D12_MESSAGE_ID_LIVE_VIDEODECODER: D3D12_MESSAGE_ID = 983;
  D3D12_MESSAGE_ID_LIVE_VIDEODECODESTREAM: D3D12_MESSAGE_ID = 984;
  D3D12_MESSAGE_ID_DESTROY_VIDEODECODECOMMANDLIST: D3D12_MESSAGE_ID = 985;
  D3D12_MESSAGE_ID_DESTROY_VIDEODECODER: D3D12_MESSAGE_ID = 986;
  D3D12_MESSAGE_ID_DESTROY_VIDEODECODESTREAM: D3D12_MESSAGE_ID = 987;
  D3D12_MESSAGE_ID_DECODE_FRAME_INVALID_PARAMETERS: D3D12_MESSAGE_ID = 988;
  D3D12_MESSAGE_ID_DEPRECATED_API: D3D12_MESSAGE_ID = 989;
  D3D12_MESSAGE_ID_RESOURCE_BARRIER_MISMATCHING_COMMAND_LIST_TYPE: D3D12_MESSAGE_ID = 990;
  D3D12_MESSAGE_ID_COMMAND_LIST_DESCRIPTOR_TABLE_NOT_SET: D3D12_MESSAGE_ID = 991;
  D3D12_MESSAGE_ID_COMMAND_LIST_ROOT_CONSTANT_BUFFER_VIEW_NOT_SET: D3D12_MESSAGE_ID = 992;
  D3D12_MESSAGE_ID_COMMAND_LIST_ROOT_SHADER_RESOURCE_VIEW_NOT_SET: D3D12_MESSAGE_ID = 993;
  D3D12_MESSAGE_ID_COMMAND_LIST_ROOT_UNORDERED_ACCESS_VIEW_NOT_SET: D3D12_MESSAGE_ID = 994;
  D3D12_MESSAGE_ID_DISCARD_INVALID_SUBRESOURCE_RANGE: D3D12_MESSAGE_ID = 995;
  D3D12_MESSAGE_ID_DISCARD_ONE_SUBRESOURCE_FOR_MIPS_WITH_RECTS: D3D12_MESSAGE_ID = 996;
  D3D12_MESSAGE_ID_DISCARD_NO_RECTS_FOR_NON_TEXTURE2D: D3D12_MESSAGE_ID = 997;
  D3D12_MESSAGE_ID_COPY_ON_SAME_SUBRESOURCE: D3D12_MESSAGE_ID = 998;
  D3D12_MESSAGE_ID_SETRESIDENCYPRIORITY_INVALID_PAGEABLE: D3D12_MESSAGE_ID = 999;
  D3D12_MESSAGE_ID_GPU_BASED_VALIDATION_UNSUPPORTED: D3D12_MESSAGE_ID = 1000;
  D3D12_MESSAGE_ID_STATIC_DESCRIPTOR_INVALID_DESCRIPTOR_CHANGE: D3D12_MESSAGE_ID = 1001;
  D3D12_MESSAGE_ID_DATA_STATIC_DESCRIPTOR_INVALID_DATA_CHANGE: D3D12_MESSAGE_ID = 1002;
  D3D12_MESSAGE_ID_DATA_STATIC_WHILE_SET_AT_EXECUTE_DESCRIPTOR_INVALID_DATA_CHANGE: D3D12_MESSAGE_ID = 1003;
  D3D12_MESSAGE_ID_EXECUTE_BUNDLE_STATIC_DESCRIPTOR_DATA_STATIC_NOT_SET: D3D12_MESSAGE_ID = 1004;
  D3D12_MESSAGE_ID_GPU_BASED_VALIDATION_RESOURCE_ACCESS_OUT_OF_BOUNDS: D3D12_MESSAGE_ID = 1005;
  D3D12_MESSAGE_ID_GPU_BASED_VALIDATION_SAMPLER_MODE_MISMATCH: D3D12_MESSAGE_ID = 1006;
  D3D12_MESSAGE_ID_CREATE_FENCE_INVALID_FLAGS: D3D12_MESSAGE_ID = 1007;
  D3D12_MESSAGE_ID_RESOURCE_BARRIER_DUPLICATE_SUBRESOURCE_TRANSITIONS: D3D12_MESSAGE_ID = 1008;
  D3D12_MESSAGE_ID_SETRESIDENCYPRIORITY_INVALID_PRIORITY: D3D12_MESSAGE_ID = 1009;
  D3D12_MESSAGE_ID_CREATE_DESCRIPTOR_HEAP_LARGE_NUM_DESCRIPTORS: D3D12_MESSAGE_ID = 1013;
  D3D12_MESSAGE_ID_BEGIN_EVENT: D3D12_MESSAGE_ID = 1014;
  D3D12_MESSAGE_ID_END_EVENT: D3D12_MESSAGE_ID = 1015;
  D3D12_MESSAGE_ID_CREATEDEVICE_DEBUG_LAYER_STARTUP_OPTIONS: D3D12_MESSAGE_ID = 1016;
  D3D12_MESSAGE_ID_CREATEDEPTHSTENCILSTATE_DEPTHBOUNDSTEST_UNSUPPORTED: D3D12_MESSAGE_ID = 1017;
  D3D12_MESSAGE_ID_CREATEPIPELINESTATE_DUPLICATE_SUBOBJECT: D3D12_MESSAGE_ID = 1018;
  D3D12_MESSAGE_ID_CREATEPIPELINESTATE_UNKNOWN_SUBOBJECT: D3D12_MESSAGE_ID = 1019;
  D3D12_MESSAGE_ID_CREATEPIPELINESTATE_ZERO_SIZE_STREAM: D3D12_MESSAGE_ID = 1020;
  D3D12_MESSAGE_ID_CREATEPIPELINESTATE_INVALID_STREAM: D3D12_MESSAGE_ID = 1021;
  D3D12_MESSAGE_ID_CREATEPIPELINESTATE_CANNOT_DEDUCE_TYPE: D3D12_MESSAGE_ID = 1022;
  D3D12_MESSAGE_ID_COMMAND_LIST_STATIC_DESCRIPTOR_RESOURCE_DIMENSION_MISMATCH: D3D12_MESSAGE_ID = 1023;
  D3D12_MESSAGE_ID_CREATE_COMMAND_QUEUE_INSUFFICIENT_PRIVILEGE_FOR_GLOBAL_REALTIME: D3D12_MESSAGE_ID = 1024;
  D3D12_MESSAGE_ID_CREATE_COMMAND_QUEUE_INSUFFICIENT_HARDWARE_SUPPORT_FOR_GLOBAL_REALTIME: D3D12_MESSAGE_ID = 1025;
  D3D12_MESSAGE_ID_ATOMICCOPYBUFFER_INVALID_ARCHITECTURE: D3D12_MESSAGE_ID = 1026;
  D3D12_MESSAGE_ID_ATOMICCOPYBUFFER_NULL_DST: D3D12_MESSAGE_ID = 1027;
  D3D12_MESSAGE_ID_ATOMICCOPYBUFFER_INVALID_DST_RESOURCE_DIMENSION: D3D12_MESSAGE_ID = 1028;
  D3D12_MESSAGE_ID_ATOMICCOPYBUFFER_DST_RANGE_OUT_OF_BOUNDS: D3D12_MESSAGE_ID = 1029;
  D3D12_MESSAGE_ID_ATOMICCOPYBUFFER_NULL_SRC: D3D12_MESSAGE_ID = 1030;
  D3D12_MESSAGE_ID_ATOMICCOPYBUFFER_INVALID_SRC_RESOURCE_DIMENSION: D3D12_MESSAGE_ID = 1031;
  D3D12_MESSAGE_ID_ATOMICCOPYBUFFER_SRC_RANGE_OUT_OF_BOUNDS: D3D12_MESSAGE_ID = 1032;
  D3D12_MESSAGE_ID_ATOMICCOPYBUFFER_INVALID_OFFSET_ALIGNMENT: D3D12_MESSAGE_ID = 1033;
  D3D12_MESSAGE_ID_ATOMICCOPYBUFFER_NULL_DEPENDENT_RESOURCES: D3D12_MESSAGE_ID = 1034;
  D3D12_MESSAGE_ID_ATOMICCOPYBUFFER_NULL_DEPENDENT_SUBRESOURCE_RANGES: D3D12_MESSAGE_ID = 1035;
  D3D12_MESSAGE_ID_ATOMICCOPYBUFFER_INVALID_DEPENDENT_RESOURCE: D3D12_MESSAGE_ID = 1036;
  D3D12_MESSAGE_ID_ATOMICCOPYBUFFER_INVALID_DEPENDENT_SUBRESOURCE_RANGE: D3D12_MESSAGE_ID = 1037;
  D3D12_MESSAGE_ID_ATOMICCOPYBUFFER_DEPENDENT_SUBRESOURCE_OUT_OF_BOUNDS: D3D12_MESSAGE_ID = 1038;
  D3D12_MESSAGE_ID_ATOMICCOPYBUFFER_DEPENDENT_RANGE_OUT_OF_BOUNDS: D3D12_MESSAGE_ID = 1039;
  D3D12_MESSAGE_ID_ATOMICCOPYBUFFER_ZERO_DEPENDENCIES: D3D12_MESSAGE_ID = 1040;
  D3D12_MESSAGE_ID_DEVICE_CREATE_SHARED_HANDLE_INVALIDARG: D3D12_MESSAGE_ID = 1041;
  D3D12_MESSAGE_ID_DESCRIPTOR_HANDLE_WITH_INVALID_RESOURCE: D3D12_MESSAGE_ID = 1042;
  D3D12_MESSAGE_ID_SETDEPTHBOUNDS_INVALIDARGS: D3D12_MESSAGE_ID = 1043;
  D3D12_MESSAGE_ID_GPU_BASED_VALIDATION_RESOURCE_STATE_IMPRECISE: D3D12_MESSAGE_ID = 1044;
  D3D12_MESSAGE_ID_COMMAND_LIST_PIPELINE_STATE_NOT_SET: D3D12_MESSAGE_ID = 1045;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_SHADER_MODEL_MISMATCH: D3D12_MESSAGE_ID = 1046;
  D3D12_MESSAGE_ID_OBJECT_ACCESSED_WHILE_STILL_IN_USE: D3D12_MESSAGE_ID = 1047;
  D3D12_MESSAGE_ID_PROGRAMMABLE_MSAA_UNSUPPORTED: D3D12_MESSAGE_ID = 1048;
  D3D12_MESSAGE_ID_SETSAMPLEPOSITIONS_INVALIDARGS: D3D12_MESSAGE_ID = 1049;
  D3D12_MESSAGE_ID_RESOLVESUBRESOURCEREGION_INVALID_RECT: D3D12_MESSAGE_ID = 1050;
  D3D12_MESSAGE_ID_CREATE_VIDEODECODECOMMANDQUEUE: D3D12_MESSAGE_ID = 1051;
  D3D12_MESSAGE_ID_CREATE_VIDEOPROCESSCOMMANDLIST: D3D12_MESSAGE_ID = 1052;
  D3D12_MESSAGE_ID_CREATE_VIDEOPROCESSCOMMANDQUEUE: D3D12_MESSAGE_ID = 1053;
  D3D12_MESSAGE_ID_LIVE_VIDEODECODECOMMANDQUEUE: D3D12_MESSAGE_ID = 1054;
  D3D12_MESSAGE_ID_LIVE_VIDEOPROCESSCOMMANDLIST: D3D12_MESSAGE_ID = 1055;
  D3D12_MESSAGE_ID_LIVE_VIDEOPROCESSCOMMANDQUEUE: D3D12_MESSAGE_ID = 1056;
  D3D12_MESSAGE_ID_DESTROY_VIDEODECODECOMMANDQUEUE: D3D12_MESSAGE_ID = 1057;
  D3D12_MESSAGE_ID_DESTROY_VIDEOPROCESSCOMMANDLIST: D3D12_MESSAGE_ID = 1058;
  D3D12_MESSAGE_ID_DESTROY_VIDEOPROCESSCOMMANDQUEUE: D3D12_MESSAGE_ID = 1059;
  D3D12_MESSAGE_ID_CREATE_VIDEOPROCESSOR: D3D12_MESSAGE_ID = 1060;
  D3D12_MESSAGE_ID_CREATE_VIDEOPROCESSSTREAM: D3D12_MESSAGE_ID = 1061;
  D3D12_MESSAGE_ID_LIVE_VIDEOPROCESSOR: D3D12_MESSAGE_ID = 1062;
  D3D12_MESSAGE_ID_LIVE_VIDEOPROCESSSTREAM: D3D12_MESSAGE_ID = 1063;
  D3D12_MESSAGE_ID_DESTROY_VIDEOPROCESSOR: D3D12_MESSAGE_ID = 1064;
  D3D12_MESSAGE_ID_DESTROY_VIDEOPROCESSSTREAM: D3D12_MESSAGE_ID = 1065;
  D3D12_MESSAGE_ID_PROCESS_FRAME_INVALID_PARAMETERS: D3D12_MESSAGE_ID = 1066;
  D3D12_MESSAGE_ID_COPY_INVALIDLAYOUT: D3D12_MESSAGE_ID = 1067;
  D3D12_MESSAGE_ID_CREATE_CRYPTO_SESSION: D3D12_MESSAGE_ID = 1068;
  D3D12_MESSAGE_ID_CREATE_CRYPTO_SESSION_POLICY: D3D12_MESSAGE_ID = 1069;
  D3D12_MESSAGE_ID_CREATE_PROTECTED_RESOURCE_SESSION: D3D12_MESSAGE_ID = 1070;
  D3D12_MESSAGE_ID_LIVE_CRYPTO_SESSION: D3D12_MESSAGE_ID = 1071;
  D3D12_MESSAGE_ID_LIVE_CRYPTO_SESSION_POLICY: D3D12_MESSAGE_ID = 1072;
  D3D12_MESSAGE_ID_LIVE_PROTECTED_RESOURCE_SESSION: D3D12_MESSAGE_ID = 1073;
  D3D12_MESSAGE_ID_DESTROY_CRYPTO_SESSION: D3D12_MESSAGE_ID = 1074;
  D3D12_MESSAGE_ID_DESTROY_CRYPTO_SESSION_POLICY: D3D12_MESSAGE_ID = 1075;
  D3D12_MESSAGE_ID_DESTROY_PROTECTED_RESOURCE_SESSION: D3D12_MESSAGE_ID = 1076;
  D3D12_MESSAGE_ID_PROTECTED_RESOURCE_SESSION_UNSUPPORTED: D3D12_MESSAGE_ID = 1077;
  D3D12_MESSAGE_ID_FENCE_INVALIDOPERATION: D3D12_MESSAGE_ID = 1078;
  D3D12_MESSAGE_ID_CREATEQUERY_HEAP_COPY_QUEUE_TIMESTAMPS_NOT_SUPPORTED: D3D12_MESSAGE_ID = 1079;
  D3D12_MESSAGE_ID_SAMPLEPOSITIONS_MISMATCH_DEFERRED: D3D12_MESSAGE_ID = 1080;
  D3D12_MESSAGE_ID_SAMPLEPOSITIONS_MISMATCH_RECORDTIME_ASSUMEDFROMFIRSTUSE: D3D12_MESSAGE_ID = 1081;
  D3D12_MESSAGE_ID_SAMPLEPOSITIONS_MISMATCH_RECORDTIME_ASSUMEDFROMCLEAR: D3D12_MESSAGE_ID = 1082;
  D3D12_MESSAGE_ID_CREATE_VIDEODECODERHEAP: D3D12_MESSAGE_ID = 1083;
  D3D12_MESSAGE_ID_LIVE_VIDEODECODERHEAP: D3D12_MESSAGE_ID = 1084;
  D3D12_MESSAGE_ID_DESTROY_VIDEODECODERHEAP: D3D12_MESSAGE_ID = 1085;
  D3D12_MESSAGE_ID_OPENEXISTINGHEAP_INVALIDARG_RETURN: D3D12_MESSAGE_ID = 1086;
  D3D12_MESSAGE_ID_OPENEXISTINGHEAP_OUTOFMEMORY_RETURN: D3D12_MESSAGE_ID = 1087;
  D3D12_MESSAGE_ID_OPENEXISTINGHEAP_INVALIDADDRESS: D3D12_MESSAGE_ID = 1088;
  D3D12_MESSAGE_ID_OPENEXISTINGHEAP_INVALIDHANDLE: D3D12_MESSAGE_ID = 1089;
  D3D12_MESSAGE_ID_WRITEBUFFERIMMEDIATE_INVALID_DEST: D3D12_MESSAGE_ID = 1090;
  D3D12_MESSAGE_ID_WRITEBUFFERIMMEDIATE_INVALID_MODE: D3D12_MESSAGE_ID = 1091;
  D3D12_MESSAGE_ID_WRITEBUFFERIMMEDIATE_INVALID_ALIGNMENT: D3D12_MESSAGE_ID = 1092;
  D3D12_MESSAGE_ID_WRITEBUFFERIMMEDIATE_NOT_SUPPORTED: D3D12_MESSAGE_ID = 1093;
  D3D12_MESSAGE_ID_SETVIEWINSTANCEMASK_INVALIDARGS: D3D12_MESSAGE_ID = 1094;
  D3D12_MESSAGE_ID_VIEW_INSTANCING_UNSUPPORTED: D3D12_MESSAGE_ID = 1095;
  D3D12_MESSAGE_ID_VIEW_INSTANCING_INVALIDARGS: D3D12_MESSAGE_ID = 1096;
  D3D12_MESSAGE_ID_COPYTEXTUREREGION_MISMATCH_DECODE_REFERENCE_ONLY_FLAG: D3D12_MESSAGE_ID = 1097;
  D3D12_MESSAGE_ID_COPYRESOURCE_MISMATCH_DECODE_REFERENCE_ONLY_FLAG: D3D12_MESSAGE_ID = 1098;
  D3D12_MESSAGE_ID_CREATE_VIDEO_DECODE_HEAP_CAPS_FAILURE: D3D12_MESSAGE_ID = 1099;
  D3D12_MESSAGE_ID_CREATE_VIDEO_DECODE_HEAP_CAPS_UNSUPPORTED: D3D12_MESSAGE_ID = 1100;
  D3D12_MESSAGE_ID_VIDEO_DECODE_SUPPORT_INVALID_INPUT: D3D12_MESSAGE_ID = 1101;
  D3D12_MESSAGE_ID_CREATE_VIDEO_DECODER_UNSUPPORTED: D3D12_MESSAGE_ID = 1102;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_METADATA_ERROR: D3D12_MESSAGE_ID = 1103;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_VIEW_INSTANCING_VERTEX_SIZE_EXCEEDED: D3D12_MESSAGE_ID = 1104;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_RUNTIME_INTERNAL_ERROR: D3D12_MESSAGE_ID = 1105;
  D3D12_MESSAGE_ID_NO_VIDEO_API_SUPPORT: D3D12_MESSAGE_ID = 1106;
  D3D12_MESSAGE_ID_VIDEO_PROCESS_SUPPORT_INVALID_INPUT: D3D12_MESSAGE_ID = 1107;
  D3D12_MESSAGE_ID_CREATE_VIDEO_PROCESSOR_CAPS_FAILURE: D3D12_MESSAGE_ID = 1108;
  D3D12_MESSAGE_ID_VIDEO_PROCESS_SUPPORT_UNSUPPORTED_FORMAT: D3D12_MESSAGE_ID = 1109;
  D3D12_MESSAGE_ID_VIDEO_DECODE_FRAME_INVALID_ARGUMENT: D3D12_MESSAGE_ID = 1110;
  D3D12_MESSAGE_ID_ENQUEUE_MAKE_RESIDENT_INVALID_FLAGS: D3D12_MESSAGE_ID = 1111;
  D3D12_MESSAGE_ID_OPENEXISTINGHEAP_UNSUPPORTED: D3D12_MESSAGE_ID = 1112;
  D3D12_MESSAGE_ID_VIDEO_PROCESS_FRAMES_INVALID_ARGUMENT: D3D12_MESSAGE_ID = 1113;
  D3D12_MESSAGE_ID_VIDEO_DECODE_SUPPORT_UNSUPPORTED: D3D12_MESSAGE_ID = 1114;
  D3D12_MESSAGE_ID_CREATE_COMMANDRECORDER: D3D12_MESSAGE_ID = 1115;
  D3D12_MESSAGE_ID_LIVE_COMMANDRECORDER: D3D12_MESSAGE_ID = 1116;
  D3D12_MESSAGE_ID_DESTROY_COMMANDRECORDER: D3D12_MESSAGE_ID = 1117;
  D3D12_MESSAGE_ID_CREATE_COMMAND_RECORDER_VIDEO_NOT_SUPPORTED: D3D12_MESSAGE_ID = 1118;
  D3D12_MESSAGE_ID_CREATE_COMMAND_RECORDER_INVALID_SUPPORT_FLAGS: D3D12_MESSAGE_ID = 1119;
  D3D12_MESSAGE_ID_CREATE_COMMAND_RECORDER_INVALID_FLAGS: D3D12_MESSAGE_ID = 1120;
  D3D12_MESSAGE_ID_CREATE_COMMAND_RECORDER_MORE_RECORDERS_THAN_LOGICAL_PROCESSORS: D3D12_MESSAGE_ID = 1121;
  D3D12_MESSAGE_ID_CREATE_COMMANDPOOL: D3D12_MESSAGE_ID = 1122;
  D3D12_MESSAGE_ID_LIVE_COMMANDPOOL: D3D12_MESSAGE_ID = 1123;
  D3D12_MESSAGE_ID_DESTROY_COMMANDPOOL: D3D12_MESSAGE_ID = 1124;
  D3D12_MESSAGE_ID_CREATE_COMMAND_POOL_INVALID_FLAGS: D3D12_MESSAGE_ID = 1125;
  D3D12_MESSAGE_ID_CREATE_COMMAND_LIST_VIDEO_NOT_SUPPORTED: D3D12_MESSAGE_ID = 1126;
  D3D12_MESSAGE_ID_COMMAND_RECORDER_SUPPORT_FLAGS_MISMATCH: D3D12_MESSAGE_ID = 1127;
  D3D12_MESSAGE_ID_COMMAND_RECORDER_CONTENTION: D3D12_MESSAGE_ID = 1128;
  D3D12_MESSAGE_ID_COMMAND_RECORDER_USAGE_WITH_CREATECOMMANDLIST_COMMAND_LIST: D3D12_MESSAGE_ID = 1129;
  D3D12_MESSAGE_ID_COMMAND_ALLOCATOR_USAGE_WITH_CREATECOMMANDLIST1_COMMAND_LIST: D3D12_MESSAGE_ID = 1130;
  D3D12_MESSAGE_ID_CANNOT_EXECUTE_EMPTY_COMMAND_LIST: D3D12_MESSAGE_ID = 1131;
  D3D12_MESSAGE_ID_CANNOT_RESET_COMMAND_POOL_WITH_OPEN_COMMAND_LISTS: D3D12_MESSAGE_ID = 1132;
  D3D12_MESSAGE_ID_CANNOT_USE_COMMAND_RECORDER_WITHOUT_CURRENT_TARGET: D3D12_MESSAGE_ID = 1133;
  D3D12_MESSAGE_ID_CANNOT_CHANGE_COMMAND_RECORDER_TARGET_WHILE_RECORDING: D3D12_MESSAGE_ID = 1134;
  D3D12_MESSAGE_ID_COMMAND_POOL_SYNC: D3D12_MESSAGE_ID = 1135;
  D3D12_MESSAGE_ID_EVICT_UNDERFLOW: D3D12_MESSAGE_ID = 1136;
  D3D12_MESSAGE_ID_CREATE_META_COMMAND: D3D12_MESSAGE_ID = 1137;
  D3D12_MESSAGE_ID_LIVE_META_COMMAND: D3D12_MESSAGE_ID = 1138;
  D3D12_MESSAGE_ID_DESTROY_META_COMMAND: D3D12_MESSAGE_ID = 1139;
  D3D12_MESSAGE_ID_COPYBUFFERREGION_INVALID_DST_RESOURCE: D3D12_MESSAGE_ID = 1140;
  D3D12_MESSAGE_ID_COPYBUFFERREGION_INVALID_SRC_RESOURCE: D3D12_MESSAGE_ID = 1141;
  D3D12_MESSAGE_ID_ATOMICCOPYBUFFER_INVALID_DST_RESOURCE: D3D12_MESSAGE_ID = 1142;
  D3D12_MESSAGE_ID_ATOMICCOPYBUFFER_INVALID_SRC_RESOURCE: D3D12_MESSAGE_ID = 1143;
  D3D12_MESSAGE_ID_CREATEPLACEDRESOURCEONBUFFER_NULL_BUFFER: D3D12_MESSAGE_ID = 1144;
  D3D12_MESSAGE_ID_CREATEPLACEDRESOURCEONBUFFER_NULL_RESOURCE_DESC: D3D12_MESSAGE_ID = 1145;
  D3D12_MESSAGE_ID_CREATEPLACEDRESOURCEONBUFFER_UNSUPPORTED: D3D12_MESSAGE_ID = 1146;
  D3D12_MESSAGE_ID_CREATEPLACEDRESOURCEONBUFFER_INVALID_BUFFER_DIMENSION: D3D12_MESSAGE_ID = 1147;
  D3D12_MESSAGE_ID_CREATEPLACEDRESOURCEONBUFFER_INVALID_BUFFER_FLAGS: D3D12_MESSAGE_ID = 1148;
  D3D12_MESSAGE_ID_CREATEPLACEDRESOURCEONBUFFER_INVALID_BUFFER_OFFSET: D3D12_MESSAGE_ID = 1149;
  D3D12_MESSAGE_ID_CREATEPLACEDRESOURCEONBUFFER_INVALID_RESOURCE_DIMENSION: D3D12_MESSAGE_ID = 1150;
  D3D12_MESSAGE_ID_CREATEPLACEDRESOURCEONBUFFER_INVALID_RESOURCE_FLAGS: D3D12_MESSAGE_ID = 1151;
  D3D12_MESSAGE_ID_CREATEPLACEDRESOURCEONBUFFER_OUTOFMEMORY_RETURN: D3D12_MESSAGE_ID = 1152;
  D3D12_MESSAGE_ID_CANNOT_CREATE_GRAPHICS_AND_VIDEO_COMMAND_RECORDER: D3D12_MESSAGE_ID = 1153;
  D3D12_MESSAGE_ID_UPDATETILEMAPPINGS_POSSIBLY_MISMATCHING_PROPERTIES: D3D12_MESSAGE_ID = 1154;
  D3D12_MESSAGE_ID_CREATE_COMMAND_LIST_INVALID_COMMAND_LIST_TYPE: D3D12_MESSAGE_ID = 1155;
  D3D12_MESSAGE_ID_CLEARUNORDEREDACCESSVIEW_INCOMPATIBLE_WITH_STRUCTURED_BUFFERS: D3D12_MESSAGE_ID = 1156;
  D3D12_MESSAGE_ID_COMPUTE_ONLY_DEVICE_OPERATION_UNSUPPORTED: D3D12_MESSAGE_ID = 1157;
  D3D12_MESSAGE_ID_BUILD_RAYTRACING_ACCELERATION_STRUCTURE_INVALID: D3D12_MESSAGE_ID = 1158;
  D3D12_MESSAGE_ID_EMIT_RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO_INVALID: D3D12_MESSAGE_ID = 1159;
  D3D12_MESSAGE_ID_COPY_RAYTRACING_ACCELERATION_STRUCTURE_INVALID: D3D12_MESSAGE_ID = 1160;
  D3D12_MESSAGE_ID_DISPATCH_RAYS_INVALID: D3D12_MESSAGE_ID = 1161;
  D3D12_MESSAGE_ID_GET_RAYTRACING_ACCELERATION_STRUCTURE_PREBUILD_INFO_INVALID: D3D12_MESSAGE_ID = 1162;
  D3D12_MESSAGE_ID_CREATE_LIFETIMETRACKER: D3D12_MESSAGE_ID = 1163;
  D3D12_MESSAGE_ID_LIVE_LIFETIMETRACKER: D3D12_MESSAGE_ID = 1164;
  D3D12_MESSAGE_ID_DESTROY_LIFETIMETRACKER: D3D12_MESSAGE_ID = 1165;
  D3D12_MESSAGE_ID_DESTROYOWNEDOBJECT_OBJECTNOTOWNED: D3D12_MESSAGE_ID = 1166;
  D3D12_MESSAGE_ID_CREATE_TRACKEDWORKLOAD: D3D12_MESSAGE_ID = 1167;
  D3D12_MESSAGE_ID_LIVE_TRACKEDWORKLOAD: D3D12_MESSAGE_ID = 1168;
  D3D12_MESSAGE_ID_DESTROY_TRACKEDWORKLOAD: D3D12_MESSAGE_ID = 1169;
  D3D12_MESSAGE_ID_RENDER_PASS_ERROR: D3D12_MESSAGE_ID = 1170;
  D3D12_MESSAGE_ID_META_COMMAND_ID_INVALID: D3D12_MESSAGE_ID = 1171;
  D3D12_MESSAGE_ID_META_COMMAND_UNSUPPORTED_PARAMS: D3D12_MESSAGE_ID = 1172;
  D3D12_MESSAGE_ID_META_COMMAND_FAILED_ENUMERATION: D3D12_MESSAGE_ID = 1173;
  D3D12_MESSAGE_ID_META_COMMAND_PARAMETER_SIZE_MISMATCH: D3D12_MESSAGE_ID = 1174;
  D3D12_MESSAGE_ID_UNINITIALIZED_META_COMMAND: D3D12_MESSAGE_ID = 1175;
  D3D12_MESSAGE_ID_META_COMMAND_INVALID_GPU_VIRTUAL_ADDRESS: D3D12_MESSAGE_ID = 1176;
  D3D12_MESSAGE_ID_CREATE_VIDEOENCODECOMMANDLIST: D3D12_MESSAGE_ID = 1177;
  D3D12_MESSAGE_ID_LIVE_VIDEOENCODECOMMANDLIST: D3D12_MESSAGE_ID = 1178;
  D3D12_MESSAGE_ID_DESTROY_VIDEOENCODECOMMANDLIST: D3D12_MESSAGE_ID = 1179;
  D3D12_MESSAGE_ID_CREATE_VIDEOENCODECOMMANDQUEUE: D3D12_MESSAGE_ID = 1180;
  D3D12_MESSAGE_ID_LIVE_VIDEOENCODECOMMANDQUEUE: D3D12_MESSAGE_ID = 1181;
  D3D12_MESSAGE_ID_DESTROY_VIDEOENCODECOMMANDQUEUE: D3D12_MESSAGE_ID = 1182;
  D3D12_MESSAGE_ID_CREATE_VIDEOMOTIONESTIMATOR: D3D12_MESSAGE_ID = 1183;
  D3D12_MESSAGE_ID_LIVE_VIDEOMOTIONESTIMATOR: D3D12_MESSAGE_ID = 1184;
  D3D12_MESSAGE_ID_DESTROY_VIDEOMOTIONESTIMATOR: D3D12_MESSAGE_ID = 1185;
  D3D12_MESSAGE_ID_CREATE_VIDEOMOTIONVECTORHEAP: D3D12_MESSAGE_ID = 1186;
  D3D12_MESSAGE_ID_LIVE_VIDEOMOTIONVECTORHEAP: D3D12_MESSAGE_ID = 1187;
  D3D12_MESSAGE_ID_DESTROY_VIDEOMOTIONVECTORHEAP: D3D12_MESSAGE_ID = 1188;
  D3D12_MESSAGE_ID_MULTIPLE_TRACKED_WORKLOADS: D3D12_MESSAGE_ID = 1189;
  D3D12_MESSAGE_ID_MULTIPLE_TRACKED_WORKLOAD_PAIRS: D3D12_MESSAGE_ID = 1190;
  D3D12_MESSAGE_ID_OUT_OF_ORDER_TRACKED_WORKLOAD_PAIR: D3D12_MESSAGE_ID = 1191;
  D3D12_MESSAGE_ID_CANNOT_ADD_TRACKED_WORKLOAD: D3D12_MESSAGE_ID = 1192;
  D3D12_MESSAGE_ID_INCOMPLETE_TRACKED_WORKLOAD_PAIR: D3D12_MESSAGE_ID = 1193;
  D3D12_MESSAGE_ID_CREATE_STATE_OBJECT_ERROR: D3D12_MESSAGE_ID = 1194;
  D3D12_MESSAGE_ID_GET_SHADER_IDENTIFIER_ERROR: D3D12_MESSAGE_ID = 1195;
  D3D12_MESSAGE_ID_GET_SHADER_STACK_SIZE_ERROR: D3D12_MESSAGE_ID = 1196;
  D3D12_MESSAGE_ID_GET_PIPELINE_STACK_SIZE_ERROR: D3D12_MESSAGE_ID = 1197;
  D3D12_MESSAGE_ID_SET_PIPELINE_STACK_SIZE_ERROR: D3D12_MESSAGE_ID = 1198;
  D3D12_MESSAGE_ID_GET_SHADER_IDENTIFIER_SIZE_INVALID: D3D12_MESSAGE_ID = 1199;
  D3D12_MESSAGE_ID_CHECK_DRIVER_MATCHING_IDENTIFIER_INVALID: D3D12_MESSAGE_ID = 1200;
  D3D12_MESSAGE_ID_CHECK_DRIVER_MATCHING_IDENTIFIER_DRIVER_REPORTED_ISSUE: D3D12_MESSAGE_ID = 1201;
  D3D12_MESSAGE_ID_RENDER_PASS_INVALID_RESOURCE_BARRIER: D3D12_MESSAGE_ID = 1202;
  D3D12_MESSAGE_ID_RENDER_PASS_DISALLOWED_API_CALLED: D3D12_MESSAGE_ID = 1203;
  D3D12_MESSAGE_ID_RENDER_PASS_CANNOT_NEST_RENDER_PASSES: D3D12_MESSAGE_ID = 1204;
  D3D12_MESSAGE_ID_RENDER_PASS_CANNOT_END_WITHOUT_BEGIN: D3D12_MESSAGE_ID = 1205;
  D3D12_MESSAGE_ID_RENDER_PASS_CANNOT_CLOSE_COMMAND_LIST: D3D12_MESSAGE_ID = 1206;
  D3D12_MESSAGE_ID_RENDER_PASS_GPU_WORK_WHILE_SUSPENDED: D3D12_MESSAGE_ID = 1207;
  D3D12_MESSAGE_ID_RENDER_PASS_MISMATCHING_SUSPEND_RESUME: D3D12_MESSAGE_ID = 1208;
  D3D12_MESSAGE_ID_RENDER_PASS_NO_PRIOR_SUSPEND_WITHIN_EXECUTECOMMANDLISTS: D3D12_MESSAGE_ID = 1209;
  D3D12_MESSAGE_ID_RENDER_PASS_NO_SUBSEQUENT_RESUME_WITHIN_EXECUTECOMMANDLISTS: D3D12_MESSAGE_ID = 1210;
  D3D12_MESSAGE_ID_TRACKED_WORKLOAD_COMMAND_QUEUE_MISMATCH: D3D12_MESSAGE_ID = 1211;
  D3D12_MESSAGE_ID_TRACKED_WORKLOAD_NOT_SUPPORTED: D3D12_MESSAGE_ID = 1212;
  D3D12_MESSAGE_ID_RENDER_PASS_MISMATCHING_NO_ACCESS: D3D12_MESSAGE_ID = 1213;
  D3D12_MESSAGE_ID_RENDER_PASS_UNSUPPORTED_RESOLVE: D3D12_MESSAGE_ID = 1214;
  D3D12_MESSAGE_ID_CLEARUNORDEREDACCESSVIEW_INVALID_RESOURCE_PTR: D3D12_MESSAGE_ID = 1215;
  D3D12_MESSAGE_ID_WINDOWS7_FENCE_OUTOFORDER_SIGNAL: D3D12_MESSAGE_ID = 1216;
  D3D12_MESSAGE_ID_WINDOWS7_FENCE_OUTOFORDER_WAIT: D3D12_MESSAGE_ID = 1217;
  D3D12_MESSAGE_ID_VIDEO_CREATE_MOTION_ESTIMATOR_INVALID_ARGUMENT: D3D12_MESSAGE_ID = 1218;
  D3D12_MESSAGE_ID_VIDEO_CREATE_MOTION_VECTOR_HEAP_INVALID_ARGUMENT: D3D12_MESSAGE_ID = 1219;
  D3D12_MESSAGE_ID_ESTIMATE_MOTION_INVALID_ARGUMENT: D3D12_MESSAGE_ID = 1220;
  D3D12_MESSAGE_ID_RESOLVE_MOTION_VECTOR_HEAP_INVALID_ARGUMENT: D3D12_MESSAGE_ID = 1221;
  D3D12_MESSAGE_ID_GETGPUVIRTUALADDRESS_INVALID_HEAP_TYPE: D3D12_MESSAGE_ID = 1222;
  D3D12_MESSAGE_ID_SET_BACKGROUND_PROCESSING_MODE_INVALID_ARGUMENT: D3D12_MESSAGE_ID = 1223;
  D3D12_MESSAGE_ID_CREATE_COMMAND_LIST_INVALID_COMMAND_LIST_TYPE_FOR_FEATURE_LEVEL: D3D12_MESSAGE_ID = 1224;
  D3D12_MESSAGE_ID_CREATE_VIDEOEXTENSIONCOMMAND: D3D12_MESSAGE_ID = 1225;
  D3D12_MESSAGE_ID_LIVE_VIDEOEXTENSIONCOMMAND: D3D12_MESSAGE_ID = 1226;
  D3D12_MESSAGE_ID_DESTROY_VIDEOEXTENSIONCOMMAND: D3D12_MESSAGE_ID = 1227;
  D3D12_MESSAGE_ID_INVALID_VIDEO_EXTENSION_COMMAND_ID: D3D12_MESSAGE_ID = 1228;
  D3D12_MESSAGE_ID_VIDEO_EXTENSION_COMMAND_INVALID_ARGUMENT: D3D12_MESSAGE_ID = 1229;
  D3D12_MESSAGE_ID_CREATE_ROOT_SIGNATURE_NOT_UNIQUE_IN_DXIL_LIBRARY: D3D12_MESSAGE_ID = 1230;
  D3D12_MESSAGE_ID_VARIABLE_SHADING_RATE_NOT_ALLOWED_WITH_TIR: D3D12_MESSAGE_ID = 1231;
  D3D12_MESSAGE_ID_GEOMETRY_SHADER_OUTPUTTING_BOTH_VIEWPORT_ARRAY_INDEX_AND_SHADING_RATE_NOT_SUPPORTED_ON_DEVICE: D3D12_MESSAGE_ID = 1232;
  D3D12_MESSAGE_ID_RSSETSHADING_RATE_INVALID_SHADING_RATE: D3D12_MESSAGE_ID = 1233;
  D3D12_MESSAGE_ID_RSSETSHADING_RATE_SHADING_RATE_NOT_PERMITTED_BY_CAP: D3D12_MESSAGE_ID = 1234;
  D3D12_MESSAGE_ID_RSSETSHADING_RATE_INVALID_COMBINER: D3D12_MESSAGE_ID = 1235;
  D3D12_MESSAGE_ID_RSSETSHADINGRATEIMAGE_REQUIRES_TIER_2: D3D12_MESSAGE_ID = 1236;
  D3D12_MESSAGE_ID_RSSETSHADINGRATE_REQUIRES_TIER_1: D3D12_MESSAGE_ID = 1237;
  D3D12_MESSAGE_ID_SHADING_RATE_IMAGE_INCORRECT_FORMAT: D3D12_MESSAGE_ID = 1238;
  D3D12_MESSAGE_ID_SHADING_RATE_IMAGE_INCORRECT_ARRAY_SIZE: D3D12_MESSAGE_ID = 1239;
  D3D12_MESSAGE_ID_SHADING_RATE_IMAGE_INCORRECT_MIP_LEVEL: D3D12_MESSAGE_ID = 1240;
  D3D12_MESSAGE_ID_SHADING_RATE_IMAGE_INCORRECT_SAMPLE_COUNT: D3D12_MESSAGE_ID = 1241;
  D3D12_MESSAGE_ID_SHADING_RATE_IMAGE_INCORRECT_SAMPLE_QUALITY: D3D12_MESSAGE_ID = 1242;
  D3D12_MESSAGE_ID_NON_RETAIL_SHADER_MODEL_WONT_VALIDATE: D3D12_MESSAGE_ID = 1243;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_AS_ROOT_SIGNATURE_MISMATCH: D3D12_MESSAGE_ID = 1244;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_MS_ROOT_SIGNATURE_MISMATCH: D3D12_MESSAGE_ID = 1245;
  D3D12_MESSAGE_ID_ADD_TO_STATE_OBJECT_ERROR: D3D12_MESSAGE_ID = 1246;
  D3D12_MESSAGE_ID_CREATE_PROTECTED_RESOURCE_SESSION_INVALID_ARGUMENT: D3D12_MESSAGE_ID = 1247;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_MS_PSO_DESC_MISMATCH: D3D12_MESSAGE_ID = 1248;
  D3D12_MESSAGE_ID_CREATEPIPELINESTATE_MS_INCOMPLETE_TYPE: D3D12_MESSAGE_ID = 1249;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_AS_NOT_MS_MISMATCH: D3D12_MESSAGE_ID = 1250;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_MS_NOT_PS_MISMATCH: D3D12_MESSAGE_ID = 1251;
  D3D12_MESSAGE_ID_NONZERO_SAMPLER_FEEDBACK_MIP_REGION_WITH_INCOMPATIBLE_FORMAT: D3D12_MESSAGE_ID = 1252;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_INPUTLAYOUT_SHADER_MISMATCH: D3D12_MESSAGE_ID = 1253;
  D3D12_MESSAGE_ID_EMPTY_DISPATCH: D3D12_MESSAGE_ID = 1254;
  D3D12_MESSAGE_ID_RESOURCE_FORMAT_REQUIRES_SAMPLER_FEEDBACK_CAPABILITY: D3D12_MESSAGE_ID = 1255;
  D3D12_MESSAGE_ID_SAMPLER_FEEDBACK_MAP_INVALID_MIP_REGION: D3D12_MESSAGE_ID = 1256;
  D3D12_MESSAGE_ID_SAMPLER_FEEDBACK_MAP_INVALID_DIMENSION: D3D12_MESSAGE_ID = 1257;
  D3D12_MESSAGE_ID_SAMPLER_FEEDBACK_MAP_INVALID_SAMPLE_COUNT: D3D12_MESSAGE_ID = 1258;
  D3D12_MESSAGE_ID_SAMPLER_FEEDBACK_MAP_INVALID_SAMPLE_QUALITY: D3D12_MESSAGE_ID = 1259;
  D3D12_MESSAGE_ID_SAMPLER_FEEDBACK_MAP_INVALID_LAYOUT: D3D12_MESSAGE_ID = 1260;
  D3D12_MESSAGE_ID_SAMPLER_FEEDBACK_MAP_REQUIRES_UNORDERED_ACCESS_FLAG: D3D12_MESSAGE_ID = 1261;
  D3D12_MESSAGE_ID_SAMPLER_FEEDBACK_CREATE_UAV_NULL_ARGUMENTS: D3D12_MESSAGE_ID = 1262;
  D3D12_MESSAGE_ID_SAMPLER_FEEDBACK_UAV_REQUIRES_SAMPLER_FEEDBACK_CAPABILITY: D3D12_MESSAGE_ID = 1263;
  D3D12_MESSAGE_ID_SAMPLER_FEEDBACK_CREATE_UAV_REQUIRES_FEEDBACK_MAP_FORMAT: D3D12_MESSAGE_ID = 1264;
  D3D12_MESSAGE_ID_CREATEMESHSHADER_INVALIDSHADERBYTECODE: D3D12_MESSAGE_ID = 1265;
  D3D12_MESSAGE_ID_CREATEMESHSHADER_OUTOFMEMORY: D3D12_MESSAGE_ID = 1266;
  D3D12_MESSAGE_ID_CREATEMESHSHADERWITHSTREAMOUTPUT_INVALIDSHADERTYPE: D3D12_MESSAGE_ID = 1267;
  D3D12_MESSAGE_ID_RESOLVESUBRESOURCE_SAMPLER_FEEDBACK_TRANSCODE_INVALID_FORMAT: D3D12_MESSAGE_ID = 1268;
  D3D12_MESSAGE_ID_RESOLVESUBRESOURCE_SAMPLER_FEEDBACK_INVALID_MIP_LEVEL_COUNT: D3D12_MESSAGE_ID = 1269;
  D3D12_MESSAGE_ID_RESOLVESUBRESOURCE_SAMPLER_FEEDBACK_TRANSCODE_ARRAY_SIZE_MISMATCH: D3D12_MESSAGE_ID = 1270;
  D3D12_MESSAGE_ID_SAMPLER_FEEDBACK_CREATE_UAV_MISMATCHING_TARGETED_RESOURCE: D3D12_MESSAGE_ID = 1271;
  D3D12_MESSAGE_ID_CREATEMESHSHADER_OUTPUTEXCEEDSMAXSIZE: D3D12_MESSAGE_ID = 1272;
  D3D12_MESSAGE_ID_CREATEMESHSHADER_GROUPSHAREDEXCEEDSMAXSIZE: D3D12_MESSAGE_ID = 1273;
  D3D12_MESSAGE_ID_VERTEX_SHADER_OUTPUTTING_BOTH_VIEWPORT_ARRAY_INDEX_AND_SHADING_RATE_NOT_SUPPORTED_ON_DEVICE: D3D12_MESSAGE_ID = 1274;
  D3D12_MESSAGE_ID_MESH_SHADER_OUTPUTTING_BOTH_VIEWPORT_ARRAY_INDEX_AND_SHADING_RATE_NOT_SUPPORTED_ON_DEVICE: D3D12_MESSAGE_ID = 1275;
  D3D12_MESSAGE_ID_CREATEMESHSHADER_MISMATCHEDASMSPAYLOADSIZE: D3D12_MESSAGE_ID = 1276;
  D3D12_MESSAGE_ID_CREATE_ROOT_SIGNATURE_UNBOUNDED_STATIC_DESCRIPTORS: D3D12_MESSAGE_ID = 1277;
  D3D12_MESSAGE_ID_CREATEAMPLIFICATIONSHADER_INVALIDSHADERBYTECODE: D3D12_MESSAGE_ID = 1278;
  D3D12_MESSAGE_ID_CREATEAMPLIFICATIONSHADER_OUTOFMEMORY: D3D12_MESSAGE_ID = 1279;
  D3D12_MESSAGE_ID_CREATE_SHADERCACHESESSION: D3D12_MESSAGE_ID = 1280;
  D3D12_MESSAGE_ID_LIVE_SHADERCACHESESSION: D3D12_MESSAGE_ID = 1281;
  D3D12_MESSAGE_ID_DESTROY_SHADERCACHESESSION: D3D12_MESSAGE_ID = 1282;
  D3D12_MESSAGE_ID_CREATESHADERCACHESESSION_INVALIDARGS: D3D12_MESSAGE_ID = 1283;
  D3D12_MESSAGE_ID_CREATESHADERCACHESESSION_DISABLED: D3D12_MESSAGE_ID = 1284;
  D3D12_MESSAGE_ID_CREATESHADERCACHESESSION_ALREADYOPEN: D3D12_MESSAGE_ID = 1285;
  D3D12_MESSAGE_ID_SHADERCACHECONTROL_DEVELOPERMODE: D3D12_MESSAGE_ID = 1286;
  D3D12_MESSAGE_ID_SHADERCACHECONTROL_INVALIDFLAGS: D3D12_MESSAGE_ID = 1287;
  D3D12_MESSAGE_ID_SHADERCACHECONTROL_STATEALREADYSET: D3D12_MESSAGE_ID = 1288;
  D3D12_MESSAGE_ID_SHADERCACHECONTROL_IGNOREDFLAG: D3D12_MESSAGE_ID = 1289;
  D3D12_MESSAGE_ID_SHADERCACHESESSION_STOREVALUE_ALREADYPRESENT: D3D12_MESSAGE_ID = 1290;
  D3D12_MESSAGE_ID_SHADERCACHESESSION_STOREVALUE_HASHCOLLISION: D3D12_MESSAGE_ID = 1291;
  D3D12_MESSAGE_ID_SHADERCACHESESSION_STOREVALUE_CACHEFULL: D3D12_MESSAGE_ID = 1292;
  D3D12_MESSAGE_ID_SHADERCACHESESSION_FINDVALUE_NOTFOUND: D3D12_MESSAGE_ID = 1293;
  D3D12_MESSAGE_ID_SHADERCACHESESSION_CORRUPT: D3D12_MESSAGE_ID = 1294;
  D3D12_MESSAGE_ID_SHADERCACHESESSION_DISABLED: D3D12_MESSAGE_ID = 1295;
  D3D12_MESSAGE_ID_OVERSIZED_DISPATCH: D3D12_MESSAGE_ID = 1296;
  D3D12_MESSAGE_ID_CREATE_VIDEOENCODER: D3D12_MESSAGE_ID = 1297;
  D3D12_MESSAGE_ID_LIVE_VIDEOENCODER: D3D12_MESSAGE_ID = 1298;
  D3D12_MESSAGE_ID_DESTROY_VIDEOENCODER: D3D12_MESSAGE_ID = 1299;
  D3D12_MESSAGE_ID_CREATE_VIDEOENCODERHEAP: D3D12_MESSAGE_ID = 1300;
  D3D12_MESSAGE_ID_LIVE_VIDEOENCODERHEAP: D3D12_MESSAGE_ID = 1301;
  D3D12_MESSAGE_ID_DESTROY_VIDEOENCODERHEAP: D3D12_MESSAGE_ID = 1302;
  D3D12_MESSAGE_ID_COPYTEXTUREREGION_MISMATCH_ENCODE_REFERENCE_ONLY_FLAG: D3D12_MESSAGE_ID = 1303;
  D3D12_MESSAGE_ID_COPYRESOURCE_MISMATCH_ENCODE_REFERENCE_ONLY_FLAG: D3D12_MESSAGE_ID = 1304;
  D3D12_MESSAGE_ID_ENCODE_FRAME_INVALID_PARAMETERS: D3D12_MESSAGE_ID = 1305;
  D3D12_MESSAGE_ID_ENCODE_FRAME_UNSUPPORTED_PARAMETERS: D3D12_MESSAGE_ID = 1306;
  D3D12_MESSAGE_ID_RESOLVE_ENCODER_OUTPUT_METADATA_INVALID_PARAMETERS: D3D12_MESSAGE_ID = 1307;
  D3D12_MESSAGE_ID_RESOLVE_ENCODER_OUTPUT_METADATA_UNSUPPORTED_PARAMETERS: D3D12_MESSAGE_ID = 1308;
  D3D12_MESSAGE_ID_CREATE_VIDEO_ENCODER_INVALID_PARAMETERS: D3D12_MESSAGE_ID = 1309;
  D3D12_MESSAGE_ID_CREATE_VIDEO_ENCODER_UNSUPPORTED_PARAMETERS: D3D12_MESSAGE_ID = 1310;
  D3D12_MESSAGE_ID_CREATE_VIDEO_ENCODER_HEAP_INVALID_PARAMETERS: D3D12_MESSAGE_ID = 1311;
  D3D12_MESSAGE_ID_CREATE_VIDEO_ENCODER_HEAP_UNSUPPORTED_PARAMETERS: D3D12_MESSAGE_ID = 1312;
  D3D12_MESSAGE_ID_CREATECOMMANDLIST_NULL_COMMANDALLOCATOR: D3D12_MESSAGE_ID = 1313;
  D3D12_MESSAGE_ID_CLEAR_UNORDERED_ACCESS_VIEW_INVALID_DESCRIPTOR_HANDLE: D3D12_MESSAGE_ID = 1314;
  D3D12_MESSAGE_ID_DESCRIPTOR_HEAP_NOT_SHADER_VISIBLE: D3D12_MESSAGE_ID = 1315;
  D3D12_MESSAGE_ID_CREATEBLENDSTATE_BLENDOP_WARNING: D3D12_MESSAGE_ID = 1316;
  D3D12_MESSAGE_ID_CREATEBLENDSTATE_BLENDOPALPHA_WARNING: D3D12_MESSAGE_ID = 1317;
  D3D12_MESSAGE_ID_WRITE_COMBINE_PERFORMANCE_WARNING: D3D12_MESSAGE_ID = 1318;
  D3D12_MESSAGE_ID_RESOLVE_QUERY_INVALID_QUERY_STATE: D3D12_MESSAGE_ID = 1319;
  D3D12_MESSAGE_ID_SETPRIVATEDATA_NO_ACCESS: D3D12_MESSAGE_ID = 1320;
  D3D12_MESSAGE_ID_COMMAND_LIST_STATIC_DESCRIPTOR_SAMPLER_MODE_MISMATCH: D3D12_MESSAGE_ID = 1321;
  D3D12_MESSAGE_ID_GETCOPYABLEFOOTPRINTS_UNSUPPORTED_BUFFER_WIDTH: D3D12_MESSAGE_ID = 1322;
  D3D12_MESSAGE_ID_CREATEMESHSHADER_TOPOLOGY_MISMATCH: D3D12_MESSAGE_ID = 1323;
  D3D12_MESSAGE_ID_VRS_SUM_COMBINER_REQUIRES_CAPABILITY: D3D12_MESSAGE_ID = 1324;
  D3D12_MESSAGE_ID_SETTING_SHADING_RATE_FROM_MS_REQUIRES_CAPABILITY: D3D12_MESSAGE_ID = 1325;
  D3D12_MESSAGE_ID_SHADERCACHESESSION_SHADERCACHEDELETE_NOTSUPPORTED: D3D12_MESSAGE_ID = 1326;
  D3D12_MESSAGE_ID_SHADERCACHECONTROL_SHADERCACHECLEAR_NOTSUPPORTED: D3D12_MESSAGE_ID = 1327;
  D3D12_MESSAGE_ID_CREATERESOURCE_STATE_IGNORED: D3D12_MESSAGE_ID = 1328;
  D3D12_MESSAGE_ID_UNUSED_CROSS_EXECUTE_SPLIT_BARRIER: D3D12_MESSAGE_ID = 1329;
  D3D12_MESSAGE_ID_DEVICE_OPEN_SHARED_HANDLE_ACCESS_DENIED: D3D12_MESSAGE_ID = 1330;
  D3D12_MESSAGE_ID_INCOMPATIBLE_BARRIER_VALUES: D3D12_MESSAGE_ID = 1331;
  D3D12_MESSAGE_ID_INCOMPATIBLE_BARRIER_ACCESS: D3D12_MESSAGE_ID = 1332;
  D3D12_MESSAGE_ID_INCOMPATIBLE_BARRIER_SYNC: D3D12_MESSAGE_ID = 1333;
  D3D12_MESSAGE_ID_INCOMPATIBLE_BARRIER_LAYOUT: D3D12_MESSAGE_ID = 1334;
  D3D12_MESSAGE_ID_INCOMPATIBLE_BARRIER_TYPE: D3D12_MESSAGE_ID = 1335;
  D3D12_MESSAGE_ID_OUT_OF_BOUNDS_BARRIER_SUBRESOURCE_RANGE: D3D12_MESSAGE_ID = 1336;
  D3D12_MESSAGE_ID_INCOMPATIBLE_BARRIER_RESOURCE_DIMENSION: D3D12_MESSAGE_ID = 1337;
  D3D12_MESSAGE_ID_SET_SCISSOR_RECTS_INVALID_RECT: D3D12_MESSAGE_ID = 1338;
  D3D12_MESSAGE_ID_SHADING_RATE_SOURCE_REQUIRES_DIMENSION_TEXTURE2D: D3D12_MESSAGE_ID = 1339;
  D3D12_MESSAGE_ID_BUFFER_BARRIER_SUBREGION_OUT_OF_BOUNDS: D3D12_MESSAGE_ID = 1340;
  D3D12_MESSAGE_ID_UNSUPPORTED_BARRIER_LAYOUT: D3D12_MESSAGE_ID = 1341;
  D3D12_MESSAGE_ID_CREATERESOURCEANDHEAP_INVALID_PARAMETERS: D3D12_MESSAGE_ID = 1342;
  D3D12_MESSAGE_ID_ENHANCED_BARRIERS_NOT_SUPPORTED: D3D12_MESSAGE_ID = 1343;
  D3D12_MESSAGE_ID_LEGACY_BARRIER_VALIDATION_FORCED_ON: D3D12_MESSAGE_ID = 1346;
  D3D12_MESSAGE_ID_EMPTY_ROOT_DESCRIPTOR_TABLE: D3D12_MESSAGE_ID = 1347;
  D3D12_MESSAGE_ID_COMMAND_LIST_DRAW_ELEMENT_OFFSET_UNALIGNED: D3D12_MESSAGE_ID = 1348;
  D3D12_MESSAGE_ID_ALPHA_BLEND_FACTOR_NOT_SUPPORTED: D3D12_MESSAGE_ID = 1349;
  D3D12_MESSAGE_ID_BARRIER_INTEROP_INVALID_LAYOUT: D3D12_MESSAGE_ID = 1350;
  D3D12_MESSAGE_ID_BARRIER_INTEROP_INVALID_STATE: D3D12_MESSAGE_ID = 1351;
  D3D12_MESSAGE_ID_GRAPHICS_PIPELINE_STATE_DESC_ZERO_SAMPLE_MASK: D3D12_MESSAGE_ID = 1352;
  D3D12_MESSAGE_ID_INDEPENDENT_STENCIL_REF_NOT_SUPPORTED: D3D12_MESSAGE_ID = 1353;
  D3D12_MESSAGE_ID_CREATEDEPTHSTENCILSTATE_INDEPENDENT_MASKS_UNSUPPORTED: D3D12_MESSAGE_ID = 1354;
  D3D12_MESSAGE_ID_TEXTURE_BARRIER_SUBRESOURCES_OUT_OF_BOUNDS: D3D12_MESSAGE_ID = 1355;
  D3D12_MESSAGE_ID_NON_OPTIMAL_BARRIER_ONLY_EXECUTE_COMMAND_LISTS: D3D12_MESSAGE_ID = 1356;
  D3D12_MESSAGE_ID_EXECUTE_INDIRECT_ZERO_COMMAND_COUNT: D3D12_MESSAGE_ID = 1357;
  D3D12_MESSAGE_ID_GPU_BASED_VALIDATION_INCOMPATIBLE_TEXTURE_LAYOUT: D3D12_MESSAGE_ID = 1358;
  D3D12_MESSAGE_ID_DYNAMIC_INDEX_BUFFER_STRIP_CUT_NOT_SUPPORTED: D3D12_MESSAGE_ID = 1359;
  D3D12_MESSAGE_ID_PRIMITIVE_TOPOLOGY_TRIANGLE_FANS_NOT_SUPPORTED: D3D12_MESSAGE_ID = 1360;
  D3D12_MESSAGE_ID_CREATE_SAMPLER_COMPARISON_FUNC_IGNORED: D3D12_MESSAGE_ID = 1361;
  D3D12_MESSAGE_ID_CREATEHEAP_INVALIDHEAPTYPE: D3D12_MESSAGE_ID = 1362;
  D3D12_MESSAGE_ID_CREATERESOURCEANDHEAP_INVALIDHEAPTYPE: D3D12_MESSAGE_ID = 1363;
  D3D12_MESSAGE_ID_DYNAMIC_DEPTH_BIAS_NOT_SUPPORTED: D3D12_MESSAGE_ID = 1364;
  D3D12_MESSAGE_ID_CREATERASTERIZERSTATE_NON_WHOLE_DYNAMIC_DEPTH_BIAS: D3D12_MESSAGE_ID = 1365;
  D3D12_MESSAGE_ID_DYNAMIC_DEPTH_BIAS_FLAG_MISSING: D3D12_MESSAGE_ID = 1366;
  D3D12_MESSAGE_ID_DYNAMIC_DEPTH_BIAS_NO_PIPELINE: D3D12_MESSAGE_ID = 1367;
  D3D12_MESSAGE_ID_DYNAMIC_INDEX_BUFFER_STRIP_CUT_FLAG_MISSING: D3D12_MESSAGE_ID = 1368;
  D3D12_MESSAGE_ID_DYNAMIC_INDEX_BUFFER_STRIP_CUT_NO_PIPELINE: D3D12_MESSAGE_ID = 1369;
  D3D12_MESSAGE_ID_NONNORMALIZED_COORDINATE_SAMPLING_NOT_SUPPORTED: D3D12_MESSAGE_ID = 1370;
  D3D12_MESSAGE_ID_INVALID_CAST_TARGET: D3D12_MESSAGE_ID = 1371;
  D3D12_MESSAGE_ID_RENDER_PASS_COMMANDLIST_INVALID_END_STATE: D3D12_MESSAGE_ID = 1372;
  D3D12_MESSAGE_ID_RENDER_PASS_COMMANDLIST_INVALID_START_STATE: D3D12_MESSAGE_ID = 1373;
  D3D12_MESSAGE_ID_RENDER_PASS_MISMATCHING_ACCESS: D3D12_MESSAGE_ID = 1374;
  D3D12_MESSAGE_ID_RENDER_PASS_MISMATCHING_LOCAL_PRESERVE_PARAMETERS: D3D12_MESSAGE_ID = 1375;
  D3D12_MESSAGE_ID_RENDER_PASS_LOCAL_PRESERVE_RENDER_PARAMETERS_ERROR: D3D12_MESSAGE_ID = 1376;
  D3D12_MESSAGE_ID_RENDER_PASS_LOCAL_DEPTH_STENCIL_ERROR: D3D12_MESSAGE_ID = 1377;
  D3D12_MESSAGE_ID_DRAW_POTENTIALLY_OUTSIDE_OF_VALID_RENDER_AREA: D3D12_MESSAGE_ID = 1378;
  D3D12_MESSAGE_ID_CREATERASTERIZERSTATE_INVALID_LINERASTERIZATIONMODE: D3D12_MESSAGE_ID = 1379;
  D3D12_MESSAGE_ID_CREATERESOURCE_INVALIDALIGNMENT_SMALLRESOURCE: D3D12_MESSAGE_ID = 1380;
  D3D12_MESSAGE_ID_GENERIC_DEVICE_OPERATION_UNSUPPORTED: D3D12_MESSAGE_ID = 1381;
  D3D12_MESSAGE_ID_CREATEGRAPHICSPIPELINESTATE_RENDER_TARGET_WRONG_WRITE_MASK: D3D12_MESSAGE_ID = 1382;
  D3D12_MESSAGE_ID_PROBABLE_PIX_EVENT_LEAK: D3D12_MESSAGE_ID = 1383;
  D3D12_MESSAGE_ID_PIX_EVENT_UNDERFLOW: D3D12_MESSAGE_ID = 1384;
  D3D12_MESSAGE_ID_RECREATEAT_INVALID_TARGET: D3D12_MESSAGE_ID = 1385;
  D3D12_MESSAGE_ID_RECREATEAT_INSUFFICIENT_SUPPORT: D3D12_MESSAGE_ID = 1386;
  D3D12_MESSAGE_ID_GPU_BASED_VALIDATION_STRUCTURED_BUFFER_STRIDE_MISMATCH: D3D12_MESSAGE_ID = 1387;
  D3D12_MESSAGE_ID_DISPATCH_GRAPH_INVALID: D3D12_MESSAGE_ID = 1388;
  D3D12_MESSAGE_ID_DIRECTSR_SUPERRES_TARGET_FORMAT_INVALID: D3D12_MESSAGE_ID = 1389;
  D3D12_MESSAGE_ID_DIRECTSR_SUPERRES_TARGET_DIMENSION_INVALID: D3D12_MESSAGE_ID = 1390;
  D3D12_MESSAGE_ID_DIRECTSR_SUPERRES_SOURCE_COLOR_FORMAT_INVALID: D3D12_MESSAGE_ID = 1391;
  D3D12_MESSAGE_ID_DIRECTSR_SUPERRES_SOURCE_DEPTH_FORMAT_INVALID: D3D12_MESSAGE_ID = 1392;
  D3D12_MESSAGE_ID_DIRECTSR_SUPERRES_EXPOSURE_SCALE_FORMAT_INVALID: D3D12_MESSAGE_ID = 1393;
  D3D12_MESSAGE_ID_DIRECTSR_SUPERRES_ENGINE_CREATE_FLAGS_INVALID: D3D12_MESSAGE_ID = 1394;
  D3D12_MESSAGE_ID_DIRECTSR_SUPERRES_EXTENSION_INTERNAL_LOAD_FAILURE: D3D12_MESSAGE_ID = 1395;
  D3D12_MESSAGE_ID_DIRECTSR_SUPERRES_EXTENSION_INTERNAL_ENGINE_CREATION_ERROR: D3D12_MESSAGE_ID = 1396;
  D3D12_MESSAGE_ID_DIRECTSR_SUPERRES_EXTENSION_INTERNAL_UPSCALER_CREATION_ERROR: D3D12_MESSAGE_ID = 1397;
  D3D12_MESSAGE_ID_DIRECTSR_SUPERRES_EXTENSION_INTERNAL_UPSCALER_EXECUTION_ERROR: D3D12_MESSAGE_ID = 1398;
  D3D12_MESSAGE_ID_DIRECTSR_SUPERRES_UPSCALER_EXECUTE_REGION_INVALID: D3D12_MESSAGE_ID = 1399;
  D3D12_MESSAGE_ID_DIRECTSR_SUPERRES_UPSCALER_EXECUTE_TIME_DELTA_INVALID: D3D12_MESSAGE_ID = 1400;
  D3D12_MESSAGE_ID_DIRECTSR_SUPERRES_UPSCALER_EXECUTE_REQUIRED_TEXTURE_IS_NULL: D3D12_MESSAGE_ID = 1401;
  D3D12_MESSAGE_ID_DIRECTSR_SUPERRES_UPSCALER_EXECUTE_MOTION_VECTORS_FORMAT_INVALID: D3D12_MESSAGE_ID = 1402;
  D3D12_MESSAGE_ID_DIRECTSR_SUPERRES_UPSCALER_EXECUTE_FLAGS_INVALID: D3D12_MESSAGE_ID = 1403;
  D3D12_MESSAGE_ID_DIRECTSR_SUPERRES_UPSCALER_EXECUTE_FORMAT_INVALID: D3D12_MESSAGE_ID = 1404;
  D3D12_MESSAGE_ID_DIRECTSR_SUPERRES_UPSCALER_EXECUTE_EXPOSURE_SCALE_TEXTURE_SIZE_INVALID: D3D12_MESSAGE_ID = 1405;
  D3D12_MESSAGE_ID_DIRECTSR_SUPERRES_VARIANT_INDEX_OUT_OF_BOUNDS: D3D12_MESSAGE_ID = 1406;
  D3D12_MESSAGE_ID_DIRECTSR_SUPERRES_VARIANT_ID_NOT_FOUND: D3D12_MESSAGE_ID = 1407;
  D3D12_MESSAGE_ID_DIRECTSR_SUPERRES_DUPLICATE_VARIANT_ID: D3D12_MESSAGE_ID = 1408;
  D3D12_MESSAGE_ID_DIRECTSR_OUT_OF_MEMORY: D3D12_MESSAGE_ID = 1409;
  D3D12_MESSAGE_ID_DIRECTSR_SUPERRES_UPSCALER_EXECUTE_UNEXPECTED_TEXTURE_IS_IGNORED: D3D12_MESSAGE_ID = 1410;
  D3D12_MESSAGE_ID_DIRECTSR_SUPERRES_UPSCALER_EVICT_UNDERFLOW: D3D12_MESSAGE_ID = 1411;
  D3D12_MESSAGE_ID_DIRECTSR_SUPERRES_UPSCALER_EXECUTE_OPTIONAL_TEXTURE_IS_NULL: D3D12_MESSAGE_ID = 1412;
  D3D12_MESSAGE_ID_DIRECTSR_SUPERRES_UPSCALER_EXECUTE_INVALID_CAMERA_JITTER: D3D12_MESSAGE_ID = 1413;
  D3D12_MESSAGE_ID_CREATE_STATE_OBJECT_WARNING: D3D12_MESSAGE_ID = 1414;
  D3D12_MESSAGE_ID_GUID_TEXTURE_LAYOUT_UNSUPPORTED: D3D12_MESSAGE_ID = 1415;
  D3D12_MESSAGE_ID_RESOLVE_ENCODER_INPUT_PARAM_LAYOUT_INVALID_PARAMETERS: D3D12_MESSAGE_ID = 1416;
  D3D12_MESSAGE_ID_INVALID_BARRIER_ACCESS: D3D12_MESSAGE_ID = 1417;
  D3D12_MESSAGE_ID_COMMAND_LIST_DRAW_INSTANCE_COUNT_ZERO: D3D12_MESSAGE_ID = 1418;
  D3D12_MESSAGE_ID_DESCRIPTOR_HEAP_NOT_SET_BEFORE_ROOT_SIGNATURE_WITH_DIRECTLY_INDEXED_FLAG: D3D12_MESSAGE_ID = 1419;
  D3D12_MESSAGE_ID_DIFFERENT_DESCRIPTOR_HEAP_SET_AFTER_ROOT_SIGNATURE_WITH_DIRECTLY_INDEXED_FLAG: D3D12_MESSAGE_ID = 1420;
  D3D12_MESSAGE_ID_APPLICATION_SPECIFIC_DRIVER_STATE_NOT_SUPPORTED: D3D12_MESSAGE_ID = 1421;
  D3D12_MESSAGE_ID_RENDER_TARGET_OR_DEPTH_STENCIL_RESOUCE_NOT_INITIALIZED: D3D12_MESSAGE_ID = 1422;
  D3D12_MESSAGE_ID_BYTECODE_VALIDATION_ERROR: D3D12_MESSAGE_ID = 1423;
  D3D12_MESSAGE_ID_FENCE_ZERO_WAIT: D3D12_MESSAGE_ID = 1424;
  D3D12_MESSAGE_ID_NON_COMMON_RESOURCE_IN_COPY_QUEUE: D3D12_MESSAGE_ID = 1431;
  D3D12_MESSAGE_ID_CREATEPIPELINESTATE_MULTIPLE_ROOT_SIGNATURES_DEFINED: D3D12_MESSAGE_ID = 1435;
  D3D12_MESSAGE_ID_TEXTURE_BARRIER_INVALID_FLAGS: D3D12_MESSAGE_ID = 1436;
  D3D12_MESSAGE_ID_D3D12_MESSAGES_END: D3D12_MESSAGE_ID = 1442;

implementation

  // Implement Additional Prototypes here.

const
  D3D12SDKLayersLib = 'd3d12SDKLayers.dll';

end.
