//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MfPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.FunctionDiscoveryApi.FunctionDiscoveryCategories.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 05-05-2026
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: -
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
// Source: functiondiscoverycategories.h
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
unit WinApi.FunctionDiscoveryApi.FunctionDiscoveryCategories;

{$I MfPack.Fpc.inc}

interface


const

  // *****************************************************************************
  // Important:  Anything added here should also be added to FunctionDiscoveryManagedKeys.h
  // *****************************************************************************

  FD_SUBKEY                               = 'SOFTWARE\Microsoft\Function Discovery\';
  FD_SUBKEY_CATEGORIES                    = FD_SUBKEY + 'Categories\';

  // *****************************************************************************
  // Function Discovery Categories
  // *****************************************************************************
  // Important:  Anything added here should also be added to FunctionDiscoveryManagedKeys.h
  // *****************************************************************************

  // Provider Categories
  // Windows Vista
  FCTN_CATEGORY_PNP                       = 'Provider\Microsoft.Base.PnP';
  FCTN_CATEGORY_REGISTRY                  = 'Provider\Microsoft.Base.Registry';
  FCTN_CATEGORY_SSDP                      = 'Provider\Microsoft.Networking.SSDP';
  FCTN_CATEGORY_WSDISCOVERY               = 'Provider\Microsoft.Networking.WSD';
  FCTN_CATEGORY_NETBIOS                   = 'Provider\Microsoft.Networking.Netbios';
  FCTN_CATEGORY_WCN                       = 'Provider\Microsoft.Networking.WCN';
  FCTN_CATEGORY_PUBLICATION               = 'Provider\Microsoft.Base.Publication';
  FCTN_CATEGORY_PNPXASSOCIATION           = 'Provider\Microsoft.PnPX.Association';

  // Wireless Update Release
  FCTN_CATEGORY_BT                        = 'Provider\Microsoft.Devices.Bluetooth';
  FCTN_CATEGORY_WUSB                      = 'Provider\Microsoft.Devices.WirelessUSB';
  FCTN_CATEGORY_DEVICEDISPLAYOBJECTS      = 'Provider\Microsoft.Base.DeviceDisplayObjects';
  FCTN_CATEGORY_DEVQUERYOBJECTS           = 'Provider\Microsoft.Base.DevQueryObjects';

  // Layered Categories
  // Windows Vista
  FCTN_CATEGORY_NETWORKDEVICES            = 'Layered\Microsoft.Networking.Devices';
  FCTN_CATEGORY_DEVICES                   = 'Layered\Microsoft.Base.Devices';
  FCTN_CATEGORY_DEVICEFUNCTIONENUMERATORS = 'Layered\Microsoft.Devices.FunctionEnumerators';
  FCTN_CATEGORY_DEVICEPAIRING             = 'Layered\Microsoft.Base.DevicePairing';

  // *****************************************************************************
  // Function Discovery SubCategories
  // *****************************************************************************
  // Important:  Anything added here should also be added to FunctionDiscoveryManagedKeys.h
  // *****************************************************************************

  // Subcategories of Devices FCTN_CATEGORY_DEVICES
  FCTN_SUBCAT_DEVICES_WSDPRINTERS         = 'WSDPrinters';

  // Subcategories of Devices FCTN_CATEGORY_NETWORKDEVICES
  FCTN_SUBCAT_NETWORKDEVICES_SSDP         = 'SSDP';
  FCTN_SUBCAT_NETWORKDEVICES_WSD          = 'WSD';

  // Subcategories of Registry
  FCTN_SUBCAT_REG_PUBLICATION             = 'Publication';
  FCTN_SUBCAT_REG_DIRECTED                = 'Directed';

  // *****************************************************************************
  // Important:  Anything added here should also be added to FunctionDiscoveryManagedKeys.h
  // *****************************************************************************


  // Additional prototypes for ALL interfaces

  // End of additional prototypes

implementation

  // Implement additional prototypes here.

end.
