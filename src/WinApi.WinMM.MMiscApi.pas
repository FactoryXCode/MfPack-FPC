// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.WinMM.MMiscApi.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 15-09-2020
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: ApiSet Contract for api-ms-win-mm-misc-l1-1
//              This header is used by Windows Multimedia.
//              For more information, see: https://docs.microsoft.com/en-us/windows/win32/api/mmiscapi/
//
// Organisation: FactoryX
// Initiator(s): Tony (maXcomX), Peter (OzShips)
// Contributor(s): Tony Kalf (maXcomX), Peter Larson (ozships)
//
//------------------------------------------------------------------------------
// CHANGE LOG
// Date       Person              Reason
// ---------- ------------------- ----------------------------------------------
// 19/06/2024 All                 RammStein release  SDK 10.0.26100.0 (Windows 11)
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
// Source: mmiscapi.h
//
// Copyright (c) Microsoft Corporation. All rights reserved.
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
unit WinApi.WinMM.MMiscApi;

{$I MfPack.Fpc.inc}

{$PACKENUM 4}

{$IFDEF WIN32}
    {$ALIGN 1}
{$ELSE}
{$ALIGN 8}
// Win64
{$ENDIF}

interface


uses
  {WinApi}
  Windows,
  WinApi.WinApiTypes,
  WinApi.WinMM.MMSysCom;


  {$I 'WinApiTypes.inc'}


  //***************************************************************************
  //
  //                        Installable driver support
  //
  //***************************************************************************

type

  PDRVCONFIGINFOEX = ^DRVCONFIGINFOEX;

  DRVCONFIGINFOEX = record
    dwDCISize: DWORD;
    lpszDCISectionName: PWideChar;
    lpszDCIAliasName: PWideChar;
    dnDevNode: DWORD;
  end;

  { Driver messages }

const

  DRV_LOAD = $0001;
  DRV_ENABLE = $0002;
  DRV_OPEN = $0003;
  DRV_CLOSE = $0004;
  DRV_DISABLE = $0005;
  DRV_FREE = $0006;
  DRV_CONFIGURE = $0007;
  DRV_QUERYCONFIGURE = $0008;
  DRV_INSTALL = $0009;
  DRV_REMOVE = $000A;
  DRV_EXITSESSION = $000B;
  DRV_POWER = $000F;
  DRV_RESERVED = $0800;
  DRV_USER = $4000;

  { LPARAM of DRV_CONFIGURE message }

type

  PDRVCONFIGINFO = ^tagDRVCONFIGINFO;

  tagDRVCONFIGINFO = record
    dwDCISize: DWORD;
    lpszDCISectionName: PWideChar;
    lpszDCIAliasName: PWideChar;
  end;
  DRVCONFIGINFO = tagDRVCONFIGINFO;

  { Supported return values for DRV_CONFIGURE message }

const

  DRVCNF_CANCEL = $0000;
  DRVCNF_OK = $0001;
  DRVCNF_RESTART = $0002;

  { installable driver function prototypes }

type
  // See https://docs.microsoft.com/en-us/windows/win32/api/mmiscapi/nc-mmiscapi-driverproc
  DRIVERPROC = function(Arg1: DWORD_PTR;
                        Arg2: HDRVR;
                        Arg3: UINT;
                        Arg4: LPARAM;
                        Arg5: LPARAM): LRESULT; stdcall;

function CloseDriver(hDriver: HDRVR;
                     lParam1: LPARAM;
                     lParam2: LPARAM): LRESULT; stdcall;

function OpenDriver(szDriverName: PWideChar;
                    szSectionName: PWideChar;
                    lParam2: LPARAM): HDRVR; stdcall;

function SendDriverMessage(hDriver: HDRVR;
                           _message: UINT;
                           lParam1: LPARAM;
                           lParam2: LPARAM): LRESULT; stdcall;

function DrvGetModuleHandle(hDriver: HDRVR): HMODULE; stdcall;

function GetDriverModuleHandle(hDriver: HDRVR): HMODULE; stdcall;

