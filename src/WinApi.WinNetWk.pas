// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MfPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.WinNetWk.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 05-05-2026
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: Standard WINNET Header File for WIN32.
//
// Organisation: FactoryX
// Initiator(s): Tony (maXcomX), Peter (OzShips)
// Contributor(s): Tony Kalf (maXcomX)
//
//------------------------------------------------------------------------------
// CHANGE LOG
// Date       Person              Reason
// ---------- ------------------- ----------------------------------------------
// 15/11/2026 All                 Eels release  SDK 10.0.28000.2705 (Windows 11)
//------------------------------------------------------------------------------
//
// Remarks: - This unit intentionally declares both ANSI and Unicode entry points.
//          - FPC applications should normally use the explicit W versions.
//          - The unsuffixed helper aliases at the bottom map to the Unicode versions.
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
// Source: winnetwk.h
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
unit WinApi.WinNetWk;

{$I MfPack.Fpc.inc}


interface

uses
  
  {WinApi}
  Windows,
  WinApi.WinError,
  WinApi.WinApiTypes;

  {$PACKRECORDS C}

  {$PACKENUM 4}

  {$IFDEF WIN32}
    {$ALIGN 1}
  {$ELSE}
    {$ALIGN 8} // Win64
  {$ENDIF}

  {$I 'WinApiTypes.inc'}

const

 { Network Resources }
  RESOURCE_CONNECTED = $00000001;
  RESOURCE_GLOBALNET = $00000002;
  RESOURCE_REMEMBERED = $00000003;
  RESOURCE_RECENT = $00000004;
  RESOURCE_CONTEXT = $00000005;

  RESOURCETYPE_ANY = $00000000;
  RESOURCETYPE_DISK = $00000001;
  RESOURCETYPE_PRINT = $00000002;
  RESOURCETYPE_RESERVED = $00000008;
  RESOURCETYPE_UNKNOWN = DWORD($FFFFFFFF);

  RESOURCEUSAGE_CONNECTABLE = $00000001;
  RESOURCEUSAGE_CONTAINER = $00000002;
  RESOURCEUSAGE_NOLOCALDEVICE = $00000004;
  RESOURCEUSAGE_SIBLING = $00000008;
  RESOURCEUSAGE_ATTACHED = $00000010;
  RESOURCEUSAGE_ALL = RESOURCEUSAGE_CONNECTABLE or RESOURCEUSAGE_CONTAINER or RESOURCEUSAGE_ATTACHED;
  RESOURCEUSAGE_RESERVED = DWORD($80000000);

  RESOURCEDISPLAYTYPE_GENERIC = $00000000;
  RESOURCEDISPLAYTYPE_DOMAIN = $00000001;
  RESOURCEDISPLAYTYPE_SERVER = $00000002;
  RESOURCEDISPLAYTYPE_SHARE = $00000003;
  RESOURCEDISPLAYTYPE_FILE = $00000004;
  RESOURCEDISPLAYTYPE_GROUP = $00000005;
  RESOURCEDISPLAYTYPE_NETWORK = $00000006;
  RESOURCEDISPLAYTYPE_ROOT = $00000007;
  RESOURCEDISPLAYTYPE_SHAREADMIN = $00000008;
  RESOURCEDISPLAYTYPE_DIRECTORY = $00000009;
  RESOURCEDISPLAYTYPE_TREE = $0000000A;
  RESOURCEDISPLAYTYPE_NDSCONTAINER = $0000000B;

  { Network Connections }
  NETPROPERTY_PERSISTENT = 1;

  CONNECT_UPDATE_PROFILE = $00000001;
  CONNECT_UPDATE_RECENT = $00000002;
  CONNECT_TEMPORARY = $00000004;
  CONNECT_INTERACTIVE = $00000008;
  CONNECT_PROMPT = $00000010;
  CONNECT_NEED_DRIVE = $00000020;
  CONNECT_REFCOUNT = $00000040;
  CONNECT_REDIRECT = $00000080;
  CONNECT_LOCALDRIVE = $00000100;
  CONNECT_CURRENT_MEDIA = $00000200;
  CONNECT_DEFERRED = $00000400;
  CONNECT_COMMANDLINE = $00000800;
  CONNECT_CMD_SAVECRED = $00001000;
  CONNECT_CRED_RESET = $00002000;
  CONNECT_REQUIRE_INTEGRITY = $00004000;
  CONNECT_REQUIRE_PRIVACY = $00008000;
  CONNECT_WRITE_THROUGH_SEMANTICS = $00010000;
  CONNECT_GLOBAL_MAPPING = $00040000;
  CONNECT_RESERVED = DWORD($FF000000);

  { Connection Dialogs }
  CONNDLG_RO_PATH = $00000001;
  CONNDLG_CONN_POINT = $00000002;
  CONNDLG_USE_MRU = $00000004;
  CONNDLG_HIDE_BOX = $00000008;
  CONNDLG_PERSIST = $00000010;
  CONNDLG_NOT_PERSIST = $00000020;

  DISC_UPDATE_PROFILE = $00000001;
  DISC_NO_FORCE = $00000040;

  { Universal Naming }
  UNIVERSAL_NAME_INFO_LEVEL = $00000001;
  REMOTE_NAME_INFO_LEVEL = $00000002;

  { Other }
  WNFMT_MULTILINE = $01;
  WNFMT_ABBREVIATED = $02;
  WNFMT_INENUM = $10;
  WNFMT_CONNECTION = $20;

  NETINFO_DLL16 = $00000001;
  NETINFO_DISKRED = $00000004;
  NETINFO_PRINTERRED = $00000008;

  { Status Codes }
  WN_SUCCESS = NO_ERROR;
  WN_NO_ERROR = NO_ERROR;
  WN_NOT_SUPPORTED = ERROR_NOT_SUPPORTED;
  WN_CANCEL = ERROR_CANCELLED;
  WN_RETRY = ERROR_RETRY;
  WN_NET_ERROR = ERROR_UNEXP_NET_ERR;
  WN_MORE_DATA = ERROR_MORE_DATA;
  WN_BAD_POINTER = ERROR_INVALID_ADDRESS;
  WN_BAD_VALUE = ERROR_INVALID_PARAMETER;
  WN_BAD_USER = ERROR_BAD_USERNAME;
  WN_BAD_PASSWORD = ERROR_INVALID_PASSWORD;
  WN_ACCESS_DENIED = ERROR_ACCESS_DENIED;
  WN_FUNCTION_BUSY = ERROR_BUSY;
  WN_WINDOWS_ERROR = ERROR_UNEXP_NET_ERR;
  WN_OUT_OF_MEMORY = ERROR_NOT_ENOUGH_MEMORY;
  WN_NO_NETWORK = ERROR_NO_NETWORK;
  WN_EXTENDED_ERROR = ERROR_EXTENDED_ERROR;
  WN_BAD_LEVEL = ERROR_INVALID_LEVEL;
  WN_BAD_HANDLE = ERROR_INVALID_HANDLE;
  WN_NOT_INITIALIZING = ERROR_ALREADY_INITIALIZED;
  WN_NO_MORE_DEVICES = ERROR_NO_MORE_DEVICES;

  WN_NOT_CONNECTED = ERROR_NOT_CONNECTED;
  WN_OPEN_FILES = ERROR_OPEN_FILES;
  WN_DEVICE_IN_USE = ERROR_DEVICE_IN_USE;
  WN_BAD_NETNAME = ERROR_BAD_NET_NAME;
  WN_BAD_LOCALNAME = ERROR_BAD_DEVICE;
  WN_ALREADY_CONNECTED = ERROR_ALREADY_ASSIGNED;
  WN_DEVICE_ERROR = ERROR_GEN_FAILURE;
  WN_CONNECTION_CLOSED = ERROR_CONNECTION_UNAVAIL;
  WN_NO_NET_OR_BAD_PATH = ERROR_NO_NET_OR_BAD_PATH;
  WN_BAD_PROVIDER = ERROR_BAD_PROVIDER;
  WN_CANNOT_OPEN_PROFILE = ERROR_CANNOT_OPEN_PROFILE;
  WN_BAD_PROFILE = ERROR_BAD_PROFILE;
  WN_BAD_DEV_TYPE = ERROR_BAD_DEV_TYPE;
  WN_DEVICE_ALREADY_REMEMBERED = ERROR_DEVICE_ALREADY_REMEMBERED;
  WN_CONNECTED_OTHER_PASSWORD = ERROR_CONNECTED_OTHER_PASSWORD;
  WN_CONNECTED_OTHER_PASSWORD_DEFAULT = ERROR_CONNECTED_OTHER_PASSWORD_DEFAULT;

  WN_NO_MORE_ENTRIES = ERROR_NO_MORE_ITEMS;
  WN_NOT_CONTAINER = ERROR_NOT_CONTAINER;

  WN_NOT_AUTHENTICATED = ERROR_NOT_AUTHENTICATED;
  WN_NOT_LOGGED_ON = ERROR_NOT_LOGGED_ON;
  WN_NOT_VALIDATED = ERROR_NO_LOGON_SERVERS;

  { For Shell }
  WNCON_FORNETCARD = $00000001;
  WNCON_NOTROUTED = $00000002;
  WNCON_SLOWLINK = $00000004;
  WNCON_DYNAMIC = $00000008;

