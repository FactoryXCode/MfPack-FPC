// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.Ks.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 02-06-2016
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: Windows Driver Model/Connection and Streaming Architecture (WDM-CSA)
// ions.
//
// Organisation: FactoryX
// Initiator(s): Tony (maXcomX), Peter (OzShips)
// Contributor(s): Tony Kalf (maXcomX),
//
//------------------------------------------------------------------------------
// CHANGE LOG
// Date       Person              Reason
// ---------- ------------------- ----------------------------------------------
// 15/11/2026 All                 Eels release  SDK 10.0.28000.2705 (Windows 11)
//------------------------------------------------------------------------------
//
// Remarks: Requires Windows 8.1 or later.
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
// Source: ks.h
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
unit WinApi.Ks;

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
  KS_SEEKING_NoPositioning = LongInt(0);
  KS_SEEKING_AbsolutePositioning = LongInt(1);
  KS_SEEKING_RelativePositioning = LongInt(2);
  KS_SEEKING_IncrementalPositioning = LongInt(3);
  KS_SEEKING_PositioningBitsMask = LongInt($3);
  KS_SEEKING_SeekToKeyFrame = LongInt(4);
  KS_SEEKING_ReturnTime = LongInt($8);


  _KS_NO_ANONYMOUS_STRUCTURES_        = 1;


//==============================================================================
  IOCTL_KS_PROPERTY      = DWORD(3080195);
  IOCTL_KS_ENABLE_EVENT  = DWORD(3080199);
  IOCTL_KS_DISABLE_EVENT = DWORD(3080203);
  IOCTL_KS_METHOD        = DWORD(3080207);
  IOCTL_KS_WRITE_STREAM  = DWORD(3112979);
  IOCTL_KS_READ_STREAM   = DWORD(3096599);
  IOCTL_KS_RESET_STATE   = DWORD(3080219);
//==============================================================================

type

  PKSRESET = ^KSRESET;
  KSRESET = (
    KSRESET_BEGIN = 0,
    KSRESET_END   = 1
  );

  PKSSTATE = ^KSSTATE;
  KSSTATE = (
    KSSTATE_STOP    = 0,
    KSSTATE_ACQUIRE = 1,
    KSSTATE_PAUSE   = 2,
    KSSTATE_RUN     = 3
  );

const

  KSPRIORITY_LOW       = $00000001;
  KSPRIORITY_NORMAL    = $40000000;
  KSPRIORITY_HIGH      = $80000000;
  KSPRIORITY_EXCLUSIVE = MAXDWORD;

type

  PKSPRIORITY = ^KSPRIORITY;
  KSPRIORITY = record
    PriorityClass: ULONG;
    PrioritySubClass: ULONG;
  end;


  PKSIDENTIFIER = ^KSIDENTIFIER;
  KSIDENTIFIER = record
    case integer of
      0: (Set_  : TGUID;
          Id    : ULONG;
          Flags : ULONG);
      1: (Alignment : LONGLONG);
  end;

  PKSPROPERTY = ^KSPROPERTY;
  KSPROPERTY  = {$IFDEF TYPE_IDENTITY} type {$ENDIF} KSIDENTIFIER;
  PKSMETHOD   = ^KSMETHOD;
  KSMETHOD    = KSPROPERTY;
  PKSEVENT    = ^KSEVENT;
  KSEVENT     = KSIDENTIFIER;


const

  KSMETHOD_TYPE_NONE             = $00000000;
  KSMETHOD_TYPE_READ             = $00000001;
  KSMETHOD_TYPE_WRITE            = $00000002;
  KSMETHOD_TYPE_MODIFY           = $00000003;
  KSMETHOD_TYPE_SOURCE           = $00000004;

  KSMETHOD_TYPE_SEND             = $00000001;
  KSMETHOD_TYPE_SETSUPPORT       = $00000100;
  KSMETHOD_TYPE_BASICSUPPORT     = $00000200;

  KSMETHOD_TYPE_TOPOLOGY         = $10000000;

  KSPROPERTY_TYPE_GET            = $00000001;
  KSPROPERTY_TYPE_GETPAYLOADSIZE = $00000004;
  KSPROPERTY_TYPE_SET            = $00000002;

  KSPROPERTY_TYPE_SETSUPPORT     = $00000100;
  KSPROPERTY_TYPE_BASICSUPPORT   = $00000200;
  KSPROPERTY_TYPE_RELATIONS      = $00000400;
  KSPROPERTY_TYPE_SERIALIZESET   = $00000800;
  KSPROPERTY_TYPE_UNSERIALIZESET = $00001000;
  KSPROPERTY_TYPE_SERIALIZERAW   = $00002000;
  KSPROPERTY_TYPE_UNSERIALIZERAW = $00004000;
  KSPROPERTY_TYPE_SERIALIZESIZE  = $00008000;
  KSPROPERTY_TYPE_DEFAULTVALUES  = $00010000;

  KSPROPERTY_TYPE_TOPOLOGY       = $10000000;
  KSPROPERTY_TYPE_HIGHPRIORITY   = $08000000;
  KSPROPERTY_TYPE_FSFILTERSCOPE  = $40000000;
  KSPROPERTY_TYPE_COPYPAYLOAD    = $80000000;

type

  PKSP_NODE = ^KSP_NODE;
  KSP_NODE = record
    Property_ : KSPROPERTY;
    NodeId    : ULONG;
    Reserved  : ULONG;
  end;

  PKSM_NODE = ^KSM_NODE;
  KSM_NODE = record
    Method   : KSMETHOD;
    NodeId   : ULONG;
    Reserved : ULONG;
  end;

  PKSE_NODE = ^KSE_NODE;
  KSE_NODE = record
    Event    : KSEVENT;
    NodeId   : ULONG;
    Reserved : ULONG;
  end;

const

  KSPROPTYPESETID_General    : TGUID = '{97E99BA0-BDEA-11CF-A5D6-28DB04C10000}';

{$IFNDEF NTDDK_VARENUM}
type
  VARTYPE = Word;
  VARENUM = VARTYPE;
const
    VT_EMPTY = 0;                // The type of the contained field is undefined. When this flag is specified; the PROPVARIANT MUST NOT contain a data field.
    VT_NULL = 1;                 // Nil.
    VT_I2 = 2;                   // A 2-byte integer.
    VT_I4 = 3;                   // A 4-byte integer.
    VT_R4 = 4;                   // A 4-byte real.
    VT_R8 = 5;                   // An 8-byte real.
    VT_CY = 6;                   // Currency.
    VT_DATE = 7;                 // A date.
    VT_BSTR = 8;                 // A string.
    VT_DISPATCH = 9;             // An IDispatch pointer.
    VT_ERROR = 10;               // An SCODE value.
    VT_BOOL = 11;                // A Boolean value. True is -1 and False is 0.
    VT_VARIANT = 12;             // A variant pointer.
    VT_UNKNOWN = 13;             // An IUnknown pointer.
    VT_DECIMAL = 14;             // A 16-byte fixed-pointer value.
    VT_I1 = 16;                  // A character.
    VT_UI1 = 17;                 // An unsigned character.
    VT_UI2 = 18;                 // An unsigned short.
    VT_UI4 = 19;                 // An unsigned long.
    VT_I8 = 20;                  // A 64-bit integer.
    VT_UI8 = 21;                 // A 64-bit unsigned integer.
    VT_INT = 22;                 // An integer.
    VT_UINT = 23;                // An unsigned integer.
    VT_VOID = 24;                // A C-style void.
    VT_HRESULT  = 25;            // An HRESULT value.
    VT_PTR = 26;                 // A pointer type.
    VT_SAFEARRAY = 27;           // A safe array. Use VT_ARRAY in VARIANT.
    VT_CARRAY = 28;              // A C-style array.
    VT_USERDEFINED = 29;         // A user-defined type.
    VT_LPSTR = 30;               // A null-terminated string.
    VT_LPWSTR = 31;              // A wide null-terminated string.
    VT_RECORD = 36;              // A user-defined type.
    VT_INT_PTR = 37;             // A signed machine register size width.
    VT_UINT_PTR = 38;            // An unsigned machine register size width.
    VT_FILETIME = 64;            // A FILETIME value.
    VT_BLOB = 65;                // Length-prefixed bytes.
    VT_STREAM = 66;              // The name of the stream follows.
    VT_STORAGE = 67;             // The name of the storage follows.
    VT_STREAMED_OBJECT = 68;     // The stream contains an object.
    VT_STORED_OBJECT = 69;       // The storage contains an object.
    VT_BLOB_OBJECT = 70;         // The blob contains an object.
    VT_CF = 71;                  // A clipboard format.
    VT_CLSID = 72;               // A class ID.
    VT_VERSIONED_STREAM  = 73;   // A stream with a GUID version.
    VT_VECTOR = $1000;           // A simple counted array. The type of the contained field MUST be combined with other values by using the bitwise OR operation to indicate a counted field. The type of the contained field MUST be a COUNTEDARRAY.
    VT_ARRAY = $2000;            // A SAFEARRAY pointer.
    VT_BYREF = $4000;            // A void pointer for local use.
    VT_RESERVED = $8000;         // Reserved.
    VT_BSTR_BLOB = $fff;         // Reserved (is reserved for system use.)
    VT_ILLEGAL = $ffff;          //
    VT_ILLEGALMASKED = $fff;     //
    VT_TYPEMASK = $fff;          //

 // For detailed information see:
 //   https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-mqmq/876f9674-752a-4d9b-bf8b-7212c6c9a6b4
 // Note: This enum is also declared in wtypes.h (WinApi.WinApiTypes.pas)
{$DEFINE NTDDK_VARENUM}
{$ENDIF}

