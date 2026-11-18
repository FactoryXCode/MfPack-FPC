// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.WinMM.MCIApi.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 17-05-2020
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: ApiSet Contract for api-ms-win-mm-mci-l1-1-0.
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
// Remarks:
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
// Source: mciapi.h
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
unit WinApi.WinMM.MCIApi;

{$I MfPack.Fpc.inc}

  {$PACKENUM 4}

  {$IFDEF WIN32}
    {$ALIGN 1}
  {$ELSE}
    {$ALIGN 8} // Win64
  {$ENDIF}


interface


uses
  {WinApi}
  Windows,
  {WinMM}
  WinApi.WinMM.MMSysCom,
  WinApi.WinMM.MMiscApi;

  //****************************************************************************
  //
  //                          MCI support
  //
  //****************************************************************************

type

  { MCIERROR is defined in some post 3.1 apps }

  MCIERROR = DWORD;

  { error return code, 0 means no error }

  MCIDEVICEID = UINT;

  { MCI device ID type }

  YIELDPROC = function(mciId: MCIDEVICEID;
                       dwYieldData: DWORD): UINT; stdcall;

  { MCI function prototypes }

  function mciSendCommandA(mciId: MCIDEVICEID;
                           uMsg: UINT;
                           {_In_opt_} dwParam1: DWORD_PTR;
                           {_In_opt_} dwParam2: DWORD_PTR): MCIERROR; stdcall;

  function mciSendCommandW(mciId: MCIDEVICEID;
                           uMsg: UINT;
                           {_In_opt_} dwParam1: DWORD_PTR;
                           {_In_opt_} dwParam2: DWORD_PTR): MCIERROR; stdcall;

  { unicode }
  function mciSendCommand(mciId: MCIDEVICEID;
                          uMsg: UINT;
                          {_In_opt_} dwParam1: DWORD_PTR;
                          {_In_opt_} dwParam2: DWORD_PTR): MCIERROR; stdcall;


  function mciSendStringA(lpstrCommand: PAnsiChar;
                          lpstrReturnString: PAnsiChar;
                          uReturnLength: UINT;
                          {_In_opt_} hwndCallback: HWND): MCIERROR; stdcall;

  function mciSendStringW(lpstrCommand: PWideChar;
                          lpstrReturnString: PWideChar;
                          uReturnLength: UINT;
                          {_In_opt_} hwndCallback: HWND): MCIERROR; stdcall;

  { unicode }
  function mciSendString(lpstrCommand: PWideChar;
                         lpstrReturnString: PWideChar;
                         uReturnLength: UINT;
                         {_In_opt_} hwndCallback: HWND): MCIERROR; stdcall;


  function mciGetDeviceIDA(pszDevice: PAnsiChar): MCIDEVICEID; stdcall;

  function mciGetDeviceIDW(pszDevice: PWideChar): MCIDEVICEID; stdcall;

  { unicode }
  function mciGetDeviceID(pszDevice: PWideChar): MCIDEVICEID; stdcall;


  function mciGetDeviceIDFromElementIDA(dwElementID: DWORD;
                                        lpstrType: PAnsiChar): MCIDEVICEID; stdcall;


  function mciGetDeviceIDFromElementIDW(dwElementID: DWORD;
                                        lpstrType: PWideChar): MCIDEVICEID; stdcall;

  { unicode }
  function mciGetDeviceIDFromElementID(dwElementID: DWORD;
                                       lpstrType: PWideChar): MCIDEVICEID; stdcall;


  function mciGetErrorStringA(mcierr: MCIERROR;
                              {_Out_} pszText: PAnsiChar;
                              cchText: UINT): BOOL; stdcall;

  function mciGetErrorStringW(mcierr: MCIERROR;
                              {_Out_} pszText: PWideChar;
                              cchText: UINT): BOOL; stdcall;

  { unicode }
  function mciGetErrorString(mcierr: MCIERROR;
                             {_Out_} pszText: PWideChar;
                             cchText: UINT): BOOL; stdcall;


  function mciSetYieldProc(mciId: MCIDEVICEID;
                           {_In_opt_} fpYieldProc: YIELDPROC;
                           dwYieldData: DWORD): BOOL; stdcall;


  function mciGetCreatorTask(mciId: MCIDEVICEID): HTASK; stdcall;

  function mciGetYieldProc(mciId: MCIDEVICEID;
                           pdwYieldData: PDWORD): YIELDPROC; stdcall;


  { MCI error return values }