function DefDriverProc(dwDriverIdentifier: DWORD_PTR;
                       hdrvr: HDRVR;
                       uMsg: UINT;
                       lParam1: LPARAM;
                       lParam2: LPARAM): LRESULT; stdcall;


{ return values from DriverProc() function }

const

  DRV_CANCEL = DRVCNF_CANCEL;
  DRV_OK = DRVCNF_OK;
  DRV_RESTART = DRVCNF_RESTART;

  DRV_MCI_FIRST = DRV_RESERVED;
  DRV_MCI_LAST = (DRV_RESERVED + $FFF);

  //**************************************************************************
  //
  //                      Driver Helper function moved from mmddk.h
  //
  //**************************************************************************


  //  Parameters
  //    * dwCallback
  //      Address of the callback function, a window handle, or a task handle,
  //      depending on the flag specified in the dwFlags parameter.
  //
  //    * dwFlags
  //      Notification flags. It can be ONE of these values:
  //
  //      PARAMETERS              Value	Meaning
  //      ======================= ==================================================
  //      DCB_NOSWITCH            The system is prevented from switching stacks.
  //                              This value is only used if enough stack space for the
  //                              callback function is known to exist.
  //
  //      DCB_FUNCTION            The dwCallback parameter is the address of an application-defined callback function.
  //                              The system sends the callback message to the callback function.
  //
  //      DCB_WINDOW              The dwCallback parameter is the handle of an application-defined window.
  //                              The system sends subsequent notifications to the window.
  //
  //      DCB_TASK                The dwCallback parameter is the handle of an application or task.
  //                              The system sends subsequent notifications to the application or task.
  //
  //    * hDevice
  //      Handle of the installable driver instance.
  //
  //    * dwMsg
  //      Message value.
  //
  //    * dwUser
  //      32-bit user-instance data supplied by the application when the device was opened.
  //
  //    * dwParam1
  //      32-bit message-dependent parameter.
  //
  //    * dwParam2
  //      32-bit message-dependent parameter.

function DriverCallback(dwCallback: DWORD_PTR;
                        dwFlags: DWORD;
                        hDevice: HDRVR;
                        dwMsg: DWORD;
                        dwUser: DWORD_PTR;
                        dwParam1: DWORD_PTR;
                        dwParam2: DWORD_PTR): BOOL; stdcall;


//***************************************************************************
//
//  Sound schemes
//
//***************************************************************************

function sndOpenSound(EventName: PWideChar;
                      AppName: PWideChar;
                      Flags: INT32;
  {_Outptr_} FileHandle: PHANDLE): LONG; stdcall;


//
// removed from winmmi.h
//

//***************************************************************************
//
//  API to install/remove/query a MMSYS driver
//
//***************************************************************************

// generic prototype for audio device driver entry-point functions
// midMessage(), modMessage(), widMessage(), wodMessage(), auxMessage()
//

type

  DRIVERMSGPROC = function(arg1: DWORD;
                           arg2: DWORD;
                           arg3: DWORD_PTR;
                           arg4: DWORD_PTR;
                           arg5: DWORD_PTR): LRESULT; stdcall;

function mmDrvInstall(hDriver: HDRVR;
                      wszDrvEntry: PWideChar;
                      drvMessage: DRIVERMSGPROC;
                      wFlags: UINT): UINT; stdcall;


//***************************************************************************
//
//                        Multimedia File I/O support
//
//***************************************************************************

{ MMIO error return values }