type
  PKSMULTIPLE_ITEM = ^KSMULTIPLE_ITEM;
  KSMULTIPLE_ITEM = record
    Size  : ULONG;
    Count : ULONG;
  end;

  PKSPROPERTY_DESCRIPTION = ^KSPROPERTY_DESCRIPTION;
  KSPROPERTY_DESCRIPTION = record
    AccessFlags      : ULONG;
    DescriptionSize  : ULONG;
    PropTypeSet      : KSIDENTIFIER;
    MembersListCount : ULONG;
    Reserved         : ULONG;
  end;


const

  KSPROPERTY_MEMBER_RANGES        = $00000001;
  KSPROPERTY_MEMBER_STEPPEDRANGES = $00000002;
  KSPROPERTY_MEMBER_VALUES        = $00000003;

  KSPROPERTY_MEMBER_FLAG_DEFAULT                   = $00000001;
  KSPROPERTY_MEMBER_FLAG_BASICSUPPORT_MULTICHANNEL = $00000002;
  KSPROPERTY_MEMBER_FLAG_BASICSUPPORT_UNIFORM      = $00000004;

type

  PKSPROPERTY_MEMBERSHEADER = ^KSPROPERTY_MEMBERSHEADER;
  KSPROPERTY_MEMBERSHEADER = record
    MembersFlags : ULONG;
    MembersSize  : ULONG;
    MembersCount : ULONG;
    Flags        : ULONG;
  end;

//------------------------------------------------------------------------------
// #if defined( _KS_NO_ANONYMOUS_STRUCTURES_ ) >> No actual need within Delphi
// however, you could change the case statement (0 or 1)  by decommenting the
// _KS_NO_ANONYMOUS_STRUCTURES_ constant (declared at top of this unit)

  PKSPROPERTY_BOUNDS_LONG = ^KSPROPERTY_BOUNDS_LONG;
  KSPROPERTY_BOUNDS_LONG = record
    case Integer of
      0: (SignedMinimum   : LONG;
          SignedMaximum   : LONG);
      1: (UnsignedMinimum : ULONG;
          UnsignedMaximum : ULONG);
  end;

  PKSPROPERTY_BOUNDS_LONGLONG = ^KSPROPERTY_BOUNDS_LONGLONG;
  KSPROPERTY_BOUNDS_LONGLONG = record
    case integer of
      0: (SignedMinimum   : LONGLONG;
          SignedMaximum   : LONGLONG);
      1: (UnsignedMinimum : ULONGLONG;
          UnsignedMaximum : ULONGLONG);
  end;

//------------------------------------------------------------------------------

  PKSPROPERTY_STEPPING_LONG = ^KSPROPERTY_STEPPING_LONG;
  KSPROPERTY_STEPPING_LONG = record
    SteppingDelta : ULONG;
    Reserved      : ULONG;
    Bounds        : KSPROPERTY_BOUNDS_LONG;
  end;

  PKSPROPERTY_STEPPING_LONGLONG = ^KSPROPERTY_STEPPING_LONGLONG;
  KSPROPERTY_STEPPING_LONGLONG = record
    SteppingDelta : TULargeInteger;
    Bounds        : PKSPROPERTY_BOUNDS_LONGLONG;
  end;

//===========================================================================


  PKSWORKER = pointer;


 // KSEVENTDATA //////////////////////////

  PKSEventHandle = ^_EventHandle;
  _EventHandle = record
    Event: THandle;
    Reserved: array[0..1] of ULONG_PTR;
  end;
  TKSEventHandle = _EventHandle;

  PKSSemaphoreHandle = ^_SemaphoreHandle;
  _SemaphoreHandle = record
    Semaphore : THandle;
    Reserved : ULONG;
    Adjustment : LONG;
  end;
  TKSSemaphoreHandle = _SemaphoreHandle;

  PKSAlignment = ^_Alignment;
  _Alignment = record
    Unused : Pointer;
    Alignment : array[0..1] of LONG_PTR;
  end;
  TKSAlignment = _Alignment;

  PKSEVENTDATA = ^KSEVENTDATA;
  KSEVENTDATA = record
    NotificationType : ULONG;
    case integer of
      0: (EventHandle : _EventHandle);
      1: (SemaphoreHandle : _SemaphoreHandle);
      2: (Alignment: _Alignment);
  end;

  //////////////////////////////////////////

const

  KSEVENTF_EVENT_HANDLE       = $00000001;
  KSEVENTF_SEMAPHORE_HANDLE   = $00000002;
  KSEVENTF_EVENT_OBJECT       = $00000004;
  KSEVENTF_SEMAPHORE_OBJECT   = $00000008;
  KSEVENTF_DPC                = $00000010;
  KSEVENTF_WORKITEM           = $00000020;
  KSEVENTF_KSWORKITEM         = $00000080;

  KSEVENT_TYPE_ENABLE         = $00000001;
  KSEVENT_TYPE_ONESHOT        = $00000002;
  KSEVENT_TYPE_ENABLEBUFFERED = $00000004;
  KSEVENT_TYPE_SETSUPPORT     = $00000100;
  KSEVENT_TYPE_BASICSUPPORT   = $00000200;
  KSEVENT_TYPE_QUERYBUFFER    = $00000400;

  KSEVENT_TYPE_TOPOLOGY       = $10000000;


type

  PKSQUERYBUFFER = ^KSQUERYBUFFER;
  KSQUERYBUFFER = record
    Event     : KSEVENT;
    EventData : PKSEVENTDATA;
    Reserved  : Pointer;
  end;

  PKSRELATIVEEVENT = ^KSRELATIVEEVENT;
  KSRELATIVEEVENT = record
     Size  : ULONG;
     Flags : ULONG;
     case integer of
       0: (ObjectHandle  : THandle;
           Reserved      : Pointer;
           Event         : KSEVENT;
           EventData     : KSEVENTDATA);
       1: (ObjectPointer : Pointer);
  end;


const

  KSRELATIVEEVENT_FLAG_HANDLE  = $00000001;
  KSRELATIVEEVENT_FLAG_POINTER = $00000002;

//===========================================================================

type

  PKSEVENT_TIME_MARK = ^KSEVENT_TIME_MARK;
  KSEVENT_TIME_MARK = record
    EventData : KSEVENTDATA;
    MarkTime  : LONGLONG;
  end;

  PKSEVENT_TIME_INTERVAL = ^KSEVENT_TIME_INTERVAL;
  KSEVENT_TIME_INTERVAL = record
    EventData : KSEVENTDATA;
    TimeBase  : LONGLONG;
    Interval  : LONGLONG;
  end;

  PKSINTERVAL = ^KSINTERVAL;
  KSINTERVAL = record
    TimeBase : LONGLONG;
    Interval : LONGLONG;
  end;

//===========================================================================

const

  KSPROPSETID_General     : TGUID = '{1464EDA5-6A8F-11D1-9AA7-00A0C9223196}';


type

  PKSPROPERTY_GENERAL = ^KSPROPERTY_GENERAL;
  KSPROPERTY_GENERAL = (
    KSPROPERTY_GENERAL_COMPONENTID = 0
  );

  PKSCOMPONENTID = ^KSCOMPONENTID;
  KSCOMPONENTID = record
    Manufacturer : TGUID;
    Product      : TGUID;
    Component    : TGUID;
    Name         : TGUID;
    Version      : ULONG;
    Revision     : ULONG;
  end;


