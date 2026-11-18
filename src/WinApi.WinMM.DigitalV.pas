// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.WinMM.DigitalV.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 17-05-2020
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: Include file for the MCI Digital Video Command Set.
//              Part of Windows Multimedia
//              See: https://docs.microsoft.com/en-us/windows/win32/api/_multimedia/
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
// Remarks: Date            Modification
//          ------------    ------------
//          Aug 19, 1992    Version 1.0 Release
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
// Source: digitalv.h
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
unit WinApi.WinMM.DigitalV;

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
  {System}
  Types,
  {WinMM}
  WinApi.WinMM.MCIApi,
  WinApi.WinMM.MMiscApi,
  WinApi.WinMM.MMDdk;

const

  _INC_DIGITALV                       = 100 ;

  MCI_TEST                            = $00000020;

  { Message values }

  MCI_CAPTURE                         = $0870;
  MCI_MONITOR                         = $0871;
  MCI_RESERVE                         = $0872;
  MCI_SETAUDIO                        = $0873;
  MCI_SIGNAL                          = $0875;
  MCI_SETVIDEO                        = $0876;
  MCI_QUALITY                         = $0877;
  MCI_LIST                            = $0878;
  MCI_UNDO                            = $0879;
  MCI_CONFIGURE                       = $087A;
  MCI_RESTORE                         = $087B;

  { Return and string constant values }

  MCI_ON                              = 1;
  MCI_OFF                             = 0;

  MCI_DGV_FILE_MODE_SAVING            = $0001;
  MCI_DGV_FILE_MODE_LOADING           = $0002;
  MCI_DGV_FILE_MODE_EDITING           = $0003;
  MCI_DGV_FILE_MODE_IDLE              = $0004;


  { These identifiers are used only by device drivers }


  MCI_ON_S                            = $00008000;
  MCI_OFF_S                           = $00008001;
  MCI_DGV_FILE_S                      = $00008002;
  MCI_DGV_INPUT_S                     = $00008003;

  MCI_DGV_FILE_MODE_SAVING_S          = $00008004;
  MCI_DGV_FILE_MODE_LOADING_S         = $00008005;
  MCI_DGV_FILE_MODE_EDITING_S         = $00008006;
  MCI_DGV_FILE_MODE_IDLE_S            = $00008007;

  MCI_DGV_SETVIDEO_SRC_NTSC_S         = $00008010;
  MCI_DGV_SETVIDEO_SRC_RGB_S          = $00008011;
  MCI_DGV_SETVIDEO_SRC_SVIDEO_S       = $00008012;
  MCI_DGV_SETVIDEO_SRC_PAL_S          = $00008013;
  MCI_DGV_SETVIDEO_SRC_SECAM_S        = $00008014;
  MCI_DGV_SETVIDEO_SRC_GENERIC_S      = $00008015;

  MCI_DGV_SETAUDIO_SRC_LEFT_S         = $00008020;
  MCI_DGV_SETAUDIO_SRC_RIGHT_S        = $00008021;
  MCI_DGV_SETAUDIO_SRC_AVERAGE_S      = $00008022;
  MCI_DGV_SETAUDIO_SRC_STEREO_S       = $00008023;


  { Window message for signal notification }

  MM_MCISIGNAL                        = $3CB;


  { error values }

  MCIERR_DGV_DEVICE_LIMIT             = (MCIERR_CUSTOM_DRIVER_BASE + 0);
  MCIERR_DGV_IOERR                    = (MCIERR_CUSTOM_DRIVER_BASE + 1);
  MCIERR_DGV_WORKSPACE_EMPTY          = (MCIERR_CUSTOM_DRIVER_BASE + 2);
  MCIERR_DGV_DISK_FULL                = (MCIERR_CUSTOM_DRIVER_BASE + 3);
  MCIERR_DGV_DEVICE_MEMORY_FULL       = (MCIERR_CUSTOM_DRIVER_BASE + 4);
  MCIERR_DGV_BAD_CLIPBOARD_RANGE      = (MCIERR_CUSTOM_DRIVER_BASE + 5);


  { defines for monitor methods }

  MCI_DGV_METHOD_PRE                  = $0000A000;
  MCI_DGV_METHOD_POST                 = $0000A001;
  MCI_DGV_METHOD_DIRECT               = $0000A002;


  { defines for known file formats }

  MCI_DGV_FF_AVSS                     = $00004000;
  MCI_DGV_FF_AVI                      = $00004001;
  MCI_DGV_FF_DIB                      = $00004002;
  MCI_DGV_FF_RDIB                     = $00004003;
  MCI_DGV_FF_JPEG                     = $00004004;
  MCI_DGV_FF_RJPEG                    = $00004005;
  MCI_DGV_FF_JFIF                     = $00004006;
  MCI_DGV_FF_MPEG                     = $00004007;


  { values for dwItem field of MCI_CAPABILITY_PARMS structure }

  MCI_DGV_GETDEVCAPS_CAN_LOCK         = $00004000;
  MCI_DGV_GETDEVCAPS_CAN_STRETCH      = $00004001;
  MCI_DGV_GETDEVCAPS_CAN_FREEZE       = $00004002;
  MCI_DGV_GETDEVCAPS_MAX_WINDOWS      = $00004003;
  MCI_DGV_GETDEVCAPS_CAN_REVERSE      = $00004004;
  MCI_DGV_GETDEVCAPS_HAS_STILL        = $00004005;
  MCI_DGV_GETDEVCAPS_PALETTES         = $00004006;
  MCI_DGV_GETDEVCAPS_CAN_STR_IN       = $00004008;
  MCI_DGV_GETDEVCAPS_CAN_TEST         = $00004009;
  MCI_DGV_GETDEVCAPS_MAXIMUM_RATE     = $0000400A;
  MCI_DGV_GETDEVCAPS_MINIMUM_RATE     = $0000400B;


  { flags for dwFlags parameter of MCI_CAPTURE command message }

  MCI_DGV_CAPTURE_AS                  = $00010000;
  MCI_DGV_CAPTURE_AT                  = $00020000;


