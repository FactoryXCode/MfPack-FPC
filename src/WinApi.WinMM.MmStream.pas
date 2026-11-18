// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.WinMM.MmStream.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 11-07-2012
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: See: Remarks
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
//          The interfaces in this header are deprecated. New applications should not use them.
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
// Source: mmstream.h
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
unit WinApi.WinMM.MMStream;

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


	function MS_ERROR_CODE(x: Cardinal): Cardinal;

	function MS_SUCCESS_CODE(x: Cardinal): Cardinal;


const

	MS_S_PENDING                = $00040001;
	MS_S_NOUPDATE               = $00040002;
	MS_S_ENDOFSTREAM            = $00040003;
	MS_E_SAMPLEALLOC            = $80040401;
	MS_E_PURPOSEID              = $80040402;
  MS_E_NOSTREAM               = $80040403;
  MS_E_NOSEEKING              = $80040404;
  MS_E_INCOMPATIBLE           = $80040405;
  MS_E_BUSY                   = $80040406;
  MS_E_NOTINIT                = $80040407;
  MS_E_SOURCEALREADYDEFINED   = $80040408;
  MS_E_INVALIDSTREAMTYPE      = $80040409;
  MS_E_NOTRUNNING             = $8004040A;


	MSPID_PrimaryVideo                   : TGuid = '{A35FF56A-9FDA-11d0-8FDF-00C04FD9189D}';
  MSPID_PrimaryAudio                   : TGuid = '{A35FF56B-9FDA-11d0-8FDF-00C04FD9189D}';

type

	PAPCFUNC = procedure(dwParam: DWORD_PTR); stdcall;

	PStreamTime = ^STREAM_TIME;
  STREAM_TIME = LONGLONG;

  PMspid = ^MSPID;
  MSPID = TGUID;

  PRefmspid = ^REFMSPID;
	REFMSPID = TGUID;


  PStreamType = ^cwSTREAM_TYPE;
  cwSTREAM_TYPE = (
    STREAMTYPE_READ      = 0,
    STREAMTYPE_WRITE     = 1,
    STREAMTYPE_TRANSFORM = 2
  );
  STREAM_TYPE = cwSTREAM_TYPE;


  PStreamState = ^cwSTREAMSTATE_STOP;
  cwSTREAMSTATE_STOP = (
    STREAMSTATE_STOP = 0,
    STREAMSTATE_RUN  = 1
  );
  STREAM_STATE = cwSTREAMSTATE_STOP;

type
  PCompletionStatusFlags = ^cwCOMPLETION_STATUS_FLAGS;
  cwCOMPLETION_STATUS_FLAGS = Dword;
  COMPLETION_STATUS_FLAGS = cwCOMPLETION_STATUS_FLAGS;
const
    COMPSTAT_NOUPDATEOK = COMPLETION_STATUS_FLAGS($1);
    COMPSTAT_WAIT       = COMPLETION_STATUS_FLAGS($2);
    COMPSTAT_ABORT      = COMPLETION_STATUS_FLAGS($4);

type
  PMMSSF = ^cwMMSSF;
  cwMMSSF = (
    MMSSF_HASCLOCK	    = $1,
	  MMSSF_SUPPORTSEEK	  = $2,
	  MMSSF_ASYNCHRONOUS	= $4
  );
  MMSSF = cwMMSSF;

  PSSUPDATE = ^cwSSUPDATE;
  cwSSUPDATE = (
    SSUPDATE_ASYNC	    = $1,
	  SSUPDATE_CONTINUOUS	= $2
  );
  SSUPDATE = cwSSUPDATE;


