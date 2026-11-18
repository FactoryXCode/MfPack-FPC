// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MfPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.FunctionDiscoveryApi.FunctionDiscoveryApi.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 05-05-2026
// Language: ENU
//
// Upstream revision: 4.1.0
// Description:
//
// Organisation: FactoryX
// Initiator(s): Tony (maXcomX), Peter (OzShips)
// Contributor(s): Tony Kalf (maXcomX)
//
//------------------------------------------------------------------------------
// CHANGE LOG
// Date       Person              Reason
// ---------- ------------------- ----------------------------------------------
// 15/11/2026 All                 Eels release  SDK 10.0.28000.2705 (Windows 11)
//------------------------------------------------------------------------------
//
// Remarks: - This unit intentionally declares both ANSI and Unicode entry points.
//          - FPC applications should normally use the explicit W versions.
//          - The unsuffixed helper aliases at the bottom map to the Unicode versions.
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
// Source: functiondiscoveryapi.idl
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
unit WinApi.FunctionDiscoveryApi.FunctionDiscoveryApi;

{$I MfPack.Fpc.inc}


interface

uses

  {WinApi}
  Windows,
  WinApi.WinApiTypes,
  WinApi.ServProv,
  {ActiveX}
  WinApi.ActiveX.PropSys,
  WinApi.ActiveX.PropIdl,
  {FunctionDiscoveryApi}
  WinApi.FunctionDiscoveryApi.FunctionDiscoveryConstraints;

  {$PACKENUM 4}

const

  // CLSID_FunctionDiscovery: TGUID = '{C72BE2EC-8E90-452c-B29A-AB8FF1C071FC}'

  CLSID_FunctionDiscovery: TGUID = (D1: $C72BE2EC;
                                    D2: $8E90;
                                    D3: $452C;
                                    D4: ($B2, $9A, $AB, $8F, $F1, $C0, $71, $FC));