const

  MCIERR_INVALID_DEVICE_ID            = (MCIERR_BASE + 1);
  MCIERR_UNRECOGNIZED_KEYWORD         = (MCIERR_BASE + 3);
  MCIERR_UNRECOGNIZED_COMMAND         = (MCIERR_BASE + 5);
  MCIERR_HARDWARE                     = (MCIERR_BASE + 6);
  MCIERR_INVALID_DEVICE_NAME          = (MCIERR_BASE + 7);
  MCIERR_OUT_OF_MEMORY                = (MCIERR_BASE + 8);
  MCIERR_DEVICE_OPEN                  = (MCIERR_BASE + 9);
  MCIERR_CANNOT_LOAD_DRIVER           = (MCIERR_BASE + 10);
  MCIERR_MISSING_COMMAND_STRING       = (MCIERR_BASE + 11);
  MCIERR_PARAM_OVERFLOW               = (MCIERR_BASE + 12);
  MCIERR_MISSING_STRING_ARGUMENT      = (MCIERR_BASE + 13);
  MCIERR_BAD_INTEGER                  = (MCIERR_BASE + 14);
  MCIERR_PARSER_INTERNAL              = (MCIERR_BASE + 15);
  MCIERR_DRIVER_INTERNAL              = (MCIERR_BASE + 16);
  MCIERR_MISSING_PARAMETER            = (MCIERR_BASE + 17);
  MCIERR_UNSUPPORTED_FUNCTION         = (MCIERR_BASE + 18);
  MCIERR_FILE_NOT_FOUND               = (MCIERR_BASE + 19);
  MCIERR_DEVICE_NOT_READY             = (MCIERR_BASE + 20);
  MCIERR_INTERNAL                     = (MCIERR_BASE + 21);
  MCIERR_DRIVER                       = (MCIERR_BASE + 22);
  MCIERR_CANNOT_USE_ALL               = (MCIERR_BASE + 23);
  MCIERR_MULTIPLE                     = (MCIERR_BASE + 24);
  MCIERR_EXTENSION_NOT_FOUND          = (MCIERR_BASE + 25);
  MCIERR_OUTOFRANGE                   = (MCIERR_BASE + 26);
  MCIERR_FLAGS_NOT_COMPATIBLE         = (MCIERR_BASE + 28);
  MCIERR_FILE_NOT_SAVED               = (MCIERR_BASE + 30);
  MCIERR_DEVICE_TYPE_REQUIRED         = (MCIERR_BASE + 31);
  MCIERR_DEVICE_LOCKED                = (MCIERR_BASE + 32);
  MCIERR_DUPLICATE_ALIAS              = (MCIERR_BASE + 33);
  MCIERR_BAD_CONSTANT                 = (MCIERR_BASE + 34);
  MCIERR_MUST_USE_SHAREABLE           = (MCIERR_BASE + 35);
  MCIERR_MISSING_DEVICE_NAME          = (MCIERR_BASE + 36);
  MCIERR_BAD_TIME_FORMAT              = (MCIERR_BASE + 37);
  MCIERR_NO_CLOSING_QUOTE             = (MCIERR_BASE + 38);
  MCIERR_DUPLICATE_FLAGS              = (MCIERR_BASE + 39);
  MCIERR_INVALID_FILE                 = (MCIERR_BASE + 40);
  MCIERR_NULL_PARAMETER_BLOCK         = (MCIERR_BASE + 41);
  MCIERR_UNNAMED_RESOURCE             = (MCIERR_BASE + 42);
  MCIERR_NEW_REQUIRES_ALIAS           = (MCIERR_BASE + 43);
  MCIERR_NOTIFY_ON_AUTO_OPEN          = (MCIERR_BASE + 44);
  MCIERR_NO_ELEMENT_ALLOWED           = (MCIERR_BASE + 45);
  MCIERR_NONAPPLICABLE_FUNCTION       = (MCIERR_BASE + 46);
  MCIERR_ILLEGAL_FOR_AUTO_OPEN        = (MCIERR_BASE + 47);
  MCIERR_FILENAME_REQUIRED            = (MCIERR_BASE + 48);
  MCIERR_EXTRA_CHARACTERS             = (MCIERR_BASE + 49);
  MCIERR_DEVICE_NOT_INSTALLED         = (MCIERR_BASE + 50);
  MCIERR_GET_CD                       = (MCIERR_BASE + 51);
  MCIERR_SET_CD                       = (MCIERR_BASE + 52);
  MCIERR_SET_DRIVE                    = (MCIERR_BASE + 53);
  MCIERR_DEVICE_LENGTH                = (MCIERR_BASE + 54);
  MCIERR_DEVICE_ORD_LENGTH            = (MCIERR_BASE + 55);
  MCIERR_NO_INTEGER                   = (MCIERR_BASE + 56);
  MCIERR_WAVE_OUTPUTSINUSE            = (MCIERR_BASE + 64);
  MCIERR_WAVE_SETOUTPUTINUSE          = (MCIERR_BASE + 65);
  MCIERR_WAVE_INPUTSINUSE             = (MCIERR_BASE + 66);
  MCIERR_WAVE_SETINPUTINUSE           = (MCIERR_BASE + 67);
  MCIERR_WAVE_OUTPUTUNSPECIFIED       = (MCIERR_BASE + 68);
  MCIERR_WAVE_INPUTUNSPECIFIED        = (MCIERR_BASE + 69);
  MCIERR_WAVE_OUTPUTSUNSUITABLE       = (MCIERR_BASE + 70);
  MCIERR_WAVE_SETOUTPUTUNSUITABLE     = (MCIERR_BASE + 71);
  MCIERR_WAVE_INPUTSUNSUITABLE        = (MCIERR_BASE + 72);
  MCIERR_WAVE_SETINPUTUNSUITABLE      = (MCIERR_BASE + 73);
  MCIERR_SEQ_DIV_INCOMPATIBLE         = (MCIERR_BASE + 80);
  MCIERR_SEQ_PORT_INUSE               = (MCIERR_BASE + 81);
  MCIERR_SEQ_PORT_NONEXISTENT         = (MCIERR_BASE + 82);
  MCIERR_SEQ_PORT_MAPNODEVICE         = (MCIERR_BASE + 83);
  MCIERR_SEQ_PORT_MISCERROR           = (MCIERR_BASE + 84);
  MCIERR_SEQ_TIMER                    = (MCIERR_BASE + 85);
  MCIERR_SEQ_PORTUNSPECIFIED          = (MCIERR_BASE + 86);
  MCIERR_SEQ_NOMIDIPRESENT            = (MCIERR_BASE + 87);
  MCIERR_NO_WINDOW                    = (MCIERR_BASE + 90);
  MCIERR_CREATEWINDOW                 = (MCIERR_BASE + 91);
  MCIERR_FILE_READ                    = (MCIERR_BASE + 92);
  MCIERR_FILE_WRITE                   = (MCIERR_BASE + 93);
  MCIERR_NO_IDENTITY                  = (MCIERR_BASE + 94);

  { all custom device driver errors must be >= than this value }
  MCIERR_CUSTOM_DRIVER_BASE           = (MCIERR_BASE + 256);



  { MCI command message identifiers }


  MCI_FIRST                           = DRV_MCI_FIRST;  { $0800 }
  MCI_OPEN                            = $0803;
  MCI_CLOSE                           = $0804;
  MCI_ESCAPE                          = $0805;
  MCI_PLAY                            = $0806;
  MCI_SEEK                            = $0807;
  MCI_STOP                            = $0808;
  MCI_PAUSE                           = $0809;
  MCI_INFO                            = $080A;
  MCI_GETDEVCAPS                      = $080B;
  MCI_SPIN                            = $080C;
  MCI_SET                             = $080D;
  MCI_STEP                            = $080E;
  MCI_RECORD                          = $080F;
  MCI_SYSINFO                         = $0810;
  MCI_BREAK                           = $0811;
  MCI_SAVE                            = $0813;
  MCI_STATUS                          = $0814;
  MCI_CUE                             = $0830;
  MCI_REALIZE                         = $0840;
  MCI_WINDOW                          = $0841;
  MCI_PUT                             = $0842;
  MCI_WHERE                           = $0843;
  MCI_FREEZE                          = $0844;
  MCI_UNFREEZE                        = $0845;
  MCI_LOAD                            = $0850;
  MCI_CUT                             = $0851;
  MCI_COPY                            = $0852;
  MCI_PASTE                           = $0853;
  MCI_UPDATE                          = $0854;
  MCI_RESUME                          = $0855;
  MCI_DELETE                          = $0856;


  { all custom MCI command messages must be >= than this value }

  MCI_USER_MESSAGES                   = (DRV_MCI_FIRST + $400);
  MCI_LAST                            = $0FFF;

  { device ID for "all devices" }

  MCI_ALL_DEVICE_ID                   = MCIDEVICEID( - 1);


  { constants for predefined MCI device types }

  MCI_DEVTYPE_VCR                     = 513;  { (MCI_STRING_OFFSET + 1) }
  MCI_DEVTYPE_VIDEODISC               = 514;  { (MCI_STRING_OFFSET + 2) }
  MCI_DEVTYPE_OVERLAY                 = 515;  { (MCI_STRING_OFFSET + 3) }
  MCI_DEVTYPE_CD_AUDIO                = 516;  { (MCI_STRING_OFFSET + 4) }
  MCI_DEVTYPE_DAT                     = 517;  { (MCI_STRING_OFFSET + 5) }
  MCI_DEVTYPE_SCANNER                 = 518;  { (MCI_STRING_OFFSET + 6) }
  MCI_DEVTYPE_ANIMATION               = 519;  { (MCI_STRING_OFFSET + 7) }
  MCI_DEVTYPE_DIGITAL_VIDEO           = 520;  { (MCI_STRING_OFFSET + 8) }
  MCI_DEVTYPE_OTHER                   = 521;  { (MCI_STRING_OFFSET + 9) }
  MCI_DEVTYPE_WAVEFORM_AUDIO          = 522;  { (MCI_STRING_OFFSET + 10) }
  MCI_DEVTYPE_SEQUENCER               = 523;  { (MCI_STRING_OFFSET + 11) }

  MCI_DEVTYPE_FIRST                   = MCI_DEVTYPE_VCR;
  MCI_DEVTYPE_LAST                    = MCI_DEVTYPE_SEQUENCER;

  MCI_DEVTYPE_FIRST_USER              = $1000;


  { return values for 'status mode' command }

  MCI_MODE_NOT_READY                  = (MCI_STRING_OFFSET + 12);
  MCI_MODE_STOP                       = (MCI_STRING_OFFSET + 13);
  MCI_MODE_PLAY                       = (MCI_STRING_OFFSET + 14);
  MCI_MODE_RECORD                     = (MCI_STRING_OFFSET + 15);
  MCI_MODE_SEEK                       = (MCI_STRING_OFFSET + 16);
  MCI_MODE_PAUSE                      = (MCI_STRING_OFFSET + 17);
  MCI_MODE_OPEN                       = (MCI_STRING_OFFSET + 18);


  { constants used in 'set time format' and 'status time format' commands }

  MCI_FORMAT_MILLISECONDS             = 0;
  MCI_FORMAT_HMS                      = 1;
  MCI_FORMAT_MSF                      = 2;
  MCI_FORMAT_FRAMES                   = 3;
  MCI_FORMAT_SMPTE_24                 = 4;
  MCI_FORMAT_SMPTE_25                 = 5;
  MCI_FORMAT_SMPTE_30                 = 6;
  MCI_FORMAT_SMPTE_30DROP             = 7;
  MCI_FORMAT_BYTES                    = 8;
  MCI_FORMAT_SAMPLES                  = 9;
  MCI_FORMAT_TMSF                     = 10;


  { MCI time format conversion macros }

  function MCI_MSF_MINUTE(msf: DWord): Byte;

  function MCI_MSF_SECOND(msf: DWord): Byte;

  function MCI_MSF_FRAME(msf: DWord): Byte;

  function MCI_MAKE_MSF(m: Byte;
                        s: Byte;
                        f: Byte): DWord;

  function MCI_TMSF_TRACK(tmsf: DWord): Byte;

  function MCI_TMSF_MINUTE(tmsf: DWord): Byte;

  function MCI_TMSF_SECOND(tmsf: DWord): Byte;

  function MCI_TMSF_FRAME(tmsf: DWord): Byte;

  function MCI_MAKE_TMSF(t: Byte;
                         m: Byte;
                         s: Byte;
                         f: Byte): DWord;

  function MCI_HMS_HOUR(hms: DWord): Byte;

  function MCI_HMS_MINUTE(hms: DWord): Byte;

  function MCI_HMS_SECOND(hms: DWord): Byte;

  function MCI_MAKE_HMS(h: Byte;
                        m: Byte;
                        s: Byte): DWord;


  { flags for wParam of MM_MCINOTIFY message }

