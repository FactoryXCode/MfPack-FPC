// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.DevPropDef.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 09-10-2015
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: Defines property types and keys for the Plug and Play Device Property API.
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
// Source: devpropdef.h
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
unit WinApi.DevPropDef;

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


  //
  // Type definition for property data types.  Valid DEVPROPTYPE values are
  // constructed from base DEVPROP_TYPE_ values, which may be modified by a
  // logical OR with DEVPROP_TYPEMOD_ values, as appropriate.
  //

type

{$IFNDEF _DEVPROPTYPE_DEFINED}
  PDEVPROPTYPE = ^ULONG;
  DEVPROPTYPE = ULONG;
{$DEFINE _DEVPROPTYPE_DEFINED}
{$ENDIF}

  //
  // Property type modifiers.  Used to modify base DEVPROP_TYPE_ values, as
  // appropriate.  Not valid as standalone DEVPROPTYPE values.
  //

const

    DEVPROP_TYPEMOD_ARRAY               = $00001000;  // array of fixed-sized data elements
    DEVPROP_TYPEMOD_LIST                = $00002000;  // list of variable-sized data elements

  //
  // Property data types.
  //
    DEVPROP_TYPE_EMPTY                  = $00000000;  // nothing, no property data
    DEVPROP_TYPE_NULL                   = $00000001;  // null property data
    DEVPROP_TYPE_SBYTE                  = $00000002;  // 8-bit signed int (SBYTE)
    DEVPROP_TYPE_BYTE                   = $00000003;  // 8-bit unsigned int (BYTE)
    DEVPROP_TYPE_INT16                  = $00000004;  // 16-bit signed int (SHORT)
    DEVPROP_TYPE_UINT16                 = $00000005;  // 16-bit unsigned int (USHORT)
    DEVPROP_TYPE_INT32                  = $00000006;  // 32-bit signed int (LONG)
    DEVPROP_TYPE_UINT32                 = $00000007;  // 32-bit unsigned int (ULONG)
    DEVPROP_TYPE_INT64                  = $00000008;  // 64-bit signed int (LONG64)
    DEVPROP_TYPE_UINT64                 = $00000009;  // 64-bit unsigned int (ULONG64)
    DEVPROP_TYPE_FLOAT                  = $0000000A;  // 32-bit floating-point (FLOAT)
    DEVPROP_TYPE_DOUBLE                 = $0000000B;  // 64-bit floating-point (DOUBLE)
    DEVPROP_TYPE_DECIMAL                = $0000000C;  // 128-bit data (DECIMAL)
    DEVPROP_TYPE_GUID                   = $0000000D;  // 128-bit unique identifier (GUID)
    DEVPROP_TYPE_CURRENCY               = $0000000E;  // 64 bit signed int currency value (CURRENCY)
    DEVPROP_TYPE_DATE                   = $0000000F;  // date (DATE)
    DEVPROP_TYPE_FILETIME               = $00000010;  // file time (FILETIME)
    DEVPROP_TYPE_BOOLEAN                = $00000011;  // 8-bit boolean (DEVPROP_BOOLEAN)
    DEVPROP_TYPE_STRING                 = $00000012;  // null-terminated string
    DEVPROP_TYPE_STRING_LIST            = (DEVPROP_TYPE_STRING or DEVPROP_TYPEMOD_LIST);  // multi-sz string list
    DEVPROP_TYPE_SECURITY_DESCRIPTOR    = $00000013;  // self-relative binary SECURITY_DESCRIPTOR
    DEVPROP_TYPE_SECURITY_DESCRIPTOR_STRING= $00000014;  // security descriptor string (SDDL format)
    DEVPROP_TYPE_DEVPROPKEY             = $00000015;  // device property key (DEVPROPKEY)
    DEVPROP_TYPE_DEVPROPTYPE            = $00000016;  // device property type (DEVPROPTYPE)
    DEVPROP_TYPE_BINARY                 = (DEVPROP_TYPE_BYTE or DEVPROP_TYPEMOD_ARRAY);  // custom binary data
    DEVPROP_TYPE_ERROR                  = $00000017;  // 32-bit Win32 system error code
    DEVPROP_TYPE_NTSTATUS               = $00000018;  // 32-bit NTSTATUS code
    DEVPROP_TYPE_STRING_INDIRECT        = $00000019;  // string resource (@[path\]<dllname>,-<strId>)

  //
  // Max base DEVPROP_TYPE_ and DEVPROP_TYPEMOD_ values.
  //

    MAX_DEVPROP_TYPE                    = $00000019;  // max valid DEVPROP_TYPE_ value
    MAX_DEVPROP_TYPEMOD                 = $00002000;  // max valid DEVPROP_TYPEMOD_ value

  //
  // Bitmasks for extracting DEVPROP_TYPE_ and DEVPROP_TYPEMOD_ values.
  //

    DEVPROP_MASK_TYPE                   = $00000FFF;  // range for base DEVPROP_TYPE_ values
    DEVPROP_MASK_TYPEMOD                = $0000F000;  // mask for DEVPROP_TYPEMOD_ type modifiers


  //
  // Property type specific data types.
  //

  // 8-bit boolean type definition for DEVPROP_TYPE_BOOLEAN (True = -1, False = 0)
