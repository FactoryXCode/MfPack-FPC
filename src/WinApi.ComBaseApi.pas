// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.ComBaseApi.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 08-07-2012
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: Base Component Object Model defintions.
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
// Remarks:
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
// Source: combaseapi.h
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
unit WinApi.ComBaseApi;

{$I MfPack.Fpc.inc}


interface

uses
  
  {WinApi}
  Windows,
  WinApi.WinApiTypes,
  {ActiveX}
  WinApi.ActiveX.ObjIdlbase,
  WinApi.ActiveX.ObjIdl,
  WinApi.ActiveX.PropIdl;


  {$PACKENUM 4}

  {$IFDEF WIN32}
    {$ALIGN 1}
  {$ELSE}
    {$ALIGN 8} // Win64
  {$ENDIF}


//****** Interface Declaration ***********************************************/

//*
// *      These are macros for declaring interfaces.  They exist so that
// *      a single definition of the interface is simulataneously a proper
// *      declaration of the interface structures (C++ abstract classes)
// *      for both C and C++.
// *
// *      DECLARE_INTERFACE(iface) is used to declare an interface that does
// *      not derive from a base interface.
// *      DECLARE_INTERFACE_(iface, baseiface) is used to declare an interface
// *      that does derive from a base interface.
// *
// *      By default if the source file has a .c extension the C version of
// *      the interface declaratations will be expanded; if it has a .cpp
// *      extension the C++ version will be expanded. if you want to force
// *      the C version expansion even though the source file has a .cpp
// *      extension, then define the macro "CINTERFACE".
// *      eg.     cl -DCINTERFACE file.cpp
// *
// *      Example Interface declaration:
// *
// *          #undef  INTERFACE
// *          #define INTERFACE   IClassFactory
// *
// *          DECLARE_INTERFACE_(IClassFactory, IUnknown)
// *          {
// *              // *** IUnknown methods ***
// *              STDMETHOD(QueryInterface) (THIS_
// *                                        REFIID riid,
// *                                        LPVOID FAR* ppvObj) PURE;
// *              STDMETHOD_(ULONG,AddRef) (THIS) PURE;
// *              STDMETHOD_(ULONG,Release) (THIS) PURE;
// *
// *              // *** IClassFactory methods ***
// *              STDMETHOD(CreateInstance) (THIS_
// *                                        LPUNKNOWN pUnkOuter,
// *                                        REFIID riid,
// *                                        LPVOID FAR* ppvObject) PURE;
// *          };
// *
// *      Example C++ expansion:
// *
// *          struct FAR IClassFactory : public IUnknown
// *          {
// *              virtual HRESULT STDMETHODCALLTYPE QueryInterface(
// *                                                  IID FAR& riid,
// *                                                  LPVOID FAR* ppvObj) = 0;
// *              virtual HRESULT STDMETHODCALLTYPE AddRef(void) = 0;
// *              virtual HRESULT STDMETHODCALLTYPE Release(void) = 0;
// *              virtual HRESULT STDMETHODCALLTYPE CreateInstance(
// *                                              LPUNKNOWN pUnkOuter,
// *                                              IID FAR& riid,
// *                                              LPVOID FAR* ppvObject) = 0;
// *          };
// *
// *          NOTE: Our documentation says '#define interface class' but we use
// *          'struct' instead of 'class' to keep a lot of 'public:' lines
// *          out of the interfaces.  The 'FAR' forces the 'this' pointers to
// *          be far, which is what we need.
// *
// *      Example C expansion:
// *
// *          typedef struct IClassFactory
// *          {
// *              const struct IClassFactoryVtbl FAR* lpVtbl;
// *          } IClassFactory;
// *
// *          typedef struct IClassFactoryVtbl IClassFactoryVtbl;
// *
// *          struct IClassFactoryVtbl
// *          {
// *              HRESULT (STDMETHODCALLTYPE * QueryInterface) (
// *                                                  IClassFactory FAR* This,
// *                                                  IID FAR* riid,
// *                                                  LPVOID FAR* ppvObj) ;
// *              HRESULT (STDMETHODCALLTYPE * AddRef) (IClassFactory FAR* This) ;
// *              HRESULT (STDMETHODCALLTYPE * Release) (IClassFactory FAR* This) ;
// *              HRESULT (STDMETHODCALLTYPE * CreateInstance) (
// *                                                  IClassFactory FAR* This,
// *                                                  LPUNKNOWN pUnkOuter,
// *                                                  IID FAR* riid,
// *                                                  LPVOID FAR* ppvObject);
// *              HRESULT (STDMETHODCALLTYPE * LockServer) (
// *                                                  IClassFactory FAR* This,
// *                                                  BOOL fLock);
// *          };
// */


