// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.WinMM.MMDdk.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 22-05-2016
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: Include file for Multimedia Device Development Kit.
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
// Source: mmddk.h
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
unit WinApi.WinMM.MMDdk;

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
  MMSystem;



{$ifndef _INC_MMDDK}
{$define _INC_MMDDK}



//    If defined, the following flags inhibit inclusion
//    of the indicated items:
//
//        MMNOMIDIDEV         - MIDI support
//        MMNOWAVEDEV         - Waveform support
//        MMNOAUXDEV          - Auxiliary output support
//        MMNOMIXERDEV        - Mixer support
//        MMNOTIMERDEV        - Timer support
//        MMNOJOYDEV          - Joystick support
//        MMNOMCIDEV          - MCI support
//        MMNOTASKDEV         - Task support
//

{$ifdef MMNOTIMER}
  {$define MMNOTIMERDEV}
{$endif}
{$ifdef MMNOWAVE}
  {$define MMNOWAVEDEV}
{$endif}
{$ifdef MMNOMIDI}
  {$define MMNOMIDIDEV}
{$endif}
{$ifdef MMNOAUX}
  {$define MMNOAUXDEV}
{$endif}
{$ifdef MMNOJOY}
  {$define MMNOJOYDEV}
{$endif}
{$ifdef MMNOMMIO}
  {$define MMNOMMIODEV}
{$endif}
{$ifdef MMNOMCI}
  {$define MMNOMCIDEV}
{$endif}


///*****************************************************************************
//
//                      Helper functions for drivers
//
///*****************************************************************************

{$ifndef NODRIVERS}
const

  DRV_LOAD                            = $0001;
  DRV_ENABLE                          = $0002;
  DRV_OPEN                            = $0003;
  DRV_CLOSE                           = $0004;
  DRV_DISABLE                         = $0005;
  DRV_FREE                            = $0006;
  DRV_CONFIGURE                       = $0007;
  DRV_QUERYCONFIGURE                  = $0008;
  DRV_INSTALL                         = $0009;
  DRV_REMOVE                          = $000A;

  DRV_RESERVED                        = $0800;
  DRV_USER                            = $4000;

  DRIVERS_SECTION                     = 'DRIVERS32';  // Section name for installed drivers
  MCI_SECTION                         = 'MCI32';  // Section name for installed MCI drivers

{$endif} // NODRIVERS

  DCB_NOSWITCH                        = $0008;  // don't switch stacks for callback
  DCB_TYPEMASK                        = $0007;  // callback type mask
  DCB_NULL                            = $0000;  // unknown callback type

  // flags for wFlags parameter of DriverCallback()
  DCB_WINDOW                          = $0001;  // dwCallback is a HWND
  DCB_TASK                            = $0002;  // dwCallback is a HTASK
  DCB_FUNCTION                        = $0003;  // dwCallback is a FARPROC
  DCB_EVENT                           = $0005;  // dwCallback is an EVENT


  // generic prototype for audio device driver entry-point functions
  // midMessage(), modMessage(), widMessage(), wodMessage(), auxMessage()
type

  PSounddevmsgproc = ^TSounddevmsgproc;
  LPSOUNDDEVMSGPROC = ^SOUNDDEVMSGPROC;
  SOUNDDEVMSGPROC = DWORD;
  TSounddevmsgproc = DWORD;

const
  DRVM_INIT                           = 100;
  DRVM_EXIT                           = 101;
  DRVM_DISABLE                        = 102;
  DRVM_ENABLE                         = 103;
  DRVM_INIT_EX                        = 104;