const

  KSMETHODSETID_StreamIo  : TGUID = '{65D003CA-1523-11D2-B27A-00A0C9223196}';


type

  PKSMETHOD_STREAMIO = ^KSMETHOD_STREAMIO;
  KSMETHOD_STREAMIO = (
    KSMETHOD_STREAMIO_READ = 0,
    KSMETHOD_STREAMIO_WRITE = 1
  );


const

  KSPROPSETID_MediaSeeking : TGUID = '{EE904F0C-D09B-11D0-ABE9-00A0C9223196}';


type

  PKSPROPERTY_MEDIASEEKING = ^KSPROPERTY_MEDIASEEKING;
  KSPROPERTY_MEDIASEEKING = (
    KSPROPERTY_MEDIASEEKING_CAPABILITIES = 0,
    KSPROPERTY_MEDIASEEKING_FORMATS = 1,
    KSPROPERTY_MEDIASEEKING_TIMEFORMAT = 2,
    KSPROPERTY_MEDIASEEKING_POSITION = 3,
    KSPROPERTY_MEDIASEEKING_STOPPOSITION = 4,
    KSPROPERTY_MEDIASEEKING_POSITIONS = 5,
    KSPROPERTY_MEDIASEEKING_DURATION = 6,
    KSPROPERTY_MEDIASEEKING_AVAILABLE = 7,
    KSPROPERTY_MEDIASEEKING_PREROLL = 8,
    KSPROPERTY_MEDIASEEKING_CONVERTTIMEFORMAT = 9
  );

  PKS_SEEKING_FLAGS = ^KS_SEEKING_FLAGS;
  KS_SEEKING_FLAGS = LongInt;

  PKS_SEEKING_CAPABILITIES = ^KS_SEEKING_CAPABILITIES;
  KS_SEEKING_CAPABILITIES       = (
    KS_SEEKING_CanSeekAbsolute  = $1,
    KS_SEEKING_CanSeekForwards  = $2,
    KS_SEEKING_CanSeekBackwards = $4,
    KS_SEEKING_CanGetCurrentPos = $8,
    KS_SEEKING_CanGetStopPos    = $10,
    KS_SEEKING_CanGetDuration   = $20,
    KS_SEEKING_CanPlayBackwards = $40
  );


type

  PKSPROPERTY_POSITIONS = ^KSPROPERTY_POSITIONS;
  KSPROPERTY_POSITIONS = record
    Current      : LONGLONG;
    Stop         : LONGLONG;
    CurrentFlags : KS_SEEKING_FLAGS;
    StopFlags    : KS_SEEKING_FLAGS;
  end;

  PKSPROPERTY_MEDIAAVAILABLE = ^KSPROPERTY_MEDIAAVAILABLE;
  KSPROPERTY_MEDIAAVAILABLE = record
    Earliest : LONGLONG;
    Latest   : LONGLONG;
  end;

  PKSP_TIMEFORMAT = ^KSP_TIMEFORMAT;
  KSP_TIMEFORMAT = record
    Property_    : KSPROPERTY;
    SourceFormat : TGUID;
    TargetFormat : TGUID;
    Time         : LONGLONG;
  end;



//===========================================================================

const

  KSPROPSETID_Topology : TGUID = '{720D4AC0-7533-11D0-A5D6-28DB04C10000}';


type

  PKSPROPERTY_TOPOLOGY = ^KSPROPERTY_TOPOLOGY;
  KSPROPERTY_TOPOLOGY = (
    KSPROPERTY_TOPOLOGY_CATEGORIES  = 0,
    KSPROPERTY_TOPOLOGY_NODES       = 1,
    KSPROPERTY_TOPOLOGY_CONNECTIONS = 2,
    KSPROPERTY_TOPOLOGY_NAME        = 3
  );




//=============================================================================

//
// properties used by graph manager to talk to particular filters
//


const
  KSPROPSETID_GM : TGUID = '{AF627536-E719-11D2-8A1D-006097D2DF5D}';


type

//
// Commands
//

  PKSPROPERTY_GM = ^KSPROPERTY_GM;
  KSPROPERTY_GM = (
    KSPROPERTY_GM_GRAPHMANAGER    = 0,
    KSPROPERTY_GM_TIMESTAMP_CLOCK = 1,
    KSPROPERTY_GM_RATEMATCH       = 2,
    KSPROPERTY_GM_RENDER_CLOCK    = 3
  );


const

  KSCATEGORY_BRIDGE                  : TGUID = '{085AFF00-62CE-11CF-A5D6-28DB04C10000}';
  KSCATEGORY_CAPTURE                 : TGUID = '{65E8773D-8F56-11D0-A3B9-00A0C9223196}';

  KSCATEGORY_VIDEO_CAMERA            : TGUID = '{E5323777-F976-4f5b-9B55-B94699C46E44}';
  KSCATEGORY_SENSOR_CAMERA           : TGUID = '{24E552D7-6523-47F7-A647-D3465BF1F5CA}';
  KSCATEGORY_NETWORK_CAMERA          : TGUID = '{B8238652-B500-41EB-B4F3-4234F7F5AE99}';

  KSCATEGORY_SENSOR_GROUP            : TGUID = '{669C7214-0A88-4311-A7F3-4E79820E33BD}';

  KSCATEGORY_RENDER                  : TGUID = '{65E8773E-8F56-11D0-A3B9-00A0C9223196}';
  KSCATEGORY_MIXER                   : TGUID = '{AD809C00-7B88-11D0-A5D6-28DB04C10000}';
  KSCATEGORY_SPLITTER                : TGUID = '{0A4252A0-7E70-11D0-A5D6-28DB04C10000}';
  KSCATEGORY_DATACOMPRESSOR          : TGUID = '{1E84C900-7E70-11D0-A5D6-28DB04C10000}';
  KSCATEGORY_DATADECOMPRESSOR        : TGUID = '{2721AE20-7E70-11D0-A5D6-28DB04C10000}';
  KSCATEGORY_DATATRANSFORM           : TGUID = '{2EB07EA0-7E70-11D0-A5D6-28DB04C10000}';


//
// KSMFT_CATEGORY_XXX are MF Transform category guids redefined in ks.h
// to facilitate KS Mini drivers to register KS Filters under MF Transform categories.
//

  KSMFT_CATEGORY_VIDEO_DECODER      :	TGUID = '{d6c02d4b-6833-45b4-971a-05a4b04bab91}';
  KSMFT_CATEGORY_VIDEO_ENCODER      :	TGUID = '{f79eac7d-e545-4387-bdee-d647d7bde42a}';
  KSMFT_CATEGORY_VIDEO_EFFECT       :	TGUID = '{12e17c21-532c-4a6e-8a1c-40825a736397}';
  KSMFT_CATEGORY_MULTIPLEXER        :	TGUID = '{059c561e-05ae-4b61-b69d-55b61ee54a7b}';
  KSMFT_CATEGORY_DEMULTIPLEXER      :	TGUID = '{a8700a7a-939b-44c5-99d7-76226b23b3f1}';
  KSMFT_CATEGORY_AUDIO_DECODER      :	TGUID = '{9ea73fb4-ef7a-4559-8d5d-719d8f0426c7}';
  KSMFT_CATEGORY_AUDIO_ENCODER      :	TGUID = '{91c64bd0-f91e-4d8c-9276-db248279d975}';
  KSMFT_CATEGORY_AUDIO_EFFECT       :	TGUID = '{11064c48-3648-4ed0-932e-05ce8ac811b7}';
  KSMFT_CATEGORY_VIDEO_PROCESSOR    :	TGUID = '{302ea3fc-aa5f-47f9-9f7a-c2188bb16320}';
  KSMFT_CATEGORY_OTHER              :	TGUID = '{90175d57-b7ea-4901-aeb3-933a8747756f}';

  KSCATEGORY_COMMUNICATIONSTRANSFORM : TGUID = '{CF1DDA2C-9743-11D0-A3EE-00A0C9223196}';
  KSCATEGORY_INTERFACETRANSFORM      : TGUID = '{CF1DDA2D-9743-11D0-A3EE-00A0C9223196}';
  KSCATEGORY_MEDIUMTRANSFORM         : TGUID = '{CF1DDA2E-9743-11D0-A3EE-00A0C9223196}';
  KSCATEGORY_FILESYSTEM              : TGUID = '{760FED5E-9357-11D0-A3CC-00A0C9223196}';


