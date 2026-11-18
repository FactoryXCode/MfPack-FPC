// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.ActiveX.PropVarUtil.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 13-02-2016
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: Variant and PropVariant helpers.
//
// Organisation: FactoryX
// Initiator(s): Tony (maXcomX), Peter (OzShips)
// Contributor(s): Tony Kalf (maXcomX),
//                 Peter Larson (ozships)
//                 Carmen (carmenh)
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
// Source: propvarutil.h
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
unit WinApi.ActiveX.PropVarUtil;

{$I MfPack.Fpc.inc}


interface

uses

  {WinApi}
  Windows,
  WinApi.WinApiTypes,
  {WinShellApi}
  WinApi.WinShellApi.ShTypes,
  {ActiveX}
  WinApi.ActiveX.PropIdl,
  WinApi.ActiveX.OaIdl;

  {$PACKENUM 4}

  {$IFDEF WIN32}
    {$ALIGN 1}
  {$ELSE}
    {$ALIGN 8} // Win64
  {$ENDIF}

  {$I 'WinApiTypes.inc'}

// typedef _Return_type_success_(return >= 0) LONG NTSTATUS;

const
  // PSTIME_FLAGS
  PSTF_UTC   = $00000000;
  PSTF_LOCAL = $00000001;

type
  tagPSTIME_FLAGS = type integer;
  PSTIME_FLAGS = tagPSTIME_FLAGS;


//====================
//
// PropVariant Helpers
//
//====================

// Initialize a propvariant
function InitPropVariantFromResource(hinst: HINSTANCE;
                                     id: UINT;
                                     out ppropvar: PROPVARIANT): HResult; stdcall;

function InitPropVariantFromBuffer(pv: Pointer;
                                   cb: UINT;
                                   out ppropvar: PROPVARIANT): HResult; stdcall;

function InitPropVariantFromCLSID(const clsid: REFCLSID;
                                  out ppropvar: PROPVARIANT): HResult; stdcall;

function InitPropVariantFromGUIDAsString(const guid: REFGUID;
                                         out ppropvar: PROPVARIANT): HResult; stdcall;

function InitPropVariantFromFileTime(pftIn: FILETIME;
                                     out ppropvar: PROPVARIANT): HResult; stdcall;

function InitPropVariantFromPropVariantVectorElem(propvarIn: PROPVARIANT;
                                                  iElem: ULONG;
                                                  out ppropvar: PROPVARIANT): HResult; stdcall;

function InitPropVariantVectorFromPropVariant(propvarSingle: PROPVARIANT;
                                              out ppropvarVector: PROPVARIANT): HResult; stdcall;

function InitPropVariantFromStrRet(var pstrret: STRRET;
                                   pidl: PCUITEMID_CHILD;
                                   out ppropvar: PROPVARIANT): HResult; stdcall;

function InitPropVariantFromBooleanVector(prgf: BOOL;
                                          cElems: ULONG;
                                          out ppropvar: PROPVARIANT): HResult; stdcall;

function InitPropVariantFromInt16Vector(prgn: SHORT;
                                        cElems: ULONG;
                                        out ppropvar: PROPVARIANT): HResult; stdcall;

function InitPropVariantFromUInt16Vector(prgn: USHORT;
                                         cElems: ULONG;
                                         out ppropvar: PROPVARIANT): HResult; stdcall;

function InitPropVariantFromInt32Vector(prgn: LONG;
                                        cElems: ULONG;
                                        out ppropvar: PROPVARIANT): HResult; stdcall;

function InitPropVariantFromUInt32Vector(prgn: ULONG;
                                         cElems: ULONG;
                                         out ppropvar: PROPVARIANT): HResult; stdcall;

function InitPropVariantFromInt64Vector(prgn: LONGLONG;
                                        cElems: ULONG;
                                        out ppropvar: PROPVARIANT): HResult; stdcall;

function InitPropVariantFromUInt64Vector(prgn: ULONGLONG;
                                         cElems: ULONG;
                                         out ppropvar: PROPVARIANT): HResult; stdcall;

function InitPropVariantFromDoubleVector(prgn: DOUBLE;
                                         cElems: ULONG;
                                         out ppropvar: PROPVARIANT): HResult; stdcall;

function InitPropVariantFromFileTimeVector(prgft: FILETIME;
                                           cElems: ULONG;
                                           out ppropvar: PROPVARIANT): HResult; stdcall;

function InitPropVariantFromStringVector(prgsz: PCWSTR;
                                         cElems: ULONG;
                                         out ppropvar: PROPVARIANT): HResult; stdcall;

function InitPropVariantFromStringAsVector(psz: PCWSTR;
                                           out ppropvar: PROPVARIANT): HResult; stdcall;

// Inline Helpers
//===============
// Note:
// Compilers < D 2005 do not support the inline directive.
// Inline functions are best reserved for small, frequently used functions.

function InitPropVariantFromBoolean(fVal: BOOL;
                                    out ppropvar: PROPVARIANT): HResult; inline;

function InitPropVariantFromInt16(nVal: SHORT;
                                  out ppropvar: PROPVARIANT): HResult; inline;

function InitPropVariantFromUInt16(uiVal: USHORT;
                                   out ppropvar: PROPVARIANT): HResult; inline;

function InitPropVariantFromInt32(lVal: LONG;
                                  out ppropvar: PROPVARIANT): HResult; inline;

function InitPropVariantFromUInt32(ulVal: ULONG;
                                   out ppropvar: PROPVARIANT): HResult; inline;

function InitPropVariantFromInt64(llVal: LONGLONG;
                                  out ppropvar: PROPVARIANT): HResult; inline;

function InitPropVariantFromUInt64(ullVal: ULONGLONG;
                                   out ppropvar: PROPVARIANT): HResult; inline;

function InitPropVariantFromDouble(dblVal: DOUBLE;
                                   out ppropvar: PROPVARIANT): HResult; inline;

// Creates a VT_LPWSTR propvariant.
function InitPropVariantFromString(psz: LPCWSTR;
                                   out ppropvar: PROPVARIANT): HResult; inline;

// Creates a VT_VECTOR | VT_UI1 propvariant.
function InitPropVariantFromGUIDAsBuffer(const guid: REFGUID;
                                         out ppropvar: PROPVARIANT): HResult; inline;

function IsPropVariantVector(const propvar: PROPVARIANT): BOOL; inline;

// If this function returns TRUE,
// the PROPVARIANT structure referenced in propvar contains a Unicode string.
// Use PropVariantToStringWithDefault(propvar, Nil) to retrieve it.
function IsPropVariantString(const propvar: PROPVARIANT): BOOL; inline;



// Extract data from a propvariant
// ===============================
function PropVariantToBooleanWithDefault(const propvarIn: PROPVARIANT;
                                         fDefault: BOOL): Boolean; stdcall;

function PropVariantToInt16WithDefault(const propvarIn: PROPVARIANT;
                                       iDefault: SHORT): SHORT; stdcall;

function PropVariantToUInt16WithDefault(const propvarIn: PROPVARIANT;
                                        uiDefault: USHORT): USHORT; stdcall;

function PropVariantToInt32WithDefault(const propvarIn: PROPVARIANT;
                                       lDefault: LONG): LONG; stdcall;

function PropVariantToUInt32WithDefault(const propvarIn: PROPVARIANT;
                                        ulDefault: ULONG): ULONG; stdcall;

function PropVariantToInt64WithDefault(const propvarIn: PROPVARIANT;
                                       llDefault: LONGLONG): LONGLONG; stdcall;

function PropVariantToUInt64WithDefault(const propvarIn: PROPVARIANT;
                                        ullDefault: ULONGLONG): ULONGLONG; stdcall;

