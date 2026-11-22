// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.ActiveX.PropSys.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 27-06-2012
// Language: ENU
//
// Upstream revision: 4.1.0
// Description:
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
// Remarks: Requires Windows Vista or later.
//
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
// Source: propsys.h
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
unit WinApi.ActiveX.PropSys;

{$I MfPack.Fpc.inc}


interface

uses

  {WinApi}
  WinApi.WinApiTypes,
  WinApi.Unknwn,
  WinApi.StructuredQueryCondition,
  {ActiveX}
  WinApi.ActiveX.PropIdl,
  WinApi.ActiveX.ObjIdlbase,
  WinApi.ActiveX.OaIdl;

  {$PACKENUM 4}

  {$IFDEF WIN32}
    {$ALIGN 1}
  {$ELSE}
  {$ALIGN 8}
  // Win64
  {$ENDIF}

  {$I 'WinApiTypes.inc'}

const

  PKEY_PIDSTR_MAX = 10;  // will take care of any long integer value
  GUIDSTRING_MAX = (1 + 8 + 1 + 4 + 1 + 4 + 1 + 4 + 1 + 12 + 1 + 1);  // "{12345678-1234-1234-1234-123456789012}"
  PKEYSTR_MAX = (GUIDSTRING_MAX + 1 + PKEY_PIDSTR_MAX);

  // IPersistSerializedPropStorage
  SERIALIZEDPROPSTORAGE_VERSION_VISTA = $53505331;  // SPS1 in ASCII")

  PDFF_PREFERFRIENDLY = $10000000;  // Use even friendlier date/time descriptions ;internal


type
  REFPROPERTYKEY = PROPERTYKEY;


  // ActiveX IStream interface pointer
  {$IFNDEF _PIStream_DEFINED}
  {$DEFINE _PIStream_DEFINED}
  PIStream = ^IStream;
  {$ENDIF}

type
  // The following are new for Vista, but are use in downlevel components
  PGETPROPERTYSTOREFLAGS = ^GETPROPERTYSTOREFLAGS;
  GETPROPERTYSTOREFLAGS = DWord;
  // If no flags are specified (GPS_DEFAULT), a read-only property store is returned that includes properties for the file or item.
  // In the case that the shell item is a file, the property store contains:
  //     1. properties about the file from the file system
  //     2. properties from the file itself provided by the file's property handler, unless that file is offline,
  //         see GPS_OPENSLOWITEM
  //     3. if requested by the file's property handler and supported by the file system, properties stored in the
  //     alternate property store.
  //
  // Non-file shell items should return a similar read-only store
  //
  // Specifying other GPS_ flags modifies the store that is returned
const
  GPS_DEFAULT = GETPROPERTYSTOREFLAGS($0);
  GPS_HANDLERPROPERTIESONLY = GETPROPERTYSTOREFLAGS($1);    // only include properties directly from the file's property handler
  GPS_READWRITE = GETPROPERTYSTOREFLAGS($2);    // Writable stores will only include handler properties
  GPS_TEMPORARY = GETPROPERTYSTOREFLAGS($4);    //  A read/write store that only holds properties for the lifetime of the IShellItem object
  GPS_FASTPROPERTIESONLY = GETPROPERTYSTOREFLAGS($8);    // do not include any properties from the file's property handler (because the file's property handler will hit the disk)
  GPS_OPENSLOWITEM = GETPROPERTYSTOREFLAGS($10);   // include properties from a file's property handler, even if it means retrieving the file from offline storage.
  GPS_DELAYCREATION = GETPROPERTYSTOREFLAGS($20);   // delay the creation of the file's property handler until those properties are read, written, or enumerated
  GPS_BESTEFFORT = GETPROPERTYSTOREFLAGS($40);   // For readonly stores, succeed and return all available properties, even if one or more sources of properties fails. Not valid with GPS_READWRITE.
  GPS_NO_OPLOCK = GETPROPERTYSTOREFLAGS($80);   // some data sources protect the read property store with an oplock, this disables that
  GPS_PREFERQUERYPROPERTIES = GETPROPERTYSTOREFLAGS($100);  // For file system WDS results, only retrieve properties from the indexer
  GPS_EXTRINSICPROPERTIES = GETPROPERTYSTOREFLAGS($200);  // include properties from the file's secondary stream
  GPS_EXTRINSICPROPERTIESONLY = GETPROPERTYSTOREFLAGS($400);  // only include properties from the file's secondary stream
  GPS_VOLATILEPROPERTIES = GETPROPERTYSTOREFLAGS($800);  // include properties from the file's volatile store in the indexer
  GPS_VOLATILEPROPERTIESONLY = GETPROPERTYSTOREFLAGS($1000); // only include properties from the file's volatile store in the indexer
  GPS_MASK_VALID = GETPROPERTYSTOREFLAGS($1fff);


type
  PPKA_FLAGS = ^PKA_FLAGS;
  PKA_FLAGS = DWord;
  // note, this enum type not named property, it should have been named PKA_OPERATION
const
  PKA_SET = PKA_FLAGS(0);    // replace current value
  PKA_APPEND = PKA_FLAGS(1);    // append to current value - multi-value properties only
  PKA_DELETE = PKA_FLAGS(2);    // delete from current value - multi-value properties only


type
  // IPropertyDescription types
  // ==========================
  //
  PPROPDESC_TYPE_FLAGS = ^PROPDESC_TYPE_FLAGS;
  PROPDESC_TYPE_FLAGS = DWord;

const
  PDTF_DEFAULT = PROPDESC_TYPE_FLAGS($0);
  PDTF_MULTIPLEVALUES = PROPDESC_TYPE_FLAGS($1);     // This property can have multiple values (as VT_VECTOR)
  PDTF_ISINNATE = PROPDESC_TYPE_FLAGS($2);     // This property cannot be written to
  PDTF_ISGROUP = PROPDESC_TYPE_FLAGS($4);     // This property is a group heading
  PDTF_CANGROUPBY = PROPDESC_TYPE_FLAGS($8);     // The user can group by this property
  PDTF_CANSTACKBY = PROPDESC_TYPE_FLAGS($10);    // The user can stack by this property
  PDTF_ISTREEPROPERTY = PROPDESC_TYPE_FLAGS($20);    // This property contains a hierarchy
  PDTF_INCLUDEINFULLTEXTQUERY = PROPDESC_TYPE_FLAGS($40);    // Deprecated
  PDTF_ISVIEWABLE = PROPDESC_TYPE_FLAGS($80);    // This property is meant to be viewed by the user
  PDTF_ISQUERYABLE = PROPDESC_TYPE_FLAGS($100);   // Deprecated
  PDTF_CANBEPURGED = PROPDESC_TYPE_FLAGS($200);   // This property can be purged, even if it is innate (property handler should respect this)
  PDTF_SEARCHRAWVALUE = PROPDESC_TYPE_FLAGS($400);   // The raw (rather than formatted) value of this property should be used for searching
  PDTF_DONTCOERCEEMPTYSTRINGS = PROPDESC_TYPE_FLAGS($800);   // Don't coerce empty strings into null/empty
  PDTF_ALWAYSINSUPPLEMENTALSTORE = PROPDESC_TYPE_FLAGS($1000);  // Property is persisted into supplemental store, not file format property handler's store
  PDTF_ISSYSTEMPROPERTY = PROPDESC_TYPE_FLAGS($80000000);  // This property is owned by the system
  PDTF_MASK_ALL = PROPDESC_TYPE_FLAGS($80001FFF);

type
  PPROPDESC_VIEW_FLAGS = ^PROPDESC_VIEW_FLAGS;
  PROPDESC_VIEW_FLAGS = DWord;