// message base for driver specific messages.
//
{$ifndef DRVM_MAPPER}
  DRVM_MAPPER                         = $2000;
{$endif}
  DRVM_USER                           = $4000;
  DRVM_MAPPER_STATUS                  = (DRVM_MAPPER + 0);
  DRVM_MAPPER_RECONFIGURE             = (DRVM_MAPPER + 1);
  DRVM_MAPPER_PREFERRED_GET           = (DRVM_MAPPER + 21);
  DRVM_MAPPER_CONSOLEVOICECOM_GET     = (DRVM_MAPPER + 23);

  DRV_QUERYDEVNODE                    = (DRV_RESERVED + 2);
  DRV_QUERYMAPPABLE                   = (DRV_RESERVED + 5);
  DRV_QUERYMODULE                     = (DRV_RESERVED + 9);
  DRV_PNPINSTALL                      = (DRV_RESERVED + 11);
  DRV_QUERYDEVICEINTERFACE            = (DRV_RESERVED + 12);
  DRV_QUERYDEVICEINTERFACESIZE        = (DRV_RESERVED + 13);
  DRV_QUERYSTRINGID                   = (DRV_RESERVED + 14);
  DRV_QUERYSTRINGIDSIZE               = (DRV_RESERVED + 15);
  DRV_QUERYIDFROMSTRINGID             = (DRV_RESERVED + 16);
  DRV_QUERYFUNCTIONINSTANCEID         = (DRV_RESERVED + 17);
  DRV_QUERYFUNCTIONINSTANCEIDSIZE     = (DRV_RESERVED + 18);

  //
  // DRVM_MAPPER_PREFERRED_GET flags
  //
  DRVM_MAPPER_PREFERRED_FLAGS_PREFERREDONLY = $00000001;



  //
  // messages that have IOCTL format
  //    dw1 = NULL or handle
  //    dw2 = NULL or ptr to DRVM_IOCTL_DATA
  //    return is MMRESULT
  //
  DRVM_IOCTL                          = $100;
  DRVM_ADD_THRU                       = (DRVM_IOCTL + 1);
  DRVM_REMOVE_THRU                    = (DRVM_IOCTL + 2);
  DRVM_IOCTL_LAST                     = (DRVM_IOCTL + 5);

type

  LPDRVM_IOCTL_DATA = ^DRVM_IOCTL_DATA;
  DRVM_IOCTL_DATA = packed record
    dwSize: DWORD;                   // size of this structure (inclusive)
    dwCmd: DWORD;                   // IOCTL command code, 0x80000000 and above reserved for system
  end;

const
  // command code ranges for dwCmd field of DRVM_IOCTL message
  // codes from 0 to $7FFFFFFF are user defined
  // codes from $80000000 to $FFFFFFFF are reserved for future
  // definition by microsoft
  //
  DRVM_IOCTL_CMD_USER                 = $00000000;
  DRVM_IOCTL_CMD_SYSTEM               = $80000000;

  // device ID for 386 AUTODMA VxD
  VADMAD_Device_ID                    = $0444;

type
  // PnP version of media device caps

  PMDEVICECAPSEX = ^MDEVICECAPSEX;
  MDEVICECAPSEX = packed record
    cbSize: DWORD;
    pCaps: Pointer;
  end;

const
{$ifndef MMNOWAVEDEV}
  ///*****************************************************************************
  //
  //                     Waveform device driver support
  //
  ///*****************************************************************************

  WODM_INIT                           = DRVM_INIT;
  WIDM_INIT                           = DRVM_INIT;
  WODM_INIT_EX                        = DRVM_INIT_EX;
  WIDM_INIT_EX                        = DRVM_INIT_EX;

type

  // waveform input and output device open information structure
  LPWAVEOPENDESC = ^WAVEOPENDESC;
  Pwaveopendesc_tag = ^waveopendesc_tag;
  waveopendesc_tag = packed record
    hWave: HWAVE;                    // handle
    lpFormat: PWAVEFORMAT;           // format of wave data
    dwCallback: DWORD_PTR;           // callback
    dwInstance: DWORD_PTR;           // app's private instance information
    uMappedDeviceID: UINT;           // device to map to if WAVE_MAPPED set
    dnDevNode: DWORD_PTR;           { if device is PnP }
  end;
  WAVEOPENDESC = waveopendesc_tag;


const

  // messages sent to wodMessage() entry-point function
  WODM_GETNUMDEVS                     = 3;
  WODM_GETDEVCAPS                     = 4;
  WODM_OPEN                           = 5;
  WODM_CLOSE                          = 6;
  WODM_PREPARE                        = 7;
  WODM_UNPREPARE                      = 8;
  WODM_WRITE                          = 9;
  WODM_PAUSE                          = 10;
  WODM_RESTART                        = 11;
  WODM_RESET                          = 12;
  WODM_GETPOS                         = 13;
  WODM_GETPITCH                       = 14;
  WODM_SETPITCH                       = 15;
  WODM_GETVOLUME                      = 16;
  WODM_SETVOLUME                      = 17;
  WODM_GETPLAYBACKRATE                = 18;
  WODM_SETPLAYBACKRATE                = 19;
  WODM_BREAKLOOP                      = 20;
  WODM_PREFERRED                      = 21;