const

  MCI_NOTIFY_SUCCESSFUL               = $0001;
  MCI_NOTIFY_SUPERSEDED               = $0002;
  MCI_NOTIFY_ABORTED                  = $0004;
  MCI_NOTIFY_FAILURE                  = $0008;

  { common flags for dwFlags parameter of MCI command messages }

  MCI_NOTIFY                          = $00000001;
  MCI_WAIT                            = $00000002;
  MCI_FROM                            = $00000004;
  MCI_TO                              = $00000008;
  MCI_TRACK                           = $00000010;


  { flags for dwFlags parameter of MCI_OPEN command message }

  MCI_OPEN_SHAREABLE                  = $00000100;
  MCI_OPEN_ELEMENT                    = $00000200;
  MCI_OPEN_ALIAS                      = $00000400;
  MCI_OPEN_ELEMENT_ID                 = $00000800;
  MCI_OPEN_TYPE_ID                    = $00001000;
  MCI_OPEN_TYPE                       = $00002000;


  { flags for dwFlags parameter of MCI_SEEK command message }

  MCI_SEEK_TO_START                   = $00000100;
  MCI_SEEK_TO_END                     = $00000200;


  { flags for dwFlags parameter of MCI_STATUS command message }

  MCI_STATUS_ITEM                     = $00000100;
  MCI_STATUS_START                    = $00000200;


  { flags for dwItem field of the MCI_STATUS_PARMS parameter block }

  MCI_STATUS_LENGTH                   = $00000001;
  MCI_STATUS_POSITION                 = $00000002;
  MCI_STATUS_NUMBER_OF_TRACKS         = $00000003;
  MCI_STATUS_MODE                     = $00000004;
  MCI_STATUS_MEDIA_PRESENT            = $00000005;
  MCI_STATUS_TIME_FORMAT              = $00000006;
  MCI_STATUS_READY                    = $00000007;
  MCI_STATUS_CURRENT_TRACK            = $00000008;


  { flags for dwFlags parameter of MCI_INFO command message }

  MCI_INFO_PRODUCT                    = $00000100;
  MCI_INFO_FILE                       = $00000200;
  MCI_INFO_MEDIA_UPC                  = $00000400;
  MCI_INFO_MEDIA_IDENTITY             = $00000800;
  MCI_INFO_NAME                       = $00001000;
  MCI_INFO_COPYRIGHT                  = $00002000;


  { flags for dwFlags parameter of MCI_GETDEVCAPS command message }

  MCI_GETDEVCAPS_ITEM                 = $00000100;


  { flags for dwItem field of the MCI_GETDEVCAPS_PARMS parameter block }

  MCI_GETDEVCAPS_CAN_RECORD           = $00000001;
  MCI_GETDEVCAPS_HAS_AUDIO            = $00000002;
  MCI_GETDEVCAPS_HAS_VIDEO            = $00000003;
  MCI_GETDEVCAPS_DEVICE_TYPE          = $00000004;
  MCI_GETDEVCAPS_USES_FILES           = $00000005;
  MCI_GETDEVCAPS_COMPOUND_DEVICE      = $00000006;
  MCI_GETDEVCAPS_CAN_EJECT            = $00000007;
  MCI_GETDEVCAPS_CAN_PLAY             = $00000008;
  MCI_GETDEVCAPS_CAN_SAVE             = $00000009;


  { flags for dwFlags parameter of MCI_SYSINFO command message }

  MCI_SYSINFO_QUANTITY                = $00000100;
  MCI_SYSINFO_OPEN                    = $00000200;
  MCI_SYSINFO_NAME                    = $00000400;
  MCI_SYSINFO_INSTALLNAME             = $00000800;


  { flags for dwFlags parameter of MCI_SET command message }

  MCI_SET_DOOR_OPEN                   = $00000100;
  MCI_SET_DOOR_CLOSED                 = $00000200;
  MCI_SET_TIME_FORMAT                 = $00000400;
  MCI_SET_AUDIO                       = $00000800;
  MCI_SET_VIDEO                       = $00001000;
  MCI_SET_ON                          = $00002000;
  MCI_SET_OFF                         = $00004000;


  { flags for dwAudio field of MCI_SET_PARMS or MCI_SEQ_SET_PARMS }

  MCI_SET_AUDIO_ALL                   = $00000000;
  MCI_SET_AUDIO_LEFT                  = $00000001;
  MCI_SET_AUDIO_RIGHT                 = $00000002;


  { flags for dwFlags parameter of MCI_BREAK command message }

  MCI_BREAK_KEY                       = $00000100;
  MCI_BREAK_HWND                      = $00000200;
  MCI_BREAK_OFF                       = $00000400;


  { flags for dwFlags parameter of MCI_RECORD command message }

  MCI_RECORD_INSERT                   = $00000100;
  MCI_RECORD_OVERWRITE                = $00000200;


  { flags for dwFlags parameter of MCI_SAVE command message }

  MCI_SAVE_FILE                       = $00000100;


  { flags for dwFlags parameter of MCI_LOAD command message }

  MCI_LOAD_FILE                       = $00000100;


 { generic parameter block for MCI command messages with no special parameters }