type

	// Forward Interface Declarations

	PIMultiMediaStream = ^IMultiMediaStream;
	IMultiMediaStream = interface;

	PIMediaStream = ^IMediaStream;
	IMediaStream = interface;

	PIStreamSample = ^IStreamSample;
	IStreamSample = interface;


  // INTERFACES ////////////////////////////////////////////////////////////////


  // Interface IMultiMediaStream
  // ===========================
  // This interface is deprecated. New applications should not use it.
  //
  IMultiMediaStream = interface(IUnknown)
  ['{B502D1BC-9A57-11d0-8FDE-00C04FD9189D}']
    function GetInformation(out pdwFlags: DWORD;
                            out pStreamType: STREAM_TYPE): HResult; stdcall;

		function GetMediaStream(const idPurpose: REFMSPID;
                            out pMediaStream: IMediaStream): HResult; stdcall;

		function EnumMediaStreams(Index: Longint;
                              out ppMediaStream: IMediaStream): HResult; stdcall;

		function GetState(out pCurrentState: STREAM_STATE ): HResult; stdcall;

		function SetState(NewState: STREAM_STATE): HResult; stdcall;

    function GetTime(out pCurrentTime: STREAM_TIME): HResult; stdcall;

    function GetDuration(out pDuration: STREAM_TIME): HResult; stdcall;

    function Seek(SeekTime: STREAM_TIME): HResult; stdcall;

    function GetEndOfStreamEventHandle(out phEOS: THandle): HResult; stdcall;

  end;
  IID_IMultiMediaStream = IMultiMediaStream;


  // Interface IMediaStream
  // ======================
  // This interface is deprecated. New applications should not use it.
  //
  IMediaStream = interface(IUnknown)
	['{B502D1BD-9A57-11d0-8FDE-00C04FD9189D}']
		function GetMultiMediaStream(out ppMultiMediaStream: IMultiMediaStream): HResult; stdcall;

    function GetInformation(out pPurposeId: MSPID;
                            out pType: STREAM_TYPE): HResult; stdcall;

		function SetSameFormat(pStreamThatHasDesiredFormat: IMediaStream;
                           dwFlags: DWORD {Must be zero}): HResult; stdcall;

		function AllocateSample(dwFlags: DWORD; // Must be zero.
                            out ppSample: IStreamSample): HResult; stdcall;

    function CreateSharedSample(pExistingSample: IStreamSample;
                                dwFlags: DWORD; // Reserved for flag data. Must be zero.
                                out ppNewSample: IStreamSample): HResult; stdcall;

    function SendEndOfStream(dwFlags: DWORD {Must be zero}): HResult; stdcall;

  end;
  IID_IMediaStream = IMediaStream;


  // Interface IStreamSample
  // =======================
  // Note This interface is deprecated. New applications should not use it.
  //
	IStreamSample = interface(IUnknown)
  ['{B502D1BE-9A57-11d0-8FDE-00C04FD9189D}']
		function GetMediaStream(out ppMediaStream: IMediaStream): HResult; stdcall;

		function GetSampleTimes(out pStartTime: STREAM_TIME;
                            out pEndTime: STREAM_TIME;
                            out pCurrentTime: STREAM_TIME): HResult; stdcall;

		function SetSampleTimes(pStartTime: PStreamTime;
                            pEndTime: PStreamTime): HResult; stdcall;

		function Update(dwFlags: DWORD;  // Flag that specifies whether the update is synchronous or asynchronous. The SSUPDATE_ASYNC flag specifies an asynchronous update, which you can set if both hEvent and pfnAPC are nil. Use SSUPDATE_CONTINUOUS to continuously update the sample until you call the IStreamSample.CompletionStatus method.
                    hEvent: THANDLE;
                    pfnAPC: PAPCFUNC;
                    dwAPCData: DWORD_PTR): HResult; stdcall;

		function CompletionStatus(dwFlags: DWORD;
                              dwMilliseconds: DWORD): HResult; stdcall;

  end;
  IID_IStreamSample = IStreamSample;


  // Additional Prototypes for ALL interfaces

  // End of Additional Prototypes

implementation


function MS_ERROR_CODE(x: Cardinal): Cardinal;
begin
	// Match MAKE_HRESULT with unsigned wrapping for the error offset.
	Result := $80040000 or DWORD((UInt64(x) + $400) and $FFFFFFFF);
end;

function MS_SUCCESS_CODE(x: Cardinal): Cardinal;
begin
	// Match the complete DWORD code bit pattern used by MAKE_HRESULT.
	Result := $00040000 or x;
end;

  // Implement Additional Prototypes here.

end.
