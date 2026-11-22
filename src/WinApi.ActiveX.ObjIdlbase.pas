// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.ActiveX.ObjIdlbase.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 13-02-2016
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: -
//
// Organisation: FactoryX
// Initiator(s): Tony (maXcomX), Peter (OzShips)
// Contributor(s): Tony Kalf (maXcomX), Peter Larson (ozships), (laoqiuqiu)
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
// SDK version: 10.0.28000.2705
//
// Todo: -
//
//==============================================================================
// Source: ObjIdlbase.h
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
//
//==============================================================================
unit WinApi.ActiveX.ObjIdlbase;

{$I MfPack.Fpc.inc}


interface

uses

  {WinApi}
  WinApi.WinApiTypes;

  {$PACKENUM 4}

  {$IFDEF WIN32}
    {$ALIGN 1}
  {$ELSE}
  {$ALIGN 8}
  // Win64
  {$ENDIF}

  {$I 'WinApiTypes.inc'}

const
  COMGLB_EXCEPTION_HANDLE = LongInt(0);
  COMGLB_EXCEPTION_DONOT_HANDLE_FATAL = LongInt(1);
  COMGLB_EXCEPTION_DONOT_HANDLE = LongInt(COMGLB_EXCEPTION_DONOT_HANDLE_FATAL);
  COMGLB_EXCEPTION_DONOT_HANDLE_ANY = LongInt(2);
  CO_MARSHALING_SOURCE_IS_APP_CONTAINER = LongInt(Integer(0));
  CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_1 = LongInt(Integer($80000000));
  CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_2 = LongInt(Integer($80000001));
  CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_3 = LongInt(Integer($80000002));
  CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_4 = LongInt(Integer($80000003));
  CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_5 = LongInt(Integer($80000004));
  CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_6 = LongInt(Integer($80000005));
  CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_7 = LongInt(Integer($80000006));
  CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_8 = LongInt(Integer($80000007));
  CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_9 = LongInt(Integer($80000008));
  CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_10 = LongInt(Integer($80000009));
  CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_11 = LongInt(Integer($8000000A));
  CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_12 = LongInt(Integer($8000000B));
  CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_13 = LongInt(Integer($8000000C));
  CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_14 = LongInt(Integer($8000000D));
  CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_15 = LongInt(Integer($8000000E));
  CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_16 = LongInt(Integer($8000000F));
  CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_17 = LongInt(Integer($80000010));
  CO_MARSHALING_CONTEXT_ATTRIBUTE_RESERVED_18 = LongInt(Integer($80000011));


type
  PEOLE_AUTHENTICATION_CAPABILITIES = ^tagEOLE_AUTHENTICATION_CAPABILITIES;
  tagEOLE_AUTHENTICATION_CAPABILITIES = DWord;
  EOLE_AUTHENTICATION_CAPABILITIES = tagEOLE_AUTHENTICATION_CAPABILITIES;

const
  EOAC_NONE = EOLE_AUTHENTICATION_CAPABILITIES($0);
  EOAC_MUTUAL_AUTH = EOLE_AUTHENTICATION_CAPABILITIES($1);
  EOAC_STATIC_CLOAKING = EOLE_AUTHENTICATION_CAPABILITIES($20);
  EOAC_DYNAMIC_CLOAKING = EOLE_AUTHENTICATION_CAPABILITIES($40);
  EOAC_ANY_AUTHORITY = EOLE_AUTHENTICATION_CAPABILITIES($80);
  EOAC_MAKE_FULLSIC = EOLE_AUTHENTICATION_CAPABILITIES($100);
  EOAC_DEFAULT = EOLE_AUTHENTICATION_CAPABILITIES($800);

  // These are only valid for CoInitializeSecurity
  EOAC_SECURE_REFS = EOLE_AUTHENTICATION_CAPABILITIES($2);
  EOAC_ACCESS_CONTROL = EOLE_AUTHENTICATION_CAPABILITIES($4);
  EOAC_APPID = EOLE_AUTHENTICATION_CAPABILITIES($8);
  EOAC_DYNAMIC = EOLE_AUTHENTICATION_CAPABILITIES($10);
  EOAC_REQUIRE_FULLSIC = EOLE_AUTHENTICATION_CAPABILITIES($200);
  EOAC_AUTO_IMPERSONATE = EOLE_AUTHENTICATION_CAPABILITIES($400);
  EOAC_DISABLE_AAA = EOLE_AUTHENTICATION_CAPABILITIES($1000);
  EOAC_NO_CUSTOM_MARSHAL = EOLE_AUTHENTICATION_CAPABILITIES($2000);
  EOAC_RESERVED1 = EOLE_AUTHENTICATION_CAPABILITIES($4000);