type

  PMCI_GENERIC_PARMS = ^tagMCI_GENERIC_PARMS;
  tagMCI_GENERIC_PARMS = packed record
    dwCallback: DWORD_PTR;
  end;
  MCI_GENERIC_PARMS = tagMCI_GENERIC_PARMS;
  LPMCI_GENERIC_PARMS = ^tagMCI_GENERIC_PARMS;


  { parameter block for MCI_OPEN command message }

  PMCI_OPEN_PARMSA = ^MCI_OPEN_PARMSA;
  tagMCI_OPEN_PARMSA = packed record
    dwCallback: DWORD_PTR;
    wDeviceID: MCIDEVICEID;
    lpstrDeviceType: PAnsiChar;
    lpstrElementName: PAnsiChar;
    lpstrAlias: PAnsiChar;
  end;
  MCI_OPEN_PARMSA = tagMCI_OPEN_PARMSA;
  LPMCI_OPEN_PARMSA = ^tagMCI_OPEN_PARMSA;

  PMCI_OPEN_PARMSW = ^tagMCI_OPEN_PARMSW;
  tagMCI_OPEN_PARMSW = packed record
    dwCallback: DWORD_PTR;
    wDeviceID: MCIDEVICEID;
    lpstrDeviceType: PWideChar;
    lpstrElementName: PWideChar;
    lpstrAlias: PWideChar;
  end;
  MCI_OPEN_PARMSW = tagMCI_OPEN_PARMSW;
  LPMCI_OPEN_PARMSW = ^tagMCI_OPEN_PARMSW;

  { unicode }
  MCI_OPEN_PARMS = tagMCI_OPEN_PARMSW;
  PMCI_OPEN_PARMS = ^tagMCI_OPEN_PARMSW;
  LPMCI_OPEN_PARMS = ^tagMCI_OPEN_PARMSW;


  { parameter block for MCI_PLAY command message }

  PMCI_PLAY_PARMS = ^tagMCI_PLAY_PARMS;
  tagMCI_PLAY_PARMS = packed record
    dwCallback: DWORD_PTR;
    dwFrom: DWORD;
    dwTo: DWORD;
  end;
  MCI_PLAY_PARMS = tagMCI_PLAY_PARMS;
  LPMCI_PLAY_PARMS = ^tagMCI_PLAY_PARMS;


  { parameter block for MCI_SEEK command message }

  PMCI_SEEK_PARMS = ^tagMCI_SEEK_PARMS;
  tagMCI_SEEK_PARMS = packed record
    dwCallback: DWORD_PTR;
    dwTo: DWORD;
  end;
  MCI_SEEK_PARMS = tagMCI_SEEK_PARMS;
  LPMCI_SEEK_PARMS = ^tagMCI_SEEK_PARMS;


  { parameter block for MCI_STATUS command message }

  PMCI_STATUS_PARMS = ^tagMCI_STATUS_PARMS;
  tagMCI_STATUS_PARMS = packed record
    dwCallback: DWORD_PTR;
    dwReturn: DWORD_PTR;
    dwItem: DWORD;
    dwTrack: DWORD;
  end;
  MCI_STATUS_PARMS = tagMCI_STATUS_PARMS;
  LPMCI_STATUS_PARMS = ^tagMCI_STATUS_PARMS;


  { parameter block for MCI_INFO command message }

  PMCI_INFO_PARMSA = ^tagMCI_INFO_PARMSA;
  tagMCI_INFO_PARMSA = packed record
    dwCallback: DWORD_PTR;
    lpstrReturn: PAnsiChar;
    dwRetSize: DWORD;
  end;
  MCI_INFO_PARMSA = tagMCI_INFO_PARMSA;
  LPMCI_INFO_PARMSA = ^tagMCI_INFO_PARMSA;

  PMCI_INFO_PARMSW = ^tagMCI_INFO_PARMSW;
  tagMCI_INFO_PARMSW = packed record
    dwCallback: DWORD_PTR;
    lpstrReturn: PWideChar;
    dwRetSize: DWORD;
  end;
  MCI_INFO_PARMSW = tagMCI_INFO_PARMSW;
  LPMCI_INFO_PARMSW = ^tagMCI_INFO_PARMSW;


  { parameter block for MCI_GETDEVCAPS command message }

  PMCI_GETDEVCAPS_PARMS = ^tagMCI_GETDEVCAPS_PARMS;
  tagMCI_GETDEVCAPS_PARMS = packed record
    dwCallback: DWORD_PTR;
    dwReturn: DWORD;
    dwItem: DWORD;
  end;
  MCI_GETDEVCAPS_PARMS = tagMCI_GETDEVCAPS_PARMS;
  LPMCI_GETDEVCAPS_PARMS = ^tagMCI_GETDEVCAPS_PARMS;


  { parameter block for MCI_SYSINFO command message }

  PMCI_SYSINFO_PARMSA = ^tagMCI_SYSINFO_PARMSA;
  tagMCI_SYSINFO_PARMSA = packed record
    dwCallback: DWORD_PTR;
    lpstrReturn: PAnsiChar;
    dwRetSize: DWORD;
    dwNumber: DWORD;
    wDeviceType: UINT;
  end;
  MCI_SYSINFO_PARMSA = tagMCI_SYSINFO_PARMSA;
  LPMCI_SYSINFO_PARMSA = ^tagMCI_SYSINFO_PARMSA;

  PMCI_SYSINFO_PARMSW = ^tagMCI_SYSINFO_PARMSW;
  tagMCI_SYSINFO_PARMSW = packed record
    dwCallback: DWORD_PTR;
    lpstrReturn: PWideChar;
    dwRetSize: DWORD;
    dwNumber: DWORD;
    wDeviceType: UINT;
  end;
  MCI_SYSINFO_PARMSW = tagMCI_SYSINFO_PARMSW;
  LPMCI_SYSINFO_PARMSW = ^tagMCI_SYSINFO_PARMSW;

  { unicode }
  MCI_SYSINFO_PARMS = tagMCI_SYSINFO_PARMSW;
  PMCI_SYSINFO_PARMS = ^tagMCI_SYSINFO_PARMSW;
  LPMCI_SYSINFO_PARMS = ^tagMCI_SYSINFO_PARMSW;


  { parameter block for MCI_SET command message }

  PMCI_SET_PARMS = ^tagMCI_SET_PARMS;
  tagMCI_SET_PARMS = packed record
    dwCallback: DWORD_PTR;
    dwTimeFormat: DWORD;
    dwAudio: DWORD;
  end;
  MCI_SET_PARMS = tagMCI_SET_PARMS;
  LPMCI_SET_PARMS = ^tagMCI_SET_PARMS;


  { parameter block for MCI_BREAK command message }

  PMCI_BREAK_PARMS = ^tagMCI_BREAK_PARMS;
  tagMCI_BREAK_PARMS = packed record
    dwCallback: DWORD_PTR;
    nVirtKey: Integer;
    hwndBreak: HWND;
  end;
  MCI_BREAK_PARMS = tagMCI_BREAK_PARMS;
  LPMCI_BREAK_PARMS = ^tagMCI_BREAK_PARMS;


  { parameter block for MCI_SAVE command message }

  PMCI_SAVE_PARMSA = ^tagMCI_SAVE_PARMSA;
  tagMCI_SAVE_PARMSA = packed record
    dwCallback: DWORD_PTR;
    lpfilename: PAnsiChar;
  end;
  MCI_SAVE_PARMSA = tagMCI_SAVE_PARMSA;
  LPMCI_SAVE_PARMSA = ^tagMCI_SAVE_PARMSA;

  PMCI_SAVE_PARMSW = ^tagMCI_SAVE_PARMSW;
  tagMCI_SAVE_PARMSW = packed record
    dwCallback: DWORD_PTR;
    lpfilename: PWideChar;
  end;
  MCI_SAVE_PARMSW = tagMCI_SAVE_PARMSW;
  LPMCI_SAVE_PARMSW = ^tagMCI_SAVE_PARMSW;

  { unicode }
  MCI_SAVE_PARMS = tagMCI_SAVE_PARMSW;
  PMCI_SAVE_PARMS = ^tagMCI_SAVE_PARMSW;
  LPMCI_SAVE_PARMS = ^tagMCI_SAVE_PARMSW;


  { parameter block for MCI_LOAD command message }

  PMCI_LOAD_PARMSA = ^tagMCI_LOAD_PARMSA;
  tagMCI_LOAD_PARMSA = packed record
    dwCallback: DWORD_PTR;
    lpfilename: PAnsiChar;
  end;
  MCI_LOAD_PARMSA = tagMCI_LOAD_PARMSA;
  LPMCI_LOAD_PARMSA = ^tagMCI_LOAD_PARMSA;

  PMCI_LOAD_PARMSW = ^tagMCI_LOAD_PARMSW;
  tagMCI_LOAD_PARMSW = packed record
    dwCallback: DWORD_PTR;
    lpfilename: PWideChar;
  end;
  MCI_LOAD_PARMSW = tagMCI_LOAD_PARMSW;
  LPMCI_LOAD_PARMSW = ^tagMCI_LOAD_PARMSW;

  { unicode }
  MCI_LOAD_PARMS = tagMCI_LOAD_PARMSW;
  PMCI_LOAD_PARMS = ^tagMCI_LOAD_PARMSW;
  LPMCI_LOAD_PARMS = ^tagMCI_LOAD_PARMSW;


  { parameter block for MCI_RECORD command message }

  PMCI_RECORD_PARMS = ^tagMCI_RECORD_PARMS;
  tagMCI_RECORD_PARMS = packed record
    dwCallback: DWORD_PTR;
    dwFrom: DWORD;
    dwTo: DWORD;
  end;
  MCI_RECORD_PARMS = tagMCI_RECORD_PARMS;
  LPMCI_RECORD_PARMS = ^tagMCI_RECORD_PARMS;


  { MCI extensions for videodisc devices }

const

  { flag for dwReturn field of MCI_STATUS_PARMS }
  { MCI_STATUS command, (dwItem == MCI_STATUS_MODE) }

  MCI_VD_MODE_PARK                    = (MCI_VD_OFFSET + 1);


  { flag for dwReturn field of MCI_STATUS_PARMS }
  { MCI_STATUS command, (dwItem == MCI_VD_STATUS_MEDIA_TYPE) }

  MCI_VD_MEDIA_CLV                    = (MCI_VD_OFFSET + 2);
  MCI_VD_MEDIA_CAV                    = (MCI_VD_OFFSET + 3);
  MCI_VD_MEDIA_OTHER                  = (MCI_VD_OFFSET + 4);

  MCI_VD_FORMAT_TRACK                 = $4001;

  { flags for dwFlags parameter of MCI_PLAY command message }

  MCI_VD_PLAY_REVERSE                 = $00010000;
  MCI_VD_PLAY_FAST                    = $00020000;
  MCI_VD_PLAY_SPEED                   = $00040000;
  MCI_VD_PLAY_SCAN                    = $00080000;
  MCI_VD_PLAY_SLOW                    = $00100000;

  { flag for dwFlags parameter of MCI_SEEK command message }

  MCI_VD_SEEK_REVERSE                 = $00010000;

  { flags for dwItem field of MCI_STATUS_PARMS parameter block }

  MCI_VD_STATUS_SPEED                 = $00004002;
  MCI_VD_STATUS_FORWARD               = $00004003;
  MCI_VD_STATUS_MEDIA_TYPE            = $00004004;
  MCI_VD_STATUS_SIDE                  = $00004005;
  MCI_VD_STATUS_DISC_SIZE             = $00004006;

  { flags for dwFlags parameter of MCI_GETDEVCAPS command message }

  MCI_VD_GETDEVCAPS_CLV               = $00010000;
  MCI_VD_GETDEVCAPS_CAV               = $00020000;

  MCI_VD_SPIN_UP                      = $00010000;
  MCI_VD_SPIN_DOWN                    = $00020000;

  { flags for dwItem field of MCI_GETDEVCAPS_PARMS parameter block }

  MCI_VD_GETDEVCAPS_CAN_REVERSE       = $00004002;
  MCI_VD_GETDEVCAPS_FAST_RATE         = $00004003;
  MCI_VD_GETDEVCAPS_SLOW_RATE         = $00004004;
  MCI_VD_GETDEVCAPS_NORMAL_RATE       = $00004005;

  { flags for the dwFlags parameter of MCI_STEP command message }

  MCI_VD_STEP_FRAMES                  = $00010000;
  MCI_VD_STEP_REVERSE                 = $00020000;

  { flag for the MCI_ESCAPE command message }
  MCI_VD_ESCAPE_STRING                = $00000100;