const
  PDVF_DEFAULT = PROPDESC_VIEW_FLAGS(0);
  PDVF_CENTERALIGN = PROPDESC_VIEW_FLAGS($1);
  PDVF_RIGHTALIGN = PROPDESC_VIEW_FLAGS($2);
  PDVF_BEGINNEWGROUP = PROPDESC_VIEW_FLAGS($4);
  PDVF_FILLAREA = PROPDESC_VIEW_FLAGS($8);
  PDVF_SORTDESCENDING = PROPDESC_VIEW_FLAGS($10);
  PDVF_SHOWONLYIFPRESENT = PROPDESC_VIEW_FLAGS($20);
  PDVF_SHOWBYDEFAULT = PROPDESC_VIEW_FLAGS($40);
  PDVF_SHOWINPRIMARYLIST = PROPDESC_VIEW_FLAGS($80);
  PDVF_SHOWINSECONDARYLIST = PROPDESC_VIEW_FLAGS($100);
  PDVF_HIDELABEL = PROPDESC_VIEW_FLAGS($200);
  PDVF_HIDDEN = PROPDESC_VIEW_FLAGS($800);
  PDVF_CANWRAP = PROPDESC_VIEW_FLAGS($1000);
  PDVF_MASK_ALL = PROPDESC_VIEW_FLAGS($1BFF);



type
  PPROPDESC_FORMAT_FLAGS = ^PROPDESC_FORMAT_FLAGS;
  PROPDESC_FORMAT_FLAGS = DWord;

const
  PDFF_DEFAULT = PROPDESC_FORMAT_FLAGS($00000000);
  PDFF_PREFIXNAME = PROPDESC_FORMAT_FLAGS($00000001);  // Prefix the value with the property name
  PDFF_FILENAME = PROPDESC_FORMAT_FLAGS($00000002);  // Treat as a file name
  PDFF_ALWAYSKB = PROPDESC_FORMAT_FLAGS($00000004);  // Always format byte sizes as KB
  PDFF_RESERVED_RIGHTTOLEFT = PROPDESC_FORMAT_FLAGS($00000008);  // Reserved for legacy use.
  PDFF_SHORTTIME = PROPDESC_FORMAT_FLAGS($00000010);  // Show time as "5:17 pm"
  PDFF_LONGTIME = PROPDESC_FORMAT_FLAGS($00000020);  // Show time as "5:17:14 pm"
  PDFF_HIDETIME = PROPDESC_FORMAT_FLAGS($00000040);  // Hide the time-portion of the datetime
  PDFF_SHORTDATE = PROPDESC_FORMAT_FLAGS($00000080);  // Show date as "3/21/04"
  PDFF_LONGDATE = PROPDESC_FORMAT_FLAGS($00000100);  // Show date as "Monday, March 21, 2004"
  PDFF_HIDEDATE = PROPDESC_FORMAT_FLAGS($00000200);  // Hide the date-portion of the datetime
  PDFF_RELATIVEDATE = PROPDESC_FORMAT_FLAGS($00000400);  // Use friendly date descriptions like "Yesterday"
  PDFF_USEEDITINVITATION = PROPDESC_FORMAT_FLAGS($00000800);  // Use edit invitation text if failed or empty
  PDFF_READONLY = PROPDESC_FORMAT_FLAGS($00001000);  // Use readonly format, fill with default text if empty and !PDFF_FAILIFEMPTYPROP
  PDFF_NOAUTOREADINGORDER = PROPDESC_FORMAT_FLAGS($00002000);   // Don't detect reading order automatically. Useful if you will be converting to Ansi and don't want Unicode reading order characters


type
  // IPropertyDescriptionSearchInfo types
  // ====================================
  //
  // IPropertyDescriptionSearchInfo
  PPROPDESC_SEARCHINFO_FLAGS = ^PROPDESC_SEARCHINFO_FLAGS;
  PROPDESC_SEARCHINFO_FLAGS = DWord;

const
  PDSIF_DEFAULT = PROPDESC_SEARCHINFO_FLAGS($00000000);
  PDSIF_ININVERTEDINDEX = PROPDESC_SEARCHINFO_FLAGS($00000001);
  PDSIF_ISCOLUMN = PROPDESC_SEARCHINFO_FLAGS($00000002);
  PDSIF_ISCOLUMNSPARSE = PROPDESC_SEARCHINFO_FLAGS($00000004);
  PDSIF_ALWAYSINCLUDE = PROPDESC_SEARCHINFO_FLAGS($00000008);
  PDSIF_USEFORTYPEAHEAD = PROPDESC_SEARCHINFO_FLAGS($00000010);


type
  // PERSIST_SPROPSTORE_FLAGS should be converted to use DEFINE_ENUM_FLAG_OPERATORS() but some callers pass "0"
  // as the value of this to existing APIs.
  // Those callers need to change to use FPSPS_DEFAULT.
  PPERSIST_SPROPSTORE_FLAGS = ^PERSIST_SPROPSTORE_FLAGS;
  _PERSIST_SPROPSTORE_FLAGS = DWord;
  PERSIST_SPROPSTORE_FLAGS = _PERSIST_SPROPSTORE_FLAGS;

const
  FPSPS_DEFAULT = PERSIST_SPROPSTORE_FLAGS($00000000);  // Windows 7 and later
  FPSPS_READONLY = PERSIST_SPROPSTORE_FLAGS($00000001);
  FPSPS_TREAT_NEW_VALUES_AS_DIRTY = PERSIST_SPROPSTORE_FLAGS($00000002);   // >= Win 8