function PropVariantToDoubleWithDefault(const propvarIn: PROPVARIANT;
                                        dblDefault: DOUBLE): DOUBLE; stdcall;

function PropVariantToStringWithDefault(const propvarIn: PROPVARIANT;
                                        pszDefault: LPCWSTR): LPCWSTR; stdcall;

function PropVariantToBoolean(const propvarIn: PROPVARIANT;
                              out pfRet: BOOL): HResult; stdcall;

function PropVariantToInt16(const propvarIn: PROPVARIANT;
                            out piRet: SHORT): HResult; stdcall;

function PropVariantToUInt16(const propvarIn: PROPVARIANT;
                             out puiRet: USHORT): HResult; stdcall;

function PropVariantToInt32(const propvarIn: PROPVARIANT;
                            out plRet: LONG): HResult; stdcall;

function PropVariantToUInt32(const propvarIn: PROPVARIANT;
                             out pulRet: ULONG): HResult; stdcall;

function PropVariantToInt64(const propvarIn: PROPVARIANT;
                            out pllRet: LONGLONG): HResult; stdcall;

function PropVariantToUInt64(const propvarIn: PROPVARIANT;
                             out pullRet: ULONGLONG): HResult; stdcall;

function PropVariantToDouble(const propvarIn: PROPVARIANT;
                             out pdblRet: DOUBLE): HResult; stdcall;

function PropVariantToBuffer(const propvar: PROPVARIANT;
                             var pv;
                             cb: UINT): HResult; stdcall;

function PropVariantToString(const propvar: PROPVARIANT;
                             out psz: PWideChar;
                             cch: UINT): HResult; stdcall;

function PropVariantToGUID(const propvar: PROPVARIANT;
                           out pguid: TGUID): HResult; stdcall;

function PropVariantToStringAlloc(const propvar: PROPVARIANT;
                                  out ppszOut: LPCWSTR): HResult; stdcall;

function PropVariantToBSTR(const propvar: PROPVARIANT;
                           out pbstrOut: BSTR): HResult; stdcall;

function PropVariantToStrRet(const propvar: PROPVARIANT;
                             var pstrret: STRRET): HResult; stdcall;

function PropVariantToFileTime(const propvar: PROPVARIANT;
                               pstfOut: PSTIME_FLAGS;
                               out pftOut: FILETIME): HResult; stdcall;


function PropVariantToCLSID(const propvarIn: PROPVARIANT;
                            out pclsid: CLSID): HRESULT; inline;


// Returns element count of a VT_VECTOR or VT_ARRAY value; or 1 otherwise
function PropVariantGetElementCount(const vpropvar: PROPVARIANT): ULONG; stdcall;

// Extract data from a propvariant into a vector
function PropVariantToBooleanVector(const propvar: PROPVARIANT;
                                    out prgf: BOOL;
                                    crgf: ULONG;
                                    out pcElem: ULONG): HResult; stdcall;

function PropVariantToInt16Vector(const propvar: PROPVARIANT;
                                  out prgn: SHORT;
                                  crgn: ULONG;
                                  out pcElem: ULONG): HResult; stdcall;

function PropVariantToUInt16Vector(const propvar: PROPVARIANT;
                                   out prgn: USHORT;
                                   crgn: ULONG;
                                   out pcElem: ULONG): HResult; stdcall;

function PropVariantToInt32Vector(const propvar: PROPVARIANT;
                                  out prgn: LONG;
                                  crgn: ULONG;
                                  out pcElem: ULONG): HResult; stdcall;

function PropVariantToUInt32Vector(const propvar: PROPVARIANT;
                                   out prgn: ULONG;
                                   crgn: ULONG;
                                   out pcElem: ULONG): HResult; stdcall;

function PropVariantToInt64Vector(const propvar: PROPVARIANT;
                                  out prgn: LONGLONG;
                                  crgn: ULONG;
                                  out pcElem: ULONG): HResult; stdcall;

function PropVariantToUInt64Vector(const propvar: PROPVARIANT;
                                   out prgn: ULONGLONG;
                                   crgn: ULONG;
                                   out pcElem: ULONG): HResult; stdcall;

function PropVariantToDoubleVector(const propvar: PROPVARIANT;
                                   out prgn: DOUBLE;
                                   crgn: ULONG;
                                   out pcElem: ULONG): HResult; stdcall;

function PropVariantToFileTimeVector(const propvar: PROPVARIANT;
                                     out prgft: FILETIME;
                                     crgft: ULONG;
                                     out pcElem: ULONG): HResult; stdcall;

function PropVariantToStringVector(const propvar: PROPVARIANT;
                                   out prgsz: LPCWSTR;
                                   crgsz: ULONG;
                                   out pcElem: ULONG): HResult; stdcall;


// Extract data from a propvariant and return an newly
// allocated vector (free with CoTaskMemFree)

function PropVariantToBooleanVectorAlloc(const propvar: PROPVARIANT;
                                         out pprgf: PBOOL;
                                         out pcElem: ULONG): HResult; stdcall;

function PropVariantToInt16VectorAlloc(const propvar: PROPVARIANT;
                                       out pprgn: PSHORT;
                                       out pcElem: ULONG): HResult; stdcall;

function PropVariantToUInt16VectorAlloc(const propvar: PROPVARIANT;
                                        out pprgn: PUSHORT;
                                        out pcElem: ULONG): HResult; stdcall;

function PropVariantToInt32VectorAlloc(const propvar: PROPVARIANT;
                                       out pprgn: PLONG;
                                       out pcElem: ULONG): HResult; stdcall;

function PropVariantToUInt32VectorAlloc(const propvar: PROPVARIANT;
                                        out pprgn: PULONG;
                                        out pcElem: ULONG): HResult; stdcall;

function PropVariantToInt64VectorAlloc(const propvar: PROPVARIANT;
                                       out pprgn: PLONGLONG;
                                       out pcElem: ULONG): HResult; stdcall;

function PropVariantToUInt64VectorAlloc(const propvar: PROPVARIANT;
                                        out pprgn: PULONGLONG;
                                        out pcElem: ULONG): HResult; stdcall;

function PropVariantToDoubleVectorAlloc(const propvar: PROPVARIANT;
                                        out pprgn: PDOUBLE;
                                        out pcElem: ULONG): HResult; stdcall;

function PropVariantToFileTimeVectorAlloc(const propvar: PROPVARIANT;
                                          out pprgft: PFILETIME;
                                          out pcElem: ULONG): HResult; stdcall;

function PropVariantToStringVectorAlloc(const propvar: PROPVARIANT;
                                        out pprgsz: PPWideChar;
                                        out pcElem: ULONG): HResult; stdcall;


// Extract a single element from a propvariant.
// If it is a VT_VECTOR or VT_ARRAY, returns the element you request.
// Otherwise iElem must equal 0 and the function will returns the value.

function PropVariantGetBooleanElem(const propvar: PROPVARIANT;
                                   iElem: ULONG;
                                   out pfVal: BOOL): HResult; stdcall;

function PropVariantGetInt16Elem(const propvar: PROPVARIANT;
                                 iElem: ULONG;
                                 out pnVal: SHORT): HResult; stdcall;

function PropVariantGetUInt16Elem(const propvar: PROPVARIANT;
                                  iElem: ULONG;
                                  out pnVal: USHORT): HResult; stdcall;

function PropVariantGetInt32Elem(const propvar: PROPVARIANT;
                                 iElem: ULONG;
                                 out pnVal: LONG): HResult; stdcall;

function PropVariantGetUInt32Elem(const propvar: PROPVARIANT;
                                  iElem: ULONG;
                                  out pnVal: ULONG): HResult; stdcall;

function PropVariantGetInt64Elem(const propvar: PROPVARIANT;
                                 iElem: ULONG;
                                 out pnVal: LONGLONG): HResult; stdcall;

