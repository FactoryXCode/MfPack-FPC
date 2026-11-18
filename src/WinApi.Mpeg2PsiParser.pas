// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MfPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.Mpeg2PsiParser.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 16-09-2020
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: Interface definitions for the MPEG-2 PSI parsing functionality.
//
// Organisation: FactoryX
// Initiator(s): Tony (maXcomX), Peter (OzShips)
// Contributor(s): Tony Kalf (maXcomX), Peter Larson (ozships), (TopPlay)
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
// Source: Mpeg2PsiParser.h
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
unit WinApi.Mpeg2PsiParser;

{$I MfPack.Fpc.inc}

interface

uses
  
  {WinApi}
  WinApi.WinApiTypes,
  WinApi.Unknwn,
  {Mpeg2}
  WinApi.mpeg2structs,
  WinApi.mpeg2data;

  {$PACKENUM 4}

  {$IFDEF WIN32}
    {$ALIGN 1}
  {$ELSE}
    {$ALIGN 8} // Win64
  {$ENDIF}

  // Interfaces.

type

  // Interface IGenericDescriptor
  // =============================
  //
  PIGenericDescriptor = ^IGenericDescriptor;
  IGenericDescriptor = interface(IUnknown)
  ['{6A5918F8-A77A-4f61-AED0-5702BDCDA3E6}']
    function Initialize(pbDesc: PByte;
                        bCount: INT): HRESULT; stdcall;

    function GetTag(out pbVal: Byte): HRESULT; stdcall;

    function GetLength(out pbVal: Byte): HRESULT; stdcall;

    function GetBody(out ppbVal: PByte): HRESULT; stdcall;

  end;
  IID_IGenericDescriptor = IGenericDescriptor;


  // Interface IGenericDescriptor
  // =============================
  // mainly for PBDA with 16-bit descriptor length
  //
  {$PUSH}
  // The SDK intentionally hides inherited names while adding two new COM slots.
  {$WARN 3057 OFF}
  IGenericDescriptor2 = interface(IGenericDescriptor)
  ['{BF02FB7E-9792-4e10-A68D-033A2CC246A5}']

    function Initialize(pbDesc: PByte;
                        wCount: WORD): HRESULT; stdcall;

    function GetLength(out pwVal: WORD): HRESULT; stdcall;

  end;
  IID_IGenericDescriptor2 = IGenericDescriptor2;



  {$POP}

  PProgramElement = ^ProgramElement;
  ProgramElement = record
    wProgramNumber: WORD;
    wProgramMapPID: WORD;
  end;

  // Interface IPAT
  // ==============
  //
  PIPAT = ^IPAT;
  IPAT = interface(IUnknown)
  ['{6623B511-4B5F-43c3-9A01-E8FF84188060}']

    function Initialize(pSectionList: ISectionList;
                        pMPEGData: IMpeg2Data): HRESULT; stdcall;

    function GetTransportStreamId(out pwVal: WORD): HRESULT; stdcall;

    function GetVersionNumber(out pbVal: Byte): HRESULT; stdcall;

    function GetCountOfRecords(out pdwVal: DWORD): HRESULT; stdcall;

    function GetRecordProgramNumber(dwIndex: DWORD;
                                    out pwVal: WORD): HRESULT; stdcall;

    function GetRecordProgramMapPid(dwIndex: DWORD;
                                    out pwVal: WORD): HRESULT; stdcall;

    function FindRecordProgramMapPid(wProgramNumber: WORD;
                                     out pwVal: WORD): HRESULT; stdcall;

    function RegisterForNextTable(hNextTableAvailable: THandle): HRESULT; stdcall;

    function GetNextTable(out ppPAT: IPAT): HRESULT; stdcall;

    function RegisterForWhenCurrent(hNextTableIsCurrent: THandle): HRESULT; stdcall;

    function ConvertNextToCurrent(): HRESULT; stdcall;

  end;
  IID_IPAT = IPAT;


  // Interface ICAT
  // ==============
  //
  PICAT = ^ICAT;
  ICAT = interface(IUnknown)
  ['{7C6995FB-2A31-4bd7-953E-B1AD7FB7D31C}']

    function Initialize(pSectionList: ISectionList;
                        pMPEGData: IMpeg2Data): HRESULT; stdcall;

    function GetVersionNumber(out pbVal: Byte): HRESULT; stdcall;

    function GetCountOfTableDescriptors(out pdwVal: DWORD): HRESULT; stdcall;

    function GetTableDescriptorByIndex(dwIndex: DWORD;
                                       out ppDescriptor: IGenericDescriptor): HRESULT; stdcall;

    // pdwCookie is optional and may be nil.
    function GetTableDescriptorByTag(bTag: Byte;
                                     pdwCookie: PDWORD;
                                     out ppDescriptor: IGenericDescriptor): HRESULT; stdcall;

    function RegisterForNextTable(hNextTableAvailable: THandle): HRESULT; stdcall;

    function GetNextTable(dwTimeout: DWORD;
                          out ppCAT: ICAT): HRESULT; stdcall;

    function RegisterForWhenCurrent(hNextTableIsCurrent: THandle): HRESULT; stdcall;

    function ConvertNextToCurrent(): HRESULT; stdcall;

  end;
  IID_ICAT = ICAT;


  // Interface IPMT
  // ==============
  //
  PIPMT = ^IPMT;
  IPMT = interface(IUnknown)
  ['{01F3B398-9527-4736-94DB-5195878E97A8}']

    function Initialize(pSectionList: ISectionList;
                        pMPEGData: IMpeg2Data): HRESULT; stdcall;

    function GetProgramNumber(out pwVal: WORD): HRESULT; stdcall;

    function GetVersionNumber(out pbVal: Byte): HRESULT; stdcall;

    function GetPcrPid(out pPidVal: PID): HRESULT; stdcall;

    function GetCountOfTableDescriptors(out pdwVal: DWORD): HRESULT; stdcall;

    function GetTableDescriptorByIndex(dwIndex: DWORD;
                                       out ppDescriptor: IGenericDescriptor): HRESULT; stdcall;

    // pdwCookie is optional and may be nil.
    function GetTableDescriptorByTag(bTag: Byte;
                                     pdwCookie: PDWORD;
                                     out ppDescriptor: IGenericDescriptor): HRESULT; stdcall;

    function GetCountOfRecords(out pwVal: WORD): HRESULT; stdcall;

    function GetRecordStreamType(dwRecordIndex: DWORD;
                                 out pbVal: Byte): HRESULT; stdcall;

    function GetRecordElementaryPid(dwRecordIndex: DWORD;
                                    out pPidVal: PID): HRESULT; stdcall;

    function GetRecordCountOfDescriptors(dwRecordIndex: DWORD;
                                         out pdwVal: DWORD): HRESULT; stdcall;

    function GetRecordDescriptorByIndex(dwRecordIndex: DWORD;
                                        dwDescIndex: DWORD;
                                        out ppDescriptor: IGenericDescriptor): HRESULT; stdcall;

    // pdwCookie is optional and may be nil.
    function GetRecordDescriptorByTag(dwRecordIndex: DWORD;
                                      bTag: Byte;
                                      pdwCookie: PDWORD;
                                      out ppDescriptor: IGenericDescriptor): HRESULT; stdcall;

    function QueryServiceGatewayInfo(out ppDSMCCList: PDSMCC_ELEMENT;
                                     out puiCount: UINT): HRESULT; stdcall;

    function QueryMPEInfo(out ppMPEList: PMPE_ELEMENT;
                          out puiCount: UINT): HRESULT; stdcall;

    function RegisterForNextTable(hNextTableAvailable: THandle): HRESULT; stdcall;

    function GetNextTable(out ppPMT: IPMT): HRESULT; stdcall;

    function RegisterForWhenCurrent(hNextTableIsCurrent: THandle): HRESULT; stdcall;

    function ConvertNextToCurrent(): HRESULT; stdcall;

  end;
  IID_IPMT = IPMT;


  // Interface ITSDT
  // ===============
  //
  PITSDT = ^ITSDT;
  ITSDT = interface(IUnknown)
  ['{D19BDB43-405B-4a7c-A791-C89110C33165}']

    function Initialize(pSectionList: ISectionList;
                        pMPEGData: IMpeg2Data): HRESULT; stdcall;

    function GetVersionNumber(out pbVal: Byte): HRESULT; stdcall;

    function GetCountOfTableDescriptors(out pdwVal: DWORD): HRESULT; stdcall;

    function GetTableDescriptorByIndex(dwIndex: DWORD;
                                       out ppDescriptor: IGenericDescriptor): HRESULT; stdcall;

    // pdwCookie is optional and may be nil.
    function GetTableDescriptorByTag(bTag: Byte;
                                     pdwCookie: PDWORD;
                                     out ppDescriptor: IGenericDescriptor): HRESULT; stdcall;

    function RegisterForNextTable(hNextTableAvailable: THandle): HRESULT; stdcall;

    function GetNextTable(out ppTSDT: ITSDT): HRESULT; stdcall;

    function RegisterForWhenCurrent(hNextTableIsCurrent: THandle): HRESULT; stdcall;

    function ConvertNextToCurrent(): HRESULT; stdcall;

  end;
  IID_ITSDT = ITSDT;


  // Interface IPSITables
  // ====================
  //
  IPSITables = interface(IUnknown)
  ['{919F24C5-7B14-42ac-A4B0-2AE08DAF00AC}']

    // The parameters are basically the ones from the event EVENTID_PSITable
    // defined in bdamedia.h
    // dwPara1 - TSID, ONID|TSID for DVB EIT
    // dwPara2 - TID|PID
    // dwPara3 - dwHashedVersion
    // dwPara4 - program number for PMT, Segment#|SID for DVB EIT, but not used for others
    function GetTable(dwTSID: DWORD;
                      dwTID_PID: DWORD;
                      dwHashedVer: DWORD;
                      dwPara4: DWORD;
                      out ppIUnknown: IUnknown): HRESULT; stdcall;

  end;


  // Additional Prototypes for ALL interfaces

  // End of Additional Prototypes

implementation

  // Implement Additional functions here.

end.
