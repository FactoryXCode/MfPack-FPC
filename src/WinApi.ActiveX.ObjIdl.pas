// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.ActiveX.ObjIdl.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 13-02-2016
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: Variant and PropVariant helpers.
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
// Source: ObjIdl.idl
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
unit WinApi.ActiveX.ObjIdl;

{$I MfPack.Fpc.inc}


interface

uses

  {WinApi}
  Windows,
  WinApi.WinApiTypes,
  {ActiveX}
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
  MKRREDUCE_ONE = LongInt(3 shl 16);
  MKRREDUCE_TOUSER = LongInt(2 shl 16);
  MKRREDUCE_THROUGHUSER = LongInt(1 shl 16);
  MKRREDUCE_ALL = LongInt(0);
  ADVF_NODATA = LongInt(1);
  ADVF_PRIMEFIRST = LongInt(2);
  ADVF_ONLYONCE = LongInt(4);
  ADVF_DATAONSTOP = LongInt(64);
  ADVFCACHE_NOHANDLER = LongInt(8);
  ADVFCACHE_FORCEBUILTIN = LongInt(16);
  ADVFCACHE_ONSAVE = LongInt(32);
  TYMED_HGLOBAL = LongInt(1);
  TYMED_FILE = LongInt(2);
  TYMED_ISTREAM = LongInt(4);
  TYMED_ISTORAGE = LongInt(8);
  TYMED_GDI = LongInt(16);
  TYMED_MFPICT = LongInt(32);
  TYMED_ENHMF = LongInt(64);
  TYMED_NULL = LongInt(0);


const

  //
  //  wireSTGMEDIUM
  //
  // These flags are #defined (not enumerated) in wingdi.
  // We need to repeat #defines to avoid conflict in the generated file.
  //

  //* Object Definitions for EnumObjects() *//
  OBJ_PEN = 1;
  OBJ_BRUSH = 2;
  OBJ_DC = 3;
  OBJ_METADC = 4;
  OBJ_PAL = 5;
  OBJ_FONT = 6;
  OBJ_BITMAP = 7;
  OBJ_REGION = 8;
  OBJ_METAFILE = 9;
  OBJ_MEMDC = 10;
  OBJ_EXTPEN = 11;
  OBJ_ENHMETADC = 12;
  OBJ_ENHMETAFILE = 13;

  // Well-known Property Set Format IDs
  FMTID_SummaryInformation: TGuid = '{F29F85E0-4FF9-1068-AB91-08002B27B3D9}';
  FMTID_DocSummaryInformation: TGuid = '{D5CDD502-2E9C-101B-9397-08002B2CF9AE}';
  FMTID_UserDefinedProperties: TGuid = '{D5CDD505-2E9C-101B-9397-08002B2CF9AE}';
  FMTID_DiscardableInformation: TGuid = '{D725EBB0-C9B8-111D-89BC-0000F804B057}';
  FMTID_ImageSummaryInformation: TGuid = '{6444048F-4C8B-111D-8B70-080036B11A03}';
  FMTID_AudioSummaryInformation: TGuid = '{64440490-4C8B-111D-8B70-080036B11A03}';
  FMTID_VideoSummaryInformation: TGuid = '{64440491-4C8B-111D-8B70-080036B11A03}';
  FMTID_MediaFileSummaryInformation: TGuid = '{64440492-4C8B-111D-8B70-080036B11A03}';