const

  MMIOERR_BASE = 256;
  MMIOERR_FILENOTFOUND = (MMIOERR_BASE + 1);  { file not found }
  MMIOERR_OUTOFMEMORY = (MMIOERR_BASE + 2);  { out of memory }
  MMIOERR_CANNOTOPEN = (MMIOERR_BASE + 3);  { cannot open }
  MMIOERR_CANNOTCLOSE = (MMIOERR_BASE + 4);  { cannot close }
  MMIOERR_CANNOTREAD = (MMIOERR_BASE + 5);  { cannot read }
  MMIOERR_CANNOTWRITE = (MMIOERR_BASE + 6);  { cannot write }
  MMIOERR_CANNOTSEEK = (MMIOERR_BASE + 7);  { cannot seek }
  MMIOERR_CANNOTEXPAND = (MMIOERR_BASE + 8);  { cannot expand file }
  MMIOERR_CHUNKNOTFOUND = (MMIOERR_BASE + 9);  { chunk not found }
  MMIOERR_UNBUFFERED = (MMIOERR_BASE + 10);  {  }
  MMIOERR_PATHNOTFOUND = (MMIOERR_BASE + 11);  { path incorrect }
  MMIOERR_ACCESSDENIED = (MMIOERR_BASE + 12);  { file was protected }
  MMIOERR_SHARINGVIOLATION = (MMIOERR_BASE + 13);  { file in use }
  MMIOERR_NETWORKERROR = (MMIOERR_BASE + 14);  { network not responding }
  MMIOERR_TOOMANYOPENFILES = (MMIOERR_BASE + 15);  { no more file handles  }
  MMIOERR_INVALIDFILE = (MMIOERR_BASE + 16);  { default error file error }

  { MMIO constants }

  CFSEPCHAR = '+';  { compound file name separator char. }

type
  { MMIO data types }
  // Note: this data type is also declared in WinApi.WinApiTypes.
  PFOURCC = ^FOURCC;
  FOURCC = DWORD;

  { a four character code }
  PHuge = ^ huge;
  _huge = AnsiChar;
  huge = _huge;
  { a huge version of LPSTR }

  PHMMIO = ^HMMIO;
  HMMIO = IntPtr;      {a handle to an open file}


type

  PMMIOPROC = ^MMIOPROC;
  MMIOPROC = function(lpmmioinfo: PAnsiChar;
                      uMsg: UINT;
                      lParam1: LPARAM;
                      lParam2: LPARAM): LRESULT; stdcall;
  LPMMIOPROC = ^MMIOPROC;

  { general MMIO information data structure }

type

  PMMIOINFO = ^_MMIOINFO;

  _MMIOINFO = record
    { general fields }
    dwFlags: DWORD;                  { general status flags }
    fccIOProc: FOURCC;               { pointer to I/O procedure }
    pIOProc: LPMMIOPROC;             { pointer to I/O procedure }
    wErrorRet: UINT;                 { place for error to be returned }
    htask: HTASK;                    { alternate local task }
    { fields maintained by MMIO functions during buffered I/O }
    cchBuffer: LONG;                 { size of I/O buffer (or 0L) }
    pchBuffer: HPSTR;                { start of I/O buffer (or NULL) }
    pchNext: HPSTR;                  { pointer to next byte to read/write }
    pchEndRead: HPSTR;               { pointer to last valid byte to read }
    pchEndWrite: HPSTR;              { pointer to last byte to write }
    lBufOffset: LONG;                { disk offset of start of buffer }
    { fields maintained by I/O procedure }
    lDiskOffset: LONG;               { disk offset of next read or write }
    adwInfo: array[0..2] of DWORD;   { data specific to type of MMIOPROC }
    { other fields maintained by MMIO }
    dwReserved1: DWORD;              { reserved for MMIO use }
    dwReserved2: DWORD;              { reserved for MMIO use }
    hmmio: HMMIO;                    { handle to open file }
  end;
  MMIOINFO = _MMIOINFO;
  LPMMIOINFO = ^MMIOINFO;
  LPCMMIOINFO = ^MMIOINFO;

  { RIFF chunk information data structure }

type

  PMMCKINFO = ^_MMCKINFO;

  _MMCKINFO = record
    ckid: FOURCC;                   { chunk ID }
    cksize: DWORD;                  { chunk size }
    fccType: FOURCC;                { form type or list type }
    dwDataOffset: DWORD;            { offset of data portion of chunk }
    dwFlags: DWORD;                 { flags used by MMIO functions }
  end;
  MMCKINFO = _MMCKINFO;
  LPMMCKINFO = ^MMCKINFO;
  LPCMMCKINFO = ^MMCKINFO;

  { bit field masks }