{ flags for dwFlags parameter of MCI_COPY command message }

  MCI_DGV_COPY_AT                     = $00010000;
  MCI_DGV_COPY_AUDIO_STREAM           = $00020000;
  MCI_DGV_COPY_VIDEO_STREAM           = $00040000;


  { flags for dwFlags parameter of MCI_CUE command message }

  MCI_DGV_CUE_INPUT                   = $00010000;
  MCI_DGV_CUE_OUTPUT                  = $00020000;
  MCI_DGV_CUE_NOSHOW                  = $00040000;


  { flags for dwFlags parameter of MCI_CUT command message }

  MCI_DGV_CUT_AT                      = $00010000;
  MCI_DGV_CUT_AUDIO_STREAM            = $00020000;
  MCI_DGV_CUT_VIDEO_STREAM            = $00040000;


  { flags for dwFlags parameter of MCI_DELETE command message }

  MCI_DGV_DELETE_AT                   = $00010000;
  MCI_DGV_DELETE_AUDIO_STREAM         = $00020000;
  MCI_DGV_DELETE_VIDEO_STREAM         = $00040000;


  { flags for dwFlags parameter of MCI_FREEZE command message }

  MCI_DGV_FREEZE_AT                   = $00010000;
  MCI_DGV_FREEZE_OUTSIDE              = $00020000;


  { flags for dwFlags parameter of MCI_INFO command message }

  MCI_DGV_INFO_TEXT                   = $00010000;
  MCI_DGV_INFO_ITEM                   = $00020000;


  { values for dwItem field of MCI_DGV_INFO_PARMS structure }

  MCI_INFO_VERSION                    = $00000400;

  MCI_DGV_INFO_USAGE                  = $00004000;
  MCI_DGV_INFO_AUDIO_QUALITY          = $00004001;
  MCI_DGV_INFO_STILL_QUALITY          = $00004002;
  MCI_DGV_INFO_VIDEO_QUALITY          = $00004003;
  MCI_DGV_INFO_AUDIO_ALG              = $00004004;
  MCI_DGV_INFO_STILL_ALG              = $00004005;
  MCI_DGV_INFO_VIDEO_ALG              = $00004006;


  { flags for dwFlags parameter of MCI_LIST command message }

  MCI_DGV_LIST_ITEM                   = $00010000;
  MCI_DGV_LIST_COUNT                  = $00020000;
  MCI_DGV_LIST_NUMBER                 = $00040000;
  MCI_DGV_LIST_ALG                    = $00080000;


  { values for dwItem field of MCI_DGV_LIST_PARMS structure }

  MCI_DGV_LIST_AUDIO_ALG              = $00004000;
  MCI_DGV_LIST_AUDIO_QUALITY          = $00004001;
  MCI_DGV_LIST_AUDIO_STREAM           = $00004002;
  MCI_DGV_LIST_STILL_ALG              = $00004003;
  MCI_DGV_LIST_STILL_QUALITY          = $00004004;
  MCI_DGV_LIST_VIDEO_ALG              = $00004005;
  MCI_DGV_LIST_VIDEO_QUALITY          = $00004006;
  MCI_DGV_LIST_VIDEO_STREAM           = $00004007;
  MCI_DGV_LIST_VIDEO_SOURCE           = $00004008;



  { flags for dwFlags parameter of MCI_MONITOR command message }

  MCI_DGV_MONITOR_METHOD              = $00010000;
  MCI_DGV_MONITOR_SOURCE              = $00020000;


  { values for dwSource parameter of the MCI_DGV_MONITOR_PARMS struture }

  MCI_DGV_MONITOR_INPUT               = $00004000;
  MCI_DGV_MONITOR_FILE                = $00004001;


  { flags for dwFlags parameter of MCI_OPEN command message }

  MCI_DGV_OPEN_WS                     = $00010000;
  MCI_DGV_OPEN_PARENT                 = $00020000;
  MCI_DGV_OPEN_NOSTATIC               = $00040000;
  MCI_DGV_OPEN_16BIT                  = $00080000;
  MCI_DGV_OPEN_32BIT                  = $00100000;


  { flags for dwFlags parameter of MCI_PASTE command message }

  MCI_DGV_PASTE_AT                    = $00010000;
  MCI_DGV_PASTE_AUDIO_STREAM          = $00020000;
  MCI_DGV_PASTE_VIDEO_STREAM          = $00040000;
  MCI_DGV_PASTE_INSERT                = $00080000;
  MCI_DGV_PASTE_OVERWRITE             = $00100000;


  { flags for dwFlags parameter of MCI_PLAY command message }

  MCI_DGV_PLAY_REPEAT                 = $00010000;
  MCI_DGV_PLAY_REVERSE                = $00020000;


  { flags for dwFlags parameter of MCI_PUT command message }

  MCI_DGV_RECT                        = $00010000;
  MCI_DGV_PUT_SOURCE                  = $00020000;
  MCI_DGV_PUT_DESTINATION             = $00040000;
  MCI_DGV_PUT_FRAME                   = $00080000;
  MCI_DGV_PUT_VIDEO                   = $00100000;
  MCI_DGV_PUT_WINDOW                  = $00200000;
  MCI_DGV_PUT_CLIENT                  = $00400000;


  { flags for dwFlags parameter of MCI_QUALITY command message }

  MCI_QUALITY_ITEM                    = $00010000;
  MCI_QUALITY_NAME                    = $00020000;
  MCI_QUALITY_ALG                     = $00040000;
  MCI_QUALITY_DIALOG                  = $00080000;
  MCI_QUALITY_HANDLE                  = $00100000;


  { values for dwItem field of MCI_QUALITY_PARMS structure }

  MCI_QUALITY_ITEM_AUDIO              = $00004000;
  MCI_QUALITY_ITEM_STILL              = $00004001;
  MCI_QUALITY_ITEM_VIDEO              = $00004002;


  { flags for dwFlags parameter of MCI_REALIZE command message }

  MCI_DGV_REALIZE_NORM                = $00010000;
  MCI_DGV_REALIZE_BKGD                = $00020000;


  { flags for dwFlags parameter of MCI_RECORD command message }

  MCI_DGV_RECORD_HOLD                 = $00020000;
  MCI_DGV_RECORD_AUDIO_STREAM         = $00040000;
  MCI_DGV_RECORD_VIDEO_STREAM         = $00080000;


  { flags for dwFlags parameters of MCI_RESERVE command message }

  MCI_DGV_RESERVE_IN                  = $00010000;
  MCI_DGV_RESERVE_SIZE                = $00020000;


  { flags for dwFlags parameter of MCI_RESTORE command message }

  MCI_DGV_RESTORE_FROM                = $00010000;
  MCI_DGV_RESTORE_AT                  = $00020000;


  { flags for dwFlags parameters of MCI_SAVE command message }

  MCI_DGV_SAVE_ABORT                  = $00020000;
  MCI_DGV_SAVE_KEEPRESERVE            = $00040000;


  { flags for dwFlags parameters of MCI_SET command message }

  MCI_DGV_SET_SEEK_EXACTLY            = $00010000;
  MCI_DGV_SET_SPEED                   = $00020000;
  MCI_DGV_SET_STILL                   = $00040000;
  MCI_DGV_SET_FILEFORMAT              = $00080000;


  { flags for the dwFlags parameter of MCI_SETAUDIO command message }

  MCI_DGV_SETAUDIO_OVER               = $00010000;
  MCI_DGV_SETAUDIO_CLOCKTIME          = $00020000;
  MCI_DGV_SETAUDIO_ALG                = $00040000;
  MCI_DGV_SETAUDIO_QUALITY            = $00080000;
  MCI_DGV_SETAUDIO_RECORD             = $00100000;
  MCI_DGV_SETAUDIO_LEFT               = $00200000;
  MCI_DGV_SETAUDIO_RIGHT              = $00400000;
  MCI_DGV_SETAUDIO_ITEM               = $00800000;
  MCI_DGV_SETAUDIO_VALUE              = $01000000;
  MCI_DGV_SETAUDIO_INPUT              = $02000000;
  MCI_DGV_SETAUDIO_OUTPUT             = $04000000;


