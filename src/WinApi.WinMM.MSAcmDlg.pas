// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.WinMM.MSAcmDlg.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 25-06-2021
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: Audio Compression Manager Common Dialogs Identifiers.
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
// Source: MSAcmDlg.h
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
unit WinApi.WinMM.MSAcmDlg;

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


const

  DLG_ACMFORMATCHOOSE_ID              = 70;
  IDD_ACMFORMATCHOOSE_BTN_HELP        = 9;
  IDD_ACMFORMATCHOOSE_CMB_CUSTOM      = 100;
  IDD_ACMFORMATCHOOSE_CMB_FORMATTAG   = 101;
  IDD_ACMFORMATCHOOSE_CMB_FORMAT      = 102;
  IDD_ACMFORMATCHOOSE_BTN_SETNAME     = 103;
  IDD_ACMFORMATCHOOSE_BTN_DELNAME     = 104;


  DLG_ACMFILTERCHOOSE_ID              = 71;
  IDD_ACMFILTERCHOOSE_BTN_HELP        = 9;
  IDD_ACMFILTERCHOOSE_CMB_CUSTOM      = 100;
  IDD_ACMFILTERCHOOSE_CMB_FILTERTAG   = 101;
  IDD_ACMFILTERCHOOSE_CMB_FILTER      = 102;
  IDD_ACMFILTERCHOOSE_BTN_SETNAME     = 103;
  IDD_ACMFILTERCHOOSE_BTN_DELNAME     = 104;


implementation

end.
