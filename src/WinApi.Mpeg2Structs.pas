// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MfPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.Mpeg2Structs.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 16-09-2020
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: Definitions for the common structures used in WinApi.Mpeg2Data.pas
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
// Source: mpeg2structs.h
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
unit WinApi.Mpeg2Structs;

{$I MfPack.Fpc.inc}

interface

uses

  {WinApi}
  WinApi.WinApiTypes,
  {MPeg2}
  WinApi.Mpeg2Bits;

  {$PACKENUM 4}

  {$ALIGN 1} // SDK #pragma pack(1) applies on Win32 and Win64.

  {$I 'WinApiTypes.inc'}


//
// Basic Type Aliases
//

type

  PPID = ^PID;
  PID = WORD;  // program id

  PTID = ^TID;
  TID = Byte;  // table id

  PTEID = ^TEID;
  TEID = WORD;  // table extension id

  PClientKey = ^ClientKey;
  ClientKey = UINT;

//
// MPEG-2 Current/Next bit field
//

type

  PMPEG_CURRENT_NEXT_BIT = ^MPEG_CURRENT_NEXT_BIT;
  MPEG_CURRENT_NEXT_BIT = (MPEG_SECTION_IS_NEXT = 0,
                           MPEG_SECTION_IS_CURRENT = 1
                          );

//
// MPEG-2 TID Extension structure
//

  PTID_EXTENSION = ^TID_EXTENSION;
  TID_EXTENSION = packed record
    wTidExt: WORD;
    wCount: WORD;
  end;


//
// MPEG-2 packet "small" header structure
//

type

  PSECTION = ^SECTION;
  SECTION = packed record
    TableId: TID;
    Header: record
    case integer of
      0: (S: MPEG_HEADER_BITS_MIDL);
      1: (W: WORD);
    end;
    SectionData: array[0..0] of Byte;  // Array size is Header.S.SectionLength
  end;


//
// MPEG-2 packet "long" header structure
//

type

  PLONG_SECTION = ^LONG_SECTION;
  LONG_SECTION  = packed record

    TableId: TID;
    header: record
    case integer of
      0: (S: MPEG_HEADER_BITS_MIDL);
      1: (W: WORD);
    end;

    TableIdExtension: TEID;
    Version: record
    case integer of
      0: (S: MPEG_HEADER_VERSION_BITS_MIDL);
      1: (B: Byte);
    end;

    SectionNumber: Byte;
    LastSectionNumber: Byte;
    RemainingData: array[0..0] of Byte;    // Array size is Header.S.SectionLength - 5
  end;


//
// DSM-CC packet header structure
//

type

  PDSMCC_SECTION = ^DSMCC_SECTION;
  DSMCC_SECTION = packed record
    TableId: TID;
    Header: record
    case integer of
      0:  (S: MPEG_HEADER_BITS_MIDL);
      1:  (W: WORD);
    end;

    TableIdExtension: TEID;
    Version: record
    case integer of
      0: (S: MPEG_HEADER_VERSION_BITS_MIDL);
      1: (B: Byte);
    end;

    SectionNumber: Byte;
    LastSectionNumber: Byte;
    ProtocolDiscriminator: Byte;
    DsmccType: Byte;
    MessageId: WORD;
    TransactionId: DWORD;
    Reserved: Byte;
    AdaptationLength: Byte;
    MessageLength: WORD;
    RemainingData: array[0..0] of Byte;
  end;


//
// MPEG-2 request/response packets structures
//

type

  PMPEG_RQST_PACKET = ^MPEG_RQST_PACKET;
  MPEG_RQST_PACKET = packed record
    dwLength: DWORD;
    pSection: PSECTION;
  end;
  PMPEG_PACKET_LIST = ^MPEG_PACKET_LIST;
  MPEG_PACKET_LIST = packed record
    wPacketCount: WORD;
    PacketList: array[0..0] of PMPEG_RQST_PACKET;  // pointer to array of MPEG_RQST_PACKET
  end;



//
// DSM-CC request filter options
//

type

  PDSMCC_FILTER_OPTIONS = ^DSMCC_FILTER_OPTIONS;
  DSMCC_FILTER_OPTIONS = packed record
    fSpecifyProtocol: BOOL;          // If True, Protocol should be set to desired value
    Protocol: Byte;
    fSpecifyType: BOOL;              // If True, Type should be set to desired value
    _Type: Byte;
    fSpecifyMessageId: BOOL;         // If True, MessageId should be set to desired value
    MessageId: WORD;
    fSpecifyTransactionId: BOOL;     // If True, TransactionId (or DownloadId for DDB msgs) should be set to desired value
    fUseTrxIdMessageIdMask: BOOL;    // If False, TransactionId is filtered as is.
                                     // If True, TransactionId is masked to look
                                     // for any version of message with associated
                                     // message identifier. See DVB - Data
                                     // Broadcasting Guidlines 4.6.5. (Assignment
                                     // and use of transactionId values).
    TransactionId: DWORD;
    fSpecifyModuleVersion: BOOL;     // If True, ModuleVersion should be set to the desired value
    ModuleVersion: Byte;
    fSpecifyBlockNumber: BOOL;       // If True, BlockNumber should be set to desired value
    BlockNumber: WORD;
    fGetModuleCall: BOOL;            // If True, NumberOfBlocksInModule should be set
    NumberOfBlocksInModule: WORD;
  end; // 45 BYTES


