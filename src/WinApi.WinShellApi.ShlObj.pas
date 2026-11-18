// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.WinShellApi.ShlObj.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 30-04-2026
// Language: ENU
//
// Upstream revision: 4.1.0
//
// Description: Shell api.
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
// Remarks: - Requires Windows Vista or later.
//            Translation rules:
//              Use MfPack WinShellApi declarations consistently in this FPC port.
//          - LPWSTR returned through out parameters normally requires CoTaskMemFree by
//            the caller unless the original API documentation says otherwise.
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
// Source: ShlObj.h
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
unit WinApi.WinShellApi.ShlObj;

{$I MfPack.Fpc.inc}


interface

uses

  {WinApi}
  Windows,
  Messages,
  WinApi.WinApiTypes,
  WinApi.WinError,
  WinApi.ComBaseApi,
  WinApi.Coml2Api,
  WinApi.WinShellApi.ObjectArray,
  {ActiveX}
  WinApi.ActiveX.ObjBase,
  WinApi.ActiveX.PropIdl,
  WinApi.ActiveX.PropSys,
  WinApi.ActiveX.ObjIdl,
  WinApi.ActiveX.OleIdl,
  {WinShellApi}
  WinApi.WinShellApi.ShlObjIdl_Core,
  WinApi.WinShellApi.ShlObj_Core;
  
  {$ALIGN ON}
  {$PACKENUM 4}

  {$IFDEF WIN32}
    {$ALIGN 1}
  {$ELSE}
    {$PACKRECORDS C} // Win64
  {$ENDIF}

  {$I 'WinApiTypes.inc'}

const

  FCIDM_TOOLBAR = FCIDM_BROWSERFIRST + 0;
  FCIDM_STATUS = FCIDM_BROWSERFIRST + 1;

  IDC_OFFLINE_HAND = 103;
  IDC_PANTOOL_HAND_OPEN = 104;
  IDC_PANTOOL_HAND_CLOSED = 105;

  PANE_NONE = DWORD($FFFFFFFF);
  PANE_ZONE = 1;
  PANE_OFFLINE = 2;
  PANE_PRINTER = 3;
  PANE_SSL = 4;
  PANE_NAVIGATION = 5;
  PANE_PROGRESS = 6;
  PANE_PRIVACY = 7;

  OPENPROPS_NONE = $0000;
  OPENPROPS_INHIBITPIF = $8000;
  GETPROPS_NONE = $0000;
  SETPROPS_NONE = $0000;
  CLOSEPROPS_NONE = $0000;
  CLOSEPROPS_DISCARD = $0001;

  SFBID_PIDLCHANGED = 0;

  DBC_GS_IDEAL = 0;
  DBC_GS_SIZEDOWN = 1;

  DBC_HIDE = 0;
  DBC_SHOW = 1;
  DBC_SHOWOBSCURE = 2;

  DBCID_EMPTY = 0;
  DBCID_ONDRAG = 1;
  DBCID_CLSIDOFBAR = 2;
  DBCID_RESIZE = 3;
  DBCID_GETBAR = 4;
  DBCID_UPDATESIZE = 5;

  BMICON_LARGE = 0;
  BMICON_SMALL = 1;

  TBIF_APPEND = 0;
  TBIF_PREPEND = 1;
  TBIF_REPLACE = 2;
  TBIF_DEFAULT = $00000000;
  TBIF_INTERNETBAR = $00010000;
  TBIF_STANDARDTOOLBAR = $00020000;
  TBIF_NOTOOLBAR = $00030000;

  SFVM_REARRANGE = $00000001;
  SFVM_ADDOBJECT = $00000003;
  SFVM_REMOVEOBJECT = $00000006;
  SFVM_UPDATEOBJECT = $00000007;
  SFVM_GETSELECTEDOBJECTS = $00000009;
  SFVM_SETITEMPOS = $0000000E;
  SFVM_SETCLIPBOARD = $00000010;
  SFVM_SETPOINTS = $00000017;

type

  ISFB_MASK = type DWORD;

  ISFB_STATE = type DWORD;

  ISFBVIEWMODE = type WORD;

  SSM_FLAGS = type DWORD;

  SCHEME_FLAGS = type DWORD;

  GADOF_FLAGS = type DWORD;

  SHCDF_FLAGS = type DWORD;