type

  { parameter block for MCI_PLAY command message }

  PMCI_VD_PLAY_PARMS = ^tagMCI_VD_PLAY_PARMS;
  tagMCI_VD_PLAY_PARMS = packed record
    dwCallback: DWORD_PTR;
    dwFrom: DWORD;
    dwTo: DWORD;
    dwSpeed: DWORD;
  end;
  MCI_VD_PLAY_PARMS = tagMCI_VD_PLAY_PARMS;
  LPMCI_VD_PLAY_PARMS = ^tagMCI_VD_PLAY_PARMS;


  { parameter block for MCI_STEP command message }

  PMCI_VD_STEP_PARMS = ^tagMCI_VD_STEP_PARMS;
  tagMCI_VD_STEP_PARMS = packed record
    dwCallback: DWORD_PTR;
    dwFrames: DWORD;
  end;
  MCI_VD_STEP_PARMS = tagMCI_VD_STEP_PARMS;
  LPMCI_VD_STEP_PARMS = ^tagMCI_VD_STEP_PARMS;


  { parameter block for MCI_ESCAPE command message }

  PMCI_VD_ESCAPE_PARMSA = ^tagMCI_VD_ESCAPE_PARMSA;
  tagMCI_VD_ESCAPE_PARMSA = packed record
    dwCallback: DWORD_PTR;
    lpstrCommand: PAnsiChar;
  end;
  MCI_VD_ESCAPE_PARMSA = tagMCI_VD_ESCAPE_PARMSA;
  LPMCI_VD_ESCAPE_PARMSA = ^tagMCI_VD_ESCAPE_PARMSA;

  PMCI_VD_ESCAPE_PARMSW = ^tagMCI_VD_ESCAPE_PARMSW;
  tagMCI_VD_ESCAPE_PARMSW = packed record
    dwCallback: DWORD_PTR;
    lpstrCommand: PWideChar;
  end;
  MCI_VD_ESCAPE_PARMSW = tagMCI_VD_ESCAPE_PARMSW;
  LPMCI_VD_ESCAPE_PARMSW = ^tagMCI_VD_ESCAPE_PARMSW;

  { unicode }
  MCI_VD_ESCAPE_PARMS = tagMCI_VD_ESCAPE_PARMSW;
  PMCI_VD_ESCAPE_PARMS = ^tagMCI_VD_ESCAPE_PARMSW;
  LPMCI_VD_ESCAPE_PARMS = ^tagMCI_VD_ESCAPE_PARMSW;

  { MCI extensions for CD audio devices }

  { flags for the dwItem field of the MCI_STATUS_PARMS parameter block }

const

  MCI_CDA_STATUS_TYPE_TRACK           = $00004001;

  { flags for the dwReturn field of MCI_STATUS_PARMS parameter block }
  { MCI_STATUS command, (dwItem == MCI_CDA_STATUS_TYPE_TRACK) }

  MCI_CDA_TRACK_AUDIO                 = (MCI_CD_OFFSET + 0);
  MCI_CDA_TRACK_OTHER                 = (MCI_CD_OFFSET + 1);

  { MCI extensions for waveform audio devices }

  MCI_WAVE_PCM                        = (MCI_WAVE_OFFSET + 0);
  MCI_WAVE_MAPPER                     = (MCI_WAVE_OFFSET + 1);

  { flags for the dwFlags parameter of MCI_OPEN command message }

  MCI_WAVE_OPEN_BUFFER                = $00010000;

  { flags for the dwFlags parameter of MCI_SET command message }

  MCI_WAVE_SET_FORMATTAG              = $00010000;
  MCI_WAVE_SET_CHANNELS               = $00020000;
  MCI_WAVE_SET_SAMPLESPERSEC          = $00040000;
  MCI_WAVE_SET_AVGBYTESPERSEC         = $00080000;
  MCI_WAVE_SET_BLOCKALIGN             = $00100000;
  MCI_WAVE_SET_BITSPERSAMPLE          = $00200000;

  { flags for the dwFlags parameter of MCI_STATUS, MCI_SET command messages }

  MCI_WAVE_INPUT                      = $00400000;
  MCI_WAVE_OUTPUT                     = $00800000;

  { flags for the dwItem field of MCI_STATUS_PARMS parameter block }

  MCI_WAVE_STATUS_FORMATTAG           = $00004001;
  MCI_WAVE_STATUS_CHANNELS            = $00004002;
  MCI_WAVE_STATUS_SAMPLESPERSEC       = $00004003;
  MCI_WAVE_STATUS_AVGBYTESPERSEC      = $00004004;
  MCI_WAVE_STATUS_BLOCKALIGN          = $00004005;
  MCI_WAVE_STATUS_BITSPERSAMPLE       = $00004006;
  MCI_WAVE_STATUS_LEVEL               = $00004007;

  { flags for the dwFlags parameter of MCI_SET command message }

  MCI_WAVE_SET_ANYINPUT               = $04000000;
  MCI_WAVE_SET_ANYOUTPUT              = $08000000;

  { flags for the dwFlags parameter of MCI_GETDEVCAPS command message }

  MCI_WAVE_GETDEVCAPS_INPUTS          = $00004001;
  MCI_WAVE_GETDEVCAPS_OUTPUTS         = $00004002;


  { parameter block for MCI_OPEN command message }

type

  PMCI_WAVE_OPEN_PARMSA = ^tagMCI_WAVE_OPEN_PARMSA;
  tagMCI_WAVE_OPEN_PARMSA = packed record
    dwCallback: DWORD_PTR;
    wDeviceID: MCIDEVICEID;
    lpstrDeviceType: PAnsiChar;
    lpstrElementName: PAnsiChar;
    lpstrAlias: PAnsiChar;
    dwBufferSeconds: DWORD;
  end;
  MCI_WAVE_OPEN_PARMSA = tagMCI_WAVE_OPEN_PARMSA;
  LPMCI_WAVE_OPEN_PARMSA = ^tagMCI_WAVE_OPEN_PARMSA;

  PMCI_WAVE_OPEN_PARMSW = ^tagMCI_WAVE_OPEN_PARMSW;
  tagMCI_WAVE_OPEN_PARMSW = packed record
    dwCallback: DWORD_PTR;
    wDeviceID: MCIDEVICEID;
    lpstrDeviceType: PWideChar;
    lpstrElementName: PWideChar;
    lpstrAlias: PWideChar;
    dwBufferSeconds: DWORD;
  end;
  MCI_WAVE_OPEN_PARMSW = tagMCI_WAVE_OPEN_PARMSW;
  LPMCI_WAVE_OPEN_PARMSW = ^tagMCI_WAVE_OPEN_PARMSW;

  { unicode }
  MCI_WAVE_OPEN_PARMS = tagMCI_WAVE_OPEN_PARMSW;
  PMCI_WAVE_OPEN_PARMS = ^tagMCI_WAVE_OPEN_PARMSW;
  LPMCI_WAVE_OPEN_PARMS = ^tagMCI_WAVE_OPEN_PARMSW;

  { parameter block for MCI_DELETE command message }

  PMCI_WAVE_DELETE_PARMS = ^tagMCI_WAVE_DELETE_PARMS;
  tagMCI_WAVE_DELETE_PARMS = packed record
    dwCallback: DWORD_PTR;
    dwFrom: DWORD;
    dwTo: DWORD;
  end;
  MCI_WAVE_DELETE_PARMS = tagMCI_WAVE_DELETE_PARMS;
  LPMCI_WAVE_DELETE_PARMS = ^tagMCI_WAVE_DELETE_PARMS;


  { parameter block for MCI_SET command message }

type

  PMCI_WAVE_SET_PARMS = ^tagMCI_WAVE_SET_PARMS;
  tagMCI_WAVE_SET_PARMS = packed record
    dwCallback: DWORD_PTR;
    dwTimeFormat: DWORD;
    dwAudio: DWORD;
    wInput: UINT;
    wOutput: UINT;
    wFormatTag: WORD;
    wReserved2: WORD;
    nChannels: WORD;
    wReserved3: WORD;
    nSamplesPerSec: DWORD;
    nAvgBytesPerSec: DWORD;
    nBlockAlign: WORD;
    wReserved4: WORD;
    wBitsPerSample: WORD;
    wReserved5: WORD;
  end;
  MCI_WAVE_SET_PARMS = tagMCI_WAVE_SET_PARMS;
  LPMCI_WAVE_SET_PARMS = ^tagMCI_WAVE_SET_PARMS;

  { MCI extensions for MIDI sequencer devices }

