// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.Evntrace.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 24-11-2015
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: Public headers for event tracing control applications,
// consumers and providers.
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
// Remarks: LIBRARY CHANGES:
//          Sechost.dll on Windows 8.1 and Windows Server 2012 R2;
//          Advapi32.dll on Windows 8, Windows Server 2012, Windows 7,
//          Windows Server 2008 R2, Windows Server 2008, Windows Vista and Windows XP
//          See: const EvntraceLib declaration.
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
// Source: evntrace.h
//
// Copyright (c) Microsoft Corporation. All rights reserved.
//==============================================================================
//
// FPC port updated: 2026-11-16
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
unit WinApi.Evntrace;

{$I MfPack.Fpc.inc}


interface

uses

  {Winapi}
  Windows,
  Winapi.Wmistr,
  Winapi.evntprov,
  Winapi.Evntcons,
  WinApi.WinApiTypes;

  {$PACKENUM 4}

  {$IFDEF WIN32}
    {$ALIGN 1}
  {$ELSE}
    {$ALIGN 8} // Win64
  {$ENDIF}


const

  // EventTraceGuid is used to identify a event tracing session
  // ==========================================================
  // 68fdd900-4a3e-11d1-84f4-0000f80464e3
  EventTraceGuid  :  TGUID = (D1: $68fdd900;
                              D2: $4a3e;
                              D3: $11d1;
                              D4: ($84, $f4, $00, $00, $f8, $04, $64, $e3));

  // SystemTraceControlGuid. Used to specify event tracing for kernel
  // ================================================================
  // 9e814aad-3204-11d2-9a82-006008a86939
  SystemTraceControlGuid  :  TGUID = (D1: $9e814aad;
                                      D2: $3204;
                                      D3: $11d2;
                                      D4: ($9a, $82, $00, $60, $08, $a8, $69, $39));

  // EventTraceConfigGuid. Used to report system configuration records
  // =================================================================
  // 01853a65-418f-4f36-aefc-dc0f1d2fd235
  EventTraceConfigGuid  :  TGUID = (D1: $01853a65;
                                    D2: $418f;
                                    D3: $4f36;
                                    D4: ($ae, $fc, $dc, $0f, $1d, $2f, $d2, $35));

  // DefaultTraceSecurityGuid. Specifies the default event tracing security
  // ======================================================================
  // 0811c1af-7a07-4a06-82ed-869455cdf713
  DefaultTraceSecurityGuid  :  TGUID = (D1: $0811c1af;
                                        D2: $7a07;
                                        D3: $4a06;
                                        D4: ($82, $ed, $86, $94, $55, $cd, $f7, $13));

  // PrivateLoggerNotificationGuid. Used for private cross-process logger notifications.
  // ===================================================================================
  PrivateLoggerNotificationGuid : TGUID = (D1: $3595ab5c;
                                           D2: $042a;
                                           D3: $4c8e;
                                           D4: ($b9, $42, $2d, $05, $9b, $fe, $b1, $b1));

  //
  // System Provider GUIDs
  //

  SystemIoFilterProviderGuid : TGUID = (D1: $fbd09363;
                                        D2: $9e22;
                                        D3: $4661;
                                        D4: ($b8, $bf, $e7, $a3, $4b, $53, $5b, $8c));


  SystemObjectProviderGuid : TGUID = (D1: $febd7460;
                                      D2: $3d1d;
                                      D3: $47eb;
                                      D4: ($af, $49, $c9, $ee, $b1, $e1, $46, $f2));


  SystemPowerProviderGuid : TGUID = (D1: $c134884a;
                                     D2: $32d5;
                                     D3: $4488;
                                     D4: ($80, $e5, $14, $ed, $7a, $bb, $82, $69));

  SystemHypervisorProviderGuid : TGUID = (D1: $bafa072a;
                                          D2: $918a;
                                          D3: $4bed;
                                          D4: ($b6, $22, $bc, $15, $20, $97, $9, $8f));

  SystemLockProviderGuid : TGUID = (D1: $721ddfd3;
                                    D2: $dacc;
                                    D3: $4e1e;
                                    D4: ($b2, $6a, $a2, $cb, $31, $d4, $70, $5a));

  SystemConfigProviderGuid : TGUID = (D1: $fef3a8b6;
                                      D2: $318d;
                                      D3: $4b67;
                                      D4: ($a9, $6a, $3b, $f, $6b, $8f, $18, $fe));

  SystemCpuProviderGuid : TGUID = (D1: $c6c5265f;
                                   D2: $eae8;
                                   D3: $4650;
                                   D4: ($aa, $e4, $9d, $48, $60, $3d, $85, $10));

  SystemSchedulerProviderGuid : TGUID = (D1: $599a2a76;
                                         D2: $4d91;
                                         D3: $4910;
                                         D4: ($9a, $c7, $7d, $33, $f2, $e9, $7a, $6c));

  SystemProfileProviderGuid : TGUID = (D1: $bfeb0324;
                                       D2: $1cee;
                                       D3: $496f;
                                       D4: ($a4, $9, $2a, $c2, $b4, $8a, $63, $22));

  SystemIoProviderGuid : TGUID = (D1: $3d5c43e3;
                                  D2: $f1c;
                                  D3: $4202;
                                  D4: ($b8, $17, $17, $4c, $0, $70, $dc, $79));

  SystemMemoryProviderGuid : TGUID = (D1: $82958ca9;
                                      D2: $b6cd;
                                      D3: $47f8;
                                      D4: ($a3, $a8, $3, $ae, $85, $a4, $bc, $24));

  SystemRegistryProviderGuid : TGUID = (D1: $16156bd9;
                                        D2: $fab4;
                                        D3: $4cfa;
                                        D4: ($a2, $32, $89, $d1, $9, $90, $58, $e3));

  SystemProcessProviderGuid : TGUID = (D1: $151f55dc;
                                       D2: $467d;
                                       D3: $471f;
                                       D4: ($83, $b5, $5f, $88, $9d, $46, $ff, $66));

  SystemAlpcProviderGuid : TGUID = (D1: $fcb9baaf;
                                    D2: $e529;
                                    D3: $4980;
                                    D4: ($92, $e9, $ce, $d1, $a6, $aa, $df, $df));

  SystemSyscallProviderGuid : TGUID = (D1: $434286f7;
                                       D2: $6f1b;
                                       D3: $45bb;
                                       D4: ($b3, $7e, $95, $f6, $23, $04, $6c, $7c));

  SystemInterruptProviderGuid : TGUID = (D1: $d4bbee17;
                                         D2: $b545;
                                         D3: $4888;
                                         D4: ($85, $8b, $74, $41, $69, $01, $5b, $25));

  SystemTimerProviderGuid : TGUID = (D1: $4f061568;
                                     D2: $e215;
                                     D3: $499f;
                                     D4: ($ab, $2e, $ed, $a0, $ae, $89, $0a, $5b));


  KERNEL_LOGGER_NAMEW                 = 'NT Kernel Logger';
  GLOBAL_LOGGER_NAMEW                 = 'GlobalLogger';
  EVENT_LOGGER_NAMEW                  = 'EventLog';
  DIAG_LOGGER_NAMEW                   = 'DiagLog';

  KERNEL_LOGGER_NAMEA                 = 'NT Kernel Logger';
  GLOBAL_LOGGER_NAMEA                 = 'GlobalLogger';
  EVENT_LOGGER_NAMEA                  = 'EventLog';
  DIAG_LOGGER_NAMEA                   = 'DiagLog';

  MAX_MOF_FIELDS                      = 16;  // Limit of USE_MOF_PTR fields

type

{$IFNDEF _TRACEHANDLE_DEFINED}
{$IFDEF UNICODE}
  ETW_LPTSTR = PWideChar;
{$ELSE}
  ETW_LPTSTR = PAnsiChar;
{$ENDIF}

  PTRACEHANDLE = ^ULONG64;
  TRACEHANDLE = ULONG64;
  PTRACEGUID_HANDLE = ^TRACEGUID_HANDLE;
  TRACEGUID_HANDLE = ULONG64;
{$DEFINE _TRACEHANDLE_DEFINED}
{$ENDIF}

  // Used to read the events from a trace file or real-time trace session (via
  // ProcessTrace). The handle is invalid if it contains the value
  // INVALID_PROCESSTRACE_HANDLE. Obtain the handle by calling an OpenTrace
  // function (e.g.  OpenTrace, OpenTraceFromFile, OpenTraceFromRealTimeLogger).
  // Close the handle by calling CloseTrace.
  PPROCESSTRACE_HANDLE = ^PROCESSTRACE_HANDLE;
  PROCESSTRACE_HANDLE = ULONG64;

  // Used to identify a trace collection session. The id is invalid if it
  // contains the value (CONTROLTRACE_ID)0. Obtain the id from StartTrace or from
  // the Wnode.HistoricalContext field of the EVENT_TRACE_PROPERTIES returned by
  // ControlTrace(0, sessionName, ...). The id is valid until the trace stops and
  // does not need to be closed by the user.
  PCONTROLTRACE_ID = ^CONTROLTRACE_ID;
  CONTROLTRACE_ID = ULONG64;