const
  DWFRF_NORMAL           = DWORD($0000);
  DWFRF_DELETECONFIGDATA = DWORD($0001);

  DWFAF_HIDDEN   = DWORD($0001);
  DWFAF_GROUP1   = DWORD($0002);
  DWFAF_GROUP2   = DWORD($0004);
  DWFAF_AUTOHIDE = DWORD($0010);

  ISFB_MASK_STATE       = ISFB_MASK($00000001);
  ISFB_MASK_BKCOLOR     = ISFB_MASK($00000002);
  ISFB_MASK_VIEWMODE    = ISFB_MASK($00000004);
  ISFB_MASK_SHELLFOLDER = ISFB_MASK($00000008);
  ISFB_MASK_IDLIST      = ISFB_MASK($00000010);
  ISFB_MASK_COLORS      = ISFB_MASK($00000020);

  ISFB_STATE_DEFAULT     = ISFB_STATE($00000000);
  ISFB_STATE_DEBOSSED    = ISFB_STATE($00000001);
  ISFB_STATE_ALLOWRENAME = ISFB_STATE($00000002);
  ISFB_STATE_NOSHOWTEXT  = ISFB_STATE($00000004);
  ISFB_STATE_CHANNELBAR  = ISFB_STATE($00000010);
  ISFB_STATE_QLINKSMODE  = ISFB_STATE($00000020);
  ISFB_STATE_FULLOPEN    = ISFB_STATE($00000040);
  ISFB_STATE_NONAMESORT  = ISFB_STATE($00000080);
  ISFB_STATE_BTNMINSIZE  = ISFB_STATE($00000100);

  ISFBVIEWMODE_SMALLICONS = ISFBVIEWMODE($0001);
  ISFBVIEWMODE_LARGEICONS = ISFBVIEWMODE($0002);
  ISFBVIEWMODE_LOGOS      = ISFBVIEWMODE($0003);

  SSM_CLEAR   = SSM_FLAGS($0000);
  SSM_SET     = SSM_FLAGS($0001);
  SSM_REFRESH = SSM_FLAGS($0002);
  SSM_UPDATE  = SSM_FLAGS($0004);

  SCHEME_DISPLAY  = SCHEME_FLAGS($0001);
  SCHEME_EDIT     = SCHEME_FLAGS($0002);
  SCHEME_LOCAL    = SCHEME_FLAGS($0004);
  SCHEME_GLOBAL   = SCHEME_FLAGS($0008);
  SCHEME_REFRESH  = SCHEME_FLAGS($0010);
  SCHEME_UPDATE   = SCHEME_FLAGS($0020);
  SCHEME_DONOTUSE = SCHEME_FLAGS($0040);
  SCHEME_CREATE   = SCHEME_FLAGS($0080);

  GADOF_DIRTY = GADOF_FLAGS($00000001);

  SHCDF_UPDATEITEM = SHCDF_FLAGS($00000001);