const

  { flags for the dwReturn field of MCI_STATUS_PARMS parameter block }
  { MCI_STATUS command, (dwItem == MCI_SEQ_STATUS_DIVTYPE) }

  MCI_SEQ_DIV_PPQN                    = (0 + MCI_SEQ_OFFSET);
  MCI_SEQ_DIV_SMPTE_24                = (1 + MCI_SEQ_OFFSET);
  MCI_SEQ_DIV_SMPTE_25                = (2 + MCI_SEQ_OFFSET);
  MCI_SEQ_DIV_SMPTE_30DROP            = (3 + MCI_SEQ_OFFSET);
  MCI_SEQ_DIV_SMPTE_30                = (4 + MCI_SEQ_OFFSET);

  { flags for the dwMaster field of MCI_SEQ_SET_PARMS parameter block }
  { MCI_SET command, (dwFlags == MCI_SEQ_SET_MASTER) }

  MCI_SEQ_FORMAT_SONGPTR              = $4001;
  MCI_SEQ_FILE                        = $4002;
  MCI_SEQ_MIDI                        = $4003;
  MCI_SEQ_SMPTE                       = $4004;
  MCI_SEQ_NONE                        = 65533;
  MCI_SEQ_MAPPER                      = 65535;

  { flags for the dwItem field of MCI_STATUS_PARMS parameter block }

  MCI_SEQ_STATUS_TEMPO                = $00004002;
  MCI_SEQ_STATUS_PORT                 = $00004003;
  MCI_SEQ_STATUS_SLAVE                = $00004007;
  MCI_SEQ_STATUS_MASTER               = $00004008;
  MCI_SEQ_STATUS_OFFSET               = $00004009;
  MCI_SEQ_STATUS_DIVTYPE              = $0000400A;
  MCI_SEQ_STATUS_NAME                 = $0000400B;
  MCI_SEQ_STATUS_COPYRIGHT            = $0000400C;

  { flags for the dwFlags parameter of MCI_SET command message }

  MCI_SEQ_SET_TEMPO                   = $00010000;
  MCI_SEQ_SET_PORT                    = $00020000;
  MCI_SEQ_SET_SLAVE                   = $00040000;
  MCI_SEQ_SET_MASTER                  = $00080000;
  MCI_SEQ_SET_OFFSET                  = $01000000;


  { parameter block for MCI_SET command message }

type

  PMCI_SEQ_SET_PARMS = ^tagMCI_SEQ_SET_PARMS;
  tagMCI_SEQ_SET_PARMS = packed record
    dwCallback: DWORD_PTR;
    dwTimeFormat: DWORD;
    dwAudio: DWORD;
    dwTempo: DWORD;
    dwPort: DWORD;
    dwSlave: DWORD;
    dwMaster: DWORD;
    dwOffset: DWORD;
  end;
  MCI_SEQ_SET_PARMS = tagMCI_SEQ_SET_PARMS;
  LPMCI_SEQ_SET_PARMS = ^tagMCI_SEQ_SET_PARMS;

  { MCI extensions for animation devices }

  { flags for dwFlags parameter of MCI_OPEN command message }

const

  MCI_ANIM_OPEN_WS                    = $00010000;
  MCI_ANIM_OPEN_PARENT                = $00020000;
  MCI_ANIM_OPEN_NOSTATIC              = $00040000;

  { flags for dwFlags parameter of MCI_PLAY command message }

  MCI_ANIM_PLAY_SPEED                 = $00010000;
  MCI_ANIM_PLAY_REVERSE               = $00020000;
  MCI_ANIM_PLAY_FAST                  = $00040000;
  MCI_ANIM_PLAY_SLOW                  = $00080000;
  MCI_ANIM_PLAY_SCAN                  = $00100000;

  { flags for dwFlags parameter of MCI_STEP command message }

  MCI_ANIM_STEP_REVERSE               = $00010000;
  MCI_ANIM_STEP_FRAMES                = $00020000;

  { flags for dwItem field of MCI_STATUS_PARMS parameter block }

  MCI_ANIM_STATUS_SPEED               = $00004001;
  MCI_ANIM_STATUS_FORWARD             = $00004002;
  MCI_ANIM_STATUS_HWND                = $00004003;
  MCI_ANIM_STATUS_HPAL                = $00004004;
  MCI_ANIM_STATUS_STRETCH             = $00004005;

  { flags for the dwFlags parameter of MCI_INFO command message }

  MCI_ANIM_INFO_TEXT                  = $00010000;

  { flags for dwItem field of MCI_GETDEVCAPS_PARMS parameter block }

  MCI_ANIM_GETDEVCAPS_CAN_REVERSE     = $00004001;
  MCI_ANIM_GETDEVCAPS_FAST_RATE       = $00004002;
  MCI_ANIM_GETDEVCAPS_SLOW_RATE       = $00004003;
  MCI_ANIM_GETDEVCAPS_NORMAL_RATE     = $00004004;
  MCI_ANIM_GETDEVCAPS_PALETTES        = $00004006;
  MCI_ANIM_GETDEVCAPS_CAN_STRETCH     = $00004007;
  MCI_ANIM_GETDEVCAPS_MAX_WINDOWS     = $00004008;

  { flags for the MCI_REALIZE command message }

  MCI_ANIM_REALIZE_NORM               = $00010000;
  MCI_ANIM_REALIZE_BKGD               = $00020000;

  { flags for dwFlags parameter of MCI_WINDOW command message }

  MCI_ANIM_WINDOW_HWND                = $00010000;
  MCI_ANIM_WINDOW_STATE               = $00040000;
  MCI_ANIM_WINDOW_TEXT                = $00080000;
  MCI_ANIM_WINDOW_ENABLE_STRETCH      = $00100000;
  MCI_ANIM_WINDOW_DISABLE_STRETCH     = $00200000;

  { flags for hWnd field of MCI_ANIM_WINDOW_PARMS parameter block }
  { MCI_WINDOW command message, (dwFlags = MCI_ANIM_WINDOW_HWND) }

  MCI_ANIM_WINDOW_DEFAULT             = $00000000;

  { flags for dwFlags parameter of MCI_PUT command message }

  MCI_ANIM_RECT                       = $00010000;
  MCI_ANIM_PUT_SOURCE                 = $00020000;
  MCI_ANIM_PUT_DESTINATION            = $00040000;

  { flags for dwFlags parameter of MCI_WHERE command message }

  MCI_ANIM_WHERE_SOURCE               = $00020000;
  MCI_ANIM_WHERE_DESTINATION          = $00040000;

  { flags for dwFlags parameter of MCI_UPDATE command message }

  MCI_ANIM_UPDATE_HDC                 = $00020000;


  { parameter block for MCI_OPEN command message }

