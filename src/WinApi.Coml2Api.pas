// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.Coml2Api.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 08-07-2012
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: Structured storage, property sets, and related APIs.
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
// Remarks: -
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
// Source: coml2api.h
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
unit WinApi.Coml2Api;

{$I MfPack.Fpc.inc}


interface

uses

  {WinApi}
  Windows,
  WinApi.WinApiTypes,
  {ActiveX}
  WinApi.ActiveX.ObjIdl,
  WinApi.ActiveX.ObjIdlbase,
  WinApi.ActiveX.PropIdl;

  {$PACKENUM 4}

  {$IFDEF WIN32}
    {$ALIGN 1}
  {$ELSE}
    {$ALIGN 8} // Win64
  {$ENDIF}


const
  //
  // Common typedefs for paramaters used in Storage API's, gleamed from storage.h
  // Also contains Storage error codes, which should be moved into the storage
  // idl files.
  //

  CWCSTORAGENAME                      = 32;

  //* Storage instantiation modes *//

  STGM_DIRECT                         = $00000000;
  STGM_TRANSACTED                     = $00010000;
  STGM_SIMPLE                         = $08000000;

  STGM_READ                           = $00000000;
  STGM_WRITE                          = $00000001;
  STGM_READWRITE                      = $00000002;

  STGM_SHARE_DENY_NONE                = $00000040;
  STGM_SHARE_DENY_READ                = $00000030;
  STGM_SHARE_DENY_WRITE               = $00000020;
  STGM_SHARE_EXCLUSIVE                = $00000010;

  STGM_PRIORITY                       = $00040000;
  STGM_DELETEONRELEASE                = $04000000;

//#if (WINVER >= 400)
  STGM_NOSCRATCH                      = $00100000;
//#endif /* WINVER */

  STGM_CREATE                         = $00001000;
  STGM_CONVERT                        = $00020000;
  STGM_FAILIFTHERE                    = $00000000;

  STGM_NOSNAPSHOT                     = $00200000;
//#if (_WIN32_WINNT >= 0x0500)
  STGM_DIRECT_SWMR                    = $00400000;
//#endif

type
  PSTGFMT = ^STGFMT;
  STGFMT = DWORD;
const
  STGFMT_STORAGE                      = STGFMT(0);
  STGFMT_NATIVE                       = STGFMT(1);
  STGFMT_FILE                         = STGFMT(3);
  STGFMT_ANY                          = STGFMT(4);
  STGFMT_DOCFILE                      = STGFMT(5);


  // This is a legacy define to allow old component to builds

  STGFMT_DOCUMENT                     = 0;

  // Structured storage APIs

  function StgCreateDocfile(pwcsName: POLESTR;
                            grfMode: DWORD;
                            reserved: DWORD;
                            out ppstgOpen: IStorage): HResult; stdcall;

  function StgCreateDocfileOnILockBytes(plkbyt: ILockBytes;
                                        grfMode: DWORD;
                                        reserved: DWORD;
                                        out ppstgOpen: IStorage): HResult; stdcall;


  function StgOpenStorage(pwcsName: POLESTR;
                          stgPriority: IStorage;
                          grfMode: DWORD;
                          snbExclude: SNB;
                          reserved: DWORD): HResult; stdcall;

  function StgOpenStorageOnILockBytes(plkbyt: ILockBytes;
                                      pstgPriority: IStorage;
                                      grfMode: DWORD;
                                      snbExclude: SNB;
                                      reserved: DWORD;
                                      out ppstgOpen: IStorage): HResult; stdcall;

  function StgIsStorageFile(pwcsName: POLESTR): HResult; stdcall;

  function StgIsStorageILockBytes(plkbyt: ILockBytes): HResult; stdcall;


const
  // STG initialization options for StgCreateStorageEx and StgOpenStorageEx

//#if _WIN32_WINNT == 0x500
  //STGOPTIONS_VERSION                  = 1;
//#elif _WIN32_WINNT > 0x500
  STGOPTIONS_VERSION                  = 2;
//#else
  //STGOPTIONS_VERSION                  = 0;