const

  CLSCTX_INPROC               = (CLSCTX_INPROC_SERVER or CLSCTX_INPROC_HANDLER);

  // With DCOM, CLSCTX_REMOTE_SERVER should be included
  // DCOM
  //#if (_WIN32_WINNT >= 0x0400) || defined(_WIN32_DCOM)

  CLSCTX_ALL                  = (CLSCTX_INPROC_SERVER or
                                 CLSCTX_INPROC_HANDLER or
                                 CLSCTX_LOCAL_SERVER or
                                 CLSCTX_REMOTE_SERVER);


  CLSCTX_SERVER = CLSCTX_INPROC_SERVER or
                  CLSCTX_LOCAL_SERVER or
                  CLSCTX_REMOTE_SERVER;


type
  // class registration flags; passed to CoRegisterClassObject
  PREGCLS = ^tagREGCLS;
  tagREGCLS = DWord;
  REGCLS = tagREGCLS;
const
  REGCLS_SINGLEUSE      = REGCLS(0);  // class object only generates one instance

  REGCLS_MULTIPLEUSE    = REGCLS(1); // same class object genereates multiple inst.
  {$EXTERNALSYM REGCLS_MULTIPLEUSE}  // and local automatically goes into inproc tbl.

  REGCLS_MULTI_SEPARATE = REGCLS(2);    // multiple use, but separate control over each
  {$EXTERNALSYM REGCLS_MULTI_SEPARATE}  // context.

  REGCLS_SUSPENDED      = REGCLS(4);  // register is as suspended, will be activated
  {$EXTERNALSYM REGCLS_SUSPENDED}     // when app calls CoResumeClassObjects

  REGCLS_SURROGATE      = REGCLS(8);  // must be used when a surrogate process
  {$EXTERNALSYM REGCLS_SURROGATE}     // is registering a class object that will be
                                      // loaded in the surrogate

    //#if (NTDDI_VERSION >= NTDDI_WINTHRESHOLD)

  REGCLS_AGILE         = REGCLS($10);  // Class object aggregates the free-threaded marshaler
  {$EXTERNALSYM REGCLS_AGILE}          // and will be made visible to all inproc apartments.
                                       // Can be used together with other flags - for example,
                                       // REGCLS_AGILE | REGCLS_MULTIPLEUSE to register a
                                       // class object that can be used multiple times from
                                       // different apartments. Without other flags, behavior
                                       // will retain REGCLS_SINGLEUSE semantics in that only
                                       // one instance can be generated.



  //* here is where we pull in the MIDL generated headers for the interfaces */

  // from ObjIdl.pas
  //PIRpcStubBuffer = ^IRpcStubBuffer;
  //IRpcStubBuffer = interface;
  //PIRpcChannelBuffer = ^IRpcChannelBuffer;
  //IRpcChannelBuffer = interface;


  // COM initialization flags; passed to CoInitialize.
type
  PCOINITBASE = ^tagCOINITBASE;
  tagCOINITBASE  = DWord;
  COINITBASE = tagCOINITBASE;
const
  // These constants are only valid on Windows NT 4.0
  COINITBASE_MULTITHREADED      = COINITBASE($0); // OLE calls objects on any thread.


  //****** STD Object API Prototypes *****************************************/


  function CoGetMalloc(dwMemContext: DWORD;
                       out malloc: IMalloc): HResult; stdcall;

  function CreateStreamOnHGlobal(_hglobal: HGLOBAL;
                                 fDeleteOnRelease: BOOL;
                                 out stm: IStream): HResult; stdcall;

  function GetHGlobalFromStream(stm: IStream;
                                out hglob: HGlobal): HResult; stdcall;

  //* init/uninit */

  procedure CoUninitialize(); stdcall;

  function CoGetCurrentProcess(): DWORD; stdcall;

  function CoInitializeEx(pvReserved: Pointer;
                          dwCoInit: LongInt): HResult; stdcall;

  function CoGetCallerTID(out lpdwTID: DWORD): HResult; stdcall;

  function CoGetCurrentLogicalThreadId(out pguid: TGUID): HResult; stdcall;