{ values for the dwItem parameter of MCI_DGV_SETAUDIO_PARMS }

  MCI_DGV_SETAUDIO_TREBLE             = $00004000;
  MCI_DGV_SETAUDIO_BASS               = $00004001;
  MCI_DGV_SETAUDIO_VOLUME             = $00004002;
  MCI_DGV_SETAUDIO_STREAM             = $00004003;
  MCI_DGV_SETAUDIO_SOURCE             = $00004004;
  MCI_DGV_SETAUDIO_SAMPLESPERSEC      = $00004005;
  MCI_DGV_SETAUDIO_AVGBYTESPERSEC     = $00004006;
  MCI_DGV_SETAUDIO_BLOCKALIGN         = $00004007;
  MCI_DGV_SETAUDIO_BITSPERSAMPLE      = $00004008;


  { values for the dwValue parameter of MCI_DGV_SETAUDIO_PARMS
    used with MCI_DGV_SETAUDIO_SOURCE }

  MCI_DGV_SETAUDIO_SOURCE_STEREO      = $00000000;
  MCI_DGV_SETAUDIO_SOURCE_LEFT        = $00000001;
  MCI_DGV_SETAUDIO_SOURCE_RIGHT       = $00000002;
  MCI_DGV_SETAUDIO_SOURCE_AVERAGE     = $00004000;


  { flags for the dwFlags parameter of MCI_SETVIDEO command }

  MCI_DGV_SETVIDEO_QUALITY            = $00010000;
  MCI_DGV_SETVIDEO_ALG                = $00020000;
  MCI_DGV_SETVIDEO_CLOCKTIME          = $00040000;
  MCI_DGV_SETVIDEO_SRC_NUMBER         = $00080000;
  MCI_DGV_SETVIDEO_ITEM               = $00100000;
  MCI_DGV_SETVIDEO_OVER               = $00200000;
  MCI_DGV_SETVIDEO_RECORD             = $00400000;
  MCI_DGV_SETVIDEO_STILL              = $00800000;
  MCI_DGV_SETVIDEO_VALUE              = $01000000;
  MCI_DGV_SETVIDEO_INPUT              = $02000000;
  MCI_DGV_SETVIDEO_OUTPUT             = $04000000;


  { values for the dwTo field of MCI_SETVIDEO_PARMS
    used with MCI_DGV_SETVIDEO_SOURCE }

  MCI_DGV_SETVIDEO_SRC_NTSC           = $00004000;
  MCI_DGV_SETVIDEO_SRC_RGB            = $00004001;
  MCI_DGV_SETVIDEO_SRC_SVIDEO         = $00004002;
  MCI_DGV_SETVIDEO_SRC_PAL            = $00004003;
  MCI_DGV_SETVIDEO_SRC_SECAM          = $00004004;
  MCI_DGV_SETVIDEO_SRC_GENERIC        = $00004005;


  { values for the dwItem field of MCI_SETVIDEO_PARMS }

  MCI_DGV_SETVIDEO_BRIGHTNESS         = $00004000;
  MCI_DGV_SETVIDEO_COLOR              = $00004001;
  MCI_DGV_SETVIDEO_CONTRAST           = $00004002;
  MCI_DGV_SETVIDEO_TINT               = $00004003;
  MCI_DGV_SETVIDEO_SHARPNESS          = $00004004;
  MCI_DGV_SETVIDEO_GAMMA              = $00004005;
  MCI_DGV_SETVIDEO_STREAM             = $00004006;
  MCI_DGV_SETVIDEO_PALHANDLE          = $00004007;
  MCI_DGV_SETVIDEO_FRAME_RATE         = $00004008;
  MCI_DGV_SETVIDEO_SOURCE             = $00004009;
  MCI_DGV_SETVIDEO_KEY_INDEX          = $0000400A;
  MCI_DGV_SETVIDEO_KEY_COLOR          = $0000400B;
  MCI_DGV_SETVIDEO_BITSPERPEL         = $0000400C;


  { flags for the dwFlags parameter of MCI_SIGNAL }

  MCI_DGV_SIGNAL_AT                   = $00010000;
  MCI_DGV_SIGNAL_EVERY                = $00020000;
  MCI_DGV_SIGNAL_USERVAL              = $00040000;
  MCI_DGV_SIGNAL_CANCEL               = $00080000;
  MCI_DGV_SIGNAL_POSITION             = $00100000;


 { The following is the function digitalvideo drivers must use
 * to signal when a frame marked by the SIGNAL command has been rendered:
 *
 *  SEND_DGVSIGNAL(dwFlags, dwCallback, hDriver, wDeviceID, dwUser, dwPos )
 *
 * The following is a description of the parameters:
 *
 *  dwFlags    - the dwFlags parameter passed when the signal was set
 *  dwCallback - the dwCallback value from the MCI_DGV_SIGNAL_PARMS struct
 *               used to set the signal
 *  hDriver    - the handle assigned to the driver by MMSYSTEM when the
 *               device was opened
 *  wDeviceID  - the device ID
 *  dwUser     - the dwUserParm value from the MCI_DGV_SIGNAL_PARMS struct
 *               used to set the signal
 *  dwPos      - the position at which the signal was sent, in the current
 *               time format.
 *
 * The window indicated by the handle in the dwCallback field is notified
 * by means of a Windows message with the following form:
 *
 * msg    = MM_MCISIGNAL
 * wParam = wDeviceID of the sending driver
 * lParam = the uservalue specified or the position the signal was sent
 *          at; the latter if the MCI_DGV_SIGNAL_POSITION flag was set
 *          in the dwFlags parameter when the signal was created.
 }

  function SEND_DGVSIGNAL(dwFlags: DWord;
                          dwCallback: DWORD_PTR;
                          hDriver: Thandle;
                          wDeviceID: MCIDEVICEID;
                          dwUser: DWORD_PTR;
                          dwPos: DWord): BOOL;

  { flags for the dwFlags parameter of MCI_STATUS command }

