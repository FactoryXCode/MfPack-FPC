// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.WinShellApi.ShTypes.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 25-09-2012
// Language: ENU
//
// Upstream revision: 4.1.0
//          Use MfPack WinShellApi declarations consistently in this FPC port.
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
// Remarks: Requires on some points Windows Vista or later.
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
// Source: shtypes.h
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
unit WinApi.WinShellApi.ShTypes;

{$I MfPack.Fpc.inc}


interface

uses

  {WinApi}
  Windows,
  WinApi.WinApiTypes;

  {$PACKENUM 4}

  {$IFDEF WIN32}
    {$ALIGN 1}
  {$ELSE}
  {$ALIGN 8}
  // Win64
  {$ENDIF}

  {$I 'WinApiTypes.inc'}


  //* Forward Declarations */

  //===========================================================================
  //
  // Object identifiers in the explorer's name space (ItemID and IDList)
  //
  //  All the items that the user can browse with the explorer (such as files,
  // directories, servers, work-groups, etc.) has an identifier which is unique
  // among items within the parent folder. Those identifiers are called item
  // IDs (SHITEMID). Since all its parent folders have their own item IDs,
  // any items can be uniquely identified by a list of item IDs, which is called
  // an ID list (ITEMIDLIST).
  //
  //  ID lists are almost always allocated by the task allocator (see some
  // description below as well as OLE 2.0 SDK) and may be passed across
  // some of shell interfaces (such as IShellFolder). Each item ID in an ID list
  // is only meaningful to its parent folder (which has generated it), and all
  // the clients must treat it as an opaque binary data except the first two
  // bytes, which indicates the size of the item ID.
  //
  //  When a shell extension -- which implements the IShellFolder interace --
  // generates an item ID, it may put any information in it, not only the data
  // with that it needs to identifies the item, but also some additional
  // information, which would help implementing some other functions efficiently.
  // For example, the shell's IShellFolder implementation of file system items
  // stores the primary (long) name of a file or a directory as the item
  // identifier, but it also stores its alternative (short) name, size and date
  // etc.
  //
  //  When an ID list is passed to one of shell APIs (such as SHGetPathFromIDList),
  // it is always an absolute path -- relative from the root of the name space,
  // which is the desktop folder. When an ID list is passed to one of IShellFolder
  // member function, it is always a relative path from the folder (unless it
  // is explicitly specified).
  //
  //===========================================================================
  //
  // SHITEMID -- Item ID  (mkid)
  //     USHORT      cb;             // Size of the ID (including cb itself)
  //     BYTE        abID[];         // The item ID (variable length)
  //
type

  LPSHITEMID = ^_SHITEMID;
  LPCSHITEMID = ^_SHITEMID;
  PSHITEMID = ^_SHITEMID;

  _SHITEMID = record
    cb: USHORT;
    abID: array [0..255] of Byte;
  end;
  SHITEMID = _SHITEMID;


  //
  // ITEMIDLIST -- List if item IDs (combined with 0-terminator)
  //

  PItemidlist = ^_ITEMIDLIST;

  _ITEMIDLIST = record
    mkid: SHITEMID;
  end;
  ITEMIDLIST = _ITEMIDLIST;

  PItemidlistRelative = ^ITEMIDLIST_RELATIVE;
  ITEMIDLIST_RELATIVE = ITEMIDLIST;

  PItemidChild = ^ITEMID_CHILD;
  ITEMID_CHILD = ITEMIDLIST;

  PItemidlistAbsolute = ^ITEMIDLIST_ABSOLUTE;
  ITEMIDLIST_ABSOLUTE = ITEMIDLIST;

  PByteBlob = ^BYTE_BLOB;
  BYTE_BLOB = pointer;

  LPITEMIDLIST = ^ITEMIDLIST;
  LPCITEMIDLIST = ^ITEMIDLIST;

  PIDLIST_ABSOLUTE = LPITEMIDLIST;
  PCIDLIST_ABSOLUTE = LPCITEMIDLIST;
  PCUIDLIST_ABSOLUTE = LPCITEMIDLIST;
  PIDLIST_RELATIVE = LPITEMIDLIST;
  PCIDLIST_RELATIVE = LPCITEMIDLIST;
  PUIDLIST_RELATIVE = LPITEMIDLIST;
  PCUIDLIST_RELATIVE = LPCITEMIDLIST;
  PITEMID_CHILD = LPITEMIDLIST;
  PCITEMID_CHILD = LPCITEMIDLIST;
  PUITEMID_CHILD = LPITEMIDLIST;
  PCUITEMID_CHILD = LPCITEMIDLIST;
  PCUITEMID_CHILD_ARRAY = LPCITEMIDLIST;
  PCUIDLIST_RELATIVE_ARRAY = LPCITEMIDLIST;
  PCIDLIST_ABSOLUTE_ARRAY = LPCITEMIDLIST;
  PCUIDLIST_ABSOLUTE_ARRAY = LPCITEMIDLIST;