type

  //============================= INTERFACES ===================================



  // Interface IInitializeWithFile
  // =============================
  //
  IInitializeWithFile = interface(IUnknown)
    ['{b7d14566-0509-4cce-a71f-0a554233bd9b}']
    function Initialize(pszFilePath: PAnsiChar;
                        grfMode: DWord): HRESULT; stdcall;

  end;

  IID_IInitializeWithFile = IInitializeWithFile;



  // Interface IInitializeWithStream
  // ===============================
  //
  IInitializeWithStream = interface(IUnknown)
    ['{b824b49d-22ac-4161-ac8a-9916e8fa3f7f}']
    function Initialize(var pIStream: IStream;
                        grfMode: DWord): HRESULT; stdcall;

  end;

  IID_IInitializeWithStream = IInitializeWithStream;



  // Interface IPropertyStore
  // ========================
  //
  PIPropertyStore = ^IPropertyStore;

  IPropertyStore = interface(IUnknown)
    ['{886d8eeb-8cf2-4446-8d02-cdba1dbdcf99}']
    function GetCount(out cProps: DWORD): HResult; stdcall;

    function GetAt(iProp: DWORD;
                   out pkey: PROPERTYKEY): HResult; stdcall;

    function GetValue(const key: PROPERTYKEY;
                      out pv: PROPVARIANT): HResult; stdcall;

    function SetValue(const key: PROPERTYKEY;
                      const propvar: PROPVARIANT): HResult; stdcall;

    function Commit: HResult; stdcall;

  end;

  IID_IPropertyStore = IPropertyStore;



  // Interface INamedPropertyStore
  // =============================
  //
  INamedPropertyStore = interface(IUnknown)
    ['{71604b0f-97b0-4764-8577-2f13e98a1422}']

    function GetNamedValue(pszName: LPOLESTR;
                           var ppropvar: PROPVARIANT): HResult; stdcall;

    function SetNamedValue(pszName: LPOLESTR;
                           propvar: REFPROPVARIANT): HResult; stdcall;

    function GetNameCount(var pdwCount: DWORD): HResult; stdcall;

    function GetNameAt(iProp: DWORD;
                       var pbstrName: BSTR // The calling application's responsibility to free this resource when it is no longer needed.
      ): HResult; stdcall;

  end;

  IID_INamedPropertyStore = INamedPropertyStore;



  // Interface IObjectWithPropertyKey
  // ================================
  //
  IObjectWithPropertyKey = interface(IUnknown)
    ['{fc0ca0a7-c316-4fd2-9031-3e628e6d4f23}']

    function SetPropertyKey(key: REFPROPERTYKEY): HResult; stdcall;

    function GetPropertyKey(out pkey: PROPERTYKEY): HResult; stdcall;

  end;

  IID_IObjectWithPropertyKey = IObjectWithPropertyKey;


  // Interface IPropertyChange
  // =========================
  //
  IPropertyChange = interface(IUnknown)
    ['{f917bc8a-1bba-4478-a245-1bde03eb9431}']

    function ApplyToPropVariant(propvarIn: REFPROPVARIANT;
                                out ppropvarOut: PROPVARIANT): HResult; stdcall;

  end;

  IID_IPropertyChange = IPropertyChange;



  // Interface IPropertyChangeArray
  // ==============================
  //
  IPropertyChangeArray = interface(IUnknown)
    ['{380f5cad-1b5e-42f2-805d-637fd392d31e}']

    function GetCount(out pcOperations: UINT): HResult; stdcall;

    function GetAt(iIndex: UINT;
                   const riid: REFIID;
                   out ppv): HResult; stdcall;

    function InsertAt(iIndex: UINT;
                      ppropChange: IPropertyChange): HResult; stdcall;

    function Append(ppropChange: IPropertyChange): HResult; stdcall;
    // If the PROPERTYKEY for that change was not in the Array, then add it
    // else if the PROPERTYKEY was already part of the Array then
    // replace the first occurence of that PROPERTYKEY with the new ppropChange
    function AppendOrReplace(ppropChange: IPropertyChange): HResult; stdcall;

    function RemoveAt(iIndex: UINT): HResult; stdcall;

    function IsKeyInArray(key: REFPROPERTYKEY): HResult; stdcall;

  end;

  IID_IPropertyChangeArray = IPropertyChangeArray;



  // Interface IPropertyStoreCapabilities
  // ====================================
  //
  IPropertyStoreCapabilities = interface(IUnknown)
    ['{c8e2d566-186e-4d49-bf41-6909ead56acc}']

    function IsPropertyWritable(key: REFPROPERTYKEY): HResult; stdcall;

  end;

  IID_IPropertyStoreCapabilities = IPropertyStoreCapabilities;



  // Interface IPropertyStoreCache
  // =============================
  //
  IPropertyStoreCache = interface(IPropertyStore)
    ['{3017056d-9a91-4e90-937d-746c72abbf4f}']

  end;

  IID_IPropertyStoreCache = IPropertyStoreCache;


  PPSC_STATE = ^PSC_STATE;
  PSC_STATE = (
    PSC_NORMAL = 0,
               PSC_NOTINSOURCE = 1,
               PSC_DIRTY = 2,
               PSC_READONLY = 3
    );


  PPROPENUMTYPE = ^PROPENUMTYPE;
  PROPENUMTYPE = (
    PET_DISCRETEVALUE = 0,           // Use GetValue  GetDisplayText
    PET_RANGEDVALUE = 1,           // Use GetRangeValues  GetDisplayText
    PET_DEFAULTVALUE = 2,           // Use GetDisplayText
    PET_ENDRANGE = 3            // Use GetValue
    );


  // Interface IPropertyEnumType
  // ===========================
  //
  IPropertyEnumType = interface(IUnknown)
    ['{11e1fbf9-2d56-4a6b-8db3-7cd193a471f2}']

    function GetEnumType(out penumtype: PROPENUMTYPE): HResult; stdcall;

    function GetValue(out ppropvar: PROPVARIANT): HResult; stdcall;

    function GetRangeMinValue(out ppropvarMin: PROPVARIANT): HResult; stdcall;

    function GetRangeSetValue(out ppropvarSet: PROPVARIANT): HResult; stdcall;

    function GetDisplayText(out ppszDisplay: LPOLESTR): HResult; stdcall;

  end;

  IID_IPropertyEnumType = IPropertyEnumType;



  // Interface IPropertyEnumType2
  // ============================
  //
  IPropertyEnumType2 = interface(IPropertyEnumType)
    ['{9b6e051c-5ddd-4321-9070-fe2acb55e794}']

    function GetImageReference(var ppszImageRes: LPOLESTR): HResult; stdcall;
    // returns a string of the form "<dll name>,-<resid>" that is suitable to be passed to PathParseIconLocation()

  end;

  IID_IPropertyEnumType2 = IPropertyEnumType2;



  // Interface IPropertyEnumTypeList
  // ===============================
  //
  IPropertyEnumTypeList = interface(IUnknown)
    ['{a99400f4-3d84-4557-94ba-1242fb2cc9a6}']
    function GetCount(out pctypes: UINT): HResult; stdcall;

    function GetAt(itype: UINT;
                   const riid: REFIID;  // riid may be IID_IPropertyEnumType
      out ppv): HResult; stdcall;

    function GetConditionAt(nIndex: UINT;
                            const riid: REFIID;
                            out ppv): HResult; stdcall;

    function FindMatchingIndex(propvarCmp: REFPROPVARIANT;
                               out pnIndex: UINT): HResult; stdcall;

  end;

  IID_IPropertyEnumTypeList = IPropertyEnumTypeList;


  PPROPDESC_DISPLAYTYPE = ^PROPDESC_DISPLAYTYPE;
  PROPDESC_DISPLAYTYPE = (
    PDDT_STRING = 0,
                          PDDT_NUMBER = 1,
                          PDDT_BOOLEAN = 2,
                          PDDT_DATETIME = 3,
                          PDDT_ENUMERATED = 4         // Use GetEnumTypeList
    );

  PPROPDESC_GROUPING_RANGE = ^PROPDESC_GROUPING_RANGE;
  PROPDESC_GROUPING_RANGE = (
    PDGR_DISCRETE = 0,              // Display individual values
    PDGR_ALPHANUMERIC = 1,              // Display static alphanumeric ranges for values
    PDGR_SIZE = 2,              // Display static size ranges for values
    PDGR_DYNAMIC = 3,              // Display dynamically created ranges for the values
    PDGR_DATE = 4,              // Display month/year groups
    PDGR_PERCENT = 5,              // Display percent buckets
    PDGR_ENUMERATED = 6               // Display buckets from GetEnumTypeList
    );

  PPROPDESC_SORTDESCRIPTION = ^PROPDESC_SORTDESCRIPTION;
  PROPDESC_SORTDESCRIPTION = (
    PDSD_GENERAL = 0,
                              PDSD_A_Z = 1,
                              PDSD_LOWEST_HIGHEST = 2,
                              PDSD_SMALLEST_BIGGEST = 3,
                              PDSD_OLDEST_NEWEST = 4
    );


  PPropdescRelativedescriptionType = ^PROPDESC_RELATIVEDESCRIPTION_TYPE;
  PROPDESC_RELATIVEDESCRIPTION_TYPE = (
    PDRDT_GENERAL = 0,
                                       PDRDT_DATE = 1,
                                       PDRDT_SIZE = 2,
                                       PDRDT_COUNT = 3,
                                       PDRDT_REVISION = 4,
                                       PDRDT_LENGTH = 5,
                                       PDRDT_DURATION = 6,
                                       PDRDT_SPEED = 7,
                                       PDRDT_RATE = 8,
                                       PDRDT_RATING = 9,
                                       PDRDT_PRIORITY = 10
    );


  PPROPDESC_AGGREGATION_TYPE = ^PROPDESC_AGGREGATION_TYPE;
  PROPDESC_AGGREGATION_TYPE = (
    PDAT_DEFAULT = 0,               // Display "multiple-values"
    PDAT_FIRST = 1,               // Display first property value in the selection.
    PDAT_SUM = 2,               // Display the numerical sum of the values. This is never returned for VT_LPWSTR, VT_BOOL, and VT_FILETIME types.
    PDAT_AVERAGE = 3,               // Display the numerical average of the values. This is never returned for VT_LPWSTR, VT_BOOL, and VT_FILETIME types.
    PDAT_DATERANGE = 4,               // Display the date range of the values. This is only returned for VT_FILETIME types.
    PDAT_UNION = 5,               // Display values as union of all values. The order is undefined.
    PDAT_MAX = 6,               // Displays the maximum of all the values.
    PDAT_MIN = 7                // Displays the minimum of all the values.
    );


  PPROPDESC_CONDITION_TYPE = ^PROPDESC_CONDITION_TYPE;
  PROPDESC_CONDITION_TYPE = (
    PDCOT_NONE = 0,
                             PDCOT_STRING = 1,
                             PDCOT_SIZE = 2,
                             PDCOT_DATETIME = 3,
                             PDCOT_BOOLEAN = 4,
                             PDCOT_NUMBER = 5
    );


  // Interface IPropertyDescription
  // ==============================
  //
  IPropertyDescription = interface(IUnknown)
    ['{6f79d558-3e96-4549-a1d1-7d75d2288814}']
    function GetPropertyKey(out pkey: PROPERTYKEY): HResult; stdcall;

    function GetCanonicalName(out ppszName: LPOLESTR): HResult; stdcall;

    function GetPropertyType(out pvartype: VARTYPE): HResult; stdcall;

    function GetDisplayName(out ppszName: LPOLESTR): HResult; stdcall;

    function GetEditInvitation(out ppszInvite: LPOLESTR): HResult; stdcall;

    function GetTypeFlags(mask: PROPDESC_TYPE_FLAGS;
                          out ppdtFlags: PROPDESC_TYPE_FLAGS): HResult; stdcall;

    function GetViewFlags(out ppdvFlags: PROPDESC_VIEW_FLAGS): HResult; stdcall;

    function GetDefaultColumnWidth(out pcxChars: UINT): HResult; stdcall;

    function GetDisplayType(out pdisplaytype: PROPDESC_DISPLAYTYPE): HResult; stdcall;

    function GetColumnState(out pcsFlags: SHCOLSTATEF): HResult; stdcall;

    // Needs to correspond to bits in SHCOLSTATE_TYPEMASK
    function GetGroupingRange(out pgr: PROPDESC_GROUPING_RANGE): HResult; stdcall;

    function GetRelativeDescriptionType(out prdt: PROPDESC_RELATIVEDESCRIPTION_TYPE): HResult; stdcall;

    function GetRelativeDescription(propvar1: REFPROPVARIANT;
                                    propvar2: REFPROPVARIANT;
                                    out ppszDesc1: LPOLESTR;
                                    out ppszDesc2: LPOLESTR): HResult; stdcall;

    function GetSortDescription(out psd: PROPDESC_SORTDESCRIPTION): HResult; stdcall;

    function GetSortDescriptionLabel(fDescending: BOOL;
                                     out ppszDescription: LPOLESTR): HResult; stdcall;

    function GetAggregationType(out paggtype: PROPDESC_AGGREGATION_TYPE): HResult; stdcall;

    function GetConditionType(out pcontype: PROPDESC_CONDITION_TYPE;
                              out popDefault: CONDITION_OPERATION): HResult; stdcall;

    // Returns an IPropertyEnumTypeList interface
    function GetEnumTypeList(const riid: REFIID;
                             out ppv): HResult; stdcall;

    function CoerceToCanonicalValue(var ppropvar: PROPVARIANT): HResult; stdcall;

    function RemoteCoerceToCanonicalValue(const propvar: REFPROPVARIANT;
                                          out ppropvar: PROPVARIANT): HResult; stdcall;

    function FormatForDisplay(propvar: REFPROPVARIANT;
                              pdfFlags: PROPDESC_FORMAT_FLAGS;
                              out ppszDisplay: LPOLESTR): HResult; stdcall;

    function IsValueCanonical(const propvar: REFPROPVARIANT): HResult; stdcall;

  end;
  // IPropertyDescription
  IID_IPropertyDescription = IPropertyDescription;


  // Interface IPropertyDescription2
  // ===============================
  //
  IPropertyDescription2 = interface(IPropertyDescription)
    ['{57d2eded-5062-400e-b107-5dae79fe57a6}']
    function GetImageReferenceForValue(propvar: REFPROPVARIANT;
                                       out ppszImageRes: LPOLESTR): HResult; stdcall;
    // returns a string of the form "<dll name>,-<resid>" that is suitable to be passed to PathParseIconLocation()

  end;
  // IPropertyDescription2
  IID_IPropertyDescription2 = IPropertyDescription2;


  // Interface IPropertyDescriptionAliasInfo
  // =======================================
  //
  IPropertyDescriptionAliasInfo = interface(IPropertyDescription)
    ['{f67104fc-2af9-46fd-b32d-243c1404f3d1}']
    function GetSortByAlias(const riid: REFIID;
                            out ppv): HResult; stdcall;

    // Returns an IPropertyDescription interface
    function GetAdditionalSortByAliases(const riid: REFIID;
                                        out ppv): HResult; stdcall;
    // Returns an IPropertyDescriptionList interface
  end;
  // IPropertyDescriptionAliasInfo
  IID_IPropertyDescriptionAliasInfo = IPropertyDescriptionAliasInfo;


  PPROPDESC_COLUMNINDEX_TYPE = ^PROPDESC_COLUMNINDEX_TYPE;
  PROPDESC_COLUMNINDEX_TYPE = (
    PDCIT_NONE = 0,
                               PDCIT_ONDISK = 1,
                               PDCIT_INMEMORY = 2,
                               PDCIT_ONDEMAND = 3,
                               PDCIT_ONDISKALL = 4,
                               PDCIT_ONDISKVECTOR = 5
    );


  // Interface IPropertyDescriptionSearchInfo
  // ========================================
  //
  IPropertyDescriptionSearchInfo = interface(IPropertyDescription)
    ['{078f91bd-29a2-440f-924e-46a291524520}']

    function GetSearchInfoFlags(out ppdsiFlags: PROPDESC_SEARCHINFO_FLAGS): HResult; stdcall;

    function GetColumnIndexType(out ppdciType: PROPDESC_COLUMNINDEX_TYPE): HResult; stdcall;

    function GetProjectionString(out ppszProjection: LPOLESTR): HResult; stdcall;

    function GetMaxSize(out pcbMaxSize: UINT): HResult; stdcall;

  end;
  // IPropertyDescriptionSearchInfo
  IID_IPropertyDescriptionSearchInfo = IPropertyDescriptionSearchInfo;


  // Interface IPropertyDescriptionRelatedPropertyInfo
  // =================================================
  //
  IPropertyDescriptionRelatedPropertyInfo = interface(IPropertyDescription)
    ['{507393f4-2a3d-4a60-b59e-d9c75716c2dd}']

    function GetRelatedProperty(pszRelationshipName: LPOLESTR;
                                const riid: REFIID;
                                out ppv): HResult; stdcall;
    // Returns an IPropertyDescription interface

  end;
  // IPropertyDescriptionRelatedPropertyInfo
  IID_IPropertyDescriptionRelatedPropertyInfo = IPropertyDescriptionRelatedPropertyInfo;


  //
  PPROPDESC_ENUMFILTER = ^PROPDESC_ENUMFILTER;
  PROPDESC_ENUMFILTER = (
    PDEF_ALL = 0,                   // All properties in system
    PDEF_SYSTEM = 1,                   // Only system properties
    PDEF_NONSYSTEM = 2,                   // Only non-system properties
    PDEF_VIEWABLE = 3,                   // Only viewable properties
    PDEF_QUERYABLE = 4,                   // Deprecated
    PDEF_INFULLTEXTQUERY = 5,                   // Deprecated
    PDEF_COLUMN = 6                    // Only properties that are columns
    );



  // Interface IPropertySystem
  // =========================
  //
  IPropertySystem = interface(IUnknown)
    ['{ca724e8a-c3e6-442b-88a4-6fb0db8035a3}']

    function GetPropertyDescription(propkey: REFPROPERTYKEY;
                                    const riid: REFIID;
                                    out ppv): HResult; stdcall;

    // Returns an IPropertyDescription interface
    function GetPropertyDescriptionByName(pszCanonicalName: LPOLESTR;
                                          const riid: REFIID;
                                          out ppv): HResult; stdcall;

    function GetPropertyDescriptionListFromString(pszPropList: LPOLESTR;
                                                  const riid: REFIID;
                                                  out ppv): HResult; stdcall;

    // Returns an IPropertyDescriptionList interface
    function EnumeratePropertyDescriptions(filterOn: PROPDESC_ENUMFILTER;
                                           const riid: REFIID;
                                           out ppv): HResult; stdcall;

    function FormatForDisplay(key: REFPROPERTYKEY;
                              propvar: REFPROPVARIANT;
                              pdff: PROPDESC_FORMAT_FLAGS;
                              out pszText: LPOLESTR;
                              cchText: DWORD): HResult; stdcall; // 32K should be enough for anybody

    function FormatForDisplayAlloc(key: REFPROPERTYKEY;
                                   propvar: REFPROPVARIANT;
                                   pdff: PROPDESC_FORMAT_FLAGS;
                                   out ppszDisplay: LPOLESTR): HResult; stdcall;

    function RegisterPropertySchema(const pszPath: LPOLESTR): HResult; stdcall;

    function UnregisterPropertySchema(const pszPath: LPOLESTR): HResult; stdcall;

    function RefreshPropertySchema(): HResult; stdcall;

  end;
  // IPropertySystem
  IID_IPropertySystem = IPropertySystem;



  // Interface IPropertyDescriptionList
  // ==================================
  //
  IPropertyDescriptionList = interface(IUnknown)
    ['{1f9fc1d0-c39b-4b26-817f-011967d3440e}']
    function GetCount(var pcElem: UINT): HResult; stdcall;

    function GetAt(iElem: UINT;
                   const riid: REFIID;
                   out ppv): HResult; stdcall;
    // Returns an IPropertyDescription interface

  end;
  // IPropertyDescriptionList
  IID_IPropertyDescriptionList = IPropertyDescriptionList;



  // Interface IPropertyStoreFactory
  // ===============================
  //
  IPropertyStoreFactory = interface(IUnknown)
    ['{bc110b6d-57e8-4148-a9c6-91015ab2f3a5}']

    function GetPropertyStore(flags: GETPROPERTYSTOREFLAGS;
                              pUnkFactory: IUnknown;  // ICreateObject
      const riid: REFIID;
                              out ppv): HResult; stdcall;

    // Returns an IPropertyStore interface
    function GetPropertyStoreForKeys(rgKeys: PROPERTYKEY;
                                     cKeys: UINT;
                                     flags: GETPROPERTYSTOREFLAGS;
                                     const riid: REFIID;
                                     out ppv): HResult; stdcall;

  end;
  // IPropertyStoreFactory
  IID_IPropertyStoreFactory = IPropertyStoreFactory;



  // Interface IDelayedPropertyStoreFactory
  // ======================================
  //
  IDelayedPropertyStoreFactory = interface(IPropertyStoreFactory)
    ['{40d4577f-e237-4bdb-bd69-58f089431b6a}']

    function GetDelayedPropertyStore(const flags: GETPROPERTYSTOREFLAGS;
                                     const dwStoreId: DWORD;
                                     const riid: REFIID;
                                     out ppv): HResult; stdcall;
    // Returns an IPropertyStore interface

  end;

  IID_IDelayedPropertyStoreFactory = IDelayedPropertyStoreFactory;


  // new

  PUSERIALIZEDPROPSTORAGE = ^tagSERIALIZEDPROPSTORAGE;
  PCUSERIALIZEDPROPSTORAGE = ^tagSERIALIZEDPROPSTORAGE;
  PSERIALIZEDPROPSTORAGE = ^tagSERIALIZEDPROPSTORAGE;

  tagSERIALIZEDPROPSTORAGE = record
    cbNext: UINT;
    dwVersion: DWORD;
    fmtid: TGUID;
  end;
  SERIALIZEDPROPSTORAGE = tagSERIALIZEDPROPSTORAGE;



  // Interface IPersistSerializedPropStorage
  // =======================================
  //
  IPersistSerializedPropStorage = interface(IUnknown)
    ['{e318ad57-0aa0-450f-aca5-6fab7103d917}']

    function SetFlags(const flags: PERSIST_SPROPSTORE_FLAGS): HResult; stdcall;

    function SetPropertyStorage(psps: PCUSERIALIZEDPROPSTORAGE;
                                cb: DWORD): HResult; stdcall;

    function GetPropertyStorage(out ppsps: PSERIALIZEDPROPSTORAGE;
                                out pcb: DWORD): HResult; stdcall;

  end;

  IID_IPersistSerializedPropStorage = IPersistSerializedPropStorage;




  // Interface IPersistSerializedPropStorage2
  // ========================================
  //
  IPersistSerializedPropStorage2 = interface(IPersistSerializedPropStorage)
    ['{77effa68-4f98-4366-ba72-573b3d880571}']

    function GetPropertyStorageSize(out pcb: DWORD): HResult; stdcall;

    // Fails if cb is smaller than the total size of the serialized data.
    function GetPropertyStorageBuffer(out psps: PSERIALIZEDPROPSTORAGE;
                                      cb: DWORD; // The initial size, in bytes, of the buffer pointed to by psps
      out pcbWritten: DWORD): HResult; stdcall;

  end;

  IID_IPersistSerializedPropStorage2 = IPersistSerializedPropStorage2;




  // Interface IPropertySystemChangeNotify
  // =====================================
  //
  IPropertySystemChangeNotify = interface(IUnknown)
    ['{fa955fd9-38be-4879-a6ce-824cf52d609f}']
    function SchemaRefreshed(): HResult; stdcall;

  end;
  // IPropertySystemChangeNotify
  IID_IPropertySystemChangeNotify = IPropertySystemChangeNotify;


  // Interface ICreateObject
  // =======================
  //
  ICreateObject = interface(IUnknown)
    ['{75121952-e0d0-43e5-9380-1d80483acf72}']
    function CreateObject(const clsid: REFCLSID;
                          pUnkOuter: IUnknown;
                          const riid: REFIID;
                          out ppv): HResult; stdcall;

  end;

  IID_ICreateObject = ICreateObject;


  // --- HELPERS ---------------------------------------------------------------