const
  // types for event data going to System Event Logger

  SYSTEM_EVENT_TYPE                   = 1;


  // predefined generic event types ($00 to $09 reserved).
  // =======================================================

  EVENT_TRACE_TYPE_INFO               = $00;  // Info or point event
  EVENT_TRACE_TYPE_START              = $01;  // Start event
  EVENT_TRACE_TYPE_END                = $02;  // End event
  EVENT_TRACE_TYPE_STOP               = $02;  // Stop event (WinEvent compatible)
  EVENT_TRACE_TYPE_DC_START           = $03;  // Collection start marker
  EVENT_TRACE_TYPE_DC_END             = $04;  // Collection end marker
  EVENT_TRACE_TYPE_EXTENSION          = $05;  // Extension/continuation
  EVENT_TRACE_TYPE_REPLY              = $06;  // Reply event
  EVENT_TRACE_TYPE_DEQUEUE            = $07;  // De-queue event
  EVENT_TRACE_TYPE_RESUME             = $07;  // Resume event (WinEvent compatible)
  EVENT_TRACE_TYPE_CHECKPOINT         = $08;  // Generic checkpoint event
  EVENT_TRACE_TYPE_SUSPEND            = $08;  // Suspend event (WinEvent compatible)
  EVENT_TRACE_TYPE_WINEVT_SEND        = $09;  // Send Event (WinEvent compatible)
  EVENT_TRACE_TYPE_WINEVT_RECEIVE     = $F0;  // Receive Event (WinEvent compatible)


  // Predefined Event Tracing Levels for Software/Debug Tracing
  //
  //
  // Trace Level is UCHAR and passed in through the EnableLevel parameter
  // in EnableTrace API. It is retrieved by the provider using the
  // GetTraceEnableLevel macro.It should be interpreted as an integer value
  // to mean everything at or below that level will be traced.

  // Here are the possible Levels.
  // =============================

  TRACE_LEVEL_NONE                    = 0;  // Tracing is not on
  TRACE_LEVEL_CRITICAL                = 1;  // Abnormal exit or termination
  TRACE_LEVEL_FATAL                   = 1;  // Deprecated name for Abnormal exit or termination
  TRACE_LEVEL_ERROR                   = 2;  // Severe errors that need logging
  TRACE_LEVEL_WARNING                 = 3;  // Warnings such as allocation failure
  TRACE_LEVEL_INFORMATION             = 4;  // Includes non-error cases(e.g.,Entry-Exit)
  TRACE_LEVEL_VERBOSE                 = 5;  // Detailed traces from intermediate steps
  TRACE_LEVEL_RESERVED6               = 6;
  TRACE_LEVEL_RESERVED7               = 7;
  TRACE_LEVEL_RESERVED8               = 8;
  TRACE_LEVEL_RESERVED9               = 9;



  // Event types for Process & Threads
  // ==================================

  EVENT_TRACE_TYPE_LOAD               = $0A;  // Load image
  EVENT_TRACE_TYPE_TERMINATE          = $0B;  // Terminate Process


  // Event types for IO subsystem
  // ============================

  EVENT_TRACE_TYPE_IO_READ            = $0A;
  EVENT_TRACE_TYPE_IO_WRITE           = $0B;
  EVENT_TRACE_TYPE_IO_READ_INIT       = $0C;
  EVENT_TRACE_TYPE_IO_WRITE_INIT      = $0D;
  EVENT_TRACE_TYPE_IO_FLUSH           = $0E;
  EVENT_TRACE_TYPE_IO_FLUSH_INIT      = $0F;
  EVENT_TRACE_TYPE_IO_REDIRECTED_INIT = $10;


  // Event types for Memory subsystem
  // ================================

  EVENT_TRACE_TYPE_MM_TF              = $0A;  // Transition fault
  EVENT_TRACE_TYPE_MM_DZF             = $0B;  // Demand Zero fault
  EVENT_TRACE_TYPE_MM_COW             = $0C;  // Copy on Write
  EVENT_TRACE_TYPE_MM_GPF             = $0D;  // Guard Page fault
  EVENT_TRACE_TYPE_MM_HPF             = $0E;  // Hard page fault
  EVENT_TRACE_TYPE_MM_AV              = $0F;  // Access violation


  // Event types for Network subsystem, all protocols
  // ================================================

  EVENT_TRACE_TYPE_SEND               = $0A;  // Send
  EVENT_TRACE_TYPE_RECEIVE            = $0B;  // Receive
  EVENT_TRACE_TYPE_CONNECT            = $0C;  // Connect
  EVENT_TRACE_TYPE_DISCONNECT         = $0D;  // Disconnect
  EVENT_TRACE_TYPE_RETRANSMIT         = $0E;  // ReTransmit
  EVENT_TRACE_TYPE_ACCEPT             = $0F;  // Accept
  EVENT_TRACE_TYPE_RECONNECT          = $10;  // ReConnect
  EVENT_TRACE_TYPE_CONNFAIL           = $11;  // Fail
  EVENT_TRACE_TYPE_COPY_TCP           = $12;  // Copy in PendData
  EVENT_TRACE_TYPE_COPY_ARP           = $13;  // NDIS_STATUS_RESOURCES Copy
  EVENT_TRACE_TYPE_ACKFULL            = $14;  // A full data ACK
  EVENT_TRACE_TYPE_ACKPART            = $15;  // A Partial data ACK
  EVENT_TRACE_TYPE_ACKDUP             = $16;  // A Duplicate data ACK


  // Event Types for the Header (to handle internal event headers)
  // =============================================================

  EVENT_TRACE_TYPE_GUIDMAP            = $0A;
  EVENT_TRACE_TYPE_CONFIG             = $0B;
  EVENT_TRACE_TYPE_SIDINFO            = $0C;
  EVENT_TRACE_TYPE_SECURITY           = $0D;
  EVENT_TRACE_TYPE_DBGID_RSDS         = $40;


  // Event Types for Registry subsystem
  // ==================================

  EVENT_TRACE_TYPE_REGCREATE          = $0A;  // NtCreateKey
  EVENT_TRACE_TYPE_REGOPEN            = $0B;  // NtOpenKey
  EVENT_TRACE_TYPE_REGDELETE          = $0C;  // NtDeleteKey
  EVENT_TRACE_TYPE_REGQUERY           = $0D;  // NtQueryKey
  EVENT_TRACE_TYPE_REGSETVALUE        = $0E;  // NtSetValueKey
  EVENT_TRACE_TYPE_REGDELETEVALUE     = $0F;  // NtDeleteValueKey
  EVENT_TRACE_TYPE_REGQUERYVALUE      = $10;  // NtQueryValueKey
  EVENT_TRACE_TYPE_REGENUMERATEKEY    = $11;  // NtEnumerateKey
  EVENT_TRACE_TYPE_REGENUMERATEVALUEKEY= $12;  // NtEnumerateValueKey
  EVENT_TRACE_TYPE_REGQUERYMULTIPLEVALUE= $13;  // NtQueryMultipleValueKey
  EVENT_TRACE_TYPE_REGSETINFORMATION  = $14;  // NtSetInformationKey
  EVENT_TRACE_TYPE_REGFLUSH           = $15;  // NtFlushKey
  EVENT_TRACE_TYPE_REGKCBCREATE       = $16;  // KcbCreate
  EVENT_TRACE_TYPE_REGKCBDELETE       = $17;  // KcbDelete
  EVENT_TRACE_TYPE_REGKCBRUNDOWNBEGIN = $18;  // KcbRundownBegin
  EVENT_TRACE_TYPE_REGKCBRUNDOWNEND   = $19;  // KcbRundownEnd
  EVENT_TRACE_TYPE_REGVIRTUALIZE      = $1A;  // VirtualizeKey
  EVENT_TRACE_TYPE_REGCLOSE           = $1B;  // NtClose (KeyObject)
  EVENT_TRACE_TYPE_REGSETSECURITY     = $1C;  // SetSecurityDescriptor (KeyObject)
  EVENT_TRACE_TYPE_REGQUERYSECURITY   = $1D;  // QuerySecurityDescriptor (KeyObject)
  EVENT_TRACE_TYPE_REGCOMMIT          = $1E;  // CmKtmNotification (TRANSACTION_NOTIFY_COMMIT)
  EVENT_TRACE_TYPE_REGPREPARE         = $1F;  // CmKtmNotification (TRANSACTION_NOTIFY_PREPARE)
  EVENT_TRACE_TYPE_REGROLLBACK        = $20;  // CmKtmNotification (TRANSACTION_NOTIFY_ROLLBACK)
  EVENT_TRACE_TYPE_REGMOUNTHIVE       = $21;  // NtLoadKey variations + system hives


  // Event types for system configuration records
  // ============================================

  EVENT_TRACE_TYPE_CONFIG_CPU             = $0A;  // CPU Configuration
  EVENT_TRACE_TYPE_CONFIG_PHYSICALDISK    = $0B;  // Physical Disk Configuration
  EVENT_TRACE_TYPE_CONFIG_LOGICALDISK     = $0C;  // Logical Disk Configuration
  EVENT_TRACE_TYPE_CONFIG_NIC             = $0D;  // NIC Configuration
  EVENT_TRACE_TYPE_CONFIG_VIDEO           = $0E;  // Video Adapter Configuration
  EVENT_TRACE_TYPE_CONFIG_SERVICES        = $0F;  // Active Services
  EVENT_TRACE_TYPE_CONFIG_POWER           = $10;  // ACPI Configuration
  EVENT_TRACE_TYPE_CONFIG_NETINFO         = $11;  // Networking Configuration
  EVENT_TRACE_TYPE_CONFIG_OPTICALMEDIA    = $12;  // Optical Media Configuration
  EVENT_TRACE_TYPE_CONFIG_PHYSICALDISK_EX = $13;  // Physical Disk Extended Configuration

  EVENT_TRACE_TYPE_CONFIG_IRQ             = $15;  // IRQ assigned to devices
  EVENT_TRACE_TYPE_CONFIG_PNP             = $16;  // PnP device info
  EVENT_TRACE_TYPE_CONFIG_IDECHANNEL      = $17;  // Primary/Secondary IDE channel Configuration
  EVENT_TRACE_TYPE_CONFIG_NUMANODE        = $18;  // Numa configuration
  EVENT_TRACE_TYPE_CONFIG_PLATFORM        = $19;  // Platform Configuration
  EVENT_TRACE_TYPE_CONFIG_PROCESSORGROUP  = $1A;  // Processor Group Configuration
  EVENT_TRACE_TYPE_CONFIG_PROCESSORNUMBER = $1B;  // ProcessorIndex -> ProcNumber mapping
  EVENT_TRACE_TYPE_CONFIG_DPI             = $1C;  // Display DPI Configuration
  EVENT_TRACE_TYPE_CONFIG_CI_INFO         = $1D;  // Display System Code Integrity Information
  EVENT_TRACE_TYPE_CONFIG_MACHINEID       = $1E;  // SQM Machine Id
  EVENT_TRACE_TYPE_CONFIG_DEFRAG          = $1F;  // Logical Disk Defragmenter Information
  EVENT_TRACE_TYPE_CONFIG_MOBILEPLATFORM  = $20;  // Mobile Platform Configuration
  EVENT_TRACE_TYPE_CONFIG_DEVICEFAMILY    = $21;  // Device Family Information
  EVENT_TRACE_TYPE_CONFIG_FLIGHTID        = $22;  // Flights on the machine
  EVENT_TRACE_TYPE_CONFIG_PROCESSOR       = $23;  // CentralProcessor records
  EVENT_TRACE_TYPE_CONFIG_VIRTUALIZATION  = $24;  // virtualization config info
  EVENT_TRACE_TYPE_CONFIG_BOOT            = $25;  // boot config info


  // Event types for Optical IO subsystem
  // ====================================

  EVENT_TRACE_TYPE_OPTICAL_IO_READ       = $37;
  EVENT_TRACE_TYPE_OPTICAL_IO_WRITE      = $38;
  EVENT_TRACE_TYPE_OPTICAL_IO_FLUSH      = $39;
  EVENT_TRACE_TYPE_OPTICAL_IO_READ_INIT  = $3A;
  EVENT_TRACE_TYPE_OPTICAL_IO_WRITE_INIT = $3B;
  EVENT_TRACE_TYPE_OPTICAL_IO_FLUSH_INIT = $3C;


  // Event types for Filter Manager
  // ==============================

  EVENT_TRACE_TYPE_FLT_PREOP_INIT        = $60;  // Minifilter preop initiation
  EVENT_TRACE_TYPE_FLT_POSTOP_INIT       = $61;  // Minifilter postop initiation
  EVENT_TRACE_TYPE_FLT_PREOP_COMPLETION  = $62;  // Minifilter preop completion
  EVENT_TRACE_TYPE_FLT_POSTOP_COMPLETION = $63;  // Minifilter postop completion
  EVENT_TRACE_TYPE_FLT_PREOP_FAILURE     = $64;  // Minifilter failed preop
  EVENT_TRACE_TYPE_FLT_POSTOP_FAILURE    = $65;  // Minifilter failed postop


  // Enable flags for Kernel Events
  // ==============================

  EVENT_TRACE_FLAG_PROCESS            = $00000001;  // process start & end
  EVENT_TRACE_FLAG_THREAD             = $00000002;  // thread start & end
  EVENT_TRACE_FLAG_IMAGE_LOAD         = $00000004;  // image load

  EVENT_TRACE_FLAG_DISK_IO            = $00000100;  // physical disk IO
  EVENT_TRACE_FLAG_DISK_FILE_IO       = $00000200;  // requires disk IO

  EVENT_TRACE_FLAG_MEMORY_PAGE_FAULTS = $00001000;  // all page faults
  EVENT_TRACE_FLAG_MEMORY_HARD_FAULTS = $00002000;  // hard faults only

  EVENT_TRACE_FLAG_NETWORK_TCPIP      = $00010000;  // tcpip send & receive

  EVENT_TRACE_FLAG_REGISTRY           = $00020000;  // registry calls
  EVENT_TRACE_FLAG_DBGPRINT           = $00040000;  // DbgPrint(ex) Calls


  // Enable flags for Kernel Events on Vista and above
  // =================================================

  EVENT_TRACE_FLAG_PROCESS_COUNTERS   = $00000008;  // process perf counters
  EVENT_TRACE_FLAG_CSWITCH            = $00000010;  // context switches
  EVENT_TRACE_FLAG_DPC                = $00000020;  // deferred procedure calls
  EVENT_TRACE_FLAG_INTERRUPT          = $00000040;  // interrupts
  EVENT_TRACE_FLAG_SYSTEMCALL         = $00000080;  // system calls

  EVENT_TRACE_FLAG_DISK_IO_INIT       = $00000400;  // physical disk IO initiation
  EVENT_TRACE_FLAG_ALPC               = $00100000;  // ALPC traces
  EVENT_TRACE_FLAG_SPLIT_IO           = $00200000;  // split io traces (VolumeManager)

  EVENT_TRACE_FLAG_DRIVER             = $00800000;  // driver delays
  EVENT_TRACE_FLAG_PROFILE            = $01000000;  // sample based profiling
  EVENT_TRACE_FLAG_FILE_IO            = $02000000;  // file IO
  EVENT_TRACE_FLAG_FILE_IO_INIT       = $04000000;  // file IO initiation


  // Enable flags for Kernel Events on Win7 and above
  // ================================================

  EVENT_TRACE_FLAG_DISPATCHER         = $00000800;  // scheduler (ReadyThread)
  EVENT_TRACE_FLAG_VIRTUAL_ALLOC      = $00004000;  // VM operations


  // Enable flags for Kernel Events on Win8 and above
  // ================================================

  EVENT_TRACE_FLAG_VAMAP              = $00008000;  // map/unmap (excluding images)
  EVENT_TRACE_FLAG_NO_SYSCONFIG       = $10000000;  // Do not do sys config rundown


  // Enable flags for Kernel Events on Threshold and above
  // =====================================================

  EVENT_TRACE_FLAG_JOB                = $00080000;  // job start & end
  EVENT_TRACE_FLAG_DEBUG_EVENTS       = $00400000;  // debugger events (break/continue/...)


  // Pre-defined Enable flags for everybody else
  // ===========================================

  EVENT_TRACE_FLAG_EXTENSION          = $80000000;  // Indicates more flags
  EVENT_TRACE_FLAG_FORWARD_WMI        = $40000000;  // Can forward to WMI
  EVENT_TRACE_FLAG_ENABLE_RESERVE     = $20000000;  // Reserved


  // Logger Mode flags
  // =================
  EVENT_TRACE_FILE_MODE_NONE          = $00000000;  // Logfile is off
  EVENT_TRACE_FILE_MODE_SEQUENTIAL    = $00000001;  // Log sequentially
  EVENT_TRACE_FILE_MODE_CIRCULAR      = $00000002;  // Log in circular manner
  EVENT_TRACE_FILE_MODE_APPEND        = $00000004;  // Append sequential log

  EVENT_TRACE_REAL_TIME_MODE          = $00000100;  // Real time mode on
  EVENT_TRACE_DELAY_OPEN_FILE_MODE    = $00000200;  // Delay opening file
  EVENT_TRACE_BUFFERING_MODE          = $00000400;  // Buffering mode only
  EVENT_TRACE_PRIVATE_LOGGER_MODE     = $00000800;  // Process Private Logger
  EVENT_TRACE_ADD_HEADER_MODE         = $00001000;  // Add a logfile header

  EVENT_TRACE_USE_GLOBAL_SEQUENCE     = $00004000;  // Use global sequence no.
  EVENT_TRACE_USE_LOCAL_SEQUENCE      = $00008000;  // Use local sequence no.

  EVENT_TRACE_RELOG_MODE              = $00010000;  // Relogger

  EVENT_TRACE_USE_PAGED_MEMORY        = $01000000;  // Use pageable buffers


  // Logger Mode flags on XP and above
  // =================================

  EVENT_TRACE_FILE_MODE_NEWFILE       = $00000008;  // Auto-switch log file
  EVENT_TRACE_FILE_MODE_PREALLOCATE   = $00000020;  // Pre-allocate mode


  // Logger Mode flags on Vista and above
  // ====================================

  EVENT_TRACE_NONSTOPPABLE_MODE       = $00000040;  // Session cannot be stopped (Autologger only)
  EVENT_TRACE_SECURE_MODE             = $00000080;  // Secure session
  EVENT_TRACE_USE_KBYTES_FOR_SIZE     = $00002000;  // Use KBytes as file size unit
  EVENT_TRACE_PRIVATE_IN_PROC         = $00020000;  // In process private logger

  EVENT_TRACE_MODE_RESERVED           = $00100000;  // Reserved bit, used to signal Heap/Critsec tracing


  // Logger Mode flags on Win7 and above
  // ===================================

  EVENT_TRACE_NO_PER_PROCESSOR_BUFFERING= $10000000;  // Use this for low frequency sessions.


  // Logger Mode flags on Win8 and above
  // ===================================

  EVENT_TRACE_SYSTEM_LOGGER_MODE         = $02000000;  // Receive events from SystemTraceProvider
  EVENT_TRACE_ADDTO_TRIAGE_DUMP          = $80000000;  // Add ETW buffers to triage dumps
  EVENT_TRACE_STOP_ON_HYBRID_SHUTDOWN    = $00400000;  // Stop on hybrid shutdown
  EVENT_TRACE_PERSIST_ON_HYBRID_SHUTDOWN = $00800000;  // Persist on hybrid shutdown


  // Logger Mode flags on Blue and above
  // ===================================

  EVENT_TRACE_INDEPENDENT_SESSION_MODE   = $08000000;  // Independent logger session


  // Logger Mode flags on Redstone and above
  // =======================================

  EVENT_TRACE_COMPRESSED_MODE            = $04000000;  // Compressed logger session.


  // ControlTrace Codes
  // ==================

  EVENT_CONTROL_CODE_DISABLE_PROVIDER = 0;
  EVENT_CONTROL_CODE_ENABLE_PROVIDER = 1;
  EVENT_CONTROL_CODE_CAPTURE_STATE = 2;

  EVENT_TRACE_CONTROL_QUERY               = 0;
  EVENT_TRACE_CONTROL_STOP                = 1;
  EVENT_TRACE_CONTROL_UPDATE              = 2;


  // Flush ControlTrace Codes for XP and above
  // =========================================

  EVENT_TRACE_CONTROL_FLUSH               = 3;  // Flushes all the buffers

  //
  // Supported for RS5 and above.
  //

  EVENT_TRACE_CONTROL_INCREMENT_FILE      = 4;  // Causes a session with EVENT_TRACE_FILE_MODE_NEWFILE
                                                // to switch to the next file before the automatic
                                                // switching criteria is met

  //
  // Supported for Manganese and above.
  //

  EVENT_TRACE_CONTROL_CONVERT_TO_REALTIME = 5;  // Transitions from file mode tracing to real-time.


  // Flags used by WMI Trace Message
  // Note that the order or value of these flags should NOT be changed as they are processed
  // in this order.
  // =======================================================================================

  TRACE_MESSAGE_SEQUENCE              = 1;  // Message should include a sequence number
  TRACE_MESSAGE_GUID                  = 2;  // Message includes a GUID
  TRACE_MESSAGE_COMPONENTID           = 4;  // Message has no GUID, Component ID instead
  TRACE_MESSAGE_TIMESTAMP             = 8;  // Message includes a timestamp
  TRACE_MESSAGE_PERFORMANCE_TIMESTAMP = 16;  // *Obsolete* Clock type is controlled by the logger
  TRACE_MESSAGE_SYSTEMINFO            = 32;  // Message includes system information TID,PID


  // Vista flags set by system to indicate provider pointer size.
  // ============================================================

  TRACE_MESSAGE_POINTER32             = $0040;  // Message logged by 32 bit provider
  TRACE_MESSAGE_POINTER64             = $0080;  // Message logged by 64 bit provider

  TRACE_MESSAGE_FLAG_MASK             = $FFFF;  // Only the lower 16 bits of flags are placed in the message
                                                 // those above 16 bits are reserved for local processing

  // Maximum size allowed for a single TraceMessage message.
  //
  // N.B. This limit was increased from 8K to 64K in Win8.
  // =======================================================

  TRACE_MESSAGE_MAXIMUM_SIZE          = (64 * 1024);


  // Flags to indicate to consumer which fields
  // in the EVENT_TRACE_HEADER are valid
  // ==========================================

  EVENT_TRACE_USE_PROCTIME            = $0001;  // ProcessorTime field is valid
  EVENT_TRACE_USE_NOCPUTIME           = $0002;  // No Kernel/User/Processor Times


  // TRACE_HEADER_FLAG values are used in the Flags field of EVENT_TRACE_HEADER
  // structure while calling into TraceEvent API
  // ==========================================================================

  TRACE_HEADER_FLAG_USE_TIMESTAMP     = $00000200;
  TRACE_HEADER_FLAG_TRACED_GUID       = $00020000;  // denotes a trace
  TRACE_HEADER_FLAG_LOG_WNODE         = $00040000;  // request to log Wnode
  TRACE_HEADER_FLAG_USE_GUID_PTR      = $00080000;  // Guid is actually a pointer
  TRACE_HEADER_FLAG_USE_MOF_PTR       = $00100000;  // MOF data are dereferenced


  //
  // Keywords to be used for the System ALPC Provider.
  //

  SYSTEM_ALPC_KW_GENERAL              = $0000000000000001;

  //
  // Keywords to be used for the System Config Provider.
  //

  SYSTEM_CONFIG_KW_SYSTEM             = $0000000000000001;
  SYSTEM_CONFIG_KW_GRAPHICS           = $0000000000000002;
  SYSTEM_CONFIG_KW_STORAGE            = $0000000000000004;
  SYSTEM_CONFIG_KW_NETWORK            = $0000000000000008;
  SYSTEM_CONFIG_KW_SERVICES           = $0000000000000010;
  SYSTEM_CONFIG_KW_PNP                = $0000000000000020;
  SYSTEM_CONFIG_KW_OPTICAL            = $0000000000000040;

  //
  // Keywords to be used for the System CPU Provider.
  //

  SYSTEM_CPU_KW_CONFIG                = $0000000000000001;
  SYSTEM_CPU_KW_CACHE_FLUSH           = $0000000000000002;
  SYSTEM_CPU_KW_SPEC_CONTROL          = $0000000000000004;
  SYSTEM_CPU_KW_DOMAIN_CHANGE         = $0000000000000008;

  //
  // Keywords to be used for the System Hypervisor Provider.
  //

  SYSTEM_HYPERVISOR_KW_PROFILE        = $0000000000000001;
  SYSTEM_HYPERVISOR_KW_CALLOUTS       = $0000000000000002;
  SYSTEM_HYPERVISOR_KW_VTL_CHANGE     = $0000000000000004;

  //
  // Keywords to be used for the System Interrupt Provider.
  //

  SYSTEM_INTERRUPT_KW_GENERAL         = $0000000000000001;
  SYSTEM_INTERRUPT_KW_CLOCK_INTERRUPT = $0000000000000002;
  SYSTEM_INTERRUPT_KW_DPC             = $0000000000000004;
  SYSTEM_INTERRUPT_KW_DPC_QUEUE       = $0000000000000008;
  SYSTEM_INTERRUPT_KW_WDF_DPC         = $0000000000000010;
  SYSTEM_INTERRUPT_KW_WDF_INTERRUPT   = $0000000000000020;
  SYSTEM_INTERRUPT_KW_IPI             = $0000000000000040;

  //
  // Keywords to be used for the System IO Provider.
  //

  SYSTEM_IO_KW_DISK                   = $0000000000000001;
  SYSTEM_IO_KW_DISK_INIT              = $0000000000000002;
  SYSTEM_IO_KW_FILENAME               = $0000000000000004;
  SYSTEM_IO_KW_SPLIT                  = $0000000000000008;
  SYSTEM_IO_KW_FILE                   = $0000000000000010;
  SYSTEM_IO_KW_OPTICAL                = $0000000000000020;
  SYSTEM_IO_KW_OPTICAL_INIT           = $0000000000000040;
  SYSTEM_IO_KW_DRIVERS                = $0000000000000080;
  SYSTEM_IO_KW_CC                     = $0000000000000100;
  SYSTEM_IO_KW_NETWORK                = $0000000000000200;
  SYSTEM_IO_KW_FILE_INIT              = $0000000000000400;
  SYSTEM_IO_KW_TIMER                  = $0000000000000800;

  //
  // Keywords to be used for the System IoFilter Provider.
  //

  SYSTEM_IOFILTER_KW_GENERAL          = $0000000000000001;
  SYSTEM_IOFILTER_KW_INIT             = $0000000000000002;
  SYSTEM_IOFILTER_KW_FASTIO           = $0000000000000004;
  SYSTEM_IOFILTER_KW_FAILURE          = $0000000000000008;

  //
  // Keywords to be used for the System SpinLock Provider.
  //

  SYSTEM_LOCK_KW_SPINLOCK             = $0000000000000001;
  SYSTEM_LOCK_KW_SPINLOCK_COUNTERS    = $0000000000000002;
  SYSTEM_LOCK_KW_SYNC_OBJECTS         = $0000000000000004;

  //
  // Keywords to be used for the System Memory Provider.
  //

  SYSTEM_MEMORY_KW_GENERAL            = $0000000000000001;
  SYSTEM_MEMORY_KW_HARD_FAULTS        = $0000000000000002;
  SYSTEM_MEMORY_KW_ALL_FAULTS         = $0000000000000004;
  SYSTEM_MEMORY_KW_POOL               = $0000000000000008;
  SYSTEM_MEMORY_KW_MEMINFO            = $0000000000000010;
  SYSTEM_MEMORY_KW_PFSECTION          = $0000000000000020;
  SYSTEM_MEMORY_KW_MEMINFO_WS         = $0000000000000040;
  SYSTEM_MEMORY_KW_HEAP               = $0000000000000080;
  SYSTEM_MEMORY_KW_WS                 = $0000000000000100;
  SYSTEM_MEMORY_KW_CONTMEM_GEN        = $0000000000000200;
  SYSTEM_MEMORY_KW_VIRTUAL_ALLOC      = $0000000000000400;
  SYSTEM_MEMORY_KW_FOOTPRINT          = $0000000000000800;
  SYSTEM_MEMORY_KW_SESSION            = $0000000000001000;
  SYSTEM_MEMORY_KW_REFSET             = $0000000000002000;
  SYSTEM_MEMORY_KW_VAMAP              = $0000000000004000;
  SYSTEM_MEMORY_KW_NONTRADEABLE       = $0000000000008000;

  //
  // Keywords to be used for the System Object Provider.
  //

  SYSTEM_OBJECT_KW_GENERAL            = $0000000000000001;
  SYSTEM_OBJECT_KW_HANDLE             = $0000000000000002;

  //
  // Keywords to be used for the System Power Provider.
  //

  SYSTEM_POWER_KW_GENERAL             = $0000000000000001;
  SYSTEM_POWER_KW_HIBER_RUNDOWN       = $0000000000000002;
  SYSTEM_POWER_KW_PROCESSOR_IDLE      = $0000000000000004;
  SYSTEM_POWER_KW_IDLE_SELECTION      = $0000000000000008;
  SYSTEM_POWER_KW_PPM_EXIT_LATENCY    = $0000000000000010;

  //
  // Keywords to be used for the System Process Provider.
  //

  SYSTEM_PROCESS_KW_GENERAL           = $0000000000000001;
  SYSTEM_PROCESS_KW_INSWAP            = $0000000000000002;
  SYSTEM_PROCESS_KW_FREEZE            = $0000000000000004;
  SYSTEM_PROCESS_KW_PERF_COUNTER      = $0000000000000008;
  SYSTEM_PROCESS_KW_WAKE_COUNTER      = $0000000000000010;
  SYSTEM_PROCESS_KW_WAKE_DROP         = $0000000000000020;
  SYSTEM_PROCESS_KW_WAKE_EVENT        = $0000000000000040;
  SYSTEM_PROCESS_KW_DEBUG_EVENTS      = $0000000000000080;
  SYSTEM_PROCESS_KW_DBGPRINT          = $0000000000000100;
  SYSTEM_PROCESS_KW_JOB               = $0000000000000200;
  SYSTEM_PROCESS_KW_WORKER_THREAD     = $0000000000000400;
  SYSTEM_PROCESS_KW_THREAD            = $0000000000000800;
  SYSTEM_PROCESS_KW_LOADER            = $0000000000001000;

  //
  // Keywords to be used for the System Profile Provider.
  //

  SYSTEM_PROFILE_KW_GENERAL           = $0000000000000001;
  SYSTEM_PROFILE_KW_PMC_PROFILE       = $0000000000000002;

  //
  // Keywords to be used for the System Registry Provider.
  //

  SYSTEM_REGISTRY_KW_GENERAL          = $0000000000000001;
  SYSTEM_REGISTRY_KW_HIVE             = $0000000000000002;
  SYSTEM_REGISTRY_KW_NOTIFICATION     = $0000000000000004;

  //
  // Keywords to be used for the System Scheduler Provider.
  //

  SYSTEM_SCHEDULER_KW_XSCHEDULER      = $0000000000000001;
  SYSTEM_SCHEDULER_KW_DISPATCHER      = $0000000000000002;
  SYSTEM_SCHEDULER_KW_KERNEL_QUEUE    = $0000000000000004;
  SYSTEM_SCHEDULER_KW_SHOULD_YIELD    = $0000000000000008;
  SYSTEM_SCHEDULER_KW_ANTI_STARVATION = $0000000000000010;
  SYSTEM_SCHEDULER_KW_LOAD_BALANCER   = $0000000000000020;
  SYSTEM_SCHEDULER_KW_AFFINITY        = $0000000000000040;
  SYSTEM_SCHEDULER_KW_PRIORITY        = $0000000000000080;
  SYSTEM_SCHEDULER_KW_IDEAL_PROCESSOR = $0000000000000100;
  SYSTEM_SCHEDULER_KW_CONTEXT_SWITCH  = $0000000000000200;
  SYSTEM_SCHEDULER_KW_COMPACT_CSWITCH = $0000000000000400;
  SYSTEM_SCHEDULER_KW_SCHEDULE_THREAD = $0000000000000800;
  SYSTEM_SCHEDULER_KW_READY_QUEUE     = $0000000000001000;
  SYSTEM_SCHEDULER_KW_CPU_PARTITION   = $0000000000002000;
  SYSTEM_SCHEDULER_KW_THREAD_FEEDBACK_READ  = $0000000000004000;
  SYSTEM_SCHEDULER_KW_WORKLOAD_CLASS_UPDATE = $0000000000008000;
  SYSTEM_SCHEDULER_KW_AUTOBOOST             = $0000000000010000;

  //
  // Keywords to be used for the System Syscall Provider.
  //

  SYSTEM_SYSCALL_KW_GENERAL           = $0000000000000001;

  //
  // Keywords to be used for the System Timer Provider.
  //

  SYSTEM_TIMER_KW_GENERAL             = $0000000000000001;
  SYSTEM_TIMER_KW_CLOCK_TIMER         = $0000000000000002;

  //
  // Schematized Filter ID for the Pool Tag Filter on the System Memory Provider.
  //

  SYSTEM_MEMORY_POOL_FILTER_ID        = 1;