function PropVariantGetUInt64Elem(propvar: PROPVARIANT;
                                  iElem: ULONG;
                                  out pnVal: ULONGLONG): HResult; stdcall;

function PropVariantGetDoubleElem(const propvar: PROPVARIANT;
                                  iElem: ULONG;
                                  out pnVal: DOUBLE): HResult; stdcall;

function PropVariantGetFileTimeElem(const propvar: PROPVARIANT;
                                    iElem: ULONG;
                                    out pftVal: FILETIME): HResult; stdcall;

function PropVariantGetStringElem(const propvar: PROPVARIANT;
                                  iElem: ULONG;
                                  out ppszVal: LPCWSTR): HResult; stdcall;



function PropVariantGetElem(const propvarIn: PROPVARIANT;
                            iElem: ULONG;
                            out ppropvar: PROPVARIANT): HResult; inline;

// Helpers
procedure ClearPropVariantArray(var rgPropVar: PROPVARIANT;
                                cVars: UINT); stdcall;



type
  PPropvarCompareUnit = ^PROPVAR_COMPARE_UNIT;
  PROPVAR_COMPARE_UNIT = (PVCU_DEFAULT = 0,
                          PVCU_SECOND  = 1,
                          PVCU_MINUTE  = 2,
                          PVCU_HOUR    = 3,
                          PVCU_DAY     = 4,
                          PVCU_MONTH   = 5,
                          PVCU_YEAR    = 6
  );


  tagPROPVAR_COMPARE_FLAGS = type integer;

const
  // PROPVAR_COMPARE_FLAGS
  PVCF_DEFAULT                       = $00000000; // When comparing strings, use StrCmpLogical
  PVCF_TREATEMPTYASGREATERTHAN       = $00000001; // Empty/null values are greater-than non-empty values
  PVCF_USESTRCMP                     = $00000002; // When comparing strings, use StrCmp
  PVCF_USESTRCMPC                    = $00000004; // When comparing strings, use StrCmpC
  PVCF_USESTRCMPI                    = $00000008; // When comparing strings, use StrCmpI
  PVCF_USESTRCMPIC                   = $00000010; // When comparing strings, use StrCmpIC
  PVCF_DIGITSASNUMBERS_CASESENSITIVE = $00000020; // When comparing strings, use CompareStringEx with LOCALE_NAME_USER_DEFAULT and SORT_DIGITSASNUMBERS.  This corresponds to the linguistically correct order for UI lists.

type
  PROPVAR_COMPARE_FLAGS = tagPROPVAR_COMPARE_FLAGS;

// Comparisons
function PropVariantCompareEx(const propvar1: PROPVARIANT;
                              const propvar2: PROPVARIANT;
                              _unit: PROPVAR_COMPARE_UNIT;
                              flags: PROPVAR_COMPARE_FLAGS): integer; stdcall;

function PropVariantCompare(const propvar1: PROPVARIANT;
                            const propvar2: PROPVARIANT): integer; inline;


type
  tagPROPVAR_CHANGE_FLAGS = type integer;

const
    // PROPVAR_CHANGE_FLAGS
    PVCHF_DEFAULT           = $00000000;
    PVCHF_NOVALUEPROP       = $00000001; // Maps to VARIANT_NOVALUEPROP for VariantChangeType
    PVCHF_ALPHABOOL         = $00000002; // Maps to VARIANT_ALPHABOOL for VariantChangeType
    PVCHF_NOUSEROVERRIDE    = $00000004; // Maps to VARIANT_NOUSEROVERRIDE for VariantChangeType
    PVCHF_LOCALBOOL         = $00000008; // Maps to VARIANT_LOCALBOOL for VariantChangeType
    PVCHF_NOHEXSTRING       = $00000010; // Don't convert a string that looks like hexadecimal (0xABCD) to the numerical equivalent
type
  PROPVAR_CHANGE_FLAGS = tagPROPVAR_CHANGE_FLAGS;

// Conversions

function PropVariantChangeType(var ppropvarDest: PROPVARIANT;
                               const propvarSrc: PROPVARIANT;
                               flags: PROPVAR_CHANGE_FLAGS;
                               vt: VARTYPE): HResult; stdcall;

function PropVariantToVariant(const pPropVar: PROPVARIANT;
                              out pVar: VARIANT): HResult; stdcall;

function VariantToPropVariant(const pVar: VARIANT;
                              out pPropVar: PROPVARIANT): HResult; stdcall;

 // Stg functions
function StgSerializePropVariant(const ppropvar: PROPVARIANT;
                                 out ppProp: PSERIALIZEDPROPERTYVALUE;
                                 out pcb: ULONG): HResult; stdcall;

function StgDeserializePropVariant(pprop: SERIALIZEDPROPERTYVALUE;
                                   cbMax: ULONG;
                                   out ppropvar: PROPVARIANT): HResult; stdcall;


//================
//
// Variant Helpers
//
//================

function IsVarTypeFloat(vt: VARTYPE): BOOL; stdcall;
function IsVariantArray(_var: REFVARIANT): BOOL; stdcall;
function IsVariantString(_var: REFVARIANT): BOOL; stdcall;
function IsVarTypeNumber(vt: VARTYPE): BOOL; stdcall;
function IsVarTypeInteger(vt: VARTYPE): BOOL; stdcall;


// Initialize a VARIANT

function InitVariantFromResource(hinst: HINSTANCE;
                                 id: UINT;
                                 out pvar: VARIANT): HResult; stdcall;

function InitVariantFromBuffer(pv: Pointer;
                               cb: UINT;
                               out pvar: VARIANT): HResult; stdcall;

function InitVariantFromGUIDAsString(guid: REFGUID;
                                     out pvar: VARIANT): HResult; stdcall;

function InitVariantFromFileTime(pft: FILETIME;
                                 out pvar: VARIANT): HResult; stdcall;

function InitVariantFromFileTimeArray(prgft: FILETIME;
                                      cElems: ULONG;
                                      out pvar: VARIANT): HResult; stdcall;

function InitVariantFromStrRet(pstrret: STRRET;
                               pidl: PCUITEMID_CHILD;
                               out pvar: VARIANT): HResult; stdcall;

function InitVariantFromVariantArrayElem(varIn: REFVARIANT;
                                         iElem: ULONG;
                                         out pvar: VARIANT): HResult; stdcall;

function InitVariantFromBooleanArray(prgf: BOOL;
                                     cElems: ULONG;
                                     out pvar: VARIANT): HResult; stdcall;

function InitVariantFromInt16Array(prgn: SHORT;
                                   cElems: ULONG;
                                   out pvar: VARIANT): HResult; stdcall;

function InitVariantFromUInt16Array(prgn: USHORT;
                                    cElems: ULONG;
                                    out pvar: VARIANT): HResult; stdcall;

function InitVariantFromInt32Array(prgn: LONG;
                                   cElems: ULONG;
                                   out pvar: VARIANT): HResult; stdcall;

function InitVariantFromUInt32Array(prgn: ULONG;
                                    cElems: ULONG;
                                    out pvar: VARIANT): HResult; stdcall;

function InitVariantFromInt64Array(prgn: LONGLONG;
                                   cElems: ULONG;
                                   out pvar: VARIANT): HResult; stdcall;

function InitVariantFromUInt64Array(prgn: ULONGLONG;
                                    cElems: ULONG;
                                    out pvar: VARIANT): HResult; stdcall;

function InitVariantFromDoubleArray(prgn: DOUBLE;
                                    cElems: ULONG;
                                    out pvar: VARIANT): HResult; stdcall;

function InitVariantFromStringArray(prgsz: PCWSTR;
                                    cElems: ULONG;
                                    out pvar: VARIANT): HResult; stdcall;


function InitVariantFromBoolean(fVal: BOOL;
                                out pvar: VARIANT): HResult; inline;

