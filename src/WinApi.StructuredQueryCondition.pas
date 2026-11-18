// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.StructuredQueryCondition.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 06-10-2015
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: This header is used by Windows Search.
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
// Remarks: This is the newest WinApi.StructuredQueryCondition.pas
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
// Source: structuredquerycondition.h
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
unit WinApi.StructuredQueryCondition;

{$I MfPack.Fpc.inc}

{ CONDITION_OPERATION translated from Windows SDK 10.0.28000.0,
  um/structuredquerycondition.h. This dependency unit currently exposes only
  the enum required by WinApi.ActiveX.PropSys; it is not the complete API. }
  
interface

{$PACKENUM 4}

type
  CONDITION_OPERATION = (COP_IMPLICIT = 0,
                         COP_EQUAL = 1,
                         COP_NOTEQUAL = 2,
                         COP_LESSTHAN = 3,
                         COP_GREATERTHAN = 4,
                         COP_LESSTHANOREQUAL = 5,
                         COP_GREATERTHANOREQUAL = 6,
                         COP_VALUE_STARTSWITH = 7,
                         COP_VALUE_ENDSWITH = 8,
                         COP_VALUE_CONTAINS = 9,
                         COP_VALUE_NOTCONTAINS = 10,
                         COP_DOSWILDCARDS = 11,
                         COP_WORD_EQUAL = 12,
                         COP_WORD_STARTSWITH = 13,
                         COP_APPLICATION_SPECIFIC = 14);
    
    
  // End of Additional Prototypes

implementation

  // Implement Additional functions here.

end.