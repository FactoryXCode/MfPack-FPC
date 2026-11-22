// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.DevpKey.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 23-11-2015
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: Defines property keys for the Plug and Play Device Property API.
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
// Source: devpkey.h
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
unit WinApi.DevpKey;

{$I MfPack.Fpc.inc}


interface

uses
  WinApi.WinApiTypes;


  {$PACKENUM 4}

  {$IFDEF WIN32}
    {$ALIGN 1}
  {$ELSE}
  {$ALIGN 8}
  // Win64
  {$ENDIF}


const

  // REMARKS: Do not translate those guids to fixed guids, because they are ment to be
  //          subject to changes!

  DEVPKEY_NAME: PROPERTYKEY = (fmtid: (D1: $b725f130;
    D2: $47ef;
    D3: $101a;
    D4: ($a5,
         $f1,
         $02,
         $60,
         $8c,
         $9e,
         $eb,
         $ac));
    pid: 10);      // DEVPROP_TYPE_STRING


  // Device properties
  // =================
  // These PKEYs correspond to the old Setup API SPDRP_XXX properties

  DEVPKEY_Device_DeviceDesc: PROPERTYKEY = (fmtid: (D1: $a45c254e;
    D2: $df1c;
    D3: $4efd;
    D4: ($80,
         $20,
         $67,
         $d1,
         $46,
         $a8,
         $50,
         $e0));
    pid: 2);       // DEVPROP_TYPE_STRING

  DEVPKEY_Device_HardwareIds: PROPERTYKEY = (fmtid: (D1: $a45c254e;
    D2: $df1c;
    D3: $4efd;
    D4: ($80,
         $20,
         $67,
         $d1,
         $46,
         $a8,
         $50,
         $e0));
    pid: 3);       // DEVPROP_TYPE_STRING_LIST

  DEVPKEY_Device_CompatibleIds: PROPERTYKEY = (fmtid: (D1: $a45c254e;
    D2: $df1c;
    D3: $4efd;
    D4: ($80,
         $20,
         $67,
         $d1,
         $46,
         $a8,
         $50,
         $e0));
    pid: 4);       // DEVPROP_TYPE_STRING_LIST

  DEVPKEY_Device_Service: PROPERTYKEY = (fmtid: (D1: $a45c254e;
    D2: $df1c;
    D3: $4efd;
    D4: ($80,
         $20,
         $67,
         $d1,
         $46,
         $a8,
         $50,
         $e0));
    pid: 6);       // DEVPROP_TYPE_STRING

  DEVPKEY_Device_Class: PROPERTYKEY = (fmtid: (D1: $a45c254e;
    D2: $df1c;
    D3: $4efd;
    D4: ($80,
         $20,
         $67,
         $d1,
         $46,
         $a8,
         $50,
         $e0));
    pid: 9);       // DEVPROP_TYPE_STRING

  DEVPKEY_Device_ClassGuid: PROPERTYKEY = (fmtid: (D1: $a45c254e;
    D2: $df1c;
    D3: $4efd;
    D4: ($80,
         $20,
         $67,
         $d1,
         $46,
         $a8,
         $50,
         $e0));
    pid: 10);      // DEVPROP_TYPE_GUID

  DEVPKEY_Device_Driver: PROPERTYKEY = (fmtid: (D1: $a45c254e;
    D2: $df1c;
    D3: $4efd;
    D4: ($80,
         $20,
         $67,
         $d1,
         $46,
         $a8,
         $50,
         $e0));
    pid: 11);      // DEVPROP_TYPE_STRING

  DEVPKEY_Device_ConfigFlags: PROPERTYKEY = (fmtid: (D1: $a45c254e;
    D2: $df1c;
    D3: $4efd;
    D4: ($80,
         $20,
         $67,
         $d1,
         $46,
         $a8,
         $50,
         $e0));
    pid: 12);      // DEVPROP_TYPE_UINT32

  DEVPKEY_Device_Manufacturer: PROPERTYKEY = (fmtid: (D1: $a45c254e;
    D2: $df1c;
    D3: $4efd;
    D4: ($80,
         $20,
         $67,
         $d1,
         $46,
         $a8,
         $50,
         $e0));
    pid: 13);      // DEVPROP_TYPE_STRING

  DEVPKEY_Device_FriendlyName: PROPERTYKEY = (fmtid: (D1: $a45c254e;
    D2: $df1c;
    D3: $4efd;
    D4: ($80,
         $20,
         $67,
         $d1,
         $46,
         $a8,
         $50,
         $e0));
    pid: 14);      // DEVPROP_TYPE_STRING

  DEVPKEY_Device_LocationInfo: PROPERTYKEY = (fmtid: (D1: $a45c254e;
    D2: $df1c;
    D3: $4efd;
    D4: ($80,
         $20,
         $67,
         $d1,
         $46,
         $a8,
         $50,
         $e0));
    pid: 15);      // DEVPROP_TYPE_STRING

  DEVPKEY_Device_PDOName: PROPERTYKEY = (fmtid: (D1: $a45c254e;
    D2: $df1c;
    D3: $4efd;
    D4: ($80,
         $20,
         $67,
         $d1,
         $46,
         $a8,
         $50,
         $e0));
    pid: 16);      // DEVPROP_TYPE_STRING

  DEVPKEY_Device_Capabilities: PROPERTYKEY = (fmtid: (D1: $a45c254e;
    D2: $df1c;
    D3: $4efd;
    D4: ($80,
         $20,
         $67,
         $d1,
         $46,
         $a8,
         $50,
         $e0));
    pid: 17);      // DEVPROP_TYPE_UNINT32

  DEVPKEY_Device_UINumber: PROPERTYKEY = (fmtid: (D1: $a45c254e;
    D2: $df1c;
    D3: $4efd;
    D4: ($80,
         $20,
         $67,
         $d1,
         $46,
         $a8,
         $50,
         $e0));
    pid: 18);      // DEVPROP_TYPE_STRING

  DEVPKEY_Device_UpperFilters: PROPERTYKEY = (fmtid: (D1: $a45c254e;
    D2: $df1c;
    D3: $4efd;
    D4: ($80,
         $20,
         $67,
         $d1,
         $46,
         $a8,
         $50,
         $e0));
    pid: 19);      // DEVPROP_TYPE_STRING_LIST

  DEVPKEY_Device_LowerFilters: PROPERTYKEY = (fmtid: (D1: $a45c254e;
    D2: $df1c;
    D3: $4efd;
    D4: ($80,
         $20,
         $67,
         $d1,
         $46,
         $a8,
         $50,
         $e0));
    pid: 20);      // DEVPROP_TYPE_STRING_LIST

  DEVPKEY_Device_BusTypeGuid: PROPERTYKEY = (fmtid: (D1: $a45c254e;
    D2: $df1c;
    D3: $4efd;
    D4: ($80,
         $20,
         $67,
         $d1,
         $46,
         $a8,
         $50,
         $e0));
    pid: 21);      // DEVPROP_TYPE_GUID

  DEVPKEY_Device_LegacyBusType: PROPERTYKEY = (fmtid: (D1: $a45c254e;
    D2: $df1c;
    D3: $4efd;
    D4: ($80,
         $20,
         $67,
         $d1,
         $46,
         $a8,
         $50,
         $e0));
    pid: 22);      // DEVPROP_TYPE_UINT32

  DEVPKEY_Device_BusNumber: PROPERTYKEY = (fmtid: (D1: $a45c254e;
    D2: $df1c;
    D3: $4efd;
    D4: ($80,
         $20,
         $67,
         $d1,
         $46,
         $a8,
         $50,
         $e0));
    pid: 23);      // DEVPROP_TYPE_UINT32

  DEVPKEY_Device_EnumeratorName: PROPERTYKEY = (fmtid: (D1: $a45c254e;
    D2: $df1c;
    D3: $4efd;
    D4: ($80,
         $20,
         $67,
         $d1,
         $46,
         $a8,
         $50,
         $e0));
    pid: 24);      // DEVPROP_TYPE_STRING

  DEVPKEY_Device_Security: PROPERTYKEY = (fmtid: (D1: $a45c254e;
    D2: $df1c;
    D3: $4efd;
    D4: ($80,
         $20,
         $67,
         $d1,
         $46,
         $a8,
         $50,
         $e0));
    pid: 25);      // DEVPROP_TYPE_SECURITY_DESCRIPTOR

  DEVPKEY_Device_SecuritySDS: PROPERTYKEY = (fmtid: (D1: $a45c254e;
    D2: $df1c;
    D3: $4efd;
    D4: ($80,
         $20,
         $67,
         $d1,
         $46,
         $a8,
         $50,
         $e0));
    pid: 26);      // DEVPROP_TYPE_SECURITY_DESCRIPTOR_STRING

  DEVPKEY_Device_DevType: PROPERTYKEY = (fmtid: (D1: $a45c254e;
    D2: $df1c;
    D3: $4efd;
    D4: ($80,
         $20,
         $67,
         $d1,
         $46,
         $a8,
         $50,
         $e0));
    pid: 27);      // DEVPROP_TYPE_UINT32

  DEVPKEY_Device_Exclusive: PROPERTYKEY = (fmtid: (D1: $a45c254e;
    D2: $df1c;
    D3: $4efd;
    D4: ($80,
         $20,
         $67,
         $d1,
         $46,
         $a8,
         $50,
         $e0));
    pid: 28);      // DEVPROP_TYPE_UINT32

  DEVPKEY_Device_Characteristics: PROPERTYKEY = (fmtid: (D1: $a45c254e;
    D2: $df1c;
    D3: $4efd;
    D4: ($80,
         $20,
         $67,
         $d1,
         $46,
         $a8,
         $50,
         $e0));
    pid: 29);      // DEVPROP_TYPE_UINT32

  DEVPKEY_Device_Address: PROPERTYKEY = (fmtid: (D1: $a45c254e;
    D2: $df1c;
    D3: $4efd;
    D4: ($80,
         $20,
         $67,
         $d1,
         $46,
         $a8,
         $50,
         $e0));
    pid: 30);      // DEVPROP_TYPE_UINT32

  DEVPKEY_Device_UINumberDescFormat: PROPERTYKEY = (fmtid: (D1: $a45c254e;
    D2: $df1c;
    D3: $4efd;
    D4: ($80,
         $20,
         $67,
         $d1,
         $46,
         $a8,
         $50,
         $e0));
    pid: 31);      // DEVPROP_TYPE_STRING

  DEVPKEY_Device_PowerData: PROPERTYKEY = (fmtid: (D1: $a45c254e;
    D2: $df1c;
    D3: $4efd;
    D4: ($80,
         $20,
         $67,
         $d1,
         $46,
         $a8,
         $50,
         $e0));
    pid: 32);      // DEVPROP_TYPE_BINARY

  DEVPKEY_Device_RemovalPolicy: PROPERTYKEY = (fmtid: (D1: $a45c254e;
    D2: $df1c;
    D3: $4efd;
    D4: ($80,
         $20,
         $67,
         $d1,
         $46,
         $a8,
         $50,
         $e0));
    pid: 33);      // DEVPROP_TYPE_UINT32

  DEVPKEY_Device_RemovalPolicyDefault: PROPERTYKEY = (fmtid: (D1: $a45c254e;
    D2: $df1c;
    D3: $4efd;
    D4: ($80,
         $20,
         $67,
         $d1,
         $46,
         $a8,
         $50,
         $e0));
    pid: 34);      // DEVPROP_TYPE_UINT32

  DEVPKEY_Device_RemovalPolicyOverride: PROPERTYKEY = (fmtid: (D1: $a45c254e;
    D2: $df1c;
    D3: $4efd;
    D4: ($80,
         $20,
         $67,
         $d1,
         $46,
         $a8,
         $50,
         $e0));
    pid: 35);      // DEVPROP_TYPE_UINT32

  DEVPKEY_Device_InstallState: PROPERTYKEY = (fmtid: (D1: $a45c254e;
    D2: $df1c;
    D3: $4efd;
    D4: ($80,
         $20,
         $67,
         $d1,
         $46,
         $a8,
         $50,
         $e0));
    pid: 36);      // DEVPROP_TYPE_UINT32

  DEVPKEY_Device_LocationPaths: PROPERTYKEY = (fmtid: (D1: $a45c254e;
    D2: $df1c;
    D3: $4efd;
    D4: ($80,
         $20,
         $67,
         $d1,
         $46,
         $a8,
         $50,
         $e0));
    pid: 37);      // DEVPROP_TYPE_STRING_LIST

  DEVPKEY_Device_BaseContainerId: PROPERTYKEY = (fmtid: (D1: $a45c254e;
    D2: $df1c;
    D3: $4efd;
    D4: ($80,
         $20,
         $67,
         $d1,
         $46,
         $a8,
         $50,
         $e0));
    pid: 38);      // DEVPROP_TYPE_GUID



  // Device and Device Interface property
  // ====================================
  // Common DEVPKEY used to retrieve the device instance id associated with devices and device interfaces.

  DEVPKEY_Device_InstanceId: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 256);   // DEVPROP_TYPE_STRING

  // Device properties
  // =================
  // These PKEYs correspond to a device's status and problem code

  DEVPKEY_Device_DevNodeStatus: PROPERTYKEY = (fmtid: (D1: $4340a6c5;
    D2: $93fa;
    D3: $4706;
    D4: ($97,
         $2c,
         $7b,
         $64,
         $80,
         $08,
         $a5,
         $a7));
    pid: 2);       // DEVPROP_TYPE_UINT32

  DEVPKEY_Device_ProblemCode: PROPERTYKEY = (fmtid: (D1: $4340a6c5;
    D2: $93fa;
    D3: $4706;
    D4: ($97,
         $2c,
         $7b,
         $64,
         $80,
         $08,
         $a5,
         $a7));
    pid: 3);       // DEVPROP_TYPE_UINT32


  // Device properties
  // =================
  // These PKEYs correspond to device relations

  DEVPKEY_Device_EjectionRelations: PROPERTYKEY = (fmtid: (D1: $4340a6c5;
    D2: $93fa;
    D3: $4706;
    D4: ($97,
         $2c,
         $7b,
         $64,
         $80,
         $08,
         $a5,
         $a7));
    pid: 4);       // DEVPROP_TYPE_STRING_LIST

  DEVPKEY_Device_RemovalRelations: PROPERTYKEY = (fmtid: (D1: $4340a6c5;
    D2: $93fa;
    D3: $4706;
    D4: ($97,
         $2c,
         $7b,
         $64,
         $80,
         $08,
         $a5,
         $a7));
    pid: 5);       // DEVPROP_TYPE_STRING_LIST

  DEVPKEY_Device_PowerRelations: PROPERTYKEY = (fmtid: (D1: $4340a6c5;
    D2: $93fa;
    D3: $4706;
    D4: ($97,
         $2c,
         $7b,
         $64,
         $80,
         $08,
         $a5,
         $a7));
    pid: 6);       // DEVPROP_TYPE_STRING_LIST

  DEVPKEY_Device_BusRelations: PROPERTYKEY = (fmtid: (D1: $4340a6c5;
    D2: $93fa;
    D3: $4706;
    D4: ($97,
         $2c,
         $7b,
         $64,
         $80,
         $08,
         $a5,
         $a7));
    pid: 7);       // DEVPROP_TYPE_STRING_LIST

  DEVPKEY_Device_Parent: PROPERTYKEY = (fmtid: (D1: $4340a6c5;
    D2: $93fa;
    D3: $4706;
    D4: ($97,
         $2c,
         $7b,
         $64,
         $80,
         $08,
         $a5,
         $a7));
    pid: 8);       // DEVPROP_TYPE_STRING

  DEVPKEY_Device_Children: PROPERTYKEY = (fmtid: (D1: $4340a6c5;
    D2: $93fa;
    D3: $4706;
    D4: ($97,
         $2c,
         $7b,
         $64,
         $80,
         $08,
         $a5,
         $a7));
    pid: 9);       // DEVPROP_TYPE_STRING_LIST

  DEVPKEY_Device_Siblings: PROPERTYKEY = (fmtid: (D1: $4340a6c5;
    D2: $93fa;
    D3: $4706;
    D4: ($97,
         $2c,
         $7b,
         $64,
         $80,
         $08,
         $a5,
         $a7));
    pid: 10);      // DEVPROP_TYPE_STRING_LIST

  DEVPKEY_Device_TransportRelations: PROPERTYKEY = (fmtid: (D1: $4340a6c5;
    D2: $93fa;
    D3: $4706;
    D4: ($97,
         $2c,
         $7b,
         $64,
         $80,
         $08,
         $a5,
         $a7));
    pid: 11);      // DEVPROP_TYPE_STRING_LIST

  // Device property
  // ===============
  // This DEVPKEY corresponds to a the status code that resulted in a device to be in a problem state.

  DEVPKEY_Device_ProblemStatus: PROPERTYKEY = (fmtid: (D1: $4340a6c5;
    D2: $93fa;
    D3: $4706;
    D4: ($97,
         $2c,
         $7b,
         $64,
         $80,
         $08,
         $a5,
         $a7));
    pid: 12);     // DEVPROP_TYPE_NTSTATUS


  // Device properties
  // =================
  // These DEVPKEYs are set for the corresponding types of root-enumerated devices.

  DEVPKEY_Device_Reported: PROPERTYKEY = (fmtid: (D1: $80497100;
    D2: $8c73;
    D3: $48b9;
    D4: ($aa,
         $d9,
         $ce,
         $38,
         $7e,
         $19,
         $c5,
         $6e));
    pid: 2);       // DEVPROP_TYPE_BOOLEAN

  DEVPKEY_Device_Legacy: PROPERTYKEY = (fmtid: (D1: $80497100;
    D2: $8c73;
    D3: $48b9;
    D4: ($aa,
         $d9,
         $ce,
         $38,
         $7e,
         $19,
         $c5,
         $6e));
    pid: 3);       // DEVPROP_TYPE_BOOLEAN


  // Device Container Id
  // ===================

  DEVPKEY_Device_ContainerId: PROPERTYKEY = (fmtid: (D1: $8c7ed206;
    D2: $3f8a;
    D3: $4827;
    D4: ($b3,
         $ab,
         $ae,
         $9e,
         $1f,
         $ae,
         $fc,
         $6c));
    pid: 2);       // DEVPROP_TYPE_GUID

  DEVPKEY_Device_InLocalMachineContainer: PROPERTYKEY = (fmtid: (D1: $8c7ed206;
    D2: $3f8a;
    D3: $4827;
    D4: ($b3,
         $ab,
         $ae,
         $9e,
         $1f,
         $ae,
         $fc,
         $6c));
    pid: 4);     // DEVPROP_TYPE_BOOLEAN


  // Device property
  // ===============
  // This DEVPKEY correspond to a device's model.

  DEVPKEY_Device_Model: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a; D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 39);    // DEVPROP_TYPE_STRING


  // Device Experience related Keys
  // ==============================

  DEVPKEY_Device_ModelId: PROPERTYKEY = (fmtid: (D1: $80d81ea6;
    D2: $7473;
    D3: $4b0c;
    D4: ($82,
         $16,
         $ef,
         $c1,
         $1a,
         $2c,
         $4c,
         $8b));
    pid: 2);       // DEVPROP_TYPE_GUID

  DEVPKEY_Device_FriendlyNameAttributes: PROPERTYKEY = (fmtid: (D1: $80d81ea6;
    D2: $7473;
    D3: $4b0c;
    D4: ($82,
         $16,
         $ef,
         $c1,
         $1a,
         $2c,
         $4c,
         $8b));
    pid: 3);       // DEVPROP_TYPE_UINT32

  DEVPKEY_Device_ManufacturerAttributes: PROPERTYKEY = (fmtid: (D1: $80d81ea6;
    D2: $7473;
    D3: $4b0c;
    D4: ($82,
         $16,
         $ef,
         $c1,
         $1a,
         $2c,
         $4c,
         $8b));
    pid: 4);       // DEVPROP_TYPE_UINT32

  DEVPKEY_Device_PresenceNotForDevice: PROPERTYKEY = (fmtid: (D1: $80d81ea6;
    D2: $7473;
    D3: $4b0c;
    D4: ($82,
         $16,
         $ef,
         $c1,
         $1a,
         $2c,
         $4c,
         $8b));
    pid: 5);       // DEVPROP_TYPE_BOOLEAN

  DEVPKEY_Device_SignalStrength: PROPERTYKEY = (fmtid: (D1: $80d81ea6;
    D2: $7473;
    D3: $4b0c;
    D4: ($82,
         $16,
         $ef,
         $c1,
         $1a,
         $2c,
         $4c,
         $8b));
    pid: 6);       // DEVPROP_TYPE_UINT32

  DEVPKEY_Device_IsAssociateableByUserAction: PROPERTYKEY = (fmtid: (D1: $80d81ea6;
    D2: $7473;
    D3: $4b0c;
    D4: ($82,
         $16,
         $ef,
         $c1,
         $1a,
         $2c,
         $4c,
         $8b));
    pid: 7);   // DEVPROP_TYPE_BOOLEAN

  DEVPKEY_Device_ShowInUninstallUI: PROPERTYKEY = (fmtid: (D1: $80d81ea6;
    D2: $7473;
    D3: $4b0c;
    D4: ($82,
         $16,
         $ef,
         $c1,
         $1a,
         $2c,
         $4c,
         $8b));
    pid: 8);     // DEVPROP_TYPE_BOOLEAN

  // Other Device properties
  // =======================

  DEVPKEY_Device_Numa_Proximity_Domain: PROPERTYKEY = (fmtid: (D1: $540b947e;
    D2: $8b40;
    D3: $45bc;
    D4: ($a8,
         $a2,
         $6a,
         $0b,
         $89,
         $4c,
         $bd,
         $a2));
    pid: 1);  // DEVPROP_TYPE_UINT32

  // Delphi Note: Have to hardcode the const to prevent "E2026 Constant expression expected"
  DEVPKEY_Numa_Proximity_Domain: PROPERTYKEY = (fmtid: (D1: $540b947e;
    D2: $8b40;
    D3: $45bc;
    D4: ($a8,
         $a2,
         $6a,
         $0b,
         $89,
         $4c,
         $bd,
         $a2));
    pid: 1);  // = DEVPKEY_Device_Numa_Proximity_Domain


  DEVPKEY_Device_DHP_Rebalance_Policy: PROPERTYKEY = (fmtid: (D1: $540b947e;
    D2: $8b40;
    D3: $45bc;
    D4: ($a8,
         $a2,
         $6a,
         $0b,
         $89,
         $4c,
         $bd,
         $a2));
    pid: 2);     // DEVPROP_TYPE_UINT32

  DEVPKEY_Device_Numa_Node: PROPERTYKEY = (fmtid: (D1: $540b947e;
    D2: $8b40;
    D3: $45bc;
    D4: ($a8,
         $a2,
         $6a,
         $0b,
         $89,
         $4c,
         $bd,
         $a2));
    pid: 3);     // DEVPROP_TYPE_UINT32

  DEVPKEY_Device_BusReportedDeviceDesc: PROPERTYKEY = (fmtid: (D1: $540b947e;
    D2: $8b40;
    D3: $45bc;
    D4: ($a8,
         $a2,
         $6a,
         $0b,
         $89,
         $4c,
         $bd,
         $a2));
    pid: 4);     // DEVPROP_TYPE_STRING

  DEVPKEY_Device_IsPresent: PROPERTYKEY = (fmtid: (D1: $540b947e;
    D2: $8b40;
    D3: $45bc;
    D4: ($a8,
         $a2,
         $6a,
         $0b,
         $89,
         $4c,
         $bd,
         $a2));
    pid: 5);     // DEVPROP_TYPE_BOOL

  DEVPKEY_Device_HasProblem: PROPERTYKEY = (fmtid: (D1: $540b947e;
    D2: $8b40;
    D3: $45bc;
    D4: ($a8,
         $a2,
         $6a,
         $0b,
         $89,
         $4c,
         $bd,
         $a2));
    pid: 6);     // DEVPROP_TYPE_BOOL

  DEVPKEY_Device_ConfigurationId: PROPERTYKEY = (fmtid: (D1: $540b947e;
    D2: $8b40;
    D3: $45bc;
    D4: ($a8,
         $a2,
         $6a,
         $0b,
         $89,
         $4c,
         $bd,
         $a2));
    pid: 7);     // DEVPROP_TYPE_STRING

  DEVPKEY_Device_ReportedDeviceIdsHash: PROPERTYKEY = (fmtid: (D1: $540b947e;
    D2: $8b40;
    D3: $45bc;
    D4: ($a8,
         $a2,
         $6a,
         $0b,
         $89,
         $4c,
         $bd,
         $a2));
    pid: 8);     // DEVPROP_TYPE_UINT32

  DEVPKEY_Device_PhysicalDeviceLocation: PROPERTYKEY = (fmtid: (D1: $540b947e;
    D2: $8b40;
    D3: $45bc;
    D4: ($a8,
         $a2,
         $6a,
         $0b,
         $89,
         $4c,
         $bd,
         $a2));
    pid: 9);     // DEVPROP_TYPE_BINARY

  DEVPKEY_Device_BiosDeviceName: PROPERTYKEY = (fmtid: (D1: $540b947e;
    D2: $8b40;
    D3: $45bc;
    D4: ($a8,
         $a2,
         $6a,
         $0b,
         $89,
         $4c,
         $bd,
         $a2));
    pid: 10);    // DEVPROP_TYPE_STRING

  DEVPKEY_Device_DriverProblemDesc: PROPERTYKEY = (fmtid: (D1: $540b947e;
    D2: $8b40;
    D3: $45bc;
    D4: ($a8,
         $a2,
         $6a,
         $0b,
         $89,
         $4c,
         $bd,
         $a2));
    pid: 11);    // DEVPROP_TYPE_STRING

  DEVPKEY_Device_DebuggerSafe: PROPERTYKEY = (fmtid: (D1: $540b947e;
    D2: $8b40;
    D3: $45bc;
    D4: ($a8,
         $a2,
         $6a,
         $0b,
         $89,
         $4c,
         $bd,
         $a2));
    pid: 12);    // DEVPROP_TYPE_UINT32

  DEVPKEY_Device_PostInstallInProgress: PROPERTYKEY = (fmtid: (D1: $540b947e;
    D2: $8b40;
    D3: $45bc;
    D4: ($a8,
         $a2,
         $6a,
         $0b,
         $89,
         $4c,
         $bd,
         $a2));
    pid: 13);    // DEVPROP_TYPE_BOOLEAN

  DEVPKEY_Device_Stack: PROPERTYKEY = (fmtid: (D1: $540b947e;
    D2: $8b40;
    D3: $45bc;
    D4: ($a8,
         $a2,
         $6a,
         $0b,
         $89,
         $4c,
         $bd,
         $a2));
    pid: 14);    // DEVPROP_TYPE_STRING_LIST

  DEVPKEY_Device_ExtendedConfigurationIds: PROPERTYKEY = (fmtid: (D1: $540b947e;
    D2: $8b40;
    D3: $45bc;
    D4: ($a8,
         $a2,
         $6a,
         $0b,
         $89,
         $4c,
         $bd,
         $a2));
    pid: 15); // DEVPROP_TYPE_STRING_LIST

  DEVPKEY_Device_IsRebootRequired: PROPERTYKEY = (fmtid: (D1: $540b947e;
    D2: $8b40;
    D3: $45bc;
    D4: ($a8,
         $a2,
         $6a,
         $0b,
         $89,
         $4c,
         $bd,
         $a2));
    pid: 16);    // DEVPROP_TYPE_BOOLEAN

  DEVPKEY_Device_FirmwareDate: PROPERTYKEY = (fmtid: (D1: $540b947e;
    D2: $8b40;
    D3: $45bc;
    D4: ($a8,
         $a2,
         $6a,
         $0b,
         $89,
         $4c,
         $bd,
         $a2));
    pid: 17);    // DEVPROP_TYPE_FILETIME

  DEVPKEY_Device_FirmwareVersion: PROPERTYKEY = (fmtid: (D1: $540b947e;
    D2: $8b40;
    D3: $45bc;
    D4: ($a8,
         $a2,
         $6a,
         $0b,
         $89,
         $4c,
         $bd,
         $a2));
    pid: 18);    // DEVPROP_TYPE_STRING

  DEVPKEY_Device_FirmwareRevision: PROPERTYKEY = (fmtid: (D1: $540b947e;
    D2: $8b40;
    D3: $45bc;
    D4: ($a8,
         $a2,
         $6a,
         $0b,
         $89,
         $4c,
         $bd,
         $a2));
    pid: 19);    // DEVPROP_TYPE_STRING

  DEVPKEY_Device_DependencyProviders: PROPERTYKEY = (fmtid: (D1: $540b947e;
    D2: $8b40;
    D3: $45bc;
    D4: ($a8,
         $a2,
         $6a,
         $0b,
         $89,
         $4c,
         $bd,
         $a2));
    pid: 20);    // DEVPROP_TYPE_STRING_LIST

  DEVPKEY_Device_DependencyDependents: PROPERTYKEY = (fmtid: (D1: $540b947e;
    D2: $8b40;
    D3: $45bc;
    D4: ($a8,
         $a2,
         $6a,
         $0b,
         $89,
         $4c,
         $bd,
         $a2));
    pid: 21);    // DEVPROP_TYPE_STRING_LIST

  DEVPKEY_Device_SoftRestartSupported: PROPERTYKEY = (fmtid: (D1: $540b947e;
    D2: $8b40;
    D3: $45bc;
    D4: ($a8,
         $a2,
         $6a,
         $0b,
         $89,
         $4c,
         $bd,
         $a2));
    pid: 22);    // DEVPROP_TYPE_BOOLEAN

  DEVPKEY_Device_ExtendedAddress: PROPERTYKEY = (fmtid: (D1: $540b947e;
    D2: $8b40;
    D3: $45bc;
    D4: ($a8,
         $a2,
         $6a,
         $0b,
         $89,
         $4c,
         $bd,
         $a2));
    Pid: 23);    // DEVPROP_TYPE_UINT64

  DEVPKEY_Device_AssignedToGuest: PROPERTYKEY = (fmtid: (D1: $540b947e;
    D2: $8b40;
    D3: $45bc;
    D4: ($a8,
         $a2,
         $6a,
         $0b,
         $89,
         $4c,
         $bd,
         $a2));
    Pid: 24);    // DEVPROP_TYPE_BOOLEAN

  DEVPKEY_Device_CreatorProcessId: PROPERTYKEY = (fmtid: (D1: $540b947e;
    D2: $8b40;
    D3: $45bc;
    D4: ($a8,
         $a2,
         $6a,
         $0b,
         $89,
         $4c,
         $bd,
         $a2));
    Pid: 25);    // DEVPROP_TYPE_UINT32

  DEVPKEY_Device_FirmwareVendor: PROPERTYKEY = (fmtid: (D1: $540b947e;
    D2: $8b40;
    D3: $45bc;
    D4: ($a8,
         $a2,
         $6a,
         $0b,
         $89,
         $4c,
         $bd,
         $a2));
    Pid: 26);    // DEVPROP_TYPE_STRING


  DEVPKEY_Device_SessionId: PROPERTYKEY = (fmtid: (D1: $83da6326;
    D2: $97a6;
    D3: $4088;
    D4: ($94,
         $53,
         $a1,
         $92,
         $3f,
         $57,
         $3b,
         $29));
    Pid: 6);     // DEVPROP_TYPE_UINT32




  // Device activity timestamp properties
  // ====================================
  DEVPKEY_Device_InstallDate: PROPERTYKEY = (fmtid: (D1: $83da6326;
    D2: $97a6;
    D3: $4088;
    D4: ($94,
         $53,
         $a1,
         $92,
         $3f,
         $57,
         $3b,
         $29));
    Pid: 100);   // DEVPROP_TYPE_FILETIME

  DEVPKEY_Device_FirstInstallDate: PROPERTYKEY = (fmtid: (D1: $83da6326;
    D2: $97a6;
    D3: $4088;
    D4: ($94,
         $53,
         $a1,
         $92,
         $3f,
         $57,
         $3b,
         $29));
    Pid: 101);   // DEVPROP_TYPE_FILETIME

  DEVPKEY_Device_LastArrivalDate: PROPERTYKEY = (fmtid: (D1: $83da6326;
    D2: $97a6;
    D3: $4088;
    D4: ($94,
         $53,
         $a1,
         $92,
         $3f,
         $57,
         $3b,
         $29));
    Pid: 102);   // DEVPROP_TYPE_FILETIME

  DEVPKEY_Device_LastRemovalDate: PROPERTYKEY = (fmtid: (D1: $83da6326;
    D2: $97a6;
    D3: $4088;
    D4: ($94,
         $53,
         $a1,
         $92,
         $3f,
         $57,
         $3b,
         $29));
    Pid: 103);   // DEVPROP_TYPE_FILETIME



  // Device driver properties
  // ========================

  DEVPKEY_Device_DriverDate: PROPERTYKEY = (fmtid: (D1: $a8b865dd;
    D2: $2e3d;
    D3: $4094;
    D4: ($ad,
         $97,
         $e5,
         $93,
         $a7,
         $c,
         $75,
         $d6));
    pid: 2);        // DEVPROP_TYPE_FILETIME

  DEVPKEY_Device_DriverVersion: PROPERTYKEY = (fmtid: (D1: $a8b865dd;
    D2: $2e3d;
    D3: $4094;
    D4: ($ad,
         $97,
         $e5,
         $93,
         $a7,
         $c,
         $75,
         $d6));
    pid: 3);        // DEVPROP_TYPE_STRING

  DEVPKEY_Device_DriverDesc: PROPERTYKEY = (fmtid: (D1: $a8b865dd;
    D2: $2e3d;
    D3: $4094;
    D4: ($ad,
         $97,
         $e5,
         $93,
         $a7,
         $c,
         $75,
         $d6));
    pid: 4);        // DEVPROP_TYPE_STRING

  DEVPKEY_Device_DriverInfPath: PROPERTYKEY = (fmtid: (D1: $a8b865dd;
    D2: $2e3d;
    D3: $4094;
    D4: ($ad,
         $97,
         $e5,
         $93,
         $a7,
         $c,
         $75,
         $d6));
    pid: 5);        // DEVPROP_TYPE_STRING

  DEVPKEY_Device_DriverInfSection: PROPERTYKEY = (fmtid: (D1: $a8b865dd;
    D2: $2e3d;
    D3: $4094;
    D4: ($ad,
         $97,
         $e5,
         $93,
         $a7,
         $c,
         $75,
         $d6));
    pid: 6);        // DEVPROP_TYPE_STRING

  DEVPKEY_Device_DriverInfSectionExt: PROPERTYKEY = (fmtid: (D1: $a8b865dd;
    D2: $2e3d;
    D3: $4094;
    D4: ($ad,
         $97,
         $e5,
         $93,
         $a7,
         $c,
         $75,
         $d6));
    pid: 7);        // DEVPROP_TYPE_STRING

  DEVPKEY_Device_MatchingDeviceId: PROPERTYKEY = (fmtid: (D1: $a8b865dd;
    D2: $2e3d;
    D3: $4094;
    D4: ($ad,
         $97,
         $e5,
         $93,
         $a7,
         $c,
         $75,
         $d6));
    pid: 8);        // DEVPROP_TYPE_STRING

  DEVPKEY_Device_DriverProvider: PROPERTYKEY = (fmtid: (D1: $a8b865dd;
    D2: $2e3d;
    D3: $4094;
    D4: ($ad,
         $97,
         $e5,
         $93,
         $a7,
         $c,
         $75,
         $d6));
    pid: 9);        // DEVPROP_TYPE_STRING

  DEVPKEY_Device_DriverPropPageProvider: PROPERTYKEY = (fmtid: (D1: $a8b865dd;
    D2: $2e3d;
    D3: $4094;
    D4: ($ad,
         $97,
         $e5,
         $93,
         $a7,
         $c,
         $75,
         $d6));
    pid: 10);       // DEVPROP_TYPE_STRING

  DEVPKEY_Device_DriverCoInstallers: PROPERTYKEY = (fmtid: (D1: $a8b865dd;
    D2: $2e3d;
    D3: $4094;
    D4: ($ad,
         $97,
         $e5,
         $93,
         $a7,
         $c,
         $75,
         $d6));
    pid: 11);       // DEVPROP_TYPE_STRING_LIST

  DEVPKEY_Device_ResourcePickerTags: PROPERTYKEY = (fmtid: (D1: $a8b865dd;
    D2: $2e3d;
    D3: $4094;
    D4: ($ad,
         $97,
         $e5,
         $93,
         $a7,
         $c,
         $75,
         $d6));
    pid: 12);       // DEVPROP_TYPE_STRING

  DEVPKEY_Device_ResourcePickerExceptions: PROPERTYKEY = (fmtid: (D1: $a8b865dd;
    D2: $2e3d;
    D3: $4094;
    D4: ($ad,
         $97,
         $e5,
         $93,
         $a7,
         $c,
         $75,
         $d6));
    pid: 13);     // DEVPROP_TYPE_STRING

  DEVPKEY_Device_DriverRank: PROPERTYKEY = (fmtid: (D1: $a8b865dd;
    D2: $2e3d;
    D3: $4094;
    D4: ($ad,
         $97,
         $e5,
         $93,
         $a7,
         $c,
         $75,
         $d6));
    pid: 14);       // DEVPROP_TYPE_UINT32

  DEVPKEY_Device_DriverLogoLevel: PROPERTYKEY = (fmtid: (D1: $a8b865dd;
    D2: $2e3d;
    D3: $4094;
    D4: ($ad,
         $97,
         $e5,
         $93,
         $a7,
         $c,
         $75,
         $d6));
    pid: 15);       // DEVPROP_TYPE_UINT32


  // Device properties
  // =================
  // These DEVPKEYs may be set by the driver package installed for a device.

  DEVPKEY_Device_NoConnectSound: PROPERTYKEY = (fmtid: (D1: $a8b865dd;
    D2: $2e3d;
    D3: $4094;
    D4: ($ad,
         $97,
         $e5,
         $93,
         $a7,
         $c,
         $75,
         $d6));
    pid: 17);       // DEVPROP_TYPE_BOOLEAN

  DEVPKEY_Device_GenericDriverInstalled: PROPERTYKEY = (fmtid: (D1: $a8b865dd;
    D2: $2e3d;
    D3: $4094;
    D4: ($ad,
         $97,
         $e5,
         $93,
         $a7,
         $c,
         $75,
         $d6));
    pid: 18);       // DEVPROP_TYPE_BOOLEAN

  DEVPKEY_Device_AdditionalSoftwareRequested: PROPERTYKEY = (fmtid: (D1: $a8b865dd;
    D2: $2e3d;
    D3: $4094;
    D4: ($ad,
         $97,
         $e5,
         $93,
         $a7,
         $c,
         $75,
         $d6));
    pid: 19);   // DEVPROP_TYPE_BOOLEAN


  // Device safe-removal properties
  // ==============================
  DEVPKEY_Device_SafeRemovalRequired: PROPERTYKEY = (fmtid: (D1: $afd97640;
    D2: $86a3;
    D3: $4210;
    D4: ($b6,
         $7c,
         $28,
         $9c,
         $41,
         $aa,
         $be,
         $55));
    pid: 2);   // DEVPROP_TYPE_BOOLEAN

  DEVPKEY_Device_SafeRemovalRequiredOverride: PROPERTYKEY = (fmtid: (D1: $afd97640;
    D2: $86a3;
    D3: $4210;
    D4: ($b6,
         $7c,
         $28,
         $9c,
         $41,
         $aa,
         $be,
         $55));
    pid: 3);   // DEVPROP_TYPE_BOOLEAN


  // Device properties
  // =================
  // These DEVPKEYs may be set by the driver package installed for a device.

  DEVPKEY_DrvPkg_Model: PROPERTYKEY = (fmtid: (D1: $cf73bb51;
    D2: $3abf;
    D3: $44a2;
    D4: ($85,
         $e0,
         $9a,
         $3d,
         $c7,
         $a1,
         $21,
         $32));
    pid: 2);       // DEVPROP_TYPE_STRING

  DEVPKEY_DrvPkg_VendorWebSite: PROPERTYKEY = (fmtid: (D1: $cf73bb51;
    D2: $3abf;
    D3: $44a2;
    D4: ($85,
         $e0,
         $9a,
         $3d,
         $c7,
         $a1,
         $21,
         $32));
    pid: 3);       // DEVPROP_TYPE_STRING

  DEVPKEY_DrvPkg_DetailedDescription: PROPERTYKEY = (fmtid: (D1: $cf73bb51;
    D2: $3abf;
    D3: $44a2;
    D4: ($85,
         $e0,
         $9a,
         $3d,
         $c7,
         $a1,
         $21,
         $32));
    pid: 4);       // DEVPROP_TYPE_STRING

  DEVPKEY_DrvPkg_DocumentationLink: PROPERTYKEY = (fmtid: (D1: $cf73bb51;
    D2: $3abf;
    D3: $44a2;
    D4: ($85,
         $e0,
         $9a,
         $3d,
         $c7,
         $a1,
         $21,
         $32));
    pid: 5);       // DEVPROP_TYPE_STRING

  DEVPKEY_DrvPkg_Icon: PROPERTYKEY = (fmtid: (D1: $cf73bb51;
    D2: $3abf;
    D3: $44a2;
    D4: ($85,
         $e0,
         $9a,
         $3d,
         $c7,
         $a1,
         $21,
         $32));
    pid: 6);       // DEVPROP_TYPE_STRING_LIST

  DEVPKEY_DrvPkg_BrandingIcon: PROPERTYKEY = (fmtid: (D1: $cf73bb51;
    D2: $3abf;
    D3: $44a2;
    D4: ($85,
         $e0,
         $9a,
         $3d,
         $c7,
         $a1,
         $21,
         $32));
    pid: 7);       // DEVPROP_TYPE_STRING_LIST


  // Device setup class properties
  // =============================
  // These PKEYs correspond to the old setupapi SPCRP_XXX properties

  DEVPKEY_DeviceClass_UpperFilters: PROPERTYKEY = (fmtid: (D1: $4321918b;
    D2: $f69e;
    D3: $470d;
    D4: ($a5,
         $de,
         $4d,
         $88,
         $c7,
         $5a,
         $d2,
         $4b));
    pid: 19);      // DEVPROP_TYPE_STRING_LIST

  DEVPKEY_DeviceClass_LowerFilters: PROPERTYKEY = (fmtid: (D1: $4321918b;
    D2: $f69e;
    D3: $470d;
    D4: ($a5,
         $de,
         $4d,
         $88,
         $c7,
         $5a,
         $d2,
         $4b));
    pid: 20);      // DEVPROP_TYPE_STRING_LIST

  DEVPKEY_DeviceClass_Security: PROPERTYKEY = (fmtid: (D1: $4321918b;
    D2: $f69e;
    D3: $470d;
    D4: ($a5,
         $de,
         $4d,
         $88,
         $c7,
         $5a,
         $d2,
         $4b));
    pid: 25);      // DEVPROP_TYPE_SECURITY_DESCRIPTOR

  DEVPKEY_DeviceClass_SecuritySDS: PROPERTYKEY = (fmtid: (D1: $4321918b;
    D2: $f69e;
    D3: $470d;
    D4: ($a5,
         $de,
         $4d,
         $88,
         $c7,
         $5a,
         $d2,
         $4b));
    pid: 26);      // DEVPROP_TYPE_SECURITY_DESCRIPTOR_STRING

  DEVPKEY_DeviceClass_DevType: PROPERTYKEY = (fmtid: (D1: $4321918b;
    D2: $f69e;
    D3: $470d;
    D4: ($a5,
         $de,
         $4d,
         $88,
         $c7,
         $5a,
         $d2,
         $4b));
    pid: 27);      // DEVPROP_TYPE_UINT32

  DEVPKEY_DeviceClass_Exclusive: PROPERTYKEY = (fmtid: (D1: $4321918b;
    D2: $f69e;
    D3: $470d;
    D4: ($a5,
         $de,
         $4d,
         $88,
         $c7,
         $5a,
         $d2,
         $4b));
    pid: 28);      // DEVPROP_TYPE_UINT32

  DEVPKEY_DeviceClass_Characteristics: PROPERTYKEY = (fmtid: (D1: $4321918b;
    D2: $f69e;
    D3: $470d;
    D4: ($a5,
         $de,
         $4d,
         $88,
         $c7,
         $5a,
         $d2,
         $4b));
    pid: 29);      // DEVPROP_TYPE_UINT32


  // Device setup class properties
  // =============================

  DEVPKEY_DeviceClass_Name: PROPERTYKEY = (fmtid: (D1: $259abffc;
    D2: $50a7;
    D3: $47ce;
    D4: ($af,
         $8,
         $68,
         $c9,
         $a7,
         $d7,
         $33,
         $66));
    pid: 2);    // DEVPROP_TYPE_STRING

  DEVPKEY_DeviceClass_ClassName: PROPERTYKEY = (fmtid: (D1: $259abffc;
    D2: $50a7;
    D3: $47ce;
    D4: ($af,
         $8,
         $68,
         $c9,
         $a7,
         $d7,
         $33,
         $66));
    pid: 3);    // DEVPROP_TYPE_STRING

  DEVPKEY_DeviceClass_Icon: PROPERTYKEY = (fmtid: (D1: $259abffc;
    D2: $50a7;
    D3: $47ce;
    D4: ($af,
         $8,
         $68,
         $c9,
         $a7,
         $d7,
         $33,
         $66));
    pid: 4);    // DEVPROP_TYPE_STRING

  DEVPKEY_DeviceClass_ClassInstaller: PROPERTYKEY = (fmtid: (D1: $259abffc;
    D2: $50a7;
    D3: $47ce;
    D4: ($af,
         $8,
         $68,
         $c9,
         $a7,
         $d7,
         $33,
         $66));
    pid: 5);    // DEVPROP_TYPE_STRING

  DEVPKEY_DeviceClass_PropPageProvider: PROPERTYKEY = (fmtid: (D1: $259abffc;
    D2: $50a7;
    D3: $47ce;
    D4: ($af,
         $8,
         $68,
         $c9,
         $a7,
         $d7,
         $33,
         $66));
    pid: 6);    // DEVPROP_TYPE_STRING

  DEVPKEY_DeviceClass_NoInstallClass: PROPERTYKEY = (fmtid: (D1: $259abffc;
    D2: $50a7;
    D3: $47ce;
    D4: ($af,
         $8,
         $68,
         $c9,
         $a7,
         $d7,
         $33,
         $66));
    pid: 7);    // DEVPROP_TYPE_BOOLEAN

  DEVPKEY_DeviceClass_NoDisplayClass: PROPERTYKEY = (fmtid: (D1: $259abffc;
    D2: $50a7;
    D3: $47ce;
    D4: ($af,
         $8,
         $68,
         $c9,
         $a7,
         $d7,
         $33,
         $66));
    pid: 8);    // DEVPROP_TYPE_BOOLEAN

  DEVPKEY_DeviceClass_SilentInstall: PROPERTYKEY = (fmtid: (D1: $259abffc;
    D2: $50a7;
    D3: $47ce;
    D4: ($af,
         $8,
         $68,
         $c9,
         $a7,
         $d7,
         $33,
         $66));
    pid: 9);    // DEVPROP_TYPE_BOOLEAN

  DEVPKEY_DeviceClass_NoUseClass: PROPERTYKEY = (fmtid: (D1: $259abffc;
    D2: $50a7;
    D3: $47ce;
    D4: ($af,
         $8,
         $68,
         $c9,
         $a7,
         $d7,
         $33,
         $66));
    pid: 10);   // DEVPROP_TYPE_BOOLEAN

  DEVPKEY_DeviceClass_DefaultService: PROPERTYKEY = (fmtid: (D1: $259abffc;
    D2: $50a7;
    D3: $47ce;
    D4: ($af,
         $8,
         $68,
         $c9,
         $a7,
         $d7,
         $33,
         $66));
    pid: 11);   // DEVPROP_TYPE_STRING

  DEVPKEY_DeviceClass_IconPath: PROPERTYKEY = (fmtid: (D1: $259abffc;
    D2: $50a7;
    D3: $47ce;
    D4: ($af,
         $8,
         $68,
         $c9,
         $a7,
         $d7,
         $33,
         $66));
    pid: 12);   // DEVPROP_TYPE_STRING_LIST

  // Other Device setup class properties
  // ===================================

  DEVPKEY_DeviceClass_DHPRebalanceOptOut: PROPERTYKEY = (fmtid: (D1: $d14d3ef3;
    D2: $66cf;
    D3: $4ba2;
    D4: ($9d,
         $38,
         $0d,
         $db,
         $37,
         $ab,
         $47,
         $01));
    pid: 2);   // DEVPROP_TYPE_BOOLEAN

  DEVPKEY_DeviceClass_ClassCoInstallers: PROPERTYKEY = (fmtid: (D1: $713d1703;
    D2: $a2e2;
    D3: $49f5;
    D4: ($92,
         $14,
         $56,
         $47,
         $2e,
         $f3,
         $da,
         $5c));
    pid: 2);   // DEVPROP_TYPE_STRING_LIST


  // Device interface properties
  // ===========================

  DEVPKEY_DeviceInterface_FriendlyName: PROPERTYKEY = (fmtid: (D1: $026e516e;
    D2: $b814; D3: $414b;
    D4: ($83,
         $cd,
         $85,
         $6d,
         $6f,
         $ef,
         $48,
         $22));
    pid: 2);   // DEVPROP_TYPE_STRING

  DEVPKEY_DeviceInterface_Enabled: PROPERTYKEY = (fmtid: (D1: $026e516e;
    D2: $b814;
    D3: $414b;
    D4: ($83,
         $cd,
         $85,
         $6d,
         $6f,
         $ef,
         $48,
         $22));
    pid: 3);   // DEVPROP_TYPE_BOOLEAN

  DEVPKEY_DeviceInterface_ClassGuid: PROPERTYKEY = (fmtid: (D1: $026e516e;
    D2: $b814;
    D3: $414b;
    D4: ($83,
         $cd,
         $85,
         $6d,
         $6f,
         $ef,
         $48,
         $22));
    pid: 4);   // DEVPROP_TYPE_GUID


  DEVPKEY_DeviceInterface_ReferenceString: PROPERTYKEY = (fmtid: (D1: $026e516e;
    D2: $b814;
    D3: $414b;
    D4: ($83,
         $cd,
         $85,
         $6d,
         $6f,
         $ef,
         $48,
         $22));
    pid: 5);   // DEVPROP_TYPE_STRING

  DEVPKEY_DeviceInterface_Restricted: PROPERTYKEY = (fmtid: (D1: $026e516e;
    D2: $b814;
    D3: $414b;
    D4: ($83,
         $cd,
         $85,
         $6d,
         $6f,
         $ef,
         $48,
         $22));
    pid: 6);   // DEVPROP_TYPE_BOOLEAN

  DEVPKEY_DeviceInterface_UnrestrictedAppCapabilities: PROPERTYKEY = (fmtid: (D1: $026e516e;
    D2: $b814;
    D3: $414b;
    D4: ($83,
         $cd,
         $85,
         $6d,
         $6f,
         $ef,
         $48,
         $22));
    Pid: 8); // DEVPROP_TYPE_STRING_LIST

  DEVPKEY_DeviceInterface_SchematicName: PROPERTYKEY = (fmtid: (D1: $026e516e;
    D2: $b814;
    D3: $414b;
    D4: ($83,
         $cd,
         $85,
         $6d,
         $6f,
         $ef,
         $48,
         $22));
    Pid: 9);   // DEVPROP_TYPE_STRING



  // Device interface class properties
  // =================================
  DEVPKEY_DeviceInterfaceClass_DefaultInterface: PROPERTYKEY = (fmtid: (D1: $14c83a99;
    D2: $0b3f;
    D3: $44b7;
    D4: ($be,
         $4c,
         $a1,
         $78,
         $d3,
         $99,
         $05,
         $64));
    pid: 2); // DEVPROP_TYPE_STRING

  DEVPKEY_DeviceInterfaceClass_Name: PROPERTYKEY = (fmtid: (D1: $14c83a99;
    D2: $0b3f;
    D3: $44b7;
    D4: ($be,
         $4c,
         $a1,
         $78,
         $d3,
         $99,
         $05,
         $64));
    pid: 3); // DEVPROP_TYPE_STRING


  // Device Container Properties
  // ===========================

  DEVPKEY_DeviceContainer_Address: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 51);    // DEVPROP_TYPE_STRING | DEVPROP_TYPE_STRING_LIST

  DEVPKEY_DeviceContainer_DiscoveryMethod: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 52);    // DEVPROP_TYPE_STRING_LIST

  DEVPKEY_DeviceContainer_IsEncrypted: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 53);    // DEVPROP_TYPE_BOOLEAN

  DEVPKEY_DeviceContainer_IsAuthenticated: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 54);    // DEVPROP_TYPE_BOOLEAN

  DEVPKEY_DeviceContainer_IsConnected: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 55);    // DEVPROP_TYPE_BOOLEAN

  DEVPKEY_DeviceContainer_IsPaired: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 56);    // DEVPROP_TYPE_BOOLEAN

  DEVPKEY_DeviceContainer_Icon: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 57);    // DEVPROP_TYPE_STRING

  DEVPKEY_DeviceContainer_Version: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 65);    // DEVPROP_TYPE_STRING

  DEVPKEY_DeviceContainer_Last_Seen: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 66);    // DEVPROP_TYPE_FILETIME

  DEVPKEY_DeviceContainer_Last_Connected: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 67);    // DEVPROP_TYPE_FILETIME

  DEVPKEY_DeviceContainer_IsShowInDisconnectedState: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 68);   // DEVPROP_TYPE_BOOLEAN

  DEVPKEY_DeviceContainer_IsLocalMachine: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 70);    // DEVPROP_TYPE_BOOLEAN

  DEVPKEY_DeviceContainer_MetadataPath: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 71);    // DEVPROP_TYPE_STRING

  DEVPKEY_DeviceContainer_IsMetadataSearchInProgress: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 72);    // DEVPROP_TYPE_BOOLEAN

  DEVPKEY_DeviceContainer_MetadataChecksum: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 73);          // DEVPROP_TYPE_BINARY

  DEVPKEY_DeviceContainer_IsNotInterestingForDisplay: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 74);          // DEVPROP_TYPE_BOOLEAN

  DEVPKEY_DeviceContainer_LaunchDeviceStageOnDeviceConnect: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 76);    // DEVPROP_TYPE_BOOLEAN

  DEVPKEY_DeviceContainer_LaunchDeviceStageFromExplorer: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 77);    // DEVPROP_TYPE_BOOLEAN

  DEVPKEY_DeviceContainer_BaselineExperienceId: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 78);    // DEVPROP_TYPE_GUID

  DEVPKEY_DeviceContainer_IsDeviceUniquelyIdentifiable: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 79);    // DEVPROP_TYPE_BOOLEAN

  DEVPKEY_DeviceContainer_AssociationArray: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 80);    // DEVPROP_TYPE_STRING_LIST

  DEVPKEY_DeviceContainer_DeviceDescription1: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 81);    // DEVPROP_TYPE_STRING

  DEVPKEY_DeviceContainer_DeviceDescription2: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 82);    // DEVPROP_TYPE_STRING

  DEVPKEY_DeviceContainer_HasProblem: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 83);    // DEVPROP_TYPE_BOOLEAN

  DEVPKEY_DeviceContainer_IsSharedDevice: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 84);    // DEVPROP_TYPE_BOOLEAN

  DEVPKEY_DeviceContainer_IsNetworkDevice: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 85);    // DEVPROP_TYPE_BOOLEAN

  DEVPKEY_DeviceContainer_IsDefaultDevice: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 86);   // DEVPROP_TYPE_BOOLEAN

  DEVPKEY_DeviceContainer_MetadataCabinet: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 87);

  DEVPKEY_DeviceContainer_RequiresPairingElevation: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 88);    // DEVPROP_TYPE_BOOLEAN

  DEVPKEY_DeviceContainer_ExperienceId: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 89);    // DEVPROP_TYPE_GUID

  DEVPKEY_DeviceContainer_Category: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 90);    // DEVPROP_TYPE_STRING_LIST

  DEVPKEY_DeviceContainer_Category_Desc_Singular: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 91);    // DEVPROP_TYPE_STRING_LIST

  DEVPKEY_DeviceContainer_Category_Desc_Plural: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 92);    // DEVPROP_TYPE_STRING_LIST

  DEVPKEY_DeviceContainer_Category_Icon: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 93);    // DEVPROP_TYPE_STRING

  DEVPKEY_DeviceContainer_CategoryGroup_Desc: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 94);    // DEVPROP_TYPE_STRING_LIST

  DEVPKEY_DeviceContainer_CategoryGroup_Icon: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 95);    // DEVPROP_TYPE_STRING

  DEVPKEY_DeviceContainer_PrimaryCategory: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 97);    // DEVPROP_TYPE_STRING

  DEVPKEY_DeviceContainer_UnpairUninstall: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 98);    // DEVPROP_TYPE_BOOLEAN

  DEVPKEY_DeviceContainer_RequiresUninstallElevation: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 99);  // DEVPROP_TYPE_BOOLEAN

  DEVPKEY_DeviceContainer_DeviceFunctionSubRank: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 100);   // DEVPROP_TYPE_UINT32

  DEVPKEY_DeviceContainer_AlwaysShowDeviceAsConnected: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 101);    // DEVPROP_TYPE_BOOLEAN

  DEVPKEY_DeviceContainer_ConfigFlags: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 105);   // DEVPROP_TYPE_UINT32

  DEVPKEY_DeviceContainer_PrivilegedPackageFamilyNames: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 106);   // DEVPROP_TYPE_STRING_LIST

  DEVPKEY_DeviceContainer_CustomPrivilegedPackageFamilyNames: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 107);   // DEVPROP_TYPE_STRING_LIST

  DEVPKEY_DeviceContainer_IsRebootRequired: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 108);   // DEVPROP_TYPE_BOOLEAN

  DEVPKEY_DeviceContainer_FriendlyName: PROPERTYKEY = (fmtid: (D1: $656A3BB3;
    D2: $ECC0;
    D3: $43FD;
    D4: ($84,
         $77,
         $4A,
         $E0,
         $40,
         $4A,
         $96,
         $CD));
    pid: 12288); // DEVPROP_TYPE_STRING

  DEVPKEY_DeviceContainer_Manufacturer: PROPERTYKEY = (fmtid: (D1: $656A3BB3;
    D2: $ECC0;
    D3: $43FD;
    D4: ($84,
         $77,
         $4A,
         $E0,
         $40,
         $4A,
         $96,
         $CD));
    pid: 8192);  // DEVPROP_TYPE_STRING

  DEVPKEY_DeviceContainer_ModelName: PROPERTYKEY = (fmtid: (D1: $656A3BB3;
    D2: $ECC0;
    D3: $43FD;
    D4: ($84,
         $77,
         $4A,
         $E0,
         $40,
         $4A,
         $96,
         $CD));
    pid: 8194);  // DEVPROP_TYPE_STRING (localizable)

  DEVPKEY_DeviceContainer_ModelNumber: PROPERTYKEY = (fmtid: (D1: $656A3BB3;
    D2: $ECC0;
    D3: $43FD;
    D4: ($84,
         $77,
         $4A,
         $E0,
         $40,
         $4A,
         $96,
         $CD));
    pid: 8195);  // DEVPROP_TYPE_STRING

  DEVPKEY_DeviceContainer_InstallInProgress: PROPERTYKEY = (fmtid: (D1: $83da6326;
    D2: $97a6;
    D3: $4088;
    D4: ($94,
         $53,
         $a1,
         $92,
         $3f,
         $57,
         $3b,
         $29));
    pid: 9);     // DEVPROP_TYPE_BOOLEAN




  // DeviceContainer properties that can be set on a devnode.
  // These used to be defined as DeviceDisplay
  // Delphi Note: Have to hardcode the const to prevent "E2026 Constant expression expected"

  DEVPKEY_DeviceDisplay_DiscoveryMethod: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 52);  // = DEVPKEY_DeviceContainer_DiscoveryMethod

  DEVPKEY_DeviceDisplay_IsShowInDisconnectedState: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 68);  // = DEVPKEY_DeviceContainer_IsShowInDisconnectedState

  DEVPKEY_DeviceDisplay_IsNotInterestingForDisplay: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 74);  // = DEVPKEY_DeviceContainer_IsNotInterestingForDisplay

  DEVPKEY_DeviceDisplay_IsNetworkDevice: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 85);  // = DEVPKEY_DeviceContainer_IsNetworkDevice

  DEVPKEY_DeviceDisplay_Category: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 90);  // = DEVPKEY_DeviceContainer_Category

  DEVPKEY_DeviceDisplay_UnpairUninstall: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 98);  // = DEVPKEY_DeviceContainer_UnpairUninstall

  DEVPKEY_DeviceDisplay_RequiresUninstallElevation: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 99);  // = DEVPKEY_DeviceContainer_RequiresUninstallElevation

  DEVPKEY_DeviceDisplay_AlwaysShowDeviceAsConnected: PROPERTYKEY = (fmtid: (D1: $78c34fc8;
    D2: $104a;
    D3: $4aca;
    D4: ($9e,
         $a4,
         $52,
         $4d,
         $52,
         $99,
         $6e,
         $57));
    pid: 101); // = DEVPKEY_DeviceContainer_AlwaysShowDeviceAsConnected


  // DevQuery properties
  // ===================

  DEVPKEY_DevQuery_ObjectType: PROPERTYKEY = (fmtid: (D1: $13673f42;
    D2: $a3d6;
    D3: $49f6;
    D4: ($b4,
         $da,
         $ae,
         $46,
         $e0,
         $c5,
         $23,
         $7c));
    pid: 2);   // DEVPROP_TYPE_UINT32


  // Additional Prototypes for ALL interfaces

  // End of Additional Prototypes

  // Additional key definitions from SDK 10.0.28000.0.