// #if (WINVER >= 0x030B)
  WODM_MAPPER_STATUS                  = (DRVM_MAPPER_STATUS + 0);
  WAVEOUT_MAPPER_STATUS_DEVICE        = 0;
  WAVEOUT_MAPPER_STATUS_MAPPED        = 1;
  WAVEOUT_MAPPER_STATUS_FORMAT        = 2;
// #endif // WINVER >= 0x030B
  WODM_BUSY                           = 21;

  // messages sent to widMessage() entry-point function
  WIDM_GETNUMDEVS                     = 50;
  WIDM_GETDEVCAPS                     = 51;
  WIDM_OPEN                           = 52;
  WIDM_CLOSE                          = 53;
  WIDM_PREPARE                        = 54;
  WIDM_UNPREPARE                      = 55;
  WIDM_ADDBUFFER                      = 56;
  WIDM_START                          = 57;
  WIDM_STOP                           = 58;
  WIDM_RESET                          = 59;
  WIDM_GETPOS                         = 60;
  WIDM_PREFERRED                      = 61;
// #if (WINVER >= 0x030B)
  WIDM_MAPPER_STATUS                  = (DRVM_MAPPER_STATUS + 0);
  WAVEIN_MAPPER_STATUS_DEVICE         = 0;
  WAVEIN_MAPPER_STATUS_MAPPED         = 1;
  WAVEIN_MAPPER_STATUS_FORMAT         = 2;
// #endif // WINVER >= 0x30B

{$endif} // ifndef MMNOWAVEDEV


{$ifndef MMNOMIDIDEV}

  ///*****************************************************************************
  //
  //                          MIDI device driver support
  //
  ///*****************************************************************************

const

  MODM_USER                           = DRVM_USER;
  MIDM_USER                           = DRVM_USER;
  MODM_MAPPER                         = DRVM_MAPPER;
  MIDM_MAPPER                         = DRVM_MAPPER;

  MODM_INIT                           = DRVM_INIT;
  MIDM_INIT                           = DRVM_INIT;
  MODM_INIT_EX                        = DRVM_INIT_EX;
  MIDM_INIT_EX                        = DRVM_INIT_EX;

{$ifndef MMNOMIDI}   // This protects the definition of HMIDI in WINMM.H
                     // Win 3.1 works the same way
type
  PMIDIOPENSTRMID = ^MIDIOPENSTRMID;
  PMidiopenstrmid_tag = ^midiopenstrmid_tag;
  midiopenstrmid_tag = packed record
    dwStreamID: DWORD;
    uDeviceID: UINT;
  end;
  MIDIOPENSTRMID = midiopenstrmid_tag;

  // MIDI input and output device open information structure

  PMidiopendesc_tag = ^midiopendesc_tag;
  LPMIDIOPENDESC = ^MIDIOPENDESC;
  PMIDIOPENDESC = ^MIDIOPENDESC;
  midiopendesc_tag = packed record
    hMidi: HMIDI;                           // handle
    dwCallback: DWORD_PTR;                  // callback
    dwInstance: DWORD_PTR;                  // app's private instance information
    dnDevNode: DWORD_PTR;                   // DevNode
    cIds: DWORD;                            // If stream open, # stream ids
    rgIds: array [0..0] of MIDIOPENSTRMID;  // Array of device ID's (actually [cIds])
  end;
  MIDIOPENDESC = midiopendesc_tag;
{$endif} // MMNOMIDI

const

// Flags for MODM_OPEN
  MIDI_IO_PACKED                      = $00000000;  { Compatibility mode }
  MIDI_IO_COOKED                      = $00000002;

// messages sent to modMessage() entry-point function
  MODM_GETNUMDEVS                     = 1;
  MODM_GETDEVCAPS                     = 2;
  MODM_OPEN                           = 3;
  MODM_CLOSE                          = 4;
  MODM_PREPARE                        = 5;
  MODM_UNPREPARE                      = 6;
  MODM_DATA                           = 7;
  MODM_LONGDATA                       = 8;
  MODM_RESET                          = 9;
  MODM_GETVOLUME                      = 10;
  MODM_SETVOLUME                      = 11;
  MODM_CACHEPATCHES                   = 12;
  MODM_CACHEDRUMPATCHES               = 13;

// {$if WINVER >= 400}
  MODM_STRMDATA                       = 14;
  MODM_GETPOS                         = 17;
  MODM_PAUSE                          = 18;
  MODM_RESTART                        = 19;
  MODM_STOP                           = 20;
  MODM_PROPERTIES                     = 21;
  MODM_PREFERRED                      = 22;
  MODM_RECONFIGURE                    = (MODM_USER + $0768);