type
  // Forward declarations
  INewShortcutHookA = interface;
  INewShortcutHookW = interface;
  ICopyHookA = interface;
  ICopyHookW = interface;
  ICurrentWorkingDirectory = interface;
  IDockingWindowFrame = interface;
  IThumbnailCapture = interface;
  IShellFolderBand = interface;
  IDeskBarClient = interface;
  IActiveDesktopP = interface;
  IADesktopP2 = interface;
  IColumnProvider = interface;
  IDocViewSite = interface;
  IInitializeObject = interface;
  IBanneredBar = interface;
  // ShlObj.h only forward-declares IEnumPrivacyRecords here.
  // The real interface lives in Mshtml.h/Mshtml.idl.
  // We provide the small Mshtml dependency in the MfPack additional-prototypes
  // section below, instead of translating the full Mshtml monster header.
  //IEnumPrivacyRecords = interface;

  // ---------------------------------------------------------------------------
  // Missing Shtypes/ShObjId helper aliases
  // ---------------------------------------------------------------------------
  // The C header gets these names from Shtypes.h / PropKey.h.  We keep them
  // local here so this legacy ShlObj wrapper does not have to depend on
  // Delphi's native Winapi.ShlObj unit.

  PSHITEMID = ^SHITEMID;
  LPSHITEMID = ^SHITEMID;
  LPCSHITEMID = ^SHITEMID;
  {$PUSH}
  {$PACKRECORDS 1}
  SHITEMID = packed record
    cb: USHORT;
    abID: array[0..0] of BYTE;
  end;
  {$POP}

  PITEMIDLIST = ^ITEMIDLIST;
  LPITEMIDLIST = ^ITEMIDLIST;
  PCITEMIDLIST = ^ITEMIDLIST;
  LPCITEMIDLIST = ^ITEMIDLIST;
  {$PUSH}
  {$PACKRECORDS 1}
  ITEMIDLIST = packed record
    mkid: SHITEMID;
  end;
  {$POP}

  PIDLIST_ABSOLUTE = PITEMIDLIST;
  PCIDLIST_ABSOLUTE = PCITEMIDLIST;
  PUITEMID_CHILD = PITEMIDLIST;
  PCUITEMID_CHILD = PCITEMIDLIST;
  PITEMID_CHILD = PITEMIDLIST;
  PCITEMID_CHILD = PCITEMIDLIST;

  SHCOLUMNID = PROPERTYKEY;
  PSHCOLUMNID = ^SHCOLUMNID;
  LPCSHCOLUMNID = ^SHCOLUMNID;

  TVariantArg = TVarData;
  PVariantArg = ^TVariantArg;

  LPSHChangeProductKeyAsIDList = ^SHChangeProductKeyAsIDList;
  {$PUSH}
  {$PACKRECORDS 1}
  SHChangeProductKeyAsIDList = packed record
    cb: USHORT;
    wszProductKey: array[0..38] of WCHAR;
    cbZero: USHORT;
  end;
  {$POP}

  LPSHCOLUMNINFO = ^SHCOLUMNINFO;
  LPCSHCOLUMNINFO = ^SHCOLUMNINFO;
  {$PUSH}
  {$PACKRECORDS 1}
  SHCOLUMNINFO = packed record
    scid: SHCOLUMNID;
    vt: VARTYPE;
    fmt: DWORD;
    cChars: UINT;
    csFlags: DWORD;
    wszTitle: array[0..MAX_COLUMN_NAME_LEN - 1] of WCHAR;
    wszDescription: array[0..MAX_COLUMN_DESC_LEN - 1] of WCHAR;
  end;
  {$POP}

  LPSHCOLUMNINIT = ^SHCOLUMNINIT;
  LPCSHCOLUMNINIT = ^SHCOLUMNINIT;
  SHCOLUMNINIT = record
    dwFlags: ULONG;
    dwReserved: ULONG;
    wszFolder: array[0..MAX_PATH - 1] of WCHAR;
  end;

  LPSHCOLUMNDATA = ^SHCOLUMNDATA;
  LPCSHCOLUMNDATA = ^SHCOLUMNDATA;
  SHCOLUMNDATA = record
    dwFlags: ULONG;
    dwFileAttributes: DWORD;
    dwReserved: ULONG;
    pwszExt: LPWSTR;
    wszFile: array[0..MAX_PATH - 1] of WCHAR;
  end;

  LPTBINFO = ^TBINFO;
  TBINFO = record
    cbuttons: UINT;
    uFlags: UINT;
  end;

  LPSFV_SETITEMPOS = ^SFV_SETITEMPOS;
  PCSFV_SETITEMPOS = ^SFV_SETITEMPOS;
  SFV_SETITEMPOS = record
    pidl: PCUITEMID_CHILD;
    pt: POINT;
  end;

  LPAASHELLMENUFILENAME = ^AASHELLMENUFILENAME;
  AASHELLMENUFILENAME = record
    cbTotal: SHORT;
    rgbReserved: array[0..11] of BYTE;
    szFileName: array[0..0] of WCHAR;
  end;

  LPAASHELLMENUITEM = ^AASHELLMENUITEM;
  AASHELLMENUITEM = record
    lpReserved1: Pointer;
    iReserved: Integer;
    uiReserved: UINT;
    lpName: LPAASHELLMENUFILENAME;
    psz: LPWSTR;
  end;

  // Interface INewShortcutHookA
  // ===========================
  //
  INewShortcutHookA = interface(IUnknown)
    ['{000214E1-0000-0000-C000-000000000046}']

    function SetReferent(pcszReferent: LPCSTR;
                         hwnd: HWND): HRESULT; stdcall;

    function GetReferent(pszReferent: LPSTR;
                         cchReferent: Integer): HRESULT; stdcall;

    function SetFolder(pcszFolder: LPCSTR): HRESULT; stdcall;

    function GetFolder(pszFolder: LPSTR;
                       cchFolder: Integer): HRESULT; stdcall;

    function GetName(pszName: LPSTR;
                     cchName: Integer): HRESULT; stdcall;

    function GetExtension(pszExtension: LPSTR;
                          cchExtension: Integer): HRESULT; stdcall;

  end;
  IID_INewShortcutHookA = INewShortcutHookA;

  // Interface INewShortcutHookW
  // ===========================
  //
  INewShortcutHookW = interface(IUnknown)
    ['{000214F7-0000-0000-C000-000000000046}']

    function SetReferent(pcszReferent: LPCWSTR;
                         hwnd: HWND): HRESULT; stdcall;

    function GetReferent(pszReferent: LPWSTR;
                         cchReferent: Integer): HRESULT; stdcall;

    function SetFolder(pcszFolder: LPCWSTR): HRESULT; stdcall;

    function GetFolder(pszFolder: LPWSTR;
                       cchFolder: Integer): HRESULT; stdcall;

    function GetName(pszName: LPWSTR;
                     cchName: Integer): HRESULT; stdcall;

    function GetExtension(pszExtension: LPWSTR;
                          cchExtension: Integer): HRESULT; stdcall;

  end;
  IID_INewShortcutHookW = INewShortcutHookW;

  {$IFDEF UNICODE}
  INewShortcutHook = INewShortcutHookW;
  {$ELSE}
  INewShortcutHook = INewShortcutHookA;
  {$ENDIF}

  // Interface ICopyHookA
  // =====================
  //
  ICopyHookA = interface(IUnknown)
    ['{000214EF-0000-0000-C000-000000000046}']

    function CopyCallback(hwnd: HWND;
                          wFunc: UINT;
                          wFlags: UINT;
                          pszSrcFile: LPCSTR;
                          dwSrcAttribs: DWORD;
                          pszDestFile: LPCSTR;
                          dwDestAttribs: DWORD): UINT; stdcall;

  end;
  IID_ICopyHookA = ICopyHookA;

  LPCOPYHOOKA = ^ICopyHookA;

  // Interface ICopyHookW
  // =====================
  //
  ICopyHookW = interface(IUnknown)
    ['{000214FC-0000-0000-C000-000000000046}']

    function CopyCallback(hwnd: HWND;
                          wFunc: UINT;
                          wFlags: UINT;
                          pszSrcFile: LPCWSTR;
                          dwSrcAttribs: DWORD;
                          pszDestFile: LPCWSTR;
                          dwDestAttribs: DWORD): UINT; stdcall;

  end;
  IID_ICopyHookW = ICopyHookW;

  LPCOPYHOOKW = ^ICopyHookW;

  {$IFDEF UNICODE}
  ICopyHook = ICopyHookW;
  LPCOPYHOOK = LPCOPYHOOKW;
  {$ELSE}
  ICopyHook = ICopyHookA;
  LPCOPYHOOK = LPCOPYHOOKA;
  {$ENDIF}

  // Interface ICurrentWorkingDirectory
  // ==================================
  //
  ICurrentWorkingDirectory = interface(IUnknown)
    ['{91956D21-9276-11D1-921A-006097DF5BD4}']

    function GetDirectory(pwzPath: LPWSTR;
                          cchSize: DWORD): HRESULT; stdcall;

    function SetDirectory(pwzPath: LPCWSTR): HRESULT; stdcall;

  end;
  IID_ICurrentWorkingDirectory = ICurrentWorkingDirectory;

  // Interface IDockingWindowFrame
  // =============================
  //
  IDockingWindowFrame = interface(IOleWindow)
    ['{47D2657A-7B27-11D0-8CA9-00A0C92DBFE8}']

    function AddToolbar(punkSrc: IUnknown;
                        pwszItem: LPCWSTR;
                        dwAddFlags: DWORD): HRESULT; stdcall;

    function RemoveToolbar(punkSrc: IUnknown;
                           dwRemoveFlags: DWORD): HRESULT; stdcall;

    function FindToolbar(pwszItem: LPCWSTR;
                         const riid: IID;
                         out ppv): HRESULT; stdcall;

  end;
  IID_IDockingWindowFrame = IDockingWindowFrame;

  // Interface IThumbnailCapture
  // ===========================
  //
  IThumbnailCapture = interface(IUnknown)
    ['{4EA39266-7211-409F-B622-F63DBD16C533}']

    function CaptureThumbnail(const pMaxSize: SIZE;
                              pHTMLDoc2: IUnknown;
                              out phbmThumbnail: HBITMAP): HRESULT; stdcall;

  end;
  IID_IThumbnailCapture = IThumbnailCapture;

  PBANDINFOSFB = ^BANDINFOSFB;
  BANDINFOSFB = record
    dwMask: DWORD;
    dwStateMask: DWORD;
    dwState: DWORD;
    crBkgnd: COLORREF;
    crBtnLt: COLORREF;
    crBtnDk: COLORREF;
    wViewMode: WORD;
    wAlign: WORD;
    psf: IShellFolder;
    pidl: PIDLIST_ABSOLUTE;
  end;

  // Interface IShellFolderBand
  // ==========================
  //
  IShellFolderBand = interface(IUnknown)
    ['{7FE80CC8-C247-11D0-B93A-00A0C90312E1}']

    function InitializeSFB(psf: IShellFolder;
                           pidl: PCIDLIST_ABSOLUTE): HRESULT; stdcall;

    function SetBandInfoSFB(pbi: PBANDINFOSFB): HRESULT; stdcall;

    function GetBandInfoSFB(pbi: PBANDINFOSFB): HRESULT; stdcall;

  end;
  IID_IShellFolderBand = IShellFolderBand;

  // Interface IDeskBarClient
  // ========================
  //
  IDeskBarClient = interface(IOleWindow)
    ['{EB0FE175-1A3A-11D0-89B3-00A0C90A90AC}']

    function SetDeskBarSite(punkSite: IUnknown): HRESULT; stdcall;

    function SetModeDBC(dwMode: DWORD): HRESULT; stdcall;

    function UIActivateDBC(dwState: DWORD): HRESULT; stdcall;

    function GetSize(dwWhich: DWORD;
                     prc: LPRECT): HRESULT; stdcall;

  end;
  IID_IDeskBarClient = IDeskBarClient;

  // Interface IActiveDesktopP
  // =========================
  //
  IActiveDesktopP = interface(IUnknown)
    ['{52502EE0-EC80-11D0-89AB-00C04FC2972D}']

    function SetSafeMode(dwFlags: DWORD): HRESULT; stdcall;

    function EnsureUpdateHTML(): HRESULT; stdcall;

    function SetScheme(pwszSchemeName: LPCWSTR;
                       dwFlags: DWORD): HRESULT; stdcall;

    function GetScheme(pwszSchemeName: LPWSTR;
                       var pdwcchBuffer: DWORD;
                       dwFlags: DWORD): HRESULT; stdcall;

  end;
  IID_IActiveDesktopP = IActiveDesktopP;

  LPACTIVEDESKTOPP = ^IActiveDesktopP;

  // Interface IADesktopP2
  // ======================
  //
  IADesktopP2 = interface(IUnknown)
    ['{B22754E2-4574-11D1-9888-006097DEACF9}']

    function ReReadWallpaper(): HRESULT; stdcall;

    function GetADObjectFlags(out pdwFlags: DWORD;
                              dwMask: DWORD): HRESULT; stdcall;

    function UpdateAllDesktopSubscriptions(): HRESULT; stdcall;

    function MakeDynamicChanges(pOleObj: IOleObject): HRESULT; stdcall;

  end;
  IID_IADesktopP2 = IADesktopP2;

  LPADESKTOPP2 = ^IADesktopP2;

  // Interface IColumnProvider
  // =========================
  //
  IColumnProvider = interface(IUnknown)
    ['{E8025004-1C42-11D2-BE2C-00A0C9A83DA1}']

    function Initialize(psci: LPCSHCOLUMNINIT): HRESULT; stdcall;

    function GetColumnInfo(dwIndex: DWORD;
                           out psci: SHCOLUMNINFO): HRESULT; stdcall;

    function GetItemData(pscid: LPCSHCOLUMNID;
                         pscd: LPCSHCOLUMNDATA;
                         out pvarData: VARIANT): HRESULT; stdcall;

  end;
  IID_IColumnProvider = IColumnProvider;

  // Interface IDocViewSite
  // ======================
  //
  IDocViewSite = interface(IUnknown)
    ['{87D605E0-C511-11CF-89A9-00A0C9054129}']

    function OnSetTitle(pvTitle: PVariantArg): HRESULT; stdcall;

  end;
  IID_IDocViewSite = IDocViewSite;

  // Interface IInitializeObject
  // ===========================
  //
  IInitializeObject = interface(IUnknown)
    ['{4622AD16-FF23-11D0-8D34-00A0C90F2719}']

    function Initialize(): HRESULT; stdcall;

  end;
  IID_IInitializeObject = IInitializeObject;

  // Interface IBanneredBar
  // ======================
  //
  IBanneredBar = interface(IUnknown)
    ['{596A9A94-013E-11D1-8D34-00A0C90F2719}']

    function SetIconSize(iIcon: DWORD): HRESULT; stdcall;

    function GetIconSize(out piIcon: DWORD): HRESULT; stdcall;

    function SetBitmap(hBitmap: HBITMAP): HRESULT; stdcall;

    function GetBitmap(out phBitmap: HBITMAP): HRESULT; stdcall;

  end;
  IID_IBanneredBar = IBanneredBar;