type

  PDevpropBoolean = ^DEVPROP_BOOLEAN;
  PDEVPROP_BOOLEAN = ^DEVPROP_BOOLEAN;
  DEVPROP_BOOLEAN = ShortInt;

const

  DEVPROP_TRUE = DEVPROP_BOOLEAN(-1);
  DEVPROP_FALSE = DEVPROP_BOOLEAN(0);



type

  //
  // DEVPROPKEY structure
  // In Windows Vista and later versions of Windows, the DEVPROPKEY structure
  // represents a device property key for a device property in the unified device property model.
  //
{$IFNDEF _DEVPROPKEY_DEFINED}

    PDEVPROPGUID = ^TGUID;
    DEVPROPGUID = TGUID;

    PDEVPROPID = ^ULONG;
    DEVPROPID = ULONG;

  PDEVPROPKEY = ^DEVPROPKEY;
  _DEVPROPKEY = record
    fmtid: DEVPROPGUID;
    pid: DEVPROPID;
  end;
  DEVPROPKEY = _DEVPROPKEY;
{$DEFINE _DEVPROPKEY_DEFINED}
{$ENDIF} // DEVPROPKEY_DEFINED


  // IsEqualDevPropKey
  // This function is moved to PropKeyDef.pas

  //
  // DEVPROPSTORE Enumeration
  //
  // This enumeration describes where a property is stored.
  //
  PDEVPROPSTORE = ^_DEVPROPSTORE;
  _DEVPROPSTORE = (
    DEVPROP_STORE_SYSTEM = 0,
    DEVPROP_STORE_USER   = 1
  );
  DEVPROPSTORE = _DEVPROPSTORE;


  //
  // DEVPROPCOMPKEY structure
  //
  // This structure represents a compound key for a property.
  //
  PDEVPROPCOMPKEY = ^DEVPROPCOMPKEY;
  _DEVPROPCOMPKEY = record
    Key: DEVPROPKEY;
    Store: DEVPROPSTORE;
    LocaleName: PWideChar;
  end;
  DEVPROPCOMPKEY = _DEVPROPCOMPKEY;


  //
  // DEVPROPERTY structure
  //
  PDEVPROPERTY = ^_DEVPROPERTY;
  _DEVPROPERTY = record
    CompKey: DEVPROPCOMPKEY;
    dvType: DEVPROPTYPE;
    BufferSize: ULONG;
    Buffer: PByte;
  end;
  DEVPROPERTY = _DEVPROPERTY;


  //
  // All valid DEVPROPKEY definitions must use a PROPID that is equal to or greater
  // than DEVPROPID_FIRST_USABLE.
  //

const

  DEVPROPID_FIRST_USABLE              = 2;


  // Additional Prototypes for ALL interfaces

  // End of Additional Prototypes

implementation

  // Implement Additional Prototypes here.


end.