function PSFormatForDisplay(propkey: REFPROPERTYKEY;
                            propvar: REFPROPVARIANT;
                            pdfFlags: PROPDESC_FORMAT_FLAGS;
                            out pwszText: LPOLESTR;
                            cchText: DWORD): HResult; stdcall;
// Format a property value for display purposes

function PSFormatForDisplayAlloc(key: REFPROPERTYKEY;
                                 propvar: REFPROPVARIANT;
                                 pdff: PROPDESC_FORMAT_FLAGS;
                                 out ppszDisplay: LPOLESTR): HResult; stdcall;

function PSFormatPropertyValue(pps: IPropertyStore;
                               ppd: IPropertyDescription;
                               pdff: PROPDESC_FORMAT_FLAGS;
                               out ppszDisplay: LPOLESTR): HResult; stdcall;

function PSGetImageReferenceForValue(propkey: REFPROPERTYKEY;
                                     propvar: REFPROPVARIANT;
                                     out ppszImageRes: LPOLESTR): HResult; stdcall;
// Retrieve the image reference associated with a property value (if specified)

function PSStringFromPropertyKey(pkey: REFPROPERTYKEY;
                                 out psz: LPOLESTR;
                                 cch: UINT): HResult; stdcall;
// Convert a PROPERTYKEY to and from a PWSTR