type

  PWIN32_FIND_DATAA = ^_WIN32_FIND_DATAA;
  LPWIN32_FIND_DATAA = ^_WIN32_FIND_DATAA;
  PWin32FindDataa = ^_WIN32_FIND_DATAA;

  _WIN32_FIND_DATAA = record
    dwFileAttributes: DWORD;
    ftCreationTime: FILETIME;
    ftLastAccessTime: FILETIME;
    ftLastWriteTime: FILETIME;
    nFileSizeHigh: DWORD;
    nFileSizeLow: DWORD;
    dwReserved0: DWORD;
    dwReserved1: DWORD;
    cFileName: array[0..259] of AnsiChar;
    cAlternateFileName: array[0..13] of AnsiChar;
  end;
  WIN32_FIND_DATAA = _WIN32_FIND_DATAA;


  PWIN32_FIND_DATAW = ^_WIN32_FIND_DATAW;
  LPWIN32_FIND_DATAW = ^_WIN32_FIND_DATAW;
  PWin32FindDataw = ^_WIN32_FIND_DATAW;

  _WIN32_FIND_DATAW = record
    dwFileAttributes: DWORD;
    ftCreationTime: FILETIME;
    ftLastAccessTime: FILETIME;
    ftLastWriteTime: FILETIME;
    nFileSizeHigh: DWORD;
    nFileSizeLow: DWORD;
    dwReserved0: DWORD;
    dwReserved1: DWORD;
    cFileName: array[0..259] of WideChar;
    cAlternateFileName: array[0..13] of WideChar;
  end;
  WIN32_FIND_DATAW = _WIN32_FIND_DATAW;


  //-------------------------------------------------------------------------
  //
  // struct STRRET
  //
  // structure for returning strings from IShellFolder member functions
  //
  //-------------------------------------------------------------------------
  //
  //  uType indicate which union member to use
  //    STRRET_WSTR    Use STRRET.pOleStr     must be freed by caller of GetDisplayNameOf
  //    STRRET_OFFSET  Use STRRET.uOffset     Offset into SHITEMID for ANSI string
  //    STRRET_CSTR    Use STRRET.cStr        ANSI Buffer
  //
  PStrretType = ^tagSTRRET_TYPE;
  tagSTRRET_TYPE = (
    STRRET_WSTR = 0,
                    STRRET_OFFSET = $1,
                    STRRET_CSTR = $2);
  STRRET_TYPE = tagSTRRET_TYPE;


  // Contains strings returned from the IShellFolder interface methods.
  // To convert this structure to a string, use StrRetToBuf or StrRetToStr (Shlwapi.h).
  LPSTRRET = ^STRRET;
  PSTRRET = ^_STRRET;

  _STRRET = record
    uType: UINT; //
    case integer of
      0: (pOleStr: PWideChar;);
      1: (uOffset: UINT;);
      2: (cStr: array[0..MAX_PATH - 1 {=259}] of AnsiChar;);
  end;
  STRRET = _STRRET;
  //Members
  // uType: UINT;
  //  A value that specifies the desired format of the string.
  //  This can be one of the following values.
  //    STRRET_CSTR
  //      The string is returned in the cStr member.
  //    STRRET_OFFSET
  //      The uOffset member value indicates the number of bytes from the beginning of the item identifier list where the string is located.
  //    STRRET_WSTR
  //      The string is at the address specified by pOleStr member.
  //
  // pOleStr
  //  Type: LPWSTR
  //   A pointer to the string.
  //   This memory must be allocated with CoTaskMemAlloc.
  //   It is the calling application's responsibility to free this memory
  //   with CoTaskMemFree when it is no longer needed.
  // uOffset
  //  Type: UINT
  //   The offset into the item identifier list.
  // cStr
  //  Type: CHAR[MAX_PATH]
  //   The buffer to receive the display name.

  //-------------------------------------------------------------------------
  //
  // struct SHELLDETAILS
  //
  // structure for returning strings from IShellDetails
  //
  //-------------------------------------------------------------------------
  //
  //  fmt;            // LVCFMT_* value (header only)
  //  cxChar;         // Number of 'average' characters (header only)
  //  str;            // String information
  //