type

  ETW_COMPRESSION_RESUMPTION_MODE = (
    EtwCompressionModeRestart     = 0,
    EtwCompressionModeNoDisable   = 1,
    EtwCompressionModeNoRestart   = 2);
  EtwCompressionResumptionMode = ETW_COMPRESSION_RESUMPTION_MODE;

  {$IFNDEF _typedef_TRACELOGGER_HANDLE}
  {$DEFINE _typedef_TRACELOGGER_HANDLE}
  // Used by RegisterTraceGuids-based ("Classic") ETW providers. The handle is
  // invalid if it contains the value (TRACELOGGER_HANDLE)INVALID_HANDLE_VALUE.
  // Obtain the handle by calling GetTraceLoggerHandle during the provider
  // notification callback. The handle is valid until the subsequent notification
  // callback and does not need to be closed by the user.
  PTRACELOGGER_HANDLE = ^TRACELOGGER_HANDLE;
  TRACELOGGER_HANDLE = ULONG64;

  {$ENDIF} // _typedef_TRACELOGGER_HANDLE

  // Trace header for all legacy events.
  // ===================================

  //
  // An EVENT_TRACE consists of a fixed header (EVENT_TRACE_HEADER) and
  // optionally a variable portion pointed to by MofData. The datablock
  // layout of the variable portion is unknown to the Logger and must
  // be obtained from WBEM CIMOM database.
  //
  PEVENT_TRACE_HEADER = ^EVENT_TRACE_HEADER;
  EVENT_TRACE_HEADER = record         // overlays WNODE_HEADER
    Size: USHORT;                     // Size of entire record

    DUMMYUNIONNAME: record
      case integer of
        0: (FieldTypeFlags: USHORT);  // Indicates valid fields
        1: (HeaderType: UCHAR;        // Header type - internal use only
            MarkerFlags: UCHAR);      // Marker - internal use only
      end;

    DUMMYUNIONNAME2: record
      case integer of
        0: (Version: ULONG);
        1: (_Type: UCHAR;             // event type
            Level: UCHAR;             // trace instrumentation level
            _Version: USHORT);        // version of trace record
      end;

    ThreadId: ULONG;                  // Thread Id
    ProcessId: ULONG;                 // Process Id
    TimeStamp: LARGE_INTEGER;         // time when event happens


    DUMMYUNIONNAME3: record
      case integer of
        0: (Guid: TGUID);             // Guid that identifies event
        1: (GuidPtr: ULONGLONG);      // use with WNODE_FLAG_USE_GUID_PTR
      end;

    DUMMYUNIONNAME4: record
      case integer of
        0: (KernelTime: ULONG;              // Kernel Mode CPU ticks
            UserTime: ULONG);               // User mode CPU ticks
        1: (ProcessorTime: ULONG64);        // Processor Clock
        2: (ClientContext: ULONG;           // Reserved
            Flags: ULONG);                  // Event Flags
      end;
  end;


  // This header is used to trace and track transaction co-relations
  // ===============================================================
  PEVENT_INSTANCE_HEADER = ^EVENT_INSTANCE_HEADER;
  _EVENT_INSTANCE_HEADER = record
    Size : USHORT;
    _FieldTypeFlags: record
    case boolean of
      True:  (FieldTypeFlags : USHORT); // Indicates valid fields
      False: (HeaderType     : UCHAR;   // Header type - internal use only
              MarkerFlags    : UCHAR);  // Marker - internal use only
    end;
    _Version : record
    case Boolean of
      True  : (Version1 : ULONG);
      False : (Type_    : UCHAR;        // event type
               Level    : UCHAR;        // trace instrumentation level
               Version2 : USHORT);      // version of trace record
    end;

    ThreadId         : ULONG;
    ProcessId        : ULONG;
    TimeStamp        : LARGE_INTEGER;
    RegHandle        : ULONGLONG;
    InstanceId       : ULONG;
    ParentInstanceId : ULONG;

    _KernelTime : record
      case Short of
        0 : (KernelTime    : ULONG;    // Kernel Mode CPU ticks
             UserTime      : ULONG);   // User mode CPU ticks
        1 : (ProcessorTime : ULONG64); // Processor Clock
        2 : (ClientContext : ULONG;    // Reserved
             Flags         : ULONG)    // Event Flags
    end;
    ParentRegHandle : ULONGLONG;
  end;
  EVENT_INSTANCE_HEADER  = _EVENT_INSTANCE_HEADER;


  // Following are structures and macros for use with USE_MOF_PTR
  //=============================================================