procedure SHChangeNotifyRegisterThread(status: SCNRT_STATUS); stdcall;

procedure PathQualify(psz: PWSTR); stdcall;

function PathIsSlowA(pszFile: LPCSTR;
                     dwAttr: DWORD): BOOL; stdcall;

function PathIsSlowW(pszFile: LPCWSTR;
                     dwAttr: DWORD): BOOL; stdcall;

{$IFDEF UNICODE}
function PathIsSlow(pszFile: LPCWSTR;
                    dwAttr: DWORD): BOOL; stdcall;
{$ELSE}
function PathIsSlow(pszFile: LPCSTR;
                    dwAttr: DWORD): BOOL; stdcall;
{$ENDIF}

function GetFileNameFromBrowse(hwnd: HWND;
                               pszFilePath: PWSTR;
                               cchFilePath: UINT;
                               pszWorkingDir: PCWSTR;
                               pszDefExt: PCWSTR;
                               pszFilters: PCWSTR;
                               pszTitle: PCWSTR): BOOL; stdcall;

function DriveType(iDrive: Integer): Integer; stdcall;

function SHCreatePropSheetExtArray(hKey: HKEY;
                                   pszSubKey: PCWSTR;
                                   max_iface: UINT): HPSXA; stdcall;

function SHOpenPropSheetA(pszCaption: LPCSTR;
                          ahkeys: PHKEY;
                          ckeys: UINT;
                          pclsidDefault: PCLSID;
                          pdtobj: IDataObject;
                          psb: IShellBrowser;
                          pStartPage: LPCSTR): BOOL; stdcall;