type

  PNETRESOURCEA = ^NETRESOURCEA;
  LPNETRESOURCEA = PNETRESOURCEA;

  _NETRESOURCEA = record
    dwScope: DWORD;
    dwType: DWORD;
    dwDisplayType: DWORD;
    dwUsage: DWORD;
    lpLocalName: PAnsiChar;
    lpRemoteName: PAnsiChar;
    lpComment: PAnsiChar;
    lpProvider: PAnsiChar;
  end;
  NETRESOURCEA = _NETRESOURCEA;
  PNETRESOURCEW = ^NETRESOURCEW;
  LPNETRESOURCEW = PNETRESOURCEW;

  _NETRESOURCEW = record
    dwScope: DWORD;
    dwType: DWORD;
    dwDisplayType: DWORD;
    dwUsage: DWORD;
    lpLocalName: LPWSTR;
    lpRemoteName: LPWSTR;
    lpComment: LPWSTR;
    lpProvider: LPWSTR;
  end;
  NETRESOURCEW = _NETRESOURCEW;
  NETRESOURCE = NETRESOURCEW;
  PNETRESOURCE = PNETRESOURCEW;
  LPNETRESOURCE = LPNETRESOURCEW;


  LPCONNECTDLGSTRUCTA = ^CONNECTDLGSTRUCTA;
  _CONNECTDLGSTRUCTA = record
    cbStructure: DWORD;
    hwndOwner: HWND;
    lpConnRes: LPNETRESOURCEA;
    dwFlags: DWORD;
    dwDevNum: DWORD;
  end;
  CONNECTDLGSTRUCTA = _CONNECTDLGSTRUCTA;


  LPCONNECTDLGSTRUCTW = ^CONNECTDLGSTRUCTW;
  _CONNECTDLGSTRUCTW = record
    cbStructure: DWORD;
    hwndOwner: HWND;
    lpConnRes: LPNETRESOURCEW;
    dwFlags: DWORD;
    dwDevNum: DWORD;
  end;
  CONNECTDLGSTRUCTW = _CONNECTDLGSTRUCTW;
  CONNECTDLGSTRUCT = CONNECTDLGSTRUCTW;
  LPCONNECTDLGSTRUCT = LPCONNECTDLGSTRUCTW;


  LPDISCDLGSTRUCTA = ^DISCDLGSTRUCTA;
  _DISCDLGSTRUCTA = record
    cbStructure: DWORD;
    hwndOwner: HWND;
    lpLocalName: PAnsiChar;
    lpRemoteName: PAnsiChar;
    dwFlags: DWORD;
  end;
  DISCDLGSTRUCTA = _DISCDLGSTRUCTA;

  LPDISCDLGSTRUCTW = ^DISCDLGSTRUCTW;
  _DISCDLGSTRUCTW = record
    cbStructure: DWORD;
    hwndOwner: HWND;
    lpLocalName: LPWSTR;
    lpRemoteName: LPWSTR;
    dwFlags: DWORD;
  end;
  DISCDLGSTRUCTW = _DISCDLGSTRUCTW;
  DISCDLGSTRUCT = DISCDLGSTRUCTW;
  LPDISCDLGSTRUCT = LPDISCDLGSTRUCTW;


  LPUNIVERSAL_NAME_INFOA = ^UNIVERSAL_NAME_INFOA;
  _UNIVERSAL_NAME_INFOA = record
    lpUniversalName: PAnsiChar;
  end;
  UNIVERSAL_NAME_INFOA = _UNIVERSAL_NAME_INFOA;

  LPUNIVERSAL_NAME_INFOW = ^UNIVERSAL_NAME_INFOW;
  _UNIVERSAL_NAME_INFOW = record
    lpUniversalName: LPWSTR;
  end;
  UNIVERSAL_NAME_INFOW = _UNIVERSAL_NAME_INFOW;

  UNIVERSAL_NAME_INFO = UNIVERSAL_NAME_INFOW;
  LPUNIVERSAL_NAME_INFO = LPUNIVERSAL_NAME_INFOW;

  LPREMOTE_NAME_INFOA = ^REMOTE_NAME_INFOA;
  _REMOTE_NAME_INFOA = record
    lpUniversalName: PAnsiChar;
    lpConnectionName: PAnsiChar;
    lpRemainingPath: PAnsiChar;
  end;
  REMOTE_NAME_INFOA = _REMOTE_NAME_INFOA;

  LPREMOTE_NAME_INFOW = ^REMOTE_NAME_INFOW;
  _REMOTE_NAME_INFOW = record
    lpUniversalName: LPWSTR;
    lpConnectionName: LPWSTR;
    lpRemainingPath: LPWSTR;
  end;
  REMOTE_NAME_INFOW = _REMOTE_NAME_INFOW;

  REMOTE_NAME_INFO = REMOTE_NAME_INFOW;
  LPREMOTE_NAME_INFO = LPREMOTE_NAME_INFOW;
  TREMOTE_NAME_INFO = REMOTE_NAME_INFOW;

  LPNETINFOSTRUCT = ^NETINFOSTRUCT;
  _NETINFOSTRUCT = record
    cbStructure: DWORD;
    dwProviderVersion: DWORD;
    dwStatus: DWORD;
    dwCharacteristics: DWORD;
    dwHandle: ULONG_PTR;
    wNetType: WORD;
    dwPrinters: DWORD;
    dwDrives: DWORD;
  end;
  NETINFOSTRUCT = _NETINFOSTRUCT;


  LPNETCONNECTINFOSTRUCT = ^NETCONNECTINFOSTRUCT;
  _NETCONNECTINFOSTRUCT = record
    cbStructure: DWORD;
    dwFlags: DWORD;
    dwSpeed: DWORD;
    dwDelay: DWORD;
    dwOptDataSize: DWORD;
  end;
  NETCONNECTINFOSTRUCT = _NETCONNECTINFOSTRUCT;