function InitVariantFromInt16(iVal: SHORT;
                              out pvar: VARIANT): HResult; inline;

function InitVariantFromUInt16(uiVal: USHORT;
                               out pvar: VARIANT): HResult; inline;

function InitVariantFromInt32(lVal: LONG;
                              out pvar: VARIANT): HResult; inline;

function InitVariantFromUInt32(ulVal: ULONG;
                               out pvar: VARIANT): HResult; inline;

function InitVariantFromInt64(llVal: LONGLONG;
                              out pvar: VARIANT): HResult; inline;

function InitVariantFromUInt64(ullVal: ULONGLONG;
                               out pvar: VARIANT): HResult; inline;

function InitVariantFromDouble(dblVal: DOUBLE;
                               out pvar: VARIANT): HResult; inline;

function InitVariantFromString(psz: LPCWSTR;
                               out pvar: VARIANT): HResult; inline;

function InitVariantFromDispatch(pdisp: IDispatch;
                                 out pvar: VARIANT): HResult; inline;

function InitVariantFromDosDateTime(wDate: WORD;
                                    wTime: WORD;
                                    var pvar: VARIANT): HResult; inline;

function InitVariantFromGUIDAsBuffer(const _guid: TGUID;
                                     var pvar: VARIANT): HResult; inline;

function InitVariantFromUnknown(unknown: IUnknown;
                                var _variant: VARIANT): HResult; inline;

// Extract data from a VARIANT
function VariantToBooleanWithDefault(const varIn: REFVARIANT;
                                     fDefault: BOOL): Boolean; stdcall;

function VariantToInt16WithDefault(varIn: REFVARIANT;
                                   iDefault: SHORT): SHORT; stdcall;

function VariantToUInt16WithDefault(varIn: REFVARIANT;
                                    uiDefault: USHORT): USHORT; stdcall;

function VariantToInt32WithDefault(varIn: REFVARIANT;
                                   lDefault: LONG): LONG; stdcall;

function VariantToUInt32WithDefault(varIn: REFVARIANT;
                                    ulDefault: ULONG): ULONG; stdcall;

function VariantToInt64WithDefault(varIn: REFVARIANT;
                                   llDefault: LONGLONG): LONGLONG; stdcall;

function VariantToUInt64WithDefault(varIn: REFVARIANT;
                                    ullDefault: ULONGLONG): ULONGLONG; stdcall;

function VariantToDoubleWithDefault(varIn: REFVARIANT;
                                    dblDefault: DOUBLE): DOUBLE; stdcall;

function VariantToStringWithDefault(varIn: REFVARIANT;
                                    pszDefault: LPCWSTR): PCWSTR; stdcall;



function VariantToBoolean(varIn: REFVARIANT;
                          out pfRet: Boolean): HResult; stdcall;

function VariantToInt16(varIn: REFVARIANT;
                        out piRet: SHORT): HResult; stdcall;

function VariantToUInt16(varIn: REFVARIANT;
                         out puiRet: USHORT): HResult; stdcall;

function VariantToInt32(varIn: REFVARIANT;
                        out plRet: LONG): HResult; stdcall;

function VariantToUInt32(varIn: REFVARIANT;
                         out pulRet: ULONG): HResult; stdcall;

function VariantToInt64(const varIn: REFVARIANT;
                        out pllRet: LONGLONG): HResult; stdcall;

function VariantToUInt64(varIn: REFVARIANT;
                         out pullRet: ULONGLONG): HResult; stdcall;

function VariantToDouble(varIn: REFVARIANT;
                         out pdblRet: DOUBLE): HResult; stdcall;

function VariantToBuffer(varIn: REFVARIANT;
                         out pv: Pointer;
                         cb: UINT): HResult; stdcall;

function VariantToGUID(varIn: REFVARIANT;
                       out pguid: TGUID): HResult; stdcall;

function VariantToString(varIn: REFVARIANT;
                         out pszBuf: PWideChar;
                         cchBuf: UINT): HResult; stdcall;

function VariantToStringAlloc(varIn: REFVARIANT;
                              out ppszBuf: LPCWSTR): HResult; stdcall;

function VariantToDosDateTime(varIn: REFVARIANT;
                              out pwDate: WORD;
                              out pwTime: WORD): HResult; stdcall;

function VariantToStrRet(varIn: REFVARIANT;
                         out pstrret: STRRET): HResult; stdcall;

function VariantToFileTime(varIn: REFVARIANT;
                           stfOut: PSTIME_FLAGS;
                           out pftOut: FILETIME): HResult; stdcall;


// Get the element count.
// Returns number of elements for values of type VT_ARRAY; returns 1 otherwise.
function VariantGetElementCount(const varIn: REFVARIANT): ULONG; stdcall;


// Extract data from a VARIANT into a vector
function VariantToBooleanArray(_var: REFVARIANT;
                               out prgf: BOOL;
                               crgn: ULONG;
                               out pcElem: ULONG): HResult; stdcall;

function VariantToInt16Array(_var: REFVARIANT;
                             out prgn: SHORT;
                             crgn: ULONG;
                             out pcElem: ULONG): HResult; stdcall;

function VariantToUInt16Array(_var: REFVARIANT;
                              out prgn: USHORT;
                              crgn: ULONG;
                              out pcElem: ULONG): HResult; stdcall;

function VariantToInt32Array(_var: REFVARIANT;
                             out prgn: LONG;
                             crgn: ULONG;
                             out pcElem: ULONG): HResult; stdcall;

function VariantToUInt32Array(_var: REFVARIANT;
                              out prgn: ULONG;
                              crgn: ULONG;
                              out pcElem: ULONG): HResult; stdcall;

function VariantToInt64Array(_var: REFVARIANT;
                             out prgn: LONGLONG;
                             crgn: ULONG;
                             out pcElem: ULONG): HResult; stdcall;

function VariantToUInt64Array(_var: REFVARIANT;
                              out prgn: ULONGLONG;
                              crgn: ULONG;
                              out pcElem: ULONG): HResult; stdcall;

function VariantToDoubleArray(_var: REFVARIANT;
                              out prgn: DOUBLE;
                              crgn: ULONG;
                              out pcElem: ULONG): HResult; stdcall;

function VariantToStringArray(_var: REFVARIANT;
                              out prgsz: LPCWSTR;
                              crgsz: ULONG;
                              out pcElem: ULONG): HResult; stdcall;


// Extract data from a VARIANT into a newly allocated vector (free with CoTaskMemFree)
function VariantToBooleanArrayAlloc(_var: REFVARIANT;
                                    out pprgf: PBOOL;
                                    out pcElem: ULONG): HResult; stdcall;

function VariantToInt16ArrayAlloc(_var: REFVARIANT;
                                  out pprgn: PSHORT;
                                  out pcElem: ULONG): HResult; stdcall;

function VariantToUInt16ArrayAlloc(_var: REFVARIANT;
                                   out pprgn: PUSHORT;
                                   out pcElem: ULONG): HResult; stdcall;

function VariantToInt32ArrayAlloc(_var: REFVARIANT;
                                  out pprgn: PLONG;
                                  out pcElem: ULONG): HResult; stdcall;

function VariantToUInt32ArrayAlloc(_var: REFVARIANT;
                                   out pprgn: PULONG;
                                   out pcElem: ULONG): HResult; stdcall;

function VariantToInt64ArrayAlloc(_var: REFVARIANT;
                                  out pprgn: PLONGLONG;
                                  out pcElem: ULONG): HResult; stdcall;

function VariantToUInt64ArrayAlloc(_var: REFVARIANT;
                                   out pprgn: PULONGLONG;
                                   out pcElem: ULONG): HResult; stdcall;

