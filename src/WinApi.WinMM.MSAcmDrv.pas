// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.WinMM.MSAcmDrv.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 25-06-2021
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: Audio Compression Manager Public Header File for Drivers.
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
// Source: msacmdrv.h
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
unit WinApi.WinMM.MSAcmDrv;

{$I MfPack.Fpc.inc}

interface


uses
  {WinApi}
  Windows,
  {WinMM}
  WinApi.WinMM.MsAcm,
  WinApi.WinMM.MMiscApi,
  WinApi.WinMM.MMeApi,
  WinApi.WinMM.MMReg;

  {$PACKENUM 4}

  {$IFDEF WIN32}
    {$ALIGN 1}
  {$ELSE}
    {$ALIGN 8} // Win64
  {$ENDIF}


//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ;
//
//  ACM Driver Version:
//
//  the version is a 32 bit number that is broken into three parts as
//  follows:
//
//      bits 24 - 31:   8 bit _major_ version number
//      bits 16 - 23:   8 bit _minor_ version number
//      bits  0 - 15:   16 bit build number
//
//  this is then displayed as follows:
//
//      bMajor = (BYTE)(dwVersion >> 24)
//      bMinor = (BYTE)(dwVersion >> 16) &
//      wBuild = LOWORD(dwVersion)
//
//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ;

  function MAKE_ACM_VERSION(mjr: LONG;
                            mnr: LONG;
                            bld: LONG): LONG; inline;



//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ;
//
//  under WIN32 all drivers use unicode structures.  these have already
//  been #defined in MSACM.H.  however, regardless of whether UNICODE is
//  defined, we will define these structures as unicode structures for use
//  in 32-bit drivers.
//
//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ;

type

  ACMDRIVERDETAILS                    = tACMDRIVERDETAILSW;
  PACMDRIVERDETAILS                   = PACMDRIVERDETAILSW;
  LPACMDRIVERDETAILS                  = LPACMDRIVERDETAILSW;

  ACMFORMATTAGDETAILS                 = tACMFORMATTAGDETAILSW;
  PACMFORMATTAGDETAILS                = PACMFORMATTAGDETAILSW;
  LPACMFORMATTAGDETAILS               = LPACMFORMATTAGDETAILSW;

  ACMFORMATDETAILS                    = tACMFORMATDETAILSW;
  PACMFORMATDETAILS                   = PACMFORMATDETAILSW;
  LPACMFORMATDETAILS                  = LPACMFORMATDETAILSW;

  ACMFORMATCHOOSE                     = tACMFORMATCHOOSEW;
  PACMFORMATCHOOSE                    = PACMFORMATCHOOSEW;
  LPACMFORMATCHOOSE                   = LPACMFORMATCHOOSEW;

  ACMFILTERTAGDETAILS                 = tACMFILTERTAGDETAILSW;
  PACMFILTERTAGDETAILS                = PACMFILTERTAGDETAILSW;
  LPACMFILTERTAGDETAILS               = LPACMFILTERTAGDETAILSW;

  ACMFILTERDETAILS                    = tACMFILTERDETAILSW;
  PACMFILTERDETAILS                   = PACMFILTERDETAILSW;
  LPACMFILTERDETAILS                  = LPACMFILTERDETAILSW;

  ACMFILTERCHOOSE                     = tACMFILTERCHOOSEW;
  PACMFILTERCHOOSE                    = PACMFILTERCHOOSEW;
  LPACMFILTERCHOOSE                   = LPACMFILTERCHOOSEW;


  //
  //
  //
  //
  //
  {$DEFINE ACMDRVOPENDESC_SECTIONNAME_CHARS}