{ Network Connections }
function WNetAddConnectionA(lpRemoteName: PAnsiChar;
                            lpPassword: PAnsiChar;
                            lpLocalName: PAnsiChar): DWORD; stdcall;

function WNetAddConnectionW(lpRemoteName: LPWSTR;
                            lpPassword: LPWSTR;
                            lpLocalName: LPWSTR): DWORD; stdcall;

function WNetAddConnection2A(lpNetResource: LPNETRESOURCEA;
                             lpPassword: PAnsiChar;
                             lpUserName: PAnsiChar;
                             dwFlags: DWORD): DWORD; stdcall;

function WNetAddConnection2W(lpNetResource: LPNETRESOURCEW;
                             lpPassword: LPWSTR;
                             lpUserName: LPWSTR;
                             dwFlags: DWORD): DWORD; stdcall;

function WNetAddConnection3A(hwndOwner: HWND;
                             lpNetResource: LPNETRESOURCEA;
                             lpPassword: PAnsiChar;
                             lpUserName: PAnsiChar;
                             dwFlags: DWORD): DWORD; stdcall;

function WNetAddConnection3W(hwndOwner: HWND;
                             lpNetResource: LPNETRESOURCEW;
                             lpPassword: LPWSTR;
                             lpUserName: LPWSTR;
                             dwFlags: DWORD): DWORD; stdcall;