// {$endif}


// messages sent to midMessage() entry-point function
  MIDM_GETNUMDEVS                     = 53;
  MIDM_GETDEVCAPS                     = 54;
  MIDM_OPEN                           = 55;
  MIDM_CLOSE                          = 56;
  MIDM_PREPARE                        = 57;
  MIDM_UNPREPARE                      = 58;
  MIDM_ADDBUFFER                      = 59;
  MIDM_START                          = 60;
  MIDM_STOP                           = 61;
  MIDM_RESET                          = 62;

{$endif} // ifndef MMNOMIDIDEV


{$ifndef MMNOAUXDEV}
  ///*****************************************************************************
  //
  //                    Auxiliary audio device driver support
  //
  ///*****************************************************************************

  AUXM_INIT                           = DRVM_INIT;
  AUXM_INIT_EX                        = DRVM_INIT_EX;

  // messages sent to auxMessage() entry-point function
  AUXDM_GETNUMDEVS                    = 3;
  AUXDM_GETDEVCAPS                    = 4;
  AUXDM_GETVOLUME                     = 5;
  AUXDM_SETVOLUME                     = 6;

{$endif} // ifndef MMNOAUXDEV

// #if (WINVER >= 0x030B)
{$ifndef MMNOMIXERDEV}

type

  //
  //  mixer device open information structure
  //
  //

  PMIXEROPENDESC = ^_tMIXEROPENDESC;
  LPMIXEROPENDESC = ^_tMIXEROPENDESC;
  _tMIXEROPENDESC = packed record
    hmx: HMIXER;                     // handle that will be used
    pReserved0: Pointer;             // reserved--driver should ignore
    dwCallback: DWORD_PTR;           // callback
    dwInstance: DWORD_PTR;           // app's private instance information
    dnDevNode: DWORD_PTR;            // if device is PnP
  end;
  MIXEROPENDESC = _tMIXEROPENDESC;

const

  MXDM_INIT                           = DRVM_INIT;
  MXDM_INIT_EX                        = DRVM_INIT_EX;
  MXDM_USER                           = DRV_USER;

  MXDM_BASE                           = (1);
  MXDM_GETNUMDEVS                     = (MXDM_BASE + 0);
  MXDM_GETDEVCAPS                     = (MXDM_BASE + 1);
  MXDM_OPEN                           = (MXDM_BASE + 2);
  MXDM_CLOSE                          = (MXDM_BASE + 3);
  MXDM_GETLINEINFO                    = (MXDM_BASE + 4);
  MXDM_GETLINECONTROLS                = (MXDM_BASE + 5);
  MXDM_GETCONTROLDETAILS              = (MXDM_BASE + 6);
  MXDM_SETCONTROLDETAILS              = (MXDM_BASE + 7);

{$endif} // MMNOMIXERDEV
// #endif // ifdef WINVER >= 0x030B

{$ifndef MMNOTIMERDEV}
  ///*****************************************************************************
  //
  //                        Timer device driver support
  //
  // Note : This function is obsolete.
  // New applications should use CreateTimerQueueTimer to create a timer-queue timer.
  //
  ///*****************************************************************************
  //type
  //  PTimerevent = ^TTimerevent;
  //  LPTIMEREVENT = ^TIMEREVENT;
  //  timerevent_tag = packed record
  //    wDelay: WORD;                    // delay required
  //    wResolution: WORD;               // resolution required
  //    lpFunction: LPTIMECALLBACK;      // ptr to callback function
  //    dwUser: DWORD;                   // user DWORD
  //    wFlags: WORD;                    // defines how to program event
  //    wReserved1: WORD;                // structure packing
  //  end;
  //  TIMEREVENT = timerevent_tag;
  //  TTimerevent = timerevent_tag;

const

  // messages sent to tddMessage() function
  TDD_KILLTIMEREVENT                  = (DRV_RESERVED + 0);   // indices into a table of
  TDD_SETTIMEREVENT                   = (DRV_RESERVED + 4);   // functions; thus offset by
  TDD_GETSYSTEMTIME                   = (DRV_RESERVED + 8);   // four each time...
  TDD_GETDEVCAPS                      = (DRV_RESERVED + 12);  // room for future expansion
  TDD_BEGINMINPERIOD                  = (DRV_RESERVED + 16);  // room for future expansion
  TDD_ENDMINPERIOD                    = (DRV_RESERVED + 20);  // room for future expansion