function VariantToDoubleArrayAlloc(_var: REFVARIANT;
                                   out pprgn: PDOUBLE;
                                   out pcElem: ULONG): HResult; stdcall;


// Get a single element of a VARIANT.
// If it is type VT_ARRAY, returns a the requested element.
// Otherwise iElem must equal 0 and the function returns the value.
function VariantGetBooleanElem(_var: REFVARIANT;
                               iElem: ULONG;
                               out pfVal: Boolean): HResult; stdcall;

function VariantGetInt16Elem(_var: REFVARIANT;
                             iElem: ULONG;
                             out pnVal: SHORT): HResult; stdcall;

function VariantGetUInt16Elem(_var: REFVARIANT;
                              iElem: ULONG;
                              out pnVal: USHORT): HResult; stdcall;

function VariantGetInt32Elem(_var: REFVARIANT;
                             iElem: ULONG;
                             out pnVal: LONG): HResult; stdcall;

function VariantGetUInt32Elem(_var: REFVARIANT;
                              iElem: ULONG;
                              out pnVal: ULONG): HResult; stdcall;

function VariantGetInt64Elem(_var: REFVARIANT;
                             iElem: ULONG;
                             out pnVal: LONGLONG): HResult; stdcall;

function VariantGetUInt64Elem(_var: REFVARIANT;
                              iElem: ULONG;
                              out pnVal: ULONGLONG): HResult; stdcall;

function VariantGetDoubleElem(_var: REFVARIANT;
                              iElem: ULONG;
                              out pnVal: DOUBLE): HResult; stdcall;

function VariantGetStringElem(_var: REFVARIANT;
                              iElem: ULONG;
                              out ppszVal: PWideChar): HResult; stdcall;

function VariantGetElem(varIn: REFVARIANT;
                        iElem: ULONG;
                        out pvar: VARIANT): HResult; stdcall;


// Helpers
procedure ClearVariantArray(var pvars: VARIANT;
                            cvars: UINT); stdcall;

function VariantCompare(var1: REFVARIANT;
                        var2: REFVARIANT): integer; stdcall;


type
//===========================
//
// Property-specific notions
//
//===========================


// The progress bar property control uses a specially formatted PROPVARIANT to
// convey the look of the progress bar
// propvar.vt = VT_UI4
// propvar.caul.pElems[0] = current progress
// propvar.caul.pElems[1] = total progress
// propvar.caul.pElems[2] = DRAWPROGRESSFLAGS (see below);

  PDRAWPROGRESSFLAGS = ^DRAWPROGRESSFLAGS;
  DRAWPROGRESSFLAGS      = (
    DPF_NONE             = $0,    // No progress flags.
    DPF_MARQUEE          = $1,    // The progress bar should draw in marquee mode.
    DPF_MARQUEE_COMPLETE = $2,    // The marquee format progress bar has completed.
    DPF_ERROR            = $4,    // The progress bar should be drawn in the error state.
    DPF_WARNING          = $8,    // The progress bar should be drawn in the warning state.
    DPF_STOPPED          = $10    // The progress bar is stopped.
  );



  // Additional Prototypes for ALL methodes


// Helpers:  (not a part of propvarutil.h, but Shlwapi.h)

// (See: https://docs.microsoft.com/nl-nl/windows/win32/api/shlwapi/nf-shlwapi-iunknown_set
procedure IUnknown_Set({_Inout_} var ppunk: Pointer {IUnknown};
                       {_In_opt_} punk: IUnknown); stdcall;

// Makes a copy of a string in newly allocated memory.
function SHStrDupW(const psz: LPCWSTR;
                   out ppwsz: LPWSTR): HRESULT; stdcall;

// Additional helpers from OleAut32

function SysAllocString(psz: LPCWSTR): PWideChar; stdcall;

procedure VariantInit(var varg: VARIANT); stdcall;

function VariantClear(var varg: VARIANT): HResult; stdcall;

function VariantCopy(var vargDest: VARIANT;
                     const vargSrc: VARIANT): HResult; stdcall;

function VariantCopyInd(var varDest: VARIANT;
                        const vargSrc: VARIANT): HResult; stdcall;

function VariantChangeType(var vargDest: VARIANT;
                           const vargSrc: VARIANT;
                           wFlags: Word;
                           vt: VARTYPE): HResult; stdcall;

function VariantChangeTypeEx(var vargDest: VARIANT;
                             const vargSrc: VARIANT;
                             const lcid: LCID;
                             wFlags: Word;
                             vvt: VARTYPE): HResult; stdcall;

function DosDateTimeToVariantTime(cwDosDate: Word;
                                  wDosTime: Word;
                                  out vtime: OLE_DATE): integer; stdcall;

  // end of Additional Prototypes


implementation

const
  PropVarUtilLibH1 = 'Shlwapi.dll';
  PropVarUtilLibH2 = 'OleAut32.dll';


//See earlier comment
procedure IUnknown_Set; external PropVarUtilLibH1 name 'IUnknown_Set' ;
function SHStrDupW; external PropVarUtilLibH1 name 'SHStrDupW' ;

function SysAllocString; external PropVarUtilLibH2 name 'SysAllocString' ;
procedure VariantInit; external PropVarUtilLibH2 name 'VariantInit' ;
function VariantClear; external PropVarUtilLibH2 name 'VariantClear' ;
function VariantCopy; external PropVarUtilLibH2 name 'VariantCopy' ;
function VariantCopyInd; external PropVarUtilLibH2 name 'VariantCopyInd' ;
function VariantChangeType; external PropVarUtilLibH2 name 'VariantChangeType' ;
function VariantChangeTypeEx; external PropVarUtilLibH2 name 'VariantChangeTypeEx' ;
function DosDateTimeToVariantTime; external PropVarUtilLibH2 name 'DosDateTimeToVariantTime' ;

  // end implementations of additional prototypes


const
  PropVarUtilLib = 'propsys.dll';

function InitPropVariantFromResource; external PropVarUtilLib name 'ClearPropVariantArray' ;
function InitPropVariantFromBuffer; external PropVarUtilLib name 'InitPropVariantFromBuffer' ;
function InitPropVariantFromCLSID; external PropVarUtilLib name 'InitPropVariantFromCLSID' ;
function InitPropVariantFromGUIDAsString; external PropVarUtilLib name 'InitPropVariantFromGUIDAsString' ;
function InitPropVariantFromFileTime; external PropVarUtilLib name 'InitPropVariantFromFileTime' ;
function InitPropVariantFromPropVariantVectorElem; external PropVarUtilLib name 'InitPropVariantFromPropVariantVectorElem' ;
function InitPropVariantVectorFromPropVariant; external PropVarUtilLib name 'InitPropVariantVectorFromPropVariant' ;
function InitPropVariantFromStrRet; external PropVarUtilLib name 'InitPropVariantFromStrRet' ;
function InitPropVariantFromBooleanVector; external PropVarUtilLib name 'InitPropVariantFromBooleanVector' ;
function InitPropVariantFromInt16Vector; external PropVarUtilLib name 'InitPropVariantFromInt16Vector' ;
function InitPropVariantFromUInt16Vector; external PropVarUtilLib name 'InitPropVariantFromUInt16Vector' ;
function InitPropVariantFromInt32Vector; external PropVarUtilLib name 'InitPropVariantFromInt32Vector' ;
function InitPropVariantFromUInt32Vector; external PropVarUtilLib name 'InitPropVariantFromUInt32Vector' ;
function InitPropVariantFromInt64Vector; external PropVarUtilLib name 'InitPropVariantFromInt64Vector' ;
function InitPropVariantFromUInt64Vector; external PropVarUtilLib name 'InitPropVariantFromUInt64Vector' ;
function InitPropVariantFromDoubleVector; external PropVarUtilLib name 'InitPropVariantFromDoubleVector' ;
function InitPropVariantFromFileTimeVector; external PropVarUtilLib name 'InitPropVariantFromFileTimeVector' ;
function InitPropVariantFromStringVector; external PropVarUtilLib name 'InitPropVariantFromStringVector' ;
function InitPropVariantFromStringAsVector; external PropVarUtilLib name 'InitPropVariantFromStringAsVector' ;