//#if (_WIN32_WINNT >= 0x0501)
  function CoGetContextToken(out pToken: ULONG_PTR): HResult; stdcall;

  function CoGetDefaultContext(aptType: APTTYPE;
                               const riid: TGUID;
                               out ppv): HResult; stdcall;

  // definition for Win7 new APIs
  //#if (NTDDI_VERSION >= NTDDI_WIN7)

  function CoGetApartmentType(out pAptType: APTTYPE;
                              out pAptQualifier: APTTYPEQUALIFIER): HResult; stdcall;

  // definition for Win8 new APIs
  //#if (NTDDI_VERSION >= NTDDI_WIN8)

type

  PServerInformation = ^tagServerInformation;
  tagServerInformation = record
    dwServerPid: DWORD;
    dwServerTid: DWORD;
    ui64ServerAddress: UINT64;
  end;
  ServerInformation = tagServerInformation;


  function CoDecodeProxy(const dwClientPid: DWORD;
                         ui64ProxyAddress: UINT64;
                         out pServerInformation: ServerInformation): HResult; stdcall;


type
  CO_MTA_USAGE_COOKIE = THandle;

  function CoIncrementMTAUsage(out pCookie: CO_MTA_USAGE_COOKIE): HResult; stdcall;

  function CoAllowUnmarshalerCLSID(const clsid: TGUID): HResult; stdcall;

  function CoGetObjectContext(const riid: TGUID;
                              out ppv): HResult; stdcall;

  //* register/revoke/get class objects */

  function CoGetClassObject(const rclsid: TGUID;
                            dwClsContext: DWORD;
                            pvReserved: Pointer;
                            const riid: TGUID;
                            out ppv): HResult; stdcall;

  function CoRegisterClassObject(const rclsid: TGUID;
                                 pUnk: PUNKNOWN;
                                 dwClsContext: DWORD;
                                 flags: DWORD;
                                 out lpdwRegister: DWORD): HResult; stdcall;

  function CoRevokeClassObject(dwRegister: DWORD): HResult; stdcall;

  function CoResumeClassObjects(): HResult; stdcall;

  function CoSuspendClassObjects(): HResult; stdcall;

  // Returns the current reference count.
  function CoAddRefServerProcess(): ULONG; stdcall;

  function CoReleaseServerProcess(): HResult; stdcall;

  function CoGetPSClsid(const riid: TGUID;
                        out pClsid: TGUID): HResult; stdcall;

  function CoRegisterPSClsid(const riid: TGUID;
                             const rclsid: TGUID): HResult; stdcall;


  // Registering surrogate processes
  function CoRegisterSurrogate(pSurrogate: LPSURROGATE): HResult; stdcall;


  //* marshaling interface pointers *//

  function CoGetMarshalSizeMax(out pulSize: ULONG;
                               const riid: TGUID;
                               const pUnk: IUnknown;
                               dwDestContext: DWORD;
                               pvDestContext: Pointer;
                               mshlflags: DWORD): HResult; stdcall;

  function CoMarshalInterface(stm: IStream;
                              const iid: TGUID;
                              punk: IUnknown;
                              dwDestContext: DWORD;
                              pvDestContext: Pointer;
                              mshlflags: DWORD): HResult; stdcall;

  function CoUnmarshalInterface(stm: IStream;
                                const iid: TGUID;
                                out ppv): HResult; stdcall;

  function CoMarshalHresult(pstm: LPSTREAM;
                            _hresult: HResult): HResult; stdcall;

  function CoUnmarshalHResult(pstm: IStream;
                              out phresult: HResult): HResult; stdcall;

  function CoReleaseMarshalData(pstm: IStream): HResult; stdcall;

  function CoDisconnectObject(punk: IUnknown; {LPUNKNOWN}
                              dwReserved: DWORD): HResult; stdcall;

  function CoLockObjectExternal(punk: IUnknown;
                                fLock: BOOL;
                                fLastUnlockReleases: BOOL): HResult; stdcall;

  function CoGetStandardMarshal(const iid: TGUID;
                                {In_opt} punk: IUnknown; {LPUNKNOWN}
                                dwDestContext: DWORD;
                                pvDestContext: Pointer;
                                mshlflags: DWORD;
                                out marshal: IMarshal): HResult; stdcall;

  function CoGetStdMarshalEx(pUnkOuter: IUnknown; {LPUNKNOWN}
                             smexflags: DWORD;
                             out ppUnkInner: IUnknown {PLPUNKNOWN}): HResult; stdcall;