const

  MCI_DGV_STATUS_NOMINAL              = $00020000;
  MCI_DGV_STATUS_REFERENCE            = $00040000;
  MCI_DGV_STATUS_LEFT                 = $00080000;
  MCI_DGV_STATUS_RIGHT                = $00100000;
  MCI_DGV_STATUS_DISKSPACE            = $00200000;
  MCI_DGV_STATUS_INPUT                = $00400000;
  MCI_DGV_STATUS_OUTPUT               = $00800000;
  MCI_DGV_STATUS_RECORD               = $01000000;


  { values for dwItem field of MCI_STATUS_PARMS structure }

  MCI_DGV_STATUS_AUDIO_INPUT          = $00004000;
  MCI_DGV_STATUS_HWND                 = $00004001;
  MCI_DGV_STATUS_SPEED                = $00004003;
  MCI_DGV_STATUS_HPAL                 = $00004004;
  MCI_DGV_STATUS_BRIGHTNESS           = $00004005;
  MCI_DGV_STATUS_COLOR                = $00004006;
  MCI_DGV_STATUS_CONTRAST             = $00004007;
  MCI_DGV_STATUS_FILEFORMAT           = $00004008;
  MCI_DGV_STATUS_AUDIO_SOURCE         = $00004009;
  MCI_DGV_STATUS_GAMMA                = $0000400A;
  MCI_DGV_STATUS_MONITOR              = $0000400B;
  MCI_DGV_STATUS_MONITOR_METHOD       = $0000400C;
  MCI_DGV_STATUS_FRAME_RATE           = $0000400E;
  MCI_DGV_STATUS_BASS                 = $0000400F;
  MCI_DGV_STATUS_SIZE                 = $00004010;
  MCI_DGV_STATUS_SEEK_EXACTLY         = $00004011;
  MCI_DGV_STATUS_SHARPNESS            = $00004012;
  MCI_DGV_STATUS_SMPTE                = $00004013;
  MCI_DGV_STATUS_AUDIO                = $00004014;
  MCI_DGV_STATUS_TINT                 = $00004015;
  MCI_DGV_STATUS_TREBLE               = $00004016;
  MCI_DGV_STATUS_UNSAVED              = $00004017;
  MCI_DGV_STATUS_VIDEO                = $00004018;
  MCI_DGV_STATUS_VOLUME               = $00004019;
  MCI_DGV_STATUS_AUDIO_RECORD         = $0000401A;
  MCI_DGV_STATUS_VIDEO_SOURCE         = $0000401B;
  MCI_DGV_STATUS_VIDEO_RECORD         = $0000401C;
  MCI_DGV_STATUS_STILL_FILEFORMAT     = $0000401D;
  MCI_DGV_STATUS_VIDEO_SRC_NUM        = $0000401E;
  MCI_DGV_STATUS_FILE_MODE            = $0000401F;
  MCI_DGV_STATUS_FILE_COMPLETION      = $00004020;
  MCI_DGV_STATUS_WINDOW_VISIBLE       = $00004021;
  MCI_DGV_STATUS_WINDOW_MINIMIZED     = $00004022;
  MCI_DGV_STATUS_WINDOW_MAXIMIZED     = $00004023;
  MCI_DGV_STATUS_KEY_INDEX            = $00004024;
  MCI_DGV_STATUS_KEY_COLOR            = $00004025;
  MCI_DGV_STATUS_PAUSE_MODE           = $00004026;
  MCI_DGV_STATUS_SAMPLESPERSEC        = $00004027;
  MCI_DGV_STATUS_AVGBYTESPERSEC       = $00004028;
  MCI_DGV_STATUS_BLOCKALIGN           = $00004029;
  MCI_DGV_STATUS_BITSPERSAMPLE        = $0000402A;
  MCI_DGV_STATUS_BITSPERPEL           = $0000402B;
  MCI_DGV_STATUS_FORWARD              = $0000402C;
  MCI_DGV_STATUS_AUDIO_STREAM         = $0000402D;
  MCI_DGV_STATUS_VIDEO_STREAM         = $0000402E;


  { flags for dwFlags parameter of MCI_STEP command message }

  MCI_DGV_STEP_REVERSE                = $00010000;
  MCI_DGV_STEP_FRAMES                 = $00020000;


  { flags for dwFlags parameter of MCI_STOP command message }

  MCI_DGV_STOP_HOLD                   = $00010000;


  { flags for dwFlags parameter of MCI_UPDATE command message }

  MCI_DGV_UPDATE_HDC                  = $00020000;
  MCI_DGV_UPDATE_PAINT                = $00040000;


  { flags for dwFlags parameter of MCI_WHERE command message }

  MCI_DGV_WHERE_SOURCE                = $00020000;
  MCI_DGV_WHERE_DESTINATION           = $00040000;
  MCI_DGV_WHERE_FRAME                 = $00080000;
  MCI_DGV_WHERE_VIDEO                 = $00100000;
  MCI_DGV_WHERE_WINDOW                = $00200000;
  MCI_DGV_WHERE_MAX                   = $00400000;


  { flags for dwFlags parameter of MCI_WINDOW command message }

  MCI_DGV_WINDOW_HWND                 = $00010000;
  MCI_DGV_WINDOW_STATE                = $00040000;
  MCI_DGV_WINDOW_TEXT                 = $00080000;


  { flags for hWnd parameter of MCI_DGV_WINDOW_PARMS parameter block }

  MCI_DGV_WINDOW_DEFAULT              = $00000000;

 { parameter block for MCI_WHERE, MCI_PUT, MCI_FREEZE, MCI_UNFREEZE cmds }