{$endif} // ifndef MMNOTIMERDEV


{$ifndef MMNOJOYDEV}
  ///*****************************************************************************
  //
  //                       Joystick device driver support
  //
  ///*****************************************************************************

  // RegisterWindowMessage with this to get msg id of config changes
  JOY_CONFIGCHANGED_MSGSTRING         = 'MSJSTICK_VJOYD_MSGSTR';

  // pre-defined joystick types
  JOY_HW_NONE                         = 0;
  JOY_HW_CUSTOM                       = 1;
  JOY_HW_2A_2B_GENERIC                = 2;
  JOY_HW_2A_4B_GENERIC                = 3;
  JOY_HW_2B_GAMEPAD                   = 4;
  JOY_HW_2B_FLIGHTYOKE                = 5;
  JOY_HW_2B_FLIGHTYOKETHROTTLE        = 6;
  JOY_HW_3A_2B_GENERIC                = 7;
  JOY_HW_3A_4B_GENERIC                = 8;
  JOY_HW_4B_GAMEPAD                   = 9;
  JOY_HW_4B_FLIGHTYOKE                = 10;
  JOY_HW_4B_FLIGHTYOKETHROTTLE        = 11;
  JOY_HW_LASTENTRY                    = 12;

  // calibration flags
  JOY_ISCAL_XY                        = $00000001;  // XY are calibrated
  JOY_ISCAL_Z                         = $00000002;  // Z is calibrated
  JOY_ISCAL_R                         = $00000004;  // R is calibrated
  JOY_ISCAL_U                         = $00000008;  // U is calibrated
  JOY_ISCAL_V                         = $00000010;  // V is calibrated
  JOY_ISCAL_POV                       = $00000020;  // POV is calibrated
  // point of view constants
  JOY_POV_NUMDIRS                     = 4;
  JOY_POVVAL_FORWARD                  = 0;
  JOY_POVVAL_BACKWARD                 = 1;
  JOY_POVVAL_LEFT                     = 2;
  JOY_POVVAL_RIGHT                    = 3;

  // Specific settings for joystick hardware
  JOY_HWS_HASZ                        = $00000001;  // has Z info?
  JOY_HWS_HASPOV                      = $00000002;  // point of view hat present
  JOY_HWS_POVISBUTTONCOMBOS           = $00000004;  // pov done through combo of buttons
  JOY_HWS_POVISPOLL                   = $00000008;  // pov done through polling
  JOY_HWS_ISYOKE                      = $00000010;  // joystick is a flight yoke
  JOY_HWS_ISGAMEPAD                   = $00000020;  // joystick is a game pad
  JOY_HWS_ISCARCTRL                   = $00000040;  // joystick is a car controller
  // X defaults to J1 X axis
  JOY_HWS_XISJ1Y                      = $00000080;  // X is on J1 Y axis
  JOY_HWS_XISJ2X                      = $00000100;  // X is on J2 X axis
  JOY_HWS_XISJ2Y                      = $00000200;  // X is on J2 Y axis
  // Y defaults to J1 Y axis
  JOY_HWS_YISJ1X                      = $00000400;  // Y is on J1 X axis
  JOY_HWS_YISJ2X                      = $00000800;  // Y is on J2 X axis
  JOY_HWS_YISJ2Y                      = $00001000;  // Y is on J2 Y axis
  // Z defaults to J2 Y axis
  JOY_HWS_ZISJ1X                      = $00002000;  // Z is on J1 X axis
  JOY_HWS_ZISJ1Y                      = $00004000;  // Z is on J1 Y axis
  JOY_HWS_ZISJ2X                      = $00008000;  // Z is on J2 X axis
  // POV defaults to J2 Y axis, if it is not button based
  JOY_HWS_POVISJ1X                    = $00010000;  // pov done through J1 X axis
  JOY_HWS_POVISJ1Y                    = $00020000;  // pov done through J1 Y axis
  JOY_HWS_POVISJ2X                    = $00040000;  // pov done through J2 X axis
  // R defaults to J2 X axis
  JOY_HWS_HASR                        = $00080000;  // has R (4th axis) info
  JOY_HWS_RISJ1X                      = $00100000;  // R done through J1 X axis
  JOY_HWS_RISJ1Y                      = $00200000;  // R done through J1 Y axis
  JOY_HWS_RISJ2Y                      = $00400000;  // R done through J2 X axis
  // U & V for future hardware
  JOY_HWS_HASU                        = $00800000;  // has U (5th axis) info
  JOY_HWS_HASV                        = $01000000;  // has V (6th axis) info

  // Usage settings
  JOY_US_HASRUDDER                    = $00000001;  // joystick configured with rudder
  JOY_US_PRESENT                      = $00000002;  // is joystick actually present?
  JOY_US_ISOEM                        = $00000004;  // joystick is an OEM defined type