//
// ATSC request filter options
//

type

  PATSC_FILTER_OPTIONS = ^ATSC_FILTER_OPTIONS;
  ATSC_FILTER_OPTIONS = packed record
    fSpecifyEtmId: BOOL;            // If True, EtmId should be set to desired value
    EtmId: DWORD;
  end; // 8 BYTES


//
// DVB/ISDB EIT request filter options
//

type

  PDVB_EIT_FILTER_OPTIONS = ^DVB_EIT_FILTER_OPTIONS;
  DVB_EIT_FILTER_OPTIONS = packed record
    fSpecifySegment: BOOL;          // If True, bSegment should be set to desired value
    bSegment: Byte;
  end; // 5 BYTES


//
// MPEG-2 request filter structure
//

type

  PMPEG2_FILTER = ^MPEG2_FILTER;
  MPEG2_FILTER = packed record
    bVersionNumber: Byte;             // Must be set to 1 or more to match filter definition
    wFilterSize: WORD;                // Size of total filter structure. Version 1 filter is 73 bytes.
    fUseRawFilteringBits: BOOL;       // If True, Filter and Mask fields should be set to desired value, all other
                                      // fields with be ignored.
    Filter: array[0..15] of Byte;     // Bits with values to compare against for a match.
    Mask: array[0..15] of Byte;       // Bits set to 0 are bits that are compared to those in the filter, those
                                      // bits set to 1 are ignored.
    fSpecifyTableIdExtension: BOOL;   // If True, TableIdExtension should be set to desired value (False = don't care)
    TableIdExtension: WORD;
    fSpecifyVersion: BOOL;            // If True, Version should be set to desired value (False = don't care)
    Version: Byte;
    fSpecifySectionNumber: BOOL;      // If True, SectionNumber should be set to desired value (False = don't care)
    SectionNumber: Byte;
    fSpecifyCurrentNext: BOOL;        // If True, fNext should be set to desired value (False = don't care)
    fNext: BOOL;                      // If True, next table is queried. Else, current
    fSpecifyDsmccOptions: BOOL;       // If True, Dsmcc should be set with desired filter options
    Dsmcc: DSMCC_FILTER_OPTIONS;
    fSpecifyAtscOptions: BOOL;        // If True, Atsc should be set with desired filter options
    Atsc: ATSC_FILTER_OPTIONS;
  end; // 124 BYTES


  PMPEG2_FILTER2 = ^MPEG2_FILTER2;
  MPEG2_FILTER2 = packed record
    case integer of

      0: (  bVersionNumber: Byte;
            wFilterSize: WORD;
            fUseRawFilteringBits: BOOL;

            Filter: array [0..15] of Byte;
            Mask: array [0..15] of Byte;

            fSpecifyTableIdExtension: BOOL;
            TableIdExtension: WORD;
            fSpecifyVersion: BOOL;
            Version: Byte;
            fSpecifySectionNumber: BOOL;
            SectionNumber: Byte;
            fSpecifyCurrentNext: BOOL;
            fNext: BOOL;
            fSpecifyDsmccOptions: BOOL;
            Dsmcc: DSMCC_FILTER_OPTIONS;
            fSpecifyAtscOptions: BOOL;
            Atsc: ATSC_FILTER_OPTIONS;

            fSpecifyDvbEitOptions: BOOL;    // Set True for DVB/ISDB EIT. The table is handled segment basis.
                                            // If True, DvbEit should be set with desired filter options
            DvbEit: DVB_EIT_FILTER_OPTIONS
            // Version 2 - 133 bytes
            );
      1:  (  bVersion1Bytes: array [0..123] of Byte
            // Version 1 - 124 bytes
            );
  end;


const

  MPEG2_FILTER_VERSION_1_SIZE         = 124;
  MPEG2_FILTER_VERSION_2_SIZE         = 133;


//
// Mpeg-2 Stream buffer structure
//

type

  PMPEG_STREAM_BUFFER = ^MPEG_STREAM_BUFFER;
  MPEG_STREAM_BUFFER = packed record
    hr: HResult;
    dwDataBufferSize: DWORD;
    dwSizeOfDataRead: DWORD;
    pDataBuffer: PByte;  // Pointer to array of byte
  end;



//
// MPEG-2 Time and Date structures
//