const

  // Trace data types
  ETW_NULL_TYPE_VALUE                 = 0;
  ETW_OBJECT_TYPE_VALUE               = 1;
  ETW_STRING_TYPE_VALUE               = 2;
  ETW_SBYTE_TYPE_VALUE                = 3;
  ETW_BYTE_TYPE_VALUE                 = 4;
  ETW_INT16_TYPE_VALUE                = 5;
  ETW_UINT16_TYPE_VALUE               = 6;
  ETW_INT32_TYPE_VALUE                = 7;
  ETW_UINT32_TYPE_VALUE               = 8;
  ETW_INT64_TYPE_VALUE                = 9;
  ETW_UINT64_TYPE_VALUE               = 10;
  ETW_CHAR_TYPE_VALUE                 = 11;
  ETW_SINGLE_TYPE_VALUE               = 12;
  ETW_DOUBLE_TYPE_VALUE               = 13;
  ETW_BOOLEAN_TYPE_VALUE              = 14;
  ETW_DECIMAL_TYPE_VALUE              = 15;

  // Extended types
  ETW_GUID_TYPE_VALUE                         = 101;
  ETW_ASCIICHAR_TYPE_VALUE                    = 102;
  ETW_ASCIISTRING_TYPE_VALUE                  = 103;
  ETW_COUNTED_STRING_TYPE_VALUE               = 104;
  ETW_POINTER_TYPE_VALUE                      = 105;
  ETW_SIZET_TYPE_VALUE                        = 106;
  ETW_HIDDEN_TYPE_VALUE                       = 107;
  ETW_BOOL_TYPE_VALUE                         = 108;
  ETW_COUNTED_ANSISTRING_TYPE_VALUE           = 109;
  ETW_REVERSED_COUNTED_STRING_TYPE_VALUE      = 110;
  ETW_REVERSED_COUNTED_ANSISTRING_TYPE_VALUE  = 111;
  ETW_NON_NULL_TERMINATED_STRING_TYPE_VALUE   = 112;
  ETW_REDUCED_ANSISTRING_TYPE_VALUE           = 113;
  ETW_REDUCED_STRING_TYPE_VALUE               = 114;
  ETW_SID_TYPE_VALUE                          = 115;
  ETW_VARIANT_TYPE_VALUE                      = 116;
  ETW_PTVECTOR_TYPE_VALUE                     = 117;
  ETW_WMITIME_TYPE_VALUE                      = 118;
  ETW_DATETIME_TYPE_VALUE                     = 119;
  ETW_REFRENCE_TYPE_VALUE                     = 120;

type

  PMOF_FIELD = ^_MOF_FIELD;
  _MOF_FIELD = record
    DataPtr: ULONG64;      // Pointer to the field. Up to 64-bits only
    Length: ULONG;         // Length of the MOF field
    DataType: ULONG;       // Type of data
  end;
  MOF_FIELD = _MOF_FIELD;


  // This is the header for every logfile. The memory for LoggerName
  // and LogFileName must be contiguous adjacent to this structure
  // Allows both user-mode and kernel-mode to understand the header.
  //
  // TRACE_LOGFILE_HEADER32 and TRACE_LOGFILE_HEADER64 structures
  // are also provided to simplify cross platform decoding of the
  // header event.
  //================================================================

   PTRACE_LOGFILE_HEADER = ^TRACE_LOGFILE_HEADER;
   _TRACE_LOGFILE_HEADER = record
    BufferSize    : ULONG;  // Logger buffer size in Kbytes
    VersionDetail : record
    case Boolean of
      True  : (Version      : ULONG);  // Logger version
      False : (MajorVersion : UCHAR;
               MinorVersion : UCHAR;
               SubVersion   : UCHAR;
               SubMinorVersion : UCHAR);
    end;

    ProviderVersion : ULONG;    // defaults to NT version
    NumberOfProcessors : ULONG; // Number of Processors
    EndTime : LARGE_INTEGER;    // Time when logger stops
    TimerResolution : ULONG;    // assumes timer is constant!!!
    MaximumFileSize : ULONG;    // Maximum in Mbytes
    LogFileMode : ULONG;        // specify logfile mode
    BuffersWritten : ULONG;     // used to file start of Circular File

    LogInstanceGuid : record
    case Boolean of
      True  : (LogInstanceGuid : TGUID);    // For RealTime Buffer Delivery
      False : (StartBuffers    : ULONG;     // Count of buffers written at start.
               PointerSize     : ULONG;     // Size of pointer type in bits
               EventsLost      : ULONG;     // Events losts during log session
               CpuSpeedInMHz   : ULONG);    // Cpu Speed in MHz
    end;

    LoggerName  : LPWSTR;
    LogFileName : LPWSTR;
    TimeZone    : TIME_ZONE_INFORMATION;

    BootTime  : LARGE_INTEGER;
    PerfFreq  : LARGE_INTEGER;  // Reserved
    StartTime : LARGE_INTEGER;  // Reserved
    ReservedFlags : ULONG;      // ClockType
    BuffersLost   : ULONG;
  end;
  TRACE_LOGFILE_HEADER = _TRACE_LOGFILE_HEADER;



  PTRACE_LOGFILE_HEADER32 = ^TRACE_LOGFILE_HEADER32;
  _TRACE_LOGFILE_HEADER32 = record
    BufferSize: ULONG;    // Logger buffer size in Kbytes
    VersionDetail : record
    case Boolean of
      True  :  (Version: ULONG);   // Logger version
      False :  (MajorVersion: UCHAR;
                MinorVersion: UCHAR;
                SubVersion: UCHAR;
                SubMinorVersion: UCHAR);
    end;

    ProviderVersion    : ULONG;     // defaults to NT version
    NumberOfProcessors : ULONG;     // Number of Processors
    EndTime            : LARGE_INTEGER;  // Time when logger stops
    TimerResolution    : ULONG;     // assumes timer is constant!!!
    MaximumFileSize    : ULONG;     // Maximum in Mbytes
    LogFileMode        : ULONG;     // specify logfile mode
    BuffersWritten     : ULONG;     // used to file start of Circular File

    LogInstanceGuid : record
    case Boolean of
      True  : (LogInstanceGuid: TGUID);   // For RealTime Buffer Delivery
      False : (StartBuffers: ULONG;       // Count of buffers written at start.
               PointerSize: ULONG;        // Size of pointer type in bits
               EventsLost: ULONG;         // Events lost during log session
               CpuSpeedInMHz: ULONG);     // Cpu Speed in MHz
    end;

    LoggerName  : ULONG32;
    LogFileName : ULONG32;
    TimeZone    : TIME_ZONE_INFORMATION;

    BootTime      : LARGE_INTEGER;
    PerfFreq      : LARGE_INTEGER;    // Reserved
    StartTime     : LARGE_INTEGER;    // Reserved
    ReservedFlags : ULONG;            // ClockType
    BuffersLost   : ULONG;
   end;
   TRACE_LOGFILE_HEADER32 =  _TRACE_LOGFILE_HEADER32;


  PTRACE_LOGFILE_HEADER64 = ^TRACE_LOGFILE_HEADER64;
  _TRACE_LOGFILE_HEADER64 = record
    BufferSize : ULONG;          // Logger buffer size in Kbytes
    VersionDetail : record
    case Boolean of
      True :  (Version         : ULONG);             // Logger version
      False : (MajorVersion    : UCHAR;
               MinorVersion    : UCHAR;
               SubVersion      : UCHAR;
               SubMinorVersion : UCHAR);
    end;

    ProviderVersion    : ULONG;     // defaults to NT version
    NumberOfProcessors : ULONG;     // Number of Processors
    EndTime            : LARGE_INTEGER;  // Time when logger stops
    TimerResolution    : ULONG;     // assumes timer is constant!!!
    MaximumFileSize    : ULONG;     // Maximum in Mbytes
    LogFileMode        : ULONG;     // specify logfile mode
    BuffersWritten     : ULONG;     // used to file start of Circular File

    LogInstanceGuid : record
    case Boolean of
      True  :  (LogInstanceGuid : TGUID);      // For RealTime Buffer Delivery
      False :  (StartBuffers    : ULONG;       // Count of buffers written at start.
                PointerSize     : ULONG;       // Size of pointer type in bits
                EventsLost      : ULONG;       // Events lost during log session
                CpuSpeedInMHz   : ULONG);      // Cpu Speed in MHz
    end;

    LoggerName: ULONG64;
    LogFileName: ULONG64;
    TimeZone: TIME_ZONE_INFORMATION;

    BootTime: LARGE_INTEGER;
    PerfFreq: LARGE_INTEGER;            // Reserved
    StartTime: LARGE_INTEGER;           // Reserved
    ReservedFlags: ULONG;       // ClockType
    BuffersLost: ULONG;
  end;
  TRACE_LOGFILE_HEADER64 = _TRACE_LOGFILE_HEADER64;


  // Instance Information to track parent child relationship of Instances.
  // =====================================================================

  PEVENT_INSTANCE_INFO = ^EVENT_INSTANCE_INFO;
  EVENT_INSTANCE_INFO = record
    RegHandle: THandle;
    InstanceId: ULONG;
  end;


  // Structures that have UNICODE and ANSI versions are defined here
  // ===============================================================


  // Logger configuration and running statistics. This structure is used
  // by user-mode callers, such as PDH library

  PEVENT_FILTER_DESCRIPTOR = WinApi.Evntprov.PEVENT_FILTER_DESCRIPTOR;
  EVENT_FILTER_DESCRIPTOR = WinApi.Evntprov.EVENT_FILTER_DESCRIPTOR;


  PPEVENT_TRACE_PROPERTIES = ^PEVENT_TRACE_PROPERTIES;
  PEVENT_TRACE_PROPERTIES = ^EVENT_TRACE_PROPERTIES;
  _EVENT_TRACE_PROPERTIES = record
    Wnode: WNODE_HEADER;
    //
    // data provided by caller
    BufferSize: ULONG;                     // buffer size for logging (kbytes)
    MinimumBuffers: ULONG;                 // minimum to preallocate
    MaximumBuffers: ULONG;                 // maximum buffers allowed
    MaximumFileSize: ULONG;                // maximum logfile size (in MBytes)
    LogFileMode: ULONG;                    // sequential, circular
    FlushTimer: ULONG;                     // buffer flush timer, in seconds
    EnableFlags: ULONG;                    // trace enable flags

    DUMMYUNIONNAME : record
    case Boolean of
      True  : (AgeLimit : LONG);           // unused
      False : (FlushThreshold: LONG);      // Number of buffers to fill before flushing
    end;

    // data returned to caller
    NumberOfBuffers     : ULONG;           // no of buffers in use
    FreeBuffers         : ULONG;           // no of buffers free
    EventsLost          : ULONG;           // event records lost
    BuffersWritten      : ULONG;           // no of buffers written to file
    LogBuffersLost      : ULONG;           // no of logfile write failures
    RealTimeBuffersLost : ULONG;           // no of rt delivery failures
    LoggerThreadId      : THandle;         // thread id of Logger
    LogFileNameOffset   : ULONG;           // Offset to LogFileName
    LoggerNameOffset    : ULONG;           // Offset to LoggerName
  end;
  EVENT_TRACE_PROPERTIES = _EVENT_TRACE_PROPERTIES;


  TETW_TRACE_V2_CONTROL = record
    V2Control: ULONG;
    function GetVersionNumber: ULONG; inline;
    procedure SetVersionNumber(Value: ULONG); inline;
    property VersionNumber: ULONG read GetVersionNumber write SetVersionNumber;
  end;

  TETW_TRACE_V2_OPTIONS = record
    V2Options: ULONG64;
    function ReadBit(Index: Integer): ULONG; inline;    procedure WriteBit(Index: Integer;
                       Value: ULONG); inline;
    property Wow: ULONG index 0 read ReadBit write WriteBit;
    property QpcDeltaTracking: ULONG index 1 read ReadBit write WriteBit;
    property LargeMdlPages: ULONG index 2 read ReadBit write WriteBit;
    property ExcludeKernelStack: ULONG index 3 read ReadBit write WriteBit;
  end;

  PEVENT_TRACE_PROPERTIES_V2 = ^_EVENT_TRACE_PROPERTIES_V2;
  _EVENT_TRACE_PROPERTIES_V2 = record
    Wnode: WNODE_HEADER;                   // Always have WNODE_FLAG_VERSIONED_PROPERTIES.
    //
    // data provided by caller
    BufferSize      : ULONG;               // buffer size for logging (kbytes)
    MinimumBuffers  : ULONG;               // minimum to preallocate
    MaximumBuffers  : ULONG;               // maximum buffers allowed
    MaximumFileSize : ULONG;               // maximum logfile size (in MBytes)
    LogFileMode     : ULONG;               // sequential, circular
    FlushTimer      : ULONG;               // buffer flush timer, in seconds
    EnableFlags     : ULONG;               // trace enable flags

    DUMMYUNIONNAME : record
    case Boolean of
      True  : (AgeLimit: LONG);            // unused
      False : (FlushThreshold: LONG);      // Number of buffers to fill before flushing
    end;

    // data returned to caller
    NumberOfBuffers     : ULONG;           // no of buffers in use
    FreeBuffers         : ULONG;           // no of buffers free
    EventsLost          : ULONG;           // event records lost
    BuffersWritten      : ULONG;           // no of buffers written to file
    LogBuffersLost      : ULONG;           // no of logfile write failures
    RealTimeBuffersLost : ULONG;           // no of rt delivery failures
    LoggerThreadId      : THandle;         // thread id of Logger
    LogFileNameOffset   : ULONG;           // Offset to LogFileName
    LoggerNameOffset    : ULONG;           // Offset to LoggerName

    // V2 data
    DUMMYUNIONNAME2: TETW_TRACE_V2_CONTROL; // VersionNumber is the low eight bits.

    FilterDescCount : ULONG;                     // Number of filters
    FilterDesc      : PEVENT_FILTER_DESCRIPTOR;   // Only applicable for Private Loggers

    // Wow, QpcDeltaTracking, LargeMdlPages and ExcludeKernelStack are bits 0..3.
    DUMMYUNIONNAME3: TETW_TRACE_V2_OPTIONS;
  end;
  EVENT_TRACE_PROPERTIES_V2 = _EVENT_TRACE_PROPERTIES_V2;


  // Data Provider structures
  //
  // Used by RegisterTraceGuids()
  // ============================

  PTRACE_GUID_REGISTRATION = ^TRACE_GUID_REGISTRATION;
  _TRACE_GUID_REGISTRATION = record
    Guid: PGUID;                 // Guid of data block being registered or updated.
    RegHandle: THandle;          // Guid Registration Handle is returned.
  end;
  TRACE_GUID_REGISTRATION = _TRACE_GUID_REGISTRATION;


  // Data consumer structures
  // ========================

  PPTRACE_GUID_PROPERTIES = ^PTRACE_GUID_PROPERTIES;
  PTRACE_GUID_PROPERTIES = ^TRACE_GUID_PROPERTIES;
  _TRACE_GUID_PROPERTIES = record
    Guid: TGUID;
    GuidType: ULONG;
    LoggerId: ULONG;
    EnableLevel: ULONG;
    EnableFlags: ULONG;
    IsEnable: BOOLEAN;
  end;
  TRACE_GUID_PROPERTIES = _TRACE_GUID_PROPERTIES;