const
  DEVPKEY_Device_ContainerModelName: PROPERTYKEY = (fmtid: (D1: $7D0300E4; D2: $4FB7; D3: $493D; D4: ($8A,
                                                                                                      $95,
                                                                                                      $65,
                                                                                                      $6F,
                                                                                                      $00,
                                                                                                      $E6,
                                                                                                      $A2,
                                                                                                      $71)); pid: 2);
  DEVPKEY_Device_ContainerManufacturer: PROPERTYKEY = (fmtid: (D1: $7D0300E4; D2: $4FB7; D3: $493D; D4: ($8A,
                                                                                                         $95,
                                                                                                         $65,
                                                                                                         $6F,
                                                                                                         $00,
                                                                                                         $E6,
                                                                                                         $A2,
                                                                                                         $71)); pid: 3);
  DEVPKEY_Device_ContainerCategories: PROPERTYKEY = (fmtid: (D1: $7D0300E4; D2: $4FB7; D3: $493D; D4: ($8A,
                                                                                                       $95,
                                                                                                       $65,
                                                                                                       $6F,
                                                                                                       $00,
                                                                                                       $E6,
                                                                                                       $A2,
                                                                                                       $71)); pid: 4);
  DEVPKEY_Device_ContainerIcon: PROPERTYKEY = (fmtid: (D1: $7D0300E4; D2: $4FB7; D3: $493D; D4: ($8A,
                                                                                                 $95,
                                                                                                 $65,
                                                                                                 $6F,
                                                                                                 $00,
                                                                                                 $E6,
                                                                                                 $A2,
                                                                                                 $71)); pid: 5);
  DEVPKEY_Device_CompanionApps: PROPERTYKEY = (fmtid: (D1: $6A742654; D2: $D0B2; D3: $4420; D4: ($A5,
                                                                                                 $23,
                                                                                                 $E0,
                                                                                                 $68,
                                                                                                 $35,
                                                                                                 $2A,
                                                                                                 $C1,
                                                                                                 $DF)); pid: 2);
  DEVPKEY_Device_PrimaryCompanionApp: PROPERTYKEY = (fmtid: (D1: $6A742654; D2: $D0B2; D3: $4420; D4: ($A5,
                                                                                                       $23,
                                                                                                       $E0,
                                                                                                       $68,
                                                                                                       $35,
                                                                                                       $2A,
                                                                                                       $C1,
                                                                                                       $DF)); pid: 3);

implementation

// Implement Additional Prototypes here.

end.