// KSNAME_Clock

  KSCATEGORY_CLOCK   : TGUID = '{53172480-4791-11D0-A5D6-28DB04C10000}';
  KSCATEGORY_PROXY   : TGUID = '{97EBAACA-95BD-11D0-A3EA-00A0C9223196}';
  KSCATEGORY_QUALITY : TGUID = '{97EBAACB-95BD-11D0-A3EA-00A0C9223196}';


type

  PKSTOPOLOGY_CONNECTION = ^KSTOPOLOGY_CONNECTION;
  KSTOPOLOGY_CONNECTION = record
    FromNode    : ULONG;
    FromNodePin : ULONG;
    ToNode      : ULONG;
    ToNodePin   : ULONG;
  end;

  PKSTOPOLOGY = ^KSTOPOLOGY;
  KSTOPOLOGY = record
    CategoriesCount          : ULONG;
    Categories               : PGUID;
    TopologyNodesCount       : ULONG;
    TopologyNodes            : PGUID;
    TopologyConnectionsCount : ULONG;
    TopologyConnections      : PKSTOPOLOGY_CONNECTION;
    TopologyNodesNames       : PGUID;
    Reserved                 : ULONG;
  end;


const

  KSFILTER_NODE = ULONG(-1);
  KSALL_NODES   = ULONG(-1);


type

  PKSNODE_CREATE = ^KSNODE_CREATE;
  KSNODE_CREATE = record
    CreateFlags : ULONG;
    Node        : ULONG;
  end;

//===========================================================================


const

// TIME_FORMAT_NONE  (= GUID_NULL)  '{}';
  KSTIME_FORMAT_NONE       : TGUID = '{00000000-0000-0000-0000-000000000000}';
// TIME_FORMAT_FRAME
  KSTIME_FORMAT_FRAME      : TGUID = '{7b785570-8c82-11cf-bc0c-00aa00ac74f6}';
// TIME_FORMAT_BYTE
  KSTIME_FORMAT_BYTE        :	TGUID = '{7b785571-8c82-11cf-bc0c-00aa00ac74f6}';
// TIME_FORMAT_SAMPLE
  KSTIME_FORMAT_SAMPLE      :	TGUID = '{7b785572-8c82-11cf-bc0c-00aa00ac74f6}';
// TIME_FORMAT_FIELD
  KSTIME_FORMAT_FIELD       :	TGUID = '{7b785573-8c82-11cf-bc0c-00aa00ac74f6}';
// TIME_FORMAT_MEDIA_TIME
  KSTIME_FORMAT_MEDIA_TIME  :	TGUID = '{7b785574-8c82-11cf-bc0c-00aa00ac74f6}';

//===========================================================================

type

  PKSPIN_INTERFACE = ^KSPIN_INTERFACE;
  KSPIN_INTERFACE = KSIDENTIFIER;


const

  KSINTERFACESETID_Standard :	TGUID = '{1A8766A0-62CE-11CF-A5D6-28DB04C10000}';


type

  PKSINTERFACE_STANDARD = ^KSINTERFACE_STANDARD;
  KSINTERFACE_STANDARD = (
    KSINTERFACE_STANDARD_STREAMING        = 0,
    KSINTERFACE_STANDARD_LOOPED_STREAMING = 1,
    KSINTERFACE_STANDARD_CONTROL          = 2  // Reserved for system use
  );
  TKSInterfaceStandard = KSINTERFACE_STANDARD;

const

  KSINTERFACESETID_FileIo :	TGUID = '{8C6F932C-E771-11D0-B8FF-00A0C9223196}';


type
  PKSINTERFACE_FILEIO = ^KSINTERFACE_FILEIO;
  KSINTERFACE_FILEIO = (KSINTERFACE_FILEIO_STREAMING);

//===========================================================================

const


  KSMEDIUM_TYPE_ANYINSTANCE = 0;


  KSMEDIUMSETID_Standard  :	TGUID = '{4747B320-62CE-11CF-A5D6-28DB04C10000}';


  // For compatibility only
  KSMEDIUM_STANDARD_DEVIO = KSMEDIUM_TYPE_ANYINSTANCE;

//===========================================================================

  KSPROPSETID_Pin  :	TGUID = '{8C134960-51AD-11CF-878A-94F801C10000}';


type
  PKSPROPERTY_PIN = ^KSPROPERTY_PIN;
  KSPROPERTY_PIN = (
    KSPROPERTY_PIN_CINSTANCES            = 0,
    KSPROPERTY_PIN_CTYPES                = 1,
    KSPROPERTY_PIN_DATAFLOW              = 2,
    KSPROPERTY_PIN_DATARANGES            = 3,
    KSPROPERTY_PIN_DATAINTERSECTION      = 4,
    KSPROPERTY_PIN_INTERFACES            = 5,
    KSPROPERTY_PIN_MEDIUMS               = 6,
    KSPROPERTY_PIN_COMMUNICATION         = 7,
    KSPROPERTY_PIN_GLOBALCINSTANCES      = 8,
    KSPROPERTY_PIN_NECESSARYINSTANCES    = 9,
    KSPROPERTY_PIN_PHYSICALCONNECTION    = 10,
    KSPROPERTY_PIN_CATEGORY              = 11,
    KSPROPERTY_PIN_NAME                  = 12,
    KSPROPERTY_PIN_CONSTRAINEDDATARANGES = 13,
    KSPROPERTY_PIN_PROPOSEDATAFORMAT     = 14,
    KSPROPERTY_PIN_PROPOSEDATAFORMAT2    = 15,
    KSPROPERTY_PIN_MODEDATAFORMATS       = 16
  );


const

  KSPROPERTY_PIN_FLAGS_ATTRIBUTE_RANGE_AWARE = $00000001;
  KSPROPERTY_PIN_FLAGS_MASK = $00000001;  // = KSPROPERTY_PIN_FLAGS_ATTRIBUTE_RANGE_AWARE

type

  PKSP_PIN = ^KSP_PIN;
  KSP_PIN = record
    Property_: KSPROPERTY;
    PinId: ULONG;
    case integer of
      0: (Reserved: ULONG);
      1: (Flags: ULONG);
  end;

  PKSE_PIN = ^KSE_PIN;
  KSE_PIN = record
    Event: KSEVENT;
    PinId: ULONG;
    Reserved: ULONG;
  end;

const

  KSINSTANCE_INDETERMINATE = ULONG(-1);


type

  PKSPIN_CINSTANCES = ^KSPIN_CINSTANCES;
  KSPIN_CINSTANCES = record
    PossibleCount : ULONG;
    CurrentCount  : ULONG;
  end;

  PKSPIN_DATAFLOW = ^KSPIN_DATAFLOW;
  KSPIN_DATAFLOW = (
    KSPIN_DATAFLOW_Invalid = 0,
    KSPIN_DATAFLOW_IN      = 1,
    KSPIN_DATAFLOW_OUT     = 2
  );

const

  KSDATAFORMAT_BIT_TEMPORAL_COMPRESSION =  0;
  KSDATAFORMAT_TEMPORAL_COMPRESSION     =  (1 shl KSDATAFORMAT_BIT_TEMPORAL_COMPRESSION);
  KSDATAFORMAT_BIT_ATTRIBUTES           =  1;
  KSDATAFORMAT_ATTRIBUTES               =  (1 shl KSDATAFORMAT_BIT_ATTRIBUTES);

  KSDATARANGE_BIT_ATTRIBUTES            = 1;
  KSDATARANGE_ATTRIBUTES                = (1 shl KSDATARANGE_BIT_ATTRIBUTES);
  KSDATARANGE_BIT_REQUIRED_ATTRIBUTES   = 2;
  KSDATARANGE_REQUIRED_ATTRIBUTES       = (1 shl KSDATARANGE_BIT_REQUIRED_ATTRIBUTES);


type

  PKSDATAFORMAT = ^KSDATAFORMAT;
  PKSDATARANGE = ^KSDATARANGE;
  KSDATAFORMAT = record
    case integer of
    0: (FormatSize  : ULONG;
        Flags       : ULONG;
        SampleSize  : ULONG;
        Reserved    : ULONG;
        MajorFormat : TGUID;
        SubFormat   : TGUID;
        Specifier   : TGUID);
    1: (Alignment   : Int64);
  end;
  KSDATARANGE = KSDATAFORMAT;