const

  MMIO_RWMODE = $00000003;  { open file for reading/writing/both }
  MMIO_SHAREMODE = $00000070;  { file sharing mode number }

  { constants for dwFlags field of MMIOINFO }
  MMIO_CREATE = $00001000;  { create new file (or truncate file) }
  MMIO_PARSE = $00000100;  { parse new file returning path }
  MMIO_DELETE = $00000200;  { create new file (or truncate file) }
  MMIO_EXIST = $00004000;  { checks for existence of file }
  MMIO_ALLOCBUF = $00010000;  { mmioOpen() should allocate a buffer }
  MMIO_GETTEMP = $00020000;  { mmioOpen() should retrieve temp name }

  MMIO_DIRTY = $10000000;  { I/O buffer is dirty }

  { read/write mode numbers (bit field MMIO_RWMODE) }
  MMIO_READ = $00000000;  { open file for reading only }
  MMIO_WRITE = $00000001;  { open file for writing only }
  MMIO_READWRITE = $00000002;  { open file for reading and writing }

  { share mode numbers (bit field MMIO_SHAREMODE) }
  MMIO_COMPAT = $00000000;  { compatibility mode }
  MMIO_EXCLUSIVE = $00000010;  { exclusive-access mode }
  MMIO_DENYWRITE = $00000020;  { deny writing to other processes }
  MMIO_DENYREAD = $00000030;  { deny reading to other processes }
  MMIO_DENYNONE = $00000040;  { deny nothing to other processes }

  { various MMIO flags }
  MMIO_FHOPEN = $0010;  { mmioClose: keep file handle open }
  MMIO_EMPTYBUF = $0010;  { mmioFlush: empty the I/O buffer }
  MMIO_TOUPPER = $0010;  { mmioStringToFOURCC: to u-case }
  MMIO_INSTALLPROC = $00010000;  { mmioInstallIOProc: install MMIOProc }
  MMIO_GLOBALPROC = $10000000;  { mmioInstallIOProc: install globally }
  MMIO_REMOVEPROC = $00020000;  { mmioInstallIOProc: remove MMIOProc }
  MMIO_UNICODEPROC = $01000000;  { mmioInstallIOProc: Unicode MMIOProc }
  MMIO_FINDPROC = $00040000;  { mmioInstallIOProc: find an MMIOProc }
  MMIO_FINDCHUNK = $0010;  { mmioDescend: find a chunk by ID }
  MMIO_FINDRIFF = $0020;  { mmioDescend: find a LIST chunk }
  MMIO_FINDLIST = $0040;  { mmioDescend: find a RIFF chunk }
  MMIO_CREATERIFF = $0020;  { mmioCreateChunk: make a LIST chunk }
  MMIO_CREATELIST = $0040;  { mmioCreateChunk: make a RIFF chunk }

  { message numbers for MMIOPROC I/O procedure functions }

  MMIOM_READ = MMIO_READ;  { read }
  MMIOM_WRITE = MMIO_WRITE;  { write }
  MMIOM_SEEK = 2;  { seek to a new position in file }
  MMIOM_OPEN = 3;  { open file }
  MMIOM_CLOSE = 4;  { close file }
  MMIOM_WRITEFLUSH = 5;  { write and flush }
  MMIOM_RENAME = 6;  { rename specified file }
  MMIOM_USER = $8000;  { beginning of user-defined messages }

  { standard four character codes }

  FOURCC_RIFF = FOURCC(ord('R') or ord('I') shl 8 or (ord('F') shl 16) or (ord('F') shl 24));
  FOURCC_LIST = FOURCC(ord('L') or ord('I') shl 8 or (ord('S') shl 16) or (ord('T') shl 24));

  { four character codes used to identify standard built-in I/O procedures }

  FOURCC_DOS = FOURCC(ord('D') or ord('O') shl 8 or (ord('S') shl 16) or (ord(' ') shl 24));
  FOURCC_MEM = FOURCC(ord('M') or ord('E') shl 8 or (ord('M') shl 16) or (ord(' ') shl 24));


  { flags for mmioSeek() }

  SEEK_SET = 0;  { seek to an absolute position }
  SEEK_CUR = 1;  { seek relative to current position }
  SEEK_END = 2;  { seek relative to end of file }

  { other constants }
  MMIO_DEFAULTBUFFER = 8192;  { default buffer size }

  { MMIO macros }
  //#define mmioFOURCC(ch0, ch1, ch2, ch3)  MAKEFOURCC(ch0, ch1, ch2, ch3)
  // For MAKEFOURCC see: WinApi.MmReg

  { MMIO function prototypes }