function SHOpenPropSheetW(pszCaption: LPCWSTR;
                          ahkeys: PHKEY;
                          ckeys: UINT;
                          pclsidDefault: PCLSID;
                          pdtobj: IDataObject;
                          psb: IShellBrowser;
                          pStartPage: LPCWSTR): BOOL; stdcall;

function SHShellFolderView_Message(hwndMain: HWND;
                                   uMsg: UINT;
                                   lParam: LPARAM): LRESULT; stdcall;

function SHMultiFileProperties(pdtobj: IDataObject;
                               dwFlags: DWORD): HRESULT; stdcall;

function SHCreateQueryCancelAutoPlayMoniker(out ppmoniker: IMoniker): HRESULT; stdcall;

procedure PerUserInit(); stdcall;

function SHRunControlPanel(lpcszCmdLine: PCWSTR;
                           hwndMsgParent: HWND): BOOL; stdcall;

function ImportPrivacySettings(pszFilename: PCWSTR;
                               var pfParsePrivacyPreferences: BOOL;
                               var pfParsePerSiteRules: BOOL): BOOL; stdcall;

// Moved to additiona implementatations in this unit.
//function DoPrivacyDlg(hwndOwner: HWND;
//                      pszUrl: PCWSTR;
//                      pPrivacyEnum: IEnumPrivacyRecords;
//                      fReportAllSites: BOOL): HRESULT; stdcall;
//{$EXTERNALSYM DoPrivacyDlg}