function PropVariantToBooleanWithDefault; external PropVarUtilLib name 'PropVariantToBooleanWithDefault' ;
function PropVariantToInt16WithDefault; external PropVarUtilLib name 'PropVariantToInt16WithDefault' ;
function PropVariantToUInt16WithDefault; external PropVarUtilLib name 'PropVariantToUInt16WithDefault' ;
function PropVariantToInt32WithDefault; external PropVarUtilLib name 'PropVariantToInt32WithDefault' ;
function PropVariantToUInt32WithDefault; external PropVarUtilLib name 'PropVariantToUInt32WithDefault' ;
function PropVariantToInt64WithDefault; external PropVarUtilLib name 'PropVariantToInt64WithDefault' ;
function PropVariantToUInt64WithDefault; external PropVarUtilLib name 'PropVariantToUInt64WithDefault' ;
function PropVariantToDoubleWithDefault; external PropVarUtilLib name 'PropVariantToDoubleWithDefault' ;
function PropVariantToStringWithDefault; external PropVarUtilLib name 'PropVariantToStringWithDefault' ;

function PropVariantToBoolean; external PropVarUtilLib name 'PropVariantToBoolean' ;
function PropVariantToInt16; external PropVarUtilLib name 'PropVariantToInt16' ;
function PropVariantToUInt16; external PropVarUtilLib name 'PropVariantToUInt16' ;
function PropVariantToInt32; external PropVarUtilLib name 'PropVariantToInt32' ;
function PropVariantToUInt32; external PropVarUtilLib name 'PropVariantToUInt32' ;
function PropVariantToInt64; external PropVarUtilLib name 'PropVariantToInt64' ;
function PropVariantToUInt64; external PropVarUtilLib name 'PropVariantToUInt64' ;
function PropVariantToDouble; external PropVarUtilLib name 'PropVariantToDouble' ;
function PropVariantToBuffer; external PropVarUtilLib name 'PropVariantToBuffer' ;
function PropVariantToString; external PropVarUtilLib name 'PropVariantToString' ;
function PropVariantToGUID; external PropVarUtilLib name 'PropVariantToGUID' ;
function PropVariantToStringAlloc; external PropVarUtilLib name 'PropVariantToStringAlloc' ;
function PropVariantToBSTR; external PropVarUtilLib name 'PropVariantToBSTR' ;
function PropVariantToStrRet; external PropVarUtilLib name 'PropVariantToStrRet' ;
function PropVariantToFileTime; external PropVarUtilLib name 'PropVariantToFileTime' ;

function PropVariantGetElementCount; external PropVarUtilLib name 'PropVariantGetElementCount' ;
function PropVariantToBooleanVector; external PropVarUtilLib name 'PropVariantToBooleanVector' ;
function PropVariantToInt16Vector; external PropVarUtilLib name 'PropVariantToInt16Vector' ;
function PropVariantToUInt16Vector; external PropVarUtilLib name 'PropVariantToUInt16Vector' ;
function PropVariantToInt32Vector; external PropVarUtilLib name 'PropVariantToInt32Vector' ;
function PropVariantToUInt32Vector; external PropVarUtilLib name 'PropVariantToUInt32Vector' ;
function PropVariantToInt64Vector; external PropVarUtilLib name 'PropVariantToInt64Vector' ;
function PropVariantToUInt64Vector; external PropVarUtilLib name 'PropVariantToUInt64Vector' ;
function PropVariantToDoubleVector; external PropVarUtilLib name 'PropVariantToDoubleVector' ;
function PropVariantToFileTimeVector; external PropVarUtilLib name 'PropVariantToFileTimeVector' ;
function PropVariantToStringVector; external PropVarUtilLib name 'PropVariantToStringVector' ;

procedure ClearPropVariantArray; external PropVarUtilLib name 'ClearPropVariantArray' ;

function PropVariantCompareEx; external PropVarUtilLib name 'PropVariantCompareEx' ;

function InitVariantFromResource; external PropVarUtilLib name 'InitVariantFromResource' ;
function InitVariantFromBuffer; external PropVarUtilLib name 'InitVariantFromBuffer' ;
function InitVariantFromGUIDAsString; external PropVarUtilLib name 'InitVariantFromGUIDAsString' ;
function InitVariantFromFileTime; external PropVarUtilLib name 'InitVariantFromFileTime' ;
function InitVariantFromFileTimeArray; external PropVarUtilLib name 'InitVariantFromFileTimeArray' ;
function InitVariantFromStrRet; external PropVarUtilLib name 'InitVariantFromStrRet' ;
function InitVariantFromVariantArrayElem; external PropVarUtilLib name 'InitVariantFromVariantArrayElem' ;
function InitVariantFromBooleanArray; external PropVarUtilLib name 'InitVariantFromBooleanArray' ;
function InitVariantFromInt16Array; external PropVarUtilLib name 'InitVariantFromInt16Array' ;
function InitVariantFromUInt16Array; external PropVarUtilLib name 'InitVariantFromUInt16Array' ;
function InitVariantFromInt32Array; external PropVarUtilLib name 'InitVariantFromInt32Array' ;
function InitVariantFromUInt32Array; external PropVarUtilLib name 'InitVariantFromUInt32Array' ;
function InitVariantFromInt64Array; external PropVarUtilLib name 'InitVariantFromInt64Array' ;
function InitVariantFromUInt64Array; external PropVarUtilLib name 'InitVariantFromUInt64Array' ;
function InitVariantFromDoubleArray; external PropVarUtilLib name 'InitVariantFromDoubleArray' ;
function InitVariantFromStringArray; external PropVarUtilLib name 'InitVariantFromStringArray' ;

function VariantGetElementCount; external PropVarUtilLib name 'VariantGetElementCount' ;

function PropVariantToBooleanVectorAlloc; external PropVarUtilLib name 'PropVariantToBooleanVectorAlloc' ;
function PropVariantToInt16VectorAlloc; external PropVarUtilLib name 'PropVariantToInt16VectorAlloc' ;
function PropVariantToUInt16VectorAlloc; external PropVarUtilLib name 'PropVariantToUInt16VectorAlloc' ;
function PropVariantToInt32VectorAlloc; external PropVarUtilLib name 'PropVariantToInt32VectorAlloc' ;
function PropVariantToUInt32VectorAlloc; external PropVarUtilLib name 'PropVariantToUInt32VectorAlloc' ;
function PropVariantToInt64VectorAlloc; external PropVarUtilLib name 'PropVariantToInt64VectorAlloc' ;
function PropVariantToUInt64VectorAlloc; external PropVarUtilLib name 'PropVariantToUInt64VectorAlloc' ;
function PropVariantToDoubleVectorAlloc; external PropVarUtilLib name 'PropVariantToDoubleVectorAlloc' ;
function PropVariantToFileTimeVectorAlloc; external PropVarUtilLib name 'PropVariantToFileTimeVectorAlloc' ;
function PropVariantToStringVectorAlloc; external PropVarUtilLib name 'PropVariantToStringVectorAlloc' ;
function PropVariantGetBooleanElem; external PropVarUtilLib name 'PropVariantGetBooleanElem' ;
function PropVariantGetInt16Elem; external PropVarUtilLib name 'PropVariantGetInt16Elem' ;
function PropVariantGetUInt16Elem; external PropVarUtilLib name 'PropVariantGetUInt16Elem' ;
function PropVariantGetInt32Elem; external PropVarUtilLib name 'PropVariantGetInt32Elem' ;
function PropVariantGetUInt32Elem; external PropVarUtilLib name 'PropVariantGetUInt32Elem' ;
function PropVariantGetInt64Elem; external PropVarUtilLib name 'PropVariantGetInt64Elem' ;
function PropVariantGetUInt64Elem; external PropVarUtilLib name 'PropVariantGetUInt64Elem' ;
function PropVariantGetDoubleElem; external PropVarUtilLib name 'PropVariantGetDoubleElem' ;
function PropVariantGetFileTimeElem; external PropVarUtilLib name 'PropVariantGetFileTimeElem' ;
function PropVariantGetStringElem; external PropVarUtilLib name 'PropVariantGetStringElem' ;

