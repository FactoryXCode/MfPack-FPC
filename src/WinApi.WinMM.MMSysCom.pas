// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.WinMM.MMSysCom.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 15-09-2020
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: Commonm Include file for Multimedia API's
//              Version 4.00
//              For more information, see: https://docs.microsoft.com/en-us/windows/win32/api/mmsyscom/
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
// =============================================================================
// Source: mmsyscom.h
//
// Copyright (C) 1992-1998 Microsoft Corporation.  All Rights Reserved.
// =============================================================================
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
// =============================================================================
unit WinApi.WinMM.MMSysCom;

{$I MfPack.Fpc.inc}

interface

  

uses
  {WinApi}
  Windows,
  WinApi.WinApiTypes;

  {$PACKENUM 4}

  {$IFDEF WIN32}
    {$ALIGN 1}
  {$ELSE}
    {$ALIGN 8} // Win64
  {$ENDIF}

  {$I 'WinApiTypes.inc'}


//****************************************************************************
//
//                    General constants and data types
//
//****************************************************************************

const
  //* general constants */
  MAXPNAMELEN                         = 32;  //* max product name length (including Nil) */
  MAXERRORLENGTH                      = 256;  //* max error text length (including Nil) */
  MAX_JOYSTICKOEMVXDNAME              = 260;  //* max oem vxd name length (including Nil) */

  //*
  //*  Microsoft Manufacturer and Product ID's (these have been moved to
  //*  MMREG.H for Windows 4.00 and above).
  //*/

  MM_MIDI_MAPPER                      = 1;  { MIDI Mapper }
  MM_WAVE_MAPPER                      = 2;  { Wave Mapper }
  MM_SNDBLST_MIDIOUT                  = 3;  { Sound Blaster MIDI output port }
  MM_SNDBLST_MIDIIN                   = 4;  { Sound Blaster MIDI input port }
  MM_SNDBLST_SYNTH                    = 5;  { Sound Blaster internal synthesizer }
  MM_SNDBLST_WAVEOUT                  = 6;  { Sound Blaster waveform output }
  MM_SNDBLST_WAVEIN                   = 7;  { Sound Blaster waveform input }
  MM_ADLIB                            = 9;  { Ad Lib-compatible synthesizer }
  MM_MPU401_MIDIOUT                   = 10;  { MPU401-compatible MIDI output port }
  MM_MPU401_MIDIIN                    = 11;  { MPU401-compatible MIDI input port }
  MM_PC_JOYSTICK                      = 12;  { Joystick adapter }


  //* general data types */
type
  VERSION = type UINT;               { major (high byte), minor (low byte) }
  MMVERSION = type UINT;             { major (high byte), minor (low byte) }
  MMRESULT = type UINT;              { error return code, 0 means no error }

  //* MMTIME data structure */

  // Time format. It can be one of the following values.

  //* types for wType field in MMTIME struct */
const
  TIME_MS                             = $0001;  { time in milliseconds }
  TIME_SAMPLES                        = $0002;  { number of wave samples }
  TIME_BYTES                          = $0004;  { current byte offset }
  TIME_SMPTE                          = $0008;  { SMPTE time }
  TIME_MIDI                           = $0010;  { MIDI time }
  TIME_TICKS                          = $0020;  { Ticks within MIDI stream }

type
  PMMTIME = ^mmtime_tag;
  mmtime_tag = packed record
    case wType: UINT of        { indicates the contents of the variant record }

     TIME_MS:      (ms: DWORD);      //* milliseconds */
     TIME_SAMPLES: (sample: DWORD);  //* samples */
     TIME_BYTES:   (cb: DWORD);      //* byte count */
     TIME_TICKS:   (ticks: DWORD);   //* ticks in MIDI stream */

     TIME_SMPTE: (
        hour: Byte;
        min: Byte;
        sec: Byte;
        frame: Byte;
        fps: Byte;
        dummy: Byte;
        pad: array[0..1] of Byte);
      TIME_MIDI : (songptrpos: DWORD);
  end;
  MMTIME = mmtime_tag;
  NPMMTIME = ^mmtime_tag;
  LPMMTIME = ^mmtime_tag;


  // This function is also defined in WinApi.MmReg.pas and WinApi.MediaFoundationApi.MfMetLib.pas
  function MAKEFOURCC(const ch0: AnsiChar;
                      const ch1: AnsiChar;
                      const ch2: AnsiChar;
                      const ch3: AnsiChar): FOURCC; inline;


  //****************************************************************************
  //
  //                  Multimedia Extensions Window Messages
  //
  //****************************************************************************