const

  KSATTRIBUTE_REQUIRED = $00000001;


type

  PKSATTRIBUTE = ^KSATTRIBUTE;
  KSATTRIBUTE = record
    Size      : ULONG;
    Flags     : ULONG;
    Attribute : TGUID;
  end;


  PKSPIN_COMMUNICATION = ^KSPIN_COMMUNICATION;
  KSPIN_COMMUNICATION = (
    KSPIN_COMMUNICATION_NONE,
    KSPIN_COMMUNICATION_SINK,
    KSPIN_COMMUNICATION_SOURCE,
    KSPIN_COMMUNICATION_BOTH,
    KSPIN_COMMUNICATION_BRIDGE);


  PKSPIN_MEDIUM = ^KSPIN_MEDIUM;
  KSPIN_MEDIUM = KSIDENTIFIER;


  PKSPIN_CONNECT = ^KSPIN_CONNECT;
  KSPIN_CONNECT = record
    Interface_  : KSPIN_INTERFACE;
    Medium      : KSPIN_MEDIUM;
    PinId       : ULONG;
    PinToHandle : THandle;
    Priority    : KSPRIORITY;
  end;


  PKSPIN_PHYSICALCONNECTION = ^KSPIN_PHYSICALCONNECTION;
  KSPIN_PHYSICALCONNECTION = record
    Size             : ULONG;
    Pin              : ULONG;
    SymbolicLinkName : array of WCHAR;
  end;


const

  KSEVENTSETID_PinCapsChange :	TGUID = '{DD4F192E-3B78-49AD-A534-2C315B822000}';

type

  PKSEVENT_PINCAPS_CHANGENOTIFICATIONS = ^KSEVENT_PINCAPS_CHANGENOTIFICATIONS;
  KSEVENT_PINCAPS_CHANGENOTIFICATIONS = (
    KSEVENT_PINCAPS_FORMATCHANGE,
    KSEVENT_PINCAPS_JACKINFOCHANGE,
    { 10.0.28000.0  }
    KSEVENT_PINCAPS_INVALIDATECLIENTS);

const

  KSEVENTSETID_VolumeLimit :	TGUID = '{DA168465-3A7C-4858-9D4A-3E8E24701AEF}';

type

  PKSEVENT_VOLUMELIMIT = ^KSEVENT_VOLUMELIMIT;
  KSEVENT_VOLUMELIMIT = (KSEVENT_VOLUMELIMIT_CHANGED);


const
  KSNAME_Filter       : TGUID = '{9b365890-165f-11d0-a195-0020afd156e4}';
  KSSTRING_Filter             = '{9B365890-165F-11D0-A195-0020AFD156E4}';

  KSNAME_Pin          : TGUID = '{146F1A80-4791-11D0-A5D6-28DB04C10000}';
  KSSTRING_Pin                = '{146F1A80-4791-11D0-A5D6-28DB04C10000}';

  KSNAME_Clock        : TGUID = '{53172480-4791-11D0-A5D6-28DB04C10000}';
  KSSTRING_Clock              = '{53172480-4791-11D0-A5D6-28DB04C10000}';

  KSNAME_Allocator    : TGUID = '{642F5D00-4791-11D0-A5D6-28DB04C10000}';
  KSSTRING_Allocator          = '{642F5D00-4791-11D0-A5D6-28DB04C10000}';
  KSSTRING_AllocatorEx        = '{091BB63B-603F-11D1-B067-00A0C9062802}';


  KSNAME_TopologyNode : TGUID = '{0621061A-EE75-11D0-B915-00A0C9223196}';
  KSSTRING_TopologyNode       = '{0621061A-EE75-11D0-B915-00A0C9223196}';


const

  // MEDIATYPE_NULL (= GUID_NULL)
  KSDATAFORMAT_TYPE_WILDCARD       : TGUID = '{00000000-0000-0000-0000-000000000000}';
  // MEDIASUBTYPE_NULL (= GUID_NULL)
  KSDATAFORMAT_SUBTYPE_WILDCARD    : TGUID = '{00000000-0000-0000-0000-000000000000}';


  // MEDIATYPE_Stream
  KSDATAFORMAT_TYPE_STREAM         : TGUID = '{E436EB83-524F-11CE-9F53-0020AF0BA770}';
  // MEDIASUBTYPE_None
  KSDATAFORMAT_SUBTYPE_NONE        : TGUID = '{E436EB8E-524F-11CE-9F53-0020AF0BA770}';

  // (= GUID_NULL)
  KSDATAFORMAT_SPECIFIER_WILDCARD   : TGUID = '{00000000-0000-0000-0000-000000000000}';
  KSDATAFORMAT_SPECIFIER_FILENAME   : TGUID = '{AA797B40-E974-11CF-A5D6-28DB04C10000}';
  KSDATAFORMAT_SPECIFIER_FILEHANDLE : TGUID = '{65E8773C-8F56-11D0-A3B9-00A0C9223196}';


  // FORMAT_None
  KSDATAFORMAT_SPECIFIER_NONE : TGUID = '{0F6417D6-C318-11D0-A43F-00A0C9223196}';

  //===========================================================================

  KSPROPSETID_Quality : TGUID = '{D16AD380-AC1A-11CF-A5D6-28DB04C10000}';


type

  PKSPROPERTY_QUALITY = ^KSPROPERTY_QUALITY;
  KSPROPERTY_QUALITY = (
    KSPROPERTY_QUALITY_REPORT,
    KSPROPERTY_QUALITY_ERROR);

//===========================================================================

const

  KSPROPSETID_Connection :	TGUID = '{1D58C920-AC9B-11CF-A5D6-28DB04C10000}';

type

  PKSPROPERTY_CONNECTION = ^KSPROPERTY_CONNECTION;
  KSPROPERTY_CONNECTION = (
    KSPROPERTY_CONNECTION_STATE = 0,
    KSPROPERTY_CONNECTION_PRIORITY,
    KSPROPERTY_CONNECTION_DATAFORMAT,
    KSPROPERTY_CONNECTION_ALLOCATORFRAMING,
    KSPROPERTY_CONNECTION_PROPOSEDATAFORMAT,
    KSPROPERTY_CONNECTION_ACQUIREORDERING,
    KSPROPERTY_CONNECTION_ALLOCATORFRAMING_EX,
    KSPROPERTY_CONNECTION_STARTAT);

//===========================================================================
//VRAM transport related propset
//===========================================================================
const

  KSPROPSETID_MemoryTransport :	TGUID = '{0A3D1C5D-5243-4819-9ED0-AEE8044CEE2B}';

  // a value of zero is ignored
  KSPROPERTY_MEMORY_TRANSPORT = 1; //Sets pin's memory transport mechanism e.g. VRAM or SYSMEM


//===========================================================================
  //
  // pins flags
  //
const
  KSALLOCATOR_REQUIREMENTF_INPLACE_MODIFIER  = $00000001;
  KSALLOCATOR_REQUIREMENTF_SYSTEM_MEMORY     = $00000002;
  KSALLOCATOR_REQUIREMENTF_FRAME_INTEGRITY   = $00000004;
  KSALLOCATOR_REQUIREMENTF_MUST_ALLOCATE     = $00000008;
  KSALLOCATOR_REQUIREMENTF_SYSTEM_MEMORY_CUSTOM_ALLOCATION = $00000010;
  KSALLOCATOR_REQUIREMENTF_PREFERENCES_ONLY  = $80000000;

  KSALLOCATOR_OPTIONF_COMPATIBLE             = $00000001;
  KSALLOCATOR_OPTIONF_SYSTEM_MEMORY          = $00000002;
  KSALLOCATOR_OPTIONF_VALID                  = $00000003;
  //
  // pins extended framing flags
  //
  KSALLOCATOR_FLAG_PARTIAL_READ_SUPPORT      = $00000010;
  KSALLOCATOR_FLAG_DEVICE_SPECIFIC           = $00000020;
  KSALLOCATOR_FLAG_CAN_ALLOCATE              = $00000040;
  KSALLOCATOR_FLAG_INSIST_ON_FRAMESIZE_RATIO = $00000080;
  //
  // allocator pipes flags
  //
  // there is at least one data modification in a pipe
  KSALLOCATOR_FLAG_NO_FRAME_INTEGRITY        = $00000100;
  KSALLOCATOR_FLAG_MULTIPLE_OUTPUT           = $00000200;
  KSALLOCATOR_FLAG_CYCLE                     = $00000400;
  KSALLOCATOR_FLAG_ALLOCATOR_EXISTS          = $00000800;
  // there is no framing dependency between neighbouring pipes.
  KSALLOCATOR_FLAG_INDEPENDENT_RANGES        = $00001000;
  KSALLOCATOR_FLAG_ATTENTION_STEPPING        = $00002000;


  KSALLOCATOR_FLAG_ENABLE_CACHED_MDL         = $00004000;
  KSALLOCATOR_FLAG_2D_BUFFER_REQUIRED        = $00008000;


  //
  // old Framing structure
  //