function PSPropertyKeyFromString(pszString: LPOLESTR;
                                 out pkey: PROPERTYKEY): HResult; stdcall;

function PSCreateMemoryPropertyStore(const riid: REFIID;
                                     out ppv): HResult; stdcall;
// Creates an in-memory property store
// Returns an IPropertyStore, IPersistSerializedPropStorage, and related interfaces interface

function PSCreateDelayedMultiplexPropertyStore(flags: GETPROPERTYSTOREFLAGS;
                                               pdpsf: IDelayedPropertyStoreFactory;
                                               rgStoreIds: DWORD;
                                               cStores: DWORD;
                                               const riid: REFIID;
                                               out ppv): HResult; stdcall;
// Create a read-only, delay-bind multiplexing property store
// Returns an IPropertyStore interface or related interfaces.

function PSCreateMultiplexPropertyStore(prgpunkStores: PIUnknown;
                                        cStores: DWORD;
                                        const riid: REFIID;
                                        out ppv): HResult; stdcall;
// Create a read-only property store from one or more sources (which each must support either IPropertyStore or IPropertySetStorage)
// Returns an IPropertyStore interface or related interfaces


function PSCreatePropertyChangeArray(rgpropkey: PROPERTYKEY;
                                     rgflags: PKA_FLAGS;
                                     rgpropvar: PROPVARIANT;
                                     cChanges: UINT;
                                     const riid: REFIID;
                                     out ppv): HResult; stdcall;