{$IFDEF UNICODE}
function SHOpenPropSheet(pszCaption: LPCWSTR;
                         ahkeys: PHKEY;
                         ckeys: UINT;
                         pclsidDefault: PCLSID;
                         pdtobj: IDataObject;
                         psb: IShellBrowser;
                         pStartPage: LPCWSTR): BOOL; stdcall;
{$ELSE}
function SHOpenPropSheet(pszCaption: LPCSTR;
                         ahkeys: PHKEY;
                         ckeys: UINT;
                         pclsidDefault: PCLSID;
                         pdtobj: IDataObject;
                         psb: IShellBrowser;
                         pStartPage: LPCSTR): BOOL; stdcall;
{$ENDIF}


// Additional Prototypes for ALL interfaces

type
  // Small Mshtml.h/Mshtml.idl dependency used by DoPrivacyDlg().
  // ShlObj.h only forward-declares this interface, but Delphi needs the
  // complete interface before the implementation section.
  // imported from Mshtml.h
  IEnumPrivacyRecords = interface(IUnknown)
    ['{3050F844-98B5-11CF-BB82-00AA00BDCE0B}']
    function Reset: HRESULT; stdcall;
    function GetSize(out pSize: ULONG): HRESULT; stdcall;
    function GetPrivacyImpacted(out pState: BOOL): HRESULT; stdcall;
    function Next(out pbstrUrl: BSTR;
                  out pbstrPolicyRef: BSTR;
                  pdwReserved: PLongint;
                  out pdwFlags: DWORD): HRESULT; stdcall;
  end;

  function DoPrivacyDlg(hwndOwner: HWND;
                      pszUrl: PCWSTR;
                      pPrivacyEnum: IEnumPrivacyRecords;
                      fReportAllSites: BOOL): HRESULT; stdcall;