type

  PKSALLOCATOR_FRAMING = ^KSALLOCATOR_FRAMING;
  KSALLOCATOR_FRAMING = record
  case integer of
  0: (OptionsFlags : ULONG);       // allocator options (create)
  1: (RequirementsFlags : ULONG;   // allocation requirements (query)
      PoolType      : ULONG;
      Frames        : ULONG;       // total number of allowable outstanding frames
      FrameSize     : ULONG;       // total size of frame
      FileAlignment : ULONG;
      FramePitch    : LONG;        // When KSALLOCATOR_FLAG_2D_BUFFER_REQUIRED is set this field specifies the required 2d pitch for the buffer i.e. the width + stride
      Reserved      : ULONG);
  end;


  //
  // new Framing structure, eventually will replace KSALLOCATOR_FRAMING.
  //
  PKS_FRAMING_RANGE = ^KS_FRAMING_RANGE;
  KS_FRAMING_RANGE = record
    MinFrameSize : ULONG;
    MaxFrameSize : ULONG;
    Stepping     : ULONG;
  end;

  PKS_FRAMING_RANGE_WEIGHTED = ^KS_FRAMING_RANGE_WEIGHTED;
  KS_FRAMING_RANGE_WEIGHTED = record
    Range            : KS_FRAMING_RANGE;
    InPlaceWeight    : ULONG;
    NotInPlaceWeight : ULONG;
  end;

  PKS_COMPRESSION = ^KS_COMPRESSION;
  KS_COMPRESSION = record
    RatioNumerator      : ULONG;      // compression/expansion ratio
    RatioDenominator    : ULONG;
    RatioConstantMargin : ULONG;
  end;

  //
  // Memory Types and Buses are repeated in each entry.
  // Easiest to use but takes a little more memory than the varsize layout Pin\Memories\Buses\Ranges.
  //
  PKS_FRAMING_ITEM = ^KS_FRAMING_ITEM;
  KS_FRAMING_ITEM = record
    MemoryType: TGUID;
    BusType: TGUID;
    MemoryFlags: ULONG;
    BusFlags: ULONG;
    Flags: ULONG;
    Frames: ULONG;
    case Integer of
      0: (FileAlignment: ULONG;
          MemoryTypeWeight: ULONG;
          PhysicalRange: KS_FRAMING_RANGE;
          FramingRange: KS_FRAMING_RANGE_WEIGHTED);
      1: (FramePitch: LONG);
  end;

  PKSALLOCATOR_FRAMING_EX = ^KSALLOCATOR_FRAMING_EX;
  KSALLOCATOR_FRAMING_EX = record
    CountItems        : ULONG;         // count of FramingItem-s below.
    PinFlags          : ULONG;
    OutputCompression : KS_COMPRESSION;
    PinWeight         : ULONG;          // this pin framing's Weight graph-wide
    FramingItem       : array[0..0] of KS_FRAMING_ITEM;
  end;

  //
  // define memory type GUIDs
  //
const

  KSMEMORY_TYPE_WILDCARD        : TGUID = '{00000000-0000-0000-0000-000000000000}';
  KSMEMORY_TYPE_DONT_CARE       : TGUID = '{00000000-0000-0000-0000-000000000000}';
  KS_TYPE_DONT_CARE             : TGUID = '{00000000-0000-0000-0000-000000000000}';

  KSMEMORY_TYPE_SYSTEM          : TGUID = '{091bb638-603f-11d1-b067-00a0c9062802}';
  KSMEMORY_TYPE_USER            : TGUID = '{8cb0fc28-7893-11d1-b069-00a0c9062802}';
  KSMEMORY_TYPE_KERNEL_PAGED    : TGUID = '{d833f8f8-7894-11d1-b069-00a0c9062802}';
  KSMEMORY_TYPE_KERNEL_NONPAGED : TGUID = '{4a6d5fc4-7895-11d1-b069-00a0c9062802}';

  // old KS clients did not specify the device memory type
  KSMEMORY_TYPE_DEVICE_UNKNOWN  : TGUID = '{091bb639-603f-11d1-b067-00a0c9062802}';


  //
  // Put Helper framing macros here.
  //

  // KSEVENTSETID_StreamAllocator: {75D95571-073C-11d0-A161-0020AFD156E4}
  KSEVENTSETID_StreamAllocator : TGUID = '{75d95571-073c-11d0-a161-0020afd156e4}';


type

  PKSEVENT_STREAMALLOCATOR = ^KSEVENT_STREAMALLOCATOR;
  KSEVENT_STREAMALLOCATOR = (
    KSEVENT_STREAMALLOCATOR_INTERNAL_FREEFRAME = 0,
    KSEVENT_STREAMALLOCATOR_FREEFRAME          = 1
  );

const

  KSMETHODSETID_StreamAllocator : TGUID = '{cf6e4341-ec87-11cf-a130-0020afd156e4}';


type

  PKSMETHOD_STREAMALLOCATOR = ^KSMETHOD_STREAMALLOCATOR;
  KSMETHOD_STREAMALLOCATOR = (
    KSMETHOD_STREAMALLOCATOR_ALLOC = 0,
    KSMETHOD_STREAMALLOCATOR_FREE  = 1
  );


const

  KSPROPSETID_StreamAllocator : TGUID = '{cf6e4342-ec87-11cf-a130-0020afd156e4}';


type

  PKSSTREAMALLOCATOR_STATUS = ^KSSTREAMALLOCATOR_STATUS;
  KSSTREAMALLOCATOR_STATUS = record
    Framing         : KSALLOCATOR_FRAMING;
    AllocatedFrames : ULONG;
    Reserved        : ULONG;
  end;

  PKSSTREAMALLOCATOR_STATUS_EX = ^KSSTREAMALLOCATOR_STATUS_EX;
  KSSTREAMALLOCATOR_STATUS_EX = record
    Framing         : KSALLOCATOR_FRAMING_EX;
    AllocatedFrames : ULONG;
    Reserved        : ULONG;
  end;


const

  KSSTREAM_HEADER_OPTIONSF_SPLICEPOINT        = $00000001;
  KSSTREAM_HEADER_OPTIONSF_PREROLL            = $00000002;
  KSSTREAM_HEADER_OPTIONSF_DATADISCONTINUITY  = $00000004;
  KSSTREAM_HEADER_OPTIONSF_TYPECHANGED        = $00000008;
  KSSTREAM_HEADER_OPTIONSF_TIMEVALID          = $00000010;
  KSSTREAM_HEADER_OPTIONSF_TIMEDISCONTINUITY  = $00000040;
  KSSTREAM_HEADER_OPTIONSF_FLUSHONPAUSE       = $00000080;
  KSSTREAM_HEADER_OPTIONSF_DURATIONVALID      = $00000100;
  KSSTREAM_HEADER_OPTIONSF_ENDOFSTREAM        = $00000200;
  KSSTREAM_HEADER_OPTIONSF_BUFFEREDTRANSFER   = $00000400;
  KSSTREAM_HEADER_OPTIONSF_VRAM_DATA_TRANSFER = $00000800;
  KSSTREAM_HEADER_OPTIONSF_METADATA           = $00001000;
  KSSTREAM_HEADER_OPTIONSF_ENDOFPHOTOSEQUENCE = $00002000;
  KSSTREAM_HEADER_OPTIONSF_FRAMEINFO          = $00004000;
  //
  // Start of MDL caching related definitions
  //
  KSSTREAM_HEADER_OPTIONSF_PERSIST_SAMPLE     = $00008000;
  KSSTREAM_HEADER_OPTIONSF_SAMPLE_PERSISTED   = $00010000;
  //
  // This flag tells the user mode to look at frame completion numbers
  //
  KSSTREAM_HEADER_TRACK_COMPLETION_NUMBERS    = $00020000;
  //
  // End of MDL caching related definitions
  KSSTREAM_HEADER_OPTIONSF_LOOPEDDATA         = $80000000;