const

  // Provider Information Flags used on Vista and above.
  // ===================================================
  TRACE_PROVIDER_FLAG_LEGACY     = ($00000001);
  TRACE_PROVIDER_FLAG_PRE_ENABLE = ($00000002);


type

  // Enable Information for Provider Instance
  // Used on Vista and above
  //=========================================

  PTRACE_ENABLE_INFO = ^TRACE_ENABLE_INFO;
  _TRACE_ENABLE_INFO = record
    IsEnabled: ULONG;
    Level: UCHAR;
    Reserved1: UCHAR;
    LoggerId: USHORT;
    EnableProperty: ULONG;
    Reserved2: ULONG;
    MatchAnyKeyword: ULONGLONG;
    MatchAllKeyword: ULONGLONG;
  end;
  TRACE_ENABLE_INFO = _TRACE_ENABLE_INFO;


  // Instance Information for Provider
  // Used on Vista and above
  // =================================
  PTRACE_PROVIDER_INSTANCE_INFO = ^TRACE_PROVIDER_INSTANCE_INFO;
  _TRACE_PROVIDER_INSTANCE_INFO = record
    NextOffset: ULONG;
    EnableCount: ULONG;
    Pid: ULONG;
    Flags: ULONG;
  end;
  TRACE_PROVIDER_INSTANCE_INFO = _TRACE_PROVIDER_INSTANCE_INFO;


  // GUID Information Used on Vista and above
  // ========================================
  PTRACE_GUID_INFO = ^TRACE_GUID_INFO;
  _TRACE_GUID_INFO = record
    InstanceCount: ULONG;
    Reserved: ULONG;
  end;
  TRACE_GUID_INFO = _TRACE_GUID_INFO;


  PPROFILE_SOURCE_INFO = ^PROFILE_SOURCE_INFO;
  _PROFILE_SOURCE_INFO = record
    NextEntryOffset: ULONG;
    Source: ULONG;
    MinInterval: ULONG;
    MaxInterval: ULONG;
    Reserved: ULONG64;
    Description: array[0..ANYSIZE_ARRAY - 1] of WideChar;
  end;
  PROFILE_SOURCE_INFO = _PROFILE_SOURCE_INFO;


  _ETW_PMC_COUNTER_OWNER_TYPE = (
    EtwPmcOwnerFree,
    EtwPmcOwnerUntagged,
    EtwPmcOwnerTagged,
    EtwPmcOwnerTaggedWithSource
  );
  PETW_PMC_COUNTER_OWNER_TYPE = ^_ETW_PMC_COUNTER_OWNER_TYPE;
  ETW_PMC_COUNTER_OWNER_TYPE = _ETW_PMC_COUNTER_OWNER_TYPE;


  PETW_PMC_COUNTER_OWNER = ^_ETW_PMC_COUNTER_OWNER;
  _ETW_PMC_COUNTER_OWNER = record
    OwnerType: ETW_PMC_COUNTER_OWNER_TYPE;
    ProfileSource: ULONG;
    OwnerTag: ULONG;
  end;
  ETW_PMC_COUNTER_OWNER = _ETW_PMC_COUNTER_OWNER;


  PETW_PMC_COUNTER_OWNERSHIP_STATUS = ^_ETW_PMC_COUNTER_OWNERSHIP_STATUS;
  _ETW_PMC_COUNTER_OWNERSHIP_STATUS = record
    ProcessorNumber: ULONG;
    NumberOfCounters: ULONG;
    CounterOwners: array [0..ANYSIZE_ARRAY - 1] of ETW_PMC_COUNTER_OWNER;
  end;
  ETW_PMC_COUNTER_OWNERSHIP_STATUS = _ETW_PMC_COUNTER_OWNERSHIP_STATUS;


  PETW_PMC_SESSION_INFO = ^ETW_PMC_SESSION_INFO;
  ETW_PMC_SESSION_INFO = record
    NextEntryOffset: ULONG;
    LoggerId: USHORT;
    Reserved: USHORT;
    ProfileSourceCount: ULONG;
    HookIdCount: ULONG;
    // These two fields follow as a ULONG blob after the initial header.
    // ULONG ProfileSources[]; // Count indicated by ProfileSourceCount
    // USHORT HookIds[]; // Count indicated by HookIdCount
  end;


  PETW_CONTEXT_REGISTER_TYPES = ^ETW_CONTEXT_REGISTER_TYPES;
  ETW_CONTEXT_REGISTER_TYPES      = (
    EtwContextRegisterTypeNone    = 0,
    EtwContextRegisterTypeControl = $1,
    EtwContextRegisterTypeInteger = $2
  );


  // An EVENT_TRACE consists of a fixed header (EVENT_TRACE_HEADER) and
  // optionally a variable portion pointed to by MofData. The datablock
  // layout of the variable portion is unknown to the Logger and must
  // be obtained from WBEM CIMOM database.
  // ==================================================================

  PEVENT_TRACE = ^EVENT_TRACE;
  _EVENT_TRACE = record
    Header: EVENT_TRACE_HEADER; // Event trace header
    InstanceId: ULONG;          // Instance Id of this event
    ParentInstanceId: ULONG;    // Parent Instance Id.
    ParentGuid: TGUID;          // Parent Guid;
    MofData: PVOID;             // Pointer to Variable Data
    MofLength: ULONG;           // Variable Datablock Length
    DUMMYUNIONNAME: record
    case Boolean of
      True  : (ClientContext: ULONG);
      False : (BufferContext: ETW_BUFFER_CONTEXT);
    end;
  end;
  EVENT_TRACE = _EVENT_TRACE;



  // pre-definitions
  PEVENT_TRACE_LOGFILEA = ^EVENT_TRACE_LOGFILEA;
  PEVENT_TRACE_LOGFILEW = ^EVENT_TRACE_LOGFILEW;

  EVENT_TRACE_BUFFER_CALLBACKW = function (Logfile: PEVENT_TRACE_LOGFILEW): ULONG; stdcall;
  PEVENT_TRACE_BUFFER_CALLBACKW = EVENT_TRACE_BUFFER_CALLBACKW;

  EVENT_TRACE_BUFFER_CALLBACKA = function (Logfile: PEVENT_TRACE_LOGFILEA): ULONG; stdcall;
  PEVENT_TRACE_BUFFER_CALLBACKA = EVENT_TRACE_BUFFER_CALLBACKA;

  EVENT_CALLBACK = procedure (pEvent: PEVENT_TRACE); stdcall;
  PEVENT_CALLBACK = EVENT_CALLBACK;

  EVENT_RECORD_CALLBACK = procedure (EventRecord: PEVENT_RECORD); stdcall;
  PEVENT_RECORD_CALLBACK = EVENT_RECORD_CALLBACK;

  PETW_BUFFER_HEADER = ^ETW_BUFFER_HEADER;
  ETW_BUFFER_HEADER = record
    Reserved1: array[0..3] of ULONG;
    TimeStamp: LARGE_INTEGER;        // Time of flush
    Reserved2: array[0..3] of ULONG;
    ClientContext: ETW_BUFFER_CONTEXT;
    Reserved3: ULONG;
    FilledBytes: ULONG;              // Number of bytes written to the buffer.  Essentially the filled length of the buffer.
    Reserved4: array[0..4] of ULONG;
  end;


  // Structure passed to the BufferCallback containing information on the
  // current state of the processing session.
  PETW_BUFFER_CALLBACK_INFORMATION = ^ETW_BUFFER_CALLBACK_INFORMATION;
  ETW_BUFFER_CALLBACK_INFORMATION = record
    TraceHandle: PROCESSTRACE_HANDLE;
    LogfileHeader: PTRACE_LOGFILE_HEADER;
    BuffersRead: ULONG;
  end;


  PETW_BUFFER_CALLBACK = function(Buffer: PETW_BUFFER_HEADER;
                                  BufferSize: ULONG;
                                  ConsumerInfo: PETW_BUFFER_CALLBACK_INFORMATION;
                                  CallbackContext: Pointer): BOOL; stdcall;


  PETW_PROCESS_TRACE_MODES = ^ETW_PROCESS_TRACE_MODES;
  ETW_PROCESS_TRACE_MODES                = (
    ETW_PROCESS_TRACE_MODE_NONE          = 0,
    ETW_PROCESS_TRACE_MODE_RAW_TIMESTAMP = $00000001
  );

  // Configuration options to pass into OpenTrace style functions.
  PETW_OPEN_TRACE_OPTIONS = ^ETW_OPEN_TRACE_OPTIONS;
  ETW_OPEN_TRACE_OPTIONS = record
    ProcessTraceModes: ETW_PROCESS_TRACE_MODES;
    // This callback will be called for each event in time order.
    // If left nil, all event playback code will be bypassed.
    EventCallback: PEVENT_RECORD_CALLBACK;
    EventCallbackContext: Pointer;
    // This callback will get called once buffer processing is complete.
    BufferCallback: PETW_BUFFER_CALLBACK;
    BufferCallbackContext: Pointer;
  end;

  PETW_BUFFER_COMPLETION_CALLBACK = procedure(Buffer: PETW_BUFFER_HEADER;
                                              CallbackContext: Pointer); stdcall;


  // Prototype for service request callback. Data providers register with WMI
  // by passing a service request callback function that is called for all
  // wmi requests.
  // ========================================================================

   WMIDPREQUEST = function(RequestCode: WMIDPREQUESTCODE;
                          RequestContext: Pointer;
                          BufferSize: PULONG;
                          Buffer: Pointer): ULONG; stdcall;

  _EVENT_TRACE_LOGFILEW = record
    LogFileName: LPWSTR;    // Logfile Name
    LoggerName: LPWSTR;     // LoggerName
    CurrentTime: LONGLONG;  // timestamp of last event
    BuffersRead: ULONG;     // buffers read to date
    LogFileMode: record
    case Boolean of
        // Mode of the logfile
        True  : (LogFileMode: ULONG);
        // Processing flags used on Vista and above
        False : (ProcessTraceMode: ULONG);
    end;

    CurrentEvent: EVENT_TRACE;                       // Current Event from this stream.
    LogfileHeader: TRACE_LOGFILE_HEADER;             // logfile header structure
    BufferCallback: PEVENT_TRACE_BUFFER_CALLBACKW;   // callback before each buffer is read
    //
    // following variables are filled for BufferCallback.
    //
    BufferSize: ULONG;
    Filled: ULONG;
    EventsLost: ULONG;
    //
    // following needs to be propagated to each buffer
    //
    EventCallback: record
      case Boolean of
        // Callback with EVENT_TRACE
        True : (EventCallback : PEVENT_CALLBACK);
        // Callback with EVENT_RECORD on Vista and above
        False : (EventRecordCallback : PEVENT_RECORD_CALLBACK);
    end;

    IsKernelTrace: ULONG;    // TRUE for kernel logfile
    Context: PVOID;          // reserved for internal use
  end;
  EVENT_TRACE_LOGFILEW = _EVENT_TRACE_LOGFILEW;


  _EVENT_TRACE_LOGFILEA = record
    LogFileName: LPSTR;     // Logfile Name
    LoggerName: LPSTR;      // LoggerName
    CurrentTime: LONGLONG;  // timestamp of last event
    BuffersRead: ULONG;     // buffers read to date
    LogFileMode: record
    case Boolean of
      // Mode of the logfile
      True : (LogFileMode : ULONG);
      // Processing flags used on Vista and above
      False : (ProcessTraceMode : ULONG);
    end;

    CurrentEvent: EVENT_TRACE;                      // Current Event from this stream.
    LogfileHeader: TRACE_LOGFILE_HEADER;            // logfile header structure
    BufferCallback: PEVENT_TRACE_BUFFER_CALLBACKA;  // callback before each buffer is read

    // following variables are filled for BufferCallback.
    //
    BufferSize: ULONG;
    Filled : ULONG;
    EventsLost: ULONG;

    // following needs to be propaged to each buffer
    //
    EventCallback: record
    case Boolean of
      // Callback with EVENT_TRACE
      True  : (EventCallback: PEVENT_CALLBACK);
      // Callback with EVENT_RECORD on Vista and above
      False : (EventRecordCallback: PEVENT_RECORD_CALLBACK);
    end;
    IsKernelTrace: ULONG;   // TRUE for kernel logfile
    Context: PVOID;         // reserved for internal use
  end;
  EVENT_TRACE_LOGFILEA = _EVENT_TRACE_LOGFILEA;


  // Define generic structures
  // =========================