// End of Additional Prototypes


implementation

const
  Shell32Lib = 'shell32.dll';
  ShDocVwLib = 'shdocvw.dll';



procedure SHChangeNotifyRegisterThread;   external Shell32Lib name 'SHChangeNotifyRegisterThread' ;
procedure PathQualify;                     external Shell32Lib name 'PathQualify' ;
function PathIsSlowA;                     external Shell32Lib name 'PathIsSlowA' ;
function PathIsSlowW;                     external Shell32Lib name 'PathIsSlowW' ;

{$IFDEF UNICODE}
function PathIsSlow;                      external Shell32Lib name 'PathIsSlowW' ;
{$ELSE}
function PathIsSlow;                      external Shell32Lib name 'PathIsSlowA' ;
{$ENDIF}

function GetFileNameFromBrowse;           external Shell32Lib name 'GetFileNameFromBrowse' ;
function DriveType;                       external Shell32Lib name 'DriveType' ;
function SHCreatePropSheetExtArray;       external Shell32Lib name 'SHCreatePropSheetExtArray' ;
function SHOpenPropSheetW;                external Shell32Lib name 'SHOpenPropSheetW' ;

{$IFDEF UNICODE}
{$ELSE}
{$ENDIF}

function SHShellFolderView_Message;       external Shell32Lib name 'SHShellFolderView_Message' ;
function SHMultiFileProperties;           external Shell32Lib name 'SHMultiFileProperties' ;
function SHCreateQueryCancelAutoPlayMoniker; external Shell32Lib name 'SHCreateQueryCancelAutoPlayMoniker' ;
function ImportPrivacySettings;           external ShDocVwLib name 'ImportPrivacySettings' ;
function DoPrivacyDlg;                    external ShDocVwLib name 'DoPrivacyDlg' ;


  // Implement Additional Prototypes here.


// Preserve nil, empty strings and integer resource identifiers when adapting
// ANSI entry points that are absent from current Windows x64 Shell32.
function AnsiShellStringToWide(Value: LPCSTR;
                              out Storage: UnicodeString;
                              out Text: LPCWSTR): HRESULT;
var
  Count: Integer;