type

  PKSTIME = ^KSTIME;
  KSTIME = record
    Time        : LONGLONG;
    Numerator   : ULONG;
    Denominator : ULONG;
  end;

  PKSSTREAM_HEADER = ^KSSTREAM_HEADER;
  KSSTREAM_HEADER = record
    Size: ULONG;
    TypeSpecificFlags: ULONG;
    PresentationTime: KSTIME;
    Duration: LONGLONG;
    FrameExtent: ULONG;
    DataUsed: ULONG;
    Data: PVoid;
    OptionsFlags: ULONG;
    Reserved: ULONG;
  end;


//typedef struct
//{
//	ULONG       PresentationTimeStamp;
//	ULONG       SourceClockReference;
//	union
//	{
//		struct
//		{
//			USHORT	Counter : 11;
//			USHORT  Reserved : 5;
//		};
//		USHORT	SCRToken;
//	};
//	USHORT      Reserved0;
//	ULONG       Reserved1;
//} KSSTREAM_UVC_METADATATYPE_TIMESTAMP, *PKSSTREAM_UVC_METADATATYPE_TIMESTAMP;



  PKSSTREAM_UVC_METADATATYPE_TIMESTAMP = ^KSSTREAM_UVC_METADATATYPE_TIMESTAMP;
  KSSTREAM_UVC_METADATATYPE_TIMESTAMP = record
  private
    function ReadBits(const aIndex: Integer): USHORT;
    procedure WriteBits(const aIndex: Integer;
                        const aValue: USHORT);

  public
    SCRToken: USHORT; // Same as 'flags' used to acces all bitvalues
    PresentationTimeStamp: ULONG;
	  SourceClockReference: ULONG;
    Reserved0: USHORT;
  	Reserved1: ULONG;

    property Counter: USHORT index $0011 read ReadBits write WriteBits;  // 11 bits at offset 0
    property Reserved: USHORT index $0A05 read ReadBits write WriteBits; // 5 bits at offset 11
  end;


  PKSSTREAM_UVC_METADATA = ^KSSTREAM_UVC_METADATA;
  KSSTREAM_UVC_METADATA = record
    StartOfFrameTimestamp: KSSTREAM_UVC_METADATATYPE_TIMESTAMP;
    EndOfFrameTimestamp: KSSTREAM_UVC_METADATATYPE_TIMESTAMP;
  end;


const
  //
  // Additional space for UVC Attribute data to be stamped in the payload by the

  // Inbox UVC driver

  //

  KSSTREAM_UVC_SECURE_ATTRIBUTE_SIZE = $2000;

type

  PKSPIN_MDL_CACHING_EVENT = ^KSPIN_MDL_CACHING_EVENT;
  KSPIN_MDL_CACHING_EVENT = (
    KSPIN_MDL_CACHING_NOTIFY_CLEANUP = 0,
    KSPIN_MDL_CACHING_NOTIFY_CLEANALL_WAIT,
    KSPIN_MDL_CACHING_NOTIFY_CLEANALL_NOWAIT,
    KSPIN_MDL_CACHING_NOTIFY_ADDSAMPLE);


  PKSPIN_MDL_CACHING_NOTIFICATION = ^KSPIN_MDL_CACHING_NOTIFICATION;
  KSPIN_MDL_CACHING_NOTIFICATION = record
    Event: KSPIN_MDL_CACHING_EVENT;
    Buffer: Pointer;
  end;


  PKSPIN_MDL_CACHING_NOTIFICATION32 = ^KSPIN_MDL_CACHING_NOTIFICATION32;
  KSPIN_MDL_CACHING_NOTIFICATION32 = record
    Event: KSPIN_MDL_CACHING_EVENT;
    Buffer: ULONG;
  end;


const

  KSPROPSETID_StreamInterface :	TGUID = (D1: $1fdd8ee1;
                                         D2: $9cd3;
                                         D3: $11d0;
                                         D4: ($82, $aa, $00, $00, $f8, $22, $fe, $8a));

type

  KSPROPERTY_STREAMINTERFACE = (KSPROPERTY_STREAMINTERFACE_HEADERSIZE);
  PKSPROPERTY_STREAMINTERFACE = ^KSPROPERTY_STREAMINTERFACE;

const

  KSPROPSETID_Stream :	TGUID = '{65aaba60-98ae-11cf-a10d-0020afd156e4}';


type

  PKSPROPERTY_STREAM = ^KSPROPERTY_STREAM;
  KSPROPERTY_STREAM = (
    KSPROPERTY_STREAM_ALLOCATOR = 0,
    KSPROPERTY_STREAM_QUALITY,
    KSPROPERTY_STREAM_DEGRADATION,
    KSPROPERTY_STREAM_MASTERCLOCK,
    KSPROPERTY_STREAM_TIMEFORMAT,
    KSPROPERTY_STREAM_PRESENTATIONTIME,
    KSPROPERTY_STREAM_PRESENTATIONEXTENT,
    KSPROPERTY_STREAM_FRAMETIME,
    KSPROPERTY_STREAM_RATECAPABILITY,
    KSPROPERTY_STREAM_RATE,
    KSPROPERTY_STREAM_PIPE_ID);


const

  KSPROPSETID_PinMDLCacheClearProp :	TGUID = '{BD718A7B-97FC-40C7-88CE-D3FF06F55B16}';


type

  PKSQUALITY_MANAGER = ^KSQUALITY_MANAGER;
  KSQUALITY_MANAGER = record
    QualityManager : THandle;
    Context        : Pointer;
  end;


  PKSFRAMETIME = ^KSFRAMETIME;
  KSFRAMETIME = record
    Duration   : Int64;
    FrameFlags : ULONG;
    Reserved   : ULONG;
  end;


const

  KSFRAMETIME_VARIABLESIZE = $00000001;


type

  PKSRATE = ^KSRATE;
  KSRATE = record
    PresentationStart : LONGLONG;
    Duration          : LONGLONG;
    Interface_        : KSPIN_INTERFACE;
    Rate              : LONG;
    Flags             : ULONG;
  end;


const

  KSRATE_NOPRESENTATIONSTART    = $00000001;
  KSRATE_NOPRESENTATIONDURATION = $00000002;


type

  PKSRATE_CAPABILITY = ^KSRATE_CAPABILITY;
  KSRATE_CAPABILITY = record
    Property_ : KSPROPERTY;
    Rate      : KSRATE;
  end;


const

  KSPROPSETID_Clock :	TGUID = '{DF12A4C0-AC17-11CF-A5D6-28DB04C10000}';


//
// Performs a x*y/z operation on 64 bit quantities by splitting the operation.
// The equation is simplified with respect to adding in the remainder for the
// upper 32 bits.
//
// (xh * 10000000 / Frequency) * 2^32 + ((((xh * 10000000) % Frequency) * 2^32 + (xl * 10000000)) / Frequency)
//

  NANOSECONDS = 10000000;

  function KSCONVERT_PERFORMANCE_TIME(Frequency: ULONG;
                                      _PerformanceTime: ULARGE_INTEGER): ULONGLONG;



type

  PKSCLOCK_CREATE = ^KSCLOCK_CREATE;
  KSCLOCK_CREATE = record
    CreateFlags : ULONG;
  end;

  PKSCORRELATED_TIME = ^KSCORRELATED_TIME;
  KSCORRELATED_TIME = record
    Time       : LONGLONG;
    SystemTime : LONGLONG;
  end;

  PKSRESOLUTION = ^KSRESOLUTION;
  KSRESOLUTION = record
    Granularity : LONGLONG;
    Error       : LONGLONG;
  end;

  PKSPROPERTY_CLOCK = ^KSPROPERTY_CLOCK;
  KSPROPERTY_CLOCK = (
    KSPROPERTY_CLOCK_TIME = 0,
    KSPROPERTY_CLOCK_PHYSICALTIME,
    KSPROPERTY_CLOCK_CORRELATEDTIME,
    KSPROPERTY_CLOCK_CORRELATEDPHYSICALTIME,
    KSPROPERTY_CLOCK_RESOLUTION,
    KSPROPERTY_CLOCK_STATE,
    KSPROPERTY_CLOCK_FUNCTIONTABLE
  );


const

  KSEVENTSETID_Clock : TGUID = '{364D8E20-62C7-11CF-A5D6-28DB04C10000}';