{$IFDEF UNICODE}

type

  PEVENT_TRACE_BUFFER_CALLBACK    = PEVENT_TRACE_BUFFER_CALLBACKW;
  PEVENT_TRACE_LOGFILE            = PEVENT_TRACE_LOGFILEW;
  EVENT_TRACE_LOGFILE             = EVENT_TRACE_LOGFILEW;

{$ELSE}

  PEVENT_TRACE_BUFFER_CALLBACK    = PEVENT_TRACE_BUFFER_CALLBACKA;
  PEVENT_TRACE_LOGFILE            = PEVENT_TRACE_LOGFILEA;
  EVENT_TRACE_LOGFILE             = EVENT_TRACE_LOGFILEA;

{$ENDIF UNICODE}


{$IFDEF UNICODE}

const

  KERNEL_LOGGER_NAME              = KERNEL_LOGGER_NAMEW;
  GLOBAL_LOGGER_NAME              = GLOBAL_LOGGER_NAMEW;
  EVENT_LOGGER_NAME               = EVENT_LOGGER_NAMEW;

{$ELSE}

const

  KERNEL_LOGGER_NAME              = KERNEL_LOGGER_NAMEA;
  GLOBAL_LOGGER_NAME              = GLOBAL_LOGGER_NAMEA;
  EVENT_LOGGER_NAME               = EVENT_LOGGER_NAMEA;

{$ENDIF UNICODE}


  // Logger control APIs
  // ===================


  // Use the routine below to start an event trace session
  // =====================================================

  function StartTrace(TraceId: PCONTROLTRACE_ID;
                      InstanceName: ETW_LPTSTR;
                      Properties: PEVENT_TRACE_PROPERTIES): ULONG; stdcall;

  function StartTraceW(TraceId: PCONTROLTRACE_ID;
                       InstanceName: PWideChar;
                       Properties: PEVENT_TRACE_PROPERTIES): ULONG; stdcall;

  function StartTraceA(TraceId: PCONTROLTRACE_ID;
                       InstanceName: PAnsiChar;
                       Properties: PEVENT_TRACE_PROPERTIES): ULONG; stdcall;


  // Use the routine below to stop an event trace session
  // ====================================================

  function StopTrace(TraceId: CONTROLTRACE_ID;
                     InstanceName: ETW_LPTSTR;
                     Properties: PEVENT_TRACE_PROPERTIES): ULONG; stdcall;

  function StopTraceW(TraceId: CONTROLTRACE_ID;
                      InstanceName: PWideChar;
                      Properties: PEVENT_TRACE_PROPERTIES): ULONG; stdcall;

  function StopTraceA(TraceId: CONTROLTRACE_ID;
                      InstanceName: PAnsiChar;
                      Properties: PEVENT_TRACE_PROPERTIES): ULONG; stdcall;



  // Use the routine below to query the properties of an event trace session
  // =======================================================================

  function QueryTrace(TraceId: CONTROLTRACE_ID;
                      InstanceName: ETW_LPTSTR;
                      Properties: PEVENT_TRACE_PROPERTIES): ULONG; stdcall;

  function QueryTraceW(TraceId: CONTROLTRACE_ID;
                       InstanceName: PWideChar;
                       Properties: PEVENT_TRACE_PROPERTIES): ULONG; stdcall;

  function QueryTraceA(TraceId: CONTROLTRACE_ID;
                       InstanceName: PAnsiChar;
                       Properties: PEVENT_TRACE_PROPERTIES): ULONG; stdcall;


  // Use the routine below to update certain properties of an event trace session
  // ============================================================================

  function UpdateTrace(TraceId: CONTROLTRACE_ID;
                       InstanceName: ETW_LPTSTR;
                       Properties: PEVENT_TRACE_PROPERTIES): ULONG; stdcall;

  function UpdateTraceW(TraceId: CONTROLTRACE_ID;
                        InstanceName: PWideChar;
                        Properties: PEVENT_TRACE_PROPERTIES): ULONG; stdcall;

  function UpdateTraceA(TraceId: CONTROLTRACE_ID;
                        InstanceName: PAnsiChar;
                        Properties: PEVENT_TRACE_PROPERTIES): ULONG; stdcall;



  // Use the routine below to request that all active buffers an event trace
  // session be "flushed", or written out.
  // =======================================================================

  function FlushTrace(TraceId: CONTROLTRACE_ID;
                      InstanceName: ETW_LPTSTR;
                      Properties: PEVENT_TRACE_PROPERTIES): ULONG; stdcall;

  function FlushTraceW(TraceId: CONTROLTRACE_ID;
                       InstanceName: PWideChar;
                       Properties: PEVENT_TRACE_PROPERTIES): ULONG; stdcall;

  function FlushTraceA(TraceId: CONTROLTRACE_ID;
                       InstanceName: PAnsiChar;
                       Properties: PEVENT_TRACE_PROPERTIES): ULONG; stdcall;



  // Generic trace control routine
  // =============================

  function ControlTrace(TraceId: CONTROLTRACE_ID;
                        InstanceName: ETW_LPTSTR;
                        Properties: PEVENT_TRACE_PROPERTIES;
                        ControlCode: ULONG): ULONG; stdcall;

  function ControlTraceW(TraceId: CONTROLTRACE_ID;
                         InstanceName: PWideChar;
                         Properties: PEVENT_TRACE_PROPERTIES;
                         ControlCode: ULONG): ULONG; stdcall;

  function ControlTraceA(TraceId: CONTROLTRACE_ID;
                         InstanceName: PAnsiChar;
                         Properties: PEVENT_TRACE_PROPERTIES;
                         ControlCode: ULONG): ULONG; stdcall;

  function QueryAllTraces(PropertyArray: PPEVENT_TRACE_PROPERTIES;
                          PropertyArrayCount: ULONG;
                          LoggerCount: PULONG): ULONG; stdcall;

  function QueryAllTracesW(PropertyArray: PPEVENT_TRACE_PROPERTIES;
                           PropertyArrayCount: ULONG;
                           LoggerCount: PULONG): ULONG; stdcall;

  function QueryAllTracesA(PropertyArray: PPEVENT_TRACE_PROPERTIES;
                           PropertyArrayCount: ULONG;
                           LoggerCount: PULONG): ULONG; stdcall;


  // Data Provider Enable APIs
  // =========================

  function EnableTrace(Enable: ULONG;
                       EnableFlag: ULONG;
                       EnableLevel: ULONG;
                       ControlGuid: PGUID;
                       TraceId: CONTROLTRACE_ID): ULONG; stdcall;


//#if (WINVER >= _WIN32_WINNT_VISTA)

  function EnableTraceEx(ProviderId: PGUID;
                         SourceId: PGUID;
                         TraceId: CONTROLTRACE_ID;
                         IsEnabled: ULONG;
                         Level: UCHAR;
                         MatchAnyKeyword: ULONGLONG;
                         MatchAllKeyword: ULONGLONG;
                         EnableProperty: ULONG;
                         EnableFilterDesc: PEVENT_FILTER_DESCRIPTOR): ULONG; stdcall;
//#endif

const

  ENABLE_TRACE_PARAMETERS_VERSION    = 1;
  ENABLE_TRACE_PARAMETERS_VERSION_2  = 2;


type

  PENABLE_TRACE_PARAMETERS_V1 = ^ENABLE_TRACE_PARAMETERS_V1;
  _ENABLE_TRACE_PARAMETERS_V1 = record
    Version: ULONG;
    EnableProperty: ULONG;
    ControlFlags: ULONG;
    SourceId: TGUID;
    EnableFilterDesc: PEVENT_FILTER_DESCRIPTOR;
  end;
  ENABLE_TRACE_PARAMETERS_V1 = _ENABLE_TRACE_PARAMETERS_V1;


  PENABLE_TRACE_PARAMETERS = ^ENABLE_TRACE_PARAMETERS;
  _ENABLE_TRACE_PARAMETERS = record
    Version: ULONG;
    EnableProperty: ULONG;
    ControlFlags: ULONG;
    SourceId: TGUID;
    EnableFilterDesc: PEVENT_FILTER_DESCRIPTOR;
    FilterDescCount: ULONG;
  end;
  ENABLE_TRACE_PARAMETERS = _ENABLE_TRACE_PARAMETERS;


//#if (WINVER >= _WIN32_WINNT_WIN7)
  function EnableTraceEx2(TraceId: CONTROLTRACE_ID;
                          ProviderId: PGUID;
                          ControlCode: ULONG;
                          Level: UCHAR;
                          MatchAnyKeyword: ULONGLONG;
                          MatchAllKeyword: ULONGLONG;
                          Timeout: ULONG;
                          EnableParameters: PENABLE_TRACE_PARAMETERS): ULONG; stdcall;
//#endif