function PropVariantChangeType; external PropVarUtilLib name 'PropVariantChangeType' ;
function PropVariantToVariant; external PropVarUtilLib name 'PropVariantToVariant' ;
function VariantToPropVariant; external PropVarUtilLib name 'VariantToPropVariant' ;
function StgSerializePropVariant; external PropVarUtilLib name 'StgSerializePropVariant' ;
function StgDeserializePropVariant; external PropVarUtilLib name 'StgDeserializePropVariant' ;

function IsVarTypeFloat; external PropVarUtilLib name 'IsVarTypeFloat' ;
function IsVariantArray; external PropVarUtilLib name 'IsVariantArray' ;
function IsVariantString; external PropVarUtilLib name 'IsVariantString' ;
function IsVarTypeNumber; external PropVarUtilLib name 'IsVarTypeNumber' ;
function IsVarTypeInteger; external PropVarUtilLib name 'IsVarTypeInteger' ;

// Extract data from a VARIANT
function VariantToBooleanWithDefault; external PropVarUtilLib name 'VariantToBooleanWithDefault' ;
function VariantToInt16WithDefault; external PropVarUtilLib name 'VariantToInt16WithDefault' ;
function VariantToUInt16WithDefault; external PropVarUtilLib name 'VariantToUInt16WithDefault' ;
function VariantToInt32WithDefault; external PropVarUtilLib name 'VariantToInt32WithDefault' ;
function VariantToUInt32WithDefault; external PropVarUtilLib name 'VariantToUInt32WithDefault' ;
function VariantToInt64WithDefault; external PropVarUtilLib name 'VariantToInt64WithDefault' ;
function VariantToUInt64WithDefault; external PropVarUtilLib name 'VariantToUInt64WithDefault' ;
function VariantToDoubleWithDefault; external PropVarUtilLib name 'VariantToDoubleWithDefault' ;
function VariantToStringWithDefault; external PropVarUtilLib name 'VariantToStringWithDefault' ;

function VariantToBoolean; external PropVarUtilLib name 'VariantToBoolean' ;
function VariantToInt16; external PropVarUtilLib name 'VariantToInt16' ;
function VariantToUInt16; external PropVarUtilLib name 'VariantToUInt16' ;
function VariantToInt32; external PropVarUtilLib name 'VariantToInt32' ;
function VariantToUInt32; external PropVarUtilLib name 'VariantToUInt32' ;
function VariantToInt64; external PropVarUtilLib name 'VariantToInt64' ;
function VariantToUInt64; external PropVarUtilLib name 'VariantToUInt64' ;
function VariantToDouble; external PropVarUtilLib name 'VariantToDouble' ;
function VariantToBuffer; external PropVarUtilLib name 'VariantToBuffer' ;
function VariantToGUID; external PropVarUtilLib name 'VariantToGUID' ;
function VariantToString; external PropVarUtilLib name 'VariantToString' ;
function VariantToStringAlloc; external PropVarUtilLib name 'VariantToStringAlloc' ;
function VariantToDosDateTime; external PropVarUtilLib name 'VariantToDosDateTime' ;
function VariantToStrRet; external PropVarUtilLib name 'VariantToStrRet' ;
function VariantToFileTime; external PropVarUtilLib name 'VariantToFileTime' ;


function VariantToBooleanArray; external PropVarUtilLib name 'VariantToBooleanArray' ;
function VariantToInt16Array; external PropVarUtilLib name 'VariantToInt16Array' ;
function VariantToUInt16Array; external PropVarUtilLib name 'VariantToUInt16Array' ;
function VariantToInt32Array; external PropVarUtilLib name 'VariantToInt32Array' ;
function VariantToUInt32Array; external PropVarUtilLib name 'VariantToUInt32Array' ;
function VariantToInt64Array; external PropVarUtilLib name 'VariantToInt64Array' ;
function VariantToUInt64Array; external PropVarUtilLib name 'VariantToUInt64Array' ;
function VariantToDoubleArray; external PropVarUtilLib name 'VariantToDoubleArray' ;
function VariantToStringArray; external PropVarUtilLib name 'VariantToStringArray' ;

function VariantToBooleanArrayAlloc; external PropVarUtilLib name 'VariantToBooleanArrayAlloc' ;
function VariantToInt16ArrayAlloc; external PropVarUtilLib name 'VariantToInt16ArrayAlloc' ;
function VariantToUInt16ArrayAlloc; external PropVarUtilLib name 'VariantToUInt16ArrayAlloc' ;
function VariantToInt32ArrayAlloc; external PropVarUtilLib name 'VariantToInt32ArrayAlloc' ;
function VariantToUInt32ArrayAlloc; external PropVarUtilLib name 'VariantToUInt32ArrayAlloc' ;
function VariantToInt64ArrayAlloc; external PropVarUtilLib name 'VariantToInt64ArrayAlloc' ;
function VariantToUInt64ArrayAlloc; external PropVarUtilLib name 'VariantToUInt64ArrayAlloc' ;
function VariantToDoubleArrayAlloc; external PropVarUtilLib name 'VariantToDoubleArrayAlloc' ;

function VariantGetBooleanElem; external PropVarUtilLib name 'VariantGetBooleanElem' ;
function VariantGetInt16Elem; external PropVarUtilLib name 'VariantGetInt16Elem' ;
function VariantGetUInt16Elem; external PropVarUtilLib name 'VariantGetUInt16Elem' ;
function VariantGetInt32Elem; external PropVarUtilLib name 'VariantGetInt32Elem' ;
function VariantGetUInt32Elem; external PropVarUtilLib name 'VariantGetUInt32Elem' ;
function VariantGetInt64Elem; external PropVarUtilLib name 'VariantGetInt64Elem' ;
function VariantGetUInt64Elem; external PropVarUtilLib name 'VariantGetUInt64Elem' ;
function VariantGetDoubleElem; external PropVarUtilLib name 'VariantGetDoubleElem' ;
function VariantGetStringElem; external PropVarUtilLib name 'VariantGetStringElem' ;
function VariantGetElem; external PropVarUtilLib name 'VariantGetElem' ;

procedure ClearVariantArray; external PropVarUtilLib name 'ClearVariantArray' ;

function VariantCompare; external PropVarUtilLib name 'VariantCompare' ;



// Inline Helpers
//===============

function InitPropVariantFromBoolean(fVal: BOOL;
                                    out ppropvar: PROPVARIANT): HRESULT; inline;
begin
  ppropvar.vt:= VT_BOOL;
  ppropvar.boolVal:= fVal;
  Result:= S_OK;
end;

function InitPropVariantFromInt16(nVal: SHORT;
                                  out ppropvar: PROPVARIANT): HRESULT; inline;
begin
  ppropvar.vt:= VT_I2;
  ppropvar.iVal:= nVal;
  Result:= S_OK;
end;

function InitPropVariantFromUInt16(uiVal: USHORT;
                                   out ppropvar: PROPVARIANT): HRESULT; inline;
begin
  ppropvar.vt:= VT_UI2;
  ppropvar.uiVal:= uiVal;
  Result:= S_OK;
