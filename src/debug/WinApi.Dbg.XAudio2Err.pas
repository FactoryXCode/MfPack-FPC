// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: WinApi - Shared
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.Dbg.XAudio2Err.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 15-04-2024
// Language: ENU
//
// Upstream revision: 4.0.0
// Description: Returns code definitions of the XAudio2 errors.
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
// Source: https://learn.microsoft.com/en-us/windows/win32/debug/error-handling-reference
//
// Copyright (c) Microsoft Corporation. All rights reserved.
//==============================================================================
//
// FPC port updated: 2026-11-13
// Lazarus version: 4.8
// FPC mode: DelphiUnicode; COM interfaces; UTF-8 source.
// COM headers: MfPack WinApi.ActiveX.* and WinApi.ComBaseApi.
// Validation: Windows x64 native SDK tables, helper behavior and LCL tooling validated.
//
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
unit WinApi.Dbg.XAudio2Err;

{$I MfPack.Fpc.inc}

interface

uses
  Windows,
  WinApi.WinError,
  WinApi.Dbg.WinHResultTools;


  function GetXAudio2ErrorDescription(const aHResult: HResult;
                                      out hrStr: string;
                                      out hrDescr: string;
                                      out RegionDescr: string;
                                      out HeaderFile: string;
                                      out Reference: TReferenceArray): HResult;

  function GetXAudio2ErrorRegion(aHResult: HResult;
                                 out aRegion: string): HResult;


implementation


uses
  SysUtils,
  StrUtils;

function GetXAudio2ErrorDescription(const aHResult: HResult;
                                    out hrStr: string;
                                    out hrDescr: string;
                                    out RegionDescr: string;
                                    out HeaderFile: string;
                                    out Reference: TReferenceArray): HResult;

begin
  Result := S_OK;

  HeaderFile := 'xaudio2.h';
  Reference[0] := 'https://learn.microsoft.com/en-us/windows/win32/xaudio2/xaudio2-error-codes';
  Reference[1] := 'https://learn.microsoft.com/en-us/windows/win32/debug/system-error-codes';


  case aHResult of
    LongInt($88960001)  : begin
                            HrStr := 'XAUDIO2_E_INVALID_CALL' ;
                            HrDescr := 'An API call or one of its arguments was illegal.';
                          end;

    LongInt($88960002)  : begin
                            HrStr := 'XAUDIO2_E_XMA_DECODER_ERROR' ;
                            HrDescr := 'The Xbox 360 XMA hardware suffered an unrecoverable error.';
                          end;

    LongInt($88960003)  : begin
                            HrStr := 'XAUDIO2_E_XAPO_CREATION_FAILED' ;
                            HrDescr := 'XAudio2 failed to initialize an XAPO effect.';
                          end;

    LongInt($88960004)  : begin
                            HrStr := 'XAUDIO2_E_DEVICE_INVALIDATED' ;
                            HrDescr := 'An audio device became unusable through being unplugged or some other event.';
                          end;
    else
      begin
        HrStr := 'Unknown identifier.';
        HrDescr := 'Unknown HResult code.';
        HeaderFile := 'Unknown.';
        Result := HResult($80070490);
        Exit;
      end;
  end;
end;


function GetXAudio2ErrorRegion(aHResult: HResult;
                               out aRegion: string): HResult;
const
  RegionXAudio2 = 'XAudio2 region.';

begin
  aRegion := RegionXAudio2;
  Result := S_OK;
end;

end.