type

  // Forward interface declarations

  LPMARSHAL2 = ^IMarshal2;
  PIMarshal2 = ^IMarshal2;
  IMarshal2 = interface;

  LPSTDMARSHALINFO = ^IStdMarshalInfo;
  PIStdMarshalInfo = ^IStdMarshalInfo;
  IStdMarshalInfo = interface;

  LPEXTERNALCONNECTION = ^IExternalConnection;
  PIExternalConnection = ^IExternalConnection;
  IExternalConnection = interface;

  LPENUMUNKNOWN = ^IEnumUnknown;
  PIEnumUnknown = ^IEnumUnknown;
  IEnumUnknown = interface;

  LPENUMSTRING = ^IEnumString;
  PIEnumString = ^IEnumString;
  IEnumString = interface;

  LPSTREAM = ^IStream;
  PIStream = ^IStream;
  IStream = interface;

  LPSURROGATE = ^ISurrogate;
  PSURROGATE = ^ISurrogate;
  PISurrogate = ^ISurrogate;
  ISurrogate = interface;

  PISynchronize = ^ISynchronize;
  ISynchronize = interface;

  PIAsyncManager = ^IAsyncManager;
  IAsyncManager = interface;

  LPENUMCONTEXTPROPS = ^IEnumContextProps;
  PIEnumContextProps = ^IEnumContextProps;
  IEnumContextProps = interface;

  LPCONTEXT = ^IContext;
  PIContext = ^IContext;
  IContext = interface;

  {$IFDEF _OBJIDL_PUBLIC}
  PIObjContext = ^IObjContext;
  IObjContext = interface;
  {$ENDIF}



  PCOSERVERINFO = ^_COSERVERINFO;

  _COSERVERINFO = record
    dwReserved1: DWORD;
    pwszName: PWideChar;
    pAuthInfo: PCOAUTHINFO;
    dwReserved2: DWORD;
  end;
  COSERVERINFO = _COSERVERINFO;

  //****************************************************************************
  //*  Component Object Interfaces
  //***************************************************************************/


  // Interface IMarshal
  // ==================
  //
  PIMarshal = ^IMarshal;

  IMarshal = interface(IUnknown)
    ['{00000003-0000-0000-C000-000000000046}']
    function GetUnmarshalClass(const iid: IID;
                               pv: Pointer;
                               dwDestContext: DWORD;
                               pvDestContext: Pointer;
                               mshlflags: DWORD;
                               out cid: CLSID): HResult; stdcall;

    function GetMarshalSizeMax(const iid: IID;
                               pv: Pointer;
                               dwDestContext: DWORD;
                               pvDestContext: Pointer;
                               mshlflags: DWORD;
                               out size: DWORD): HResult; stdcall;

    function MarshalInterface(stm: IStream;
                              const iid: IID;
                              pv: Pointer;
                              dwDestContext: DWORD;
                              pvDestContext: Pointer;
                              mshlflags: DWORD): HResult; stdcall;

    function UnmarshalInterface(stm: IStream;
                                const iid: IID;
                                out pv): HResult; stdcall;

    function ReleaseMarshalData(const stm: IStream): HResult; stdcall;

    function DisconnectObject(dwReserved: DWORD): HResult; stdcall;

  end;

  IID_IMarshal = IMarshal;


  // Interface INoMarshal
  // ====================
  // INoMarshal - marks an object that does not support being marshaled
  // or stored in the global interface table
  //
  PINoMarshal = ^INoMarshal;
  INoMarshal = interface(IUnknown)
    ['{ecc8691b-c1db-4dc0-855e-65f6c551af49}']

  end;

  IID_INoMarshal = INoMarshal;


  // Interface IAgileObject
  // ======================
  // IAgileObject - marks an interface as agile across apartments, e.g. if it
  // aggregates the Free Threaded Marshaler.
  //
  IAgileObject = interface(IUnknown)
    ['{94ea2b94-e9cc-49e0-c0ff-ee64ca8f5b90}']

  end;

  IID_IAgileObject = IAgileObject;


  // possible values for dwActivationType
  PACTIVATIONTYPE = ^tagACTIVATIONTYPE;
  tagACTIVATIONTYPE = (
    ACTIVATIONTYPE_UNCATEGORIZED = $0,
                       ACTIVATIONTYPE_FROM_MONIKER = $1,
                       ACTIVATIONTYPE_FROM_DATA = $2,
                       ACTIVATIONTYPE_FROM_STORAGE = $4,
                       ACTIVATIONTYPE_FROM_STREAM = $8,
                       ACTIVATIONTYPE_FROM_FILE = $10
    );
  ACTIVATIONTYPE = tagACTIVATIONTYPE;


  // Interface IActivationFilter
  // ===========================
  //
  PIActivationFilter = ^IActivationFilter;

  IActivationFilter = interface(IUnknown)
    ['{00000017-0000-0000-C000-000000000046}']
    function HandleActivation(dwActivationType: DWORD;
                              const rclsid: REFCLSID;
                              out pReplacementClsId: CLSID): HResult; stdcall;

  end;

  IID_IActivationFilter = IActivationFilter;


  // Interface IMarshal2
  // ===================
  //
  IMarshal2 = interface(IMarshal)
    ['{000001cf-0000-0000-C000-000000000046}']

  end;

  IID_IMarshal2 = IMarshal2;


  // Interface IMalloc
  // =================
  //
  IMalloc = interface(IUnknown)
    ['{00000002-0000-0000-C000-000000000046}']

    procedure Alloc(const cb: SIZE_T); stdcall;

    procedure Realloc(pv: Pointer;
                      cb: SIZE_T); stdcall;

    procedure Free(pv: Pointer);

    //[annotation("_Success_(return != SIZE_MAX)")] #pragma prefast(disable:28285 28309, "MSENG:186222")
    function GetSize(pv: Pointer): SIZE_T; stdcall;

    function DidAlloc(pv: Pointer): INT; stdcall;

    procedure HeapMinimize(); stdcall;

  end;

  IID_IMalloc = IMalloc;


  // Interface IStdMarshalInfo
  // =========================
  //
  IStdMarshalInfo = interface(IUnknown)
    ['{00000018-0000-0000-C000-000000000046}']
    function GetClassForHandler(dwDestContext: DWORD;
                                pvDestContext: Pointer;
                                out clsid: CLSID): HResult; stdcall;

  end;

  IID_IStdMarshalInfo = IStdMarshalInfo;


  // bit flags for IExternalConnection
  PEXTCONN = ^tagEXTCONN;
  tagEXTCONN = (
    EXTCONN_STRONG = $0001,         // strong connection
    EXTCONN_WEAK = $0002,         // weak connection (table, container)
    EXTCONN_CALLABLE = $0004          // table .vs. callable
    );
  EXTCONN = tagEXTCONN;

  // Interface IExternalConnection
  // =============================
  //
  IExternalConnection = interface(IUnknown)
    ['{00000019-0000-0000-C000-000000000046}']
    // *** IExternalConnection methods ***
    function AddConnection(extconn: DWORD;
                           reserved: DWORD): DWORD; stdcall;

    function ReleaseConnection(extconn: DWORD;
                               reserved: DWORD;
                               fLastReleaseCloses: BOOL): DWORD; stdcall;

  end;

  IID_IExternalConnection = IExternalConnection;


  LPMULTIQI = ^PMULTI_QI;
  PMULTI_QI = ^tagMULTI_QI;

  tagMULTI_QI = record
    pIID: IID;       // pass this one in
    pItf: IUnknown;  // get these out (you must set to NULL before calling)
    hr: HResult;
  end;
  MULTI_QI = tagMULTI_QI;


  // Interface IMultiQI
  // ==================
  //
  PIMultiQI = ^IMultiQI;

  IMultiQI = interface(IUnknown)
    ['{00000020-0000-0000-C000-000000000046}']

    function QueryMultipleInterfaces(cMQIs: ULONG;
                                     var pMQIs: PMULTI_QI): HResult; stdcall;

  end;

  IID_IMultiQI = IMultiQI;


  // Interface IInternalUnknown
  // ==========================
  //
  IInternalUnknown = interface(IUnknown)
    ['{00000021-0000-0000-C000-000000000046}']

    function QueryInternalInterface(const riid: REFIID;
                                    out ppv): HResult; stdcall;

  end;

  IID_IInternalUnknown = IInternalUnknown;


  // Interface IEnumUnknown
  // ======================
  //
  IEnumUnknown = interface(IUnknown)
    ['{00000100-0000-0000-C000-000000000046}']
    function Next(celt: Longint;
                  out elt;
                  pceltFetched: PDWORD): HResult; stdcall;

    function Skip(celt: DWORD): HResult; stdcall;

    function Reset(): HResult; stdcall;

    function Clone(out enm: IEnumUnknown): HResult; stdcall;

  end;

  IID_IEnumUnknown = IEnumUnknown;


  // Interface IEnumString
  // =====================
  //
  IEnumString = interface(IUnknown)
    ['{00000101-0000-0000-C000-000000000046}']
    function Next(celt: Longint;
                  out elt;
                  pceltFetched: PDWORD): HResult; stdcall;

    function Skip(celt: DWORD): HResult; stdcall;

    function Reset(): HResult; stdcall;

    function Clone(out enm: IEnumString): HResult; stdcall;

  end;

  IID_IEnumString = IEnumString;


  // Interface ISequentialStream
  // ===========================
  //
  PISequentialStream = ^ISequentialStream;

  ISequentialStream = interface(IUnknown)
    ['{0c733a30-2a1c-11ce-ade5-00aa0044773d}']
    function Read(pv: Pointer;
                  cb: DWORD;
                  pcbRead: PDWORD): HResult; stdcall;

    function Write(pv: Pointer;
                   cb: DWORD;
                   pcbWritten: PDWORD): HResult; stdcall;

  end;

  IID_ISequentialStream = ISequentialStream;


  //* Storage stat buffer *//
  PSTATSTG = ^tagSTATSTG;

  tagSTATSTG = record
    pwcsName: LPOLESTR;
    &type: DWORD;
    cbSize: ULARGE_INTEGER;
    mtime: FILETIME;
    ctime: FILETIME;
    atime: FILETIME;
    grfMode: DWORD;
    grfLocksSupported: DWORD;
    clsid: CLSID;
    grfStateBits: DWORD;
    reserved: DWORD;
  end;
  STATSTG = tagSTATSTG;


  //* Storage element types *//
  PSTGTY = ^tagSTGTY;
  tagSTGTY = (
    STGTY_STORAGE = 1,
              STGTY_STREAM = 2,
              STGTY_LOCKBYTES = 3,
              STGTY_PROPERTY = 4
    );
  STGTY = tagSTGTY;


  PSTREAM_SEEK = ^tagSTREAM_SEEK;
  tagSTREAM_SEEK = (
    STREAM_SEEK_SET = 0,
                    STREAM_SEEK_CUR = 1,
                    STREAM_SEEK_END = 2
    );
  STREAM_SEEK = tagSTREAM_SEEK;


  PLOCKTYPE = ^tagLOCKTYPE;
  tagLOCKTYPE = (
    LOCK_WRITE = 1,
                 LOCK_EXCLUSIVE = 2,
                 LOCK_ONLYONCE = 4
    );
  LOCKTYPE = tagLOCKTYPE;


  // Interface IStream
  // =================
  //
  IStream = interface(ISequentialStream)
    ['{0000000c-0000-0000-C000-000000000046}']
    function Seek(dlibMove: LARGE_INTEGER;
                  dwOrigin: DWORD;
                  out libNewPosition: ULARGE_INTEGER): HResult; stdcall;

    function SetSize(libNewSize: ULARGE_INTEGER): HResult; stdcall;

    function CopyTo(stm: IStream;
                    cb: ULARGE_INTEGER;
                    out cbRead: ULARGE_INTEGER;
                    out cbWritten: ULARGE_INTEGER): HResult; stdcall;

    function Commit(grfCommitFlags: DWORD): HResult; stdcall;

    function Revert(): HResult; stdcall;

    function LockRegion(libOffset: ULARGE_INTEGER;
                        cb: ULARGE_INTEGER;
                        dwLockType: DWORD): HResult; stdcall;

    function UnlockRegion(libOffset: ULARGE_INTEGER;
                          cb: ULARGE_INTEGER;
                          dwLockType: DWORD): HResult; stdcall;

    function Stat(out pstatstg: STATSTG;
                  grfStatFlag: DWORD): HResult; stdcall;

    function Clone(out stm: IStream): HResult; stdcall;

  end;

  IID_IStream = IStream;


  PRPCOLEDATAREP = ^RPCOLEDATAREP;
  RPCOLEDATAREP = ULONG;


  PRPCOLEMESSAGE = ^RPCOLEMESSAGE;

  tagRPCOLEMESSAGE = record
    reserved1: Pointer;
    dataRepresentation: RPCOLEDATAREP;
    Buffer: Pointer;
    cbBuffer: ULONG;
    iMethod: ULONG;
    reserved2: array[0..4] of Pointer;
    rpcFlags: ULONG;
  end;
  RPCOLEMESSAGE = tagRPCOLEMESSAGE;


  //****************************************************************************
  //*  Object Remoting Interfaces
  //****************************************************************************/

  // Interface IRpcChannelBuffer
  // ===========================
  //
  PIRpcChannelBuffer = ^IRpcChannelBuffer;

  IRpcChannelBuffer = interface(IUnknown)
    ['{D5F56B60-593B-101A-B569-08002B2DBF7A}']
    function GetBuffer(var message: RPCOLEMESSAGE;
                       const iid: IID): HResult; stdcall;

    function SendReceive(var message: RPCOLEMESSAGE;
                         var status: Longint): HResult; stdcall;

    function FreeBuffer(var message: RPCOLEMESSAGE): HResult; stdcall;

    function GetDestCtx(out dwDestContext: Longint;
                        out pvDestContext): HResult; stdcall;

    function IsConnected(): HResult; stdcall;

  end;

  IID_IRpcChannelBuffer = IRpcChannelBuffer;


  // Interface IRpcChannelBuffer2
  // ============================
  //
  PIRpcChannelBuffer2 = ^IRpcChannelBuffer2;

  IRpcChannelBuffer2 = interface(IRpcChannelBuffer)
    ['{a5029fb6-3c34-11d1-9c99-00c04fb998aa}']

    function Send(var message: RPCOLEMESSAGE;
                  pSync: ISynchronize;
                  out pulStatus: ULONG): HResult; stdcall; overload;

    function Receive(var message: RPCOLEMESSAGE;
                     out pulStatus: ULONG): HResult; stdcall; overload;

    function GetDestCtxEx(var message: RPCOLEMESSAGE;
                          out pdwDestContext: DWORD;
                          out ppvDestContext): HResult; stdcall; overload;

  end;

  IID_IRpcChannelBuffer2 = IRpcChannelBuffer2;


  // Interface IAsyncRpcChannelBuffer
  // ================================
  //
  PIAsyncRpcChannelBuffer = ^IAsyncRpcChannelBuffer;

  IAsyncRpcChannelBuffer = interface(IRpcChannelBuffer2)
    ['{594f31d0-7f19-11d0-b194-00a0c90dc8bf}']
    function GetProtocolVersion(out pdwVersion: DWORD): HResult; stdcall;

  end;

  IID_IAsyncRpcChannelBuffer = IAsyncRpcChannelBuffer;


  // Interface IRpcChannelBuffer3
  // ============================
  //
  PIRpcChannelBuffer3 = ^IRpcChannelBuffer3;

  IRpcChannelBuffer3 = interface(IRpcChannelBuffer2)
    ['{25B15600-0115-11d0-BF0D-00AA00B8DFD2}']

    function Send(var message: RPCOLEMESSAGE;
                  out pulStatus: ULONG): HResult; stdcall; overload;

    function Receive(var message: RPCOLEMESSAGE;
                     ulSize: ULONG;
                     out pulStatus: ULONG): HResult; stdcall; overload;

    function Cancel(var message: RPCOLEMESSAGE): HResult; stdcall;

    function GetCallContext(var message: RPCOLEMESSAGE;
                            const riid: REFIID;
                            out pInterface: IntPtr): HResult; stdcall;

    function GetDestCtxEx(var message: RPCOLEMESSAGE;
                          out pdwDestContext: DWORD;
                          out ppvDestContext: IntPtr): HResult; stdcall; overload;

    function GetState(var message: RPCOLEMESSAGE;
                      out pState: DWORD): HResult; stdcall;

    function RegisterAsync(var message: RPCOLEMESSAGE;
                           pAsyncMgr: IAsyncManager): HResult; stdcall;

  end;

  IID_IRpcChannelBuffer3 = IRpcChannelBuffer3;


  // Interface IRpcSyntaxNegotiate
  // =============================
  //
  PIRpcSyntaxNegotiate = ^IRpcSyntaxNegotiate;

  IRpcSyntaxNegotiate = interface(IUnknown)
    ['{58a08519-24c8-4935-b482-3fd823333a4f}']
    function NegotiateSyntax(var pMsg: RPCOLEMESSAGE): HResult; stdcall;

  end;

  IID_IRpcSyntaxNegotiate = IRpcSyntaxNegotiate;


  // Interface IRpcProxyBuffer
  // =========================
  //
  PIRpcProxyBuffer = ^IRpcProxyBuffer;

  IRpcProxyBuffer = interface(IUnknown)
    ['{D5F56A34-593B-101A-B569-08002B2DBF7A}']
    function Connect(const rpcChannelBuffer: IRpcChannelBuffer): HResult; stdcall;

    procedure Disconnect(); stdcall;

  end;

  IID_IRpcProxyBuffer = IRpcProxyBuffer;


  // Interface IRpcStubBuffer
  // ========================
  //
  PIRpcStubBuffer = ^IRpcStubBuffer;

  IRpcStubBuffer = interface(IUnknown)
    ['{D5F56AFC-593B-101A-B569-08002B2DBF7A}']
    function Connect(const unkServer: IUnknown): HResult; stdcall;

    procedure Disconnect(); stdcall;

    function Invoke(var rpcmsg: RPCOLEMESSAGE;
                    rpcChannelBuffer: IRpcChannelBuffer): HResult; stdcall;

    function IsIIDSupported(const iid: IID): Pointer { Needs IRpcStubBuffer }; stdcall;

    function CountRefs(): DWORD; stdcall;

    function DebugServerQueryInterface(var pv): HResult; stdcall;

    procedure DebugServerRelease(pv: Pointer); stdcall;

  end;

  IID_IRpcStubBuffer = IRpcStubBuffer;


  // Interface IPSFactoryBuffer
  // ==========================
  //
  PIPSFactoryBuffer = ^IPSFactoryBuffer;

  IPSFactoryBuffer = interface(IUnknown)
    ['{D5F569D0-593B-101A-B569-08002B2DBF7A}']
    function CreateProxy(unkOuter: IUnknown;
                         const iid: IID;
                         out proxy: IRpcProxyBuffer;
                         out pv): HResult; stdcall;

    function CreateStub(const iid: IID;
                        unkServer: IUnknown;
                        out stub: IRpcStubBuffer): HResult; stdcall;

  end;

  IID_IPSFactoryBuffer = IPSFactoryBuffer;


  // This structure contains additional data for hooks. As a backward
  // compatability hack, the entire structure is passed in place of the
  // RIID parameter on all hook methods. Thus the IID must be the first
  // parameter. As a forward compatability hack the second field is the
  // current size of the structure.
  PSChannelHookCallInfo = ^SChannelHookCallInfo;

  SChannelHookCallInfo = record
    iid: IID;
    cbSize: DWORD;
    uCausality: TGUID;
    dwServerPid: DWORD;
    iMethod: DWORD;
    pObject: Pointer;
  end;


  // Interface IChannelHook
  // ======================
  //
  PIChannelHook = ^IChannelHook;

  IChannelHook = interface(IUnknown)
    ['{1008c4a0-7613-11cf-9af1-0020af6e72f4}']
    procedure ClientGetSize(const uExtent: TGUID;
                            const iid: IID;
                            out DataSize: DWORD); stdcall;

    procedure ClientFillBuffer(const uExtent: TGUID;
                               const iid: IID;
                               var DataSize: Longint;
                               var DataBuffer); stdcall;

    procedure ClientNotify(const uExtent: TGUID;
                           const iid: IID;
                           DataSize: DWORD;
                           var DataBuffer;
                           lDataRep: DWORD;
                           hrFault: HResult); stdcall;

    procedure ServerNotify(const uExtent: TGUID;
                           const iid: IID;
                           DataSize: DWORD;
                           var DataBuffer;
                           lDataRep: DWORD); stdcall;

    procedure ServerGetSize(const uExtent: TGUID;
                            const iid: IID;
                            hrFault: HResult;
                            out DataSize: DWORD); stdcall;

    procedure ServerFillBuffer(const uExtent: TGUID;
                               const iid: IID;
                               var DataSize: DWORD;
                               var DataBuffer;
                               hrFault: HResult); stdcall;

  end;

  IID_IChannelHook = IChannelHook;


  PSOLE_AUTHENTICATION_SERVICE = ^SOLE_AUTHENTICATION_SERVICE;

  tagSOLE_AUTHENTICATION_SERVICE = record
    dwAuthnSvc: DWORD;
    dwAuthzSvc: DWORD;
    pPrincipalName: POLECHAR;
    hr: HResult;
  end;
  SOLE_AUTHENTICATION_SERVICE = tagSOLE_AUTHENTICATION_SERVICE;



  PSOLE_AUTHENTICATION_INFO = ^tagSOLE_AUTHENTICATION_INFO;

  tagSOLE_AUTHENTICATION_INFO = record
    dwAuthnSvc: DWORD;
    dwAuthzSvc: DWORD;
    pAuthInfo: Pointer;
  end;
  SOLE_AUTHENTICATION_INFO = tagSOLE_AUTHENTICATION_INFO;


  PSOLE_AUTHENTICATION_LIST = ^tagSOLE_AUTHENTICATION_LIST;

  tagSOLE_AUTHENTICATION_LIST = record
    cAuthInfo: DWORD;
    aAuthInfo: PSOLE_AUTHENTICATION_INFO;
  end;
  SOLE_AUTHENTICATION_LIST = tagSOLE_AUTHENTICATION_LIST;


  // Interface IClientSecurity
  // =========================
  //
  PIClientSecurity = ^IClientSecurity;

  IClientSecurity = interface(IUnknown)
    ['{0000013D-0000-0000-C000-000000000046}']
    function QueryBlanket(pProxy: IUnknown;
                          out pAuthnSvc: DWORD;
                          out pAuthzSvc: DWORD;
                          out pServerPrincName: POLECHAR;
                          out pAuthnLevel: DWORD;
                          out pImpLevel: DWORD;
                          out pAuthInfo: Pointer;
                          out pCapabilites: DWORD): HResult; stdcall;

    function SetBlanket(pProxy: IUnknown;
                        dwAuthnSvc: DWORD;
                        dwAuthzSvc: DWORD;
                        pServerPrincName: POLECHAR;
                        dwAuthnLevel: DWORD;
                        dwImpLevel: DWORD;
                        pAuthInfo: Pointer;
                        dwCapabilities: DWORD): HResult; stdcall;

    function CopyProxy(pProxy: IUnknown;
                       out ppCopy: Pointer { Type IUnknown }): HResult; stdcall;

  end;

  IID_IClientSecurity = IClientSecurity;


  // Interface IServerSecurity
  // =========================
  //
  PIServerSecurity = ^IServerSecurity;

  IServerSecurity = interface(IUnknown)
    ['{0000013E-0000-0000-C000-000000000046}']

    function QueryBlanket(out pAuthnSvc: PDWORD;
                          out pAuthzSvc: PDWORD;
                          out pServerPrincName: POLECHAR;
                          out pAuthnLevel: PDWORD;
                          out pImpLevel: PDWORD;
                          out pPrivs: Pointer;
                          var pCapabilities: DWORD): HResult; stdcall;

    function ImpersonateClient(): HResult; stdcall;

    function RevertToSelf(): HResult; stdcall;

    function IsImpersonating(): BOOL; stdcall;

  end;

  IID_IServerSecurity = IServerSecurity;


  PRPCOPT_PROPERTIES = ^tagRPCOPT_PROPERTIES;
  tagRPCOPT_PROPERTIES = (
    COMBND_RPCTIMEOUT = $01,        // Rpc transport-specific timeout.
    COMBND_SERVER_LOCALITY = $02,        // server locality
    COMBND_RESERVED1 = $04,        // Reserved
    COMBND_RESERVED2 = $05,        // Reserved
    COMBND_RESERVED3 = $08,        // Reserved
    COMBND_RESERVED4 = $10         // Reserved
    );
  RPCOPT_PROPERTIES = tagRPCOPT_PROPERTIES;


  PRPCOPT_SERVER_LOCALITY_VALUES = ^tagRPCOPT_SERVER_LOCALITY_VALUES;
  tagRPCOPT_SERVER_LOCALITY_VALUES = (
    SERVER_LOCALITY_PROCESS_LOCAL = 0,
                                      SERVER_LOCALITY_MACHINE_LOCAL = 1,
                                      SERVER_LOCALITY_REMOTE = 2
    );
  RPCOPT_SERVER_LOCALITY_VALUES = tagRPCOPT_SERVER_LOCALITY_VALUES;


  // Interface IRpcOptions
  // =====================
  //
  PIRpcOptions = ^IRpcOptions;

  IRpcOptions = interface(IUnknown)
    ['{00000144-0000-0000-C000-000000000046}']

    function _Set(pPrx: IUnknown;
                  dwProperty: RPCOPT_PROPERTIES;
                  dwValue: ULONG_PTR): HResult; stdcall;

    function Query(pPrx: IUnknown;
                   dwProperty: RPCOPT_PROPERTIES;
                   out pdwValue: ULONG_PTR): HResult; stdcall;

  end;

  IID_IRpcOptions = IRpcOptions;


  // properties
  PGLOBALOPT_PROPERTIES = ^tagGLOBALOPT_PROPERTIES;
  tagGLOBALOPT_PROPERTIES = (
    COMGLB_EXCEPTION_HANDLING = 1,           //defines COM exception handling behavior
    COMGLB_APPID = 2,           //sets the AppID for the process
    COMGLB_RPC_THREADPOOL_SETTING = 3,           // sets the ThreadPool behavior of RPC runtime in the process.
    COMGLB_RO_SETTINGS = 4,           // miscellaneous settings.
    COMGLB_UNMARSHALING_POLICY = 5,           // policy applied to CoUnmarshalInterface
    COMGLB_PROPERTIES_RESERVED1 = 6,
                             COMGLB_PROPERTIES_RESERVED2 = 7,
                             COMGLB_PROPERTIES_RESERVED3 = 8);
  GLOBALOPT_PROPERTIES = tagGLOBALOPT_PROPERTIES;


  // values
  PGLOBALOPT_EH_VALUES = ^tagGLOBALOPT_EH_VALUES;
  tagGLOBALOPT_EH_VALUES = LongInt; // Windows 32-bit enum; aliases and SDK values are preserved.

  GLOBALOPT_EH_VALUES = tagGLOBALOPT_EH_VALUES;


  // values
  PGlobaloptRpctpValues = ^tagGLOBALOPT_RPCTP_VALUES;
  tagGLOBALOPT_RPCTP_VALUES = (
    COMGLB_RPC_THREADPOOL_SETTING_DEFAULT_POOL = 0,  // Not legal for Set.
    COMGLB_RPC_THREADPOOL_SETTING_PRIVATE_POOL = 1);
  GLOBALOPT_RPCTP_VALUES = tagGLOBALOPT_RPCTP_VALUES;


  PGLOBALOPT_RO_FLAGS = ^tagGLOBALOPT_RO_FLAGS;
  tagGLOBALOPT_RO_FLAGS = (
    // Remove touch messages from the message queue in the STA modal loop.
    COMGLB_STA_MODALLOOP_REMOVE_TOUCH_MESSAGES = $1,
    // Flags that control the behavior of input message removal in
    // the STA modal loop when the thread's message queue is attached.
    COMGLB_STA_MODALLOOP_SHARED_QUEUE_REMOVE_INPUT_MESSAGES = $2,
                           COMGLB_STA_MODALLOOP_SHARED_QUEUE_DONOT_REMOVE_INPUT_MESSAGES = $4,
    // Flag to opt-in to the fast rundown option.
    COMGLB_FAST_RUNDOWN = $8,
    // Reserved
    COMGLB_RESERVED1 = $10,
                           COMGLB_RESERVED2 = $20,
                           COMGLB_RESERVED3 = $40,
    // Flag to opt-in to pointer message re-ordering when
    // queues are attached.
    COMGLB_STA_MODALLOOP_SHARED_QUEUE_REORDER_POINTER_MESSAGES = $80,
                           COMGLB_RESERVED4 = $100,
                           COMGLB_RESERVED5 = $200,
                           COMGLB_RESERVED6 = $400);
  GLOBALOPT_RO_FLAGS = tagGLOBALOPT_RO_FLAGS;


  PGLOBALOPT_UNMARSHALING_POLICY_VALUES = ^tagGLOBALOPT_UNMARSHALING_POLICY_VALUES;
  tagGLOBALOPT_UNMARSHALING_POLICY_VALUES = (
    COMGLB_UNMARSHALING_POLICY_NORMAL = 0,
                                             COMGLB_UNMARSHALING_POLICY_STRONG = 1,
                                             COMGLB_UNMARSHALING_POLICY_HYBRID = 2);
  GLOBALOPT_UNMARSHALING_POLICY_VALUES = tagGLOBALOPT_UNMARSHALING_POLICY_VALUES;


  // Interface IGlobalOptions
  // ========================
  //
  PIGlobalOptions = ^IGlobalOptions;

  IGlobalOptions = interface(IUnknown)
    ['{0000015B-0000-0000-C000-000000000046}']
    function _Set(dwProperty: GLOBALOPT_PROPERTIES;
                  dwValue: ULONG_PTR): HResult; stdcall;

    function Query(dwProperty: GLOBALOPT_PROPERTIES;
                   out pdwValue: PULONG_PTR): HResult; stdcall;
  end;

  IID_IGlobalOptions = IGlobalOptions;


  // typedef [unique] ISurrogate* LPSURROGATE;
  // Interface ISurrogate
  // ====================
  //
  ISurrogate = interface(IUnknown)
    ['{00000022-0000-0000-C000-000000000046}']

    function LoadDllServer(const Clsid: REFCLSID): HResult; stdcall;

    function FreeSurrogate(): HResult; stdcall;

  end;

  IID_ISurrogate = ISurrogate;


  // Interface IGlobalInterfaceTable
  // ===============================
  //
  PIGlobalInterfaceTable = ^IGlobalInterfaceTable;

  IGlobalInterfaceTable = interface(IUnknown)
    ['{00000146-0000-0000-C000-000000000046}']
    function RegisterInterfaceInGlobal(const pUnk: IUnknown;
                                       const riid: REFIID;
                                       out pdwCookie: PDWORD): HResult; stdcall;

    function RevokeInterfaceFromGlobal(const dwCookie: DWORD): HResult; stdcall;

    function GetInterfaceFromGlobal(const dwCookie: DWORD;
                                    const riid: REFIID;
                                    out ppv): HResult; stdcall;

  end;

  IID_IGlobalInterfaceTable = IGlobalInterfaceTable;


  // Interface ISynchronize
  // ======================
  //
  ISynchronize = interface(IUnknown)
    ['{00000030-0000-0000-C000-000000000046}']
    function Wait(dwFlags: DWORD;
                  dwMilliseconds: DWORD): HResult; stdcall;

    function Signal(): HResult; stdcall;

    function Reset(): HResult; stdcall;

  end;

  IID_ISynchronize = ISynchronize;


  // Interface ISynchronizeHandle
  // ============================
  //
  PISynchronizeHandle = ^ISynchronizeHandle;

  ISynchronizeHandle = interface(IUnknown)
    ['{00000031-0000-0000-C000-000000000046}']
    function GetHandle(out ph: THandle): HResult; stdcall;

  end;

  IID_ISynchronizeHandle = ISynchronizeHandle;


  // Interface ISynchronizeEvent
  // ===========================
  //
  PISynchronizeEvent = ^ISynchronizeEvent;

  ISynchronizeEvent = interface(ISynchronizeHandle)
    ['{00000032-0000-0000-C000-000000000046}']
    function SetEventHandle(ph: THandle): HResult; stdcall;

  end;

  IID_ISynchronizeEvent = ISynchronizeEvent;


  // Interface ISynchronizeContainer
  // ===============================
  //
  PISynchronizeContainer = ^ISynchronizeContainer;

  ISynchronizeContainer = interface(IUnknown)
    ['{00000033-0000-0000-C000-000000000046}']
    function AddSynchronize(pSync: ISynchronize): HResult; stdcall;

    function WaitMultiple(dwFlags: DWORD;
                          dwTimeOut: DWORD;
                          out ppSync: ISynchronize): HResult; stdcall;

  end;

  IID_ISynchronizeContainer = ISynchronizeContainer;


  // Interface ISynchronizeMutex
  // ===========================
  //
  PISynchronizeMutex = ^ISynchronizeMutex;

  ISynchronizeMutex = interface(ISynchronize)
    ['{00000025-0000-0000-C000-000000000046}']
    function ReleaseMutex(): HResult; stdcall;

  end;

  IID_ISynchronizeMutex = ISynchronizeMutex;


  // Interface ICancelMethodCalls
  // ============================
  //
  PICancelMethodCalls = ^ICancelMethodCalls;

  ICancelMethodCalls = interface(IUnknown)
    ['{00000029-0000-0000-C000-000000000046}']
    function Cancel(ulSeconds: ULONG): HResult; stdcall;

    function TestCancel(): HResult; stdcall;

  end;

  IID_ICancelMethodCalls = ICancelMethodCalls;


  PDCOM_CALL_STATE = ^tagDCOM_CALL_STATE;
  tagDCOM_CALL_STATE = (
    DCOM_NONE = $0,
                        DCOM_CALL_COMPLETE = $1,
                        DCOM_CALL_CANCELED = $2);
  DCOM_CALL_STATE = tagDCOM_CALL_STATE;


  // Interface IAsyncManager
  // =======================
  //
  IAsyncManager = interface(IUnknown)
    ['{0000002A-0000-0000-C000-000000000046}']
    function CompleteCall(_Result: HResult): HResult; stdcall;

    function GetCallContext(const riid: REFIID;
                            out pInterface: Pointer): HResult; stdcall;

    function GetState(out pulStateFlags: ULONG): HResult; stdcall;

  end;

  IID_IAsyncManager = IAsyncManager;


  // Interface ICallFactory
  // ======================
  //
  PICallFactory = ^ICallFactory;

  ICallFactory = interface(IUnknown)
    ['{1c733a30-2a1c-11ce-ade5-00aa0044773d}']
    function CreateCall(const riid: REFIID;
                        pCtrlUnk: IUnknown;
                        const riid2: REFIID;
                        out ppv: PUnknown): HResult; stdcall;

  end;

  IID_ICallFactory = ICallFactory;


  // Interface IRpcHelper
  // ====================
  //
  PIRpcHelper = ^IRpcHelper;

  IRpcHelper = interface(IUnknown)
    ['{00000149-0000-0000-C000-000000000046}']
    function GetDCOMProtocolVersion(out pComVersion: DWORD): HResult; stdcall;

    function GetIIDFromOBJREF(pObjRef: Pointer;
                              out piid: IID): HResult; stdcall;
  end;

  IID_IRpcHelper = IRpcHelper;


  // Interface IReleaseMarshalBuffers
  // ================================
  //
  PIReleaseMarshalBuffers = ^IReleaseMarshalBuffers;

  IReleaseMarshalBuffers = interface(IUnknown)
    ['{eb0cb9e8-7996-11d2-872e-0000f8080859}']
    function ReleaseMarshalBuffer(var msg: RPCOLEMESSAGE;
                                  dwFlags: DWORD;
                                  pChnl: IUnknown): HResult; stdcall;
  end;

  IID_IReleaseMarshalBuffers = IReleaseMarshalBuffers;


  // Interface IWaitMultiple
  // =======================
  //
  PIWaitMultiple = ^IWaitMultiple;

  IWaitMultiple = interface(IUnknown)
    ['{0000002B-0000-0000-C000-000000000046}']
    function WaitMultiple(timeout: DWORD;
                          out pSync: ISynchronize): HResult; stdcall;

    function AddSynchronize(pSync: ISynchronize): HResult; stdcall;

  end;

  IID_IWaitMultiple = IWaitMultiple;


  // Interface IAddrTrackingControl
  // ==============================
  //
  PIAddrTrackingControl = ^IAddrTrackingControl;

  IAddrTrackingControl = interface(IUnknown)
    ['{00000147-0000-0000-C000-000000000046}']
    function EnableCOMDynamicAddrTracking(): HResult; stdcall;

    function DisableCOMDynamicAddrTracking(): HResult; stdcall;

  end;

  IID_IAddrTrackingControl = IAddrTrackingControl;


  // Interface IAddrExclusionControl
  // ===============================
  //
  PIAddrExclusionControl = ^IAddrExclusionControl;

  IAddrExclusionControl = interface(IUnknown)
    ['{00000148-0000-0000-C000-000000000046}']
    function GetCurrentAddrExclusionList(const riid: REFIID;
                                         out ppEnumerator: Pointer): HResult; stdcall;

    function UpdateAddrExclusionList(pEnumerator: IUnknown): HResult; stdcall;

  end;

  IID_IAddrExclusionControl = IAddrExclusionControl;


  //****************************************************************************
  //* Pipe interfaces
  //****************************************************************************
  // Note: TODO
  //                                                                              \
  //    object,                                                                   \
  //    uuid(iid),                                                                \
  //    PIPE_ASYNC_UUID(async_iid)                                                  \
  //    pointer_default(unique)                                                     \
  //]                                                                               \
  //    interface IPipe##name : IUnknown                                            \
  //    {                                                                           \
  //        HRESULT Pull                                                            \
  //        (                                                                       \
  //            [out, size_is(cRequest), length_is(*pcReturned)] type *buf,         \
  //            [in]  ULONG  cRequest,                                         \
  //            [out] ULONG *pcReturned                                             \
  //        );                                                                      \
  //                                                                                \
  //        HRESULT Push                                                            \
  //        (                                                                       \
  //            [in, size_is(cSent)] type  *buf,                                    \
  //            [in] ULONG cSent                                                    \
  //        );                                                                      \
  //    }
  //
  //NEW_PIPE_INTERFACE( DB2F3ACA-2F86-11d1-8E04-00C04FB9989A,
  //                    DB2F3ACB-2F86-11d1-8E04-00C04FB9989A,
  //                    Byte,
  //                    BYTE)
  //NEW_PIPE_INTERFACE( DB2F3ACC-2F86-11d1-8E04-00C04FB9989A,
  //                    DB2F3ACD-2F86-11d1-8E04-00C04FB9989A,
  //                    Long,
  //                    LONG)
  //NEW_PIPE_INTERFACE( DB2F3ACE-2F86-11d1-8E04-00C04FB9989A,
  //                    DB2F3ACF-2F86-11d1-8E04-00C04FB9989A,
  //                    Double,
  //                    DOUBLE)
  //

  //****************************************************************************
  //* Context related structures and interfaces
  //****************************************************************************/


  PCPFLAGS = ^CPFLAGS;
  CPFLAGS = DWORD;


  PContextProperty = ^tagContextProperty;

  tagContextProperty = record
    policyId: TGUID;
    flags: CPFLAGS;
    pUnk: IUnknown;
  end;
  ContextProperty = tagContextProperty;


  // Interface IEnumContextProps
  // ===========================
  //
  IEnumContextProps = interface(IUnknown)
    ['{000001c1-0000-0000-C000-000000000046}']

    function Next(celt: ULONG;
                  out pContextProperties: ContextProperty;
                  out pceltFetched: ULONG): HResult; stdcall;

    function Skip(celt: ULONG): HResult; stdcall;

    function Reset(): HResult; stdcall;

    function Clone(out ppEnumContextProps: IEnumContextProps): HResult; stdcall;

    function Count(out pcelt: ULONG): HResult; stdcall;

  end;

  IID_IEnumContextProps = IEnumContextProps;


  // Interface IContext
  // ==================
  //
  IContext = interface(IUnknown)
    ['{000001c0-0000-0000-C000-000000000046}']
    function SetProperty(const rpolicyId: REFGUID;
                         flags: CPFLAGS;
                         pUnk: IUnknown): HResult; stdcall;

    function RemoveProperty(const rPolicyId: REFGUID): HResult; stdcall;

    function GetProperty(const rGuid: REFGUID;
                         out pFlags: CPFLAGS;
                         out ppUnk: IUnknown): HResult; stdcall;

    function EnumContextProps(out ppEnumContextProps: IEnumContextProps): HResult; stdcall;

  end;

  IID_IContext = IContext;


  ///////////////////////////////////////////////////////////////////////////////
  //NOTE: This is the section where we define OLE  *PUBLIC ONLY* interfaces. If users need to
  //      use this definition of this interface they will need to define _OBJIDL_PUBLIC in their code.
  ///////////////////////////////////////////////////////////////////////////////

  {$IFDEF _OBJIDL_PUBLIC}
  // IObjContext interface
  // Interface IObjContext
  // =====================
  //
  PIObjContext = ^IObjContext;
  IObjContext = interface(IContext)
  ['{000001c6-0000-0000-C000-000000000046}']
    procedure Reserved1(); stdcall;

    procedure Reserved2(); stdcall;

    procedure Reserved3(); stdcall;

    procedure Reserved4(); stdcall;

    procedure Reserved5(); stdcall;

    procedure Reserved6(); stdcall;

    procedure Reserved7(); stdcall;

  end;
  IID_IObjContext = IObjContext;

  {$ENDIF}


  //****************************************************************************
  //* GetApartmentType  enums
  //****************************************************************************

  PAPTTYPEQUALIFIER = ^_APTTYPEQUALIFIER;
  _APTTYPEQUALIFIER = (
    APTTYPEQUALIFIER_NONE = 0,
                       APTTYPEQUALIFIER_IMPLICIT_MTA = 1,
                       APTTYPEQUALIFIER_NA_ON_MTA = 2,
                       APTTYPEQUALIFIER_NA_ON_STA = 3,
                       APTTYPEQUALIFIER_NA_ON_IMPLICIT_MTA = 4,
                       APTTYPEQUALIFIER_NA_ON_MAINSTA = 5,
                       APTTYPEQUALIFIER_APPLICATION_STA = 6,
                       APTTYPEQUALIFIER_RESERVED_1 = 7);
  APTTYPEQUALIFIER = _APTTYPEQUALIFIER;


  //****************************************************************************
  //* ICOMThreadingInfo and enums
  //****************************************************************************
  PAPTTYPE = ^_APTTYPE;
  _APTTYPE = (
    APTTYPE_CURRENT = -1,
              APTTYPE_STA = 0,
              APTTYPE_MTA = 1,
              APTTYPE_NA = 2,
              APTTYPE_MAINSTA = 3);
  APTTYPE = _APTTYPE;


  PTHDTYPE = ^_THDTYPE;
  _THDTYPE = (
    THDTYPE_BLOCKMESSAGES = 0,
              THDTYPE_PROCESSMESSAGES = 1);
  THDTYPE = _THDTYPE;


  PAPARTMENTID = ^APARTMENTID;
  APARTMENTID = DWORD;


  // Interface IComThreadingInfo
  // ===========================
  //
  PIComThreadingInfo = ^IComThreadingInfo;

  IComThreadingInfo = interface(IUnknown)
    ['{000001ce-0000-0000-C000-000000000046}']
    function GetCurrentApartmentType(out pAptType: APTTYPE): HResult; stdcall;

    function GetCurrentThreadType(out pThreadType: THDTYPE): HResult; stdcall;

    function GetCurrentLogicalThreadId(out pguidLogicalThreadId: TGUID): HResult; stdcall;

    function SetCurrentLogicalThreadId(const rguid: REFGUID): HResult; stdcall;

  end;

  IID_IComThreadingInfo = IComThreadingInfo;


  // Interface IProcessInitControl
  // =============================
  //
  PIProcessInitControl = ^IProcessInitControl;

  IProcessInitControl = interface(IUnknown)
    ['{72380d55-8d2b-43a3-8513-2b6ef31434e9}']
    function ResetInitializerTimeout(const dwSecondsRemaining: DWORD): HResult; stdcall;

  end;

  IID_IProcessInitControl = IProcessInitControl;

  // Interface IFastRundown
  // ======================
  // marker interface for objects that want to opt into the fast rundown feature.
  //
  PIFastRundown = ^IFastRundown;
  IFastRundown = interface(IUnknown)
    ['{00000040-0000-0000-C000-000000000046}']

  end;

  IID_IFastRundown = IFastRundown;


  PCO_MARSHALING_CONTEXT_ATTRIBUTES = ^CO_MARSHALING_CONTEXT_ATTRIBUTES;
  CO_MARSHALING_CONTEXT_ATTRIBUTES = LongInt; // Windows 32-bit enum; aliases and SDK values are preserved.



  // Interface IMarshalingStream
  // ===========================
  //
  PIMarshalingStream = ^IMarshalingStream;

  IMarshalingStream = interface(IStream)
    ['{D8F2F5E6-6102-4863-9F26-389A4676EFDE}']
    function GetMarshalingContextAttribute(attribute: CO_MARSHALING_CONTEXT_ATTRIBUTES;
                                           out pAttributeValue: ULONG_PTR): HResult; stdcall;

  end;

  IID_IMarshalingStream = IMarshalingStream;


  // Interface IAgileReference
  // =========================
  //
  PIAgileReference = ^IAgileReference;

  IAgileReference = interface(IUnknown)
    ['{C03F6A43-65A4-9818-987E-E0B810D2A6F2}']
    function Resolve(const riid: REFIID;
                     out ppvObjectReference): HResult; stdcall;

  end;

  IID_IAgileReference = IAgileReference;


  MachineGlobalObjectTableRegistrationToken__ = record
    unused: Integer;
  end;
  PMachineGlobalObjectTableRegistrationToken = ^MachineGlobalObjectTableRegistrationToken__;
  MachineGlobalObjectTableRegistrationToken = MachineGlobalObjectTableRegistrationToken__;


  // Interface IMachineGlobalObjectTable
  // ===================================
  //
  PIMachineGlobalObjectTable = ^IMachineGlobalObjectTable;

  IMachineGlobalObjectTable = interface(IUnknown)
    ['{26d709ac-f70b-4421-a96f-d2878fafb00d}']
    function RegisterObject(const clsid: REFCLSID;
                            identifier: PWideChar;
                            _object: IUnknown;
                            out token: MachineGlobalObjectTableRegistrationToken): HResult; stdcall;

    function GetObject(const clsid: REFCLSID;
                       identifier: PWideChar;
                       const riid: REFIID;
                       out ppv: Pointer): HResult; stdcall;

    function RevokeObject(token: MachineGlobalObjectTableRegistrationToken): HResult; stdcall;
  end;

  IID_IMachineGlobalObjectTable = IMachineGlobalObjectTable;


  // ISupportAllowLowerTrustActivation - implemented by CLSID_ActivationCapabilities to
  // indicate OS support for CLSCTX_ALLOW_LOWER_TRUST_REGISTRATION.

  PISupportAllowLowerTrustActivation = ^ISupportAllowLowerTrustActivation;
  ISupportAllowLowerTrustActivation = interface(IUnknown)
    ['{e9956ef2-3828-4b4b-8fa9-7db61dee4954}']

  end;

  { 10.0.28000.0  }
  PISupportActivationFromPackage = ^ISupportActivationFromPackage;
  ISupportActivationFromPackage = interface(IUnknown)
    ['{0a18aae5-5caa-48c5-a9f4-6e46dcd58ad5}']
  end;

  IID_ISupportActivationFromPackage = ISupportActivationFromPackage;

  PISupportCoAddComDependencyOnPackage = ^ISupportCoAddComDependencyOnPackage;
  ISupportCoAddComDependencyOnPackage = interface(IUnknown)
    ['{c8059efc-4e98-4fd0-bfc6-44190b80b823}']
  end;

  IID_ISupportCoAddComDependencyOnPackage = ISupportCoAddComDependencyOnPackage;

  PISupportServerMustBeEqualOrGreaterPrivilegeActivation = ^ISupportServerMustBeEqualOrGreaterPrivilegeActivation;
  ISupportServerMustBeEqualOrGreaterPrivilegeActivation = interface(IUnknown)
    ['{5bdb3ee2-46bc-4313-b5fb-801c360ba5f9}']
  end;

  IID_ISupportServerMustBeEqualOrGreaterPrivilegeActivation = ISupportServerMustBeEqualOrGreaterPrivilegeActivation;

  PISupportDoNotElevateServerActivation = ^ISupportDoNotElevateServerActivation;
  ISupportDoNotElevateServerActivation = interface(IUnknown)
    ['{40aefe22-3ff6-43dc-8108-c8c402d57b5c}']
  end;

  IID_ISupportDoNotElevateServerActivation = ISupportDoNotElevateServerActivation;

  PISupportActivateAsActivatorPackaged = ^ISupportActivateAsActivatorPackaged;
  ISupportActivateAsActivatorPackaged = interface(IUnknown)
    ['{765d1df2-f0af-4ef8-aa50-84789ca330ed}']
  end;

  IID_ISupportActivateAsActivatorPackaged = ISupportActivateAsActivatorPackaged;

  PISupportPackagedComRegistrationVisibility = ^ISupportPackagedComRegistrationVisibility;
  ISupportPackagedComRegistrationVisibility = interface(IUnknown)
    ['{8dc3444e-c7ee-449a-9fb8-b9173988d66a}']
  end;

  IID_ISupportPackagedComRegistrationVisibility = ISupportPackagedComRegistrationVisibility;

  PISupportPackagedComElevationEnabledClasses = ^ISupportPackagedComElevationEnabledClasses;
  ISupportPackagedComElevationEnabledClasses = interface(IUnknown)
    ['{b4219019-f712-4d4f-ade7-f468276af0b8}']
  end;

  IID_ISupportPackagedComElevationEnabledClasses = ISupportPackagedComElevationEnabledClasses;

  PIPackagedComSyntaxSupport = ^IPackagedComSyntaxSupport;

  IPackagedComSyntaxSupport = interface(IUnknown)
    ['{8f146474-b228-48fb-a58c-105ebb273abc}']
    function GetSupportedVersion(out supportedVersion: UINT32): HResult; stdcall;
  end;

  IID_IPackagedComSyntaxSupport = IPackagedComSyntaxSupport;

  // Additional Prototypes for ALL interfaces

  // End of Additional Prototypes

implementation

// Implement Additional functions here.

end.