type

  PMCI_ANIM_OPEN_PARMSA = ^tagMCI_ANIM_OPEN_PARMSA;
  tagMCI_ANIM_OPEN_PARMSA = packed record
    dwCallback: DWORD_PTR;
    wDeviceID: MCIDEVICEID;
    lpstrDeviceType: PAnsiChar;
    lpstrElementName: PAnsiChar;
    lpstrAlias: PAnsiChar;
    dwStyle: DWORD;
    hWndParent: HWND;
  end;
  MCI_ANIM_OPEN_PARMSA = tagMCI_ANIM_OPEN_PARMSA;
  LPMCI_ANIM_OPEN_PARMSA = ^tagMCI_ANIM_OPEN_PARMSA;

  PMCI_ANIM_OPEN_PARMSW = ^tagMCI_ANIM_OPEN_PARMSW;
  tagMCI_ANIM_OPEN_PARMSW = packed record
    dwCallback: DWORD_PTR;
    wDeviceID: MCIDEVICEID;
    lpstrDeviceType: PWideChar;
    lpstrElementName: PWideChar;
    lpstrAlias: PWideChar;
    dwStyle: DWORD;
    hWndParent: HWND;
  end;
  MCI_ANIM_OPEN_PARMSW = tagMCI_ANIM_OPEN_PARMSW;
  LPMCI_ANIM_OPEN_PARMSW = ^tagMCI_ANIM_OPEN_PARMSW;

  { unicode }
  MCI_ANIM_OPEN_PARMS = tagMCI_ANIM_OPEN_PARMSW;
  PMCI_ANIM_OPEN_PARMS = ^tagMCI_ANIM_OPEN_PARMSW;
  LPMCI_ANIM_OPEN_PARMS = ^tagMCI_ANIM_OPEN_PARMSW;


  { parameter block for MCI_PLAY command message }

  PMCI_ANIM_PLAY_PARMS = ^tagMCI_ANIM_PLAY_PARMS;
  tagMCI_ANIM_PLAY_PARMS = packed record
    dwCallback: DWORD_PTR;
    dwFrom: DWORD;
    dwTo: DWORD;
    dwSpeed: DWORD;
  end;
  MCI_ANIM_PLAY_PARMS = tagMCI_ANIM_PLAY_PARMS;
  LPMCI_ANIM_PLAY_PARMS = ^tagMCI_ANIM_PLAY_PARMS;


  { parameter block for MCI_STEP command message }

  PMCI_ANIM_STEP_PARMS = ^tagMCI_ANIM_STEP_PARMS;
  tagMCI_ANIM_STEP_PARMS = packed record
    dwCallback: DWORD_PTR;
    dwFrames: DWORD;
  end;
  MCI_ANIM_STEP_PARMS = tagMCI_ANIM_STEP_PARMS;
  LPMCI_ANIM_STEP_PARMS = ^tagMCI_ANIM_STEP_PARMS;


  { parameter block for MCI_WINDOW command message }

  PMCI_ANIM_WINDOW_PARMSA = ^tagMCI_ANIM_WINDOW_PARMSA;
  tagMCI_ANIM_WINDOW_PARMSA = packed record
    dwCallback: DWORD_PTR;
    hWnd: HWND;
    nCmdShow: UINT;
    lpstrText: PAnsiChar;
  end;
  MCI_ANIM_WINDOW_PARMSA = tagMCI_ANIM_WINDOW_PARMSA;
  LPMCI_ANIM_WINDOW_PARMSA = ^tagMCI_ANIM_WINDOW_PARMSA;

  PMCI_ANIM_WINDOW_PARMSW = ^tagMCI_ANIM_WINDOW_PARMSW;
  tagMCI_ANIM_WINDOW_PARMSW = packed record
    dwCallback: DWORD_PTR;
    hWnd: HWND;
    nCmdShow: UINT;
    lpstrText: PWideChar;
  end;
  MCI_ANIM_WINDOW_PARMSW = tagMCI_ANIM_WINDOW_PARMSW;
  LPMCI_ANIM_WINDOW_PARMSW = ^tagMCI_ANIM_WINDOW_PARMSW;

  { unicode }
  MCI_ANIM_WINDOW_PARMS = tagMCI_ANIM_WINDOW_PARMSW;
  PMCI_ANIM_WINDOW_PARMS = ^tagMCI_ANIM_WINDOW_PARMSW;
  LPMCI_ANIM_WINDOW_PARMS = ^tagMCI_ANIM_WINDOW_PARMSW;


  { parameter block for MCI_PUT, MCI_UPDATE, MCI_WHERE command messages }

  PMCI_ANIM_RECT_PARMS = ^MCI_ANIM_RECT_PARMS;
  tagMCI_ANIM_RECT_PARMS = packed record
    dwCallback: DWORD_PTR;
    rc: TRect;
  end;
  MCI_ANIM_RECT_PARMS = tagMCI_ANIM_RECT_PARMS;
  LPMCI_ANIM_RECT_PARMS = ^MCI_ANIM_RECT_PARMS;


  { parameter block for MCI_UPDATE PARMS }

  PMCI_ANIM_UPDATE_PARMS = ^tagMCI_ANIM_UPDATE_PARMS;
  tagMCI_ANIM_UPDATE_PARMS = packed record
    dwCallback: DWORD_PTR;
    rc: TRect;
    hDC: HDC;
  end;
  MCI_ANIM_UPDATE_PARMS = tagMCI_ANIM_UPDATE_PARMS;
  LPMCI_ANIM_UPDATE_PARMS = ^tagMCI_ANIM_UPDATE_PARMS;

  { MCI extensions for video overlay devices }

const

  { flags for dwFlags parameter of MCI_OPEN command message }

  MCI_OVLY_OPEN_WS                    = $00010000;
  MCI_OVLY_OPEN_PARENT                = $00020000;

  { flags for dwFlags parameter of MCI_STATUS command message }

  MCI_OVLY_STATUS_HWND                = $00004001;
  MCI_OVLY_STATUS_STRETCH             = $00004002;

  { flags for dwFlags parameter of MCI_INFO command message }

  MCI_OVLY_INFO_TEXT                  = $00010000;

  { flags for dwItem field of MCI_GETDEVCAPS_PARMS parameter block }

  MCI_OVLY_GETDEVCAPS_CAN_STRETCH     = $00004001;
  MCI_OVLY_GETDEVCAPS_CAN_FREEZE      = $00004002;
  MCI_OVLY_GETDEVCAPS_MAX_WINDOWS     = $00004003;

  { flags for dwFlags parameter of MCI_WINDOW command message }

  MCI_OVLY_WINDOW_HWND                = $00010000;
  MCI_OVLY_WINDOW_STATE               = $00040000;
  MCI_OVLY_WINDOW_TEXT                = $00080000;
  MCI_OVLY_WINDOW_ENABLE_STRETCH      = $00100000;
  MCI_OVLY_WINDOW_DISABLE_STRETCH     = $00200000;

  { flags for hWnd parameter of MCI_OVLY_WINDOW_PARMS parameter block }

  MCI_OVLY_WINDOW_DEFAULT             = $00000000;

  { flags for dwFlags parameter of MCI_PUT command message }

  MCI_OVLY_RECT                       = $00010000;
  MCI_OVLY_PUT_SOURCE                 = $00020000;
  MCI_OVLY_PUT_DESTINATION            = $00040000;
  MCI_OVLY_PUT_FRAME                  = $00080000;
  MCI_OVLY_PUT_VIDEO                  = $00100000;

  { flags for dwFlags parameter of MCI_WHERE command message }

  MCI_OVLY_WHERE_SOURCE               = $00020000;
  MCI_OVLY_WHERE_DESTINATION          = $00040000;
  MCI_OVLY_WHERE_FRAME                = $00080000;
  MCI_OVLY_WHERE_VIDEO                = $00100000;


  { parameter block for MCI_OPEN command message }