function WNetAddConnection4A(hwndOwner: HWND;
                             lpNetResource: LPNETRESOURCEA;
                             pAuthBuffer: Pointer;
                             cbAuthBuffer: DWORD;
                             dwFlags: DWORD;
                             lpUseOptions: PByte;
                             cbUseOptions: DWORD): DWORD; stdcall;

function WNetAddConnection4W(hwndOwner: HWND;
                             lpNetResource: LPNETRESOURCEW;
                             pAuthBuffer: Pointer;
                             cbAuthBuffer: DWORD;
                             dwFlags: DWORD;
                             lpUseOptions: PByte;
                             cbUseOptions: DWORD): DWORD; stdcall;


function WNetCancelConnectionA(lpName: PAnsiChar;
                               fForce: BOOL): DWORD; stdcall;

function WNetCancelConnectionW(lpName: LPWSTR;
                               fForce: BOOL): DWORD; stdcall;

function WNetCancelConnection2A(lpName: PAnsiChar;
                                dwFlags: DWORD;
                                fForce: BOOL): DWORD; stdcall;

function WNetCancelConnection2W(lpName: LPWSTR;
                                dwFlags: DWORD;
                                fForce: BOOL): DWORD; stdcall;

function WNetGetConnectionA(lpLocalName: PAnsiChar;
                            lpRemoteName: PAnsiChar;
                            var lpnLength: DWORD): DWORD; stdcall;

function WNetGetConnectionW(lpLocalName: LPWSTR;
                            lpRemoteName: LPWSTR;
                            var lpnLength: DWORD): DWORD; stdcall;

function WNetRestoreSingleConnectionW(hwndParent: HWND;
                                      lpDevice: LPWSTR;
                                      fUseUI: BOOL): DWORD; stdcall;

function WNetRestoreConnectionW(hWnd: HWND;
                                lpDevice: LPWSTR): DWORD; stdcall;

function WNetUseConnectionA(hwndOwner: HWND;
                            lpNetResource: LPNETRESOURCEA;
                            lpPassword: PAnsiChar;
                            lpUserId: PAnsiChar;
                            dwFlags: DWORD;
                            lpAccessName: PAnsiChar;
                            var lpBufferSize: DWORD;
                            lpResult: LPDWORD): DWORD; stdcall;

function WNetUseConnectionW(hwndOwner: HWND;
                            lpNetResource: LPNETRESOURCEW;
                            lpPassword: LPWSTR;
                            lpUserId: LPWSTR;
                            dwFlags: DWORD;
                            lpAccessName: LPWSTR;
                            var lpBufferSize: DWORD;
                            lpResult: LPDWORD): DWORD; stdcall;

function WNetUseConnection4A(hwndOwner: HWND;
                             lpNetResource: LPNETRESOURCEA;
                             pAuthBuffer: Pointer;
                             cbAuthBuffer: DWORD;
                             dwFlags: DWORD;
                             lpUseOptions: PByte;
                             cbUseOptions: DWORD;
                             lpAccessName: PAnsiChar;
                             var lpBufferSize: DWORD;
                             lpResult: LPDWORD): DWORD; stdcall;

function WNetUseConnection4W(hwndOwner: HWND;
                             lpNetResource: LPNETRESOURCEW;
                             pAuthBuffer: Pointer;
                             cbAuthBuffer: DWORD;
                             dwFlags: DWORD;
                             lpUseOptions: PByte;
                             cbUseOptions: DWORD;
                             lpAccessName: LPWSTR;
                             var lpBufferSize: DWORD;
                             lpResult: LPDWORD): DWORD; stdcall;

{ Network Connection Dialogs }
function WNetConnectionDialog(hwnd: HWND;
                              dwType: DWORD): DWORD; stdcall;

function WNetDisconnectDialog(hwnd: HWND;
                              dwType: DWORD): DWORD; stdcall;

function WNetConnectionDialog1A(lpConnDlgStruct: LPCONNECTDLGSTRUCTA): DWORD; stdcall;

function WNetConnectionDialog1W(lpConnDlgStruct: LPCONNECTDLGSTRUCTW): DWORD; stdcall;

function WNetDisconnectDialog1A(lpConnDlgStruct: LPDISCDLGSTRUCTA): DWORD; stdcall;

function WNetDisconnectDialog1W(lpConnDlgStruct: LPDISCDLGSTRUCTW): DWORD; stdcall;

{ Network Browsing }
function WNetOpenEnumA(dwScope: DWORD;
                       dwType: DWORD;
                       dwUsage: DWORD;
                       lpNetResource: LPNETRESOURCEA;
                       var lphEnum: THandle): DWORD; stdcall;

function WNetOpenEnumW(dwScope: DWORD;
                       dwType: DWORD;
                       dwUsage: DWORD;
                       lpNetResource: LPNETRESOURCEW;
                       var lphEnum: THandle): DWORD; stdcall;