begin
  Storage := '';
  Text := nil;
  if NativeUInt(Value) <= $FFFF then
  begin
    Text := LPCWSTR(Value);
    Exit(S_OK);
  end;
  Count := MultiByteToWideChar(CP_ACP,0,Value,-1,nil,0);
  if Count = 0 then
    Exit(HRESULT_FROM_WIN32(GetLastError));
  SetLength(Storage,Count);
  if MultiByteToWideChar(CP_ACP,0,Value,-1,PWideChar(Storage),Count) = 0 then
    Exit(HRESULT_FROM_WIN32(GetLastError));
  SetLength(Storage,Count - 1);
  Text := PWideChar(Storage);
  Result := S_OK;
end;

function SHOpenPropSheetA(pszCaption: LPCSTR;
                          ahkeys: PHKEY;
                          ckeys: UINT;
                          pclsidDefault: PCLSID;
                          pdtobj: IDataObject;
                          psb: IShellBrowser;
                          pStartPage: LPCSTR): BOOL; stdcall;
var
  CaptionStorage: UnicodeString;
  PageStorage: UnicodeString;
  Caption: LPCWSTR;
  Page: LPCWSTR;
  Status: HRESULT;
begin
  Status := AnsiShellStringToWide(pszCaption,CaptionStorage,Caption);
  if Status >= 0 then
    Status := AnsiShellStringToWide(pStartPage,PageStorage,Page);
  if Status < 0 then
  begin
    SetLastError(DWORD(Status) and $FFFF);
    Exit(False);
  end;
  Result := SHOpenPropSheetW(Caption,ahkeys,ckeys,pclsidDefault,pdtobj,psb,Page);
end;

function SHOpenPropSheet(pszCaption: LPCTSTR;
                         ahkeys: PHKEY;
                         ckeys: UINT;
                         pclsidDefault: PCLSID;
                         pdtobj: IDataObject;
                         psb: IShellBrowser;
                         pStartPage: LPCTSTR): BOOL; stdcall;
begin
  {$IFDEF UNICODE}
  Result := SHOpenPropSheetW(pszCaption,ahkeys,ckeys,pclsidDefault,pdtobj,psb,pStartPage);
  {$ELSE}
  Result := SHOpenPropSheetA(pszCaption,ahkeys,ckeys,pclsidDefault,pdtobj,psb,pStartPage);
  {$ENDIF}
end;

// These obsolete exports are optional on current Windows. Keep their legacy
// signatures and report unsupported calls through the Win32 last-error value.
procedure PerUserInit; stdcall;
type
  TPerUserInit = procedure; stdcall;
var
  LibraryHandle: HMODULE;
  Entry: TPerUserInit;
  Status: DWORD;
begin
  LibraryHandle := LoadLibraryW(PWideChar(UnicodeString(Shell32Lib)));
  Status := ERROR_CALL_NOT_IMPLEMENTED;
  try
    Entry := nil;
    if LibraryHandle <> 0 then
      Entry := TPerUserInit(GetProcAddress(LibraryHandle,'PerUserInit'));
    if Assigned(Entry) then
    begin
      Entry;
      Status := GetLastError;
    end;
  finally
    if LibraryHandle <> 0 then
      FreeLibrary(LibraryHandle);
    SetLastError(Status);
  end;
end;

function SHRunControlPanel(lpcszCmdLine: PCWSTR;
                            hwndMsgParent: HWND): BOOL; stdcall;
type
  TRunControlPanel = function(CommandLine: PCWSTR;Parent: HWND): BOOL; stdcall;
var
  LibraryHandle: HMODULE;
  Entry: TRunControlPanel;
  Status: DWORD;
begin
  Result := False;
  LibraryHandle := LoadLibraryW(PWideChar(UnicodeString(Shell32Lib)));
  Status := ERROR_CALL_NOT_IMPLEMENTED;
  try
    Entry := nil;
    if LibraryHandle <> 0 then
      Entry := TRunControlPanel(GetProcAddress(LibraryHandle,'SHRunControlPanel'));
    if Assigned(Entry) then
    begin
      Result := Entry(lpcszCmdLine,hwndMsgParent);
      Status := GetLastError;
    end;
  finally
    if LibraryHandle <> 0 then
      FreeLibrary(LibraryHandle);
    SetLastError(Status);
  end;
end;

end.