// Create a container for IPropertyChanges.
// Returns an IPropertyChangeArray interface.


function PSCreateSimplePropertyChange(flags: PKA_FLAGS;
                                      key: REFPROPERTYKEY;
                                      propvar: REFPROPVARIANT;
                                      const riid: REFIID;
                                      out ppv): HResult; stdcall;
// Create a simple property change.
// Returns an IPropertyChange interface.


function PSGetPropertyDescription(propkey: REFPROPERTYKEY;
                                  const riid: REFIID;
                                  out ppv): HResult; stdcall;
// Get a property description.
// Returns an IPropertyDescription interface.


function PSGetPropertyDescriptionByName(pszCanonicalName: LPOLESTR;
                                        const riid: REFIID;
                                        out ppv): HResult; stdcall;


function PSLookupPropertyHandlerCLSID(pszFilePath: LPCWSTR;
                                      out pclsid: CLSID): HResult; stdcall;
// Lookup a per-machine registered file property handler



function PSGetItemPropertyHandler(punkItem: IUnknown;
                                  fReadWrite: BOOL;
                                  const riid: REFIID;
                                  out ppv): HResult; stdcall;
// Get a property handler, on Vista or downlevel to XP.
// punkItem is a shell item created with an SHCreateItemXXX API.
// Returns an IPropertyStore.


function PSGetItemPropertyHandlerWithCreateObject(punkItem: IUnknown;
                                                  fReadWrite: BOOL;
                                                  punkCreateObject: IUnknown;
                                                  const riid: REFIID;
                                                  out ppv): HResult; stdcall;
// Get a property handler, on Vista or downlevel to XP.
// punkItem is a shell item created with an SHCreateItemXXX API .
// punkCreateObject supports ICreateObject.
// Returns an IPropertyStore.


function PSGetPropertyValue(pps: IPropertyStore;
                            ppd: IPropertyDescription;
                            out ppropvar: PROPVARIANT): HResult; stdcall;
// Get a property value from a store.


function PSSetPropertyValue(pps: IPropertyStore;
                            ppd: IPropertyDescription;
                            propvar: REFPROPVARIANT): HResult; stdcall;
// Set a property value from a store.


// Interact with the set of property descriptions ............................

function PSRegisterPropertySchema(pszPath: LPCWSTR): HResult; stdcall;
function PSUnregisterPropertySchema(pszPath: LPCWSTR): HResult; stdcall;
function PSRefreshPropertySchema(): HResult; stdcall;
// ...........................................................................



function PSEnumeratePropertyDescriptions(filterOn: PROPDESC_ENUMFILTER;
                                         const riid: REFIID;
                                         out ppv): HResult; stdcall;
// Returns either: IPropertyDescriptionList or IEnumUnknown interfaces.

function PSGetPropertyKeyFromName(pszName: LPCWSTR;
                                  out ppropkey: PROPERTYKEY): HResult; stdcall;
// Convert between a PROPERTYKEY and its canonical name.

function PSGetNameFromPropertyKey(propkey: REFPROPERTYKEY;
                                  out ppszCanonicalName: LPOLESTR): HResult; stdcall;

function PSCoerceToCanonicalValue(key: REFPROPERTYKEY;
                                  out ppropvar: PROPVARIANT): HResult; stdcall;
// Coerce and canonicalize a property value.

function PSGetPropertyDescriptionListFromString(pszPropList: LPOLESTR;
                                                const riid: REFIID;
                                                out ppv): HResult; stdcall;
// Convert a 'prop:' string into a list of property descriptions.
// Returns an IPropertyDescriptionList interface.

function PSCreatePropertyStoreFromPropertySetStorage(ppss: IPropertySetStorage;
                                                     grfMode: DWORD;
                                                     const riid: REFIID;
                                                     out ppv): HResult; stdcall;
// Wrap an IPropertySetStorage interface in an IPropertyStore interface
// Returns an IPropertyStore or related interface

function PSCreatePropertyStoreFromObject(punk: IUnknown;
                                         grfMode: DWORD;
                                         const riid: REFIID;
                                         out ppv): HResult; stdcall;
// punkSource must support IPropertyStore or IPropertySetStorage
// On success, the returned ppv is guaranteed to support IPropertyStore.
// If punkSource already supports IPropertyStore, no wrapper is created.

function PSCreateAdapterFromPropertyStore(pps: IPropertyStore;
                                          const riid: REFIID;
                                          out ppv): HResult; stdcall;
// punkSource must support IPropertyStore.
// riid may be IPropertyStore, IPropertySetStorage, IPropertyStoreCapabilities, or IObjectProvider.

function PSGetPropertySystem(const riid: REFIID;
                             out ppv: PPointer): HResult; stdcall;
// Talk to the property system using an interface.
// Returns an IPropertySystem interface.

function PSGetPropertyFromPropertyStorage(psps: PCUSERIALIZEDPROPSTORAGE;
                                          cb: DWORD;
                                          rpkey: REFPROPERTYKEY;
                                          out ppropvar: PROPVARIANT): HResult; stdcall;