type

  // Forward declarations
  IFunctionDiscovery = interface;
  IFunctionInstance = interface;
  IFunctionInstanceCollection = interface;
  IFunctionInstanceQuery = interface;
  IFunctionInstanceCollectionQuery = interface;
  IPropertyStoreCollection = interface;
  IFunctionDiscoveryNotification = interface;
  // IFunctionInstanceCollectionQueryCollection = interface;

  PFDQUERYCONTEXT = ^FDQUERYCONTEXT;
  FDQUERYCONTEXT = DWORDLONG;

  tagSystemVisibilityFlags = (
    SVF_SYSTEM = 0,
    SVF_USER  = 1
  );
  SystemVisibilityFlags = tagSystemVisibilityFlags;
  PSystemVisibilityFlags = ^tagSystemVisibilityFlags;


  tagQueryUpdateAction = (
    QUA_ADD = 0,
    QUA_REMOVE = 1,
    QUA_CHANGE = 2
  );
  QueryUpdateAction = tagQueryUpdateAction;
  PQueryUpdateAction = ^tagQueryUpdateAction;

  tagQueryCategoryType = (
    QCT_PROVIDER = 0,
    QCT_LAYERED = 1
  );
  QueryCategoryType = tagQueryCategoryType;
  PQueryCategoryType = ^tagQueryCategoryType;



  // This interface should be implemented by clients performing async queries...
  //
  // Interface IFunctionDiscoveryNotification
  // ========================================
  //
  IFunctionDiscoveryNotification = interface(IUnknown)
    ['{5F6C1BA8-5330-422E-A368-572B244D3F87}']

    function OnUpdate(enumQueryUpdateAction: QueryUpdateAction;
                      fdqcQueryContext: FDQUERYCONTEXT;
                      const pIFunctionInstance: IFunctionInstance): HRESULT; stdcall;

    function OnError(hr: HRESULT;
                     fdqcQueryContext: FDQUERYCONTEXT;
                     pszProvider: LPCWSTR): HRESULT; stdcall;

    function OnEvent(dwEventID: DWORD;
                     fdqcQueryContext: FDQUERYCONTEXT;
                     pszProvider: LPCWSTR): HRESULT; stdcall;

  end;
  IID_IFunctionDiscoveryNotification = IFunctionDiscoveryNotification;


  // Interface IFunctionDiscovery
  // ============================
  //
  IFunctionDiscovery = interface(IUnknown)
    ['{4DF99B70-E148-4432-B004-4C9EEB535A5E}']

    // Discovery
    function GetInstanceCollection(pszCategory: LPCWSTR;
                                   pszSubCategory: LPCWSTR;
                                   fIncludeAllSubCategories: BOOL;
                                   out ppIFunctionInstanceCollection: IFunctionInstanceCollection): HRESULT; stdcall;

    function GetInstance(pszFunctionInstanceIdentity: LPCWSTR;
                         out ppIFunctionInstance: IFunctionInstance): HRESULT; stdcall;

    function CreateInstanceCollectionQuery(pszCategory: LPCWSTR;
                                           pszSubCategory: LPCWSTR;
                                           fIncludeAllSubCategories: BOOL;
                                           const pIFunctionDiscoveryNotification: IFunctionDiscoveryNotification;
                                           pfdqcQueryContext: PFDQUERYCONTEXT;
                                           out ppIFunctionInstanceCollectionQuery: IFunctionInstanceCollectionQuery): HRESULT; stdcall;

    function CreateInstanceQuery(pszFunctionInstanceIdentity: LPCWSTR;
                                 const pIFunctionDiscoveryNotification: IFunctionDiscoveryNotification;
                                 pfdqcQueryContext: PFDQUERYCONTEXT;
                                 out ppIFunctionInstanceQuery: IFunctionInstanceQuery): HRESULT; stdcall;

    // Provider Specific
    function AddInstance(enumSystemVisibility: SystemVisibilityFlags;
                         pszCategory: LPCWSTR;
                         pszSubCategory: LPCWSTR;
                         pszCategoryIdentity: LPCWSTR;
                         out ppIFunctionInstance: IFunctionInstance): HRESULT; stdcall;

    function RemoveInstance(enumSystemVisibility: SystemVisibilityFlags;
                            pszCategory: LPCWSTR;
                            pszSubCategory: LPCWSTR;
                            pszCategoryIdentity: LPCWSTR): HRESULT; stdcall;

  end;
  IID_IFunctionDiscovery = IFunctionDiscovery;


  // Interface IFunctionInstance
  // ===========================
  //
  IFunctionInstance = interface(IServiceProvider)
    ['{33591C10-0BED-4F02-B0AB-1530D5533EE9}']

    // Meta Data
    function GetID(out ppszCoMemIdentity: LPWSTR): HRESULT; stdcall;

    function GetProviderInstanceID(out ppszCoMemProviderInstanceIdentity: LPWSTR): HRESULT; stdcall;

    function OpenPropertyStore(dwStgAccess: DWORD;
                               out ppIPropertyStore: IPropertyStore): HRESULT; stdcall;

    // Meta Data
    function GetCategory(out ppszCoMemCategory: LPWSTR;
                         out ppszCoMemSubCategory: LPWSTR): HRESULT; stdcall;

  end;
  IID_IFunctionInstance = IFunctionInstance;


  // Interface IFunctionInstanceCollection
  // =====================================
  //
  IFunctionInstanceCollection = interface(IUnknown)
    ['{F0A3D895-855C-42A2-948D-2F97D450ECB1}']

    function GetCount(out pdwCount: DWORD): HRESULT; stdcall;

    function Get(pszInstanceIdentity: LPCWSTR;
                 out pdwIndex: DWORD;
                 out ppIFunctionInstance: IFunctionInstance): HRESULT; stdcall;

    function Item(dwIndex: DWORD;
                  out ppIFunctionInstance: IFunctionInstance): HRESULT; stdcall;

    function Add(const pIFunctionInstance: IFunctionInstance): HRESULT; stdcall;

    function Remove(dwIndex: DWORD;
                    out ppIFunctionInstance: IFunctionInstance): HRESULT; stdcall;

    function Delete(dwIndex: DWORD): HRESULT; stdcall;

    function DeleteAll(): HRESULT; stdcall;

  end;
  IID_IFunctionInstanceCollection = IFunctionInstanceCollection;


  // Interface IPropertyStoreCollection
  // ==================================
  //
  IPropertyStoreCollection = interface(IUnknown)
    ['{D14D9C30-12D2-42D8-BCE4-C60C2BB226FA}']

    function GetCount(out pdwCount: DWORD): HRESULT; stdcall;

    function Get(pszInstanceIdentity: LPCWSTR;
                 out pdwIndex: DWORD;
                 out ppIPropertyStore: IPropertyStore): HRESULT; stdcall;

    function Item(dwIndex: DWORD;
                  out ppIPropertyStore: IPropertyStore): HRESULT; stdcall;

    function Add(const pIPropertyStore: IPropertyStore): HRESULT; stdcall;

    function Remove(dwIndex: DWORD;
                    out pIPropertyStore: IPropertyStore): HRESULT; stdcall;

    function Delete(dwIndex: DWORD): HRESULT; stdcall;

    function DeleteAll(): HRESULT; stdcall;

  end;
  IID_IPropertyStoreCollection = IPropertyStoreCollection;


  //////////////////////////////////
  // Query interfaces
  //////////////////////////////////

  // Interface IFunctionInstanceQuery
  // ================================
  //
  IFunctionInstanceQuery = interface(IUnknown)
    ['{6242BC6B-90EC-4B37-BB46-E229FD84ED95}']

    function Execute(out ppIFunctionInstance: IFunctionInstance): HRESULT; stdcall;

  end;
  IID_IFunctionInstanceQuery = IFunctionInstanceQuery;


  // Interface IFunctionInstanceCollectionQuery
  // ==========================================
  //
  IFunctionInstanceCollectionQuery = interface(IUnknown)
    ['{57CC6FD2-C09A-4289-BB72-25F04142058E}']

    function AddQueryConstraint(pszConstraintName: LPCWSTR;
                                pszConstraintValue: LPCWSTR): HRESULT; stdcall;

    function AddPropertyConstraint(const Key: PROPERTYKEY;
                                   pv: PPropVariant;
                                   enumPropertyConstraint: PropertyConstraint): HRESULT; stdcall;

    function Execute(out ppIFunctionInstanceCollection: IFunctionInstanceCollection): HRESULT; stdcall;

  end;
  IID_IFunctionInstanceCollectionQuery = IFunctionInstanceCollectionQuery;

  // Additional prototypes for ALL interfaces

  // End of additional prototypes

implementation

  // Implement additional prototypes here.

end.