type

  tagMCI_OVLY_OPEN_PARMSA = packed record
    dwCallback: DWORD_PTR;
    wDeviceID: MCIDEVICEID;
    lpstrDeviceType: PAnsiChar;
    lpstrElementName: PAnsiChar;
    lpstrAlias: PAnsiChar;
    dwStyle: DWORD;
    hWndParent: HWND;
  end;
  MCI_OVLY_OPEN_PARMSA = tagMCI_OVLY_OPEN_PARMSA;
  PMCI_OVLY_OPEN_PARMSA = ^tagMCI_OVLY_OPEN_PARMSA;
  LPMCI_OVLY_OPEN_PARMSA = ^tagMCI_OVLY_OPEN_PARMSA;

  tagMCI_OVLY_OPEN_PARMSW = packed record
    dwCallback: DWORD_PTR;
    wDeviceID: MCIDEVICEID;
    lpstrDeviceType: PWideChar;
    lpstrElementName: PWideChar;
    lpstrAlias: PWideChar;
    dwStyle: DWORD;
    hWndParent: HWND;
  end;
  MCI_OVLY_OPEN_PARMSW = tagMCI_OVLY_OPEN_PARMSW;
  PMCI_OVLY_OPEN_PARMSW = ^tagMCI_OVLY_OPEN_PARMSW;
  LPMCI_OVLY_OPEN_PARMSW = ^tagMCI_OVLY_OPEN_PARMSW;

  { unicode }
  MCI_OVLY_OPEN_PARMS = tagMCI_OVLY_OPEN_PARMSW;
  PMCI_OVLY_OPEN_PARMS = ^tagMCI_OVLY_OPEN_PARMSW;
  LPMCI_OVLY_OPEN_PARMS = ^tagMCI_OVLY_OPEN_PARMSW;


  { parameter block for MCI_WINDOW command message }

  tagMCI_OVLY_WINDOW_PARMSA = packed record
    dwCallback: DWORD_PTR;
    hWnd: HWND;
    nCmdShow: UINT;
    lpstrText: PAnsiChar;
  end;
  MCI_OVLY_WINDOW_PARMSA = tagMCI_OVLY_WINDOW_PARMSA;
  PMCI_OVLY_WINDOW_PARMSA = ^tagMCI_OVLY_WINDOW_PARMSA;
  LPMCI_OVLY_WINDOW_PARMSA = ^tagMCI_OVLY_WINDOW_PARMSA;

  tagMCI_OVLY_WINDOW_PARMSW = packed record
    dwCallback: DWORD_PTR;
    hWnd: HWND;
    nCmdShow: UINT;
    lpstrText: PWideChar;
  end;
  MCI_OVLY_WINDOW_PARMSW = tagMCI_OVLY_WINDOW_PARMSW;
  PMCI_OVLY_WINDOW_PARMSW = ^tagMCI_OVLY_WINDOW_PARMSW;
  LPMCI_OVLY_WINDOW_PARMSW = ^tagMCI_OVLY_WINDOW_PARMSW;

  { unicode }
  MCI_OVLY_WINDOW_PARMS = tagMCI_OVLY_WINDOW_PARMSW;
  PMCI_OVLY_WINDOW_PARMS = ^tagMCI_OVLY_WINDOW_PARMSW;
  LPMCI_OVLY_WINDOW_PARMS = ^tagMCI_OVLY_WINDOW_PARMSW;


  { parameter block for MCI_PUT, MCI_UPDATE, and MCI_WHERE command messages }

  PMCI_OVLY_RECT_PARMS = ^tagMCI_OVLY_RECT_PARMS;
  tagMCI_OVLY_RECT_PARMS = packed record
    dwCallback: DWORD_PTR;
    rc: TRect;
  end;
  MCI_OVLY_RECT_PARMS = tagMCI_OVLY_RECT_PARMS;
  LPMCI_OVLY_RECT_PARMS = ^tagMCI_OVLY_RECT_PARMS;


  { parameter block for MCI_SAVE command message }

  PMCI_OVLY_SAVE_PARMSA = ^tagMCI_OVLY_SAVE_PARMSA;
  tagMCI_OVLY_SAVE_PARMSA = packed record
    dwCallback: DWORD_PTR;
    lpfilename: PAnsiChar;
    rc: TRect;
  end;
  MCI_OVLY_SAVE_PARMSA = tagMCI_OVLY_SAVE_PARMSA;
  LPMCI_OVLY_SAVE_PARMSA = ^tagMCI_OVLY_SAVE_PARMSA;

  PMCI_OVLY_SAVE_PARMSW = ^tagMCI_OVLY_SAVE_PARMSW;
  tagMCI_OVLY_SAVE_PARMSW = packed record
    dwCallback: DWORD_PTR;
    lpfilename: PWideChar;
    rc: TRect;
  end;
  MCI_OVLY_SAVE_PARMSW = tagMCI_OVLY_SAVE_PARMSW;
  LPMCI_OVLY_SAVE_PARMSW = ^tagMCI_OVLY_SAVE_PARMSW;

  { unicode }
  MCI_OVLY_SAVE_PARMS = tagMCI_OVLY_SAVE_PARMSW;
  PMCI_OVLY_SAVE_PARMS = ^tagMCI_OVLY_SAVE_PARMSW;
  LPMCI_OVLY_SAVE_PARMS = ^tagMCI_OVLY_SAVE_PARMSW;


  { parameter block for MCI_LOAD command message }

  PMCI_OVLY_LOAD_PARMSA = ^tagMCI_OVLY_LOAD_PARMSA;
  tagMCI_OVLY_LOAD_PARMSA = packed record
    dwCallback: DWORD_PTR;
    lpfilename: PAnsiChar;
    rc: TRect;
  end;
  MCI_OVLY_LOAD_PARMSA = tagMCI_OVLY_LOAD_PARMSA;
  LPMCI_OVLY_LOAD_PARMSA = ^tagMCI_OVLY_LOAD_PARMSA;

  PMCI_OVLY_LOAD_PARMSW = ^tagMCI_OVLY_LOAD_PARMSW;
  tagMCI_OVLY_LOAD_PARMSW = packed record
    dwCallback: DWORD_PTR;
    lpfilename: PWideChar;
    rc: TRect;
  end;
  MCI_OVLY_LOAD_PARMSW = tagMCI_OVLY_LOAD_PARMSW;
  LPMCI_OVLY_LOAD_PARMSW = ^tagMCI_OVLY_LOAD_PARMSW;

  { unicode }
  MCI_OVLY_LOAD_PARMS = tagMCI_OVLY_LOAD_PARMSW;
  PMCI_OVLY_LOAD_PARMS = ^tagMCI_OVLY_LOAD_PARMSW;
  LPMCI_OVLY_LOAD_PARMS = ^tagMCI_OVLY_LOAD_PARMSW;


  //
  // APIs moved from mmddk.h - function prototypes for MCI driver functions
  //

  function mciGetDriverData(wDeviceID: MCIDEVICEID): DWORD_PTR; stdcall;

  function mciLoadCommandResource(hInstance: THandle;
                                  lpResName: PWideChar;
                                  wType: UINT): UINT; stdcall;

  function mciSetDriverData(wDeviceID: MCIDEVICEID;
                            dwData: DWORD_PTR): BOOL; stdcall;

  function mciDriverYield(wDeviceID: MCIDEVICEID): UINT; stdcall;

  function mciDriverNotify(hwndCallback: THandle;
                           wDeviceID: MCIDEVICEID;
                           uStatus: UINT): BOOL; stdcall;

  function mciFreeCommandResource(wTable: UINT): BOOL; stdcall;

  // Additional Prototypes for ALL interfaces

  // End of Additional Prototypes

implementation

const
  MCIApiLib = 'winmm.dll';

function mciSendCommandA; external MCIApiLib name 'mciSendCommandA';
function mciSendCommandW; external MCIApiLib name 'mciSendCommandW';
function mciSendCommand; external MCIApiLib name 'mciSendCommandW';

function mciSendStringA; external MCIApiLib name 'mciSendStringA';
function mciSendStringW; external MCIApiLib name 'mciSendStringW';
function mciSendString; external MCIApiLib name 'mciSendStringW';

function mciGetDeviceIDA; external MCIApiLib name 'mciGetDeviceIDA';
function mciGetDeviceIDW; external MCIApiLib name 'mciGetDeviceIDW';
function mciGetDeviceID; external MCIApiLib name 'mciGetDeviceIDW';

function mciGetDeviceIDFromElementIDA; external MCIApiLib name 'mciGetDeviceIDFromElementIDA';
function mciGetDeviceIDFromElementIDW; external MCIApiLib name 'mciGetDeviceIDFromElementIDW';
function mciGetDeviceIDFromElementID; external MCIApiLib name 'mciGetDeviceIDFromElementIDW';

function mciGetErrorStringA; external MCIApiLib name 'mciGetErrorStringA';
function mciGetErrorStringW; external MCIApiLib name 'mciGetErrorStringW';
function mciGetErrorString; external MCIApiLib name 'mciGetErrorStringW';

function mciSetYieldProc; external MCIApiLib name 'mciSetYieldProc';
function mciGetCreatorTask; external MCIApiLib name 'mciGetCreatorTask';
function mciGetYieldProc; external MCIApiLib name 'mciGetYieldProc';

// APIs moved from mmddk.h
function mciGetDriverData; external MCIApiLib name 'mciGetDriverData';
function mciLoadCommandResource; external MCIApiLib name 'mciLoadCommandResource';
function mciSetDriverData; external MCIApiLib name 'mciSetDriverData';
function mciDriverYield; external MCIApiLib name 'mciDriverYield';
function mciDriverNotify; external MCIApiLib name 'mciDriverNotify';
function mciFreeCommandResource; external MCIApiLib name 'mciFreeCommandResource';


// Converted Macro's

function MCI_MSF_MINUTE(msf: DWord): Byte;
begin
  Result := Byte(msf and $FF);
end;

function MCI_MSF_SECOND(msf: DWord): Byte;
begin
  Result := Byte((msf shr 8) and $FF);
end;

function MCI_MSF_FRAME(msf: DWord): Byte;
begin
  Result := Byte((msf shr 16) and $FF);
end;

function MCI_MAKE_MSF(m: Byte;
                      s: Byte;
                      f: Byte): DWord;
begin
  Result := DWORD(m) or (DWORD(s) shl 8) or (DWORD(f) shl 16);
end;

function MCI_TMSF_TRACK(tmsf: DWord): Byte;
begin
  Result := Byte(tmsf and $FF);
end;

function MCI_TMSF_MINUTE(tmsf: DWord): Byte;
begin
  Result := Byte((tmsf shr 8) and $FF);
end;

function MCI_TMSF_SECOND(tmsf: DWord): Byte;
begin
  Result := Byte((tmsf shr 16) and $FF);
end;

function MCI_TMSF_FRAME(tmsf: DWord): Byte;
begin
  Result := Byte((tmsf shr 24) and $FF);
end;

function MCI_MAKE_TMSF(t: Byte;
                       m: Byte;
                       s: Byte;
                       f: Byte): DWord;
begin
  Result := DWORD(t) or (DWORD(m) shl 8) or (DWORD(s) shl 16) or (DWORD(f) shl 24);
end;

function MCI_HMS_HOUR(hms: DWord): Byte;
begin
  Result := Byte(hms and $FF);
end;

function MCI_HMS_MINUTE(hms: DWord): Byte;
begin
  Result := Byte((hms shr 8) and $FF);
end;

function MCI_HMS_SECOND(hms: DWord): Byte;
begin
  Result := Byte((hms shr 16) and $FF);
end;

function MCI_MAKE_HMS(h: Byte;
                      m: Byte;
                      s: Byte): DWord;
begin
  Result := DWORD(h) or (DWORD(m) shl 8) or (DWORD(s) shl 16);
end;




end.