type
  //* flags for CoGetStdMarshalEx *//
  PSTDMSHLFLAGS = ^tagSTDMSHLFLAGS;
  tagSTDMSHLFLAGS = (
    SMEXF_SERVER  = $01,           // server side aggregated std marshaler
    SMEXF_HANDLER = $02            // client side (handler) agg std marshaler
  );
  STDMSHLFLAGS = tagSTDMSHLFLAGS;

  function CoIsHandlerConnected(pUnk: IUnknown): BOOL; stdcall;

  // Apartment model inter-thread interface passing helpers

  function CoMarshalInterThreadInterfaceInStream(const riid: TGUID;
                                                 pUnk: IUnknown;
                                                 out ppStm: IStream): HResult; stdcall;

  function CoGetInterfaceAndReleaseStream(pStm: IStream;
                                          const iid: TGUID;
                                          out ppv): HResult; stdcall;

  function CoCreateFreeThreadedMarshaler(punkOuter: IUnknown;
                                         out ppunkMarshal: IUnknown): HResult; stdcall;


  procedure CoFreeUnusedLibraries(); stdcall;

  procedure CoFreeUnusedLibrariesEx(dwUnloadDelay: DWORD;
                                    dwReserved: DWORD); stdcall;

  //#if (_WIN32_WINNT >= 0x0600)

  function CoDisconnectContext(dwTimeout: DWORD): HResult; stdcall;


  //* Call Security. *//
  function CoInitializeSecurity(pSecDesc: Pointer;
                                cAuthSvc: LONG;
                                asAuthSvc: SOLE_AUTHENTICATION_SERVICE;
                                pReserved1: Pointer;
                                dwAuthnLevel: DWORD;
                                dImpLevel: DWORD;
                                pAuthList: Pointer;
                                dwCapabilities: DWORD;
                                pReserved3: Pointer): HResult; stdcall;


  function CoGetCallContext(const riid: TGUID;
                            ppInterface: Pointer): HResult; stdcall;

  function CoQueryProxyBlanket(Proxy: IUnknown;
                               pwAuthnSvc: PDWORD;
                               pAuthzSvc: PDWORD;
                               pServerPrincName: PPOLESTR;
                               pAuthnLevel: PDWORD;
                               pImpLevel: PDWORD;
                               pAuthInfo: Pointer;
                               pCapabilites: PDWORD): HResult; stdcall;

  function CoSetProxyBlanket(pProxy: IUnknown;
                             dwAuthnSvc: DWORD;
                             dwAuthzSvc: DWORD;
                             pServerPrincName: POLESTR;
                             dwAuthnLevel: DWORD;
                             dwImpLevel: DWORD;
                             pAuthInfo: Pointer;
                             dwCapabilites: DWORD): HResult; stdcall;

  function CoCopyProxy(pProxy: IUnknown;
                       out ppCopy: IUnknown): HResult; stdcall;

  function CoQueryClientBlanket(pwAuthnSvc: PDWORD;
                                pAuthzSvc: PDWORD;
                                pServerPrincName: PPOLESTR;
                                var dwAuthnLevel: DWORD;
                                dwImpLevel: DWORD;
                                pPrivs: Pointer;
                                var dwCapabilites: DWORD): HResult; stdcall;

  function CoImpersonateClient(): HResult; stdcall;

  function CoRevertToSelf(): HResult; stdcall;

  function CoQueryAuthenticationServices(pcAuthSvc: PDWORD;
                                         asAuthSvc: PSOLE_AUTHENTICATION_SERVICE): HResult; stdcall;

  function CoSwitchCallContext(NewObject: IUnknown;
                               out pOldObject: IUnknown): HResult; stdcall;