type
  PMPEG_TIME = ^MPEG_TIME;
  MPEG_TIME = packed record
    Hours: Byte;                    // Legal Range: 0 to 23
    Minutes: Byte;                  // Legal Range: 0 to 59
    Seconds: Byte;                  // Legal Range: 0 to 59
  end;

  PMPEG_DURATION = ^MPEG_DURATION;
  MPEG_DURATION = MPEG_TIME;

  PMPEG_DATE = ^MPEG_DATE;
  MPEG_DATE = packed record
    Date: Byte;                     // Legal Range: 1 to 31
    Month: Byte;                    // Legal Range: 1 to 12
    Year: WORD;                     // Legal Range: 1900 to 2100
  end;

  PMPEG_DATE_AND_TIME = ^MPEG_DATE_AND_TIME;
  MPEG_DATE_AND_TIME = packed record
    D: MPEG_DATE;
    T: MPEG_TIME;
  end;


//
// MPEG-2 API Context structures
//

type

  PMPEG_CONTEXT_TYPE = ^MPEG_CONTEXT_TYPE;
  MPEG_CONTEXT_TYPE = (MPEG_CONTEXT_BCS_DEMUX = 0,
                       MPEG_CONTEXT_WINSOCK = 1
                      );

  PMPEG_BCS_DEMUX = ^MPEG_BCS_DEMUX;
  MPEG_BCS_DEMUX = packed record
    AVMGraphId: DWORD;
  end;

  PMPEG_WINSOCK = ^MPEG_WINSOCK;
  MPEG_WINSOCK = packed record
    AVMGraphId: DWORD;
  end;


  PMPEG_CONTEXT = ^MPEG_CONTEXT;
  MPEG_CONTEXT = packed record

    _Type: MPEG_CONTEXT_TYPE;
    U: record
    case integer of
      0: (Demux: MPEG_BCS_DEMUX);
      1: (Winsock: MPEG_WINSOCK);
    end;
  end;


//
// MPEG-2 Service Request and Responses
//

type
  PMPEG_REQUEST_TYPE = ^MPEG_REQUEST_TYPE;
  MPEG_REQUEST_TYPE   = DWord;
const
    MPEG_RQST_UNKNOWN               = MPEG_REQUEST_TYPE(0);
    MPEG_RQST_GET_SECTION           = MPEG_REQUEST_TYPE(1);
    MPEG_RQST_GET_SECTION_ASYNC     = MPEG_REQUEST_TYPE(2);
    MPEG_RQST_GET_TABLE             = MPEG_REQUEST_TYPE(3);
    MPEG_RQST_GET_TABLE_ASYNC       = MPEG_REQUEST_TYPE(4);
    MPEG_RQST_GET_SECTIONS_STREAM   = MPEG_REQUEST_TYPE(5);
    MPEG_RQST_GET_PES_STREAM        = MPEG_REQUEST_TYPE(6);
    MPEG_RQST_GET_TS_STREAM         = MPEG_REQUEST_TYPE(7);
    MPEG_RQST_START_MPE_STREAM      = MPEG_REQUEST_TYPE(8);

type

  PMPEG_SERVICE_REQUEST = ^MPEG_SERVICE_REQUEST;
  MPEG_SERVICE_REQUEST = packed record
    _Type: MPEG_REQUEST_TYPE;
    Context: MPEG_CONTEXT;
    Pid: PID;
    TableId: TID;
    Filter: MPEG2_FILTER;
    Flags: DWORD;
  end;

  PMPEG_SERVICE_RESPONSE = ^MPEG_SERVICE_RESPONSE;
  MPEG_SERVICE_RESPONSE = packed record
    IPAddress: DWORD;
    Port: WORD;
  end;


//
// DSM-CC & MPE Query Results
//

type

  PDSMCC_ELEMENT = ^_DSMCC_ELEMENT;
  P_DSMCC_ELEMENT = PDSMCC_ELEMENT;
  _DSMCC_ELEMENT = packed record
    pid: PID;
    bComponentTag: Byte;
    dwCarouselId: DWORD;
    dwTransactionId: DWORD;
    pNext: P_DSMCC_ELEMENT;
  end;
  DSMCC_ELEMENT = _DSMCC_ELEMENT;


  PMPE_ELEMENT = ^_MPE_ELEMENT;
  P_MPE_ELEMENT = PMPE_ELEMENT;
  _MPE_ELEMENT = packed record
    pid: PID;
    bComponentTag: Byte;
    pNext: P_MPE_ELEMENT;
  end;
  MPE_ELEMENT = _MPE_ELEMENT;


//
// MPEG-2 Stream Filtering Structure
//

type
  PMPEG_STREAM_FILTER = ^_MPEG_STREAM_FILTER;
  _MPEG_STREAM_FILTER = packed record
    wPidValue: WORD;                    // PID value
    dwFilterSize: DWORD;                // size of filter in bits
    fCrcEnabled: BOOL;                  // enable/disable CRC check
    rgchFilter: array[0..15] of Byte;   // filter data
    rgchMask: array[0..15] of Byte;    // filter mask
  end;
  MPEG_STREAM_FILTER = _MPEG_STREAM_FILTER;

//#undef BIG_ENDIAN_MACHINE
//#define LITTLE_ENDIAN_MACHINE

// Leave the macro's for what they are


  // Additional Prototypes for ALL interfaces

  // End of Additional Prototypes

implementation

  // Implement Additional functions here.

end.