function WNetEnumResourceA(hEnum: THandle;
                           var lpcCount: DWORD;
                           lpBuffer: Pointer;
                           var lpBufferSize: DWORD): DWORD; stdcall;

function WNetEnumResourceW(hEnum: THandle;
                           var lpcCount: DWORD;
                           lpBuffer: Pointer;
                           var lpBufferSize: DWORD): DWORD; stdcall;

function WNetCloseEnum(hEnum: THandle): DWORD; stdcall;

function WNetGetResourceParentA(lpNetResource: LPNETRESOURCEA;
                                lpBuffer: Pointer;
                                var lpcbBuffer: DWORD): DWORD; stdcall;

function WNetGetResourceParentW(lpNetResource: LPNETRESOURCEW;
                                lpBuffer: Pointer;
                                var lpcbBuffer: DWORD): DWORD; stdcall;

function WNetGetResourceInformationA(lpNetResource: LPNETRESOURCEA;
                                     lpBuffer: Pointer;
                                     var lpcbBuffer: DWORD;
                                     var lplpSystem: PAnsiChar): DWORD; stdcall;

function WNetGetResourceInformationW(lpNetResource: LPNETRESOURCEW;
                                     lpBuffer: Pointer;
                                     var lpcbBuffer: DWORD;
                                     var lplpSystem: LPWSTR): DWORD; stdcall;

{ Universal Naming }
function WNetGetUniversalNameA(lpLocalPath: PAnsiChar;
                               dwInfoLevel: DWORD;
                               lpBuffer: Pointer;
                               var lpBufferSize: DWORD): DWORD; stdcall;

function WNetGetUniversalNameW(lpLocalPath: LPWSTR;
                               dwInfoLevel: DWORD;
                               lpBuffer: Pointer;
                               var lpBufferSize: DWORD): DWORD; stdcall;

{ Authentication and Logon/Logoff }
function WNetGetUserA(lpName: PAnsiChar;
                      lpUserName: PAnsiChar;
                      var lpnLength: DWORD): DWORD; stdcall;

function WNetGetUserW(lpName: LPWSTR;
                      lpUserName: LPWSTR;
                      var lpnLength: DWORD): DWORD; stdcall;

{ Other }
function WNetGetProviderNameA(dwNetType: DWORD;
                              lpProviderName: PAnsiChar;
                              var lpBufferSize: DWORD): DWORD; stdcall;

function WNetGetProviderNameW(dwNetType: DWORD;
                              lpProviderName: LPWSTR;
                              var lpBufferSize: DWORD): DWORD; stdcall;

function WNetGetNetworkInformationA(lpProvider: PAnsiChar;
                                    lpNetInfoStruct: LPNETINFOSTRUCT): DWORD; stdcall;

function WNetGetNetworkInformationW(lpProvider: LPWSTR;
                                    lpNetInfoStruct: LPNETINFOSTRUCT): DWORD; stdcall;

{ Error Handling }
function WNetGetLastErrorA(lpError: LPDWORD;
                           lpErrorBuf: PAnsiChar;
                           nErrorBufSize: DWORD;
                           lpNameBuf: PAnsiChar;
                           nNameBufSize: DWORD): DWORD; stdcall;

function WNetGetLastErrorW(lpError: LPDWORD;
                           lpErrorBuf: LPWSTR;
                           nErrorBufSize: DWORD;
                           lpNameBuf: LPWSTR;
                           nNameBufSize: DWORD): DWORD; stdcall;

{ For Shell }
function MultinetGetConnectionPerformanceA(lpNetResource: LPNETRESOURCEA;
                                           lpNetConnectInfoStruct: LPNETCONNECTINFOSTRUCT): DWORD; stdcall;

function MultinetGetConnectionPerformanceW(lpNetResource: LPNETRESOURCEW;
                                           lpNetConnectInfoStruct: LPNETCONNECTINFOSTRUCT): DWORD; stdcall;


{ Unicode aliases }
function WNetAddConnection(lpRemoteName: LPWSTR;
                           lpPassword: LPWSTR;
                           lpLocalName: LPWSTR): DWORD; stdcall; inline;

function WNetAddConnection2(lpNetResource: LPNETRESOURCEW;
                            lpPassword: LPWSTR;
                            lpUserName: LPWSTR;
                            dwFlags: DWORD): DWORD; stdcall; inline;

function WNetAddConnection3(hwndOwner: HWND;
                            lpNetResource: LPNETRESOURCEW;
                            lpPassword: LPWSTR;
                            lpUserName: LPWSTR;
                            dwFlags: DWORD): DWORD; stdcall; inline;

function WNetCancelConnection(lpName: LPWSTR;
                              fForce: BOOL): DWORD; stdcall; inline;

function WNetCancelConnection2(lpName: LPWSTR;
                               dwFlags: DWORD;
                               fForce: BOOL): DWORD; stdcall; inline;

function WNetGetConnection(lpLocalName: LPWSTR;
                           lpRemoteName: LPWSTR;
                           var lpnLength: DWORD): DWORD; stdcall; inline;

function WNetUseConnection(hwndOwner: HWND;
                           lpNetResource: LPNETRESOURCEW;
                           lpPassword: LPWSTR;
                           lpUserId: LPWSTR;
                           dwFlags: DWORD;
                           lpAccessName: LPWSTR;
                           var lpBufferSize: DWORD;
                           lpResult: LPDWORD): DWORD; stdcall; inline;