type

  PMCI_DGV_RECT_PARMS = ^MCI_DGV_RECT_PARMS;
  MCI_DGV_RECT_PARMS = packed record
    dwCallback: DWORD_PTR;
    rc: TRect;
  end;
  LPMCI_DGV_RECT_PARMS = ^MCI_DGV_RECT_PARMS;

  { parameter block for MCI_CAPTURE command message }

  PMCI_DGV_CAPTURE_PARMSA = ^MCI_DGV_CAPTURE_PARMSA;
  MCI_DGV_CAPTURE_PARMSA = packed record
    dwCallback: DWORD_PTR;
    lpstrFileName: PAnsiChar;
    rc: TRect;
  end;
  LPMCI_DGV_CAPTURE_PARMSA = ^MCI_DGV_CAPTURE_PARMSA;


  PMCI_DGV_CAPTURE_PARMSW = ^MCI_DGV_CAPTURE_PARMSW;
  MCI_DGV_CAPTURE_PARMSW = packed record
    dwCallback: DWORD_PTR;
    lpstrFileName: PWideChar;
    rc: TRect;
  end;
  LPMCI_DGV_CAPTURE_PARMSW = ^MCI_DGV_CAPTURE_PARMSW;

  { Delphi }
  MCI_DGV_CAPTURE_PARMS = MCI_DGV_CAPTURE_PARMSW;
  PMCI_DGV_CAPTURE_PARMS = ^MCI_DGV_CAPTURE_PARMSW;
  LPMCI_DGV_CAPTURE_PARMS = ^MCI_DGV_CAPTURE_PARMSW;


  { parameter block for MCI_CLOSE command message }

  PMCI_CLOSE_PARMS = ^MCI_CLOSE_PARMS;
  MCI_CLOSE_PARMS = MCI_GENERIC_PARMS;
  LPMCI_CLOSE_PARMS = ^MCI_CLOSE_PARMS;

  { parameter block for MCI_COPY command message }

  PMCI_DGV_COPY_PARMS = ^MCI_DGV_COPY_PARMS;
  MCI_DGV_COPY_PARMS = packed record
    dwCallback: DWORD_PTR;
    dwFrom: DWORD;
    dwTo: DWORD;
    rc: TRect;
    dwAudioStream: DWORD;
    dwVideoStream: DWORD;
  end;
  LPMCI_DGV_COPY_PARMS = ^MCI_DGV_COPY_PARMS;

  { parameter block for MCI_CUE command message }

  PMCI_DGV_CUE_PARMS = ^MCI_DGV_CUE_PARMS;
  MCI_DGV_CUE_PARMS = packed record
    dwCallback: DWORD_PTR;
    dwTo: DWORD;
  end;
  LPMCI_DGV_CUE_PARMS = ^MCI_DGV_CUE_PARMS;


  { parameter block for MCI_CUT command message }

  PMCI_DGV_CUT_PARMS = ^MCI_DGV_CUT_PARMS;
  MCI_DGV_CUT_PARMS = packed record
    dwCallback: DWORD_PTR;
    dwFrom: DWORD;
    dwTo: DWORD;
    rc: TRect;
    dwAudioStream: DWORD;
    dwVideoStream: DWORD;
  end;
  LPMCI_DGV_CUT_PARMS = ^MCI_DGV_CUT_PARMS;


  { parameter block for MCI_DELETE command message }

  PMCI_DGV_DELETE_PARMS = ^MCI_DGV_DELETE_PARMS;
  MCI_DGV_DELETE_PARMS = packed record
    dwCallback: DWORD_PTR;
    dwFrom: DWORD;
    dwTo: DWORD;
    rc: TRect;
    dwAudioStream: DWORD;
    dwVideoStream: DWORD;
  end;
  LPMCI_DGV_DELETE_PARMS = ^MCI_DGV_DELETE_PARMS;


  { parameter block for MCI_FREEZE command message }

  MCI_DGV_FREEZE_PARMS = MCI_DGV_RECT_PARMS;

  LPMCI_DGV_FREEZE_PARMS = ^MCI_DGV_FREEZE_PARMS;

  { parameter block for MCI_INFO command message }

  PMCI_DGV_INFO_PARMSA = ^MCI_DGV_INFO_PARMSA;
  MCI_DGV_INFO_PARMSA = packed record
    dwCallback: DWORD_PTR;
    lpstrReturn: PAnsiChar;
    dwRetSize: DWORD;
    dwItem: DWORD;
  end;
  LPMCI_DGV_INFO_PARMSA = ^MCI_DGV_INFO_PARMSA;

  PMCI_DGV_INFO_PARMSW = ^MCI_DGV_INFO_PARMSW;
  MCI_DGV_INFO_PARMSW = packed record
    dwCallback: DWORD_PTR;
    lpstrReturn: PWideChar;
    dwRetSize: DWORD;
    dwItem: DWORD;
  end;
  LPMCI_DGV_INFO_PARMSW = ^MCI_DGV_INFO_PARMSW;

  { Delphi }
  PMCI_DGV_INFO_PARMS = ^MCI_DGV_INFO_PARMSW;
  MCI_DGV_INFO_PARMS = MCI_DGV_INFO_PARMSW;
  LPMCI_DGV_INFO_PARMS = ^MCI_DGV_INFO_PARMSW;


  { parameter block for MCI_LIST command message }

  PMCI_DGV_LIST_PARMSA = ^ MCI_DGV_LIST_PARMSA;
  MCI_DGV_LIST_PARMSA = packed record
    dwCallback: DWORD_PTR;
    lpstrReturn: PAnsiChar;
    dwLength: DWORD;
    dwNumber: DWORD;
    dwItem: DWORD;
    lpstrAlgorithm: PAnsiChar;
  end;
  LPMCI_DGV_LIST_PARMSA = ^MCI_DGV_LIST_PARMSA;

  PMCI_DGV_LIST_PARMSW = ^MCI_DGV_LIST_PARMSW;
  MCI_DGV_LIST_PARMSW = packed record
    dwCallback: DWORD_PTR;
    lpstrReturn: PWideChar;
    dwLength: DWORD;
    dwNumber: DWORD;
    dwItem: DWORD;
    lpstrAlgorithm: PWideChar;
  end;
  LPMCI_DGV_LIST_PARMSW = ^MCI_DGV_LIST_PARMSW;

  { Delphi }
  PMCI_DGV_LIST_PARMS = ^MCI_DGV_LIST_PARMSW;
  MCI_DGV_LIST_PARMS = MCI_DGV_LIST_PARMSW;
  LPMCI_DGV_LIST_PARMS = ^MCI_DGV_LIST_PARMSW;

  { parameter block for MCI_LOAD command message }

  PMCI_DGV_LOAD_PARMS = ^MCI_DGV_LOAD_PARMS;
  MCI_DGV_LOAD_PARMS = MCI_LOAD_PARMS;
  LPMCI_DGV_LOAD_PARMS = ^MCI_DGV_LOAD_PARMS;

  { parameter block for MCI_MONITOR command message }

  PMCI_DGV_MONITOR_PARMS = ^MCI_DGV_MONITOR_PARMS;
  MCI_DGV_MONITOR_PARMS = packed record
    dwCallback: DWORD_PTR;
    dwSource: DWORD;
    dwMethod: DWORD;
  end;
  LPMCI_DGV_MONITOR_PARMS = ^MCI_DGV_MONITOR_PARMS;

  { parameter block for MCI_OPEN command message }

  PMCI_DGV_OPEN_PARMSA = ^MCI_DGV_OPEN_PARMSA;
  MCI_DGV_OPEN_PARMSA = packed record
    dwCallback: DWORD_PTR;
    wDeviceID: UINT;
    lpstrDeviceType: PAnsiChar;
    lpstrElementName: PAnsiChar;
    lpstrAlias: PAnsiChar;
    dwStyle: DWORD;
    hWndParent: HWND;
  end;
  LPMCI_DGV_OPEN_PARMSA = ^MCI_DGV_OPEN_PARMSA;

  PMCI_DGV_OPEN_PARMSW = ^MCI_DGV_OPEN_PARMSW;
  MCI_DGV_OPEN_PARMSW = packed record
    dwCallback: DWORD_PTR;
    wDeviceID: UINT;
    lpstrDeviceType: PWideChar;
    lpstrElementName: PWideChar;
    lpstrAlias: PWideChar;
    dwStyle: DWORD;
    hWndParent: HWND;
  end;
  LPMCI_DGV_OPEN_PARMSW = ^MCI_DGV_OPEN_PARMSW;

  { Delphi }
  PMCI_DGV_OPEN_PARMS = ^MCI_DGV_OPEN_PARMSW;
  MCI_DGV_OPEN_PARMS = MCI_DGV_OPEN_PARMSW;
  LPMCI_DGV_OPEN_PARMS = ^MCI_DGV_OPEN_PARMSW;


  { parameter block for MCI_PAUSE command message }

  PMCI_DGV_PAUSE_PARMS = ^MCI_DGV_PAUSE_PARMS;
  MCI_DGV_PAUSE_PARMS = MCI_GENERIC_PARMS;
  LPMCI_DGV_PAUSE_PARMS = ^MCI_DGV_PAUSE_PARMS;


  { parameter block for MCI_PASTE command message }
  PMCI_DGV_PASTE_PARMS = ^MCI_DGV_PASTE_PARMS;
  MCI_DGV_PASTE_PARMS = packed record
    dwCallback: DWORD_PTR;
    dwTo: DWORD;
    rc: TRect;
    dwAudioStream: DWORD;
    dwVideoStream: DWORD;
  end;
  LPMCI_DGV_PASTE_PARMS = ^MCI_DGV_PASTE_PARMS;


  { parameter block for MCI_PLAY command message }

  PMCI_DGV_PLAY_PARMS = ^MCI_DGV_PLAY_PARMS;
  MCI_DGV_PLAY_PARMS = MCI_PLAY_PARMS;
  LPMCI_DGV_PLAY_PARMS = ^MCI_DGV_PLAY_PARMS;


  { parameter block for MCI_PUT command message }

  PMCI_DGV_PUT_PARMS = ^MCI_DGV_RECT_PARMS;
  MCI_DGV_PUT_PARMS = MCI_DGV_RECT_PARMS;
  LPMCI_DGV_PUT_PARMS = ^MCI_DGV_RECT_PARMS;

  { parameter block for MCI_QUALITY command message }

  PMCI_DGV_QUALITY_PARMSA = ^MCI_DGV_QUALITY_PARMSA;
  MCI_DGV_QUALITY_PARMSA = packed record
    dwCallback: DWORD_PTR;
    dwItem: DWORD;
    lpstrName: PAnsiChar;
    lpstrAlgorithm: DWORD;
    dwHandle: DWORD;
  end;
  LPMCI_DGV_QUALITY_PARMSA = ^MCI_DGV_QUALITY_PARMSA;

  PMCI_DGV_QUALITY_PARMSW = ^MCI_DGV_QUALITY_PARMSW;
  MCI_DGV_QUALITY_PARMSW = packed record
    dwCallback: DWORD_PTR;
    dwItem: DWORD;
    lpstrName: PWideChar;
    lpstrAlgorithm: DWORD;
    dwHandle: DWORD;
  end;
  LPMCI_DGV_QUALITY_PARMSW = ^MCI_DGV_QUALITY_PARMSW;

  { Delphi }
  PMCI_DGV_QUALITY_PARMS = ^MCI_DGV_QUALITY_PARMSW;
  MCI_DGV_QUALITY_PARMS = MCI_DGV_QUALITY_PARMSW;
  LPMCI_DGV_QUALITY_PARMS = ^MCI_DGV_QUALITY_PARMSW;


  { parameter block for MCI_REALIZE command message }

  MCI_REALIZE_PARMS = MCI_GENERIC_PARMS;
  LPMCI_REALIZE_PARMS = ^MCI_REALIZE_PARMS;

  { parameter block for MCI_RECORD command message }

  PMCI_DGV_RECORD_PARMS = ^MCI_DGV_RECORD_PARMS;
  MCI_DGV_RECORD_PARMS = packed record
    dwCallback: DWORD_PTR;
    dwFrom: DWORD;
    dwTo: DWORD;
    rc: TRect;
    dwAudioStream: DWORD;
    dwVideoStream: DWORD;
  end;
  LPMCI_DGV_RECORD_PARMS = ^MCI_DGV_RECORD_PARMS;

  { parameter block for MCI_RESERVE command message }

  PMCI_DGV_RESERVE_PARMSA = ^MCI_DGV_RESERVE_PARMSA;
  MCI_DGV_RESERVE_PARMSA = packed record
    dwCallback: DWORD_PTR;
    lpstrPath: PAnsiChar;
    dwSize: DWORD;
  end;
  LPMCI_DGV_RESERVE_PARMSA = ^MCI_DGV_RESERVE_PARMSA;

  PMCI_DGV_RESERVE_PARMSW = ^MCI_DGV_RESERVE_PARMSW;
  MCI_DGV_RESERVE_PARMSW = packed record
    dwCallback: DWORD_PTR;
    lpstrPath: PWideChar;
    dwSize: DWORD;
  end;
  LPMCI_DGV_RESERVE_PARMSW = ^MCI_DGV_RESERVE_PARMSW;

  { Delphi }
  MCI_DGV_RESERVE_PARMS = MCI_DGV_RESERVE_PARMSW;
  PMCI_DGV_RESERVE_PARMS = ^MCI_DGV_RESERVE_PARMSW;
  LPMCI_DGV_RESERVE_PARMS = ^MCI_DGV_RESERVE_PARMSW;


  { parameter block for MCI_RESTORE command message }

  PMCI_DGV_RESTORE_PARMSA = ^MCI_DGV_RESTORE_PARMSA;
  MCI_DGV_RESTORE_PARMSA = packed record
    dwCallback: DWORD_PTR;
    lpstrFileName: PAnsiChar;
    rc: TRect;
  end;
  LPMCI_DGV_RESTORE_PARMSA = ^MCI_DGV_RESTORE_PARMSA;

  PMCI_DGV_RESTORE_PARMSW = ^MCI_DGV_RESTORE_PARMSW;
  MCI_DGV_RESTORE_PARMSW = packed record
    dwCallback: DWORD_PTR;
    lpstrFileName: PWideChar;
    rc: TRect;
  end;
  LPMCI_DGV_RESTORE_PARMSW = ^MCI_DGV_RESTORE_PARMSW;

  { Delphi }
  MCI_DGV_RESTORE_PARMS = MCI_DGV_RESTORE_PARMSW;
  PMCI_DGV_RESTORE_PARMS = ^MCI_DGV_RESTORE_PARMSW;
  LPMCI_DGV_RESTORE_PARMS = ^MCI_DGV_RESTORE_PARMSW;


  { parameter block for MCI_RESUME command message }

  MCI_DGV_RESUME_PARMS = MCI_GENERIC_PARMS;
  LPMCI_DGV_RESUME_PARMS = ^MCI_DGV_RESUME_PARMS;


  { parameter block for MCI_SAVE command message }

  PMCI_DGV_SAVE_PARMSA = ^MCI_DGV_SAVE_PARMSA;
  MCI_DGV_SAVE_PARMSA = packed record
    dwCallback: DWORD_PTR;
    lpstrFileName: PAnsiChar;
    rc: TRect;
  end;
  LPMCI_DGV_SAVE_PARMSA = ^MCI_DGV_SAVE_PARMSA;

  PMCI_DGV_SAVE_PARMSW = ^MCI_DGV_SAVE_PARMSW;
  MCI_DGV_SAVE_PARMSW = packed record
    dwCallback: DWORD_PTR;
    lpstrFileName: PWideChar;
    rc: TRect;
  end;
  LPMCI_DGV_SAVE_PARMSW = ^MCI_DGV_SAVE_PARMSW;

  { Delphi }
  MCI_DGV_SAVE_PARMS = MCI_DGV_SAVE_PARMSW;
  PMCI_DGV_SAVE_PARMS = ^LPMCI_DGV_SAVE_PARMSW;
  LPMCI_DGV_SAVE_PARMS = ^LPMCI_DGV_SAVE_PARMSW;


  { parameter block for MCI_SET command message }

  PMCI_DGV_SET_PARMS = ^MCI_DGV_SET_PARMS;
  MCI_DGV_SET_PARMS = packed record
    dwCallback: DWORD_PTR;
    dwTimeFormat: DWORD;
    dwAudio: DWORD;
    dwFileFormat: DWORD;
    dwSpeed: DWORD;
  end;
  LPMCI_DGV_SET_PARMS = ^MCI_DGV_SET_PARMS;


  { parameter block for MCI_SETAUDIO command message }

  PMCI_DGV_SETAUDIO_PARMSA = ^MCI_DGV_SETAUDIO_PARMSA;
  MCI_DGV_SETAUDIO_PARMSA = packed record
    dwCallback: DWORD_PTR;
    dwItem: DWORD;
    dwValue: DWORD;
    dwOver: DWORD;
    lpstrAlgorithm: PAnsiChar;
    lpstrQuality: PAnsiChar;
  end;
  LPMCI_DGV_SETAUDIO_PARMSA = ^MCI_DGV_SETAUDIO_PARMSA;

  PMCI_DGV_SETAUDIO_PARMSW = ^MCI_DGV_SETAUDIO_PARMSW;
  MCI_DGV_SETAUDIO_PARMSW = packed record
    dwCallback: DWORD_PTR;
    dwItem: DWORD;
    dwValue: DWORD;
    dwOver: DWORD;
    lpstrAlgorithm: PWideChar;
    lpstrQuality: PWideChar;
  end;
  LPMCI_DGV_SETAUDIO_PARMSW = ^MCI_DGV_SETAUDIO_PARMSW;

  { Delphi }
  MCI_DGV_SETAUDIO_PARMS = MCI_DGV_SETAUDIO_PARMSW;
  PMCI_DGV_SETAUDIO_PARMS = ^MCI_DGV_SETAUDIO_PARMSW;
  LPMCI_DGV_SETAUDIO_PARMS = ^MCI_DGV_SETAUDIO_PARMSW;


  { parameter block for MCI_SIGNAL command message }

  PMCI_DGV_SIGNAL_PARMS = ^MCI_DGV_SIGNAL_PARMS;
  MCI_DGV_SIGNAL_PARMS = packed record
    dwCallback: DWORD_PTR;
    dwPosition: DWORD;
    dwPeriod: DWORD;
    dwUserParm: DWORD;
  end;
  LPMCI_DGV_SIGNAL_PARMS = ^MCI_DGV_SIGNAL_PARMS;


  { parameter block for MCI_SETVIDEO command message }

  PMCI_DGV_SETVIDEO_PARMSA = ^MCI_DGV_SETVIDEO_PARMSA;
  MCI_DGV_SETVIDEO_PARMSA = packed record
    dwCallback: DWORD_PTR;
    dwItem: DWORD;
    dwValue: DWORD;
    dwOver: DWORD;
    lpstrAlgorithm: PAnsiChar;
    lpstrQuality: PAnsiChar;
    dwSourceNumber: DWORD;
  end;
  LPMCI_DGV_SETVIDEO_PARMSA = ^MCI_DGV_SETVIDEO_PARMSA;

  PMCI_DGV_SETVIDEO_PARMSW = ^MCI_DGV_SETVIDEO_PARMSW;
  MCI_DGV_SETVIDEO_PARMSW = packed record
    dwCallback: DWORD_PTR;
    dwItem: DWORD;
    dwValue: DWORD;
    dwOver: DWORD;
    lpstrAlgorithm: PWideChar;
    lpstrQuality: PWideChar;
    dwSourceNumber: DWORD;
  end;
  LPMCI_DGV_SETVIDEO_PARMSW = ^MCI_DGV_SETVIDEO_PARMSW;

  { Delphi }
  MCI_DGV_SETVIDEO_PARMS = MCI_DGV_SETVIDEO_PARMSW;
  PMCI_DGV_SETVIDEO_PARMS = ^MCI_DGV_SETVIDEO_PARMSW;
  LPMCI_DGV_SETVIDEO_PARMS = ^MCI_DGV_SETVIDEO_PARMSW;


  { parameter block for MCI_STATUS command message }

  PMCI_DGV_STATUS_PARMSA = ^MCI_DGV_STATUS_PARMSA;
  MCI_DGV_STATUS_PARMSA = packed record
    dwCallback: DWORD_PTR;
    dwReturn: DWORD_PTR;
    dwItem: DWORD;
    dwTrack: DWORD;
    lpstrDrive: PAnsiChar;
    dwReference: DWORD;
  end;
  LPMCI_DGV_STATUS_PARMSA = ^MCI_DGV_STATUS_PARMSA;

  PMCI_DGV_STATUS_PARMSW = ^MCI_DGV_STATUS_PARMSW;
  MCI_DGV_STATUS_PARMSW = packed record
    dwCallback: DWORD_PTR;
    dwReturn: DWORD_PTR;
    dwItem: DWORD;
    dwTrack: DWORD;
    lpstrDrive: PWideChar;
    dwReference: DWORD;
  end;
  LPMCI_DGV_STATUS_PARMSW = ^MCI_DGV_STATUS_PARMSW;

  { Delphi }
  MCI_DGV_STATUS_PARMS = MCI_DGV_STATUS_PARMSW;
  PMCI_DGV_STATUS_PARMS = ^MCI_DGV_STATUS_PARMSW;
  LPMCI_DGV_STATUS_PARMS = ^MCI_DGV_STATUS_PARMSW;


  { parameter block for MCI_STEP command message }

  PMCI_DGV_STEP_PARMS = ^MCI_DGV_STEP_PARMS;
  MCI_DGV_STEP_PARMS = packed record
    dwCallback: DWORD_PTR;
    dwFrames: DWORD;
  end;
  LPMCI_DGV_STEP_PARMS = ^MCI_DGV_STEP_PARMS;


  { parameter block for MCI_STOP command message }

  MCI_DGV_STOP_PARMS = MCI_GENERIC_PARMS;
  LPMCI_DGV_STOP_PARMS = ^MCI_DGV_STOP_PARMS;


  { parameter block for MCI_UNFREEZE command message }

  MCI_DGV_UNFREEZE_PARMS = MCI_DGV_RECT_PARMS;
  LPMCI_DGV_UNFREEZE_PARMS = ^MCI_DGV_UNFREEZE_PARMS;


  { parameter block for MCI_UPDATE command message }

  PMCI_DGV_UPDATE_PARMS = ^MCI_DGV_UPDATE_PARMS;
  MCI_DGV_UPDATE_PARMS = packed record
    dwCallback: DWORD_PTR;
    rc: Trect;
    hDC: HDC;
  end;
  LPMCI_DGV_UPDATE_PARMS = ^MCI_DGV_UPDATE_PARMS;


  { parameter block for MCI_WHERE command message }

  MCI_DGV_WHERE_PARMS = MCI_DGV_RECT_PARMS;
  LPMCI_DGV_WHERE_PARMS = ^MCI_DGV_RECT_PARMS;


  { parameter block for MCI_WINDOW command message }

  PMCI_DGV_WINDOW_PARMSA = ^MCI_DGV_WINDOW_PARMSA;
  MCI_DGV_WINDOW_PARMSA = packed record
    dwCallback: DWORD_PTR;
    hWnd: HWND;
    nCmdShow: UINT;
    lpstrText: PAnsiChar;
  end;
  LPMCI_DGV_WINDOW_PARMSA = ^MCI_DGV_WINDOW_PARMSA;

  PMCI_DGV_WINDOW_PARMSW = ^MCI_DGV_WINDOW_PARMSW;
  MCI_DGV_WINDOW_PARMSW = packed record
    dwCallback: DWORD_PTR;
    hWnd: HWND;
    nCmdShow: UINT;
    lpstrText: PWideChar;
  end;
  LPMCI_DGV_WINDOW_PARMSW = ^MCI_DGV_WINDOW_PARMSW;

  // Additional Prototypes for ALL interfaces

  // End of Additional Prototypes

implementation


function SEND_DGVSIGNAL(dwFlags: DWord;
                        dwCallback: DWORD_PTR;
                        hDriver: Thandle;
                        wDeviceID: MCIDEVICEID;
                        dwUser: DWORD_PTR;
                        dwPos: DWord): BOOL;
var
  dwParam1: DWORD_PTR;
  dwParam2: DWORD_PTR;

begin

  if (dwFlags and MCI_DGV_SIGNAL_POSITION) <> 0 then
    begin
      dwParam1 := dwPos;
      dwParam2 := dwUser;
    end
  else
    begin
      dwParam1 := dwUser;
      dwParam2 := dwPos;
    end;

  Result := DriverCallback(dwCallback,
                           DCB_WINDOW,
                           THandle(wDeviceID),
                           MM_MCISIGNAL,
                           hDriver,
                           dwParam1,
                           dwParam2);
end;

  // Implement Additional Prototypes here.

end.