type

  // struct for storing x, y, z, and rudder values
  PJOYPOS = ^JOYPOS;
  LPJOYPOS = ^joypos_tag;
  PJoypos_tag = ^joypos_tag;
  joypos_tag = packed record
    dwX: DWORD;
    dwY: DWORD;
    dwZ: DWORD;
    dwR: DWORD;
    dwU: DWORD;
    dwV: DWORD;
  end;
  JOYPOS = joypos_tag;

  // struct for storing ranges
  LPJOYRANGE = ^joyrange_tag;
  PJoyrange = ^TJoyrange;
  joyrange_tag = packed record
    jpMin: JOYPOS;
    jpMax: JOYPOS;
    jpCenter: JOYPOS;
  end;
  JOYRANGE = joyrange_tag;
  TJoyrange = joyrange_tag;

  PJOYREGUSERVALUES = ^JOYREGUSERVALUES;
  LPJOYREGUSERVALUES = ^joyreguservalues_tag;
  PJoyreguservalues_tag = ^joyreguservalues_tag;
  joyreguservalues_tag = packed record
    dwTimeOut: DWORD;                // value at which to timeout joystick polling
    jrvRanges: JOYRANGE;             // range of values app wants returned for axes
    jpDeadZone: JOYPOS;              // area around center to be considered
                                     //   as "dead". specified as a percentage
                                     //   (0-100). Only X  Y handled by system driver
  end;
  JOYREGUSERVALUES = joyreguservalues_tag;

  PJOYREGHWSETTINGS = ^JOYREGHWSETTINGS;
  LPJOYHWSETTINGS = ^joyreghwsettings_tag;
  PJoyreghwsettings_tag = ^joyreghwsettings_tag;
  joyreghwsettings_tag = packed record
    dwFlags: DWORD;
    dwNumButtons: DWORD;            // number of buttons
  end;
  JOYREGHWSETTINGS = joyreghwsettings_tag;

// range of values returned by the hardware (filled in by calibration)

  LPJOYREGHWVALUES = ^joyreghwvalues_tag;
  PJoyreghwvalues = ^TJoyreghwvalues;
  joyreghwvalues_tag = packed record
    jrvHardware: JOYRANGE;                                 // values returned by hardware
    dwPOVValues: array[0..JOY_POV_NUMDIRS - 1] of DWORD;   // POV values returned by hardware
    dwCalFlags: DWORD;                                     // what has been calibrated
  end;
  JOYREGHWVALUES = joyreghwvalues_tag;
  TJoyreghwvalues = joyreghwvalues_tag;

  // hardware configuration
  PJOYREGHWCONFIG = ^JOYREGHWCONFIG;
  LPJOYREGHWCONFIG = ^joyreghwconfig_tag;
  PJoyreghwconfig_tag = ^joyreghwconfig_tag;
  joyreghwconfig_tag = packed record
    hws: JOYREGHWSETTINGS;           // hardware settings
    dwUsageSettings: DWORD;          // usage settings
    hwv: JOYREGHWVALUES;             // values returned by hardware
    dwType: DWORD;                   // type of joystick
    dwReserved: DWORD;               // reserved for OEM drivers
  end;
  JOYREGHWCONFIG = joyreghwconfig_tag;

  // joystick calibration info structure
  PJOYCALIBRATE = ^JOYCALIBRATE;
  LPJOYCALIBRATE = ^JOYCALIBRATE;
  PJoycalibrate_tag = ^joycalibrate_tag;
  joycalibrate_tag = packed record
    wXbase: WORD;
    wXdelta: WORD;
    wYbase: WORD;
    wYdelta: WORD;
    wZbase: WORD;
    wZdelta: WORD;
  end;
  JOYCALIBRATE = joycalibrate_tag;

  // prototype for joystick message function
  JOYDEVMSGPROC = function(dwId: DWORD;
                          uMsg: UINT;
                          lParam1: LONG;
                          lParam2: LONG): DWORD; cdecl;
  LPJOYDEVMSGPROC = JOYDEVMSGPROC;
  {$EXTERNALSYM LPJOYDEVMSGPROC}