const

  MM_JOY1MOVE                         = $3A0;  { joystick }
  MM_JOY2MOVE                         = $3A1;
  MM_JOY1ZMOVE                        = $3A2;
  MM_JOY2ZMOVE                        = $3A3;
  MM_JOY1BUTTONDOWN                   = $3B5;
  MM_JOY2BUTTONDOWN                   = $3B6;
  MM_JOY1BUTTONUP                     = $3B7;
  MM_JOY2BUTTONUP                     = $3B8;

  MM_MCINOTIFY                        = $3B9;  { MCI }

  MM_WOM_OPEN                         = $3BB;  { waveform output }
  MM_WOM_CLOSE                        = $3BC;
  MM_WOM_DONE                         = $3BD;

  MM_WIM_OPEN                         = $3BE;  { waveform input }
  MM_WIM_CLOSE                        = $3BF;
  MM_WIM_DATA                         = $3C0;

  MM_MIM_OPEN                         = $3C1;  { MIDI input }
  MM_MIM_CLOSE                        = $3C2;
  MM_MIM_DATA                         = $3C3;
  MM_MIM_LONGDATA                     = $3C4;
  MM_MIM_ERROR                        = $3C5;
  MM_MIM_LONGERROR                    = $3C6;

  MM_MOM_OPEN                         = $3C7;  { MIDI output }
  MM_MOM_CLOSE                        = $3C8;
  MM_MOM_DONE                         = $3C9;

  //* these are also in msvideo.h */
  MM_DRVM_OPEN                        = $3D0;  { installable drivers }
  MM_DRVM_CLOSE                       = $3D1;
  MM_DRVM_DATA                        = $3D2;
  MM_DRVM_ERROR                       = $3D3;


  //* these are used by msacm.h */
  MM_STREAM_OPEN                      = $3D4;
  MM_STREAM_CLOSE                     = $3D5;
  MM_STREAM_DONE                      = $3D6;
  MM_STREAM_ERROR                     = $3D7;


  MM_MOM_POSITIONCB                   = $3CA;  { Callback for MEVT_POSITIONCB }

  MM_MCISIGNAL                        = $3CB;

  MM_MIM_MOREDATA                     = $3CC;  { MIM_DONE w/ pending events }


  MM_MIXM_LINE_CHANGE                 = $3D0;  { mixer line change notify }
  MM_MIXM_CONTROL_CHANGE              = $3D1;  { mixer control change notify }

  //****************************************************************************
  //
  //              String resource number bases (internal use)
  //
  //****************************************************************************

  MMSYSERR_BASE                       = 0;
  WAVERR_BASE                         = 32;
  MIDIERR_BASE                        = 64;
  TIMERR_BASE                         = 96;
  JOYERR_BASE                         = 160;
  MCIERR_BASE                         = 256;
  MIXERR_BASE                         = 1024;

  MCI_STRING_OFFSET                   = 512;
  MCI_VD_OFFSET                       = 1024;
  MCI_CD_OFFSET                       = 1088;
  MCI_WAVE_OFFSET                     = 1152;
  MCI_SEQ_OFFSET                      = 1216;

  //****************************************************************************
  //
  //                     General error return values
  //
  //****************************************************************************

  //* general error return values */
  MMSYSERR_NOERROR                    = 0;  { no error }
  MMSYSERR_ERROR                      = (MMSYSERR_BASE + 1);  { unspecified error }
  MMSYSERR_BADDEVICEID                = (MMSYSERR_BASE + 2);  { device ID out of range }
  MMSYSERR_NOTENABLED                 = (MMSYSERR_BASE + 3);  { driver failed enable }
  MMSYSERR_ALLOCATED                  = (MMSYSERR_BASE + 4);  { device already allocated }
  MMSYSERR_INVALHANDLE                = (MMSYSERR_BASE + 5);  { device handle is invalid }
  MMSYSERR_NODRIVER                   = (MMSYSERR_BASE + 6);  { no device driver present }
  MMSYSERR_NOMEM                      = (MMSYSERR_BASE + 7);  { memory allocation error }
  MMSYSERR_NOTSUPPORTED               = (MMSYSERR_BASE + 8);  { function isn't supported }
  MMSYSERR_BADERRNUM                  = (MMSYSERR_BASE + 9);  { error value out of range }
  MMSYSERR_INVALFLAG                  = (MMSYSERR_BASE + 10);  { invalid flag passed }
  MMSYSERR_INVALPARAM                 = (MMSYSERR_BASE + 11);  { invalid parameter passed }
  MMSYSERR_HANDLEBUSY                 = (MMSYSERR_BASE + 12);  { handle being used }
                                                               { simultaneously on another }
                                                               { thread (eg callback) }

  MMSYSERR_INVALIDALIAS               = (MMSYSERR_BASE + 13);  { specified alias not found }
  MMSYSERR_BADDB                      = (MMSYSERR_BASE + 14);  { bad registry database }
  MMSYSERR_KEYNOTFOUND                = (MMSYSERR_BASE + 15);  { registry key not found }
  MMSYSERR_READERROR                  = (MMSYSERR_BASE + 16);  { registry read error }
  MMSYSERR_WRITEERROR                 = (MMSYSERR_BASE + 17);  { registry write error }
  MMSYSERR_DELETEERROR                = (MMSYSERR_BASE + 18);  { registry delete error }
  MMSYSERR_VALNOTFOUND                = (MMSYSERR_BASE + 19);  { registry value not found }
  MMSYSERR_NODRIVERCB                 = (MMSYSERR_BASE + 20);  { driver does not call DriverCallback }
  MMSYSERR_MOREDATA                   = (MMSYSERR_BASE + 21);  { more data to be returned }
  MMSYSERR_LASTERROR                  = (MMSYSERR_BASE + 21);  { last error in range }

type
  HDRVR = IntPtr;


  //****************************************************************************
  //
  //                        Driver callback support
  //
  //****************************************************************************

  //* flags used with waveOutOpen(), waveInOpen(), midiInOpen(), and */
  //* midiOutOpen() to specify the type of the dwCallback parameter. */

const

  CALLBACK_TYPEMASK                   = $00070000;  { callback type mask }
  CALLBACK_NULL                       = $00000000;  { no callback }
  CALLBACK_WINDOW                     = $00010000;  { dwCallback is a HWND }
  CALLBACK_TASK                       = $00020000;  { dwCallback is a HTASK }
  CALLBACK_FUNCTION                   = $00030000;  { dwCallback is a FARPROC }

  CALLBACK_THREAD                     = (CALLBACK_TASK);  { thread ID replaces 16 bit task }
  CALLBACK_EVENT                      = $00050000;  { dwCallback is an EVENT Handle }

type
  DRVCALLBACK = procedure(hdrvr: HDRVR;
                          uMsg: UINT;
                          dwUser: DWORD_PTR;
                          dw1: DWORD_PTR;
                          dw2: DWORD_PTR); stdcall;
  LPDRVCALLBACK = DRVCALLBACK;
  PDRVCALLBACK = DRVCALLBACK;

  // Additional Prototypes for ALL Interfaces

  // End of Additional Prototypes

implementation


function MAKEFOURCC(const ch0: AnsiChar;
                    const ch1: AnsiChar;
                    const ch2: AnsiChar;
                    const ch3: AnsiChar): FOURCC; inline;
begin
  Result:= DWORD(Ord(ch0)) OR
           (DWORD(Ord(ch1)) shl 8) OR
           (DWORD(Ord(ch2)) shl 16) OR
           (DWORD(Ord(ch3)) shl 24);
end;

  // Implement Additional functions here.

end.