function mmioStringToFOURCC(sz: PWideChar;
                            uFlags: UINT): FOURCC; stdcall;

function mmioStringToFOURCCA(sz: PAnsiChar;
                             uFlags: UINT): FOURCC; stdcall;

function mmioStringToFOURCCW(sz: PWideChar;
                             uFlags: UINT): FOURCC; stdcall;


function mmioInstallIOProc(fccIOProc: FOURCC;
  {_In_opt_} pIOProc: LPMMIOPROC;
                           dwFlags: DWORD): LPMMIOPROC; stdcall;

function mmioInstallIOProcA(fccIOProc: FOURCC;
  {_In_opt_} pIOProc: PMMIOPROC;
                            dwFlags: DWORD): LPMMIOPROC; stdcall;

function mmioInstallIOProcW(fccIOProc: FOURCC;
  {_In_opt_} pIOProc: PMMIOPROC;
                            dwFlags: DWORD): PMMIOPROC; stdcall;

// This funtion is deprecated. Instead use CreateFile or CreateFile2.
function mmioOpen(szFileName: LPWSTR;
                  lpmmioinfo: PMMIOInfo;
                  dwOpenFlags: DWORD): HMMIO; stdcall;

function mmioOpenA(szFileName: LPSTR;
                   szNewFileName: LPSTR;
                   lpmmioinfo: PMMIOInfo;
                   dwRenameFlags: DWORD): HMMIO; stdcall;

function mmioOpenW(szFileName: LPWSTR;
                   lpmmioinfo: PMMIOInfo;
                   dwOpenFlags: DWORD): HMMIO; stdcall;


function mmioRename(szFileName: LPWSTR;
                    szNewFileName: LPWSTR;
                    lpmmioinfo: PMMIOInfo;
                    dwRenameFlags: DWORD): MMRESULT; stdcall;

function mmioRenameA(szFileName: LPSTR;
                     szNewFileName: LPSTR;
                     lpmmioinfo: PMMIOInfo;
                     dwRenameFlags: DWORD): MMRESULT; stdcall;

function mmioRenameW(szFileName: LPWSTR;
                     szNewFileName: LPWSTR;
                     lpmmioinfo: PMMIOInfo;
                     dwRenameFlags: DWORD): MMRESULT; stdcall;

function mmioClose(hmmio: HMMIO;
                   uFlags: UINT): MMRESULT; stdcall;

function mmioRead(hmmio: HMMIO;
                  pch: PAnsiChar;
                  cch: Longint): Longint; stdcall;

function mmioWrite(hmmio: HMMIO;
                   pch: PAnsiChar;
                   cch: Longint): Longint; stdcall;

function mmioSeek(hmmio: HMMIO;
                  lOffset: LONG;
                  iOrigin: Int): Longint; stdcall;

function mmioGetInfo(hmmio: HMMIO;
                     lpmmioinfo: PMMIOINFO;
                     uFlags: UINT): MMRESULT; stdcall;

function mmioSetInfo(hmmio: HMMIO;
                     lpmmioinfo: PMMIOINFO;
                     uFlags: UINT): MMRESULT; stdcall;