function WNetConnectionDialog1(lpConnDlgStruct: LPCONNECTDLGSTRUCTW): DWORD; stdcall; inline;

function WNetDisconnectDialog1(lpConnDlgStruct: LPDISCDLGSTRUCTW): DWORD; stdcall; inline;

function WNetOpenEnum(dwScope: DWORD;
                      dwType: DWORD;
                      dwUsage: DWORD;
                      lpNetResource: LPNETRESOURCEW;
                      var lphEnum: THandle): DWORD; stdcall; inline;

function WNetEnumResource(hEnum: THandle;
                          var lpcCount: DWORD;
                          lpBuffer: Pointer;
                          var lpBufferSize: DWORD): DWORD; stdcall; inline;

function WNetGetResourceParent(lpNetResource: LPNETRESOURCEW;
                               lpBuffer: Pointer;
                               var lpcbBuffer: DWORD): DWORD; stdcall; inline;

function WNetGetResourceInformation(lpNetResource: LPNETRESOURCEW;
                                    lpBuffer: Pointer;
                                    var lpcbBuffer: DWORD;
                                    var lplpSystem: LPWSTR): DWORD; stdcall; inline;

function WNetGetUniversalName(lpLocalPath: LPWSTR;
                              dwInfoLevel: DWORD;
                              lpBuffer: Pointer;
                              var lpBufferSize: DWORD): DWORD; stdcall; inline;

function WNetGetUser(lpName: LPWSTR;
                     lpUserName: LPWSTR;
                     var lpnLength: DWORD): DWORD; stdcall; inline;

function WNetGetProviderName(dwNetType: DWORD;
                             lpProviderName: LPWSTR;
                             var lpBufferSize: DWORD): DWORD; stdcall; inline;

function WNetGetNetworkInformation(lpProvider: LPWSTR;
                                   lpNetInfoStruct: LPNETINFOSTRUCT): DWORD; stdcall; inline;

function WNetGetLastError(lpError: LPDWORD;
                          lpErrorBuf: LPWSTR;
                          nErrorBufSize: DWORD;
                          lpNameBuf: LPWSTR;
                          nNameBufSize: DWORD): DWORD; stdcall; inline;

function MultinetGetConnectionPerformance(lpNetResource: LPNETRESOURCEW;
                                          lpNetConnectInfoStruct: LPNETCONNECTINFOSTRUCT): DWORD; stdcall; inline;


  // Additional prototypes for ALL interfaces

  // End of additional prototypes

function WNetAddConnection4(hwndOwner: HWND;
                            lpNetResource: LPNETRESOURCEW;
                            pAuthBuffer: Pointer;
                            cbAuthBuffer: DWORD;
                            dwFlags: DWORD;
                            lpUseOptions: PByte;
                            cbUseOptions: DWORD): DWORD; stdcall; inline;

function WNetUseConnection4(hwndOwner: HWND;
                            lpNetResource: LPNETRESOURCEW;
                            pAuthBuffer: Pointer;
                            cbAuthBuffer: DWORD;
                            dwFlags: DWORD;
                            lpUseOptions: PByte;
                            cbUseOptions: DWORD;
                            lpAccessName: LPWSTR;
                            var lpBufferSize: DWORD;
                            lpResult: LPDWORD): DWORD; stdcall; inline;

implementation

  // Implement additional prototypes here.


function WNetAddConnection(lpRemoteName: LPWSTR;
                           lpPassword: LPWSTR;
                           lpLocalName: LPWSTR): DWORD; stdcall;
begin

  Result := WNetAddConnectionW(lpRemoteName,
                               lpPassword,
                               lpLocalName);
end;


function WNetAddConnection2(lpNetResource: LPNETRESOURCEW;
                            lpPassword: LPWSTR;
                            lpUserName: LPWSTR;
                            dwFlags: DWORD): DWORD; stdcall;
begin

  Result := WNetAddConnection2W(lpNetResource,
                                lpPassword,
                                lpUserName,
                                dwFlags);
end;


function WNetAddConnection3(hwndOwner: HWND;
                            lpNetResource: LPNETRESOURCEW;
                            lpPassword: LPWSTR;
                            lpUserName: LPWSTR;
                            dwFlags: DWORD): DWORD; stdcall;
begin

  Result := WNetAddConnection3W(hwndOwner,
                                lpNetResource,
                                lpPassword,
                                lpUserName,
                                dwFlags);
end;


function WNetCancelConnection(lpName: LPWSTR;
                              fForce: BOOL): DWORD; stdcall;
begin

  Result := WNetCancelConnectionW(lpName,
                                  fForce);
end;


function WNetCancelConnection2(lpName: LPWSTR;
                               dwFlags: DWORD;
                               fForce: BOOL): DWORD; stdcall;
begin

  Result := WNetCancelConnection2W(lpName,
                                   dwFlags,
                                   fForce);
end;


function WNetGetConnection(lpLocalName: LPWSTR;
                           lpRemoteName: LPWSTR;
                           var lpnLength: DWORD): DWORD; stdcall;
begin

  Result := WNetGetConnectionW(lpLocalName,
                               lpRemoteName,
                               lpnLength);
end;


function WNetUseConnection(hwndOwner: HWND;
                           lpNetResource: LPNETRESOURCEW;
                           lpPassword: LPWSTR;
                           lpUserId: LPWSTR;
                           dwFlags: DWORD;
                           lpAccessName: LPWSTR;
                           var lpBufferSize: DWORD;
                           lpResult: LPDWORD): DWORD; stdcall;