type

  // Forward Interface declarations

  PIMallocSpy = ^IMallocSpy;
  LPMALLOCSPY = ^IMallocSpy;
  IMallocSpy = interface;

  PIBindCtx = ^IBindCtx;
  LPBC = ^IBindCtx;
  LPBINDCTX = ^IBindCtx;
  IBindCtx = interface;

  PIEnumMoniker = ^IEnumMoniker;
  LPENUMMONIKER = ^IEnumMoniker;
  IEnumMoniker = interface;

  PIRunnableObject = ^IRunnableObject;
  LPRUNNABLEOBJECT = ^IRunnableObject;
  IRunnableObject = interface;

  PIRunningObjectTable = ^IRunningObjectTable;
  LPRUNNINGOBJECTTABLE = ^IRunningObjectTable;
  IRunningObjectTable = interface;

  PIPersist = ^IPersist;
  LPPERSIST = ^IPersist;
  IPersist = interface;

  PIPersistStream = ^IPersistStream;
  LPPERSISTSTREAM = ^IPersistStream;
  IPersistStream = interface;

  PIMoniker = ^IMoniker;
  LPMONIKER = ^IMoniker;
  IMoniker = interface;

  PIEnumSTATSTG = ^IEnumSTATSTG;
  LPENUMSTATSTG = ^IEnumSTATSTG;
  IEnumSTATSTG = interface;

  PIStorage = ^IStorage;
  LPSTORAGE = ^IStorage;
  IStorage = interface;

  PIPersistFile = ^IPersistFile;
  LPPERSISTFILE = ^IPersistFile;
  IPersistFile = interface;

  PIPersistStorage = ^IPersistStorage;
  LPPERSISTSTORAGE = ^IPersistStorage;
  IPersistStorage = interface;

  PILockBytes = ^ILockBytes;
  LPLOCKBYTES = ^ILockBytes;
  ILockBytes = interface;

  PIEnumFORMATETC = ^IEnumFORMATETC;
  LPENUMFORMATETC = ^IEnumFORMATETC;
  IEnumFORMATETC = interface;

  PIEnumSTATDATA = ^IEnumSTATDATA;
  LPENUMSTATDATA = ^IEnumSTATDATA;
  IEnumSTATDATA = interface;

  PIRootStorage = ^IRootStorage;
  LPROOTSTORAGE = ^IRootStorage;
  IRootStorage = interface;

  PIAdviseSink = ^IAdviseSink;
  LPADVISESINK = ^IAdviseSink;
  IAdviseSink = interface;

  PIAdviseSink2 = ^IAdviseSink2;
  LPADVISESINK2 = ^IAdviseSink2;
  IAdviseSink2 = interface;

  PIDataObject = ^IDataObject;
  LPDATAOBJECT = ^IDataObject;
  IDataObject = interface;

  PIMessageFilter = ^IMessageFilter;
  LPMESSAGEFILTER = ^IMessageFilter;
  IMessageFilter = interface;

  PIConnectionPoint = ^IConnectionPoint;
  PCONNECTIONPOINT = ^IConnectionPoint;
  LPCONNECTIONPOINT = ^IConnectionPoint;
  IConnectionPoint = interface;

  PIConnectionPointContainer = ^IConnectionPointContainer;
  PCONNECTIONPOINTCONTAINER = ^IConnectionPointContainer;
  LPCONNECTIONPOINTCONTAINER = ^IConnectionPointContainer;
  IConnectionPointContainer = interface;

  PIEnumConnections = ^IEnumConnections;
  LPENUMCONNECTIONS = ^IEnumConnections;
  IEnumConnections = interface;

  PIEnumConnectionPoints = ^IEnumConnectionPoints;
  PENUMCONNECTIONPOINTS = ^IEnumConnectionPoints;
  LPENUMCONNECTIONPOINTS = ^IEnumConnectionPoints;
  IEnumConnectionPoints = interface;

  PIInitializeSpy = ^IInitializeSpy;
  LPINITIALIZESPY = ^IInitializeSpy;
  IInitializeSpy = interface;



  // Interface IMallocSpy
  // ====================
  //
  IMallocSpy = interface(IUnknown)
    ['{0000001d-0000-0000-C000-000000000046}']
    function PreAlloc(cbRequest: DWORD): DWORD; stdcall;

    function PostAlloc(pActual: Pointer): Pointer; stdcall;

    function PreFree(pRequest: Pointer;
                     fSpyed: BOOL): Pointer; stdcall;

    procedure PostFree(fSpyed: BOOL); stdcall;

    function PreRealloc(pRequest: Pointer;
                        cbRequest: Longint;
                        out ppNewRequest: Pointer;
                        fSpyed: BOOL): DWORD; stdcall;

    function PostRealloc(pActual: Pointer;
                         fSpyed: BOOL): Pointer; stdcall;

    function PreGetSize(pRequest: Pointer;
                        fSpyed: BOOL): Pointer; stdcall;

    function PostGetSize(pActual: DWORD;
                         fSpyed: BOOL): DWORD; stdcall;

    function PreDidAlloc(pRequest: Pointer;
                         fSpyed: BOOL): Pointer; stdcall;

    function PostDidAlloc(pRequest: Pointer;
                          fSpyed: BOOL;
                          fActual: INT): INT; stdcall;

    procedure PreHeapMinimize(); stdcall;

    procedure PostHeapMinimize(); stdcall;
  end;

  IID_IMallocSpy = IMallocSpy;


  //****************************************************************************
  //*  Binding Interfaces
  //****************************************************************************

  PBIND_OPTS = ^tagBIND_OPTS;

  tagBIND_OPTS = record
    cbStruct: Longint;
    grfFlags: Longint;
    grfMode: Longint;
    dwTickCountDeadline: Longint;
  end;
  BIND_OPTS = tagBIND_OPTS;


  // Interface IBindCtx
  // ==================
  //
  IBindCtx = interface(IUnknown)
    ['{0000000e-0000-0000-C000-000000000046}']
    function RegisterObjectBound(unk: IUnknown): HResult; stdcall;

    function RevokeObjectBound(unk: IUnknown): HResult; stdcall;

    function ReleaseBoundObjects(): HResult; stdcall;

    function SetBindOptions(bindopts: BIND_OPTS): HResult; stdcall;

    function GetBindOptions(var bindopts: BIND_OPTS): HResult; stdcall;

    function GetRunningObjectTable(out rot: IRunningObjectTable): HResult; stdcall;

    function RegisterObjectParam(pszKey: POLESTR;
                                 const unk: IUnknown): HResult; stdcall;

    function GetObjectParam(pszKey: POLESTR;
                            out unk: IUnknown): HResult; stdcall;

    function EnumObjectParam(out Enum: IEnumString): HResult; stdcall;

    function RevokeObjectParam(pszKey: POLESTR): HResult; stdcall;

  end;

  IID_IBindCtx = IBindCtx;



  // Interface IEnumMoniker
  // ======================
  //
  IEnumMoniker = interface(IUnknown)
    ['{00000102-0000-0000-C000-000000000046}']
    function Next(celt: ULONG;
                  out rgelt: PIMoniker; // array of IMoniker
      out pceltFetched: PDWORD): HResult; stdcall;

    function Skip(celt: DWORD): HResult; stdcall;

    function Reset: HResult; stdcall;

    function Clone(out enm: IEnumMoniker): HResult; stdcall;

  end;

  IID_IEnumMoniker = IEnumMoniker;


  // Interface IRunnableObject
  // =========================
  //
  IRunnableObject = interface(IUnknown)
    ['{00000126-0000-0000-C000-000000000046}']
    function GetRunningClass(out clsid: CLSID): HResult; stdcall;

    function Run(bc: IBindCtx): HResult; stdcall;

    function IsRunning: BOOL; stdcall;

    function LockRunning(fLock: BOOL;
                         fLastUnlockCloses: BOOL): HResult; stdcall;

    function SetContainedObject(fContained: BOOL): HResult; stdcall;

  end;

  IID_IRunnableObject = IRunnableObject;


  // Interface IRunningObjectTable
  // =============================
  //
  IRunningObjectTable = interface(IUnknown)
    ['{00000010-0000-0000-C000-000000000046}']
    function _Register(grfFlags: DWORD;
                       unkObject: IUnknown;
                       mkObjectName: IMoniker;
                       out dwRegister: DWORD): HResult; stdcall;

    function Revoke(dwRegister: DWORD): HResult; stdcall;

    function IsRunning(mkObjectName: IMoniker): HResult; stdcall;

    function GetObject(mkObjectName: IMoniker;
                       out unkObject: IUnknown): HResult; stdcall;

    function NoteChangeTime(dwRegister: DWORD;
                            filetime: FILETIME): HResult; stdcall;

    function GetTimeOfLastChange(mkObjectName: IMoniker;
                                 out filetime: FILETIME): HResult; stdcall;

    function EnumRunning(out enumMoniker: IEnumMoniker): HResult; stdcall;

  end;

  IID_IRunningObjectTable = IRunningObjectTable;


  // Interface IPersist
  // ==================
  //
  IPersist = interface(IUnknown)
    ['{0000010c-0000-0000-C000-000000000046}']
    function GetClassID(out pClassID: CLSID): HResult; stdcall;

  end;

  IID_IPersist = IPersist;


  // Interface IPersistStream
  // ========================
  //
  IPersistStream = interface(IPersist)
    ['{00000109-0000-0000-C000-000000000046}']
    function IsDirty(): HResult; stdcall;

    function Load(stm: IStream): HResult; stdcall;

    function Save(stm: IStream;
                  fClearDirty: BOOL): HResult; stdcall;

    function GetSizeMax(out cbSize: ULARGE_INTEGER): HResult; stdcall;

  end;

  IID_IPersistStream = IPersistStream;


  // system moniker types; returned from IsSystemMoniker.
  PMKSYS = ^tagMKSYS;
  tagMKSYS = (
    MKSYS_NONE = 0,
              MKSYS_GENERICCOMPOSITE = 1,
              MKSYS_FILEMONIKER = 2,
              MKSYS_ANTIMONIKER = 3,
              MKSYS_ITEMMONIKER = 4,
              MKSYS_POINTERMONIKER = 5,
              MKSYS_CLASSMONIKER = 7,
              MKSYS_OBJREFMONIKER = 8,
              MKSYS_SESSIONMONIKER = 9,
              MKSYS_LUAMONIKER = 10
    );
  MKSYS = tagMKSYS;


  PMKRREDUCE = ^tagMKREDUCE;
  tagMKREDUCE = LongInt; // Windows 32-bit enum; aliases and SDK values are preserved.

  MKRREDUCE = tagMKREDUCE;


  // Interface IMoniker
  // ==================
  //
  IMoniker = interface(IPersistStream)
    ['{0000000f-0000-0000-C000-000000000046}']
    function BindToObject(bc: IBindCtx;
                          mkToLeft: IMoniker;
                          const iidResult: IID;
                          out vResult): HResult; stdcall;

    function BindToStorage(bc: IBindCtx;
                           mkToLeft: IMoniker;
                           const iid: IID;
                           out vObj): HResult; stdcall;

    function Reduce(bc: IBindCtx;
                    dwReduceHowFar: DWORD;
                    mkToLeft: PIMoniker;
                    out mkReduced: IMoniker): HResult; stdcall;

    function ComposeWith(mkRight: IMoniker;
                         fOnlyIfNotGeneric: BOOL;
                         out mkComposite: IMoniker): HResult; stdcall;

    function Enum(fForward: BOOL;
                  out enumMoniker: IEnumMoniker): HResult; stdcall;

    function IsEqual(mkOtherMoniker: IMoniker): HResult; stdcall;

    function Hash(out dwHash: DWORD): HResult; stdcall;

    function IsRunning(bc: IBindCtx;
                       mkToLeft: IMoniker;
                       mkNewlyRunning: IMoniker): HResult; stdcall;

    function GetTimeOfLastChange(bc: IBindCtx;
                                 mkToLeft: IMoniker;
                                 out filetime: FILETIME): HResult; stdcall;

    function Inverse(out mk: IMoniker): HResult; stdcall;

    function CommonPrefixWith(mkOther: IMoniker;
                              out mkPrefix: IMoniker): HResult; stdcall;

    function RelativePathTo(mkOther: IMoniker;
                            out mkRelPath: IMoniker): HResult; stdcall;

    function GetDisplayName(bc: IBindCtx;
                            mkToLeft: IMoniker;
                            out pszDisplayName: POLESTR): HResult; stdcall;

    function ParseDisplayName(bc: IBindCtx;
                              mkToLeft: IMoniker;
                              pszDisplayName: POLESTR;
                              out chEaten: DWORD;
                              out mkOut: IMoniker): HResult; stdcall;

    function IsSystemMoniker(out dwMksys: DWORD): HResult; stdcall;

  end;

  IID_IMoniker = IMoniker;


  // Interface IROTData
  // ==================
  //
  IROTData = interface(IUnknown)
    ['{f29f6bc0-5021-11ce-aa15-00006901293f}']
    function GetComparisonData(out pbData: Pbyte;
                               cbMax: ULONG;
                               out pcbData: ULONG): HResult; stdcall;
  end;

  IID_IROTData = IROTData;



  // Interface IEnumSTATSTG
  // ======================
  //
  IEnumSTATSTG = interface(IUnknown)
    ['{0000000d-0000-0000-C000-000000000046}']
    function Next(celt: ULONG;
                  out rgelt: PSTATSTG; // array of STATSTG;
      pceltFetched: PDWORD): HResult; stdcall;

    function Skip(celt: DWORD): HResult; stdcall;

    function Reset(): HResult; stdcall;

    function Clone(out enm: IEnumSTATSTG): HResult; stdcall;

  end;

  IID_IEnumSTATSTG = IEnumSTATSTG;


  wireSNB = ^tagRemSNB;
  PRemSNB = ^tagRemSNB;

  tagRemSNB = record
    ulCntStr: ULONG;
    ulCntChar: ULONG;
    rgString: array[0..254] of OLECHAR;
  end;
  RemSNB = tagRemSNB;

  SNB = ^LPOLESTR;


  // Interface IStorage
  // ==================
  //
  IStorage = interface(IUnknown)
    ['{0000000b-0000-0000-C000-000000000046}']
    function CreateStream(pwcsName: POLESTR;
                          grfMode: DWORD;
                          reserved1: DWORD;
                          reserved2: DWORD;
                          out stm: IStream): HResult; stdcall;

    function OpenStream(pwcsName: POLESTR;
                        reserved1: Pointer;
                        grfMode: DWORD;
                        reserved2: DWORD;
                        out stm: IStream): HResult; stdcall;

    function CreateStorage(pwcsName: POLESTR;
                           grfMode: DWORD;
                           dwStgFmt: DWORD;
                           reserved2: DWORD;
                           out stg: IStorage): HResult; stdcall;

    function OpenStorage(pwcsName: POLESTR;
                         const stgPriority: IStorage;
                         grfMode: DWORD;
                         snbExclude: SNB;
                         reserved: DWORD;
                         out stg: IStorage): HResult; stdcall;

    function CopyTo(ciidExclude: DWORD;
                    rgiidExclude: PIID;
                    snbExclude: SNB;
                    const stgDest: IStorage): HResult; stdcall;

    function MoveElementTo(pwcsName: POLESTR;
                           const stgDest: IStorage;
                           pwcsNewName: POLESTR;
                           grfFlags: DWORD): HResult; stdcall;

    function Commit(grfCommitFlags: DWORD): HResult; stdcall;

    function Revert: HResult; stdcall;

    function EnumElements(reserved1: DWORD;
                          reserved2: Pointer;
                          reserved3: DWORD;
                          out enm: IEnumSTATSTG): HResult; stdcall;

    function DestroyElement(pwcsName: POLESTR): HResult; stdcall;

    function RenameElement(pwcsOldName: POLESTR;
                           pwcsNewName: POLESTR): HResult; stdcall;

    function SetElementTimes(pwcsName: POLESTR;
                             const ctime: FILETIME;
                             const atime: FILETIME;
                             const mtime: FILETIME): HResult; stdcall;

    function SetClass(const clsid: CLSID): HResult; stdcall;

    function SetStateBits(grfStateBits: DWORD;
                          grfMask: DWORD): HResult; stdcall;

    function Stat(out statstg: STATSTG;
                  grfStatFlag: DWORD): HResult; stdcall;

  end;

  IID_IStorage = IStorage;


  // Interface IPersistFile
  // ======================
  //
  IPersistFile = interface(IPersist)
    ['{0000010b-0000-0000-C000-000000000046}']
    function IsDirty: HResult; stdcall;

    function Load(pszFileName: POLESTR;
                  dwMode: DWORD): HResult; stdcall;

    function Save(pszFileName: POLESTR;
                  fRemember: BOOL): HResult; stdcall;

    function SaveCompleted(pszFileName: POLESTR): HResult; stdcall;

    function GetCurFile(out pszFileName: POLESTR): HResult; stdcall;

  end;

  IID_IPersistFile = IPersistFile;


  // Interface IPersistStorage
  // =========================
  //
  IPersistStorage = interface(IPersist)
    ['{0000010a-0000-0000-C000-000000000046}']
    function IsDirty: HResult; stdcall;

    function InitNew(stg: IStorage): HResult; stdcall;

    function Load(stg: IStorage): HResult; stdcall;

    function Save(stgSave: IStorage;
                  fSameAsLoad: BOOL): HResult; stdcall;

    function SaveCompleted(stgNew: IStorage): HResult; stdcall;

    function HandsOffStorage(): HResult; stdcall;

  end;

  IID_IPersistStorage = IPersistStorage;


  // Interface ILockBytes
  // ====================
  //
  ILockBytes = interface(IUnknown)
    ['{0000000a-0000-0000-C000-000000000046}']
    function ReadAt(ulOffset: ULARGE_INTEGER;
                    pv: Pointer;
                    cb: DWORD;
                    pcbRead: PDWORD): HResult; stdcall;

    function WriteAt(ulOffset: ULARGE_INTEGER;
                     pv: Pointer;
                     cb: DWORD;
                     pcbWritten: PDWORD): HResult; stdcall;

    function Flush(): HResult; stdcall;

    function SetSize(cb: ULARGE_INTEGER): HResult; stdcall;

    function LockRegion(libOffset: ULARGE_INTEGER;
                        cb: ULARGE_INTEGER;
                        dwLockType: DWORD): HResult; stdcall;

    function UnlockRegion(libOffset: ULARGE_INTEGER;
                          cb: ULARGE_INTEGER;
                          dwLockType: DWORD): HResult; stdcall;

    function Stat(out statstg: STATSTG;
                  grfStatFlag: Longint): HResult; stdcall;

  end;

  IID_ILockBytes = ILockBytes;


  PDVTARGETDEVICE = ^tagDVTARGETDEVICE;

  tagDVTARGETDEVICE = record
    tdSize: DWORD;
    tdDriverNameOffset: WORD;
    tdDeviceNameOffset: WORD;
    tdPortNameOffset: WORD;
    tdExtDevmodeOffset: WORD;
    tdData: array[0..254] of Byte;
  end;
  DVTARGETDEVICE = tagDVTARGETDEVICE;

  LPCLIPFORMAT = ^CLIPFORMAT;

  PFORMATETC = ^tagFORMATETC;

  tagFORMATETC = record
    cfFormat: CLIPFORMAT;
    ptd: PDVTARGETDEVICE;
    dwAspect: DWORD;
    lindex: LONG;
    tymed: DWORD;
  end;
  FORMATETC = tagFORMATETC;
  LPFORMATETC = ^tagFORMATETC;


  // Interface IEnumFORMATETC
  // ========================
  //
  IEnumFORMATETC = interface(IUnknown)
    ['{00000103-0000-0000-C000-000000000046}']
    function Next(celt: DWORD;
                  out elt: PFORMATETC;  // An array of enumerated items.
      pceltFetched: PDWORD): HResult; stdcall;

    function Skip(celt: DWORD): HResult; stdcall;

    function Reset(): HResult; stdcall;

    function Clone(out Enum: IEnumFormatEtc): HResult; stdcall;

  end;

  IID_IEnumFORMATETC = IEnumFORMATETC;


  // Advise Flags
  PADVF = ^tagADVF;
  tagADVF = LongInt; // Windows 32-bit enum; aliases and SDK values are preserved.

  ADVF = tagADVF;


  // Stats for data; used by several enumerations and by at least one
  // implementation of IDataAdviseHolder; if a field is not used, it
  // will be Nil.

  PSTATDATA = ^tagSTATDATA;

  tagSTATDATA = record
    // field used by:
    formatetc: FORMATETC;            // EnumAdvise, EnumData (cache), EnumFormats
    advf: DWORD;                     // EnumAdvise, EnumData (cache)
    pAdvSink: IAdviseSink;           // EnumAdvise
    dwConnection: DWORD;             // EnumAdvise
  end;
  STATDATA = tagSTATDATA;
  LPSTATDATA = ^STATDATA;


  // Interface IEnumSTATDATA
  // =======================
  //
  IEnumSTATDATA = interface(IUnknown)
    ['{00000105-0000-0000-C000-000000000046}']

    // SDK native virtual methods. Pointer parameters preserve optional buffers and arrays.
    function Next(celt: ULONG;
                  rgelt: PSTATDATA;
                  pceltFetched: PULONG): HRESULT; stdcall;

    function Skip(celt: ULONG): HRESULT; stdcall;

    function Reset(): HRESULT; stdcall;

    function Clone(out ppenum: IEnumSTATDATA): HRESULT; stdcall;
  end;

  IID_IEnumSTATDATA = IEnumSTATDATA;


  // Interface IRootStorage
  // ======================
  //
  IRootStorage = interface(IUnknown)
    ['{00000012-0000-0000-C000-000000000046}']
    function SwitchToFile(pszFile: LPOLESTR): HResult; stdcall;

  end;

  IID_IRootStorage = IRootStorage;


  //****************************************************************************
  //*  Notification Interfaces
  //****************************************************************************

  PTYMED = ^tagTYMED;
  tagTYMED = LongInt; // Windows 32-bit enum; aliases and SDK values are preserved.

  TYMED = tagTYMED;


  PRemSTGMEDIUM = ^tagRemSTGMEDIUM;

  tagRemSTGMEDIUM = record
    tymed: DWORD;
    dwHandleType: DWORD;
    pData: ULONG;
    pUnkForRelease: ULONG;
    cbData: ULONG;
    data: array[0..254] of byte;
  end;
  RemSTGMEDIUM = tagRemSTGMEDIUM;


  PSTGMEDIUM = ^tagSTGMEDIUM;

  tagSTGMEDIUM = record
    tymed: DWORD;
    case Integer of
      0: (hBitmap: HBITMAP;
        unkForRelease: Pointer); // IUnknown
      1: (hMetaFilePict: THandle);
      2: (hEnhMetaFile: THandle);
      3: (hGlobal: HGLOBAL);
      4: (lpszFileName: POLESTR);
      5: (stm: Pointer); // IStream
      6: (stg: Pointer); // IStorage
  end;
  STGMEDIUM = tagSTGMEDIUM;


  PGDI_OBJECT = ^_GDI_OBJECT;

  _GDI_OBJECT = record
    ObjectType: DWORD;
    case integer of
      0: (hGeneric: wireHGLOBAL);

      1: (case integer of
          OBJ_BITMAP: (hBitmap: wireHBITMAP);
          OBJ_PAL: (hPalette: wireHPALETTE));
  end;
  GDI_OBJECT = _GDI_OBJECT;


  wireASYNC_STGMEDIUM = ^_userSTGMEDIUM;
  wireSTGMEDIUM = ^_userSTGMEDIUM;
  PuserSTGMEDIUM = ^_userSTGMEDIUM;

  _userSTGMEDIUM = record
    tymed: DWORD;
    case integer of
      0: (case tagTYMED of
          TYMED_NULL: ( {Nothing to do});
          TYMED_MFPICT: (hMetaFilePict: wireHMETAFILEPICT);
          TYMED_ENHMF: (hHENHMETAFILE: wireHENHMETAFILE);
          TYMED_GDI: (hGdiHandle: GDI_OBJECT);
          TYMED_HGLOBAL: (hGlobal: wireHGLOBAL);
          TYMED_FILE: (lpszFileName: LPOLESTR);
          TYMED_ISTREAM: (pstm: PBYTE_BLOB);
          TYMED_ISTORAGE: (pstg: PBYTE_BLOB));
      1: (pUnkForRelease: Pointer); // IUnknown
  end;
  userSTGMEDIUM = _userSTGMEDIUM;

  PASYNC_STGMEDIUM = ^ASYNC_STGMEDIUM;
  ASYNC_STGMEDIUM = STGMEDIUM;

  LPSTGMEDIUM = ^STGMEDIUM;

  wireFLAG_STGMEDIUM = ^userFLAG_STGMEDIUM;
  PUserFLAGSTGMEDIUM = ^_userFLAG_STGMEDIUM;

  _userFLAG_STGMEDIUM = record
    ContextFlags: LONG;
    fPassOwnership: LONG;
    Stgmed: userSTGMEDIUM;
  end;
  userFLAG_STGMEDIUM = _userFLAG_STGMEDIUM;


  PFLAG_STGMEDIUM = ^_FLAG_STGMEDIUM;

  _FLAG_STGMEDIUM = record
    ContextFlags: LONG;
    fPassOwnership: LONG;
    Stgmed: STGMEDIUM;
  end;
  FLAG_STGMEDIUM = _FLAG_STGMEDIUM;


  // Interface IAdviseSink
  // =====================
  //
  IAdviseSink = interface(IUnknown)
    ['{0000010f-0000-0000-C000-000000000046}']
    procedure OnDataChange(formatetc: FORMATETC;
                           stgmed: STGMEDIUM); stdcall;

    procedure OnViewChange(dwAspect: DWORD;
                           lindex: DWORD); stdcall;

    procedure OnRename(mk: IMoniker); stdcall;

    procedure OnSave(); stdcall;

    procedure OnClose(); stdcall;

  end;

  IID_IAdviseSink = IAdviseSink;


  // Interface IAdviseSink2
  // ======================
  //
  IAdviseSink2 = interface(IAdviseSink)
    ['{00000125-0000-0000-C000-000000000046}']
    procedure OnLinkSrcChange(mk: IMoniker); stdcall;

  end;

  IID_IAdviseSink2 = IAdviseSink2;


  //DATA format DIRection
  PDATADIR = ^tagDATADIR;
  tagDATADIR = (
    DATADIR_GET = 1,
                DATADIR_SET = 2
    );
  DATADIR = tagDATADIR;


  // Interface IDataObject
  // =====================
  //
  IDataObject = interface(IUnknown)
    ['{0000010e-0000-0000-C000-000000000046}']
    function GetData(formatetcIn: FORMATETC;
                     out medium: STGMEDIUM): HResult; stdcall;

    function GetDataHere(formatetc: FORMATETC;
                         out medium: STGMEDIUM): HResult; stdcall;

    function QueryGetData(formatetc: FORMATETC): HResult; stdcall;

    function GetCanonicalFormatEtc(FORMATETC: FormatEtc;
                                   out formatetcOut: FORMATETC): HResult; stdcall;

    function SetData(formatetc: FORMATETC;
                     var medium: STGMEDIUM;
                     fRelease: BOOL): HResult; stdcall;

    function EnumFormatEtc(dwDirection: DWORD;
                           out enumFormatEtc: IEnumFormatEtc): HResult; stdcall;

    function DAdvise(formatetc: FORMATETC;
                     advf: Longint;
                     const advSink: IAdviseSink;
                     out dwConnection: DWORD): HResult; stdcall;

    function DUnadvise(dwConnection: DWORD): HResult; stdcall;

    function EnumDAdvise(out enumAdvise: IEnumStatData): HResult; stdcall;

  end;

  IID_IDataObject = IDataObject;


  // Interface IDataAdviseHolder
  // ===========================
  //
  IDataAdviseHolder = interface(IUnknown)
    ['{00000110-0000-0000-C000-000000000046}']
    function Advise(dataObject: IDataObject;
                    fetc: FORMATETC;
                    advf: DWORD;
                    advise: IAdviseSink;
                    out pdwConnection: DWORD): HResult; stdcall;

    function Unadvise(dwConnection: DWORD): HResult; stdcall;

    function EnumAdvise(out enumAdvise: IEnumStatData): HResult; stdcall;

    function SendOnDataChange(dataObject: IDataObject;
                              dwReserved: DWORD;
                              advf: DWORD): HResult; stdcall;

  end;

  IID_IDataAdviseHolder = IDataAdviseHolder;


  // call type used by IMessageFilter.HandleIncomingMessage
  PCALLTYPE = ^tagCALLTYPE;
  tagCALLTYPE = (
    CALLTYPE_TOPLEVEL = 1,          // toplevel call - no outgoing call
    CALLTYPE_NESTED = 2,          // callback on behalf of previous outgoing call - should always handle
    CALLTYPE_ASYNC = 3,          // aysnchronous call - can NOT be rejected
    CALLTYPE_TOPLEVEL_CALLPENDING = 4,          // new toplevel call with new LID
    CALLTYPE_ASYNC_CALLPENDING = 5           // async call - can NOT be rejected
    );
  CALLTYPE = tagCALLTYPE;

  // status of server call - returned by IMessageFilter::HandleIncomingCall
  // and passed to  IMessageFilter::RetryRejectedCall
  PSERVERCALL = ^tagSERVERCALL;
  tagSERVERCALL = (
    SERVERCALL_ISHANDLED = 0,
                   SERVERCALL_REJECTED = 1,
                   SERVERCALL_RETRYLATER = 2
    );
  SERVERCALL = tagSERVERCALL;

  // Pending type indicates the level of nesting
  PPENDINGTYPE = ^tagPENDINGTYPE;
  tagPENDINGTYPE = (
    PENDINGTYPE_TOPLEVEL = 1,       // toplevel call
    PENDINGTYPE_NESTED = 2        // nested call
    );
  PENDINGTYPE = tagPENDINGTYPE;

  // return values of MessagePending
  PPENDINGMSG = ^tagPENDINGMSG;
  tagPENDINGMSG = (
    PENDINGMSG_CANCELCALL = 0,      // cancel the outgoing call
    PENDINGMSG_WAITNOPROCESS = 1,      // wait for the return and don't dispatch the message
    PENDINGMSG_WAITDEFPROCESS = 2       // wait and dispatch the message
    );
  PENDINGMSG = tagPENDINGMSG;

  // additional interface information about the incoming call
  LPINTERFACEINFO = ^tagINTERFACEINFO;
  PINTERFACEINFO = ^tagINTERFACEINFO;

  tagINTERFACEINFO = record
    pUnk: IUnknown;                 // the pointer to the object
    iid: IID;                       // interface id
    wMethod: WORD;                  // interface method
  end;
  INTERFACEINFO = tagINTERFACEINFO;


  // Interface IMessageFilter
  // ========================
  //
  IMessageFilter = interface(IUnknown)
    ['{00000016-0000-0000-C000-000000000046}']
    function HandleInComingCall(dwCallType: DWORD;
                                htaskCaller: HTask;
                                dwTickCount: DWORD;
                                lpInterfaceInfo: PInterfaceInfo): DWORD; stdcall;

    function RetryRejectedCall(htaskCallee: HTask;
                               dwTickCount: DWORD;
                               dwRejectType: Longint): DWORD; stdcall;

    function MessagePending(htaskCallee: HTask;
                            dwTickCount: DWORD;
                            dwPendingType: DWORD): DWORD; stdcall;

  end;

  IID_IMessageFilter = IMessageFilter;



  //****************************************************************************
  //*  Connection Point Interfaces
  //****************************************************************************


  // Interface IConnectionPoint
  // ==========================
  //
  IConnectionPoint = interface(IUnknown)
    ['{B196B286-BAB4-101A-B69C-00AA00341D07}']
    function GetConnectionInterface(out iid: IID): HResult; stdcall;

    function GetConnectionPointContainer(out cpc: IConnectionPointContainer): HResult; stdcall;

    function Advise(const unkSink: IUnknown;
                    out dwCookie: Longint): HResult; stdcall;

    function Unadvise(dwCookie: Longint): HResult; stdcall;

    function EnumConnections(out Enum: IEnumConnections): HResult; stdcall;

  end;

  IID_IConnectionPoint = IConnectionPoint;


  // Interface IConnectionPointContainer
  // ===================================
  //
  IConnectionPointContainer = interface(IUnknown)
    ['{B196B284-BAB4-101A-B69C-00AA00341D07}']
    function EnumConnectionPoints(out Enum: IEnumConnectionPoints): HResult; stdcall;

    function FindConnectionPoint(const iid: IID;
                                 out cp: IConnectionPoint): HResult; stdcall;
  end;

  IID_IConnectionPointContainer = IConnectionPointContainer;


  LPCONNECTDATA = ^tagCONNECTDATA;
  PCONNECTDATA = ^tagCONNECTDATA;

  tagCONNECTDATA = record
    pUnk: IUnknown;
    dwCookie: DWORD;
  end;
  CONNECTDATA = tagCONNECTDATA;


  // Interface IEnumConnections
  // ==========================
  //
  IEnumConnections = interface(IUnknown)
    ['{B196B287-BAB4-101A-B69C-00AA00341D07}']
    function Next(celt: ULONG;
                  out elt: PCONNECTDATA;  // array of CONNECTDATA
      pceltFetched: PDWORD): HResult; stdcall;

    function Skip(celt: DWORD): HResult; stdcall;

    function Reset: HResult; stdcall;

    function Clone(out Enum: IEnumConnections): HResult; stdcall;
  end;

  IID_IEnumConnections = IEnumConnections;



  // Interface IEnumConnectionPoints
  // ===============================
  //
  IEnumConnectionPoints = interface(IUnknown)
    ['{B196B285-BAB4-101A-B69C-00AA00341D07}']
    function Next(celt: DWORD;
                  out elt: PIConnectionPoint;  // array of IConnectionPoint
      pceltFetched: PLongint): HResult; stdcall;

    function Skip(celt: DWORD): HResult; stdcall;

    function Reset(): HResult; stdcall;

    function Clone(out Enum: IEnumConnectionPoints): HResult; stdcall;

  end;

  IID_IEnumConnectionPoints = IEnumConnectionPoints;


  // Interface IClassActivator
  // =========================
  //
  IClassActivator = interface(IUnknown)
    ['{00000140-0000-0000-C000-000000000046}']
    function GetClassObject(const rclsid: REFCLSID;
                            dwClassContext: DWORD;
                            const locale: LCID;
                            const riid: REFIID;
                            out ppv): HResult; stdcall;

  end;

  IID_IClassActivator = IClassActivator;


  // Interface IFillLockBytes
  // ========================
  //
  PIFillLockBytes = ^IFillLockBytes;

  IFillLockBytes = interface(IUnknown)
    ['{99caf010-415e-11cf-8814-00aa00b569f5}']
    function FillAppend(pv: Pointer;  // Pointer to the data to be appended to the end of an existing byte array.
      cb: Longint;
                        out cbWritten: DWORD): HResult; stdcall;

    function FillAt(Offset: DWORD;
                    pv: Pointer; // Pointer to the data to be appended to the end of an existing byte array.
      cb: DWORD;
                    out cbWritten: DWORD): HResult; stdcall;

    function SetFillSize(Offset: DWORD): HResult; stdcall;

    function Terminate(bCanceled: BOOL): HResult; stdcall;

  end;

  IID_IFillLockBytes = IFillLockBytes;



  // Interface IProgressNotify
  // =========================
  //
  IProgressNotify = interface(IUnknown)
    ['{a9d758a0-4617-11cf-95fc-00aa00680db4}']

    function OnProgress(dwProgressCurrent: DWORD;
                        dwProgressMaximum: DWORD;
                        fAccurate: BOOL;
                        fOwner: BOOL): HResult; stdcall;

  end;

  IID_IProgressNotify = IProgressNotify;


  PStorageLayout = ^tagStorageLayout;

  tagStorageLayout = record
    LayoutType: DWORD;
    pwcsElementName: POLECHAR;
    cOffset: LARGE_INTEGER;
    cBytes: LARGE_INTEGER;
  end;
  StorageLayout = tagStorageLayout;


  // Interface ILayoutStorage
  // ========================
  //
  ILayoutStorage = interface(IUnknown)
    ['{0e6d4d90-6738-11cf-9608-00aa00680db4}']

    function LayoutScript(pStorageLayout: StorageLayout;
                          nEntries: DWORD;
                          glfInterleavedFlag: DWORD): HResult; stdcall;

    function BeginMonitor(): HResult; stdcall;

    function EndMonitor(): HResult; stdcall;

    function ReLayoutDocfile(pwcsNewDfName: POLECHAR): HResult; stdcall;

    function ReLayoutDocfileOnILockBytes(pILockBytes: ILockBytes): HResult; stdcall;

  end;

  IID_ILayoutStorage = ILayoutStorage;


  // Interface IBlockingLock
  // =======================
  //
  IBlockingLock = interface(IUnknown)
    ['{30f3d47a-6447-11d1-8e3c-00c04fb9386d}']
    function Lock(dwTimeout: DWORD): HResult; stdcall;

    function Unlock(): HResult; stdcall;

  end;

  IID_IBlockingLock = IBlockingLock;


  // Interface ITimeAndNoticeControl
  // ===============================
  //
  ITimeAndNoticeControl = interface(IUnknown)
    ['{bc0bf6ae-8878-11d1-83e9-00c04fc2c6d4}']
    function SuppressChanges(res1: DWORD;
                             res2: DWORD): HResult; stdcall;

  end;

  IID_ITimeAndNoticeControl = ITimeAndNoticeControl;


  // Interface IOplockStorage
  // ========================
  //
  IOplockStorage = interface(IUnknown)
    ['{8d19c834-8879-11d1-83e9-00c04fc2c6d4}']

    function CreateStorageEx(pwcsName: LPCWSTR;
                             grfMode: DWORD;
                             stgfmt: DWORD;
                             grfAttrs: DWORD;
                             const riid: REFIID;
                             out ppstgOpen: Pointer): HResult; stdcall;

    function OpenStorageEx(pwcsName: LPCWSTR;
                           grfMode: DWORD;
                           stgfmt: DWORD;
                           grfAttrs: DWORD;
                           const riid: REFIID;
                           out ppstgOpen: Pointer): HResult; stdcall;
  end;

  IID_IOplockStorage = IOplockStorage;



  // Interface IDirectWriterLock
  // ===========================
  //
  IDirectWriterLock = interface(IUnknown)
    ['{0e6d4d92-6738-11cf-9608-00aa00680db4}']
    function WaitForWriteAccess(dwTimeout: DWORD): HResult; stdcall;

    function ReleaseWriteAccess(): HResult; stdcall;

    function HaveWriteAccess(): HResult; stdcall;
  end;

  IID_IDirectWriterLock = IDirectWriterLock;


  // Interface IUrlMon
  // =================
  //
  IUrlMon = interface(IUnknown)
    ['{00000026-0000-0000-C000-000000000046}']
    function AsyncGetClassBits(const rclsid: REFCLSID;
                               pszTYPE: LPCWSTR;
                               pszExt: LPCWSTR;
                               dwFileVersionMS: DWORD;
                               dwFileVersionLS: DWORD;
                               pszCodeBase: LPCWSTR;
                               pbc: IBindCtx;
                               dwClassContext: DWORD;
                               const riid: REFIID;
                               const flags: DWORD): HResult; stdcall;
  end;

  IID_IUrlMon = IUrlMon;


  // Interface IForegroundTransfer
  // =============================
  //
  IForegroundTransfer = interface(IUnknown)
    ['{00000145-0000-0000-C000-000000000046}']
    function AllowForegroundTransfer(lpvReserved: Pointer): HResult; stdcall;

  end;

  IID_IForegroundTransfer = IForegroundTransfer;


  //****************************************************************************
  //* Thumbnail generator interface
  //****************************************************************************

  // Interface IThumbnailExtractor
  // =============================
  //
  IThumbnailExtractor = interface(IUnknown)
    ['{969dc708-5c76-11d1-8d86-0000f804b057}']

    function ExtractThumbnail(pStg: IStorage;
                              ulLength: ULONG;
                              ulHeight: ULONG;
                              out pulOutputLength: ULONG;
                              out pulOutputHeight: ULONG;
                              out phOutputBitmap: HBITMAP): HResult; stdcall;

    function OnFileUpdated(pStg: IStorage): HResult; stdcall;

  end;

  IID_IThumbnailExtractor = IThumbnailExtractor;


  //****************************************************************************
  //* Dummy Interface to force inclusion of HICON and HDC in proxy/stub code....
  //****************************************************************************

  // Interface IDummyHICONIncluder
  // =============================
  //
  IDummyHICONIncluder = interface(IUnknown)
    ['{947990de-cc28-11d2-a0f7-00805f858fb1}']
    function Dummy(h1: HICON;
                   h2: HDC): HResult; stdcall;

  end;

  IID_IDummyHICONIncluder = IDummyHICONIncluder;


  //****************************************************************************
  //*                         Surrogate Types				                           *
  //****************************************************************************

  //
  // ApplicationType
  //
  PApplicationType = ^tagApplicationType;
  tagApplicationType = (
    ServerApplication,
                        LibraryApplication);
  ApplicationType = tagApplicationType;

  //
  // ShutdownType
  //
  PShutdownType = ^tagShutdownType;
  tagShutdownType = (
    IdleShutdown,
                     ForcedShutdown
    );
  ShutdownType = tagShutdownType;


  //****************************************************************************
  //*                         Surrogate Services Interfaces                    *
  //****************************************************************************


  // Interface IProcessLock
  // ======================
  //
  IProcessLock = interface(IUnknown)
    ['{000001d5-0000-0000-C000-000000000046}']
    function AddRefOnProcess(): ULONG; stdcall;

    function ReleaseRefOnProcess(): ULONG; stdcall;

  end;

  IID_IProcessLock = IProcessLock;



  // Interface ISurrogateService
  // ===========================
  //
  ISurrogateService = interface(IUnknown)
    ['{000001d4-0000-0000-C000-000000000046}']

    function Init(const rguidProcessID: REFGUID;
                  pProcessLock: IProcessLock;
                  out pfApplicationAware: BOOL): HResult; stdcall;

    function ApplicationLaunch(const rguidApplID: REFGUID;
                               appType: ApplicationType): HResult; stdcall;

    function ApplicationFree(const rguidApplID: REFGUID): HResult; stdcall;

    function CatalogRefresh(ulReserved: ULONG): HResult; stdcall;

    function ProcessShutdown(shutdownType: ShutdownType): HResult; stdcall;

  end;

  IID_ISurrogateService = ISurrogateService;


  // #if _WIN32_WINNT >= 0x0501

  // Interface IInitializeSpy
  // ========================
  //
  IInitializeSpy = interface(IUnknown)
    ['{00000034-0000-0000-C000-000000000046}']

    function PreInitialize(dwCoInit: DWORD;
                           dwCurThreadAptRefs: DWORD): HResult; stdcall;

    function PostInitialize(hrCoInit: HResult;
                            dwCoInit: DWORD;
                            dwNewThreadAptRefs: DWORD): HResult; stdcall;

    function PreUninitialize(dwCurThreadAptRefs: DWORD): HResult; stdcall;

    function PostUninitialize(dwNewThreadAptRefs: DWORD): HResult; stdcall;

  end;

  IID_IInitializeSpy = IInitializeSpy;


  // Interface IApartmentShutdown
  // ============================
  //
  IApartmentShutdown = interface(IUnknown)
    ['{A2F05A09-27A2-42B5-BC0E-AC163EF49D9B}']
    procedure OnUninitialize(const ui64ApartmentIdentifier: UINT64);

  end;

  IID_IApartmentShutdown = IApartmentShutdown;


  PCoserverinfo = ^COSERVERINFO;

  _COSERVERINFO = record
    dwReserved1: DWORD;
    pwszName: LPWSTR;
    pAuthInfo: PCOAUTHINFO;
    dwReserved2: DWORD;
  end;
  COSERVERINFO = _COSERVERINFO;


  // Interface IMarshal
  // ==================
  //
  LPMARSHAL = ^IMarshal;

  IMarshal = interface(IUnknown)
    ['{00000003-0000-0000-C000-000000000046}']

    function GetUnmarshalClass(const riid: REFIID;
                               pv: Pointer;
                               dwDestContext: DWORD;
    {in Reserved} pvDestContext: Pointer; // must be nil
      mshlflags: DWORD;
                               out pCid: CLSID): HResult; stdcall;

    function GetMarshalSizeMax(const riid: REFIID;
    {In_opt} pv: Pointer;
                               dwDestContext: DWORD;
    {in Reserved} pvDestContext: Pointer; // must be nil
      mshlflags: DWORD;
                               out pSize: DWORD): HResult; stdcall;

    function MarshalInterface(pStm: IStream;
                              const riid: REFIID;
    {In_opt} pv: Pointer;
                              dwDestContext: DWORD;
    {in Reserved} pvDestContext: Pointer; // must be nil
      mshlflags: DWORD): HResult; stdcall;

    function UnmarshalInterface(pStm: IStream;
                                const riid: REFIID;
    {Outptr} out ppv: Pointer): HResult; stdcall;

    function ReleaseMarshalData(pStm: IStream): HResult; stdcall;

    function DisconnectObject(dwReserved: DWORD): HResult; stdcall;
  end;

  IID_IMarshal = IMarshal;


  // Interface INoMarshal
  // ====================
  //
  INoMarshal = interface(IUnknown)
    ['{ecc8691b-c1db-4dc0-855e-65f6c551af49}']
    // public
  end;

  IID_INoMarshal = INoMarshal;


  // Interface IAgileObject
  // ======================
  // The IAgileObject interface is a marker interface that indicates that an object
  // is free threaded and can be called from any apartment.
  // Unlike what happens when aggregating the Free Threaded Marshaler (FTM),
  // implementing the IAgileObject interface doesn't affect what happens when marshaling a call.
  // Instead, the IAgileObject interface is recognized by the Global Interface Table (GIT).
  // When an object that implements the IAgileObject interface is placed in the GIT and
  // localized to another apartment, the object is called directly in the new apartment, rather than marshaling.
  IAgileObject = interface(IUnknown)
    ['{94ea2b94-e9cc-49e0-c0ff-ee64ca8f5b90}']
    // public
  end;

  IID_IAgileObject = IAgileObject;


  PActivationtype = ^ACTIVATIONTYPE;
  tagACTIVATIONTYPE = (
    ACTIVATIONTYPE_UNCATEGORIZED = 0,
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
  LPMARSHAL2 = ^IMarshal2;
  IMarshal2 = interface(IMarshal)
    ['{000001cf-0000-0000-C000-000000000046}']
    // public
  end;

  IID_IMarshal2 = IMarshal2;



  // Additional Prototypes for ALL interfaces

  // End of Additional Prototypes

implementation

// Implement Additional functions here.

end.