function mmioSetBuffer(hmmio: HMMIO;
                       pchBuffer: PAnsiChar;
                       cchBuffer: LONG;
                       uFlags: Word): MMRESULT; stdcall;

function mmioFlush(hmmio: HMMIO;
                   uFlags: UINT): MMRESULT; stdcall;

function mmioAdvance(hmmio: HMMIO;
                     lpmmioinfo: PMMIOINFO;
                     uFlags: UINT): MMRESULT; stdcall;

function mmioSendMessage(hmmio: HMMIO;
                         uMessage: UINT;
                         lParam1: DWORD;
                         lParam2: DWORD): Longint; stdcall;

function mmioDescend(hmmio: HMMIO;
                     lpck: PMMCKINFO;
                     lpckParent: PMMCKINFO;
                     uFlags: UINT): MMRESULT; stdcall;

function mmioAscend(hmmio: HMMIO;
                    lpck: PMMCKINFO;
                    uFlags: UINT): MMRESULT; stdcall;

function mmioCreateChunk(hmmio: HMMIO;
                         lpck: PMMCKINFO;
                         uFlags: UINT): MMRESULT; stdcall;


// Additional Prototypes for ALL Interfaces

// End of Additional Prototypes

implementation

const
  MMiscApiLib = 'Winmm.dll';

function CloseDriver; external MMiscApiLib name 'CloseDriver';
function OpenDriver; external MMiscApiLib name 'OpenDriver';
function SendDriverMessage; external MMiscApiLib name 'SendDriverMessage';
function DrvGetModuleHandle; external MMiscApiLib name 'DrvGetModuleHandle';
function GetDriverModuleHandle; external MMiscApiLib name 'GetDriverModuleHandle';
function DefDriverProc; external MMiscApiLib name 'DefDriverProc';
function DriverCallback; external MMiscApiLib name 'DriverCallback';
function sndOpenSound; external MMiscApiLib name 'sndOpenSound';
function mmDrvInstall; external MMiscApiLib name 'mmDrvInstall';

function mmioStringToFOURCC; external MMiscApiLib name 'mmioStringToFOURCCW';
function mmioStringToFOURCCA; external MMiscApiLib name 'mmioStringToFOURCCA';
function mmioStringToFOURCCW; external MMiscApiLib name 'mmioStringToFOURCCW';

function mmioInstallIOProc; external MMiscApiLib name 'mmioInstallIOProcW';
function mmioInstallIOProcA; external MMiscApiLib name 'mmioInstallIOProcA';
function mmioInstallIOProcW; external MMiscApiLib name 'mmioInstallIOProcW';


function mmioOpen; external MMiscApiLib name 'mmioOpenW'; // Deprecated
function mmioOpenA; external MMiscApiLib name 'mmioOpenA';
function mmioOpenW; external MMiscApiLib name 'mmioOpenW';

function mmioRename; external MMiscApiLib name 'mmioRenameW';
function mmioRenameA; external MMiscApiLib name 'mmioRenameA';
function mmioRenameW; external MMiscApiLib name 'mmioRenameW';

function mmioClose; external MMiscApiLib name 'mmioClose';
function mmioRead; external MMiscApiLib name 'mmioRead';
function mmioWrite; external MMiscApiLib name 'mmioWrite';
function mmioSeek; external MMiscApiLib name 'mmioSeek';
function mmioGetInfo; external MMiscApiLib name 'mmioGetInfo';
function mmioSetInfo; external MMiscApiLib name 'mmioSetInfo';
function mmioSetBuffer; external MMiscApiLib name 'mmioSetBuffer';
function mmioFlush; external MMiscApiLib name 'mmioFlush';
function mmioAdvance; external MMiscApiLib name 'mmioAdvance';
function mmioSendMessage; external MMiscApiLib name 'mmioSendMessage';
function mmioDescend; external MMiscApiLib name 'mmioDescend';
function mmioAscend; external MMiscApiLib name 'mmioAscend';
function mmioCreateChunk; external MMiscApiLib name 'mmioCreateChunk';

// Implement Additional functions here.

end.