type

  LPSHELLDETAILS = ^_SHELLDETAILS;
  PShelldetails = ^_SHELLDETAILS;

  _SHELLDETAILS = record
    fmt: Integer;
    cxChar: Integer;
    str: STRRET;
  end;
  SHELLDETAILS = _SHELLDETAILS;


  PPerceived = ^tagPERCEIVED;
  tagPERCEIVED = LongInt;
  PERCEIVED = tagPERCEIVED;


const
  SHCOLSTATE_DEFAULT = LongInt(0);
  SHCOLSTATE_TYPE_STR = LongInt($1);
  SHCOLSTATE_TYPE_INT = LongInt($2);
  SHCOLSTATE_TYPE_DATE = LongInt($3);
  SHCOLSTATE_TYPEMASK = LongInt($F);
  SHCOLSTATE_ONBYDEFAULT = LongInt($10);
  SHCOLSTATE_SLOW = LongInt($20);
  SHCOLSTATE_EXTENDED = LongInt($40);
  SHCOLSTATE_SECONDARYUI = LongInt($80);
  SHCOLSTATE_HIDDEN = LongInt($100);
  SHCOLSTATE_PREFER_VARCMP = LongInt($200);
  SHCOLSTATE_PREFER_FMTCMP = LongInt($400);
  SHCOLSTATE_NOSORTBYFOLDERNESS = LongInt($800);
  SHCOLSTATE_VIEWONLY = LongInt($10000);
  SHCOLSTATE_BATCHREAD = LongInt($20000);
  SHCOLSTATE_NO_GROUPBY = LongInt($40000);
  SHCOLSTATE_FIXED_WIDTH = LongInt($1000);
  SHCOLSTATE_NODPISCALE = LongInt($2000);
  SHCOLSTATE_FIXED_RATIO = LongInt($4000);
  SHCOLSTATE_DISPLAYMASK = LongInt($F000);

  PERCEIVED_TYPE_FIRST = LongInt(-3);
  PERCEIVED_TYPE_CUSTOM = LongInt(-3);
  PERCEIVED_TYPE_UNSPECIFIED = LongInt(-2);
  PERCEIVED_TYPE_FOLDER = LongInt(-1);
  PERCEIVED_TYPE_UNKNOWN = LongInt(0);
  PERCEIVED_TYPE_TEXT = LongInt(1);
  PERCEIVED_TYPE_IMAGE = LongInt(2);
  PERCEIVED_TYPE_AUDIO = LongInt(3);
  PERCEIVED_TYPE_VIDEO = LongInt(4);
  PERCEIVED_TYPE_COMPRESSED = LongInt(5);
  PERCEIVED_TYPE_DOCUMENT = LongInt(6);
  PERCEIVED_TYPE_SYSTEM = LongInt(7);
  PERCEIVED_TYPE_APPLICATION = LongInt(8);
  PERCEIVED_TYPE_GAMEMEDIA = LongInt(9);
  PERCEIVED_TYPE_CONTACTS = LongInt(10);
  PERCEIVED_TYPE_LAST = LongInt(10);


  PERCEIVEDFLAG_UNDEFINED = $0000;
  PERCEIVEDFLAG_SOFTCODED = $0001;
  PERCEIVEDFLAG_HARDCODED = $0002;
  PERCEIVEDFLAG_NATIVESUPPORT = $0004;
  PERCEIVEDFLAG_GDIPLUS = $0010;
  PERCEIVEDFLAG_WMSDK = $0020;
  PERCEIVEDFLAG_ZIPFOLDER = $0040;