const

  COM_RIGHTS_EXECUTE                  = 1;
  COM_RIGHTS_EXECUTE_LOCAL            = 2;
  COM_RIGHTS_EXECUTE_REMOTE           = 4;
  COM_RIGHTS_ACTIVATE_LOCAL           = 8;
  COM_RIGHTS_ACTIVATE_REMOTE          = 16;
  COM_RIGHTS_RESERVED1                = 32;
  COM_RIGHTS_RESERVED2                = 64;


  //* helper for creating instances *//

  function CoCreateInstance(const rclsid: TGUID;
                            unkOuter: IUnknown;
                            dwClsContext: Longint;
                            const riid: TGUID;
                            out ppv): HResult; stdcall;

  function CoCreateInstanceEx(const Clsid: TGUID;
                              punkOuter: IUnknown;
                              dwClsCtx: Longint;
                              pServerInfo: PCoServerInfo;
                              dwCount: Longint;
                              pResults: PMULTI_QI {An array of MULTI_QI structures}): HResult; stdcall;

  // Registers a process-wide filter to process activation requests.
  function CoRegisterActivationFilter(pActivationFilter: IActivationFilter): HResult; stdcall;

  //#if (_WIN32_WINNT >= 0x0602)

  function CoCreateInstanceFromApp(const Clsid: TGUID;
                                   punkOuter: IUnknown;
                                   dwClsCtx: DWORD;
                                   reserved: Pointer;
                                   dwCount: DWORD;
                                   pResults: PMULTI_QI {An array of MULTI_QI structures}): HResult; stdcall;




  //* Call related APIs *//
  // DCOM

  function CoGetCancelObject(dwThreadId: DWORD;
                             const iid: TGUID;
                             out ppUnk: Pointer): HResult; stdcall;

  function CoSetCancelObject(pUnk: IUnknown): HResult; stdcall;

  function CoCancelCall(dwThreadId: DWORD;
                        ulTimeout: ULONG): HResult; stdcall;

  function CoTestCancel(): HResult; stdcall;

  function CoEnableCallCancellation(pReserved: Pointer): HResult; stdcall;

  function CoDisableCallCancellation(pReserved: Pointer): HResult; stdcall;


  //* other helpers *

  function StringFromCLSID(const clsid: TGUID;
                           out lpsz: POlESTR): HResult; stdcall;

  function CLSIDFromString(lpsz: LPWSTR; //POlESTR;
                           out pclsid: TGUID): HResult; stdcall;

  function StringFromIID(const rclsid: TGUID;
                         out lplpsz: POlESTR): HResult; stdcall;

  function IIDFromString(lpsz: POlESTR;
                         out lpiid: TGUID): HResult; stdcall;


  function ProgIDFromCLSID(const clsid: TGUID;
                           out lplpszProgID: POlESTR): HResult; stdcall;

  function CLSIDFromProgID(lpszProgID: POlESTR;
                           out lpclsid: TGUID): HResult; stdcall;

  function StringFromGUID2(const rguid: TGUID;
                           lpsz: POleStr;
                           cchMax: Integer): Integer; stdcall;

  function CoCreateGuid(out pguid: TGUID): HResult; stdcall;


  //* Prop variant support *//

  // NOTE: These functions are also declared in PropIdl.pas !

  function PropVariantCopy(out pvarDest: PROPVARIANT;
                           const pvarSrc: PROPVARIANT): HResult; stdcall;

  function PropVariantClear(var pvar: PROPVARIANT): HResult; stdcall;

  function FreePropVariantArray(cVariants: ULONG;
                                rgvars: PPROPVARIANT): HResult; stdcall;

  // NOTE: This function is also declared in PropVarUtil.pas!
  procedure PropVariantInit(var pvar: PROPVARIANT); inline;


  // Waits for specified handles to be signaled or for a specified timeout period to elapse.
  function CoWaitForMultipleHandles(dwFlags: DWORD;
                                    dwTimeout: DWORD;
                                    cHandles: ULONG;
                                    pHandles: PHANDLE;     // array of handles
                                    out lpdwindex: DWORD): HResult; stdcall;




  //* Flags for Synchronization API and Classes *//
type
  PCOWAIT_FLAGS = ^tagCOWAIT_FLAGS;
  tagCOWAIT_FLAGS = DWord;
  COWAIT_FLAGS = tagCOWAIT_FLAGS;