type

  PKSEVENT_CLOCK_POSITION = ^KSEVENT_CLOCK_POSITION;
  KSEVENT_CLOCK_POSITION = (
    KSEVENT_CLOCK_INTERVAL_MARK = 0,
    KSEVENT_CLOCK_POSITION_MARK
  );

const

  KSEVENTSETID_Connection : TGUID = '{7f4bcbe0-9ea5-11cf-a5d6-28db04c10000}';


type

  PKSEVENT_CONNECTION = ^KSEVENT_CONNECTION;
  KSEVENT_CONNECTION = (
    KSEVENT_CONNECTION_POSITIONUPDATE,
    KSEVENT_CONNECTION_DATADISCONTINUITY,
    KSEVENT_CONNECTION_TIMEDISCONTINUITY,
    KSEVENT_CONNECTION_PRIORITY,
    KSEVENT_CONNECTION_ENDOFSTREAM
  );

  PKSQUALITY = ^KSQUALITY;
  KSQUALITY = record
    Context    : Pointer;
    Proportion : ULONG;
    DeltaTime  : Int64;
  end;

  PKSERROR = ^KSERROR;
  KSERROR = record
    Context : Pointer;
    Status  : ULONG;
  end;

  PKSDEGRADE = ^KSDEGRADE;
  KSDEGRADE = KSIDENTIFIER;

const

  KSDEGRADESETID_Standard : TGUID = '{9F564180-704C-11D0-A5D6-28DB04C10000}';


type
  PKSDEGRADE_STANDARD = ^KSDEGRADE_STANDARD;
  KSDEGRADE_STANDARD = (
    KSDEGRADE_STANDARD_SAMPLE = 0,
    KSDEGRADE_STANDARD_QUALITY,
    KSDEGRADE_STANDARD_COMPUTATION,
    KSDEGRADE_STANDARD_SKIP
  );

  PKSPROPERTY_SERIALHDR = ^KSPROPERTY_SERIALHDR;
  KSPROPERTY_SERIALHDR = record
    PropertySet : TGUID;
    Count       : ULONG;
  end;

  PKSPROPERTY_SERIAL = ^KSPROPERTY_SERIAL;
  KSPROPERTY_SERIAL = record
    PropTypeSet    : KSIDENTIFIER;
    Id             : ULONG;
    PropertyLength : ULONG;
  end;



// 3070
//#if (NTDDI_VERSION >= NTDDI_WINXP)
//
// Skipped
//
//#endif // (NTDDI_VERSION >= NTDDI_WINXP)
// 3983
//===========================================================================

//
// exported prototypes
//

//#if (NTDDI_VERSION >= NTDDI_WINXP)
//
//Skipped
//
//#endif // (NTDDI_VERSION >= NTDDI_WINXP)
// 6342





  function KsCreateAllocator(ConnectionHandle: THandle;
                             AllocatorFraming: KSALLOCATOR_FRAMING;
                             out AllocatorHandle: PHANDLE): DWORD; stdcall;

  function KsCreateClock(ConnectionHandle: THandle;
                         ClockCreate: KSCLOCK_CREATE;
                         out ClockHandle: PHANDLE): DWORD; stdcall;

  function KsCreatePin(FilterHandle: THandle;
                       Connect: KSPIN_CONNECT;
                       DesiredAccess: ACCESS_MASK ;
                       out ConnectionHandle: THandle): DWORD; stdcall;

  function KsCreateTopologyNode(ParentHandle: THandle;
                                NodeCreate: KSNODE_CREATE;
                                DesiredAccess: ACCESS_MASK;
                                out NodeHandle: THandle): DWORD; stdcall;

  //
  // KS create function that needs to be called after initializing COM
  //

  function KsCreateAllocator2(ConnectionHandle: THandle;
                              AllocatorFraming: KSALLOCATOR_FRAMING;
                              out AllocatorHandle: THandle): HResult; stdcall;

  function KsCreateClock2(ConnectionHandle: THandle;
                          ClockCreate: KSCLOCK_CREATE;
                          out ClockHandle: THandle): HResult; stdcall;

  function KsCreatePin2(FilterHandle: THandle;
                        Connect: KSPIN_CONNECT;
                        DesiredAccess: ACCESS_MASK;
                        out ConnectionHandle: THandle): HResult; stdcall;

  function KsCreateTopologyNode2(ParentHandle: THandle;
                                 NodeCreate: KSNODE_CREATE;
                                 DesiredAccess: ACCESS_MASK;
                                 NodeHandle: THandle): HResult; stdcall;

  //
  //Start of MDL caching related decisions
  //

  //
  //MDL sharing related definitions
  //

type

  _combined = record
    pHandle: ULONG;     // The Handle which represents the user mode Pin Handle
    fHandle: ULONG;
    uPayload: ULONG64;  // The PayLoad from Sample, which is the Buffer attached
  end;

  PMF_MDL_SHARED_PAYLOAD_KEY = ^MF_MDL_SHARED_PAYLOAD_KEY;
  _MF_MDL_SHARED_PAYLOAD_KEY = record
    case integer of
      0: (combined: _combined);
      1: (GMDLHandle: TGUID);
  end;
  MF_MDL_SHARED_PAYLOAD_KEY = _MF_MDL_SHARED_PAYLOAD_KEY;


  //
  // We need the handle and upayload to be ULONG64
  // to adjust for 64 bit systems and 32 bit systems
  //
  procedure MF_SET_SHARED_MDLHANDLE(a: ULONG;
                                    b: ULONG;
                                    c: ULONG;
                                    d: MF_MDL_SHARED_PAYLOAD_KEY);

  // Additional Prototypes for ALL interfaces

  // end of Additional Prototypes

implementation

const
  ksLib  = 'Ksuser.dll';

function KsCreateAllocator;     external ksLib name 'KsCreateAllocator' ;
function KsCreateClock;         external ksLib name 'KsCreateClock' ;
function KsCreatePin;           external ksLib name 'KsCreatePin' ;
function KsCreateTopologyNode;  external ksLib name 'KsCreateTopologyNode' ;
function KsCreateAllocator2;    external ksLib name 'KsCreateAllocator' ;
function KsCreateClock2;        external ksLib name 'KsCreateClock' ;
function KsCreatePin2;          external ksLib name 'KsCreatePin' ;
function KsCreateTopologyNode2; external ksLib name 'KsCreateTopologyNode' ;


///////// KSSTREAM_UVC_METADATATYPE_TIMESTAMP //////////////////////////////////

{$OPTIMIZATION ON}
{$OVERFLOWCHECKS OFF}

  function KSSTREAM_UVC_METADATATYPE_TIMESTAMP.ReadBits(const aIndex: Integer): USHORT;
  var
    Offset: USHORT;
    NrBits: USHORT;
    Mask: USHORT;

  begin
    NrBits:= aIndex and $FF;
    Offset:= aIndex shr 8;
    Mask:= ((1 shl NrBits) - 1);
    Result:= (SCRToken shr Offset) and Mask;
  end;

  procedure KSSTREAM_UVC_METADATATYPE_TIMESTAMP.WriteBits(const aIndex: Integer;
                                                          const aValue: USHORT);
  var
    Offset: Integer;
    NrBits: Integer;
    Mask: Integer;

  begin
    NrBits:= aIndex and $FF;
    Offset:= aIndex shr 8;
    Mask:= ((1 shl NrBits) - 1);
    Assert(aValue <= Mask);
    SCRToken:= (SCRToken and (not (UINT(Mask) shl UINT(Offset))))
                or (UINT(aValue) shl UINT(Offset));
  end;
// END KSSTREAM_UVC_METADATATYPE_TIMESTAMP /////////////////////////////////////

function KSCONVERT_PERFORMANCE_TIME(Frequency: ULONG;
                                    _PerformanceTime: ULARGE_INTEGER): ULONGLONG;
begin
  Result := (((_PerformanceTime.HighPart * NANOSECONDS) div (Frequency shl 32)) +
            ((_PerformanceTime.HighPart * NANOSECONDS) mod (Frequency shl 32)) +
            ((_PerformanceTime.LowPart * NANOSECONDS) div Frequency));
end;


procedure MF_SET_SHARED_MDLHANDLE(a: ULONG;
                                  b: ULONG;
                                  c: ULONG;
                                  d: MF_MDL_SHARED_PAYLOAD_KEY);
begin
  d.combined.phandle:= ULONG32(a);
  d.combined.fhandle:= ULONG32(b);
  d.combined.upayload:= ULONG64(c);
end;

  // Implement Additional Prototypes here.

end.
