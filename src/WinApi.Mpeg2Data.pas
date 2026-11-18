// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MfPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.Mpeg2Data.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 15-09-2020
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: Main Mpeg2Data Library Definition, and interface definitions for
//              the MPEG-2 Section and Table acquisition functionality
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
// Source: Mpeg2Data.h
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
unit WinApi.Mpeg2Data;

{$I MfPack.Fpc.inc}

interface

uses
  Windows,
  Classes,
  SysUtils,
  WinApi.WinApiTypes,
  WinApi.MPeg2Structs;

  {$PACKENUM 4}

  {$ALIGN 1} // SDK #pragma pack(1) applies on Win32 and Win64.

  {$I 'WinApiTypes.inc'}

const
  CLSID_Mpeg2TableFilter : TGUID = '{752845F1-758F-4c83-A043-4270C593308E}';
  LIBID_Mpeg2DataLib     : TGUID = '{DBAF6C1B-B6A4-4898-AE65-204F0D9509A1}';
  CLSID_SectionList      : TGUID = '{73DA5D04-4347-45d3-A9DC-FAE9DDBE558D}';
  CLSID_Mpeg2Stream      : TGUID = '{F91D96C7-8509-4d0b-AB26-A0DD10904BB7}';
  CLSID_Mpeg2Data        : TGUID = '{C666E115-BB62-4027-A113-82D643FE2D99}';


// MPEG2 records retain the SDK one-byte packing on all Windows targets.

const

  MPEG_PAT_PID                        = $0000;
  MPEG_PAT_TID                        = $0;
  MPEG_CAT_PID                        = $0001;
  MPEG_CAT_TID                        = $01;
  MPEG_PMT_TID                        = $02;
  MPEG_TSDT_PID                       = $0002;
  MPEG_TSDT_TID                       = $03;
  ATSC_MGT_PID                        = $1FFB;
  ATSC_MGT_TID                        = $C7;
  ATSC_VCT_PID                        = $1FFB;
  ATSC_VCT_TERR_TID                   = $C8;
  ATSC_VCT_CABL_TID                   = $C9;
  ATSC_EIT_TID                        = $CB;
  ATSC_ETT_TID                        = $CC;
  ATSC_RRT_TID                        = $CA;
  ATSC_RRT_PID                        = $1FFB;
  ATSC_STT_PID                        = $1FFB;
  ATSC_STT_TID                        = $CD;
  ATSC_PIT_TID                        = $D0;
  DVB_NIT_PID                         = $0010;
  DVB_NIT_ACTUAL_TID                  = $40;
  DVB_NIT_OTHER_TID                   = $41;
  DVB_SDT_PID                         = $0011;
  DVB_SDT_ACTUAL_TID                  = $42;
  DVB_SDT_OTHER_TID                   = $46;
  DVB_BAT_PID                         = $0011;
  DVB_BAT_TID                         = $4A;
  DVB_EIT_PID                         = $0012;
  DVB_EIT_ACTUAL_TID                  = $4E;
  DVB_EIT_OTHER_TID                   = $4F;
  DVB_RST_PID                         = $0013;
  DVB_RST_TID                         = $71;
  DVB_TDT_PID                         = $0014;
  DVB_TDT_TID                         = $70;
  DVB_ST_PID_16                       = $0010;
  DVB_ST_PID_17                       = $0011;
  DVB_ST_PID_18                       = $0012;
  DVB_ST_PID_19                       = $0013;
  DVB_ST_PID_20                       = $0014;
  DVB_ST_TID                          = $72;
  ISDB_ST_TID                         = $72;
  DVB_TOT_PID                         = $0014;
  DVB_TOT_TID                         = $73;
  DVB_DIT_PID                         = $001E;
  DVB_DIT_TID                         = $7E;
  DVB_SIT_PID                         = $001F;
  DVB_SIT_TID                         = $7F;
  ISDB_EMM_TID                        = $85;
  ISDB_BIT_PID                        = $0024;
  ISDB_BIT_TID                        = $C4;
  ISDB_NBIT_PID                       = $0025;
  ISDB_NBIT_MSG_TID                   = $C5;
  ISDB_NBIT_REF_TID                   = $C6;
  ISDB_LDT_PID                        = $0025;
  ISDB_LDT_TID                        = $C7;
  ISDB_SDTT_PID                       = $0023;
  ISDB_SDTT_ALT_PID                   = $0028;
  ISDB_SDTT_TID                       = $C3;
  ISDB_CDT_PID                        = $0029;
  ISDB_CDT_TID                        = $C8;
  SCTE_EAS_TID                        = $D8;
  SCTE_EAS_IB_PID                     = $1FFB;
  SCTE_EAS_OOB_PID                    = $1FFC;


  // Forwarded interface declarations