begin

  Result := WNetUseConnectionW(hwndOwner,
                               lpNetResource,
                               lpPassword,
                               lpUserId,
                               dwFlags,
                               lpAccessName,
                               lpBufferSize,
                               lpResult);
end;


function WNetConnectionDialog1(lpConnDlgStruct: LPCONNECTDLGSTRUCTW): DWORD; stdcall;
begin

  Result := WNetConnectionDialog1W(lpConnDlgStruct);
end;


function WNetDisconnectDialog1(lpConnDlgStruct: LPDISCDLGSTRUCTW): DWORD; stdcall;
begin

  Result := WNetDisconnectDialog1W(lpConnDlgStruct);
end;


function WNetOpenEnum(dwScope: DWORD;
                      dwType: DWORD;
                      dwUsage: DWORD;
                      lpNetResource: LPNETRESOURCEW;
                      var lphEnum: THandle): DWORD; stdcall;
begin

  Result := WNetOpenEnumW(dwScope,
                          dwType,
                          dwUsage,
                          lpNetResource,
                          lphEnum);
end;

function WNetEnumResource(hEnum: THandle;
                          var lpcCount: DWORD;
                          lpBuffer: Pointer;
                          var lpBufferSize: DWORD): DWORD; stdcall;
begin

  Result := WNetEnumResourceW(hEnum,
                              lpcCount,
                              lpBuffer,
                              lpBufferSize);
end;


function WNetGetResourceParent(lpNetResource: LPNETRESOURCEW;
                               lpBuffer: Pointer;
                               var lpcbBuffer: DWORD): DWORD; stdcall;
begin

  Result := WNetGetResourceParentW(lpNetResource,
                                   lpBuffer,
                                   lpcbBuffer);
end;


function WNetGetResourceInformation(lpNetResource: LPNETRESOURCEW;
                                    lpBuffer: Pointer;
                                    var lpcbBuffer: DWORD;
                                    var lplpSystem: LPWSTR): DWORD; stdcall;
begin

  Result := WNetGetResourceInformationW(lpNetResource,
                                        lpBuffer,
                                        lpcbBuffer,
                                        lplpSystem);
end;


function WNetGetUniversalName(lpLocalPath: LPWSTR;
                              dwInfoLevel: DWORD;
                              lpBuffer: Pointer;
                              var lpBufferSize: DWORD): DWORD; stdcall;
begin

  Result := WNetGetUniversalNameW(lpLocalPath,
                                  dwInfoLevel,
                                  lpBuffer,
                                  lpBufferSize);
end;


function WNetGetUser(lpName: LPWSTR;
                     lpUserName: LPWSTR;
                     var lpnLength: DWORD): DWORD; stdcall;
begin

  Result := WNetGetUserW(lpName,
                         lpUserName,
                         lpnLength);
end;


function WNetGetProviderName(dwNetType: DWORD;
                             lpProviderName: LPWSTR;
                             var lpBufferSize: DWORD): DWORD; stdcall;
begin

  Result := WNetGetProviderNameW(dwNetType,
                                 lpProviderName,
                                 lpBufferSize);
end;


function WNetGetNetworkInformation(lpProvider: LPWSTR;
                                   lpNetInfoStruct: LPNETINFOSTRUCT): DWORD; stdcall;
begin

  Result := WNetGetNetworkInformationW(lpProvider,
                                       lpNetInfoStruct);
end;


function WNetGetLastError(lpError: LPDWORD;
                          lpErrorBuf: LPWSTR;
                          nErrorBufSize: DWORD;
                          lpNameBuf: LPWSTR;
                          nNameBufSize: DWORD): DWORD; stdcall;
begin

  Result := WNetGetLastErrorW(lpError,
                              lpErrorBuf,
                              nErrorBufSize,
                              lpNameBuf,
                              nNameBufSize);
end;


function MultinetGetConnectionPerformance(lpNetResource: LPNETRESOURCEW;
                                          lpNetConnectInfoStruct: LPNETCONNECTINFOSTRUCT): DWORD; stdcall;
begin

  Result := MultinetGetConnectionPerformanceW(lpNetResource,
                                              lpNetConnectInfoStruct);
end;


const
  mprLib = 'mpr.dll';

  function WNetAddConnectionA; external mprLib name 'WNetAddConnectionA' ;
  function WNetAddConnectionW; external mprLib name 'WNetAddConnectionW' ;
  function WNetAddConnection2A; external mprLib name 'WNetAddConnection2A' ;
  function WNetAddConnection2W; external mprLib name 'WNetAddConnection2W' ;
  function WNetAddConnection3A; external mprLib name 'WNetAddConnection3A' ;
  function WNetAddConnection3W; external mprLib name 'WNetAddConnection3W' ;
  function WNetAddConnection4A; external mprLib name 'WNetAddConnection4A' ;
  function WNetAddConnection4W; external mprLib name 'WNetAddConnection4W' ;

  function WNetCancelConnectionA; external mprLib name 'WNetCancelConnectionA' ;
  function WNetCancelConnectionW; external mprLib name 'WNetCancelConnectionW' ;
  function WNetCancelConnection2A; external mprLib name 'WNetCancelConnection2A' ;
  function WNetCancelConnection2W; external mprLib name 'WNetCancelConnection2W' ;
  function WNetGetConnectionA; external mprLib name 'WNetGetConnectionA' ;
  function WNetGetConnectionW; external mprLib name 'WNetGetConnectionW' ;

  function WNetRestoreSingleConnectionW; external mprLib name 'WNetRestoreSingleConnectionW' ;
  function WNetRestoreConnectionW(hWnd: HWND;
                                lpDevice: LPWSTR): DWORD; stdcall;