const
  COWAIT_DEFAULT                  = COWAIT_FLAGS(0);
  COWAIT_WAITALL                  = COWAIT_FLAGS(1);
  COWAIT_ALERTABLE                = COWAIT_FLAGS(2);
  COWAIT_INPUTAVAILABLE           = COWAIT_FLAGS(4);
  COWAIT_DISPATCH_CALLS           = COWAIT_FLAGS(8);
  COWAIT_DISPATCH_WINDOW_MESSAGES = COWAIT_FLAGS($10);

//#if (NTDDI_VERSION >= NTDDI_WIN8)
type
  PCWMO_FLAGS = ^CWMO_FLAGS;
  PCwmoFlags = ^TCwmoFlags;
  CWMO_FLAGS = DWord;
  TCwmoFlags = CWMO_FLAGS;
const
  CWMO_DEFAULT                  = CWMO_FLAGS(0);
  CWMO_DISPATCH_CALLS           = CWMO_FLAGS(1);
  CWMO_DISPATCH_WINDOW_MESSAGES = CWMO_FLAGS(2);


  function CoWaitForMultipleObjects(dwFlags: DWORD;
                                    dwTimeout: DWORD;
                                    cHandles: ULONG;
                                    pHandles: PHandle; // pointer to array of handles
                                    out lpdwindex: DWORD): HResult; stdcall;


//#endif // (NTDDI_VERSION >= NTDDI_WIN8)

const

  CWMO_MAX_HANDLES                    = 56;

  function CoGetTreatAsClass(const clsidOld: TGUID;
                             out clsidNew: TGUID): HResult; stdcall;

  function CoTreatAsClass(const clsidOld: TGUID;
                          const clsidNew: TGUID): HResult; stdcall;



  //* for flushing OLESCM remote binding handles *//
  //#if (_WIN32_WINNT >= 0x0501)

  function CoInvalidateRemoteMachineBindings(pszMachineName: POLESTR): HResult; stdcall;

  //#if (NTDDI_VERSION >= NTDDI_WINBLUE)


type
  PAgileReferenceOptions = ^AgileReferenceOptions;
  AgileReferenceOptions = DWord;
const
  AGILEREFERENCE_DEFAULT        = AgileReferenceOptions(0);
  AGILEREFERENCE_DELAYEDMARSHAL = AgileReferenceOptions(1);


  function RoGetAgileReference(options: AgileReferenceOptions;
                               const riid: TGUID;
                               pUnk: IUnknown;
                               out ppAgileReference: IAgileReference): HResult; stdcall;



type

  //* the server dlls must define their DllGetClassObject and DllCanUnloadNow
  //* to match these; the typedefs are located here to ensure all are changed at
  //* the same time.
  //*

  DLLGetClassObject = function(const rclsid: TGUID;
                               const riid: TGUID;
                               out ppv): HResult; stdcall;

  DLLCanUnloadNow = function(): HResult; stdcall;


  //****** Default Memory Allocation *****************************************//

  function CoTaskMemAlloc(cb: SIZE_T): Pointer; stdcall;

  function CoTaskMemRealloc(ppv: Pointer;
                            cb: SIZE_T): Pointer; stdcall;

  procedure CoTaskMemFree(ppv: Pointer); stdcall;



  function CoFileTimeNow(out filetime: FILETIME): HResult; stdcall;

  function CLSIDFromProgIDEx(lpszProgID: POLESTR;
                             out lpclsid: PGUID): HResult; stdcall;

// NTDDI_VERSION >= NTDDI_WIN10_VB

{$IFNDEF _CO_DEVICE_CATALOG_}
{$DEFINE _CO_DEVICE_CATALOG_}
{$ENDIF}

type
  CO_DEVICE_CATALOG_COOKIE = THandle;

  function CoRegisterDeviceCatalog(deviceInstanceId: PWideChar;
                                   out cookie: CO_DEVICE_CATALOG_COOKIE): HResult; stdcall;

  function CoRevokeDeviceCatalog(cookie: CO_DEVICE_CATALOG_COOKIE): HResult; stdcall;

// end NTDDI_VERSION >= NTDDI_WIN10_VB


  // Additional Prototypes for ALL interfaces

  // End of Additional Prototypes

implementation

const
  ole32Lib = 'ole32.dll';


procedure PropVariantInit(var pvar: PROPVARIANT); inline;
begin
  FillChar(pvar,
           sizeof(PROPVARIANT),
           0);
end;