end;

function InitPropVariantFromInt32(lVal: Integer;
                                  out ppropvar: PROPVARIANT): HRESULT; inline;
begin
  ppropvar.vt:= VT_I4;
  ppropvar.lVal:= lVal;
  Result:= S_OK;
end;

function InitPropVariantFromUInt32(ulVal: ULONG;
                                   out ppropvar: PROPVARIANT): HRESULT; inline;
begin
  ppropvar.vt:= VT_UI4;
  ppropvar.ulVal:= ulVal;
  Result:= S_OK;
end;

function InitPropVariantFromInt64(llVal: LONGLONG;
                                  out ppropvar: PROPVARIANT): HRESULT; inline;
begin
  ppropvar.vt:= VT_I8;
  ppropvar.hVal.QuadPart:= llVal;
  Result:= S_OK;
end;

function InitPropVariantFromUInt64(ullVal: ULONGLONG;
                                   out ppropvar: PROPVARIANT): HRESULT; inline;
begin
  ppropvar.vt:= VT_UI8;
  ppropvar.uhVal.QuadPart:= ullVal;
  Result:= S_OK;
end;

function InitPropVariantFromDouble(dblVal: Double;
                                   out ppropvar: PROPVARIANT): HResult; inline;
begin
  ppropvar.vt:= VT_R8;
  ppropvar.dblVal:= dblVal;
  Result:= S_OK;
end;

function PropVariantToCLSID(const propvarIn: PROPVARIANT;
                            out pclsid: CLSID): HRESULT; inline;
begin
  Result:= PropVariantToGUID(propvarIn, pclsid);
end;

function PropVariantGetElem(const propvarIn: PROPVARIANT;
                            iElem: ULONG;
                            out ppropvar: PROPVARIANT): HResult; inline;
begin
  Result:= InitPropVariantFromPropVariantVectorElem(propvarIn,
                                                    iElem,
                                                    ppropvar);
end;

function PropVariantCompare(const propvar1: PROPVARIANT;
                            const propvar2: PROPVARIANT): integer; inline;
begin
  Result:= PropVariantCompareEx(propvar1,
                                propvar2,
                                PVCU_DEFAULT,
                                PVCF_DEFAULT);
end;



function InitVariantFromBoolean(fVal: BOOL;
                                out pvar: VARIANT): HResult; inline;
begin
    VARIANTARG(pvar).vt:= VT_BOOL;
    if fVal = True then
      VARIANTARG(pvar).vbool:= VARIANT_TRUE
    else
      VARIANTARG(pvar).vbool:= VARIANT_FALSE;
    Result:= S_OK;
end;

function InitVariantFromInt16(iVal: SHORT;
                              out pvar: VARIANT): HResult; inline;
begin
    VARIANTARG(pvar).vt:= VT_I2;
    VARIANTARG(pvar).iVal:= iVal;
    Result:= S_OK;
end;

function InitVariantFromUInt16(uiVal: USHORT;
                               out pvar: VARIANT): HResult; inline;
begin
    VARIANTARG(pvar).vt:= VT_UI2;
    VARIANTARG(pvar).uiVal:= uiVal;
    Result:= S_OK;
end;

function InitVariantFromInt32(lVal: LONG;
                              out pvar: VARIANT): HResult; inline;
begin
    VARIANTARG(pvar).vt:= VT_I4;
    VARIANTARG(pvar).lVal:= lVal;
    Result:= S_OK;
end;

function InitVariantFromUInt32(ulVal: ULONG;
                               out pvar: VARIANT): HResult; inline;
begin
    VARIANTARG(pvar).vt:= VT_UI4;
    VARIANTARG(pvar).ulVal:= ulVal;
    Result:= S_OK;
end;

function InitVariantFromInt64(llVal: LONGLONG;
                              out pvar: VARIANT): HResult; inline;
begin
    VARIANTARG(pvar).vt:= VT_I8;
    VARIANTARG(pvar).llVal:= llVal;
    Result:= S_OK;
end;

function InitVariantFromUInt64(ullVal: ULONGLONG;
                               out pvar: VARIANT): HResult; inline;
begin
    VARIANTARG(pvar).vt:= VT_UI8;
    VARIANTARG(pvar).ullVal:= ullVal;
    Result:= S_OK;
end;

function InitVariantFromDouble(dblVal: DOUBLE;
                               out pvar: VARIANT): HResult; inline;
begin
    VARIANTARG(pvar).vt:= VT_R8;
    VARIANTARG(pvar).dblVal:= dblVal;
    Result:= S_OK;
end;

function InitVariantFromString(psz: LPCWSTR;
                               out pvar: VARIANT): HResult; inline;
var
  hr: HResult;

begin
  VARIANTARG(pvar).vt:= VT_BSTR;
  VARIANTARG(pvar).bstrVal:= SysAllocString(psz);

  if VARIANTARG(pvar).bstrVal <> nil then
    hr:= S_OK
  else
  if psz <> nil then
    hr:= E_OUTOFMEMORY
  else
    hr:= E_INVALIDARG;

  if (FAILED(hr)) then
    VariantInit(pvar);

  Result:= hr;
end;


function InitVariantFromDispatch(pdisp: IDispatch;
                                 out pvar: VARIANT): HResult; inline;
begin

  VariantInit(pvar);

  VARIANTARG(pvar).vt := VT_DISPATCH;
  IDispatch(VARIANTARG(pvar).pdispVal) := pdisp;

  if Assigned(VARIANTARG(pvar).pdispVal) then
    Result := S_OK
  else
    Result := E_FAIL;
end;

// Creates a VT_DATE variant
function InitVariantFromDosDateTime(wDate: WORD;
                                    wTime: WORD;
                                    var pvar: VARIANT): HResult; inline;
begin
  VARIANTARG(pvar).vt:= VT_DATE;
  if DosDateTimeToVariantTime(wDate, wTime, VARIANTARG(pvar).date) <> 0 then
    Result:= S_OK
  else
    Result:= S_FALSE;
end;

// Changes the value of a Component Object Model (COM) interface pointer and
// releases the previous interface.
function InitVariantFromUnknown(unknown: IUnknown;
                                var _variant: VARIANT): HResult; inline;
begin
  VariantInit(_variant);
	VARIANTARG(_variant).vt:= VT_UNKNOWN;

  if (unknown <> Nil) then
    IUnknown_Set(VARIANTARG(_variant).unkVal,
                 unknown);

  Result:= S_OK;
end;


function InitPropVariantFromString(psz: LPCWSTR;
                                   out ppropvar: PROPVARIANT): HResult; inline;
begin
  PropVariantInit(ppropvar);
  ppropvar.vt:= VT_LPWSTR;
  Result:= SHStrDupW(psz, ppropvar.pwszVal);
  if FAILED(Result) then
      PropVariantInit(ppropvar);
end;

function InitPropVariantFromGUIDAsBuffer(const guid: REFGUID;
                                         out ppropvar: PROPVARIANT): HResult; inline;
begin
  Result:= InitPropVariantFromBuffer(@guid, sizeof(GUID), ppropvar);
end;

function IsPropVariantVector(const propvar: PROPVARIANT): BOOL; inline;
begin
  Result:= (propvar.vt and (VT_ARRAY or VT_VECTOR) <> 0);
end;

function IsPropVariantString(const propvar: PROPVARIANT): BOOL; inline;
begin
  Result:= (PropVariantToStringWithDefault(propvar, Nil) <> Nil);
end;

function InitVariantFromGUIDAsBuffer(const _guid: TGUID;
                                     var pvar: VARIANT): HResult; inline;
begin
  Result:= InitVariantFromBuffer(@_guid, sizeof(_guid), pvar);
end;

  //Implement additional prototypes here.

end.