type
  //
  // TRACE_QUERY_INFO_CLASS/TRACE_INFO_CLASS
  // This enumeration contains values that are passed to one or more of the
  // ETW query/set APIs: EnumerateTraceGuidsEx, TraceSetInformation, TraceQueryInformation.
  //
  PRACE_INFO_CLASS = ^TRACE_INFO_CLASS;
  PRACE_QUERY_INFO_CLASS = ^TRACE_QUERY_INFO_CLASS;
  _TRACE_QUERY_INFO_CLASS = (
    //
    // TraceGuidQueryList:
    // - EnumerateTraceGuidsEx.
    //      Returns a list of provider GUIDs that are currently registered with the kernel.
    //      Note: This is not the same thing as having an installed manifest.
    //
    //      Input Format: None.
    //      Output Format: An array of GUIDs.
    //
    TraceGuidQueryList = 0,

    //
    // TraceGuidQueryList:
    // - EnumerateTraceGuidsEx.
    //      Returns the current registration and enablement information for the input GUID.
    //
    //      Input Format: GUID
    //      Output Format: TRACE_GUID_INFO followed by TRACE_GUID_INFO.InstanceCount
    //                     TRACE_PROVIDER_INSTANCE_INFO structs, each bundled with
    //                     TRACE_PROVIDER_INSTANCE_INFO.EnableCount TRACE_ENABLE_INFO.
    //                For example, a GUID with two provider registrations, the first enabled
    //                  by two loggers and the second by three loggers would look like:
    //                  {
    //                      TRACE_GUID_INFO;  // Where InstanceCount = 2
    //                      TRACE_PROVIDER_INSTANCE_INFO; // Where EnableCount = 2
    //                      TRACE_ENABLE_INFO;
    //                      TRACE_ENABLE_INFO;
    //                      TRACE_PROVIDER_INSTANCE_INFO; // Where EnableCount = 3
    //                      TRACE_ENABLE_INFO;
    //                      TRACE_ENABLE_INFO;
    //                      TRACE_ENABLE_INFO;
    //                  }
    //
    TraceGuidQueryInfo = 1,

    //
    // TraceGuidQueryProcess:
    // - EnumerateTraceGuidsEx.
    //      Returns a list of provider GUIDs that are registered in the current process.
    //      Note: This is not the same thing as having an installed manifest.
    //
    //      Input Format: None.
    //      Output Format: An array of GUIDs.
    //
    TraceGuidQueryProcess = 2,

    //
    // TraceStackTracingInfo:
    // - TraceSetInformation.
    //      Turns on stack trace collection for the specified kernel events for the specified logger.
    //      It also turns off stack tracing for all kernel events not on this list, regardless of prior status.
    //
    //      Input Format: An array of CLASSIC_EVENT_ID structs.
    //
    TraceStackTracingInfo = 3,

    //
    // TraceSystemTraceEnableFlagsInfo:
    // - TraceSetInformation
    //      Sets the Group Mask state for the specified logging session.
    //
    //      Input Format: PERFINFO_GROUPMASK
    //
    // - TraceQueryInformation
    //      Queries the current Group Mask state for the specified logging session.
    //
    //      Return Format: PERFINFO_GROUPMASK
    //
    TraceSystemTraceEnableFlagsInfo = 4,

    //
    // TraceSampledProfileIntervalInfo:
    // - TraceSetInformation
    //      Sets the Sample Profile interval for the system.
    //      Expects NULL SessionHandle parameter.
    //
    //      Input Format: TRACE_PROFILE_INTERVAL
    //
    // - TraceQueryInformation
    //      Queries the current Sample Profile Interval for the system.
    //      Expects NULL SessionHandle parameter.
    //
    //      Output Format: TRACE_PROFILE_INTERVAL
    //
    TraceSampledProfileIntervalInfo = 5,

    //
    // TraceProfileSourceConfigInfo:
    // - TraceSetInformation
    //      Sets a list of sources to be used for PMC Profiling system-wide.
    //      Expects NULL SessionHandle parameter.
    //
    //      Input Format: An array of ULONGs specifying the IDs of the sources.
    //
    TraceProfileSourceConfigInfo = 6,

    //
    // TraceProfileSourceListInfo:
    // - TraceQueryInformation
    //      Queries the list of PMC Profiling sources available on the system.
    //      Expects NULL SessionHandle parameter.
    //
    //      Output Format: An array of PROFILE_SOURCE_INFO structs.
    //
    TraceProfileSourceListInfo = 7,

    //
    // TracePmcEventListInfo:
    // - TraceSetInformation
    //      Updates the list of kernel events for which PMC counters will be collected
    //      for the specified logger.  This can only be set once per logger and cannot
    //      be updated.
    //      The counters collected are specified by
    //      TraceSetInformation(TracePmcCounterListInfo, ...) described below.
    //
    //      Input Format: An array of CLASSIC_EVENT_ID structs.
    //
    TracePmcEventListInfo = 8,

    //
    // TracePmcCounterListInfo:
    // - TraceSetInformation
    //      Sets the list of PMC counters to be collected on system events.
    //      This can only be set once per logger and cannot be updated.
    //      The specified counters will be collected on the events specified by
    //      TraceSetInformation(TracePmcEventListInfo, ...) described above.
    //
    //      Input Format: An array of ULONGs.
    //
    TracePmcCounterListInfo = 9,

    //
    // TraceSetDisallowList:
    // - TraceSetInformation
    //      Sets a list of provider GUIDs that should not be enabled via
    //      Provider Groups on the specified logging session.
    //
    //      Input Format: An array of GUIDs.
    //
    TraceSetDisallowList = 10,

    //
    // TraceVersionInfo:
    // - TraceQueryInformation
    //      Queries the version number of the trace processing code.
    //
    //      Output Format: TRACE_VERSION_INFO
    //
    TraceVersionInfo = 11,

    //
    // TraceGroupQueryList:
    // - EnumerateTraceGuidsEx.
    //      Returns a list of Group GUIDs that are currently known to the kernel.
    //
    //      Input Format: None.
    //      Output Format: An array of GUIDs.
    //
    TraceGroupQueryList = 12,

    //
    // TraceGroupQueryInfo:
    // - EnumerateTraceGuidsEx.
    //      Returns the current enablement information and list of member providers
    //      for the input Group GUID.
    //
    //      Input Format: GUID
    //      Output Format:  a) ULONG - Length of the following TRACE_ENABLE_INFO array.
    //                      b) Array of TRACE_ENABLE_INFO. Size of the array is inferred from (a)
    //                      c) ULONG - Count of the Number of Unique Providers that belong to this Group
    //                      d) Array of GUID - Size of the array is specified by (c)
    //
    //                  PseudoStructure -
    //                      struct TRACE_GROUP_INFO {
    //                          ULONG TraceEnableInfoSize;
    //                          TRACE_ENABLE_INFO TraceEnableInfos[TraceEnableInfoSize];
    //                          ULONG GuidArraySize;
    //                          GUID UniqueProviders[GuidArraySize];
    //                      }
    //
    TraceGroupQueryInfo = 13,

    //
    // TraceDisallowListQuery:
    // - TraceQueryInformation
    //      Queries the list of provider GUIDs that should not be enabled via
    //      Provider Groups on the specified logging session.
    //
    //      Output Format: An array of GUIDs.
    //
    TraceDisallowListQuery = 14,

    TraceInfoReserved15 = 15,

    //
    // TracePeriodicCaptureStateListInfo:
    // - TraceSetInformation
    //      Sets the list of providers for which capture stat should be collected
    //      at periodic time intervals for the specified logging session.
    //      If a NULL input buffer is specified, then the current periodic capture state
    //      settings are cleared.
    //
    //      Input Format: TRACE_PERIODIC_CAPTURE_STATE_INFO followed by an array of ProviderCount
    //                      Provider GUIDs. Or a NULL Buffer.
    //
    TracePeriodicCaptureStateListInfo = 16,

    //
    // TracePeriodicCaptureStatInfo:
    // - TraceQueryInformation
    //      Queries the limits of periodic capture settings on this system, including
    //      the minimum time frequency and the maximum number of providers that can be
    //      enabled for periodic capture state.
    //
    //      Output Format: TRACE_PERIODIC_CAPTURE_STATE_INFO
    //
    TracePeriodicCaptureStateInfo = 17,

    //
    // TraceProviderBinaryTracking:
    // - TraceSetInformation
    //      Instructs ETW to begin tracking binaries for all providers that are enabled
    //      to the session. The tracking applies retroactively for providers that were
    //      enabled to the session prior to the call, as well as for all future providers
    //      that are enabled to the session.
    //
    //      ETW fabricates tracking events for these tracked providers that contain a
    //      mapping between provider GUID(s). ETW also fabricates the file path that describes
    //      where the registered provider is located on disk. If the session is in realtime,
    //      the events are provided live in the realtime buffers. If the session is file-based
    //      (i.e. trace is saved to an .etl file), the events are aggregated and written to the
    //      file header; they will be among some of the first events the ETW runtime provides
    //      when the .etl file is played back.
    //
    //      The binary tracking events will come from the EventTraceGuid provider, with an opcode
    //      of WMI_LOG_TYPE_BINARY_PATH.
    //
    //      Input Format: BOOLEAN (The 1-byte type, rather than the 4-byte BOOL.)
    //                    True to turn tracking on. False to turn tracking off.
    //
    TraceProviderBinaryTracking = 18,

    //
    // TraceMaxLoggersQuery:
    // - TraceQueryInformation
    //      Queries the maximum number of system-wide loggers that can be running at a time
    //      on this system.
    //
    //      Output Format: ULONG
    //
    TraceMaxLoggersQuery = 19,

    //
    // TraceLbrConfigurationInfo:
    // - TraceSetInformation
    //      Sets a bitfield of configuration options for Last Branch Record tracing.
    //
    //      Input Format: ULONG
    //
    TraceLbrConfigurationInfo = 20,

    //
    // TraceLbrEventListInfo:
    // - TraceSetInformation
    //      Provides a list of kernel events to collect Last Branch Records on.
    //      The events are specified by their HookIds.
    //
    //      Input Format: An array of ULONGs
    //
    TraceLbrEventListInfo   = 21,

    //
    // TraceMaxPmcCounterQuery:
    // - TraceQueryInformation
    //      Queries the maximum number of PMC counters supported on this platform
    //
    //      Output Format: ULONG
    //
    TraceMaxPmcCounterQuery = 22,

    //
    // TraceStreamCount:
    // - TraceQueryInformation
    //      Queries the number of streams that a given session can be expected
    //      to emit. This is usually proportional to CPU count, or 1 if no
    //      per-processor buffering is enabled.
    //
    //      Output Format: ULONG
    //
    TraceStreamCount = 23,

    //
    // TraceStackCachingInfo:
    // - TraceSetInformation
    //      Turns on stack caching for classic event stacks.
    //
    //      Input Format: TRACE_STACK_CACHING_INFO
    //
    TraceStackCachingInfo = 24,

    //
    // TracePmcCounterOwners:
    // - TraceQueryInformation
    //      Queries ownership information for active PMC counters.
    //      Expects NULL SessionHandle.
    //
    //      Input Format: ETW_PMC_COUNTER_OWNERSHIP_STATUS with ProcessorNumber set to an
    //                    appropriate processor index. The input buffer must be of size at least
    //                    RTL_SIZEOF_THROUGH_FIELD(ETW_PMC_COUNTER_OWNERSHIP_STATUS, NumberOfCounters) +
    //                    (sizeof(ETW_PMC_COUNTER_OWNER) * EtwMaxPmcCounters), where EtwMaxPmcCounters
    //                    is the result of a TraceQueryInformation(TraceMaxPmcCounterQuery, ...) operation.
    //
    //      Output Format: ETW_PMC_COUNTER_OWNERSHIP_STATUS with CounterOwners filled out. NumberOfCounters is
    //                     set to the number of items in the CounterOwners array.
    //                     If a counter owner's OwnershipType is EtwPmcOwnerTagged, then OwnerTag contains
    //                     a tag provided by the counter owner.
    //
    TracePmcCounterOwners = 25,

    //
    // TraceStackCachingInfo:
    // - TraceSetInformation
    //      Turns on unified stack caching for all event stacks.
    //
    //      Input Format: TRACE_STACK_CACHING_INFO
    //
    TraceUnifiedStackCachingInfo = 26,

    //
    // TracePmcSessionInformation:
    //    TraceQueryInformation
    //      Queries information about enabled PMC counters for all sessions.
    //
    //      Output Format: The supplied output buffer will be set to a blob of filled out ETW_PMC_SESSION_INFO.
    //                     The NextEntryOffset member of each item will be set to the offset from the start of
    //                     the current item to the next item, or 0 if there are no more items.
    //                     The ProfileSourceCount and HookId count members will be set to the number of items that
    //                     exist in the ProfileSources array and HookIds arrays, respectively.
    //
    TracePmcSessionInformation = 27
  );
  TRACE_QUERY_INFO_CLASS = _TRACE_QUERY_INFO_CLASS;
  TRACE_INFO_CLASS = TRACE_QUERY_INFO_CLASS;

//#if (WINVER >= _WIN32_WINNT_VISTA)
  function EnumerateTraceGuidsEx(TraceQueryInfoClass: TRACE_QUERY_INFO_CLASS;
                                 InBuffer: Pointer;
                                 InBufferSize: ULONG;
                                 OutBuffer: Pointer;
                                 OutBufferSize: ULONG;
                                 ReturnLength: PULONG): ULONG; stdcall;
//#endif

type

  PCLASSIC_EVENT_ID = ^CLASSIC_EVENT_ID;
  _CLASSIC_EVENT_ID = record
    EventGuid: TGUID;
    _Type: UCHAR;
    Reserved: array[0..6] of UCHAR;
  end;
  CLASSIC_EVENT_ID = _CLASSIC_EVENT_ID;

  PTRACE_STACK_CACHING_INFO = ^_TRACE_STACK_CACHING_INFO;
  _TRACE_STACK_CACHING_INFO = record
    Enabled: BOOLEAN;
    CacheSize: ULONG;
    BucketCount: ULONG;
  end;
  TRACE_STACK_CACHING_INFO = _TRACE_STACK_CACHING_INFO;

  PTRACE_PROFILE_INTERVAL = ^TRACE_PROFILE_INTERVAL;
  _TRACE_PROFILE_INTERVAL = record
    Source: ULONG;
    Interval: ULONG;
  end;
  TRACE_PROFILE_INTERVAL = _TRACE_PROFILE_INTERVAL;

  PTRACE_VERSION_INFO = ^TRACE_VERSION_INFO;
  _TRACE_VERSION_INFO = record
    EtwTraceProcessingVersion: UINT;
    Reserved: UINT;
  end;
  TRACE_VERSION_INFO = _TRACE_VERSION_INFO;

  PTRACE_PERIODIC_CAPTURE_STATE_INFO = ^TRACE_PERIODIC_CAPTURE_STATE_INFO;
  _TRACE_PERIODIC_CAPTURE_STATE_INFO = record
    CaptureStateFrequencyInSeconds: ULONG;
    ProviderCount: USHORT;
    Reserved: USHORT;
  end;
  TRACE_PERIODIC_CAPTURE_STATE_INFO = _TRACE_PERIODIC_CAPTURE_STATE_INFO;


//#if (WINVER >= _WIN32_WINNT_WIN7)
  function TraceSetInformation(TraceId: CONTROLTRACE_ID;
                               InformationClass: TRACE_INFO_CLASS;
                               TraceInformation: Pointer;
                               InformationLength: ULONG): ULONG; stdcall;
//#endif

//#if (WINVER >= _WIN32_WINNT_WIN8)
  function TraceQueryInformation(TraceId: CONTROLTRACE_ID;
                                 InformationClass: TRACE_INFO_CLASS;
                                 TraceInformation: Pointer;
                                 InformationLength: ULONG;
                                 ReturnLength: PULONG): ULONG; stdcall;
//#endif


  // Data Provider APIs
  // ==================

  function CreateTraceInstanceId(RegHandle: THandle;
                                 InstInfo: PEVENT_INSTANCE_INFO): ULONG; stdcall;


  // Use the routine below to generate and record an event trace
  //============================================================

  function TraceEvent(TraceHandle: TRACELOGGER_HANDLE;
                      EventTrace: PEVENT_TRACE_HEADER): ULONG; stdcall;

  function TraceEventInstance(TraceHandle: TRACELOGGER_HANDLE;
                              EventTrace: PEVENT_INSTANCE_HEADER;
                              InstInfo: PEVENT_INSTANCE_INFO;
                              ParentInstInfo: PEVENT_INSTANCE_INFO): ULONG; stdcall;


  // Use the routine below to register a guid for tracing.
  // =====================================================


  function RegisterTraceGuids(RequestAddress: WMIDPREQUEST;
                              RequestContext: Pointer;
                              ControlGuid: PGUID;
                              GuidCount: ULONG;
                              TraceGuidReg: PTRACE_GUID_REGISTRATION;
                              MofImagePath: ETW_LPTSTR;
                              MofResourceName: ETW_LPTSTR;
                              RegistrationHandle: PTRACEGUID_HANDLE): ULONG; stdcall;


  function RegisterTraceGuidsW(RequestAddress: WMIDPREQUEST;
                               RequestContext: Pointer;
                               ControlGuid: PGUID;
                               GuidCount: ULONG;
                               TraceGuidReg: PTRACE_GUID_REGISTRATION;
                               MofImagePath: PWideChar;
                               MofResourceName: PWideChar;
                               RegistrationHandle: PTRACEGUID_HANDLE): ULONG; stdcall;


  function RegisterTraceGuidsA(RequestAddress: WMIDPREQUEST;
                               RequestContext: Pointer;
                               ControlGuid: PGUID;
                               GuidCount: ULONG;
                               TraceGuidReg: PTRACE_GUID_REGISTRATION;
                               MofImagePath: PAnsiChar;
                               MofResourceName: PAnsiChar;
                               RegistrationHandle: PTRACEGUID_HANDLE): ULONG; stdcall;


//#if (WINVER >= _WIN32_WINNT_WINXP)
  function EnumerateTraceGuids(GuidPropertiesArray: PPTRACE_GUID_PROPERTIES;
                               PropertyArrayCount: ULONG;
                               GuidCount: PULONG): ULONG; stdcall;
//#endif



  function UnregisterTraceGuids(RegistrationHandle: TRACEGUID_HANDLE): ULONG; stdcall;

  function GetTraceLoggerHandle(Buffer: Pointer): TRACELOGGER_HANDLE; stdcall;

  function GetTraceEnableLevel(TraceHandle: TRACELOGGER_HANDLE): UCHAR; stdcall;

  function GetTraceEnableFlags(TraceHandle: TRACELOGGER_HANDLE): ULONG; stdcall;