type

  PPERCEIVEDFLAG = ^PERCEIVEDFLAG;
  PERCEIVEDFLAG = DWORD;


  // >= Vista
  PCOMDLG_FILTERSPEC = ^_COMDLG_FILTERSPEC;

  _COMDLG_FILTERSPEC = record
    pszName: PWideChar;
    { [string] }
    pszSpec: PWideChar;
    { [string] }
  end;
  COMDLG_FILTERSPEC = _COMDLG_FILTERSPEC;

  PKnownfolderid = ^KNOWNFOLDERID;
  KNOWNFOLDERID = TGUID;

  REFKNOWNFOLDERID = ^KNOWNFOLDERID;

  PKF_REDIRECT_FLAGS = ^KF_REDIRECT_FLAGS;
  KF_REDIRECT_FLAGS = DWORD;

  PFOLDERTYPEID = ^FOLDERTYPEID;
  FOLDERTYPEID = TGUID;

  REFFOLDERTYPEID = ^FOLDERTYPEID;

  PTaskownerid = ^TASKOWNERID;
  TASKOWNERID = TGUID;

  REFTASKOWNERID = ^TASKOWNERID;

  PElementid = ^ELEMENTID;
  ELEMENTID = TGUID;

  REFELEMENTID = ^ELEMENTID;

  PLogfonta = ^LOGFONTA;

  tagLOGFONTA = record
    lfHeight: LONG;
    lfWidth: LONG;
    lfEscapement: LONG;
    lfOrientation: LONG;
    lfWeight: LONG;
    lfItalic: Byte;
    lfUnderline: Byte;
    lfStrikeOut: Byte;
    lfCharSet: Byte;
    lfOutPrecision: Byte;
    lfClipPrecision: Byte;
    lfQuality: Byte;
    lfPitchAndFamily: Byte;
    lfFaceName: array[0..31] of AnsiChar;
  end;
  LOGFONTA = tagLOGFONTA;

  PLogfontw = ^LOGFONTW;

  tagLOGFONTW = record
    lfHeight: LONG;
    lfWidth: LONG;
    lfEscapement: LONG;
    lfOrientation: LONG;
    lfWeight: LONG;
    lfItalic: Byte;
    lfUnderline: Byte;
    lfStrikeOut: Byte;
    lfCharSet: Byte;
    lfOutPrecision: Byte;
    lfClipPrecision: Byte;
    lfQuality: Byte;
    lfPitchAndFamily: Byte;
    lfFaceName: array[0..31] of WideChar;
  end;
  LOGFONTW = tagLOGFONTW;

  LOGFONT = LOGFONTW;
  PLogfont = ^LOGFONT;

  PShcolstate = ^SHCOLSTATE;
  tagSHCOLSTATE = LongInt;
  SHCOLSTATE = tagSHCOLSTATE;

  PShcolstatef = ^SHCOLSTATEF;
  SHCOLSTATEF = DWORD;

  PShcolumnid = ^SHCOLUMNID;
  SHCOLUMNID = PROPERTYKEY;

  LPCSHCOLUMNID = ^SHCOLUMNID;

  PDEVICE_SCALE_FACTOR = ^DEVICE_SCALE_FACTOR;
  DEVICE_SCALE_FACTOR = (
    DEVICE_SCALE_FACTOR_INVALID = 0,
                         SCALE_100_PERCENT = 100,
                         SCALE_120_PERCENT = 120,
                         SCALE_125_PERCENT = 125,
                         SCALE_140_PERCENT = 140,
                         SCALE_150_PERCENT = 150,
                         SCALE_160_PERCENT = 160,
                         SCALE_175_PERCENT = 175,
                         SCALE_180_PERCENT = 180,
                         SCALE_200_PERCENT = 200,
                         SCALE_225_PERCENT = 225,
                         SCALE_250_PERCENT = 250,
                         SCALE_300_PERCENT = 300,
                         SCALE_350_PERCENT = 350,
                         SCALE_400_PERCENT = 400,
                         SCALE_450_PERCENT = 450,
                         SCALE_500_PERCENT = 500);


  // Additional Prototypes for ALL interfaces

type

  // To prevent name mangling, we moved Delphi's implementations in WinApi.ShellAPI to here.

  LPSHELLEXECUTEINFOA = ^SHELLEXECUTEINFOA;

  SHELLEXECUTEINFOA = record
    cbSize: DWORD;
    fMask: ULONG;
    Wnd: HWND;
    lpVerb: LPCSTR;
    lpFile: LPCSTR;
    lpParameters: LPCSTR;
    lpDirectory: LPCSTR;
    nShow: Integer;
    hInstApp: HINST;
    lpIDList: Pointer;
    lpClass: LPCSTR;
    hkeyClass: HKEY;
    dwHotKey: DWORD;
    hIcon: THandle;
    hProcess: THandle;
  end;

  LPSHELLEXECUTEINFOW = ^SHELLEXECUTEINFOW;

  SHELLEXECUTEINFOW = record
    cbSize: DWORD;
    fMask: ULONG;
    Wnd: HWND;
    lpVerb: LPCWSTR;
    lpFile: LPCWSTR;
    lpParameters: LPCWSTR;
    lpDirectory: LPCWSTR;
    nShow: Integer;
    hInstApp: HINST;
    lpIDList: Pointer;
    lpClass: LPCWSTR;
    hkeyClass: HKEY;
    dwHotKey: DWORD;
    hIcon: THandle;
    hProcess: THandle;
  end;

  // End of Additional Prototypes

implementation

// Implement Additional Prototypes here.

end.