type

  PACMDRVOPENDESCA = ^tACMDRVOPENDESCA;
  tACMDRVOPENDESCA = packed record
    cbStruct: DWORD;                 // sizeof(ACMDRVOPENDESC)
    fccType: FOURCC;                 // 'audc'
    fccComp: FOURCC;                 // sub-type (not used--must be 0)
    dwVersion: DWORD;                // current version of ACM opening you
    dwFlags: DWORD;                  //
    dwError: DWORD;                  // result from DRV_OPEN request
    pszSectionName: PAnsiChar;       // see DRVCONFIGINFO.lpszDCISectionName
    pszAliasName: PAnsiChar;         // see DRVCONFIGINFO.lpszDCIAliasName
    dnDevNode: DWORD;                // devnode id for pnp drivers.
  end;
  ACMDRVOPENDESCA = tACMDRVOPENDESCA;
  LPACMDRVOPENDESCA = ^tACMDRVOPENDESCA;

  PACMDRVOPENDESCW = ^tACMDRVOPENDESCW;
  tACMDRVOPENDESCW = packed record
    cbStruct: DWORD;                 // sizeof(ACMDRVOPENDESC)
    fccType: FOURCC;                 // 'audc'
    fccComp: FOURCC;                 // sub-type (not used--must be 0)
    dwVersion: DWORD;                // current version of ACM opening you
    dwFlags: DWORD;                  //
    dwError: DWORD;                  // result from DRV_OPEN request
    pszSectionName: PWideChar;       // see DRVCONFIGINFO.lpszDCISectionName
    pszAliasName: PWideChar;         // see DRVCONFIGINFO.lpszDCIAliasName
    dnDevNode: DWORD;               // devnode id for pnp drivers.
  end;
  ACMDRVOPENDESCW = tACMDRVOPENDESCW;
  LPACMDRVOPENDESCW = ^tACMDRVOPENDESCW;

  ACMDRVOPENDESC                      = ACMDRVOPENDESCW;
  PACMDRVOPENDESC                     = PACMDRVOPENDESCW;
  LPACMDRVOPENDESC                    = LPACMDRVOPENDESCW;


  //
  //
  //
  //
  //
  PACMDRVSTREAMINSTANCE = ^tACMDRVSTREAMINSTANCE;
  tACMDRVSTREAMINSTANCE = packed record
    cbStruct: DWORD;
    pwfxSrc: LPWAVEFORMATEX;
    pwfxDst: LPWAVEFORMATEX;
    pwfltr: LPWAVEFILTER;
    dwCallback: DWORD_PTR;
    dwInstance: DWORD_PTR;
    fdwOpen: DWORD;
    fdwDriver: DWORD;
    dwDriver: DWORD_PTR;
    has: HACMSTREAM;
  end;
  ACMDRVSTREAMINSTANCE = tACMDRVSTREAMINSTANCE;
  LPACMDRVSTREAMINSTANCE = ^tACMDRVSTREAMINSTANCE;


  //
  //  NOTE! this structure must match the ACMSTREAMHEADER in msacm.h but
  //  defines more information for the driver writing convenience
  //
  LPACMDRVSTREAMHEADER = ^tACMDRVSTREAMHEADER;

  PACMDRVSTREAMHEADER = ^tACMDRVSTREAMHEADER;

  tACMDRVSTREAMHEADER = packed record
    cbStruct: DWORD;
    fdwStatus: DWORD;
    dwUser: DWORD_PTR;
    pbSrc: PByte;
    cbSrcLength: DWORD;
    cbSrcLengthUsed: DWORD;
    dwSrcUser: DWORD_PTR;
    pbDst: PByte;
    cbDstLength: DWORD;
    cbDstLengthUsed: DWORD;
    dwDstUser: DWORD_PTR;
    fdwConvert: DWORD;                 // flags passed from convert func
    padshNext: LPACMDRVSTREAMHEADER;   // for async driver queueing
    fdwDriver: DWORD;                  // driver instance flags
    dwDriver: DWORD_PTR;               // driver instance data
                                       //
                                       //  all remaining fields are used by the ACM for bookkeeping purposes.
                                       //  an ACM driver should never use these fields (though than can be
                                       //  helpful for debugging)--note that the meaning of these fields
                                       //  may change, so do NOT rely on them in shipping code.
                                       //
    fdwPrepared: DWORD;
    dwPrepared: DWORD_PTR;
    pbPreparedSrc: PByte;
    cbPreparedSrcLength: DWORD;
    pbPreparedDst: PByte;
    cbPreparedDstLength: DWORD;
  end;
  ACMDRVSTREAMHEADER = tACMDRVSTREAMHEADER;


  //
  //  structure for ACMDM_STREAM_SIZE message
  //
  //
  PACMDRVSTREAMSIZE = ^tACMDRVSTREAMSIZE;
  tACMDRVSTREAMSIZE = packed record
    cbStruct: DWORD;
    fdwSize: DWORD;
    cbSrcLength: DWORD;
    cbDstLength: DWORD;
  end;
  ACMDRVSTREAMSIZE = tACMDRVSTREAMSIZE;
  LPACMDRVSTREAMSIZE = ^tACMDRVSTREAMSIZE;



  //
  //  structure containing the information for the ACMDM_FORMAT_SUGGEST message
  //
  //
  PACMDRVFORMATSUGGEST = ^tACMDRVFORMATSUGGEST;
  tACMDRVFORMATSUGGEST = packed record
    cbStruct: DWORD;                 // sizeof(ACMDRVFORMATSUGGEST)
    fdwSuggest: DWORD;               // Suggest flags
    pwfxSrc: LPWAVEFORMATEX;         // Source Format
    cbwfxSrc: DWORD;                 // Source Size
    pwfxDst: LPWAVEFORMATEX;         // Dest format
    cbwfxDst: DWORD;                // Dest Size
  end;
  ACMDRVFORMATSUGGEST = tACMDRVFORMATSUGGEST;
  LPACMDRVFORMATSUGGEST = ^tACMDRVFORMATSUGGEST;

  //- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ;
  //
  //  ACM Driver Messages
  //
  //
  //
  //- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ;