// Obtain a value from serialized property storage.

function PSGetNamedPropertyFromPropertyStorage(psps: PCUSERIALIZEDPROPSTORAGE;
                                               cb: DWORD;
                                               pszName: LPOLESTR;
                                               out ppropvar: PROPVARIANT): HResult; stdcall;
// Obtain a named value from serialized property storage.




//----- Helper functions for reading and writing values from IPropertyBag's ---

function PSPropertyBag_ReadType(propBag: IPropertyBag;
                                propName: LPOLESTR;
                                _var: VARIANT;
                                out _type: VARTYPE): HResult; stdcall;

function PSPropertyBag_ReadStr(propBag: IPropertyBag;
                               propName: LPOLESTR;
                               out value: LPOLESTR;
                               characterCount: Integer): HResult; stdcall;

function PSPropertyBag_ReadStrAlloc(propBag: IPropertyBag;
                                    const propName: LPOLESTR;
                                    out value: LPOLESTR): HResult; stdcall;

function PSPropertyBag_ReadBSTR(propBag: IPropertyBag;
                                propName: LPOLESTR;
                                out value: BSTR): HResult; stdcall;

function PSPropertyBag_WriteStr(propBag: IPropertyBag;
                                propName: LPOLESTR;
                                value: LPOLESTR): HResult; stdcall;

function PSPropertyBag_WriteBSTR(propBag: IPropertyBag;
                                 propName: LPOLESTR;
                                 value: BSTR): HResult; stdcall;

function PSPropertyBag_ReadInt(propBag: IPropertyBag;
                               propName: LPOLESTR;
                               out value: INT): HResult; stdcall;

function PSPropertyBag_WriteInt(propBag: IPropertyBag;
                                propName: LPOLESTR;
                                value: INT): HResult; stdcall;

function PSPropertyBag_ReadSHORT(propBag: IPropertyBag;
                                 propName: LPOLESTR;
                                 out value: SHORT): HResult; stdcall;

function PSPropertyBag_WriteSHORT(propBag: IPropertyBag;
                                  propName: LPOLESTR;
                                  value: SHORT): HResult; stdcall;

function PSPropertyBag_ReadLONG(propBag: IPropertyBag;
                                propName: LPOLESTR;
                                value: LONG): HResult; stdcall;

function PSPropertyBag_WriteLONG(propBag: IPropertyBag;
                                 propName: LPOLESTR;
                                 value: LONG): HResult; stdcall;

function PSPropertyBag_ReadDWORD(propBag: IPropertyBag;
                                 propName: LPOLESTR;
                                 out value: DWORD): HResult; stdcall;

function PSPropertyBag_WriteDWORD(propBag: IPropertyBag;
                                  const propName: LPOLESTR;
                                  const value: DWORD): HResult; stdcall;

function PSPropertyBag_ReadBOOL(propBag: IPropertyBag;
                                propName: LPOLESTR;
                                out value: BOOL): HResult; stdcall;

function PSPropertyBag_WriteBOOL(propBag: IPropertyBag;
                                 propName: LPOLESTR;
                                 value: BOOL): HResult; stdcall;

function PSPropertyBag_ReadPOINTL(propBag: IPropertyBag;
                                  propName: LPOLESTR;
                                  out value: POINTL): HResult; stdcall;

function PSPropertyBag_WritePOINTL(propBag: IPropertyBag;
                                   propName: LPOLESTR;
                                   value: POINTL): HResult; stdcall;

function PSPropertyBag_ReadPOINTS(propBag: IPropertyBag;
                                  propName: LPOLESTR;
                                  out value: POINTS): HResult; stdcall;

function PSPropertyBag_WritePOINTS(propBag: IPropertyBag;
                                   const propName: LPOLESTR;
                                   const value: POINTS): HResult; stdcall;

function PSPropertyBag_ReadRECTL(propBag: IPropertyBag;
                                 propName: LPOLESTR;
                                 out value: RECTL): HResult; stdcall;

function PSPropertyBag_WriteRECTL(propBag: IPropertyBag;
                                  propName: LPOLESTR;
                                  value: RECTL): HResult; stdcall;

function PSPropertyBag_ReadStream(propBag: IPropertyBag;
                                  propName: LPOLESTR;
                                  out value: IStream): HResult; stdcall;

function PSPropertyBag_WriteStream(propBag: IPropertyBag;
                                   propName: LPOLESTR;
                                   value: IStream): HResult; stdcall;

function PSPropertyBag_Delete(propBag: IPropertyBag;
                              propName: LPOLESTR): HResult; stdcall;

function PSPropertyBag_ReadULONGLONG(propBag: IPropertyBag;
                                     propName: LPOLESTR;
                                     out value: ULONGLONG): HResult; stdcall;

function PSPropertyBag_WriteULONGLONG(propBag: IPropertyBag;
                                      propName: LPOLESTR;
                                      value: ULONGLONG): HResult; stdcall;

function PSPropertyBag_ReadUnknown(propBag: IPropertyBag;
                                   propName: LPOLESTR;
                                   const riid: REFIID;
                                   out ppv): HResult; stdcall;

function PSPropertyBag_WriteUnknown(propBag: IPropertyBag;
                                    propName: LPOLESTR;
                                    punk: IUnknown): HResult; stdcall;

function PSPropertyBag_ReadGUID(propBag: IPropertyBag;
                                propName: LPOLESTR;
                                out value: TGUID): HResult; stdcall;

function PSPropertyBag_WriteGUID(propBag: IPropertyBag;
                                 propName: LPOLESTR;
                                 value: TGUID): HResult; stdcall;

function PSPropertyBag_ReadPropertyKey(propBag: IPropertyBag;
                                       propName: LPOLESTR;
                                       out value: PROPERTYKEY): HResult; stdcall;

function PSPropertyBag_WritePropertyKey(propBag: IPropertyBag;
                                        propName: LPOLESTR;
                                        value: REFPROPERTYKEY): HResult; stdcall;

//[
//    uuid(2cda3294-6c4f-4020-b161-27c530c81fa6), // LIBID_PropSysObjects (not registered)
//    lcid(0x0000),
//    version(1.0)
//]

// library PropSysObjects
const
  CLSID_IInMemoryPropertyStore: TGUID = (D1: $9A02E012;
    D2: $6303;
    D3: $4E1E;
    D4: ($B9,
         $A1,
         $63,
         $0F,
         $80,
         $25,
         $92,
         $C5));

  CLSID_IPropertySystem: TGUID = (D1: $B8967F85;
    D2: $58AE;
    D3: $4F46;
    D4: ($9F,
         $B2,
         $5D,
         $79,
         $04,
         $79,
         $8F,
         $4B));


function PropVariantToWinRTPropertyValue(propvar: REFPROPVARIANT;
                                         const riid: REFIID;
                                         out ppv): HResult; stdcall;
//ppv may return NIL

function WinRTPropertyValueToPropVariant(punkPropertyValue: IUnknown;
                                         out ppropvar: PROPVARIANT): HResult; stdcall;
// returns E_FAIL if not found

function GetState(key: REFPROPERTYKEY;
                  out pstate: PSC_STATE): HResult; stdcall;
// retunrs E_FAIL if not found

function GetValueAndState(key: REFPROPERTYKEY;
                          out ppropvar: PROPVARIANT;
                          out pstate: PSC_STATE): HResult; stdcall;

function SetState(key: REFPROPERTYKEY;
                  state: PSC_STATE): HResult; stdcall;

function SetValueAndState(key: REFPROPERTYKEY;
                          ppropvar: PROPVARIANT;
                          state: PSC_STATE): HResult; stdcall;