const

  // messages sent to joystick driver's DriverProc() function
  JDD_GETNUMDEVS                      = (DRV_RESERVED + $0001);
  JDD_GETDEVCAPS                      = (DRV_RESERVED + $0002);
  JDD_GETPOS                          = (DRV_RESERVED + $0101);
  JDD_SETCALIBRATION                  = (DRV_RESERVED + $0102);
  JDD_CONFIGCHANGED                   = (DRV_RESERVED + $0103);
  JDD_GETPOSEX                        = (DRV_RESERVED + $0104);

{$endif} // ifndef MMNOJOYDEV


{$ifndef MMNOMCIDEV}
  //******************************************************************************
  //
  //                        MCI device driver support
  //
  //******************************************************************************


  // internal MCI messages
  MCI_OPEN_DRIVER                     = $0801;
  MCI_CLOSE_DRIVER                    = $0802;

  // string return values only used with MAKEMCIRESOURCE
  MCI_FALSE                           = (MCI_STRING_OFFSET + 19);
  MCI_TRUE                            = (MCI_STRING_OFFSET + 20);

  // resource string return values
  MCI_FORMAT_MILLISECONDS_S           = (MCI_STRING_OFFSET + 21);
  MCI_FORMAT_RETURN_BASE              = MCI_FORMAT_MILLISECONDS_S;
  MCI_FORMAT_HMS_S                    = (MCI_STRING_OFFSET + 22);
  MCI_FORMAT_MSF_S                    = (MCI_STRING_OFFSET + 23);
  MCI_FORMAT_FRAMES_S                 = (MCI_STRING_OFFSET + 24);
  MCI_FORMAT_SMPTE_24_S               = (MCI_STRING_OFFSET + 25);
  MCI_FORMAT_SMPTE_25_S               = (MCI_STRING_OFFSET + 26);
  MCI_FORMAT_SMPTE_30_S               = (MCI_STRING_OFFSET + 27);
  MCI_FORMAT_SMPTE_30DROP_S           = (MCI_STRING_OFFSET + 28);
  MCI_FORMAT_BYTES_S                  = (MCI_STRING_OFFSET + 29);
  MCI_FORMAT_SAMPLES_S                = (MCI_STRING_OFFSET + 30);
  MCI_FORMAT_TMSF_S                   = (MCI_STRING_OFFSET + 31);

  MCI_VD_FORMAT_TRACK_S               = (MCI_VD_OFFSET + 5);

  WAVE_FORMAT_PCM_S                   = (MCI_WAVE_OFFSET + 0);
  WAVE_MAPPER_S                       = (MCI_WAVE_OFFSET + 1);

  MCI_SEQ_MAPPER_S                    = (MCI_SEQ_OFFSET + 5);
  MCI_SEQ_FILE_S                      = (MCI_SEQ_OFFSET + 6);
  MCI_SEQ_MIDI_S                      = (MCI_SEQ_OFFSET + 7);
  MCI_SEQ_SMPTE_S                     = (MCI_SEQ_OFFSET + 8);
  MCI_SEQ_FORMAT_SONGPTR_S            = (MCI_SEQ_OFFSET + 9);
  MCI_SEQ_NONE_S                      = (MCI_SEQ_OFFSET + 10);
  MIDIMAPPER_S                        = (MCI_SEQ_OFFSET + 11);

  MCI_TABLE_NOT_PRESENT               = (UINT( -1));

type

  // parameters for internal version of MCI_OPEN message sent from
  // mciOpenDevice() to the driver
  PMCI_OPEN_DRIVER_PARMS = ^MCI_OPEN_DRIVER_PARMS;
  LPMCI_OPEN_DRIVER_PARMS = ^MCI_OPEN_DRIVER_PARMS;
  MCI_OPEN_DRIVER_PARMS = packed record
    wDeviceID: MCIDEVICEID;          // device ID
    lpstrParams: PWideChar;          // parameter string for entry in SYSTEM.INI
    wCustomCommandTable: UINT;       // custom command table ((-1) if none)
                                     // filled in by the driver
    wType: UINT;                     // driver type
                                     // filled in by the driver
  end;