type

  ISectionList      = interface;
  IMpeg2Stream      = interface;


  // Interface IMpeg2TableFilter
  // ===========================
  //
  IMpeg2TableFilter = interface(IUnknown)
  ['{BDCDD913-9ECD-4fb2-81AE-ADF747EA75A5}']
    function AddPID(p: PID): HResult; stdcall;

    function AddTable(p: PID;
                      t: TID): HResult; stdcall;

    function AddExtension(p: PID;
                          t: TID;
                          e: TEID): HResult; stdcall;

    function RemovePID(p: PID): HResult; stdcall;

    function RemoveTable(p: PID;
                         t: TID): HResult; stdcall;

    function RemoveExtension(p: PID;
                             t: TID;
                             e: TEID): HResult; stdcall;

  end;
  IID_IMpeg2TableFilter = IMpeg2TableFilter;


  PMpeg2TableSampleHdr = ^Mpeg2TableSampleHdr;
  Mpeg2TableSampleHdr = packed record
    SectionCount: Byte;
    Reserved: array[0..2] of Byte;
    SectionOffsets: array[0..0] of LONG;
  end;

  // Interface IMpeg2TableFilter
  // ===========================
  //
  IMpeg2Data = interface(IUnknown)
  ['{9B396D40-F380-4e3c-A514-1A82BF6EBFE6}']
    function GetSection(pid: PID;
                        tid: TID;
                        pFilter: PMPEG2_FILTER;
                        dwTimeout: DWORD;
                        out ppSectionList: ISectionList): HResult; stdcall;

    function GetTable(pid: PID;
                      tid: TID;
                      pFilter: PMPEG2_FILTER;
                      dwTimeout: DWORD;
                      out ppSectionList: ISectionList): HResult; stdcall;

    function GetStreamOfSections(pid: PID;
                                 tid: TID;
                                 pFilter: PMPEG2_FILTER;
                                 hDataReadyEvent: THANDLE;
                                 out ppMpegStream: IMpeg2Stream): HResult; stdcall;

  end;
  IID_IMpeg2Data = IMpeg2Data;


  // Interface ISectionList
  // ======================
  //
  ISectionList = interface(IUnknown)
  ['{AFEC1EB5-2A64-46c6-BF4B-AE3CCB6AFDB0}']
    function Initialize(requestType: MPEG_REQUEST_TYPE;
                        pMpeg2Data: IMpeg2Data;
                        pContext: PMPEG_CONTEXT;
                        pid: PID;
                        tid: TID;
                        pFilter: PMPEG2_FILTER;
                        timeout: DWORD;
                        hDoneEvent: THANDLE): HResult; stdcall;

    function InitializeWithRawSections(pmplSections: PMPEG_PACKET_LIST): HResult; stdcall;

    function CancelPendingRequest(): HResult; stdcall;

    function GetNumberOfSections(out pCount: word): HResult; stdcall;

    function GetSectionData(sectionNumber: word;
                            out pdwRawPacketLength: DWORD;
                            out ppSection: PSECTION): HResult; stdcall;

    function GetProgramIdentifier(pPid: PPID): HResult; stdcall;

    function GetTableIdentifier(pTableId: PTID): HResult; stdcall;

  end;
  IID_ISectionList = ISectionList;


  // Interface IMpeg2Stream
  // ======================
  //
  IMpeg2Stream = interface(IUnknown)
  ['{400CC286-32A0-4ce4-9041-39571125A635}']
    function Initialize(requestType: MPEG_REQUEST_TYPE;
                        pMpeg2Data: IMpeg2Data;
                        pContext: PMPEG_CONTEXT;
                        pid: PID;
                        tid: TID;
                        pFilter: PMPEG2_FILTER;
                        hDataReadyEvent: THandle): HResult; stdcall;

    function SupplyDataBuffer(pStreamBuffer: PMPEG_STREAM_BUFFER): HResult; stdcall;

  end;
  IID_IMpeg2Stream = IMpeg2Stream;

  // Additional Prototypes for ALL interfaces

  // End of Additional Prototypes

implementation

  // Implement Additional functions here.

end.