type

  // Structures and enums for QueryTraceProcessingHandle
  // ===================================================

  PETW_PROCESS_HANDLE_INFO_TYPE = ^ETW_PROCESS_HANDLE_INFO_TYPE;
  _ETW_PROCESS_HANDLE_INFO_TYPE = (EtwQueryPartitionInformation = 1,
                                   EtwQueryPartitionInformationV2 = 2,
                                   EtwQueryLastDroppedTimes = 3,
                                   EtwQueryLogFileHeader = 4,
                                   EtwQueryProcessHandleInfoMax = 5
                                  );
  ETW_PROCESS_HANDLE_INFO_TYPE = _ETW_PROCESS_HANDLE_INFO_TYPE;

  PETW_TRACE_PARTITION_INFORMATION = ^ETW_TRACE_PARTITION_INFORMATION;
  _ETW_TRACE_PARTITION_INFORMATION = record
    PartitionId: TGUID;
    ParentId: TGUID;
    QpcOffsetFromRoot: LONG64;
    PartitionType: ULONG;
  end;
  ETW_TRACE_PARTITION_INFORMATION = _ETW_TRACE_PARTITION_INFORMATION;

  PETW_TRACE_PARTITION_INFORMATION_V2 = ^_ETW_TRACE_PARTITION_INFORMATION_V2;
  _ETW_TRACE_PARTITION_INFORMATION_V2 = record
    QpcOffsetFromRoot: LONG64;
    PartitionType: ULONG;
    PartitionId: PWideChar;
    ParentId: PWideChar;
  end;
  ETW_TRACE_PARTITION_INFORMATION_V2 = _ETW_TRACE_PARTITION_INFORMATION_V2;


  function QueryTraceProcessingHandle(ProcessingHandle: PROCESSTRACE_HANDLE;
                                      InformationClass: ETW_PROCESS_HANDLE_INFO_TYPE;
                                      InBuffer: Pointer;
                                      InBufferSize: ULONG;
                                      OutBuffer: Pointer;
                                      OutBufferSize: ULONG;
                                      ReturnLength: PULONG): ULONG; stdcall;


  // Data Consumer APIs and structures start here
  // ============================================


  function OpenTrace(Logfile: PEVENT_TRACE_LOGFILE): PROCESSTRACE_HANDLE; stdcall;

  function OpenTraceA(Logfile: PEVENT_TRACE_LOGFILEA): PROCESSTRACE_HANDLE; stdcall;

  function OpenTraceW(Logfile: PEVENT_TRACE_LOGFILEW): PROCESSTRACE_HANDLE; stdcall;

  function ProcessTrace(HandleArray: PPROCESSTRACE_HANDLE;
                        HandleCount: ULONG;
                        StartTime: LPFILETIME;
                        EndTime: LPFILETIME): ULONG; stdcall;

  function CloseTrace(TraceHandle: PROCESSTRACE_HANDLE): ULONG; stdcall;


  {_In_opt_}
  function OpenTraceFromBufferStream(Options: PETW_OPEN_TRACE_OPTIONS;
                                     BufferCompletionCallback: PETW_BUFFER_COMPLETION_CALLBACK;
                                     BufferCompletionContext: Pointer): PROCESSTRACE_HANDLE; stdcall;

  {_Out_opt_}
  function OpenTraceFromRealTimeLogger(LoggerName: PWideChar;
                                       Options: PETW_OPEN_TRACE_OPTIONS;
                                       LogFileHeader: PTRACE_LOGFILE_HEADER): PROCESSTRACE_HANDLE; stdcall;

  {_In_opt_}
  {_Out_opt_}
  function OpenTraceFromRealTimeLoggerWithAllocationOptions(LoggerName: PWideChar;
                                                            Options: PETW_OPEN_TRACE_OPTIONS;
                                                            AllocationSize: ULONG_PTR;
                                                            MemoryPartitionHandle: THandle;
                                                            LogFileHeader: PTRACE_LOGFILE_HEADER): PROCESSTRACE_HANDLE; stdcall;

  {_Out_otp_}
  function OpenTraceFromFile(LogFileName: PWideChar;
                             Options: PETW_OPEN_TRACE_OPTIONS;
                             LogFileHeader: PTRACE_LOGFILE_HEADER): PROCESSTRACE_HANDLE; stdcall;

  function ProcessTraceBufferIncrementReference(TraceHandle: PROCESSTRACE_HANDLE;
                                                Buffer: PETW_BUFFER_HEADER): ULONG; stdcall;

  function ProcessTraceBufferDecrementReference(Buffer: PETW_BUFFER_HEADER): ULONG; stdcall;

  function ProcessTraceAddBufferToBufferStream(TraceHandle: PROCESSTRACE_HANDLE;
                                               Buffer: PETW_BUFFER_HEADER;
                                               BufferSize: ULONG): ULONG; stdcall;

  function SetTraceCallback(pGuid: PGUID;
                            EventCallback: PEVENT_CALLBACK): ULONG; stdcall;

  function RemoveTraceCallback(pGuid: PGUID): ULONG; stdcall;


  // The routines for tracing Messages follow
  // ========================================

  function TraceMessage(LoggerHandle: TRACELOGGER_HANDLE;
                        MessageFlags: ULONG;
                        MessageGuid: PGUID;
                        MessageNumber: USHORT): ULONG; cdecl; varargs;

  function TraceMessageVa(LoggerHandle: TRACELOGGER_HANDLE;
                          MessageFlags: ULONG;
                          MessageGuid: PGUID;
                          MessageNumber: USHORT;
                          MessageArgList: va_list): ULONG; cdecl;



const

  INVALID_PROCESSTRACE_HANDLE = TRACEHANDLE(INVALID_HANDLE_VALUE);


  // Additional Prototypes for ALL interfaces

  // End of Additional Prototypes

implementation

function TETW_TRACE_V2_CONTROL.GetVersionNumber: ULONG;
begin
  Result := V2Control and $FF;
end;

procedure TETW_TRACE_V2_CONTROL.SetVersionNumber(Value: ULONG);
begin
  V2Control := (V2Control and $FFFFFF00) or (Value and $FF);
end;

function TETW_TRACE_V2_OPTIONS.ReadBit(Index: Integer): ULONG;
begin
  Result := (V2Options shr Index) and 1;
end;procedure TETW_TRACE_V2_OPTIONS.WriteBit(Index: Integer;
                                         Value: ULONG);
begin
  V2Options := (V2Options and not (UInt64(1) shl Index)) or (UInt64(Value and 1) shl Index);
end;


const

  // Sechost.dll on Windows 8.1 and Windows Server 2012 R2;
  EvntraceLib = 'Advapi32.dll';
  EvntraceBufferLib = 'Sechost.dll';
  // Advapi32.dll on Windows 8, Windows Server 2012, Windows 7,
  // Windows Server 2008 R2, Windows Server 2008, Windows Vista and Windows XP
  // EvntraceLib = 'Advapi32.dll';

  {$IFDEF UNICODE}
  function StartTrace; external EvntraceLib name 'StartTraceW' {$IFNDEF FPC}{$IF COMPILERVERSION > 20.0} delayed {$ENDIF}{$ENDIF};
{$ELSE}
  function StartTrace; external EvntraceLib name 'StartTraceA' {$IFNDEF FPC}{$IF COMPILERVERSION > 20.0} delayed {$ENDIF}{$ENDIF};
{$ENDIF}
  function StartTraceW; external EvntraceLib name 'StartTraceW' ;
  function StartTraceA; external EvntraceLib name 'StartTraceA' ;
  {$IFDEF UNICODE}
  function StopTrace; external EvntraceLib name 'StopTraceW' {$IFNDEF FPC}{$IF COMPILERVERSION > 20.0} delayed {$ENDIF}{$ENDIF};
{$ELSE}
  function StopTrace; external EvntraceLib name 'StopTraceA' {$IFNDEF FPC}{$IF COMPILERVERSION > 20.0} delayed {$ENDIF}{$ENDIF};
{$ENDIF}
  function StopTraceW; external EvntraceLib name 'StopTraceW' ;
  function StopTraceA; external EvntraceLib name 'StopTraceA' ;
  {$IFDEF UNICODE}
  function QueryTrace; external EvntraceLib name 'QueryTraceW' {$IFNDEF FPC}{$IF COMPILERVERSION > 20.0} delayed {$ENDIF}{$ENDIF};
{$ELSE}
  function QueryTrace; external EvntraceLib name 'QueryTraceA' {$IFNDEF FPC}{$IF COMPILERVERSION > 20.0} delayed {$ENDIF}{$ENDIF};
{$ENDIF}
  function QueryTraceW; external EvntraceLib name 'QueryTraceW' ;
  function QueryTraceA; external EvntraceLib name 'QueryTraceA' ;
  {$IFDEF UNICODE}
  function UpdateTrace; external EvntraceLib name 'UpdateTraceW' {$IFNDEF FPC}{$IF COMPILERVERSION > 20.0} delayed {$ENDIF}{$ENDIF};
{$ELSE}
  function UpdateTrace; external EvntraceLib name 'UpdateTraceA' {$IFNDEF FPC}{$IF COMPILERVERSION > 20.0} delayed {$ENDIF}{$ENDIF};
{$ENDIF}
  function UpdateTraceW; external EvntraceLib name 'UpdateTraceW' ;
  function UpdateTraceA; external EvntraceLib name 'UpdateTraceA' ;
  {$IFDEF UNICODE}
  function FlushTrace; external EvntraceLib name 'FlushTraceW' {$IFNDEF FPC}{$IF COMPILERVERSION > 20.0} delayed {$ENDIF}{$ENDIF};
{$ELSE}
  function FlushTrace; external EvntraceLib name 'FlushTraceA' {$IFNDEF FPC}{$IF COMPILERVERSION > 20.0} delayed {$ENDIF}{$ENDIF};
{$ENDIF}
  function FlushTraceW; external EvntraceLib name 'FlushTraceW' ;
  function FlushTraceA; external EvntraceLib name 'FlushTraceA' ;
  {$IFDEF UNICODE}
  function ControlTrace; external EvntraceLib name 'ControlTraceW' {$IFNDEF FPC}{$IF COMPILERVERSION > 20.0} delayed {$ENDIF}{$ENDIF};
{$ELSE}
  function ControlTrace; external EvntraceLib name 'ControlTraceA' {$IFNDEF FPC}{$IF COMPILERVERSION > 20.0} delayed {$ENDIF}{$ENDIF};
{$ENDIF}
  function ControlTraceW; external EvntraceLib name 'ControlTraceW' ;
  function ControlTraceA; external EvntraceLib name 'ControlTraceA' ;
  {$IFDEF UNICODE}
  function QueryAllTraces; external EvntraceLib name 'QueryAllTracesW' {$IFNDEF FPC}{$IF COMPILERVERSION > 20.0} delayed {$ENDIF}{$ENDIF};
{$ELSE}
  function QueryAllTraces; external EvntraceLib name 'QueryAllTracesA' {$IFNDEF FPC}{$IF COMPILERVERSION > 20.0} delayed {$ENDIF}{$ENDIF};
{$ENDIF}
  function QueryAllTracesW; external EvntraceLib name 'QueryAllTracesW' ;
  function QueryAllTracesA; external EvntraceLib name 'QueryAllTracesA' ;
  function EnableTrace; external EvntraceLib name 'EnableTrace' ;
  function EnableTraceEx; external EvntraceLib name 'EnableTraceEx' ;
  function EnableTraceEx2; external EvntraceLib name 'EnableTraceEx2' ;
  function TraceSetInformation; external EvntraceLib name 'TraceSetInformation' ;
  function TraceQueryInformation; external EvntraceLib name 'TraceQueryInformation' ;
  function QueryTraceProcessingHandle; external EvntraceLib name 'QueryTraceProcessingHandle' ;
  function TraceMessage; external EvntraceLib name 'TraceMessage' ;
  function TraceMessageVa; external EvntraceLib name 'TraceMessageVa' ;
  function EnumerateTraceGuidsEx; external EvntraceLib name 'EnumerateTraceGuidsEx' ;
  function CreateTraceInstanceId; external EvntraceLib name 'CreateTraceInstanceId' ;
  function TraceEvent; external EvntraceLib name 'TraceEvent' ;
  function TraceEventInstance; external EvntraceLib name 'TraceEventInstance' ;
  {$IFDEF UNICODE}
  function RegisterTraceGuids; external EvntraceLib name 'RegisterTraceGuidsW' {$IFNDEF FPC}{$IF COMPILERVERSION > 20.0} delayed {$ENDIF}{$ENDIF};
{$ELSE}
  function RegisterTraceGuids; external EvntraceLib name 'RegisterTraceGuidsA' {$IFNDEF FPC}{$IF COMPILERVERSION > 20.0} delayed {$ENDIF}{$ENDIF};
{$ENDIF}
  function RegisterTraceGuidsW; external EvntraceLib name 'RegisterTraceGuidsW' ;
  function RegisterTraceGuidsA; external EvntraceLib name 'RegisterTraceGuidsA' ;
  function EnumerateTraceGuids; external EvntraceLib name 'EnumerateTraceGuids' ;
  function UnregisterTraceGuids; external EvntraceLib name 'UnregisterTraceGuids' ;
  function GetTraceLoggerHandle; external EvntraceLib name 'GetTraceLoggerHandle' ;
  function GetTraceEnableLevel; external EvntraceLib name 'GetTraceEnableLevel' ;
  function GetTraceEnableFlags; external EvntraceLib name 'GetTraceEnableFlags' ;
{$IFDEF UNICODE}
  function OpenTrace; external EvntraceLib name 'OpenTraceW' {$IFNDEF FPC}{$IF COMPILERVERSION > 20.0} delayed {$ENDIF}{$ENDIF};
{$ELSE}
  function OpenTrace; external EvntraceLib name 'OpenTraceA' {$IFNDEF FPC}{$IF COMPILERVERSION > 20.0} delayed {$ENDIF}{$ENDIF};
{$ENDIF}
  function OpenTraceA; external EvntraceLib name 'OpenTraceA' {$IFNDEF FPC}{$IF COMPILERVERSION > 20.0} delayed {$ENDIF}{$ENDIF};
  function OpenTraceW; external EvntraceLib name 'OpenTraceW' ;
  function ProcessTrace; external EvntraceLib name 'ProcessTrace' ;
  function CloseTrace; external EvntraceLib name 'CloseTrace' ;
  function OpenTraceFromBufferStream; external EvntraceBufferLib name 'OpenTraceFromBufferStream' ;
  function OpenTraceFromRealTimeLogger; external EvntraceBufferLib name 'OpenTraceFromRealTimeLogger' ;
  function OpenTraceFromRealTimeLoggerWithAllocationOptions; external EvntraceBufferLib name 'OpenTraceFromRealTimeLoggerWithAllocationOptions' ;
  function OpenTraceFromFile; external EvntraceBufferLib name 'OpenTraceFromFile' ;
  function ProcessTraceBufferIncrementReference; external EvntraceBufferLib name 'ProcessTraceBufferIncrementReference' ;
  function ProcessTraceBufferDecrementReference; external EvntraceBufferLib name 'ProcessTraceBufferDecrementReference' ;
  function ProcessTraceAddBufferToBufferStream; external EvntraceBufferLib name 'ProcessTraceAddBufferToBufferStream' ;
  function SetTraceCallback; external EvntraceLib name 'SetTraceCallback' ;
  function RemoveTraceCallback ; external EvntraceLib name 'RemoveTraceCallback' ;

  // Implement Additional functions here.

end.