function CoGetMalloc;                   external Ole32Lib name 'CoGetMalloc' ;
function CreateStreamOnHGlobal;         external Ole32Lib name 'CreateStreamOnHGlobal' ;
function GetHGlobalFromStream;          external Ole32Lib name 'GetHGlobalFromStream' ;
procedure CoUninitialize;               external Ole32Lib name 'CoUninitialize' ;
function CoGetCurrentProcess;           external Ole32Lib name 'CoGetCurrentProcess' ;
function CoInitializeEx;                external Ole32Lib name 'CoInitializeEx' {delayed};
function CoGetCallerTID;                external Ole32Lib name 'CoGetCallerTID' ;
function CoGetCurrentLogicalThreadId;   external Ole32Lib name 'CoGetCurrentLogicalThreadId' ;
function CoGetContextToken;             external Ole32Lib name 'CoGetContextToken' ;
function CoGetDefaultContext;           external Ole32Lib name 'CoGetDefaultContext' ;
function CoGetApartmentType;            external Ole32Lib name 'CoGetApartmentType' ;
function CoDecodeProxy;                 external Ole32Lib name 'CoDecodeProxy' ;
function CoIncrementMTAUsage;           external Ole32Lib name 'CoIncrementMTAUsage' ;
function CoAllowUnmarshalerCLSID;       external Ole32Lib name 'CoAllowUnmarshalerCLSID' ;
function CoGetObjectContext;            external Ole32Lib name 'CoGetObjectContext' ;
function CoGetClassObject;              external Ole32Lib name 'CoGetClassObject' ;
function CoRegisterClassObject;         external Ole32Lib name 'CoRegisterClassObject' ;
function CoRevokeClassObject;           external Ole32Lib name 'CoRevokeClassObject' ;
function CoResumeClassObjects;          external Ole32Lib name 'CoResumeClassObjects' ;
function CoSuspendClassObjects;         external Ole32Lib name 'CoSuspendClassObjects' ;
function CoAddRefServerProcess;         external Ole32Lib name 'CoAddRefServerProcess' ;
function CoReleaseServerProcess;        external Ole32Lib name 'CoReleaseServerProcess' ;
function CoGetPSClsid;                  external Ole32Lib name 'CoGetPSClsid' ;
function CoRegisterPSClsid;             external Ole32Lib name 'CoRegisterPSClsid' ;
function CoRegisterSurrogate;           external Ole32Lib name 'CoRegisterSurrogate' ;
function CoGetMarshalSizeMax;           external Ole32Lib name 'CoGetMarshalSizeMax' ;
function CoMarshalInterface;            external Ole32Lib name 'CoMarshalInterface' ;
function CoUnmarshalInterface;          external Ole32Lib name 'CoUnmarshalInterface' ;
function CoMarshalHResult;              external Ole32Lib name 'CoMarshalHResult' ;
function CoUnmarshalHResult;            external Ole32Lib name 'CoUnmarshalHResult' ;
function CoReleaseMarshalData;          external Ole32Lib name 'CoReleaseMarshalData' ;
function CoDisconnectObject;            external Ole32Lib name 'CoDisconnectObject' ;
function CoLockObjectExternal;          external Ole32Lib name 'CoLockObjectExternal' ;
function CoGetStandardMarshal;          external Ole32Lib name 'CoGetStandardMarshal' ;
function CoGetStdMarshalEx;             external Ole32Lib name 'CoGetStdMarshalEx' ;
function CoIsHandlerConnected;          external Ole32Lib name 'CoIsHandlerConnected' ;
function CoMarshalInterThreadInterfaceInStream; external Ole32Lib name 'CoMarshalInterThreadInterfaceInStream' ;
function CoGetInterfaceAndReleaseStream; external Ole32Lib name 'CoGetInterfaceAndReleaseStream' ;
function CoCreateFreeThreadedMarshaler; external Ole32Lib name 'CoCreateFreeThreadedMarshaler' ;
procedure CoFreeLibrary;                external Ole32Lib name 'CoFreeLibrary' ;
procedure CoFreeAllLibraries;           external Ole32Lib name 'CoFreeAllLibraries' ;
procedure CoFreeUnusedLibraries;        external Ole32Lib name 'CoFreeUnusedLibraries' ;
procedure CoFreeUnusedLibrariesEx;      external Ole32Lib name 'CoFreeUnusedLibrariesEx' ;
function CoDisconnectContext;           external Ole32Lib name 'CoDisconnectContext' ;
function CoInitializeSecurity;          external Ole32Lib name 'CoInitializeSecurity' ;
function CoGetCallContext;              external Ole32Lib name 'CoGetCallContext' ;
function CoQueryProxyBlanket;           external Ole32Lib name 'CoQueryProxyBlanket' ;
function CoSetProxyBlanket;             external Ole32Lib name 'CoSetProxyBlanket' ;
function CoCopyProxy;                   external Ole32Lib name 'CoCopyProxy' ;
function CoQueryClientBlanket;          external Ole32Lib name 'CoQueryClientBlanket' ;
function CoImpersonateClient;           external Ole32Lib name 'CoImpersonateClient' ;
function CoRevertToSelf;                external Ole32Lib name 'CoRevertToSelf' ;
function CoQueryAuthenticationServices; external Ole32Lib name 'CoQueryAuthenticationServices' ;
function CoSwitchCallContext;           external Ole32Lib name 'CoSwitchCallContext' ;
function CoCreateInstance;              external Ole32Lib name 'CoCreateInstance' ;
function CoCreateInstanceEx;            external Ole32Lib name 'CoCreateInstanceEx' ;
function CoCreateInstanceFromApp;       external Ole32Lib name 'CoCreateInstanceFromApp' ;
function CoGetCancelObject;             external Ole32Lib name 'CoGetCancelObject' ;
function CoSetCancelObject;             external Ole32Lib name 'CoSetCancelObject' ;
function CoCancelCall;                  external Ole32Lib name 'CoCancelCall' ;
function CoTestCancel;                  external Ole32Lib name 'CoTestCancel' ;
function CoEnableCallCancellation;      external Ole32Lib name 'CoEnableCallCancellation' ;
function CoDisableCallCancellation;     external Ole32Lib name 'CoDisableCallCancellation' ;
function CoRegisterActivationFilter;    external Ole32Lib name 'CoRegisterActivationFilter' ;
function StringFromCLSID;               external Ole32Lib name 'StringFromCLSID' ;
function CLSIDFromString;               external Ole32Lib name 'CLSIDFromString' ;
function StringFromIID;                 external Ole32Lib name 'StringFromIID' ;
function IIDFromString;                 external Ole32Lib name 'IIDFromString' ;
function ProgIDFromCLSID;               external Ole32Lib name 'ProgIDFromCLSID' ;
function CLSIDFromProgID;               external Ole32Lib name 'CLSIDFromProgID' ;
function StringFromGUID2;               external Ole32Lib name 'StringFromGUID2' ;
function CoCreateGuid;                  external Ole32Lib name 'CoCreateGuid' ;
function PropVariantCopy;               external Ole32Lib name 'PropVariantCopy' ;
function PropVariantClear;              external Ole32Lib name 'PropVariantClear' ;
function FreePropVariantArray;          external Ole32Lib name 'FreePropVariantArray' ;
function CoWaitForMultipleHandles;      external Ole32Lib name 'CoWaitForMultipleHandles' ;
function CoWaitForMultipleObjects;      external Ole32Lib name 'CoWaitForMultipleObjects' ;
function CoInvalidateRemoteMachineBindings; external Ole32Lib name 'CoInvalidateRemoteMachineBindings' ;
function RoGetAgileReference;           external Ole32Lib name 'RoGetAgileReference' ;
function CoFileTimeNow;                 external Ole32Lib name 'CoFileTimeNow' ;
function CLSIDFromProgIDEx;             external Ole32Lib name 'CLSIDFromProgIDEx' ;
function CoGetTreatAsClass;             external Ole32Lib name 'CoGetTreatAsClass' ;
function CoTreatAsClass;                external Ole32Lib name 'CoTreatAsClass' ;
function CoTaskMemAlloc;                external Ole32Lib name 'CoTaskMemAlloc' ;
function CoTaskMemRealloc;              external Ole32Lib name 'CoTaskMemRealloc' ;
procedure CoTaskMemFree;                external Ole32Lib name 'CoTaskMemFree' ;

function CoRegisterDeviceCatalog;       external Ole32Lib name 'CoRegisterDeviceCatalog' ;
function CoRevokeDeviceCatalog;         external Ole32Lib name 'CoRevokeDeviceCatalog' ;



  // Implement Additional functions here.


end.
