// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: WinApi.DirectX - DXGI
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.ActiveX.RoBuffer.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 03-11-2022
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: -
//
// Organisation: FactoryX
// Initiator(s): Tony (maXcomX), Peter (OzShips)
// Contributor(s): Tony Kalf (maXcomX).
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
// Source: robuffer.h
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
//
//==============================================================================
unit WinApi.ActiveX.RoBuffer;

{$I MfPack.Fpc.inc}


interface

uses
  WinApi.ActiveX.ObjIdl;


// Provides a standard IBuffer marshaler to implement the semantics
// associated with the IBuffer interface when it is marshaled.
function RoGetBufferMarshaler(out bufferMarshaler: IMarshal): HRESULT; stdcall;

type

  // Interface IBufferByteAccess
  // ============================
  // Represents a buffer as an array of bytes.
  //
  IBufferByteAccess = Interface(IUnknown)
    ['{905a0fef-bc53-11df-8c49-001e4fc686da}']

    // An IBuffer object is created by a client, and the buffer is provided by IBufferByteAccess.Buffer.
    function Buffer(out value: Pbyte): HRESULT; stdcall;

  end;

  IID_IBufferByteAccess = IBufferByteAccess;



  // Additional Prototypes for ALL interfaces

  // End of Additional Prototypes

implementation

const
  RoBufferLib = 'Wintypes.dll';



function RoGetBufferMarshaler; external RoBufferLib name 'RoGetBufferMarshaler';


// Implement Additional functions here.

end.