type
  PSTGOPTIONS = ^tagSTGOPTIONS;
  tagSTGOPTIONS = record
    usVersion: USHORT;               // Versions 1 and 2 supported
    reserved: USHORT;                // must be 0 for padding
    ulSectorSize: ULONG;             // docfile header sector size (512)
    pwcsTemplateFile: PWideChar;     // version 2 or above
  end;
  STGOPTIONS = tagSTGOPTIONS;


  function StgCreateStorageEx(const pwcsName: PWideChar;
                              grfMode: DWORD;
                              stgfmt: DWORD;
                              grfAttrs: DWORD;
                              pStgOptions: PSTGOPTIONS;
                              pSecurityDescriptor: SECURITY_DESCRIPTOR;
                              const riid: TGUID;
                              out ppObjectOpen: Pointer): HResult; stdcall;


  function StgOpenStorageEx(const pwcsName: PWideChar;
                            grfMode: DWORD;
                            stgfmt: DWORD;
                            grfAttrs: DWORD;
                            pStgOptions: PSTGOPTIONS;
                            pSecurityDescriptor: PSECURITY_DESCRIPTOR;
                            const riid: TGUID;
                            out ppObjectOpen: Pointer): HResult; stdcall;

  function StgCreatePropStg(pUnk: IUnknown;
                            const fmtid: TGUID;
                            const pclsid: TGUID;
                            grfFlags: DWORD;
                            dwReserved: DWORD;
                            out ppPropStg: IPropertyStorage): HResult; stdcall;

  function StgOpenPropStg(pUnk: IUnknown;
                          const fmtid: TGUID;
                          grfFlags: DWORD;
                          dwReserved: DWORD;
                          out ppPropStg: IPropertyStorage): HResult; stdcall;

  function StgCreatePropSetStg(pStorage: IStorage;
                               dwReserved: DWORD;
                               out ppPropSetStg: IPropertySetStorage): HResult; stdcall;

const

  CCH_MAX_PROPSTG_NAME                = 31;


  function FmtIdToPropStgName(const pfmtid: TGUID;
                              oszName: POLESTR): HResult; stdcall;

  function PropStgNameToFmtId(const oszName: POLESTR;
                              out pfmtid: FMTID): HResult; stdcall;


  // Helper functions
  function ReadClassStg(pstg: IStorage;
                        out pclsid: TGUID): HResult; stdcall;

  function WriteClassStg(pstg: IStorage;
                         const rclsid: TGUID): HResult; stdcall;

  function ReadClassStm(pstm: IStream;
                        out clsid: TGUID): HResult; stdcall;

  function WriteClassStm(pstm: IStream;
                         const pclsid: TGUID): HResult; stdcall;


  // Storage utility APIs

  function GetHGlobalFromILockBytes(plkbyt: ILockBytes;
                                    out _hGlobal: HGlobal): HResult; stdcall;

  function CreateILockBytesOnHGlobal(_hGlobal: HGlobal;
                                     fDeleteOnRelease: BOOL;
                                     out pplkbyt: ILockBytes): HResult; stdcall;


  // ConvertTo APIs

  function GetConvertStg(stg: IStorage): HResult; stdcall;


  // Additional Prototypes for ALL interfaces

  // End of Additional Prototypes

implementation

const
  Ole32Lib = 'Ole32.dll';


function StgCreateDocfile;             external Ole32Lib name 'StgCreateDocfile' ;
function StgCreateDocfileOnILockBytes; external Ole32Lib name 'StgCreateDocfileOnILockBytes' ;
function StgOpenStorage;               external Ole32Lib name 'StgOpenStorage' ;
function StgOpenStorageOnILockBytes;   external Ole32Lib name 'StgOpenStorageOnILockBytes' ;
function StgIsStorageFile;             external Ole32Lib name 'StgIsStorageFile' ;
function StgIsStorageILockBytes;       external Ole32Lib name 'StgIsStorageILockBytes' ;

function StgSetTimes(pszName: POLESTR;
                     ctime: PFILETIME;
                     atime: PFILETIME;
                     mtime: PFILETIME): HResult; external Ole32Lib name 'StgSetTimes' ;

function StgCreateStorageEx;           external Ole32Lib name 'StgCreateStorageEx' ;
function StgOpenStorageEx;             external Ole32Lib name 'StgCreatePropStg' ;
function StgCreatePropStg;             external Ole32Lib name 'StgCreatePropStg' ;
function StgOpenPropStg;               external Ole32Lib name 'StgOpenPropStg' ;
function StgCreatePropSetStg;          external Ole32Lib name 'StgCreatePropSetStg' ;
function FmtIdToPropStgName;           external Ole32Lib name 'FmtIdToPropStgName' ;
function PropStgNameToFmtId;           external Ole32Lib name 'PropStgNameToFmtId' ;
function ReadClassStg;                 external Ole32Lib name 'ReadClassStg' ;
function WriteClassStg;                external Ole32Lib name 'WriteClassStg' ;
function ReadClassStm;                 external Ole32Lib name 'ReadClassStm' ;
function WriteClassStm;                external Ole32Lib name 'WriteClassStm' ;
function GetHGlobalFromILockBytes;     external Ole32Lib name 'GetHGlobalFromILockBytes' ;
function CreateILockBytesOnHGlobal;    external Ole32Lib name 'CreateILockBytesOnHGlobal' ;
function GetConvertStg;                external Ole32Lib name 'GetConvertStg' ;


  // Implement Additional functions here.


end.