// Additional Prototypes for ALL interfaces

// end of Additional Prototypes

implementation

const
  PropSysLib = 'propsys.dll';

// Helpers
function PSFormatForDisplay; external propSysLib name 'PSFormatForDisplay';
function PSFormatForDisplayAlloc; external propSysLib name 'PSFormatForDisplayAlloc';
function PSFormatPropertyValue; external propSysLib name 'PSFormatPropertyValue';
function PSGetImageReferenceForValue; external propSysLib name 'PSGetImageReferenceForValue';
function PSStringFromPropertyKey; external propSysLib name 'PSStringFromPropertyKey';
function PSPropertyKeyFromString; external propSysLib name 'PSPropertyKeyFromString';
function PSCreateMemoryPropertyStore; external propSysLib name 'PSCreateMemoryPropertyStore';
function PSCreateDelayedMultiplexPropertyStore; external propSysLib name 'PSCreateDelayedMultiplexPropertyStore';
function PSCreateMultiplexPropertyStore; external propSysLib name 'PSCreateMultiplexPropertyStore';
function PSCreatePropertyChangeArray; external propSysLib name 'PSCreatePropertyChangeArray';
function PSCreateSimplePropertyChange; external propSysLib name 'PSCreateSimplePropertyChange';
function PSGetPropertyDescription; external propSysLib name 'PSGetPropertyDescription';
function PSGetPropertyDescriptionByName; external propSysLib name 'PSGetPropertyDescriptionByName';
function PSLookupPropertyHandlerCLSID; external propSysLib name 'PSLookupPropertyHandlerCLSID';
function PSGetItemPropertyHandler; external propSysLib name 'PSGetItemPropertyHandler';
function PSGetItemPropertyHandlerWithCreateObject; external propSysLib name 'PSGetItemPropertyHandlerWithCreateObject';
function PSGetPropertyValue; external propSysLib name 'PSGetPropertyValue';
function PSSetPropertyValue; external propSysLib name 'PSSetPropertyValue';
function PSRegisterPropertySchema; external propSysLib name 'PSRegisterPropertySchema';
function PSUnregisterPropertySchema; external propSysLib name 'PSUnregisterPropertySchema';
function PSRefreshPropertySchema; external propSysLib name 'PSRefreshPropertySchema';

function PSEnumeratePropertyDescriptions; external propSysLib name 'PSEnumeratePropertyDescriptions';
function PSGetPropertyKeyFromName; external propSysLib name 'PSGetPropertyKeyFromName';
function PSGetNameFromPropertyKey; external propSysLib name 'PSGetNameFromPropertyKey';
function PSCoerceToCanonicalValue; external propSysLib name 'PSCoerceToCanonicalValue';
function PSGetPropertyDescriptionListFromString; external propSysLib name 'PSGetPropertyDescriptionListFromString';
function PSCreatePropertyStoreFromPropertySetStorage; external propSysLib name 'PSCreatePropertyStoreFromPropertySetStorage';
function PSCreatePropertyStoreFromObject; external propSysLib name 'PSCreatePropertyStoreFromObject';
function PSCreateAdapterFromPropertyStore; external propSysLib name 'PSCreateAdapterFromPropertyStore';
function PSGetPropertySystem; external propSysLib name 'PSGetPropertySystem';
function PSGetPropertyFromPropertyStorage; external propSysLib name 'PSGetPropertyFromPropertyStorage';
function PSGetNamedPropertyFromPropertyStorage; external propSysLib name 'PSGetNamedPropertyFromPropertyStorage';

function PSPropertyBag_ReadType; external propSysLib name 'PSPropertyBag_ReadType';
function PSPropertyBag_ReadStrAlloc; external propSysLib name 'PSPropertyBag_ReadStrAlloc';
function PSPropertyBag_ReadStr; external propSysLib name 'PSPropertyBag_ReadStr';
function PSPropertyBag_WriteStr; external propSysLib name 'PSPropertyBag_WriteStr';
function PSPropertyBag_ReadBSTR; external propSysLib name 'PSPropertyBag_ReadBSTR';
function PSPropertyBag_WriteBSTR; external propSysLib name 'PSPropertyBag_WriteBSTR';
function PSPropertyBag_ReadInt; external propSysLib name 'PSPropertyBag_ReadInt';
function PSPropertyBag_WriteInt; external propSysLib name 'PSPropertyBag_WriteInt';
function PSPropertyBag_ReadSHORT; external propSysLib name 'PSPropertyBag_ReadSHORT';
function PSPropertyBag_WriteSHORT; external propSysLib name 'PSPropertyBag_WriteSHORT';
function PSPropertyBag_ReadLONG; external propSysLib name 'PSPropertyBag_ReadLONG';
function PSPropertyBag_WriteLONG; external propSysLib name 'PSPropertyBag_WriteLONG';
function PSPropertyBag_ReadDWORD; external propSysLib name 'PSPropertyBag_ReadDWORD';
function PSPropertyBag_WriteDWORD; external propSysLib name 'PSPropertyBag_WriteDWORD';
function PSPropertyBag_ReadBOOL; external propSysLib name 'PSPropertyBag_ReadBOOL';
function PSPropertyBag_WriteBOOL; external propSysLib name 'PSPropertyBag_WriteBOOL';
function PSPropertyBag_ReadPOINTL; external propSysLib name 'PSPropertyBag_ReadPOINTL';
function PSPropertyBag_WritePOINTL; external propSysLib name 'PSPropertyBag_WritePOINTL';
function PSPropertyBag_ReadPOINTS; external propSysLib name 'PSPropertyBag_ReadPOINTS';
function PSPropertyBag_WritePOINTS; external propSysLib name 'PSPropertyBag_WritePOINTS';
function PSPropertyBag_ReadRECTL; external propSysLib name 'PSPropertyBag_ReadRECTL';
function PSPropertyBag_WriteRECTL; external propSysLib name 'PSPropertyBag_WriteRECTL';
function PSPropertyBag_ReadStream; external propSysLib name 'PSPropertyBag_ReadStream';
function PSPropertyBag_WriteStream; external propSysLib name 'PSPropertyBag_WriteStream';
function PSPropertyBag_Delete; external propSysLib name 'PSPropertyBag_Delete';
function PSPropertyBag_ReadULONGLONG; external propSysLib name 'PSPropertyBag_ReadULONGLONG';
function PSPropertyBag_WriteULONGLONG; external propSysLib name 'PSPropertyBag_WriteULONGLONG';
function PSPropertyBag_ReadUnknown; external propSysLib name 'PSPropertyBag_ReadUnknown';
function PSPropertyBag_WriteUnknown; external propSysLib name 'PSPropertyBag_WriteUnknown';
function PSPropertyBag_ReadGUID; external propSysLib name 'PSPropertyBag_ReadGUID';
function PSPropertyBag_WriteGUID; external propSysLib name 'PSPropertyBag_WriteGUID';
function PSPropertyBag_ReadPropertyKey; external propSysLib name 'PSPropertyBag_ReadPropertyKey';
function PSPropertyBag_WritePropertyKey; external propSysLib name 'PSPropertyBag_WritePropertyKey';
function PropVariantToWinRTPropertyValue; external propSysLib name 'PropVariantToWinRTPropertyValue';
function WinRTPropertyValueToPropVariant; external propSysLib name 'WinRTPropertyValueToPropVariant';
function GetState; external propSysLib name 'GetState';
function GetValueAndState; external propSysLib name 'GetValueAndState';
function SetState; external propSysLib name 'SetState';
function SetValueAndState; external propSysLib name 'SetValueAndState';

// Implement Additional Prototypes here.

end.