type
  TLegacyRestore = function(hWnd: Windows.HWND;
                            lpDevice: LPWSTR): DWORD; stdcall;
var
  ModuleHandle: HMODULE;
  Restore: TLegacyRestore;
begin
  ModuleHandle := LoadLibraryW(PWideChar(mprLib));
  if ModuleHandle = 0 then
    begin
      Result := GetLastError;
      Exit;
    end;
  try
    Restore := TLegacyRestore(GetProcAddress(ModuleHandle,'WNetRestoreConnectionW'));
    if Assigned(Restore) then
      Result := Restore(hWnd,lpDevice)
    else
      Result := ERROR_CALL_NOT_IMPLEMENTED;
  finally
    FreeLibrary(ModuleHandle);
  end;
end;

  function WNetUseConnectionA; external mprLib name 'WNetUseConnectionA' ;
  function WNetUseConnectionW; external mprLib name 'WNetUseConnectionW' ;
  function WNetUseConnection4A; external mprLib name 'WNetUseConnection4A' ;
  function WNetUseConnection4W; external mprLib name 'WNetUseConnection4W' ;

  function WNetConnectionDialog; external mprLib name 'WNetConnectionDialog' ;
  function WNetDisconnectDialog; external mprLib name 'WNetDisconnectDialog' ;
  function WNetConnectionDialog1A; external mprLib name 'WNetConnectionDialog1A' ;
  function WNetConnectionDialog1W; external mprLib name 'WNetConnectionDialog1W' ;
  function WNetDisconnectDialog1A; external mprLib name 'WNetDisconnectDialog1A' ;
  function WNetDisconnectDialog1W; external mprLib name 'WNetDisconnectDialog1W' ;

  function WNetOpenEnumA; external mprLib name 'WNetOpenEnumA' ;
  function WNetOpenEnumW; external mprLib name 'WNetOpenEnumW' ;
  function WNetEnumResourceA; external mprLib name 'WNetEnumResourceA' ;
  function WNetEnumResourceW; external mprLib name 'WNetEnumResourceW' ;
  function WNetCloseEnum; external mprLib name 'WNetCloseEnum' ;

  function WNetGetResourceParentA; external mprLib name 'WNetGetResourceParentA' ;
  function WNetGetResourceParentW; external mprLib name 'WNetGetResourceParentW' ;
  function WNetGetResourceInformationA; external mprLib name 'WNetGetResourceInformationA' ;
  function WNetGetResourceInformationW; external mprLib name 'WNetGetResourceInformationW' ;
  function WNetGetUniversalNameA; external mprLib name 'WNetGetUniversalNameA' ;
  function WNetGetUniversalNameW; external mprLib name 'WNetGetUniversalNameW' ;

  function WNetGetUserA; external mprLib name 'WNetGetUserA' ;
  function WNetGetUserW; external mprLib name 'WNetGetUserW' ;

  function WNetGetProviderNameA; external mprLib name 'WNetGetProviderNameA' ;
  function WNetGetProviderNameW; external mprLib name 'WNetGetProviderNameW' ;
  function WNetGetNetworkInformationA; external mprLib name 'WNetGetNetworkInformationA' ;
  function WNetGetNetworkInformationW; external mprLib name 'WNetGetNetworkInformationW' ;

  function WNetGetLastErrorA; external mprLib name 'WNetGetLastErrorA' ;
  function WNetGetLastErrorW; external mprLib name 'WNetGetLastErrorW' ;

  function MultinetGetConnectionPerformanceA; external mprLib name 'MultinetGetConnectionPerformanceA' ;
  function MultinetGetConnectionPerformanceW; external mprLib name 'MultinetGetConnectionPerformanceW' ;

function WNetAddConnection4(hwndOwner: HWND;
                            lpNetResource: LPNETRESOURCEW;
                            pAuthBuffer: Pointer;
                            cbAuthBuffer: DWORD;
                            dwFlags: DWORD;
                            lpUseOptions: PByte;
                            cbUseOptions: DWORD): DWORD; stdcall;
begin
  Result := WNetAddConnection4W(hwndOwner,
                                lpNetResource,
                                pAuthBuffer,
                                cbAuthBuffer,
                                dwFlags,
                                lpUseOptions,
                                cbUseOptions);
end;

function WNetUseConnection4(hwndOwner: HWND;
                            lpNetResource: LPNETRESOURCEW;
                            pAuthBuffer: Pointer;
                            cbAuthBuffer: DWORD;
                            dwFlags: DWORD;
                            lpUseOptions: PByte;
                            cbUseOptions: DWORD;
                            lpAccessName: LPWSTR;
                            var lpBufferSize: DWORD;
                            lpResult: LPDWORD): DWORD; stdcall;
begin
  Result := WNetUseConnection4W(hwndOwner,
                                lpNetResource,
                                pAuthBuffer,
                                cbAuthBuffer,
                                dwFlags,
                                lpUseOptions,
                                cbUseOptions,
                                lpAccessName,
                                lpBufferSize,
                                lpResult);
end;

end.