const

  // maximum length of an MCI device type

  MCI_MAX_DEVICE_TYPE_LENGTH          = 80;

  // flags for mciSendCommandInternal() which direct mciSendString() how to
  // interpret the return value
  MCI_RESOURCE_RETURNED               = $00010000;  // resource ID
  MCI_COLONIZED3_RETURN               = $00020000;  // colonized ID, 3 bytes data
  MCI_COLONIZED4_RETURN               = $00040000;  // colonized ID, 4 bytes data
  MCI_INTEGER_RETURNED                = $00080000;  // integer conversion needed
  MCI_RESOURCE_DRIVER                 = $00100000;  // driver owns returned resource

  // invalid command table ID
  MCI_NO_COMMAND_TABLE                = UINT(-1);

  // command table information type tags
  MCI_COMMAND_HEAD                    = 0;
  MCI_STRING                          = 1;
  MCI_INTEGER                         = 2;
  MCI_END_COMMAND                     = 3;
  MCI_RETURN                          = 4;
  MCI_FLAG                            = 5;
  MCI_END_COMMAND_LIST                = 6;
  MCI_RECT                            = 7;
  MCI_CONSTANT                        = 8;
  MCI_END_CONSTANT                    = 9;
  MCI_HWND                            = 10;
  MCI_HPAL                            = 11;
  MCI_HDC                             = 12;

{$IFDEF WIN64}
  MCI_INTEGER64                       = 13;
{$endif} // _WIN64

{$endif} // ifndef MMNOMCIDEV


{$ifndef MMNOTASKDEV}
  //******************************************************************************
  //
  //                               Task support
  //
  //******************************************************************************

  // error return values
  TASKERR_NOTASKSUPPORT               = 1;
  TASKERR_OUTOFMEMORY                 = 2;


//type

  // task support function prototypes
  // typedef VOID (TASKCALLBACK) (dwInst: DWORD_PTR);

  // LPTASKCALLBACK = ^TASKCALLBACK;
  // {$EXTERNALSYM LPTASKCALLBACK}

  // The mmTaskCreate function is deprecated. Applications should not use this function.
  // function mmTaskCreate(lpfn: LPTASKCALLBACK;
  //                       var lphLP: THandle;
  //                       dwInst: DWORD_PTR): UINT; stdcall; deprecated 'Applications should not use this function.';

  // The mmTaskBlock function is deprecated. Applications should not use this function.
  // procedure mmTaskBlock(h: DWORD); stdcall; deprecated 'Applications should not use this function.';

  // The mmTaskSignal function is deprecated. Applications should not use this function.
  // function mmTaskSignal(h: DWORD): BOOL; stdcall; deprecated 'Applications should not use this function.';

  // The mmTaskYield function is deprecated. Applications should not use this function.
  // procedure mmTaskYield(); stdcall; deprecated 'Applications should not use this function.';

  // The mmGetCurrentTask function is deprecated. Applications should not use this function.
  // function mmGetCurrentTask(): DWORD; stdcall; deprecated 'Applications should not use this function.';


{$endif} // endif MMNOTASKDEV

{$define MMDDKINC}

{$endif} // _INC_MMDDK


  function MAKELRESULT(dwlow: WORD;
                       dwhigh: WORD): LRESULT; inline;

  function MAKEMCIRESOURCE(wRet: WORD;
                           wRes: WORD): LRESULT; inline;


  // Additional Prototypes for ALL interfaces

  // End of Additional Prototypes

implementation

const
  MmDdkLib = 'Winmm.dll';


function MAKELRESULT(dwlow: WORD;
                     dwhigh: WORD): LRESULT; inline;
begin
  Result := LRESULT(DWORD(dwlow) or (DWORD(dwhigh) shl 16));
end;

function MAKEMCIRESOURCE(wRet: WORD;
                         wRes: WORD): LRESULT; inline;
begin
  Result := MAKELRESULT(wRet,
                        wRes);
end;

// External
// DEPRECATED! /////////////////////////////////////////////////////////////////
//  function mmTaskCreate;     external MmDdkLib name 'mmTaskCreate';
//  procedure mmTaskBlock;     external MmDdkLib name 'mmTaskBlock';
//  function mmTaskSignal;     external MmDdkLib name 'mmTaskSignal';
//  procedure mmTaskYield;     external MmDdkLib name 'mmTaskYield';
//  function mmGetCurrentTask; external MmDdkLib name 'mmGetCurrentTask';
////////////////////////////////////////////////////////////////////////////////

  // Implement Additional Prototypes here.

end.