const

  ACMDM_DRIVER_NOTIFY                 = (ACMDM_BASE + 1);
  ACMDM_DRIVER_DETAILS                = (ACMDM_BASE + 10);

  ACMDM_HARDWARE_WAVE_CAPS_INPUT      = (ACMDM_BASE + 20);
  ACMDM_HARDWARE_WAVE_CAPS_OUTPUT     = (ACMDM_BASE + 21);

  ACMDM_FORMATTAG_DETAILS             = (ACMDM_BASE + 25);
  ACMDM_FORMAT_DETAILS                = (ACMDM_BASE + 26);
  ACMDM_FORMAT_SUGGEST                = (ACMDM_BASE + 27);

  ACMDM_FILTERTAG_DETAILS             = (ACMDM_BASE + 50);
  ACMDM_FILTER_DETAILS                = (ACMDM_BASE + 51);

  ACMDM_STREAM_OPEN                   = (ACMDM_BASE + 76);
  ACMDM_STREAM_CLOSE                  = (ACMDM_BASE + 77);
  ACMDM_STREAM_SIZE                   = (ACMDM_BASE + 78);
  ACMDM_STREAM_CONVERT                = (ACMDM_BASE + 79);
  ACMDM_STREAM_RESET                  = (ACMDM_BASE + 80);
  ACMDM_STREAM_PREPARE                = (ACMDM_BASE + 81);
  ACMDM_STREAM_UNPREPARE              = (ACMDM_BASE + 82);
  ACMDM_STREAM_UPDATE                 = (ACMDM_BASE + 83);


implementation


function MAKE_ACM_VERSION(mjr: LONG;
                          mnr: LONG;
                          bld: LONG): LONG; inline;
begin
  Result := LONG((DWORD(mjr) shl 24) or
                 (DWORD(mnr) shl 16) or
                 DWORD(bld));
end;

end.
