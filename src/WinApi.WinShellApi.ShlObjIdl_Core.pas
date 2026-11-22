// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MfPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.WinShellApi.ShlObjIdl_Core.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 27-06-2012
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: Shell API.
//
// Organisation: FactoryX
// Initiator(s): Tony (maXcomX), Peter (OzShips)
// Contributor(s): Tony Kalf (maXcomX), Carmen (carmenh)
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
// Source: ShlObjId_Core.h
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
unit WinApi.WinShellApi.ShlObjIdl_Core;

{$I MfPack.Fpc.inc}


interface

uses

  {WinApi}
  Windows,
  CommCtrl,
  WinApi.WinApiTypes,
  WinApi.ComBaseApi,
  WinApi.WinShellApi.ShTypes,
  WinApi.Unknwn,
  ShellApi,
  WinApi.ComCat,
  WinApi.StructuredQueryCondition_2020,  // alias for WinApi.StructuredQueryCondition which lacks important updates.
  WinApi.WinShellApi.ObjectArray,
  WinApi.ServProv,
  {ActiveX}
  WinApi.ActiveX.OleIdl,
  WinApi.ActiveX.ObjIdl,
  WinApi.ActiveX.ObjBase,
  WinApi.ActiveX.PropIdl,
  WinApi.ActiveX.PropSys,
  WinApi.ActiveX.ObjIdlbase,
  WinApi.ActiveX.OaIdl,
  WinApi.MediaFoundationApi.MfError;

  {$PACKENUM 4}

  {$IFDEF WIN32}
    {$ALIGN 1}
  {$ELSE}
  {$PACKRECORDS C}
  // Win64
  {$ENDIF}

  {$I 'WinApiTypes.inc'}

  // This unit was translated from ShObjIdl_core.h.
  // External include-file contents are intentionally not expanded.

const
  SEE_MASK_NOASYNC = $00000100;
  SEE_MASK_NOZONECHECKS = $00800000;

  // Keep the following as normal constants. They are #define values in ShObjIdl_core.h, not C enum members:

  //  and GUID/string constants.

  // QueryContextMenu uFlags
  CMF_NORMAL = $00000000;
  CMF_DEFAULTONLY = $00000001;
  CMF_VERBSONLY = $00000002;
  CMF_EXPLORE = $00000004;
  CMF_NOVERBS = $00000008;
  CMF_CANRENAME = $00000010;
  CMF_NODEFAULT = $00000020;

  CMF_INCLUDESTATIC = $00000040;
  CMF_ITEMMENU = $00000080;
  CMF_EXTENDEDVERBS = $00000100;
  CMF_DISABLEDVERBS = $00000200;
  CMF_ASYNCVERBSTATE = $00000400;
  CMF_OPTIMIZEFORINVOKE = $00000800;
  CMF_SYNCCASCADEMENU = $00001000;
  CMF_DONOTPICKDEFAULT = $00002000;
  CMF_RESERVED = $FFFF0000;

  // GetCommandString uFlags
  GCS_VERBA = $00000000;  // canonical verb
  GCS_HELPTEXTA = $00000001;  // help text (for status bar)
  GCS_VALIDATEA = $00000002;  // validate command exists
  GCS_VERBW = $00000004;  // canonical verb (unicode)
  GCS_HELPTEXTW = $00000005;  // help text (unicode version)
  GCS_VALIDATEW = $00000006;  // validate command exists (unicode)
  GCS_VERBICONW = $00000014;  // icon string (unicode)
  GCS_UNICODE = $00000004;  // for bit testing - Unicode string

  {$IFDEF UNICODE}
  GCS_VERB = GCS_VERBW;
  GCS_HELPTEXT = GCS_HELPTEXTW;
  GCS_VALIDATE = GCS_VALIDATEW;
  {$ELSE}
  GCS_VERB = GCS_VERBA;
  GCS_HELPTEXT = GCS_HELPTEXTA;
  GCS_VALIDATE = GCS_VALIDATEA;
  {$ENDIF}

  CMDSTR_NEWFOLDERA = 'NewFolder';
  CMDSTR_VIEWLISTA = 'ViewList';
  CMDSTR_VIEWDETAILSA = 'ViewDetails';
  CMDSTR_NEWFOLDERW = 'NewFolder';
  CMDSTR_VIEWLISTW = 'ViewList';
  CMDSTR_VIEWDETAILSW = 'ViewDetails';

  {$IFDEF UNICODE}
  CMDSTR_NEWFOLDER = CMDSTR_NEWFOLDERW;
  CMDSTR_VIEWLIST = CMDSTR_VIEWLISTW;
  CMDSTR_VIEWDETAILS = CMDSTR_VIEWDETAILSW;
  {$ELSE}
  CMDSTR_NEWFOLDER = CMDSTR_NEWFOLDERA;
  CMDSTR_VIEWLIST = CMDSTR_VIEWLISTA;
  CMDSTR_VIEWDETAILS = CMDSTR_VIEWDETAILSA;
  {$ENDIF}

  CMIC_MASK_HOTKEY = SEE_MASK_HOTKEY;
  CMIC_MASK_ICON = SEE_MASK_ICON;
  CMIC_MASK_FLAG_NO_UI = SEE_MASK_FLAG_NO_UI;
  CMIC_MASK_UNICODE = SEE_MASK_UNICODE;
  CMIC_MASK_NO_CONSOLE = SEE_MASK_NO_CONSOLE;
  //#if (NTDDI_VERSION < NTDDI_VISTA)
  CMIC_MASK_HASLINKNAME = $00010000; // SEE_MASK_HASLINKNAME
  CMIC_MASK_HASTITLE = $00080000; // SEE_MASK_HASTITLE
  //#endif  // NTDDI_VISTA
  CMIC_MASK_FLAG_SEP_VDM = $00020000; // SEE_MASK_FLAG_SEPVDM
  CMIC_MASK_ASYNCOK = SEE_MASK_ASYNCOK;
  //#if (NTDDI_VERSION >= NTDDI_VISTA)
  CMIC_MASK_NOASYNC = SEE_MASK_NOASYNC;
  //#endif
  CMIC_MASK_SHIFT_DOWN = $10000000;
  CMIC_MASK_CONTROL_DOWN = $40000000;
  CMIC_MASK_FLAG_LOG_USAGE = SEE_MASK_FLAG_LOG_USAGE;
  CMIC_MASK_NOZONECHECKS = SEE_MASK_NOZONECHECKS;
  CMIC_MASK_PTINVOKE = $20000000;

  // IPersistFolder
  IRTIR_TASK_NOT_RUNNING = 0;
  IRTIR_TASK_RUNNING = 1;
  IRTIR_TASK_SUSPENDED = 2;
  IRTIR_TASK_PENDING = 3;
  IRTIR_TASK_FINISHED = 4;

  // IShellTaskScheduler
  TOID_NULL: TGUID = '{00000000-0000-0000-0000-000000000000}'; // GUID_NULL;
  ITSAT_DEFAULT_LPARAM = DWORD_PTR(-1);
  ITSAT_DEFAULT_PRIORITY = $10000000;
  ITSAT_MAX_PRIORITY = $7FFFFFFF;
  ITSAT_MIN_PRIORITY = $00000000;
  ITSSFLAG_COMPLETE_ON_DESTROY = $0000;  // wait for the current task to complete before deleting the scheduler
  ITSSFLAG_KILL_ON_DESTROY = $0001;  // kill the current task (if there is one) when the task scheduler is deleted
  ITSSFLAG_FLAGS_MASK = $0003;
  ITSS_THREAD_DESTROY_DEFAULT_TIMEOUT = (10 * 1000);  // default milliseconds until a sleeping worker thread is released
  ITSS_THREAD_TERMINATE_TIMEOUT = (INFINITE);  // set sleeping worker threads to never be released
  ITSS_THREAD_TIMEOUT_NO_CHANGE = (INFINITE - 1);  // no change to the thread timeout

  // IEnumFullIDList
  SHCIDS_ALLFIELDS = $80000000;
  SHCIDS_CANONICALONLY = $10000000;
  SHCIDS_BITMASK = $FFFF0000;
  SHCIDS_COLUMNMASK = $0000FFFF;
  SFGAO_CANCOPY = DROPEFFECT_COPY;  // Objects can be copied    (0x1)
  SFGAO_CANMOVE = DROPEFFECT_MOVE;  // Objects can be moved     (0x2)
  SFGAO_CANLINK = DROPEFFECT_LINK;  // Objects can be linked    (0x4)
  SFGAO_STORAGE = $00000008;  // supports BindToObject(IID_IStorage)
  SFGAO_CANRENAME = $00000010;  // Objects can be renamed
  SFGAO_CANDELETE = $00000020;  // Objects can be deleted
  SFGAO_HASPROPSHEET = $00000040;  // Objects have property sheets
  SFGAO_DROPTARGET = $00000100;  // Objects are drop target
  SFGAO_CAPABILITYMASK = $00000177;
  SFGAO_PLACEHOLDER = $00000800;  // File or folder is not fully present and recalled on open or access
  SFGAO_SYSTEM = $00001000;  // System object
  SFGAO_ENCRYPTED = $00002000;  // Object is encrypted (use alt color)
  SFGAO_ISSLOW = $00004000;  // 'Slow' object
  SFGAO_GHOSTED = $00008000;  // Ghosted icon
  SFGAO_LINK = $00010000;  // Shortcut (link)
  SFGAO_SHARE = $00020000;  // Shared
  SFGAO_READONLY = $00040000;  // Read-only
  SFGAO_HIDDEN = $00080000;  // Hidden object
  SFGAO_DISPLAYATTRMASK = $000FC000;
  SFGAO_FILESYSANCESTOR = $10000000;  // May contain children with SFGAO_FILESYSTEM
  SFGAO_FOLDER = $20000000;  // Support BindToObject(IID_IShellFolder)
  SFGAO_FILESYSTEM = $40000000;  // Is a win32 file system object (file/folder/root)
  SFGAO_HASSUBFOLDER = $80000000;  // May contain children with SFGAO_FOLDER (may be slow)
  SFGAO_CONTENTSMASK = $80000000;
  SFGAO_VALIDATE = $01000000;  // Invalidate cached information (may be slow)
  SFGAO_REMOVABLE = $02000000;  // Is this removeable media?
  SFGAO_COMPRESSED = $04000000;  // Object is compressed (use alt color)
  SFGAO_BROWSABLE = $08000000;  // Supports IShellFolder, but only implements CreateViewObject() (non-folder view)
  SFGAO_NONENUMERATED = $00100000;  // Is a non-enumerated object (should be hidden)
  SFGAO_NEWCONTENT = $00200000;  // Should show bold in explorer tree
  SFGAO_CANMONIKER = $00400000;  // Obsolete
  SFGAO_HASSTORAGE = $00400000;  // Obsolete
  SFGAO_STREAM = $00400000;  // Supports BindToObject(IID_IStream)
  SFGAO_STORAGEANCESTOR = $00800000;  // May contain children with SFGAO_STORAGE or SFGAO_STREAM
  SFGAO_STORAGECAPMASK = $70C50008;  // For determining storage capabilities, ie for open/save semantics
  SFGAO_PKEYSFGAOMASK = $81044000;  // Attributes that are masked out for PKEY_SFGAOFlags because they are considered to cause slow calculations or lack context (SFGAO_VALIDATE | SFGAO_ISSLOW | SFGAO_HASSUBFOLDER and others)

  // IPreviewHandlerVisuals
  CDBOSC_SETFOCUS = $00000000;
  CDBOSC_KILLFOCUS = $00000001;
  CDBOSC_SELCHANGE = $00000002;
  CDBOSC_RENAME = $00000003;
  CDBOSC_STATECHANGE = $00000004;

  // ICommDlgBrowser
  //#if (NTDDI_VERSION >= NTDDI_WIN2K)
  CDB2N_CONTEXTMENU_DONE = $00000001;
  CDB2N_CONTEXTMENU_START = $00000002;
  CDB2GVF_SHOWALLFILES = $00000001;
  //#if (NTDDI_VERSION >= NTDDI_VISTA)
  CDB2GVF_ISFILESAVE = $00000002;  // is file save, else file open
  CDB2GVF_ALLOWPREVIEWPANE = $00000004;
  CDB2GVF_NOSELECTVERB = $00000008;
  CDB2GVF_NOINCLUDEITEM = $00000010;
  CDB2GVF_ISFOLDERPICKER = $00000020;
  CDB2GVF_ADDSHIELD = $00000040;  // when CDB2GVF_NOSELECTVERB is not specified this flag controls the display of a LUA shield on the Select menu item
  //#endif  // NTDDI_VISTA

  // IShellIconVtbl
  SBSP_DEFBROWSER = $0000;
  SBSP_SAMEBROWSER = $0001;
  SBSP_NEWBROWSER = $0002;
  SBSP_DEFMODE = $0000;
  SBSP_OPENMODE = $0010;
  SBSP_EXPLOREMODE = $0020;
  SBSP_HELPMODE = $0040;
  SBSP_NOTRANSFERHIST = $0080;
  SBSP_ABSOLUTE = $0000;
  SBSP_RELATIVE = $1000;
  SBSP_PARENT = $2000;
  SBSP_NAVIGATEBACK = $4000;
  SBSP_NAVIGATEFORWARD = $8000;
  SBSP_ALLOW_AUTONAVIGATE = $00010000;
  //#if (NTDDI_VERSION >= NTDDI_VISTA)
  SBSP_KEEPSAMETEMPLATE = $00020000;
  SBSP_KEEPWORDWHEELTEXT = $00040000;
  SBSP_ACTIVATE_NOFOCUS = $00080000;
  SBSP_CREATENOHISTORY = $00100000;
  SBSP_PLAYNOSOUND = $00200000;
  //#endif  // (NTDDI_VERSION >= NTDDI_VISTA)
  //#if (_WIN32_IE >= _WIN32_IE_IE60SP2)
  SBSP_CALLERUNTRUSTED = $00800000;
  SBSP_TRUSTFIRSTDOWNLOAD = $01000000;
  SBSP_UNTRUSTEDFORDOWNLOAD = $02000000;
  //#endif  // _WIN32_IE_IE60SP2
  SBSP_NOAUTOSELECT = $04000000;
  SBSP_WRITENOHISTORY = $08000000;
  //#if (_WIN32_IE >= _WIN32_IE_IE60SP2)
  SBSP_TRUSTEDFORACTIVEX = $10000000;
  //#endif  // _WIN32_IE_IE60SP2
  //#if (_WIN32_IE >= _WIN32_IE_IE70)
  SBSP_FEEDNAVIGATION = $20000000;
  //#endif  // _WIN32_IE_IE70
  SBSP_REDIRECT = $40000000;
  SBSP_INITIATEDBYHLINKFRAME = $80000000;
  FCW_STATUS = $0001;
  FCW_TOOLBAR = $0002;
  FCW_TREE = $0003;
  FCW_INTERNETBAR = $0006;
  FCW_PROGRESS = $0008;
  //#if (_WIN32_IE >= 0x0700)
  //#endif
  FCT_MERGE = $0001;
  FCT_CONFIGABLE = $0002;
  FCT_ADDTOEND = $0004;
  //#ifdef _NEVER_

  // IActionProgress
  ARCONTENT_AUTORUNINF = $00000002;  // That's the one we have today, and always had
  ARCONTENT_AUDIOCD = $00000004;  // Audio CD (not MP3 and the like, the stuff you buy at the store)
  ARCONTENT_DVDMOVIE = $00000008;  // DVD Movie (not MPEGs, the stuff you buy at the store)
  ARCONTENT_BLANKCD = $00000010;  // Blank CD-R/CD-RW)
  ARCONTENT_BLANKDVD = $00000020;  // Blank DVD-R/DVD-RW
  ARCONTENT_UNKNOWNCONTENT = $00000040;  // Whatever files.  Mean that it's formatted.
  ARCONTENT_AUTOPLAYPIX = $00000080;  // Any files classified by shell as image. (jpg, bmp, etc.)
  ARCONTENT_AUTOPLAYMUSIC = $00000100;  // Any files classified by shell as music. (wma, mp3, etc.)
  ARCONTENT_AUTOPLAYVIDEO = $00000200;  // Any files classified by shell as video. (mpg, avi, etc.)
  //#if (NTDDI_VERSION >= NTDDI_VISTA)
  ARCONTENT_VCD = $00000400;  // VCD format
  ARCONTENT_SVCD = $00000800;  // Super-VCD format
  ARCONTENT_DVDAUDIO = $00001000;  // DVD-Audio
  ARCONTENT_BLANKBD = $00002000;  // Blank BD-R/BD-RW
  ARCONTENT_BLURAY = $00004000;  // Blu-ray Disc
  ARCONTENT_CAMERASTORAGE = $00008000;  // Camera Storage
  ARCONTENT_CUSTOMEVENT = $00010000;  // Custom Event
  ARCONTENT_NONE = $00000000;  // Empty (but formatted)
  ARCONTENT_MASK = $0001FFFE;  // Bits that denote valid content types
  ARCONTENT_PHASE_UNKNOWN = $00000000;  // We can be in any phase.  This is XP behavior.
  ARCONTENT_PHASE_PRESNIFF = $10000000;  // These are contents we know w/o scanning the media for complete data (e.g. Audio track, DVD Movie).
  ARCONTENT_PHASE_SNIFFING = $20000000;  // We are in the middle of searching the media.  There could be more contents to be found than currently reported.
  ARCONTENT_PHASE_FINAL = $40000000;  // We have finished searching; contents we report are final.
  ARCONTENT_PHASE_MASK = $70000000;  // Bits that denote what phase we are in the Autoplay process.
  //#endif  // NTDDI_VISTA

  // IExtractImage
  IEI_PRIORITY_MAX = ITSAT_MAX_PRIORITY;
  IEI_PRIORITY_MIN = ITSAT_MIN_PRIORITY;
  IEIT_PRIORITY_NORMAL = ITSAT_DEFAULT_PRIORITY;
  IEIFLAG_ASYNC = $0001;  // (deprecated) ask the extractor if it supports ASYNC extract (free threaded)
  IEIFLAG_CACHE = $0002;  // returned from the extractor if it does NOT cache the thumbnail
  IEIFLAG_ASPECT = $0004;  // passed to the extractor to beg it to render to the aspect ratio of the supplied rect
  IEIFLAG_OFFLINE = $0008;  // if the extractor shouldn't hit the net to get any content neede for the rendering
  IEIFLAG_GLEAM = $0010;  // does the image have a gleam ? this will be returned if it does
  IEIFLAG_SCREEN = $0020;  // render as if for the screen  (this is exlusive with IEIFLAG_ASPECT )
  IEIFLAG_ORIGSIZE = $0040;  // render to the approx size passed, but crop if neccessary
  IEIFLAG_NOSTAMP = $0080;  // returned from the extractor if it does NOT want an icon stamp on the thumbnail
  IEIFLAG_NOBORDER = $0100;  // returned from the extractor if it does NOT want an a border around the thumbnail
  IEIFLAG_QUALITY = $0200;  // passed to the Extract method to indicate that a slower, higher quality image is desired, re-compute the thumbnail
  IEIFLAG_REFRESH = $0400;  // returned from the extractor if it would like to have Refresh Thumbnail available

  // IDeskBand
  DBIM_MINSIZE = $0001;
  DBIM_MAXSIZE = $0002;
  DBIM_INTEGRAL = $0004;
  DBIM_ACTUAL = $0008;
  DBIM_TITLE = $0010;
  DBIM_MODEFLAGS = $0020;
  DBIM_BKCOLOR = $0040;

  DBIMF_NORMAL = $0000;
  DBIMF_FIXED = $0001;
  DBIMF_FIXEDBMP = $0004;  // a fixed background bitmap (if supported)
  DBIMF_VARIABLEHEIGHT = $0008;
  DBIMF_UNDELETEABLE = $0010;
  DBIMF_DEBOSSED = $0020;
  DBIMF_BKCOLOR = $0040;
  DBIMF_USECHEVRON = $0080;
  DBIMF_BREAK = $0100;
  DBIMF_ADDTOFRONT = $0200;
  DBIMF_TOPALIGN = $0400;
  //#if (NTDDI_VERSION >= NTDDI_VISTA)
  DBIMF_NOGRIPPER = $0800;
  DBIMF_ALWAYSGRIPPER = $1000;
  DBIMF_NOMARGINS = $2000;
  //#endif  // NTDDI_VISTA
  DBIF_VIEWMODE_NORMAL = $0000;
  DBIF_VIEWMODE_VERTICAL = $0001;
  DBIF_VIEWMODE_FLOATING = $0002;
  DBIF_VIEWMODE_TRANSPARENT = $0004;

  // IFileOperation
  FOFX_NOSKIPJUNCTIONS = $00010000;  // Don't avoid binding to junctions (like Task folder, Recycle-Bin)
  FOFX_PREFERHARDLINK = $00020000;  // Create hard link if possible
  FOFX_SHOWELEVATIONPROMPT = $00040000;  // Show elevation prompts when error UI is disabled (use with FOF_NOERRORUI)
  FOFX_RECYCLEONDELETE = $00080000;  // Recycle when deleting, rather than permanently deleting
  FOFX_EARLYFAILURE = $00100000;  // Fail operation as soon as a single error occurs rather than trying to process other items (applies only when using FOF_NOERRORUI)
  FOFX_PRESERVEFILEEXTENSIONS = $00200000;  // Rename collisions preserve file extns (use with FOF_RENAMEONCOLLISION)
  FOFX_KEEPNEWERFILE = $00400000;  // Keep newer file on naming conflicts
  FOFX_NOCOPYHOOKS = $00800000;  // Don't use copy hooks
  FOFX_NOMINIMIZEBOX = $01000000;  // Don't allow minimizing the progress dialog
  FOFX_MOVEACLSACROSSVOLUMES = $02000000;  // Copy security information when performing a cross-volume move operation
  FOFX_DONTDISPLAYSOURCEPATH = $04000000;  // Don't display the path of source file in progress dialog
  FOFX_DONTDISPLAYDESTPATH = $08000000;  // Don't display the path of destination file in progress dialog
  FOFX_REQUIREELEVATION = $10000000;  // User expects the elevation; don't show a dialog to confirm
  FOFX_ADDUNDORECORD = $20000000;  // This is a user-invoked operation, and should be placed on the undo stack.  This flag is preferred to FOF_ALLOWUNDO
  FOFX_COPYASDOWNLOAD = $40000000;  // Show Downloading instead of Copying
  FOFX_DONTDISPLAYLOCATIONS = $80000000;  // Hides the locations line in the progress dialog

  // IBandSite
  BSIM_STATE = $00000001;
  BSIM_STYLE = $00000002;
  BSSF_VISIBLE = $00000001;
  BSSF_NOTITLE = $00000002;
  BSSF_UNDELETEABLE = $00001000;
  BSIS_AUTOGRIPPER = $00000000;
  BSIS_NOGRIPPER = $00000001;
  BSIS_ALWAYSGRIPPER = $00000002;
  BSIS_LEFTALIGN = $00000004;
  BSIS_SINGLECLICK = $00000008;
  BSIS_NOCONTEXTMENU = $00000010;
  BSIS_NODROPTARGET = $00000020;
  BSIS_NOCAPTION = $00000040;
  BSIS_PREFERNOLINEBREAK = $00000080;
  BSIS_LOCKED = $00000100;
  //#if (_WIN32_IE >= _WIN32_IE_IE70)
  BSIS_PRESERVEORDERDURINGLAYOUT = $00000200;
  BSIS_FIXEDORDER = $00000400;
  //#endif  // _WIN32_IE_IE70
  SID_SBandSite: TGUID = '{4CF504B0-DE96-11D0-8B3F-00A0C911E8E5}'; // IID_IBandSite
  CGID_BandSite: TGUID = '{4CF504B0-DE96-11D0-8B3F-00A0C911E8E5}'; // IID_IBandSite

  // IFileIsInUse
  OF_CAP_CANSWITCHTO = $0001;
  OF_CAP_CANCLOSE = $0002;

  // IShellMenuCallback
  // Mask
  SMDM_SHELLFOLDER = $00000001;  // This is for an item in the band
  SMDM_HMENU = $00000002;  // This is for the Band itself
  SMDM_TOOLBAR = $00000004;  // Plain toolbar, not associated with a shell folder or hmenu

  SMC_INITMENU = $00000001;  // The callback is called to init a menuband
  SMC_CREATE = $00000002;
  SMC_EXITMENU = $00000003;  // The callback is called when menu is collapsing
  SMC_GETINFO = $00000005;  // The callback is called to return DWORD values
  SMC_GETSFINFO = $00000006;  // The callback is called to return DWORD values
  SMC_GETOBJECT = $00000007;  // The callback is called to get some object
  SMC_GETSFOBJECT = $00000008;  // The callback is called to get some object
  SMC_SFEXEC = $00000009;  // The callback is called to execute an shell folder item
  SMC_SFSELECTITEM = $0000000A;  // The callback is called when an item is selected
  SMC_REFRESH = $00000010;  // Menus have completely refreshed. Reset your state.
  SMC_DEMOTE = $00000011;  // Demote an item
  SMC_PROMOTE = $00000012;  // Promote an item, wParam = SMINV_* flag
  SMC_DEFAULTICON = $00000016;  // Returns Default icon location in wParam, index in lParam
  SMC_NEWITEM = $00000017;  // Notifies item is not in the order stream.
  SMC_CHEVRONEXPAND = $00000019;  // Notifies of a expansion via the chevron
  SMC_DISPLAYCHEVRONTIP = $0000002A;  // S_OK display, S_FALSE not.
  SMC_SETSFOBJECT = $0000002D;  // Called to save the passed object
  SMC_SHCHANGENOTIFY = $0000002E;  // Called when a Change notify is received. lParam points to SMCSHCHANGENOTIFYSTRUCT
  SMC_CHEVRONGETTIP = $0000002F;  // Called to get the chevron tip text. wParam = Tip title, Lparam = TipText Both MAX_PATH
  SMC_SFDDRESTRICTED = $00000030;  // Called requesting if it's ok to drop. wParam = IDropTarget.
  //#if (_WIN32_IE >= _WIN32_IE_IE70)
  SMC_SFEXEC_MIDDLE = $00000031;  // Same as SFEXEC, but the middle mouse button caused the exec.
  SMC_GETAUTOEXPANDSTATE = $00000041;  // callback returns the default autoexpand state lParam = LPDWORD to recieve flags
  SMC_AUTOEXPANDCHANGE = $00000042;  // Notify that the menu is expanding/contracting
  SMC_GETCONTEXTMENUMODIFIER = $00000043;  // Used to add items to a context menu
  SMC_GETBKCONTEXTMENU = $00000044;  // used to get a context menu to display when user right clicks on the background
  SMC_OPEN = $00000045;  // allows client to overwrite open/explore verb action on an item
  // Flags for return value from SMC_GETAUTOEXPANDSTATE and SMC_AUTOEXPANDCHANGE:
  SMAE_EXPANDED = $00000001;  // The menu is or should start expanded
  SMAE_CONTRACTED = $00000002;  // The menu is or should start contracted
  // SMAE_EXPANDED and SMAE_CONTRACTED are mutually exclusive
  SMAE_USER = $00000004;  // Indicates that the menu expansion/contraction is a reflection
  // of user choice
  SMAE_VALID = $00000007;
  //#endif  // _WIN32_IE_IE70

  // IShellMenu
  SMINIT_DEFAULT = $00000000;  // No Options
  SMINIT_RESTRICT_DRAGDROP = $00000002;  // Don't allow Drag and Drop
  SMINIT_TOPLEVEL = $00000004;  // This is the top band.
  SMINIT_CACHED = $00000010;
  //#if (_WIN32_IE >= _WIN32_IE_IE70)
  SMINIT_AUTOEXPAND = $00000100;  // automatically expand/contract menu band
  SMINIT_AUTOTOOLTIP = $00000200;  // regular tooltip support
  SMINIT_DROPONCONTAINER = $00000400;  // allow drop on a container
  //#endif  // _WIN32_IE_IE70
  SMINIT_VERTICAL = $10000000;  // This is a vertical menu
  SMINIT_HORIZONTAL = $20000000;  // This is a horizontal menu    (does not inherit)
  ANCESTORDEFAULT = UINT(-1);
  SMSET_TOP = $10000000;  // Bias this namespace to the top of the menu
  SMSET_BOTTOM = $20000000;  // Bias this namespace to the bottom of the menu
  SMSET_DONTOWN = $00000001;  // The Menuband doesn't own the non-ref counted object
  SMINV_REFRESH = $00000001;
  SMINV_ID = $00000008;

  // IBannerNotificationHandler
  ISIOI_ICONFILE = $00000001;
  ISIOI_ICONINDEX = $00000002;

  // ITaskbarList3Vtbl
  THBN_CLICKED = $1800;

  E_PREVIEWHANDLER_DRM_FAIL = _HRESULT_TYPEDEF_($86420001);
  E_PREVIEWHANDLER_NOAUTH = _HRESULT_TYPEDEF_($86420002);
  E_PREVIEWHANDLER_NOTFOUND = _HRESULT_TYPEDEF_($86420003);
  E_PREVIEWHANDLER_CORRUPT = _HRESULT_TYPEDEF_($86420004);

  // SID =========================================================================

  SID_ExecuteCommandHost: TGUID = '{4b6832a2-5f04-4c9d-b89d-727a15d103e7}';
  SID_URLExecutionContext: TGUID = '{FB5F8EBC-BBB6-4D10-A461-777291A09030}';
  SID_LaunchTargetMonitor: TGUID = '{8D547FA1-CC45-40C8-B7C1-D48C183F13F3}';
  SID_LaunchSourceViewSizePreference: TGUID = '{80605492-67d9-414f-af89-a1cdf1242bc1}';
  SID_LaunchSourceAppUserModelId: TGUID = '{2ce78010-74db-48bc-9c6a-10f372495723}';
  SID_HandlerInfo: TGUID = '{997706EF-F880-453B-8118-39E1A2D2655A}';
  SID_SHandlerActivationHost: TGUID = '{35094a87-8bb1-4237-96c6-c417eebdb078}';
  SID_AppActivationUIInfo: TGUID = '{abad189d-9fa3-4278-b3ca-8ca448a88dcb}';
  SID_ShellExecuteNamedPropertyStore: TGUID = '{eb84ada2-00ff-4992-8324-ed5ce061cb29}';
  SID_ShellTaskScheduler: TGUID = '{6CCB7BE0-6807-11d0-B810-00C04FD706EC}';
  SID_SFolderView: TGUID = '{cde725b0-ccc9-4519-917e-325d72fab4ce}';
  SID_SExplorerBrowserFrame: TGUID = '{000214F1-0000-0000-C000-000000000046}'; // IID_ICommDlgBrowser

  SID_SProfferService: TGUID = '{cb728b20-f786-11ce-92ad-00aa00a74cd0}';
  SID_SNewWindowManager: TGUID = '{D2BC4C84-3F72-4a52-A604-7BCBF3982CBB}';
  SID_ExecuteCreatingProcess: TGUID = '{c2b937a9-3110-4398-8a56-f34c6342d244}';
  SID_LaunchUIContextProvider: TGUID = '{0d12c4c8-a3d9-4e24-94c1-0e20c5a956c4}';
  SID_SNewMenuClient: TGUID = '{dcb07fdc-3bb5-451c-90be-966644fed7b0}';
  SID_SNavigationPane: TGUID = '{028212A3-B627-47e9-8856-C14265554E4F}';
  SID_ExplorerPaneVisibility: TGUID = '{e07010ec-bc17-44c0-97b0-46c7c95b9edc}';


  // CLSID =======================================================================

  CLSID_DesktopWallpaper: TGUID = '{C2CF3110-460E-4FC1-B9D0-8A1C0C9CC4BD}';
  CLSID_ShellDesktop: TGUID = '{00021400-0000-0000-C000-000000000046}';
  CLSID_ShellFSFolder: TGUID = '{F3364BA0-65B9-11CE-A9BA-00AA004AE837}';
  CLSID_NetworkPlaces: TGUID = '{208D2C60-3AEA-1069-A2D7-08002B30309D}';
  CLSID_ShellLink: TGUID = '{00021401-0000-0000-C000-000000000046}';
  CLSID_DriveSizeCategorizer: TGUID = '{94357B53-CA29-4B78-83AE-E8FE7409134F}';
  CLSID_DriveTypeCategorizer: TGUID = '{B0A8F3CF-4333-4BAB-8873-1CCB1CADA48B}';
  CLSID_FreeSpaceCategorizer: TGUID = '{B5607793-24AC-44C7-82E2-831726AA6CB7}';
  CLSID_SizeCategorizer: TGUID = '{55D7B852-F6D1-42F2-AA75-8728A1B2D264}';
  CLSID_PropertiesUI: TGUID = '{D912F8CF-0396-4915-884E-FB425D32943B}';
  CLSID_UserNotification: TGUID = '{0010890E-8789-413C-ADBC-48F5B511B3AF}';
  CLSID_TaskbarList: TGUID = '{56FDF344-FD6D-11D0-958A-006097C9A090}';
  CLSID_ShellItem: TGUID = '{9AC9FBE1-E0A2-4AD6-B4EE-E212013EA917}';
  CLSID_NamespaceWalker: TGUID = '{72EB61E0-8672-4303-9175-F2E4C68B2E7C}';
  CLSID_FileOperation: TGUID = '{3AD05575-8857-4850-9277-11B85BDB8E09}';
  CLSID_FileOpenDialog: TGUID = '{DC1C5A9C-E88A-4DDE-A5A1-60F82A20AEF7}';
  CLSID_FileSaveDialog: TGUID = '{C0B4E2F3-BA21-4773-8DBA-335EC946EB8B}';
  CLSID_KnownFolderManager: TGUID = '{4DF0C730-DF9D-4AE3-9153-AA6B82E9795A}';
  CLSID_SharingConfigurationManager: TGUID = '{49F371E1-8C5C-4D9C-9A3B-54A6827F513C}';
  CLSID_NetworkConnections: TGUID = '{7007ACC7-3202-11D1-AAD2-00805FC1270E}';
  CLSID_ScheduledTasks: TGUID = '{D6277990-4C6A-11CF-8D87-00AA0060F5BF}';
  CLSID_ApplicationAssociationRegistration: TGUID = '{591209C7-767B-42B2-9FBA-44EE4615F2C7}';
  CLSID_SearchFolderItemFactory: TGUID = '{14010E02-BBBD-41F0-88E3-EDA371216584}';
  CLSID_OpenControlPanel: TGUID = '{06622D85-6856-4460-8DE1-A81921B41C4B}';
  CLSID_MailRecipient: TGUID = '{9E56BE60-C50F-11CF-9A2C-00A0C90A90CE}';
  CLSID_NetworkExplorerFolder: TGUID = '{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}';
  CLSID_DestinationList: TGUID = '{77F10CF0-3DB5-4966-B520-B7C54FD35ED6}';
  CLSID_ApplicationDestinations: TGUID = '{86C14003-4D6B-4EF3-A7B4-0506663B2E68}';
  CLSID_ApplicationDocumentLists: TGUID = '{86BEC222-30F2-47E0-9F25-60D11CD75C28}';
  CLSID_HomeGroup: TGUID = '{DE77BA04-3C92-4D11-A1A5-42352A53E0E3}';
  CLSID_ShellLibrary: TGUID = '{D9B3211D-E57F-4426-AAEF-30A806ADD397}';
  CLSID_AppStartupLink: TGUID = '{273EB5E7-88B0-4843-BFEF-E2C81D43AAE5}';
  CLSID_EnumerableObjectCollection: TGUID = '{2D3468C1-36A7-43B6-AC24-D3F02FD9607A}';
  CLSID_FrameworkInputPane: TGUID = '{D5120AA3-46BA-44C5-822D-CA8092C1FC72}';
  CLSID_DefFolderMenu: TGUID = '{C63382BE-7933-48D0-9AC8-85FB46BE2FDD}';
  CLSID_AppVisibility: TGUID = '{7E5FE3D9-985F-4908-91F9-EE19F9FD1514}';
  CLSID_AppShellVerbHandler: TGUID = '{4ED3A719-CEA8-4BD9-910D-E252F997AFC2}';
  CLSID_ExecuteUnknown: TGUID = '{E44E9428-BDBC-4987-A099-40DC8FD255E7}';
  CLSID_PackageDebugSettings: TGUID = '{B1AEC16F-2383-4852-B0E9-8F0B1DC66B4D}';
  CLSID_SuspensionDependencyManager: TGUID = '{6B273FC5-61FD-4918-95A2-C3B5E9D7F581}';
  CLSID_ApplicationActivationManager: TGUID = '{45BA127D-10A8-46EA-8AB7-56EA9078943C}';
  CLSID_ApplicationDesignModeSettings: TGUID = '{958A6FB5-DCB2-4FAF-AAFD-7FB054AD1A3B}';


  // ENUMS =======================================================================

type
  PKF_CATEGORY = ^KF_CATEGORY;
  KF_CATEGORY = type Integer;

const
  KF_CATEGORY_VIRTUAL = KF_CATEGORY(1);
  KF_CATEGORY_FIXED = KF_CATEGORY(2);
  KF_CATEGORY_COMMON = KF_CATEGORY(3);
  KF_CATEGORY_PERUSER = KF_CATEGORY(4);

type
  PKF_DEFINITION_FLAGS = ^KF_DEFINITION_FLAGS;
  KF_DEFINITION_FLAGS = type DWORD;

const
  KFDF_LOCAL_REDIRECT_ONLY = KF_DEFINITION_FLAGS($2);
  KFDF_ROAMABLE = KF_DEFINITION_FLAGS($4);
  KFDF_PRECREATE = KF_DEFINITION_FLAGS($8);
  KFDF_STREAM = KF_DEFINITION_FLAGS($10);
  KFDF_UBLISHEXPANDEDPATH = KF_DEFINITION_FLAGS($20);
  KFDF_NO_REDIRECT_UI = KF_DEFINITION_FLAGS($40);

type
  PKF_REDIRECT_FLAGS = ^KF_REDIRECT_FLAGS;
  KF_REDIRECT_FLAGS = type DWORD;

const
  KF_REDIRECT_USER_EXCLUSIVE = KF_REDIRECT_FLAGS($1);
  KF_REDIRECT_COPY_SOURCE_DACL = KF_REDIRECT_FLAGS($2);
  KF_REDIRECT_OWNER_USER = KF_REDIRECT_FLAGS($4);
  KF_REDIRECT_SET_OWNER_EXPLICIT = KF_REDIRECT_FLAGS($8);
  KF_REDIRECT_CHECK_ONLY = KF_REDIRECT_FLAGS($10);
  KF_REDIRECT_WITH_UI = KF_REDIRECT_FLAGS($20);
  KF_REDIRECT_UNPIN = KF_REDIRECT_FLAGS($40);
  KF_REDIRECT_PIN = KF_REDIRECT_FLAGS($80);
  KF_REDIRECT_COPY_CONTENTS = KF_REDIRECT_FLAGS($200);
  KF_REDIRECT_DEL_SOURCE_CONTENTS = KF_REDIRECT_FLAGS($400);
  KF_REDIRECT_EXCLUDE_ALL_KNOWN_SUBFOLDERS = KF_REDIRECT_FLAGS($800);

type
  PKF_REDIRECTION_CAPABILITIES = ^KF_REDIRECTION_CAPABILITIES;
  KF_REDIRECTION_CAPABILITIES = type DWORD;

const
  KF_REDIRECTION_CAPABILITIES_ALLOW_ALL = KF_REDIRECTION_CAPABILITIES($ff);
  KF_REDIRECTION_CAPABILITIES_REDIRECTABLE = KF_REDIRECTION_CAPABILITIES($1);
  KF_REDIRECTION_CAPABILITIES_DENY_ALL = KF_REDIRECTION_CAPABILITIES($fff00);
  KF_REDIRECTION_CAPABILITIES_DENY_POLICY_REDIRECTED = KF_REDIRECTION_CAPABILITIES($100);
  KF_REDIRECTION_CAPABILITIES_DENY_POLICY = KF_REDIRECTION_CAPABILITIES($200);
  KF_REDIRECTION_CAPABILITIES_DENY_PERMISSIONS = KF_REDIRECTION_CAPABILITIES($400);

type
  PFFFP_MODE = ^FFFP_MODE;
  FFFP_MODE = type DWORD;

const
  FFFP_EXACTMATCH = FFFP_MODE(0);
  FFFP_NEARESTPARENTMATCH = FFFP_MODE((FFFP_EXACTMATCH + 1));

type
  PSHGDNF = ^SHGDNF;
  _SHGDNF = type DWORD;
  SHGDNF = _SHGDNF;

const
  SHGDN_NORMAL = _SHGDNF(0);
  SHGDN_INFOLDER = _SHGDNF($1);
  SHGDN_FOREDITING = _SHGDNF($1000);
  SHGDN_FORADDRESSBAR = _SHGDNF($4000);
  SHGDN_FORPARSING = _SHGDNF($8000);

type
  PSHCONTF = ^SHCONTF;
  _SHCONTF = DWORD;
  SHCONTF = _SHCONTF;

const
  SHCONTF_CHECKING_FOR_CHILDREN = _SHCONTF($10);
  SHCONTF_FOLDERS = _SHCONTF($20);
  SHCONTF_NONFOLDERS = _SHCONTF($40);
  SHCONTF_INCLUDEHIDDEN = _SHCONTF($80);
  SHCONTF_INIT_ON_FIRST_NEXT = _SHCONTF($100);
  SHCONTF_NETPRINTERSRCH = _SHCONTF($200);
  SHCONTF_SHAREABLE = _SHCONTF($400);
  SHCONTF_STORAGE = _SHCONTF($800);
  SHCONTF_NAVIGATION_ENUM = _SHCONTF($1000);
  SHCONTF_FASTITEMS = _SHCONTF($2000);
  SHCONTF_FLATLIST = _SHCONTF($4000);
  SHCONTF_ENABLE_ASYNC = _SHCONTF($8000);
  SHCONTF_INCLUDESUPERHIDDEN = _SHCONTF($10000);

type
  PSFGAOF = ^SFGAOF;
  SFGAOF = type ULONG;

type
  PSYNC_TRANSFER_STATUS = ^SYNC_TRANSFER_STATUS;
  _SYNC_TRANSFER_STATUS = type Integer;
  SYNC_TRANSFER_STATUS = _SYNC_TRANSFER_STATUS;

const
  STS_NONE = _SYNC_TRANSFER_STATUS(0);
  STS_NEEDSUPLOAD = _SYNC_TRANSFER_STATUS($1);
  STS_NEEDSDOWNLOAD = _SYNC_TRANSFER_STATUS($2);
  STS_TRANSFERRING = _SYNC_TRANSFER_STATUS($4);
  STS_PAUSED = _SYNC_TRANSFER_STATUS($8);
  STS_HASERROR = _SYNC_TRANSFER_STATUS($10);
  STS_FETCHING_METADATA = _SYNC_TRANSFER_STATUS($20);
  STS_USER_REQUESTED_REFRESH = _SYNC_TRANSFER_STATUS($40);
  STS_HASWARNING = _SYNC_TRANSFER_STATUS($80);
  STS_EXCLUDED = _SYNC_TRANSFER_STATUS($100);
  STS_INCOMPLETE = _SYNC_TRANSFER_STATUS($200);
  STS_PLACEHOLDER_IFEMPTY = _SYNC_TRANSFER_STATUS($400);

type
  PSTORAGE_PROVIDER_FILE_FLAGS = ^STORAGE_PROVIDER_FILE_FLAGS;
  _STORAGE_PROVIDER_FILE_FLAGS = type Integer;
  STORAGE_PROVIDER_FILE_FLAGS = _STORAGE_PROVIDER_FILE_FLAGS;

const
  SPFF_NONE = _STORAGE_PROVIDER_FILE_FLAGS(0);
  SPFF_DOWNLOAD_BY_DEFAULT = _STORAGE_PROVIDER_FILE_FLAGS($1);
  SPFF_CREATED_ON_THIS_DEVICE = _STORAGE_PROVIDER_FILE_FLAGS($2);

type
  PPLACEHOLDER_STATES = ^PLACEHOLDER_STATES;
  _PLACEHOLDER_STATES = type Integer;
  PLACEHOLDER_STATES = _PLACEHOLDER_STATES;

const
  PS_NONE = _PLACEHOLDER_STATES(0);
  PS_MARKED_FOR_OFFLINE_AVAILABILITY = _PLACEHOLDER_STATES($1);
  PS_FULL_PRIMARY_STREAM_AVAILABLE = _PLACEHOLDER_STATES($2);
  PS_CREATE_FILE_ACCESSIBLE = _PLACEHOLDER_STATES($4);
  PS_CLOUDFILE_PLACEHOLDER = _PLACEHOLDER_STATES($8);
  PS_DEFAULT = _PLACEHOLDER_STATES(PS_MARKED_FOR_OFFLINE_AVAILABILITY or PS_FULL_PRIMARY_STREAM_AVAILABLE or PS_CREATE_FILE_ACCESSIBLE);
  PS_ALL = _PLACEHOLDER_STATES(PS_MARKED_FOR_OFFLINE_AVAILABILITY or PS_FULL_PRIMARY_STREAM_AVAILABLE or PS_CREATE_FILE_ACCESSIBLE or PS_CLOUDFILE_PLACEHOLDER);

type
  PMERGE_UPDATE_STATUS = ^MERGE_UPDATE_STATUS;
  _MERGE_UPDATE_STATUS = type Integer;
  MERGE_UPDATE_STATUS = _MERGE_UPDATE_STATUS;

const
  MUS_COMPLETE = _MERGE_UPDATE_STATUS(0);
  MUS_USERINPUTNEEDED = _MERGE_UPDATE_STATUS(MUS_COMPLETE + 1);
  MUS_FAILED = _MERGE_UPDATE_STATUS(MUS_USERINPUTNEEDED + 1);

type
  PFOLDER_ENUM_MODE = ^FOLDER_ENUM_MODE;
  _FOLDER_ENUM_MODE = type Integer;
  FOLDER_ENUM_MODE = _FOLDER_ENUM_MODE;

const
  FEM_VIEWRESULT = _FOLDER_ENUM_MODE(0);
  FEM_NAVIGATION = _FOLDER_ENUM_MODE(1);

type
  PFOLDERFLAGS = ^FOLDERFLAGS;
  FOLDERFLAGS = type Integer;

const
  FWF_NONE = FOLDERFLAGS(0);
  FWF_AUTOARRANGE = FOLDERFLAGS($1);
  FWF_ABBREVIATEDNAMES = FOLDERFLAGS($2);
  FWF_SNAPTOGRID = FOLDERFLAGS($4);
  FWF_OWNERDATA = FOLDERFLAGS($8);
  FWF_BESTFITWINDOW = FOLDERFLAGS($10);
  FWF_DESKTOP = FOLDERFLAGS($20);
  FWF_SINGLESEL = FOLDERFLAGS($40);
  FWF_NOSUBFOLDERS = FOLDERFLAGS($80);
  FWF_TRANSPARENT = FOLDERFLAGS($100);
  FWF_NOCLIENTEDGE = FOLDERFLAGS($200);
  FWF_NOSCROLL = FOLDERFLAGS($400);
  FWF_ALIGNLEFT = FOLDERFLAGS($800);
  FWF_NOICONS = FOLDERFLAGS($1000);
  FWF_SHOWSELALWAYS = FOLDERFLAGS($2000);
  FWF_NOVISIBLE = FOLDERFLAGS($4000);
  FWF_SINGLECLICKACTIVATE = FOLDERFLAGS($8000);
  FWF_NOWEBVIEW = FOLDERFLAGS($10000);
  FWF_HIDEFILENAMES = FOLDERFLAGS($20000);
  FWF_CHECKSELECT = FOLDERFLAGS($40000);
  FWF_NOENUMREFRESH = FOLDERFLAGS($80000);
  FWF_NOGROUPING = FOLDERFLAGS($100000);
  FWF_FULLROWSELECT = FOLDERFLAGS($200000);
  FWF_NOFILTERS = FOLDERFLAGS($400000);
  FWF_NOCOLUMNHEADER = FOLDERFLAGS($800000);
  FWF_NOHEADERINALLVIEWS = FOLDERFLAGS($1000000);
  FWF_EXTENDEDTILES = FOLDERFLAGS($2000000);
  FWF_TRICHECKSELECT = FOLDERFLAGS($4000000);
  FWF_AUTOCHECKSELECT = FOLDERFLAGS($8000000);
  FWF_NOBROWSERVIEWSTATE = FOLDERFLAGS($10000000);
  FWF_SUBSETGROUPS = FOLDERFLAGS($20000000);
  FWF_USESEARCHFOLDER = FOLDERFLAGS($40000000);
  FWF_ALLOWRTLREADING = FOLDERFLAGS($80000000);

type
  PFOLDERVIEWMODE = ^FOLDERVIEWMODE;
  FOLDERVIEWMODE = type Integer;

const
  FVM_AUTO = FOLDERVIEWMODE(-1);
  FVM_FIRST = FOLDERVIEWMODE(1);
  FVM_ICON = FOLDERVIEWMODE(1);
  FVM_SMALLICON = FOLDERVIEWMODE(2);
  FVM_LIST = FOLDERVIEWMODE(3);
  FVM_DETAILS = FOLDERVIEWMODE(4);
  FVM_THUMBNAIL = FOLDERVIEWMODE(5);
  FVM_TILE = FOLDERVIEWMODE(6);
  FVM_THUMBSTRIP = FOLDERVIEWMODE(7);
  FVM_CONTENT = FOLDERVIEWMODE(8);
  FVM_LAST = FOLDERVIEWMODE(8);

type
  PFOLDERLOGICALVIEWMODE = ^FOLDERLOGICALVIEWMODE;
  FOLDERLOGICALVIEWMODE = type Integer;

const
  FLVM_UNSPECIFIED = FOLDERLOGICALVIEWMODE(-1);
  FLVM_FIRST = FOLDERLOGICALVIEWMODE(1);
  FLVM_DETAILS = FOLDERLOGICALVIEWMODE(1);
  FLVM_TILES = FOLDERLOGICALVIEWMODE(2);
  FLVM_ICONS = FOLDERLOGICALVIEWMODE(3);
  FLVM_LIST = FOLDERLOGICALVIEWMODE(4);
  FLVM_CONTENT = FOLDERLOGICALVIEWMODE(5);
  FLVM_LAST = FOLDERLOGICALVIEWMODE(5);

type
  SHELLVIEWID = type TGUID;

const
  SV2GV_CURRENTVIEW = UINT(-1);
  SV2GV_DEFAULTVIEW = UINT(-2);

type
  PSVSIF = ^SVSIF;
  _SVSIF = type UINT;
  SVSIF = _SVSIF;

const
  SVSI_DESELECT = _SVSIF(0);
  SVSI_SELECT = _SVSIF($1);
  SVSI_EDIT = _SVSIF($3);
  SVSI_DESELECTOTHERS = _SVSIF($4);
  SVSI_ENSUREVISIBLE = _SVSIF($8);
  SVSI_FOCUSED = _SVSIF($10);
  SVSI_TRANSLATEPT = _SVSIF($20);
  SVSI_SELECTIONMARK = _SVSIF($40);
  SVSI_POSITIONITEM = _SVSIF($80);
  SVSI_CHECK = _SVSIF($100);
  SVSI_CHECK2 = _SVSIF($200);
  SVSI_KEYBOARDSELECT = _SVSIF($401);
  SVSI_NOTAKEFOCUS = _SVSIF($40000000);
  SVSI_NOSTATECHANGE = _SVSIF($80000000);

type
  PSVGIO = ^SVGIO;
  _SVGIO = type Integer;
  SVGIO = _SVGIO;

const
  SVGIO_BACKGROUND = _SVGIO(0);
  SVGIO_SELECTION = _SVGIO($1);
  SVGIO_ALLVIEW = _SVGIO($2);
  SVGIO_CHECKED = _SVGIO($3);
  SVGIO_TYPE_MASK = _SVGIO($F);
  SVGIO_FLAG_VIEWORDER = _SVGIO($80000000);

type
  PSVUIA_STATUS = ^SVUIA_STATUS;
  SVUIA_STATUS = type Integer;

const
  SVUIA_DEACTIVATE = SVUIA_STATUS(0);
  SVUIA_ACTIVATE_NOFOCUS = SVUIA_STATUS(1);
  SVUIA_ACTIVATE_FOCUS = SVUIA_STATUS(2);
  SVUIA_INPLACEACTIVATE = SVUIA_STATUS(3);

  //  this is so that all the implementations still get the function pointer.
  //  and midl wont complain about the data type
type
  LPFNSVADDPROPSHEETPAGE = function(hPage: HPROPSHEETPAGE;
                                    lParam: LPARAM): BOOL; stdcall;

type
  SORTDIRECTION = type Integer;

const
  SORT_DESCENDING = SORTDIRECTION(-1);
  SORT_ASCENDING = SORTDIRECTION(1);

type
  PFVTEXTTYPE = ^FVTEXTTYPE;
  FVTEXTTYPE = type Integer;

const
  FVST_EMPTYTEXT = FVTEXTTYPE(0);

type
  PCM_MASK = ^CM_MASK;
  CM_MASK = type Integer;

const
  CM_MASK_WIDTH = CM_MASK($1);
  CM_MASK_DEFAULTWIDTH = CM_MASK($2);
  CM_MASK_IDEALWIDTH = CM_MASK($4);
  CM_MASK_NAME = CM_MASK($8);
  CM_MASK_STATE = CM_MASK($10);

type
  PCM_STATE = ^CM_STATE;
  CM_STATE = type Integer;

const
  CM_STATE_NONE = CM_STATE(0);
  CM_STATE_VISIBLE = CM_STATE($1);
  CM_STATE_FIXEDWIDTH = CM_STATE($2);
  CM_STATE_NOSORTBYFOLDERNESS = CM_STATE($4);
  CM_STATE_ALWAYSVISIBLE = CM_STATE($8);

type
  PCM_ENUM_FLAGS = ^CM_ENUM_FLAGS;
  CM_ENUM_FLAGS = type Integer;

const
  CM_ENUM_ALL = CM_ENUM_FLAGS($1);
  CM_ENUM_VISIBLE = CM_ENUM_FLAGS($2);

type
  PCM_SET_WIDTH_VALUE = ^CM_SET_WIDTH_VALUE;
  CM_SET_WIDTH_VALUE = type Integer;

const
  CM_WIDTH_USEDEFAULT = CM_SET_WIDTH_VALUE(-1);
  CM_WIDTH_AUTOSIZE = CM_SET_WIDTH_VALUE(-2);

type
  PSIGDN = ^SIGDN;
  SIGDN = type Integer;

const
  SIGDN_NORMALDISPLAY = SIGDN(0);
  SIGDN_PARENTRELATIVEPARSING = SIGDN($80018001);
  SIGDN_DESKTOPABSOLUTEPARSING = SIGDN($80028000);
  SIGDN_PARENTRELATIVEEDITING = SIGDN($80031001);
  SIGDN_DESKTOPABSOLUTEEDITING = SIGDN($8004C000);
  SIGDN_FILESYSPATH = SIGDN($80058000);
  SIGDN_URL = SIGDN($80068000);
  SIGDN_PARENTRELATIVEFORADDRESSBAR = SIGDN($8007C001);
  SIGDN_PARENTRELATIVE = SIGDN($80080001);
  SIGDN_PARENTRELATIVEFORUI = SIGDN($80094001);

type
  PSICHINTF = ^SICHINTF;
  _SICHINTF = type DWORD;
  SICHINTF = _SICHINTF;

const
  SICHINT_DISPLAY = _SICHINTF(0);
  SICHINT_ALLFIELDS = _SICHINTF($80000000);
  SICHINT_CANONICAL = _SICHINTF($10000000);
  SICHINT_TEST_FILESYSPATH_IF_NOT_EQUAL = _SICHINTF($20000000);

type
  PDATAOBJ_GET_ITEM_FLAGS = ^DATAOBJ_GET_ITEM_FLAGS;
  DATAOBJ_GET_ITEM_FLAGS = type Integer;

const
  DOGIF_DEFAULT = DATAOBJ_GET_ITEM_FLAGS(0);
  DOGIF_TRAVERSE_LINK = DATAOBJ_GET_ITEM_FLAGS($1);
  DOGIF_NO_HDROP = DATAOBJ_GET_ITEM_FLAGS($2);
  DOGIF_NO_URL = DATAOBJ_GET_ITEM_FLAGS($4);
  DOGIF_ONLY_IF_ONE = DATAOBJ_GET_ITEM_FLAGS($8);

type
  PSIIGBF = ^SIIGBF;
  _SIIGBF = type Integer;
  SIIGBF = _SIIGBF;

const
  SIIGBF_RESIZETOFIT = _SIIGBF(0);
  SIIGBF_BIGGERSIZEOK = _SIIGBF($1);
  SIIGBF_MEMORYONLY = _SIIGBF($2);
  SIIGBF_ICONONLY = _SIIGBF($4);
  SIIGBF_THUMBNAILONLY = _SIIGBF($8);
  SIIGBF_INCACHEONLY = _SIIGBF($10);
  SIIGBF_CROPTOSQUARE = _SIIGBF($20);
  SIIGBF_WIDETHUMBNAILS = _SIIGBF($40);
  SIIGBF_ICONBACKGROUND = _SIIGBF($80);
  SIIGBF_SCALEUP = _SIIGBF($100);

type
  PSTGOP = ^STGOP;
  STGOP = type Integer;

const
  STGOP_MOVE = STGOP(1);
  STGOP_COPY = STGOP(2);
  STGOP_SYNC = STGOP(3);
  STGOP_REMOVE = STGOP(5);
  STGOP_RENAME = STGOP(6);
  STGOP_APPLYPROPERTIES = STGOP(8);
  STGOP_NEW = STGOP(10);

type
  PTRANSFER_SOURCE_FLAGS = ^TRANSFER_SOURCE_FLAGS;
  _TRANSFER_SOURCE_FLAGS = type DWORD;
  TRANSFER_SOURCE_FLAGS = _TRANSFER_SOURCE_FLAGS;

const
  TSF_NORMAL = _TRANSFER_SOURCE_FLAGS(0);
  TSF_FAIL_EXIST = _TRANSFER_SOURCE_FLAGS(0);
  TSF_RENAME_EXIST = _TRANSFER_SOURCE_FLAGS($1);
  TSF_OVERWRITE_EXIST = _TRANSFER_SOURCE_FLAGS($2);
  TSF_ALLOW_DECRYPTION = _TRANSFER_SOURCE_FLAGS($4);
  TSF_NO_SECURITY = _TRANSFER_SOURCE_FLAGS($8);
  TSF_COPY_CREATION_TIME = _TRANSFER_SOURCE_FLAGS($10);
  TSF_COPY_WRITE_TIME = _TRANSFER_SOURCE_FLAGS($20);
  TSF_USE_FULL_ACCESS = _TRANSFER_SOURCE_FLAGS($40);
  TSF_DELETE_RECYCLE_IF_POSSIBLE = _TRANSFER_SOURCE_FLAGS($80);
  TSF_COPY_HARD_LINK = _TRANSFER_SOURCE_FLAGS($100);
  TSF_COPY_LOCALIZED_NAME = _TRANSFER_SOURCE_FLAGS($200);
  TSF_MOVE_AS_COPY_DELETE = _TRANSFER_SOURCE_FLAGS($400);
  TSF_SUSPEND_SHELLEVENTS = _TRANSFER_SOURCE_FLAGS($800);

type
  PTRANSFER_ADVISE_STATE = ^TRANSFER_ADVISE_STATE;
  _TRANSFER_ADVISE_STATE = type DWORD;
  TRANSFER_ADVISE_STATE = _TRANSFER_ADVISE_STATE;

const
  TS_NONE = _TRANSFER_ADVISE_STATE(0);
  TS_PERFORMING = _TRANSFER_ADVISE_STATE($1);
  TS_PREPARING = _TRANSFER_ADVISE_STATE($2);
  TS_INDETERMINATE = _TRANSFER_ADVISE_STATE($4);

type
  PSIATTRIBFLAGS = ^SIATTRIBFLAGS;
  SIATTRIBFLAGS = type Integer;

const
  SIATTRIBFLAGS_AND = SIATTRIBFLAGS($1);
  SIATTRIBFLAGS_OR = SIATTRIBFLAGS($2);
  SIATTRIBFLAGS_APPCOMPAT = SIATTRIBFLAGS($3);
  SIATTRIBFLAGS_MASK = SIATTRIBFLAGS($3);
  SIATTRIBFLAGS_ALLITEMS = SIATTRIBFLAGS($4000);

type
  PPROPERTYUI_NAME_FLAGS = ^PROPERTYUI_NAME_FLAGS;
  _PROPERTYUI_NAME_FLAGS = type DWORD;
  PROPERTYUI_NAME_FLAGS = _PROPERTYUI_NAME_FLAGS;

const
  PUIFNF_DEFAULT = _PROPERTYUI_NAME_FLAGS(0);
  PUIFNF_MNEMONIC = _PROPERTYUI_NAME_FLAGS($1);

type
  PPROPERTYUI_FLAGS = ^PROPERTYUI_FLAGS;
  _PROPERTYUI_FLAGS = type DWORD;
  PROPERTYUI_FLAGS = _PROPERTYUI_FLAGS;

const
  PUIF_DEFAULT = _PROPERTYUI_FLAGS(0);
  PUIF_RIGHTALIGN = _PROPERTYUI_FLAGS($1);
  PUIF_NOLABELININFOTIP = _PROPERTYUI_FLAGS($2);

type
  PPROPERTYUI_FORMAT_FLAGS = ^PROPERTYUI_FORMAT_FLAGS;
  _PROPERTYUI_FORMAT_FLAGS = type DWORD;
  PROPERTYUI_FORMAT_FLAGS = _PROPERTYUI_FORMAT_FLAGS;

const
  PUIFFDF_DEFAULT = _PROPERTYUI_FORMAT_FLAGS(0);
  PUIFFDF_RIGHTTOLEFT = _PROPERTYUI_FORMAT_FLAGS($1);
  PUIFFDF_SHORTFORMAT = _PROPERTYUI_FORMAT_FLAGS($2);
  PUIFFDF_NOTIME = _PROPERTYUI_FORMAT_FLAGS($4);
  PUIFFDF_FRIENDLYDATE = _PROPERTYUI_FORMAT_FLAGS($8);

type
  PCATEGORYINFO_FLAGS = ^CATEGORYINFO_FLAGS;
  CATEGORYINFO_FLAGS = type Integer;

const
  CATINFO_NORMAL = CATEGORYINFO_FLAGS(0);
  CATINFO_COLLAPSED = CATEGORYINFO_FLAGS($1);
  CATINFO_HIDDEN = CATEGORYINFO_FLAGS($2);
  CATINFO_EXPANDED = CATEGORYINFO_FLAGS($4);
  CATINFO_NOHEADER = CATEGORYINFO_FLAGS($8);
  CATINFO_NOTCOLLAPSIBLE = CATEGORYINFO_FLAGS($10);
  CATINFO_NOHEADERCOUNT = CATEGORYINFO_FLAGS($20);
  CATINFO_SUBSETTED = CATEGORYINFO_FLAGS($40);
  CATINFO_SEPARATE_IMAGES = CATEGORYINFO_FLAGS($80);
  CATINFO_SHOWEMPTY = CATEGORYINFO_FLAGS($100);

type
  PCATSORT_FLAGS = ^CATSORT_FLAGS;
  CATSORT_FLAGS = type Integer;

const
  CATSORT_DEFAULT = CATSORT_FLAGS(0);
  CATSORT_NAME = CATSORT_FLAGS($1);

type
  PSLR_FLAGS = ^SLR_FLAGS;
  SLR_FLAGS = type Integer;

const
  SLR_NONE = SLR_FLAGS(0);
  SLR_NO_UI = SLR_FLAGS($1);
  SLR_ANY_MATCH = SLR_FLAGS($2);
  SLR_UPDATE = SLR_FLAGS($4);
  SLR_NOUPDATE = SLR_FLAGS($8);
  SLR_NOSEARCH = SLR_FLAGS($10);
  SLR_NOTRACK = SLR_FLAGS($20);
  SLR_NOLINKINFO = SLR_FLAGS($40);
  SLR_INVOKE_MSI = SLR_FLAGS($80);
  SLR_NO_UI_WITH_MSG_PUMP = SLR_FLAGS($101);
  SLR_OFFER_DELETE_WITHOUT_FILE = SLR_FLAGS($200);
  SLR_KNOWNFOLDER = SLR_FLAGS($400);
  SLR_MACHINE_IN_LOCAL_TARGET = SLR_FLAGS($800);
  SLR_UPDATE_MACHINE_AND_SID = SLR_FLAGS($1000);
  SLR_NO_OBJECT_ID = SLR_FLAGS($2000);

type
  PSLGP_FLAGS = ^SLGP_FLAGS;
  SLGP_FLAGS = type Integer;

const
  SLGP_SHORTPATH = SLGP_FLAGS($1);
  SLGP_UNCPRIORITY = SLGP_FLAGS($2);
  SLGP_RAWPATH = SLGP_FLAGS($4);
  SLGP_RELATIVEPRIORITY = SLGP_FLAGS($8);

type
  PSPINITF = ^SPINITF;
  _SPINITF = type DWORD;
  SPINITF = _SPINITF;

const
  SPINITF_NORMAL = _SPINITF(0);
  SPINITF_MODAL = _SPINITF($1);
  SPINITF_NOMINIMIZE = _SPINITF($8);

type
  PSPBEGINF = ^SPBEGINF;
  _SPBEGINF = type DWORD;
  SPBEGINF = _SPBEGINF;

const
  SPBEGINF_NORMAL = _SPBEGINF(0);
  SPBEGINF_AUTOTIME = _SPBEGINF($2);
  SPBEGINF_NOPROGRESSBAR = _SPBEGINF($10);
  SPBEGINF_MARQUEEPROGRESS = _SPBEGINF($20);
  SPBEGINF_NOCANCELBUTTON = _SPBEGINF($40);

type
  PSPACTION = ^SPACTION;
  _SPACTION = type Integer;
  SPACTION = _SPACTION;

const
  SPACTION_NONE = SPACTION(0);
  SPACTION_MOVING = SPACTION(SPACTION_NONE + 1);
  SPACTION_COPYING = SPACTION(SPACTION_MOVING + 1);
  SPACTION_RECYCLING = SPACTION(SPACTION_COPYING + 1);
  SPACTION_APPLYINGATTRIBS = SPACTION(SPACTION_RECYCLING + 1);
  SPACTION_DOWNLOADING = SPACTION(SPACTION_APPLYINGATTRIBS + 1);
  SPACTION_SEARCHING_INTERNET = SPACTION(SPACTION_DOWNLOADING + 1);
  SPACTION_CALCULATING = SPACTION(SPACTION_SEARCHING_INTERNET + 1);
  SPACTION_UPLOADING = SPACTION(SPACTION_CALCULATING + 1);
  SPACTION_SEARCHING_FILES = SPACTION(SPACTION_UPLOADING + 1);
  SPACTION_DELETING = SPACTION(SPACTION_SEARCHING_FILES + 1);
  SPACTION_RENAMING = SPACTION(SPACTION_DELETING + 1);
  SPACTION_FORMATTING = SPACTION(SPACTION_RENAMING + 1);
  SPACTION_COPY_MOVING = SPACTION(SPACTION_FORMATTING + 1);

type
  PSPTEXT = ^SPTEXT;
  SPTEXT = type Integer;

const
  SPTEXT_ACTIONDESCRIPTION = SPTEXT(1);
  SPTEXT_ACTIONDETAIL = SPTEXT(SPTEXT_ACTIONDESCRIPTION + 1);

type
  PEXPPS = ^EXPPS;
  EXPPS = UINT;

const
  EXPPS_FILETYPES = EXPPS($1);

type
  PTBPFLAG = ^TBPFLAG;
  TBPFLAG = type DWORD;

const
  TBPF_NOPROGRESS = TBPFLAG(0);
  TBPF_INDETERMINATE = TBPFLAG($1);
  TBPF_NORMAL = TBPFLAG($2);
  TBPF_ERROR = TBPFLAG($4);
  TBPF_PAUSED = TBPFLAG($8);

type
  POPPROGDLGF = ^OPPROGDLGF;
  _OPPROGDLGF = type DWORD;
  OPPROGDLGF = _OPPROGDLGF;

const
  OPPROGDLG_DEFAULT = _OPPROGDLGF(0);
  OPPROGDLG_ENABLEPAUSE = _OPPROGDLGF($80);
  OPPROGDLG_ALLOWUNDO = _OPPROGDLGF($100);
  OPPROGDLG_DONTDISPLAYSOURCEPATH = _OPPROGDLGF($200);
  OPPROGDLG_DONTDISPLAYDESTPATH = _OPPROGDLGF($400);
  OPPROGDLG_NOMULTIDAYESTIMATES = _OPPROGDLGF($800);
  OPPROGDLG_DONTDISPLAYLOCATIONS = _OPPROGDLGF($1000);

type
  PPDMODE = ^PDMODE;
  _PDMODE = type DWORD;
  PDMODE = _PDMODE;

const
  PDM_DEFAULT = _PDMODE(0);
  PDM_RUN = _PDMODE($1);
  PDM_PREFLIGHT = _PDMODE($2);
  PDM_UNDOING = _PDMODE($4);
  PDM_ERRORSBLOCKING = _PDMODE($8);
  PDM_INDETERMINATE = _PDMODE($10);

type
  PPDOPSTATUS = ^PDOPSTATUS;
  PDOPSTATUS = type Integer;

const
  PDOPS_RUNNING = PDOPSTATUS(1);
  PDOPS_PAUSED = PDOPSTATUS(2);
  PDOPS_CANCELLED = PDOPSTATUS(3);
  PDOPS_STOPPED = PDOPSTATUS(4);
  PDOPS_ERRORS = PDOPSTATUS(5);

type
  PFILE_OPERATION_FLAGS2 = ^FILE_OPERATION_FLAGS2;
  FILE_OPERATION_FLAGS2 = type Integer;

const
  FOF2_NONE = FILE_OPERATION_FLAGS2(0);
  FOF2_MERGEFOLDERSONCOLLISION = FILE_OPERATION_FLAGS2($1);

type
  PNAMESPACEWALKFLAG = ^NAMESPACEWALKFLAG;
  NAMESPACEWALKFLAG = type Integer;
  NSWF = NAMESPACEWALKFLAG;

const
  NSWF_DEFAULT = NAMESPACEWALKFLAG(0);
  NSWF_NONE_IMPLIES_ALL = NAMESPACEWALKFLAG($1);
  NSWF_ONE_IMPLIES_ALL = NAMESPACEWALKFLAG($2);
  NSWF_DONT_TRAVERSE_LINKS = NAMESPACEWALKFLAG($4);
  NSWF_DONT_ACCUMULATE_RESULT = NAMESPACEWALKFLAG($8);
  NSWF_TRAVERSE_STREAM_JUNCTIONS = NAMESPACEWALKFLAG($10);
  NSWF_FILESYSTEM_ONLY = NAMESPACEWALKFLAG($20);
  NSWF_SHOW_PROGRESS = NAMESPACEWALKFLAG($40);
  NSWF_FLAG_VIEWORDER = NAMESPACEWALKFLAG($80);
  NSWF_IGNORE_AUTOPLAY_HIDA = NAMESPACEWALKFLAG($100);
  NSWF_ASYNC = NAMESPACEWALKFLAG($200);
  NSWF_DONT_RESOLVE_LINKS = NAMESPACEWALKFLAG($400);
  NSWF_ACCUMULATE_FOLDERS = NAMESPACEWALKFLAG($800);
  NSWF_DONT_SORT = NAMESPACEWALKFLAG($1000);
  NSWF_USE_TRANSFER_MEDIUM = NAMESPACEWALKFLAG($2000);
  NSWF_DONT_TRAVERSE_STREAM_JUNCTIONS = NAMESPACEWALKFLAG($4000);
  NSWF_ANY_IMPLIES_ALL = NAMESPACEWALKFLAG($8000);

type
  PBANDSITECID = ^tagBANDSITECID;
  tagBANDSITECID = type DWORD;
  BANDSITECID = tagBANDSITECID;

const
  BSID_BANDADDED = tagBANDSITECID(0);
  BSID_BANDREMOVED = tagBANDSITECID((BSID_BANDADDED + 1));

type
  PFILE_USAGE_TYPE = ^FILE_USAGE_TYPE;
  FILE_USAGE_TYPE = type Integer;

const
  FUT_PLAYING = FILE_USAGE_TYPE(0);
  FUT_EDITING = FILE_USAGE_TYPE(FUT_PLAYING + 1);
  FUT_GENERIC = FILE_USAGE_TYPE(FUT_EDITING + 1);

type
  PFILEOPENDIALOGOPTIONS = ^_FILEOPENDIALOGOPTIONS;
  _FILEOPENDIALOGOPTIONS = type DWORD;
  FILEOPENDIALOGOPTIONS = _FILEOPENDIALOGOPTIONS;

const
  FOS_OVERWRITEPROMPT = _FILEOPENDIALOGOPTIONS($00000002); // (on by default in the save dialog)
  FOS_STRICTFILETYPES = _FILEOPENDIALOGOPTIONS($00000004); // In the save dialog, only allow the user to choose a file that has
  // one of the file extensions provided in SetFileTypes.
  FOS_NOCHANGEDIR = _FILEOPENDIALOGOPTIONS($00000008); // Don't change the current working directory
  FOS_PICKFOLDERS = _FILEOPENDIALOGOPTIONS($00000020); // Invoke the open dialog in folder picking mode.
  FOS_FORCEFILESYSTEM = _FILEOPENDIALOGOPTIONS($00000040); // Ensure that items returned are filesystem items.
  FOS_ALLNONSTORAGEITEMS = _FILEOPENDIALOGOPTIONS($00000080); // Allow choosing items that have no storage.
  FOS_NOVALIDATE = _FILEOPENDIALOGOPTIONS($00000100);
  FOS_ALLOWMULTISELECT = _FILEOPENDIALOGOPTIONS($00000200);
  FOS_PATHMUSTEXIST = _FILEOPENDIALOGOPTIONS($00000800); // (on by default)
  FOS_FILEMUSTEXIST = _FILEOPENDIALOGOPTIONS($00001000); // (on by default in the open dialog and folder picker)
  FOS_CREATEPROMPT = _FILEOPENDIALOGOPTIONS($00002000);
  FOS_SHAREAWARE = _FILEOPENDIALOGOPTIONS($00004000);
  FOS_NOREADONLYRETURN = _FILEOPENDIALOGOPTIONS($00008000); // (on by default in the save dialog)
  FOS_NOTESTFILECREATE = _FILEOPENDIALOGOPTIONS($00010000); // Avoid testing the creation of the chosen file in the save dialog
  // (specifying this flag will circumvent some useful error handling, such as access denied)
  FOS_HIDEMRUPLACES = _FILEOPENDIALOGOPTIONS($00020000); // (not used in Win7)
  FOS_HIDEPINNEDPLACES = _FILEOPENDIALOGOPTIONS($00040000); // Don't display the standard namespace locations in the navigation pane.
  // (generally used along with AddPlace)
  FOS_NODEREFERENCELINKS = _FILEOPENDIALOGOPTIONS($00100000); // Don't treat shortcuts as their target files.
  FOS_OKBUTTONNEEDSINTERACTION = _FILEOPENDIALOGOPTIONS($00200000); // Only enable the OK button if the user has done something in the view.
  FOS_DONTADDTORECENT = _FILEOPENDIALOGOPTIONS($02000000); // Don't add the chosen file to the recent documents list (SHAddToRecentDocs)
  FOS_FORCESHOWHIDDEN = _FILEOPENDIALOGOPTIONS($10000000); // Show all files including system and hidden files.
  FOS_DEFAULTNOMINIMODE = _FILEOPENDIALOGOPTIONS($20000000); // (not used in Win7)
  FOS_FORCEPREVIEWPANEON = _FILEOPENDIALOGOPTIONS($40000000);
  FOS_SUPPORTSTREAMABLEITEMS = _FILEOPENDIALOGOPTIONS($80000000); // Indicates the caller will use BHID_Stream to open contents, no need to download the file

type
  PASSOCIATIONLEVEL = ^ASSOCIATIONLEVEL;
  ASSOCIATIONLEVEL = type DWORD;

const
  AL_MACHINE = ASSOCIATIONLEVEL(0);
  AL_EFFECTIVE = ASSOCIATIONLEVEL(1);
  AL_USER = ASSOCIATIONLEVEL(2);

type
  PASSOCIATIONTYPE = ^ASSOCIATIONTYPE;
  ASSOCIATIONTYPE = type DWORD;

const
  AT_FILEEXTENSION = ASSOCIATIONTYPE(0);
  AT_URLPROTOCOL = ASSOCIATIONTYPE(1);
  AT_STARTMENUCLIENT = ASSOCIATIONTYPE(2);
  AT_MIMETYPE = ASSOCIATIONTYPE(3);

type
  PCDCONTROLSTATEF = ^CDCONTROLSTATEF;
  CDCONTROLSTATEF = type DWORD;

const
  CDCS_INACTIVE = CDCONTROLSTATEF($00000000);
  CDCS_ENABLED = CDCONTROLSTATEF($00000001);
  CDCS_VISIBLE = CDCONTROLSTATEF($00000002);
  CDCS_ENABLEDVISIBLE = CDCONTROLSTATEF($00000003);

type
  PBROWSERFRAMEOPTIONS = ^BROWSERFRAMEOPTIONS;
  _BROWSERFRAMEOPTIONS = type DWORD;
  BROWSERFRAMEOPTIONS = _BROWSERFRAMEOPTIONS;

const
  BFO_NONE = _BROWSERFRAMEOPTIONS(0);
  BFO_BROWSER_PERSIST_SETTINGS = _BROWSERFRAMEOPTIONS($1);
  BFO_RENAME_FOLDER_OPTIONS_TOINTERNET = _BROWSERFRAMEOPTIONS($2);
  BFO_BOTH_OPTIONS = _BROWSERFRAMEOPTIONS($4);
  BIF_PREFER_INTERNET_SHORTCUT = _BROWSERFRAMEOPTIONS($8);
  BFO_BROWSE_NO_IN_NEW_PROCESS = _BROWSERFRAMEOPTIONS($10);
  BFO_ENABLE_HYPERLINK_TRACKING = _BROWSERFRAMEOPTIONS($20);
  BFO_USE_IE_OFFLINE_SUPPORT = _BROWSERFRAMEOPTIONS($40);
  BFO_SUBSTITUE_INTERNET_START_PAGE = _BROWSERFRAMEOPTIONS($80);
  BFO_USE_IE_LOGOBANDING = _BROWSERFRAMEOPTIONS($100);
  BFO_ADD_IE_TOCAPTIONBAR = _BROWSERFRAMEOPTIONS($200);
  BFO_USE_DIALUP_REF = _BROWSERFRAMEOPTIONS($400);
  BFO_USE_IE_TOOLBAR = _BROWSERFRAMEOPTIONS($800);
  BFO_NO_PARENT_FOLDER_SUPPORT = _BROWSERFRAMEOPTIONS($1000);
  BFO_NO_REOPEN_NEXT_RESTART = _BROWSERFRAMEOPTIONS($2000);
  BFO_GO_HOME_PAGE = _BROWSERFRAMEOPTIONS($4000);
  BFO_PREFER_IEPROCESS = _BROWSERFRAMEOPTIONS($8000);
  BFO_SHOW_NAVIGATION_CANCELLED = _BROWSERFRAMEOPTIONS($10000);
  BFO_USE_IE_STATUSBAR = _BROWSERFRAMEOPTIONS($20000);
  BFO_QUERY_ALL = _BROWSERFRAMEOPTIONS($FFFFFFFF);

type
  PMENUPOPUPSELECT = ^tagMENUPOPUPSELECT;
  tagMENUPOPUPSELECT = type DWORD;
  MENUPOPUPSELECT = tagMENUPOPUPSELECT;

const
  MPOS_EXECUTE = tagMENUPOPUPSELECT(0);
  MPOS_FULLCANCEL = tagMENUPOPUPSELECT((MPOS_EXECUTE + 1));
  MPOS_CANCELLEVEL = tagMENUPOPUPSELECT((MPOS_FULLCANCEL + 1));
  MPOS_SELECTLEFT = tagMENUPOPUPSELECT((MPOS_CANCELLEVEL + 1));
  MPOS_SELECTRIGHT = tagMENUPOPUPSELECT((MPOS_SELECTLEFT + 1));
  MPOS_CHILDTRACKING = tagMENUPOPUPSELECT((MPOS_SELECTRIGHT + 1));

type
  PMP_POPUPFLAGS = ^MP_POPUPFLAGS;
  MP_POPUPFLAGS = type Integer;

const
  MPPF_SETFOCUS = MP_POPUPFLAGS($1);
  MPPF_INITIALSELECT = MP_POPUPFLAGS($2);
  MPPF_NOANIMATE = MP_POPUPFLAGS($4);
  MPPF_KEYBOARD = MP_POPUPFLAGS($10);
  MPPF_REPOSITION = MP_POPUPFLAGS($20);
  MPPF_FORCEZORDER = MP_POPUPFLAGS($40);
  MPPF_FINALSELECT = MP_POPUPFLAGS($80);
  MPPF_TOP = MP_POPUPFLAGS($20000000);
  MPPF_LEFT = MP_POPUPFLAGS($40000000);
  MPPF_RIGHT = MP_POPUPFLAGS($60000000);
  MPPF_BOTTOM = MP_POPUPFLAGS($80000000);
  MPPF_POS_MASK = MP_POPUPFLAGS($e0000000);
  MPPF_ALIGN_LEFT = MP_POPUPFLAGS($2000000);
  MPPF_ALIGN_RIGHT = MP_POPUPFLAGS($4000000);


type
  PNWMF = ^NWMF;
  NWMF = type Integer;

const
  NWMF_UNLOADING = NWMF($1);
  NWMF_USERINITED = NWMF($2);
  NWMF_FIRST = NWMF($4);
  NWMF_OVERRIDEKEY = NWMF($8);
  NWMF_SHOWHELP = NWMF($10);
  NWMF_HTMLDIALOG = NWMF($20);
  NWMF_FROMDIALOGCHILD = NWMF($40);
  NWMF_USERREQUESTED = NWMF($80);
  NWMF_USERALLOWED = NWMF($100);
  NWMF_FORCEWINDOW = NWMF($10000);
  NWMF_FORCETAB = NWMF($20000);
  NWMF_SUGGESTWINDOW = NWMF($40000);
  NWMF_SUGGESTTAB = NWMF($80000);
  NWMF_INACTIVETAB = NWMF($100000);

type
  PATTACHMENT_PROMPT = ^ATTACHMENT_PROMPT;
  ATTACHMENT_PROMPT = type Integer;

const
  ATTACHMENT_PROMPT_NONE = ATTACHMENT_PROMPT($0000);
  ATTACHMENT_PROMPT_SAVE = ATTACHMENT_PROMPT($0001);
  ATTACHMENT_PROMPT_EXEC = ATTACHMENT_PROMPT($0002);
  ATTACHMENT_PROMPT_EXEC_OR_SAVE = ATTACHMENT_PROMPT($0003);

type
  PATTACHMENT_ACTION = ^ATTACHMENT_ACTION;
  ATTACHMENT_ACTION = type Integer;

const
  ATTACHMENT_ACTION_CANCEL = ATTACHMENT_ACTION($0000);
  ATTACHMENT_ACTION_SAVE = ATTACHMENT_ACTION($0001);
  ATTACHMENT_ACTION_EXEC = ATTACHMENT_ACTION($0002);

type
  PNSTCSTYLE = ^NSTCSTYLE;
  _NSTCSTYLE = type DWORD;
  NSTCSTYLE = _NSTCSTYLE;

const
  NSTCS_HASEXPANDOS = _NSTCSTYLE($1);
  NSTCS_HASLINES = _NSTCSTYLE($2);
  NSTCS_SINGLECLICKEXPAND = _NSTCSTYLE($4);
  NSTCS_FULLROWSELECT = _NSTCSTYLE($8);
  NSTCS_SPRINGEXPAND = _NSTCSTYLE($10);
  NSTCS_HORIZONTALSCROLL = _NSTCSTYLE($20);
  NSTCS_ROOTHASEXPANDO = _NSTCSTYLE($40);
  NSTCS_SHOWSELECTIONALWAYS = _NSTCSTYLE($80);
  NSTCS_NOINFOTIP = _NSTCSTYLE($200);
  NSTCS_EVENHEIGHT = _NSTCSTYLE($400);
  NSTCS_NOREPLACEOPEN = _NSTCSTYLE($800);
  NSTCS_DISABLEDRAGDROP = _NSTCSTYLE($1000);
  NSTCS_NOORDERSTREAM = _NSTCSTYLE($2000);
  NSTCS_RICHTOOLTIP = _NSTCSTYLE($4000);
  NSTCS_BORDER = _NSTCSTYLE($8000);
  NSTCS_NOEDITLABELS = _NSTCSTYLE($10000);
  NSTCS_TABSTOP = _NSTCSTYLE($20000);
  NSTCS_FAVORITESMODE = _NSTCSTYLE($80000);
  NSTCS_AUTOHSCROLL = _NSTCSTYLE($100000);
  NSTCS_FADEINOUTEXPANDOS = _NSTCSTYLE($200000);
  NSTCS_EMPTYTEXT = _NSTCSTYLE($400000);
  NSTCS_CHECKBOXES = _NSTCSTYLE($800000);
  NSTCS_PARTIALCHECKBOXES = _NSTCSTYLE($1000000);
  NSTCS_EXCLUSIONCHECKBOXES = _NSTCSTYLE($2000000);
  NSTCS_DIMMEDCHECKBOXES = _NSTCSTYLE($4000000);
  NSTCS_NOINDENTCHECKS = _NSTCSTYLE($8000000);
  NSTCS_ALLOWJUNCTIONS = _NSTCSTYLE($10000000);
  NSTCS_SHOWTABSBUTTON = _NSTCSTYLE($20000000);
  NSTCS_SHOWDELETEBUTTON = _NSTCSTYLE($40000000);
  NSTCS_SHOWREFRESHBUTTON = _NSTCSTYLE($80000000);

type
  PNSTCROOTSTYLE = ^NSTCROOTSTYLE;
  _NSTCROOTSTYLE = type DWORD;
  NSTCROOTSTYLE = _NSTCROOTSTYLE;

const
  NSTCRS_VISIBLE = _NSTCROOTSTYLE(0);
  NSTCRS_HIDDEN = _NSTCROOTSTYLE($1);
  NSTCRS_EXPANDED = _NSTCROOTSTYLE($2);

type
  PNSTCITEMSTATE = ^NSTCITEMSTATE;
  _NSTCITEMSTATE = type DWORD;
  NSTCITEMSTATE = _NSTCITEMSTATE;

const
  NSTCIS_NONE = _NSTCITEMSTATE(0);
  NSTCIS_SELECTED = _NSTCITEMSTATE($1);
  NSTCIS_EXPANDED = _NSTCITEMSTATE($2);
  NSTCIS_BOLD = _NSTCITEMSTATE($4);
  NSTCIS_DISABLED = _NSTCITEMSTATE($8);
  NSTCIS_SELECTEDNOEXPAND = _NSTCITEMSTATE($10);

type
  PNSTCGNI = ^NSTCGNI;
  NSTCGNI = type DWORD;

const
  NSTCGNI_NEXT = NSTCGNI(0);
  NSTCGNI_NEXTVISIBLE = NSTCGNI(1);
  NSTCGNI_PREV = NSTCGNI(2);
  NSTCGNI_PREVVISIBLE = NSTCGNI(3);
  NSTCGNI_PARENT = NSTCGNI(4);
  NSTCGNI_CHILD = NSTCGNI(5);
  NSTCGNI_FIRSTVISIBLE = NSTCGNI(6);
  NSTCGNI_LASTVISIBLE = NSTCGNI(7);

type
  PEXPLORERPANESTATE = ^EXPLORERPANESTATE;
  _EXPLORERPANESTATE = type DWORD;
  EXPLORERPANESTATE = _EXPLORERPANESTATE;

const
  EPS_DONTCARE = _EXPLORERPANESTATE(0);
  EPS_DEFAULT_ON = _EXPLORERPANESTATE($1);
  EPS_DEFAULT_OFF = _EXPLORERPANESTATE($2);
  EPS_STATEMASK = _EXPLORERPANESTATE($FFFF);
  EPS_INITIALSTATE = _EXPLORERPANESTATE($10000);
  EPS_FORCE = _EXPLORERPANESTATE($20000);

type
  PEXPCMDSTATE = ^EXPCMDSTATE;
  _EXPCMDSTATE = type DWORD;
  EXPCMDSTATE = _EXPCMDSTATE;

const
  ECS_ENABLED = _EXPCMDSTATE(0);
  ECS_DISABLED = _EXPCMDSTATE($1);
  ECS_HIDDEN = _EXPCMDSTATE($2);
  ECS_CHECKBOX = _EXPCMDSTATE($4);
  ECS_CHECKED = _EXPCMDSTATE($8);
  ECS_RADIOCHECK = _EXPCMDSTATE($10);

type
  PKNOWNDESTCATEGORY = ^KNOWNDESTCATEGORY;
  KNOWNDESTCATEGORY = type Integer;

const
  KDC_FREQUENT = KNOWNDESTCATEGORY(1);
  KDC_RECENT = KNOWNDESTCATEGORY((KDC_FREQUENT + 1));

type
  PCPVIEW = ^CPVIEW;
  CPVIEW = type DWORD;

const
  CPVIEW_CLASSIC = CPVIEW(0);
  CPVIEW_ALLITEMS = CPVIEW(CPVIEW_CLASSIC);
  CPVIEW_CATEGORY = CPVIEW(1);
  CPVIEW_HOME = CPVIEW(CPVIEW_CATEGORY);

type
  PEXPCMDFLAGS = ^EXPCMDFLAGS;
  _EXPCMDFLAGS = type DWORD;
  EXPCMDFLAGS = _EXPCMDFLAGS;

const
  ECF_DEFAULT = _EXPCMDFLAGS(0);
  ECF_HASSUBCOMMANDS = _EXPCMDFLAGS($1);
  ECF_HASSPLITBUTTON = _EXPCMDFLAGS($2);
  ECF_HIDELABEL = _EXPCMDFLAGS($4);
  ECF_ISSEPARATOR = _EXPCMDFLAGS($8);
  ECF_HASLUASHIELD = _EXPCMDFLAGS($10);
  ECF_SEPARATORBEFORE = _EXPCMDFLAGS($20);
  ECF_SEPARATORAFTER = _EXPCMDFLAGS($40);
  ECF_ISDROPDOWN = _EXPCMDFLAGS($80);
  ECF_TOGGLEABLE = _EXPCMDFLAGS($100);
  ECF_AUTOMENUICONS = _EXPCMDFLAGS($200);

type
  PBANNER_NOTIFICATION_EVENT = ^BANNER_NOTIFICATION_EVENT;
  BANNER_NOTIFICATION_EVENT = type DWORD;

const
  BNE_Rendered = BANNER_NOTIFICATION_EVENT(0);
  BNE_Hovered = BANNER_NOTIFICATION_EVENT(BNE_Rendered + 1);
  BNE_Closed = BANNER_NOTIFICATION_EVENT(BNE_Hovered + 1);
  BNE_Dismissed = BANNER_NOTIFICATION_EVENT(BNE_Closed + 1);
  BNE_Button1Clicked = BANNER_NOTIFICATION_EVENT(BNE_Dismissed + 1);
  BNE_Button2Clicked = BANNER_NOTIFICATION_EVENT(BNE_Button1Clicked + 1);

type
  PFDE_OVERWRITE_RESPONSE = ^FDE_OVERWRITE_RESPONSE;
  FDE_OVERWRITE_RESPONSE = type DWORD;

const
  FDEOR_DEFAULT = FDE_OVERWRITE_RESPONSE(0); // The application has not handled the event, and the dialog should put up UI asking the user
  // whether or not the file should be overwritten and be returned from the dialog
  FDEOR_ACCEPT = FDE_OVERWRITE_RESPONSE(1); // The application has decided that the file should be returned from the dialog
  FDEOR_REFUSE = FDE_OVERWRITE_RESPONSE(2); // The application has decided that the file should not be returned from the dialog

type
  PFDE_SHAREVIOLATION_RESPONSE = ^FDE_SHAREVIOLATION_RESPONSE;
  FDE_SHAREVIOLATION_RESPONSE = type DWORD;

const
  FDESVR_DEFAULT = FDE_SHAREVIOLATION_RESPONSE(0); // The application has not handled the event.  The dialog will put up UI indicating the file
  // is in use, and a different file must be chosen.
  FDESVR_ACCEPT = FDE_SHAREVIOLATION_RESPONSE(1); // The application has decided that the file should be returned from the dialog
  FDESVR_REFUSE = FDE_SHAREVIOLATION_RESPONSE(2); // The application has decided that the file should not be returned from the dialog

type
  PFDAP = ^FDAP;
  FDAP = type DWORD;

const
  FDAP_BOTTOM = FDAP(0);                // The place is added to the bottom of the default list.
  FDAP_TOP = FDAP(1);                // The place is added to the top of the default list.

type
  PSHARE_ROLE = ^SHARE_ROLE;
  SHARE_ROLE = type Integer;

const
  SHARE_ROLE_INVALID = SHARE_ROLE(-1);
  SHARE_ROLE_READER = SHARE_ROLE(0);
  SHARE_ROLE_CONTRIBUTOR = SHARE_ROLE(1);
  SHARE_ROLE_CO_OWNER = SHARE_ROLE(2);
  SHARE_ROLE_OWNER = SHARE_ROLE(3);
  SHARE_ROLE_CUSTOM = SHARE_ROLE(4);
  SHARE_ROLE_MIXED = SHARE_ROLE(5);

type
  PDEF_SHARE_ID = ^DEF_SHARE_ID;
  DEF_SHARE_ID = type DWORD;

const
  DEFSHAREID_USERS = DEF_SHARE_ID(1);
  DEFSHAREID_PUBLIC = DEF_SHARE_ID(2);

type
  PNMCII_FLAGS = ^NMCII_FLAGS;
  NMCII_FLAGS = type Integer;

const
  NMCII_NONE = NMCII_FLAGS($0);
  NMCII_ITEMS = NMCII_FLAGS($1);
  NMCII_FOLDERS = NMCII_FLAGS($2);

type
  PNMCSAEI_FLAGS = ^NMCSAEI_FLAGS;
  NMCSAEI_FLAGS = type Integer;

const
  NMCSAEI_SELECT = NMCSAEI_FLAGS($0);
  NMCSAEI_EDIT = NMCSAEI_FLAGS($1);

type
  PNSTCFOLDERCAPABILITIES = ^NSTCFOLDERCAPABILITIES;
  NSTCFOLDERCAPABILITIES = type DWORD;

const
  NSTCFC_NONE = NSTCFOLDERCAPABILITIES($0);
  NSTCFC_PINNEDITEMFILTERING = NSTCFOLDERCAPABILITIES($1);
  NSTCFC_DELAY_REGISTER_NOTIFY = NSTCFOLDERCAPABILITIES($2);

type
  PAPPDOCLISTTYPE = ^APPDOCLISTTYPE;
  APPDOCLISTTYPE = type DWORD;

const
  ADLT_RECENT = APPDOCLISTTYPE(0);
  ADLT_FREQUENT = APPDOCLISTTYPE((ADLT_RECENT + 1));

type

  PDESKTOP_SLIDESHOW_OPTIONS = ^DESKTOP_SLIDESHOW_OPTIONS;
  DESKTOP_SLIDESHOW_OPTIONS = type DWORD;

const
  DSO_SHUFFLEIMAGES = DESKTOP_SLIDESHOW_OPTIONS($1);

type
  PDESKTOP_SLIDESHOW_STATE = ^DESKTOP_SLIDESHOW_STATE;
  DESKTOP_SLIDESHOW_STATE = type DWORD;

const
  DSS_ENABLED = DESKTOP_SLIDESHOW_STATE($1);
  DSS_SLIDESHOW = DESKTOP_SLIDESHOW_STATE($2);
  DSS_DISABLED_BY_REMOTE_SESSION = DESKTOP_SLIDESHOW_STATE($4);

type
  PDESKTOP_SLIDESHOW_DIRECTION = ^DESKTOP_SLIDESHOW_DIRECTION;
  DESKTOP_SLIDESHOW_DIRECTION = type DWORD;

const
  DSD_FORWARD = DESKTOP_SLIDESHOW_DIRECTION(0);
  DSD_BACKWARD = DESKTOP_SLIDESHOW_DIRECTION(1);

type
  PDESKTOP_WALLPAPER_POSITION = ^DESKTOP_WALLPAPER_POSITION;
  DESKTOP_WALLPAPER_POSITION = type DWORD;

const
  DWPOS_CENTER = DESKTOP_WALLPAPER_POSITION(0);
  DWPOS_TILE = DESKTOP_WALLPAPER_POSITION(1);
  DWPOS_STRETCH = DESKTOP_WALLPAPER_POSITION(2);
  DWPOS_FIT = DESKTOP_WALLPAPER_POSITION(3);
  DWPOS_FILL = DESKTOP_WALLPAPER_POSITION(4);
  DWPOS_SPAN = DESKTOP_WALLPAPER_POSITION(5);

type
  PHOMEGROUPSHARINGCHOICES = ^HOMEGROUPSHARINGCHOICES;
  HOMEGROUPSHARINGCHOICES = type DWORD;

const
  HGSC_NONE = HOMEGROUPSHARINGCHOICES(0);
  HGSC_MUSICLIBRARY = HOMEGROUPSHARINGCHOICES($1);
  HGSC_PICTURESLIBRARY = HOMEGROUPSHARINGCHOICES($2);
  HGSC_VIDEOSLIBRARY = HOMEGROUPSHARINGCHOICES($4);
  HGSC_DOCUMENTSLIBRARY = HOMEGROUPSHARINGCHOICES($8);
  HGSC_PRINTERS = HOMEGROUPSHARINGCHOICES($10);

type
  PLIBRARYFOLDERFILTER = ^LIBRARYFOLDERFILTER;
  LIBRARYFOLDERFILTER = type Integer;

const
  LFF_FORCEFILESYSTEM = LIBRARYFOLDERFILTER(1);
  LFF_STORAGEITEMS = LIBRARYFOLDERFILTER(2);
  LFF_ALLITEMS = LIBRARYFOLDERFILTER(3);

type
  PLIBRARYOPTIONFLAGS = ^LIBRARYOPTIONFLAGS;
  LIBRARYOPTIONFLAGS = type Integer;

const
  LOF_DEFAULT = LIBRARYOPTIONFLAGS(0);
  LOF_PINNEDTONAVPANE = LIBRARYOPTIONFLAGS($1);
  LOF_MASK_ALL = LIBRARYOPTIONFLAGS($1);

type
  PDEFAULTSAVEFOLDERTYPE = ^DEFAULTSAVEFOLDERTYPE;
  DEFAULTSAVEFOLDERTYPE = type Integer;

const
  DSFT_DETECT = DEFAULTSAVEFOLDERTYPE(1);
  DSFT_PRIVATE = DEFAULTSAVEFOLDERTYPE(2);
  DSFT_PUBLIC = DEFAULTSAVEFOLDERTYPE(3);

type
  PLIBRARYSAVEFLAGS = ^LIBRARYSAVEFLAGS;
  LIBRARYSAVEFLAGS = type Integer;

const
  LSF_FAILIFTHERE = LIBRARYSAVEFLAGS(0);
  LSF_OVERRIDEEXISTING = LIBRARYSAVEFLAGS($1);
  LSF_MAKEUNIQUENAME = LIBRARYSAVEFLAGS($2);

type
  PDEFAULT_FOLDER_MENU_RESTRICTIONS = ^DEFAULT_FOLDER_MENU_RESTRICTIONS;
  DEFAULT_FOLDER_MENU_RESTRICTIONS = type DWORD;

const
  DFMR_DEFAULT = DEFAULT_FOLDER_MENU_RESTRICTIONS(0);
  DFMR_NO_STATIC_VERBS = DEFAULT_FOLDER_MENU_RESTRICTIONS($8);
  DFMR_STATIC_VERBS_ONLY = DEFAULT_FOLDER_MENU_RESTRICTIONS($10);
  DFMR_NO_RESOURCE_VERBS = DEFAULT_FOLDER_MENU_RESTRICTIONS($20);
  DFMR_OPTIN_HANDLERS_ONLY = DEFAULT_FOLDER_MENU_RESTRICTIONS($40);
  DFMR_RESOURCE_AND_FOLDER_VERBS_ONLY = DEFAULT_FOLDER_MENU_RESTRICTIONS($80);
  DFMR_USE_SPECIFIED_HANDLERS = DEFAULT_FOLDER_MENU_RESTRICTIONS($100);
  DFMR_USE_SPECIFIED_VERBS = DEFAULT_FOLDER_MENU_RESTRICTIONS($200);
  DFMR_NO_ASYNC_VERBS = DEFAULT_FOLDER_MENU_RESTRICTIONS($400);
  DFMR_NO_NATIVECPU_VERBS = DEFAULT_FOLDER_MENU_RESTRICTIONS($800);
  DFMR_NO_NONWOW_VERBS = DEFAULT_FOLDER_MENU_RESTRICTIONS($1000);

type
  PACTIVATEOPTIONS = ^ACTIVATEOPTIONS;
  ACTIVATEOPTIONS = type Integer;

const
  AO_NONE = ACTIVATEOPTIONS(0);
  AO_DESIGNMODE = ACTIVATEOPTIONS($1);
  AO_NOERRORUI = ACTIVATEOPTIONS($2);
  AO_NOSPLASHSCREEN = ACTIVATEOPTIONS($4);
  AO_PRELAUNCH = ACTIVATEOPTIONS($02000000);

type
  PMONITOR_APP_VISIBILITY = ^MONITOR_APP_VISIBILITY;
  MONITOR_APP_VISIBILITY = Integer;

const
  MAV_UNKNOWN = MONITOR_APP_VISIBILITY(0);
  MAV_NO_APP_VISIBLE = MONITOR_APP_VISIBILITY(1);
  MAV_APP_VISIBLE = MONITOR_APP_VISIBILITY(2);

type
  PPACKAGE_EXECUTION_STATE = ^PACKAGE_EXECUTION_STATE;
  PACKAGE_EXECUTION_STATE = type Integer;

const
  PES_UNKNOWN = PACKAGE_EXECUTION_STATE(0);
  PES_RUNNING = PACKAGE_EXECUTION_STATE(1);
  PES_SUSPENDING = PACKAGE_EXECUTION_STATE(2);
  PES_SUSPENDED = PACKAGE_EXECUTION_STATE(3);
  PES_TERMINATED = PACKAGE_EXECUTION_STATE(4);

type
  PAHE_TYPE = ^AHE_TYPE;
  AHE_TYPE = type Integer;

const
  AHE_DESKTOP = AHE_TYPE(0);
  AHE_IMMERSIVE = AHE_TYPE(1);

type
  PEC_HOST_UI_MODE = ^EC_HOST_UI_MODE;
  EC_HOST_UI_MODE = type Integer;

const
  ECHUIM_DESKTOP = EC_HOST_UI_MODE(0);
  ECHUIM_IMMERSIVE = EC_HOST_UI_MODE(1);
  ECHUIM_SYSTEM_LAUNCHER = EC_HOST_UI_MODE(2);

type
  PAPPLICATION_VIEW_STATE = ^APPLICATION_VIEW_STATE;
  APPLICATION_VIEW_STATE = type Integer;

const
  AVS_FULLSCREEN_LANDSCAPE = APPLICATION_VIEW_STATE(0);
  AVS_FILLED = APPLICATION_VIEW_STATE(1);
  AVS_SNAPPED = APPLICATION_VIEW_STATE(2);
  AVS_FULLSCREEN_PORTRAIT = APPLICATION_VIEW_STATE(3);

type
  PEDGE_GESTURE_KIND = ^EDGE_GESTURE_KIND;
  EDGE_GESTURE_KIND = type Integer;

const
  EGK_TOUCH = EDGE_GESTURE_KIND(0);
  EGK_KEYBOARD = EDGE_GESTURE_KIND(1);
  EGK_MOUSE = EDGE_GESTURE_KIND(2);

type
  PNATIVE_DISPLAY_ORIENTATION = ^NATIVE_DISPLAY_ORIENTATION;
  NATIVE_DISPLAY_ORIENTATION = type Integer;

const
  NDO_LANDSCAPE = NATIVE_DISPLAY_ORIENTATION(0);

  NDO_PORTRAIT = NATIVE_DISPLAY_ORIENTATION(1);



type
  PAPPLICATION_VIEW_ORIENTATION = ^APPLICATION_VIEW_ORIENTATION;
  APPLICATION_VIEW_ORIENTATION = type Integer;

const
  AVO_LANDSCAPE = APPLICATION_VIEW_ORIENTATION(0);
  AVO_PORTRAIT = APPLICATION_VIEW_ORIENTATION(1);

type
  PADJACENT_DISPLAY_EDGES = ^ADJACENT_DISPLAY_EDGES;
  ADJACENT_DISPLAY_EDGES = type Integer;

const
  ADE_NONE = ADJACENT_DISPLAY_EDGES(0);
  ADE_LEFT = ADJACENT_DISPLAY_EDGES($1);
  ADE_RIGHT = ADJACENT_DISPLAY_EDGES($2);

type
  PAPPLICATION_VIEW_MIN_WIDTH = ^APPLICATION_VIEW_MIN_WIDTH;
  APPLICATION_VIEW_MIN_WIDTH = type Integer;

const
  AVMW_DEFAULT = APPLICATION_VIEW_MIN_WIDTH(0);
  AVMW_320 = APPLICATION_VIEW_MIN_WIDTH(1);
  AVMW_500 = APPLICATION_VIEW_MIN_WIDTH(2);

type
  APPLICATION_VIEW_SIZE_PREFERENCE = type Integer;

const
  AVSP_CUSTOM = APPLICATION_VIEW_SIZE_PREFERENCE(6);
  AVSP_DEFAULT = APPLICATION_VIEW_SIZE_PREFERENCE(0);
  AVSP_USE_LESS = APPLICATION_VIEW_SIZE_PREFERENCE(1);
  AVSP_USE_HALF = APPLICATION_VIEW_SIZE_PREFERENCE(2);
  AVSP_USE_MORE = APPLICATION_VIEW_SIZE_PREFERENCE(3);
  AVSP_USE_MINIMUM = APPLICATION_VIEW_SIZE_PREFERENCE(4);
  AVSP_USE_NONE = APPLICATION_VIEW_SIZE_PREFERENCE(5);

type
  FLYOUT_PLACEMENT = type Integer;

const
  FP_DEFAULT = FLYOUT_PLACEMENT(0);
  FP_ABOVE = FLYOUT_PLACEMENT(1);
  FP_BELOW = FLYOUT_PLACEMENT(2);
  FP_LEFT = FLYOUT_PLACEMENT(3);
  FP_RIGHT = FLYOUT_PLACEMENT(4);

type
  SORT_ORDER_TYPE = type Integer;

const
  SOT_DEFAULT = SORT_ORDER_TYPE(0);
  SOT_IGNORE_FOLDERNESS = SORT_ORDER_TYPE(1);

type
  PLIBRARYMANAGEDIALOGOPTIONS = ^LIBRARYMANAGEDIALOGOPTIONS;
  LIBRARYMANAGEDIALOGOPTIONS = type Integer;

const
  LMD_DEFAULT = LIBRARYMANAGEDIALOGOPTIONS($00000000);
  LMD_ALLOWUNINDEXABLENETWORKLOCATIONS = LIBRARYMANAGEDIALOGOPTIONS($00000001);  // The caller of SHShowManageLibraryUI does not want to show any warning dialogs about network locations that cannot be indexed


type
  ASSOC_FILTER = type Integer;

const
  ASSOC_FILTER_NONE = ASSOC_FILTER($0000);
  ASSOC_FILTER_RECOMMENDED = ASSOC_FILTER($0001);


type
  // IAssocHandlerInvoker
  AHTYPE = type Integer;

const
  AHTYPE_UNDEFINED = AHTYPE($0000);
  AHTYPE_USER_APPLICATION = AHTYPE($0008);
  AHTYPE_ANY_APPLICATION = AHTYPE($0010);
  AHTYPE_MACHINEDEFAULT = AHTYPE($0020);
  AHTYPE_PROGID = AHTYPE($0040);
  AHTYPE_APPLICATION = AHTYPE($0080);
  AHTYPE_CLASS_APPLICATION = AHTYPE($0100);
  AHTYPE_ANY_PROGID = AHTYPE($0200);


type
  PLPTBBUTTONSB = ^LPTBBUTTONSB;
  LPTBBUTTONSB = PTBBUTTON;



  // Records =====================================================================

type
  // IBandSite
  PBANDSITEINFO = ^BANDSITEINFO;

  tagBANDSITEINFO = record
    dwMask: DWORD;
    dwState: DWORD;
    dwStyle: DWORD;
  end;
  BANDSITEINFO = tagBANDSITEINFO;

  // Record CMINVOKECOMMANDINFO
  // ==========================
  CMINVOKECOMMANDINFO = record
    cbSize: DWORD;
    fMask: DWORD;
    hwnd: HWND;
    lpVerb: LPCSTR;
    lpParameters: LPCSTR;
    lpDirectory: LPCSTR;
    nShow: Integer;
    dwHotKey: DWORD;
    hIcon: THANDLE;
  end;
  PCMINVOKECOMMANDINFO = ^CMINVOKECOMMANDINFO;

  // Record CMINVOKECOMMANDINFOEX
  // ============================
  CMINVOKECOMMANDINFOEX = record
    cbSize: DWORD;
    fMask: DWORD;
    hwnd: HWND;
    lpVerb: LPCSTR;
    lpParameters: LPCSTR;
    lpDirectory: LPCSTR;
    nShow: Integer;
    dwHotKey: DWORD;
    hIcon: THANDLE;
    lpTitle: LPCSTR;
    lpVerbW: LPCWSTR;
    lpParametersW: LPCWSTR;
    lpDirectoryW: LPCWSTR;
    lpTitleW: LPCWSTR;
    ptInvoke: POINT;
  end;
  PCMINVOKECOMMANDINFOEX = ^CMINVOKECOMMANDINFOEX;

  // Record CMINVOKECOMMANDINFOEX_REMOTE
  // ===================================
  CMINVOKECOMMANDINFOEX_REMOTE = record
    cbSize: DWORD;
    fMask: DWORD;
    hwnd: HWND;
    lpVerbString: LPCSTR;
    lpParameters: LPCSTR;
    lpDirectory: LPCSTR;
    nShow: Integer;
    dwHotKey: DWORD;
    lpTitle: LPCSTR;
    lpVerbWString: LPCWSTR;
    lpParametersW: LPCWSTR;
    lpDirectoryW: LPCWSTR;
    lpTitleW: LPCWSTR;
    ptInvoke: POINT;
    lpVerbInt: UINT;
    lpVerbWInt: UINT;
  end;
  PCMINVOKECOMMANDINFOEX_REMOTE = ^CMINVOKECOMMANDINFOEX_REMOTE;

  // Record PERSIST_FOLDER_TARGET_INFO
  // =================================
  PERSIST_FOLDER_TARGET_INFO = record
    pidlTargetFolder: PIDLIST_ABSOLUTE;
    szTargetParsingName: array[0..260 - 1] of WideChar;
    szNetworkProvider: array[0..260 - 1] of WideChar;
    dwAttributes: DWORD;
    csidl: Integer;
  end;
  PPERSIST_FOLDER_TARGET_INFO = ^PERSIST_FOLDER_TARGET_INFO;

  // Record EXTRASEARCH
  // ==================
  EXTRASEARCH = record
    case Byte of
      0: (
        guidSearch: TGUID;
        wszFriendlyName: array[0..80 - 1] of WideChar;
        wszUrl: array[0..2084 - 1] of WideChar
      );
      1: (_Alignment: DWORD);
  end;
  PEXTRASEARCH = ^EXTRASEARCH;

  // Record FOLDERSETTINGS
  // =====================
  FOLDERSETTINGS = record
    ViewMode: UINT;
    fFlags: UINT;
  end;
  PFOLDERSETTINGS = ^FOLDERSETTINGS;
  LPFOLDERSETTINGS = ^FOLDERSETTINGS;
  LPCFOLDERSETTINGS = ^FOLDERSETTINGS;


  // Record SORTCOLUMN
  // =================
  SORTCOLUMN = record
    propkey: PROPERTYKEY;
    direction: SORTDIRECTION;
  end;
  PSORTCOLUMN = ^SORTCOLUMN;

  // Record CM_COLUMNINFO
  // ====================
  CM_COLUMNINFO = record
    cbSize: DWORD;
    dwMask: DWORD;
    dwState: DWORD;
    uWidth: UINT;
    uDefaultWidth: UINT;
    uIdealWidth: UINT;
    wszName: array[0..80 - 1] of WideChar;
  end;
  PCM_COLUMNINFO = ^CM_COLUMNINFO;

  // Record SHELL_ITEM_RESOURCE
  // ==========================
  SHELL_ITEM_RESOURCE = record
    case Byte of
      0: (
        guidType: TGUID;
        szName: array[0..260 - 1] of WideChar
      );
      1: (_Alignment: DWORD);
  end;
  PSHELL_ITEM_RESOURCE = ^SHELL_ITEM_RESOURCE;

  // Record CATEGORY_INFO
  // ====================
  CATEGORY_INFO = record
    cif: CATEGORYINFO_FLAGS;
    wszName: array[0..260 - 1] of WideChar;
  end;
  PCATEGORY_INFO = ^CATEGORY_INFO;

  // Record SHDRAGIMAGE
  // ==================
  SHDRAGIMAGE = record
    sizeDragImage: SIZE;
    ptOffset: POINT;
    hbmpDragImage: HBITMAP;
    crColorKey: COLORREF;
  end;
  PSHDRAGIMAGE = ^SHDRAGIMAGE;
  LPSHDRAGIMAGE = PSHDRAGIMAGE;


  // Record DESKBANDINFO
  // ===================
  DESKBANDINFO = record
    dwMask: DWORD;
    ptMinSize: POINTL;
    ptMaxSize: POINTL;
    ptIntegral: POINTL;
    ptActual: POINTL;
    wszTitle: array[0..256 - 1] of WideChar;
    dwModeFlags: DWORD;
    crBkgnd: COLORREF;
  end;
  PDESKBANDINFO = ^DESKBANDINFO;


type
  PTHUMBBUTTONFLAGS = ^THUMBBUTTONFLAGS;
  THUMBBUTTONFLAGS = UINT;

const
  THBF_ENABLED = THUMBBUTTONFLAGS(0);
  THBF_DISABLED = THUMBBUTTONFLAGS($1);
  THBF_DISMISSONCLICK = THUMBBUTTONFLAGS($2);
  THBF_NOBACKGROUND = THUMBBUTTONFLAGS($4);
  THBF_HIDDEN = THUMBBUTTONFLAGS($8);
  THBF_NONINTERACTIVE = THUMBBUTTONFLAGS($10);

type
  // DEFINE_ENUM_FLAG_OPERATORS(THUMBBUTTONFLAGS)
  PTHUMBBUTTONMASK = ^THUMBBUTTONMASK;
  THUMBBUTTONMASK = UINT;

const
  THB_BITMAP = THUMBBUTTONMASK($1);
  THB_ICON = THUMBBUTTONMASK($2);
  THB_TOOLTIP = THUMBBUTTONMASK($4);
  THB_FLAGS = THUMBBUTTONMASK($8);

type
  PSTPFLAG = ^STPFLAG;
  STPFLAG = DWORD;

const
  STPF_NONE = STPFLAG(0);
  STPF_USEAPPTHUMBNAILALWAYS = STPFLAG($1);
  STPF_USEAPPTHUMBNAILWHENACTIVE = STPFLAG($2);
  STPF_USEAPPPEEKALWAYS = STPFLAG($4);
  STPF_USEAPPPEEKWHENACTIVE = STPFLAG($8);

  //obsolete?
type
  PEXPLORER_BROWSER_OPTIONS = ^EXPLORER_BROWSER_OPTIONS;
  EXPLORER_BROWSER_OPTIONS = DWORD;

const
  EBO_NONE = EXPLORER_BROWSER_OPTIONS(0);
  EBO_NAVIGATEONCE = EXPLORER_BROWSER_OPTIONS($1);
  EBO_SHOWFRAMES = EXPLORER_BROWSER_OPTIONS($2);
  EBO_ALWAYSNAVIGATE = EXPLORER_BROWSER_OPTIONS($4);
  EBO_NOTRAVELLOG = EXPLORER_BROWSER_OPTIONS($8);
  EBO_NOWRAPPERWINDOW = EXPLORER_BROWSER_OPTIONS($10);
  EBO_HTMLSHAREPOINTVIEW = EXPLORER_BROWSER_OPTIONS($20);
  EBO_NOBORDER = EXPLORER_BROWSER_OPTIONS($40);
  EBO_NOPERSISTVIEWSTATE = EXPLORER_BROWSER_OPTIONS($80);

type
  PEXPLORER_BROWSER_FILL_FLAGS = ^EXPLORER_BROWSER_FILL_FLAGS;
  EXPLORER_BROWSER_FILL_FLAGS = DWORD;

const
  EBF_NONE = EXPLORER_BROWSER_FILL_FLAGS(0);
  EBF_SELECTFROMDATAOBJECT = EXPLORER_BROWSER_FILL_FLAGS($100);
  EBF_NODROPTARGET = EXPLORER_BROWSER_FILL_FLAGS($200);


type

  // Record THUMBBUTTON
  // ==================
  THUMBBUTTON = record
    dwMask: THUMBBUTTONMASK;
    iId: UINT;
    iBitmap: UINT;
    hIcon: HICON;
    szTip: array[0..260 - 1] of WideChar;
    dwFlags: THUMBBUTTONFLAGS;
  end;
  PTHUMBBUTTON = ^THUMBBUTTON;
  LPTHUMBBUTTON = PTHUMBBUTTON;

  // Record DELEGATEITEMID
  // =====================
  {$PUSH}
  {$PACKRECORDS 1}
  DELEGATEITEMID = packed record
    cbSize: WORD;
    wOuter: WORD;
    cbInner: WORD;
    rgb: array[0..1 - 1] of BYTE;
  end;
  {$POP}
  PDELEGATEITEMID = ^DELEGATEITEMID;


  // Record SMINFO
  // =============
  SMINFO = record
    dwMask: DWORD;
    dwType: DWORD;
    dwFlags: DWORD;
    iIcon: Integer;
  end;
  PSMINFO = ^SMINFO;

  // Record SMCSHCHANGENOTIFYSTRUCT
  // ==============================
  SMCSHCHANGENOTIFYSTRUCT = record
    lEvent: long;
    pidl1: PCIDLIST_ABSOLUTE;
    pidl2: PCIDLIST_ABSOLUTE;
  end;
  PSMCSHCHANGENOTIFYSTRUCT = ^SMCSHCHANGENOTIFYSTRUCT;

  // Record KNOWNFOLDER_DEFINITION
  // =============================
  KNOWNFOLDER_DEFINITION = record
    category: KF_CATEGORY;
    pszName: LPWSTR;
    pszDescription: LPWSTR;
    fidParent: KNOWNFOLDERID;
    pszRelativePath: LPWSTR;
    pszParsingName: LPWSTR;
    pszTooltip: LPWSTR;
    pszLocalizedName: LPWSTR;
    pszIcon: LPWSTR;
    pszSecurity: LPWSTR;
    dwAttributes: DWORD;
    kfdFlags: KF_DEFINITION_FLAGS;
    ftidType: FOLDERTYPEID;
  end;
  PKNOWNFOLDER_DEFINITION = ^KNOWNFOLDER_DEFINITION;

  // Record PREVIEWHANDLERFRAMEINFO
  // ==============================
  PREVIEWHANDLERFRAMEINFO = record
    haccel: HACCEL;
    cAccelEntries: UINT;
  end;
  PPREVIEWHANDLERFRAMEINFO = ^PREVIEWHANDLERFRAMEINFO;

  // Record BANNER_NOTIFICATION
  // ==========================
  BANNER_NOTIFICATION = record
    event: BANNER_NOTIFICATION_EVENT;
    providerIdentity: LPCWSTR;
    contentId: LPCWSTR;
  end;
  PBANNER_NOTIFICATION = ^BANNER_NOTIFICATION;

  LPCMINVOKECOMMANDINFO = PCMINVOKECOMMANDINFO;
  PCCMINVOKECOMMANDINFO = PCMINVOKECOMMANDINFO;
  LPCMINVOKECOMMANDINFOEX = PCMINVOKECOMMANDINFOEX;
  PCCMINVOKECOMMANDINFOEX = PCMINVOKECOMMANDINFOEX;

  LPCONTEXTMENU = ^IContextMenu;
  LPCONTEXTMENU2 = ^IContextMenu2;
  LPCONTEXTMENU3 = ^IContextMenu3;
  LPPERSISTFOLDER = ^IPersistFolder;
  LPENUMIDLIST = ^IEnumIDList;
  LPSHELLFOLDER = ^IShellFolder;
  LPENUMEXTRASEARCH = ^IEnumExtraSearch;

  LPCOMMDLGBROWSER = ^ICommDlgBrowser;
  LPCOMMDLGBROWSER2 = ^ICommDlgBrowser2;
  LPSHELLBROWSER = ^IShellBrowser;
  LPSTGTRANSCONFIRMATION = PGUID;
  LPSHELLEXTINIT = ^IShellExtInit;
  LPSHELLPROPSHEETEXT = ^IShellPropSheetExt;
  LPEXTRACTIMAGE = ^IExtractImage;
  LPEXTRACTIMAGE2 = ^IExtractImage2;
  HIMAGELIST = PIUnknown;
  PZZWSTR = PWideChar;


  {$POINTERMATH ON}
  PPITEMID_CHILD = ^PITEMID_CHILD;
  PPIDLIST_ABSOLUTE = ^PIDLIST_ABSOLUTE;
  {$POINTERMATH OFF}

  IContextMenu = interface;
  IContextMenu2 = interface;
  IContextMenu3 = interface;
  IStaticVerbProvider = interface;
  IExecuteCommand = interface;
  IPersistFolder = interface;
  IRunnableTask = interface;
  IShellTaskScheduler = interface;
  IPersistFolder2 = interface;
  IPersistFolder3 = interface;
  IPersistIDList = interface;
  IEnumIDList = interface;
  IEnumFullIDList = interface;
  IFileSyncMergeHandler = interface;
  IObjectWithFolderEnumMode = interface;
  IParseAndCreateItem = interface;
  IShellFolder = interface;
  IShellBrowser = interface;
  IEnumExtraSearch = interface;
  IShellFolder2 = interface;
  IShellView = interface;
  LPSHELLVIEW = ^IShellView;
  IShellView2 = interface;
  IFolderView = interface;
  IFolderView2 = interface;
  IFolderViewSettings = interface;
  IInitializeNetworkFolder = interface;
  INetworkFolderInternal = interface;
  IPreviewHandlerVisuals = interface;
  ICommDlgBrowser = interface;
  ICommDlgBrowser2 = interface;
  IColumnManager = interface;
  IFolderFilterSite = interface;
  IFolderFilter = interface;
  IInputObjectSite = interface;
  IInputObject = interface;
  IInputObject2 = interface;
  IShellIcon = interface;
  //IShellBrowser = interface;
  IProfferService = interface;
  IGetServiceIds = interface;
  IShellItem = interface;
  PIShellItem = ^IShellItem;
  IShellItem2 = interface;
  IShellItemImageFactory = interface;
  IEnumShellItems = interface;
  ITransferAdviseSink = interface;
  ITransferSource = interface;
  IEnumResources = interface;
  IShellItemResources = interface;
  ITransferDestination = interface;
  IFileOperationProgressSink = interface;
  IShellItemArray = interface;
  IInitializeWithItem = interface;
  IObjectWithSelection = interface;
  IObjectWithBackReferences = interface;
  IPropertyUI = interface;
  ICategoryProvider = interface;
  ICategorizer = interface;
  IDropTargetHelper = interface;
  IDragSourceHelper = interface;
  IShellLinkA = interface;
  IShellLinkW = interface;
  IShellLinkDataList = interface;
  IResolveShellLink = interface;
  IActionProgressDialog = interface;
  IActionProgress = interface;
  IShellExtInit = interface;
  IShellPropSheetExt = interface;
  IRemoteComputer = interface;
  IQueryContinue = interface;
  IObjectWithCancelEvent = interface;
  IUserNotification = interface;
  IItemNameLimits = interface;
  ISearchFolderItemFactory = interface;
  IExtractImage = interface;
  IExtractImage2 = interface;
  IThumbnailHandlerFactory = interface;
  IParentAndItem = interface;
  IDockingWindow = interface;
  IDeskBand = interface;
  IDeskBandInfo = interface;
  ITaskbarList = interface;
  ITaskbarList2 = interface;
  ITaskbarList3 = interface;
  ITaskbarList4 = interface;
  IExplorerBrowserEvents = interface;
  IExplorerBrowser = interface;
  IEnumObjects = interface;
  IOperationsProgressDialog = interface;
  IIOCancelInformation = interface;
  IFileOperation = interface;
  IFileOperation2 = interface;
  IObjectProvider = interface;
  INamespaceWalkCB = interface;
  INamespaceWalkCB2 = interface;
  INamespaceWalk = interface;
  IBandSite = interface;
  IModalWindow = interface;
  IContextMenuSite = interface;
  IMenuBand = interface;
  IRegTreeItem = interface;
  IDeskBar = interface;
  IMenuPopup = interface;
  IFileIsInUse = interface;
  IFileDialogEvents = interface;
  IFileDialog = interface;
  IFileSaveDialog = interface;
  IFileOpenDialog = interface;
  IFileDialogCustomize = interface;
  IApplicationAssociationRegistration = interface;
  IDelegateFolder = interface;
  IBrowserFrameOptions = interface;
  INewWindowManager = interface;
  IAttachmentExecute = interface;
  IAttachmentExecute2 = interface;
  IShellMenuCallback = interface;
  IShellMenu = interface;
  IKnownFolder = interface;
  IKnownFolderManager = interface;
  ISharingConfigurationManager = interface;
  IRelatedItem = interface;
  IIdentityName = interface;
  IDelegateItem = interface;
  ICurrentItem = interface;
  ITransferMediumItem = interface;
  IDisplayItem = interface;
  IViewStateIdentityItem = interface;
  IPreviewItem = interface;
  IDestinationStreamFactory = interface;
  ICreateProcessInputs = interface;
  ICreatingProcess = interface;
  ILaunchUIContext = interface;
  ILaunchUIContextProvider = interface;
  INewMenuClient = interface;
  IInitializeWithBindCtx = interface;
  IShellItemFilter = interface;
  INameSpaceTreeControl = interface;
  INameSpaceTreeControlFolderCapabilities = interface;
  IPreviewHandler = interface;
  IPreviewHandlerFrame = interface;
  IExplorerPaneVisibility = interface;
  IContextMenuCB = interface;
  IDefaultExtractIconInit = interface;
  IExplorerCommand = interface;
  PIExplorerCommand = ^IExplorerCommand;
  IExplorerCommandState = interface;
  IInitializeCommand = interface;
  IEnumExplorerCommand = interface;
  IExplorerCommandProvider = interface;
  IOpenControlPanel = interface;
  IFileSystemBindData = interface;
  IFileSystemBindData2 = interface;
  ICustomDestinationList = interface;
  IApplicationDestinations = interface;
  IApplicationDocumentLists = interface;
  IObjectWithAppUserModelID = interface;
  IObjectWithPackageFullName = interface;
  IObjectWithProgID = interface;
  IUpdateIDList = interface;
  IDesktopWallpaper = interface;
  IHomeGroup = interface;
  IInitializeWithPropertyStore = interface;
  IOpenSearchSource = interface;
  IShellLibrary = interface;
  IDefaultFolderMenuInitialize = interface;
  IApplicationActivationManager = interface;
  IVirtualDesktopManager = interface;
  IAssocHandlerInvoker = interface;
  IAssocHandler = interface;
  IEnumAssocHandlers = interface;
  IDataObjectProvider = interface;
  IDataTransferManagerInterop = interface;
  IFrameworkInputPaneHandler = interface;
  IFrameworkInputPane = interface;
  IAppVisibilityEvents = interface;
  IAppVisibility = interface;
  IPackageExecutionStateChangeNotification = interface;
  IPackageDebugSettings = interface;
  IPackageDebugSettings2 = interface;
  ISuspensionDependencyManager = interface;
  IExecuteCommandApplicationHostEnvironment = interface;
  IExecuteCommandHost = interface;
  IApplicationDesignModeSettings = interface;
  IApplicationDesignModeSettings2 = interface;
  ILaunchTargetMonitor = interface;
  ILaunchSourceViewSizePreference = interface;
  ILaunchTargetViewSizePreference = interface;
  ILaunchSourceAppUserModelId = interface;
  IInitializeWithWindow = interface;
  IHandlerInfo = interface;
  IHandlerInfo2 = interface;
  IHandlerActivationHost = interface;
  IAppActivationUIInfo = interface;
  IContactManagerInterop = interface;
  IShellIconOverlayIdentifier = interface;
  IBannerNotificationHandler = interface;
  ISortColumnArray = interface;
  IPropertyKeyStore = interface;



  PSV2CVW2_PARAMS = ^SV2CVW2_PARAMS;
  LPSV2CVW2_PARAMS = PSV2CVW2_PARAMS;

  SV2CVW2_PARAMS = record
    cbSize: DWORD;
    psvPrev: IShellView;
    pfs: LPCFOLDERSETTINGS;
    psbOwner: IShellBrowser;
    prcView: PRECT;
    pvid: ^SHELLVIEWID;
    hwndView: HWND;
  end;


  // Interface IContextMenu
  // ======================
  //
  IContextMenu = interface(IUnknown)
    ['{000214E4-0000-0000-C000-000000000046}']

    function QueryContextMenu(hmenu: HMENU;
                              indexMenu: UINT;
                              idCmdFirst: UINT;
                              idCmdLast: UINT;
                              uFlags: UINT): HRESULT; stdcall;

    function InvokeCommand(pici: PCMINVOKECOMMANDINFO): HRESULT; stdcall;

    function GetCommandString(idCmd: UINT_PTR;
                              uType: UINT;
                              pReserved: PUINT;
                              pszName: PAnsiChar;
                              cchMax: UINT): HRESULT; stdcall;
  end;

  IID_IContextMenu = IContextMenu;

  // Interface IContextMenu2
  // =======================
  //
  IContextMenu2 = interface(IContextMenu)
    ['{000214F4-0000-0000-C000-000000000046}']

    function HandleMenuMsg(uMsg: UINT;
                           wParam: WPARAM;
                           lParam: LPARAM): HRESULT; stdcall;
  end;

  IID_IContextMenu2 = IContextMenu2;

  // Interface IContextMenu3
  // =======================
  //
  IContextMenu3 = interface(IContextMenu2)
    ['{BCFCE0A0-EC17-11D0-8D10-00A0C90F2719}']

    function HandleMenuMsg2(uMsg: UINT;
                            wParam: WPARAM;
                            lParam: LPARAM;
                            plResult: PLRESULT): HRESULT; stdcall;
  end;

  IID_IContextMenu3 = IContextMenu3;

  // Interface IStaticVerbProvider
  // =============================
  //
  IStaticVerbProvider = interface(IUnknown)
    ['{4B770DA6-D111-4015-96FD-8C1C56F06C55}']

    function IsVerbSupported(verbName: LPCWSTR;
                             out result: BOOL): HRESULT; stdcall;
  end;

  IID_IStaticVerbProvider = IStaticVerbProvider;

  // Interface IExecuteCommand
  // =========================
  //
  IExecuteCommand = interface(IUnknown)
    ['{7F9185B0-CB92-43C5-80A9-92277A4F7B54}']

    function SetKeyState(grfKeyState: DWORD): HRESULT; stdcall;

    function SetParameters(pszParameters: LPCWSTR): HRESULT; stdcall;

    function SetPosition(pt: POINT): HRESULT; stdcall;

    function SetShowWindow(nShow: Integer): HRESULT; stdcall;

    function SetNoShowUI(fNoShowUI: BOOL): HRESULT; stdcall;

    function SetDirectory(pszDirectory: LPCWSTR): HRESULT; stdcall;

    function Execute: HRESULT; stdcall;
  end;

  IID_IExecuteCommand = IExecuteCommand;

  // Interface IPersistFolder
  // ========================
  //
  IPersistFolder = interface(IPersist)
    ['{000214EA-0000-0000-C000-000000000046}']

    function Initialize(pidl: PCIDLIST_ABSOLUTE): HRESULT; stdcall;
  end;

  IID_IPersistFolder = IPersistFolder;


  // Interface IRunnableTask
  // =======================
  //
  IRunnableTask = interface(IUnknown)
    ['{85788D00-6807-11D0-B810-00C04FD706EC}']

    function Run: HRESULT; stdcall;

    function Kill(bWait: BOOL): HRESULT; stdcall;

    function Suspend: HRESULT; stdcall;

    function Resume: HRESULT; stdcall;

    function IsRunning: ULONG; stdcall;
  end;

  IID_IRunnableTask = IRunnableTask;


  // Interface IShellTaskScheduler
  // =============================
  //
  IShellTaskScheduler = interface(IUnknown)
    ['{6CCB7BE0-6807-11D0-B810-00C04FD706EC}']

    function AddTask(prt: IRunnableTask;
                     rtoid: REFTASKOWNERID;
                     lParam: DWORD_PTR;
                     dwPriority: DWORD): HRESULT; stdcall;

    function RemoveTasks(rtoid: REFTASKOWNERID;
                         lParam: DWORD_PTR;
                         bWaitIfRunning: BOOL): HRESULT; stdcall;

    function CountTasks(rtoid: REFTASKOWNERID): UINT; stdcall;

    function Status(dwReleaseStatus: DWORD;
                    dwThreadTimeout: DWORD): HRESULT; stdcall;
  end;

  IID_IShellTaskScheduler = IShellTaskScheduler;


  // Interface IPersistFolder2
  // =========================
  //
  IPersistFolder2 = interface(IPersistFolder)
    ['{1AC3D9F0-175C-11D1-95BE-00609797EA4F}']

    function GetCurFolder(out ppidl: PIDLIST_ABSOLUTE): HRESULT; stdcall;
  end;

  IID_IPersistFolder2 = IPersistFolder2;


  // Interface IPersistFolder3
  // =========================
  //
  IPersistFolder3 = interface(IPersistFolder2)
    ['{CEF04FDF-FE72-11D2-87A5-00C04F6837CF}']

    function InitializeEx(pbc: IBindCtx;
                          pidlRoot: PCIDLIST_ABSOLUTE;
                          ppfti: PPERSIST_FOLDER_TARGET_INFO): HRESULT; stdcall;

    function GetFolderTargetInfo(ppfti: PPERSIST_FOLDER_TARGET_INFO): HRESULT; stdcall;
  end;

  IID_IPersistFolder3 = IPersistFolder3;


  // Interface IPersistIDList
  // ========================
  //
  IPersistIDList = interface(IPersist)
    ['{1079ACFC-29BD-11D3-8E0D-00C04F6837D5}']

    function SetIDList(pidl: PCIDLIST_ABSOLUTE): HRESULT; stdcall;

    function GetIDList(out ppidl: PIDLIST_ABSOLUTE): HRESULT; stdcall;
  end;

  IID_IPersistIDList = IPersistIDList;

  // Interface IEnumIDList
  // =====================
  //
  IEnumIDList = interface(IUnknown)
    ['{000214F2-0000-0000-C000-000000000046}']

    function Next(celt: ULONG;
                  rgelt: PPITEMID_CHILD;
                  pceltFetched: PULONG): HRESULT; stdcall;

    function Skip(celt: ULONG): HRESULT; stdcall;

    function Reset: HRESULT; stdcall;

    function Clone(out ppenum: IEnumIDList): HRESULT; stdcall;
  end;

  IID_IEnumIDList = IEnumIDList;

  // Interface IEnumFullIDList
  // =========================
  //
  IEnumFullIDList = interface(IUnknown)
    ['{D0191542-7954-4908-BC06-B2360BBE45BA}']

    function Next(celt: ULONG;
                  rgelt: PPIDLIST_ABSOLUTE;
                  pceltFetched: PULONG): HRESULT; stdcall;

    function Skip(celt: ULONG): HRESULT; stdcall;

    function Reset: HRESULT; stdcall;

    function Clone(out ppenum: IEnumFullIDList): HRESULT; stdcall;
  end;

  IID_IEnumFullIDList = IEnumFullIDList;

  // Interface IFileSyncMergeHandler
  // ===============================
  //
  IFileSyncMergeHandler = interface(IUnknown)
    ['{D97B5AAC-C792-433C-975D-35C4EADC7A9D}']

    function Merge(localFilePath: LPCWSTR;
                   serverFilePath: LPCWSTR;
                   out updateStatus: MERGE_UPDATE_STATUS): HRESULT; stdcall;

    function ShowResolveConflictUIAsync(localFilePath: LPCWSTR;
                                        monitorToDisplayOn: HMONITOR): HRESULT; stdcall;
  end;

  IID_IFileSyncMergeHandler = IFileSyncMergeHandler;

  // Interface IObjectWithFolderEnumMode
  // ===================================
  //
  IObjectWithFolderEnumMode = interface(IUnknown)
    ['{6A9D9026-0E6E-464C-B000-42ECC07DE673}']

    function SetMode(feMode: FOLDER_ENUM_MODE): HRESULT; stdcall;

    function GetMode(out pfeMode: FOLDER_ENUM_MODE): HRESULT; stdcall;
  end;

  IID_IObjectWithFolderEnumMode = IObjectWithFolderEnumMode;

  // Interface IParseAndCreateItem
  // =============================
  //
  IParseAndCreateItem = interface(IUnknown)
    ['{67EFED0E-E827-4408-B493-78F3982B685C}']

    function SetItem(psi: IShellItem): HRESULT; stdcall;

    function GetItem(const riid: REFIID;
                     out ppv: Pointer): HRESULT; stdcall;
  end;

  IID_IParseAndCreateItem = IParseAndCreateItem;


  // Interface IShellFolder
  // ======================
  //
  IShellFolder = interface(IUnknown)
    ['{000214E6-0000-0000-C000-000000000046}']

    function ParseDisplayName(hwnd: HWND;
                              pbc: IBindCtx;
                              pszDisplayName: LPWSTR;
                              pchEaten: PULONG;
                              out ppidl: PIDLIST_RELATIVE;
                              pdwAttributes: PULONG): HRESULT; stdcall;

    function EnumObjects(hwnd: HWND;
                         grfFlags: SHCONTF;
                         out ppenumIDList: IEnumIDList): HRESULT; stdcall;

    // returns an instance of a sub-folder which is specified by the IDList (pidl).
    // IShellFolder or derived interfaces
    function BindToObject(pidl: PCUIDLIST_RELATIVE;
                          pbc: IBindCtx;
                          const riid: TGUID;
                          out ppv): HRESULT; stdcall;

    // produces the same result as BindToObject()
    function BindToStorage(pidl: PCUIDLIST_RELATIVE;
                           pbc: IBindCtx;
                           const riid: TGUID;
                           out ppv): HRESULT; stdcall;

    // compares two IDLists and returns the result. The shell
    // explorer always passes 0 as lParam, which indicates 'sort by name'.
    // It should return 0 (as CODE of the scode), if two id indicates the
    // same object; negative value if pidl1 should be placed before pidl2;
    // positive value if pidl2 should be placed before pidl1.
    // use the macro ResultFromShort() to extract the result comparison
    // it deals with the casting and type conversion issues for you
    function CompareIDs(lParam: LPARAM;
                        pidl1: PCUIDLIST_RELATIVE;
                        pidl2: PCUIDLIST_RELATIVE): HRESULT; stdcall;

    // creates a view object of the folder itself. The view
    // object is a difference instance from the shell folder object.
    // 'hwndOwner' can be used  as the owner window of its dialog box or
    // menu during the lifetime of the view object.
    // This member function should always create a new
    // instance which has only one reference count. The explorer may create
    // more than one instances of view object from one shell folder object
    // and treat them as separate instances.
    // returns IShellView derived interface
    function CreateViewObject(hwndOwner: HWND;
                              const riid: TGUID;
                              out ppv): HRESULT; stdcall;

    // returns the attributes of specified objects in that
    // folder. 'cidl' and 'apidl' specifies objects. 'apidl' contains only
    // simple IDLists. The explorer initializes *prgfInOut with a set of
    // flags to be evaluated. The shell folder may optimize the operation
    // by not returning unspecified flags.
    function GetAttributesOf(cidl: UINT;
                             apidl: PCUITEMID_CHILD_ARRAY;
                             rgfInOut: PSFGAOF): HRESULT; stdcall;

    // creates a UI object to be used for specified objects.
    // The shell explorer passes either IID_IDataObject (for transfer operation)
    // or IID_IContextMenu (for context menu operation) as riid
    // and many other interfaces
    function GetUIObjectOf(hwndOwner: HWND;
                           cidl: UINT;
                           apidl: PCUITEMID_CHILD_ARRAY;
                           const riid: TGUID;
                           rgfReserved: PUINT;
                           out ppv): HRESULT; stdcall;

    // returns the display name of the specified object.
    // If the ID contains the display name (in the locale character set),
    // it returns the offset to the name. Otherwise, it returns a pointer
    // to the display name string (UNICODE), which is allocated by the
    // task allocator, or fills in a buffer.
    // use the helper APIS StrRetToStr() or StrRetToBuf() to deal with the different
    // forms of the STRRET structure
    function GetDisplayNameOf(pidl: PCUITEMID_CHILD;
                              uFlags: SHGDNF;
                              out pName: STRRET): HRESULT; stdcall;

    // sets the display name of the specified object.
    // If it changes the ID as well, it returns the new ID which is
    // alocated by the task allocator.
    function SetNameOf(hwnd: HWND;
                       pidl: PCUITEMID_CHILD;
                       pszName: LPCWSTR;
                       uFlags: SHGDNF;
                       out ppidlOut: PITEMID_CHILD): HRESULT; stdcall;

  end;

  IID_IShellFolder = IShellFolder;


  // Record SMDATA
  // =============
  SMDATA = record
    dwMask: DWORD;
    dwFlags: DWORD;
    hmenu: HMENU;
    hwnd: HWND;
    uId: UINT;
    uIdParent: UINT;
    uIdAncestor: UINT;
    punk: PIUnknown;
    pidlFolder: PIDLIST_ABSOLUTE;
    pidlItem: PUITEMID_CHILD;
    psf: IShellFolder;
    pvUserData: Pointer;
  end;
  PSMDATA = ^SMDATA;
  LPSMDATA = PSMDATA;

  // Interface IEnumExtraSearch
  // ==========================
  //
  IEnumExtraSearch = interface(IUnknown)
    ['{0E700BE1-9DB6-11D1-A1CE-00C04FD75D13}']

    function Next(celt: ULONG;
                  rgelt: PEXTRASEARCH;
                  pceltFetched: PULONG): HRESULT; stdcall;

    function Skip(celt: ULONG): HRESULT; stdcall;

    function Reset(): HRESULT; stdcall;

    function Clone(out ppenum: IEnumExtraSearch): HRESULT; stdcall;
  end;

  IID_IEnumExtraSearch = IEnumExtraSearch;


  // Interface IShellFolder2
  // =======================
  //
  IShellFolder2 = interface(IShellFolder)
    ['{93F2F68C-1D1B-11D3-A30E-00C04F79ABD1}']

    // Returns the guid of the search that is to be invoked when user clicks on the search toolbar button
    function GetDefaultSearchGUID(out pguid: TGUID): HRESULT; stdcall;

    // gives an enumerator of the searches to be added to the search menu
    function EnumSearches(out ppenum: IEnumExtraSearch): HRESULT; stdcall;

    function GetDefaultColumn(dwRes: DWORD;
                              out pSort: ULONG;
                              out pDisplay: ULONG): HRESULT; stdcall;

    // return SHCOLSTATE_ values
    function GetDefaultColumnState(iColumn: UINT;
                                   out pcsFlags: SHCOLSTATEF): HRESULT; stdcall;

    // PCUITEMID_CHILD should have been annotated as [in].
    // Changing the annotation will break compatibility, but GetDetailsEx should never be called with a null pidl.
    function GetDetailsEx(pidl: PCUITEMID_CHILD;
                          const pscid: SHCOLUMNID;
                          out pv: VARIANT): HRESULT; stdcall;

    function GetDetailsOf(pidl: PCUITEMID_CHILD;
                          iColumn: UINT;
                          out psd: SHELLDETAILS): HRESULT; stdcall;

    function MapColumnToSCID(iColumn: UINT;
                             out pscid: SHCOLUMNID): HRESULT; stdcall;
  end;

  IID_IShellFolder2 = IShellFolder2;


  // Interface IShellView
  // ====================
  //
  IShellView = interface(IOleWindow)
    ['{000214E3-0000-0000-C000-000000000046}']

    function TranslateAccelerator(pmsg: PMSG): HRESULT; stdcall;

    function EnableModeless(fEnable: BOOL): HRESULT; stdcall;

    function UIActivate(uState: UINT): HRESULT; stdcall;

    function Refresh(): HRESULT; stdcall;

    function CreateViewWindow(psvPrevious: IShellView;
                              pfs: LPCFOLDERSETTINGS;
                              psb: IShellBrowser;
                              prcView: PRECT;
                              out phWnd: HWND): HRESULT; stdcall;

    function DestroyViewWindow(): HRESULT; stdcall;

    function GetCurrentInfo(pfs: LPFOLDERSETTINGS): HRESULT; stdcall;

    function AddPropertySheetPages(dwReserved: DWORD;
                                   pfn: LPFNSVADDPROPSHEETPAGE;
                                   lparam: LPARAM): HRESULT; stdcall;

    function SaveViewState(): HRESULT; stdcall;

    function SelectItem(pidlItem: PCUITEMID_CHILD;
                        uFlags: SVSIF): HRESULT; stdcall;

    function GetItemObject(uItem: UINT;
                           const riid: TGUID;
                           out ppv): HRESULT; stdcall;
  end;

  IID_IShellView = IShellView;


  // Interface IShellView2
  // =====================
  //
  IShellView2 = interface(IShellView)
    ['{88E39E80-3578-11CF-AE69-08002B2E1262}']

    function GetView(var pvid: SHELLVIEWID;
                     uView: ULONG): HRESULT; stdcall;

    function CreateViewWindow2(lpParams: LPSV2CVW2_PARAMS): HRESULT; stdcall;

    function HandleRename(pidlNew: PCUITEMID_CHILD): HRESULT; stdcall;

    function SelectAndPositionItem(pidlItem: PCUITEMID_CHILD;
                                   uFlags: UINT;
                                   ppt: PPOINT): HRESULT; stdcall;
  end;

  IID_IShellView2 = IShellView2;

  // Interface IFolderView
  // =====================
  //
  IFolderView = interface(IUnknown)
    ['{CDE725B0-CCC9-4519-917E-325D72FAB4CE}']

    function GetCurrentViewMode(out pViewMode: UINT): HRESULT; stdcall;

    function SetCurrentViewMode(ViewMode: UINT): HRESULT; stdcall;

    function GetFolder(const riid: REFIID;
                       out ppv: Pointer): HRESULT; stdcall;

    function Item(iItemIndex: Integer;
                  out ppidl: PITEMID_CHILD): HRESULT; stdcall;

    function ItemCount(uFlags: UINT;
                       out pcItems: int): HRESULT; stdcall;

    function Items(uFlags: UINT;
                   const riid: REFIID;
                   out ppv: Pointer): HRESULT; stdcall;

    function GetSelectionMarkedItem(out piItem: Integer): HRESULT; stdcall;

    function GetFocusedItem(out piItem: Integer): HRESULT; stdcall;

    function GetItemPosition(pidl: PCUITEMID_CHILD;
                             out ppt: POINT): HRESULT; stdcall;

    function GetSpacing(ppt: PPoint): HRESULT; stdcall;

    function GetDefaultSpacing(out ppt: POINT): HRESULT; stdcall;

    function GetAutoArrange(): HRESULT; stdcall;

    function SelectItem(iItem: Integer;
                        dwFlags: DWORD): HRESULT; stdcall;

    function SelectAndPositionItems(cidl: UINT;
                                    apidl: PCUITEMID_CHILD_ARRAY;
                                    apt: PPoint;
                                    dwFlags: DWORD): HRESULT; stdcall;
  end;

  IID_IFolderView = IFolderView;

  // Interface IFolderView2
  // ======================
  //
  IFolderView2 = interface(IFolderView)
    ['{1AF3A467-214F-4298-908E-06B03E0B39F9}']

    // Sets the group by property and starts a grouping operation
    function SetGroupBy(const key: PROPERTYKEY;
                        fAscending: BOOL): HRESULT; stdcall;

    function GetGroupBy(out pkey: PROPERTYKEY;
                        pfAscending: PBOOL): HRESULT; stdcall;


    // Setting and Getting per item view properties is not possible for Libraries or Search results views.
    // Consider using existing item properties instead.
    function SetViewProperty(pidl: PCUITEMID_CHILD;
                             const propkey: PROPERTYKEY;
                             const propvar: PROPVARIANT): HRESULT; stdcall;

    // Setting and Getting per item view properties is not possible for Libraries or Search results views.
    // Consider using existing item properties instead.
    function GetViewProperty(pidl: PCUITEMID_CHILD;
                             const propkey: PROPERTYKEY;
                             ppropvar: PPROPVARIANT): HRESULT; stdcall;

    // Setting per item Tile view properties is not possible for Libraries or Search results views.
    // Consider setting property lists for your item types instead (see PKEY_PropList_TileInfo)
    function SetTileViewProperties(pidl: PCUITEMID_CHILD;
                                   pszPropList: LPCWSTR): HRESULT; stdcall;

    // Setting per item Extended Tile view properties is not possible for Libraries or Search results views.
    // Consider setting property lists for your item types instead (see PKEY_PropList_ExtendedTileInfo)
    function SetExtendedTileViewProperties(pidl: PCUITEMID_CHILD;
                                           pszPropList: LPCWSTR): HRESULT; stdcall;

    function SetText(iType: FVTEXTTYPE;
                     pwszText: LPCWSTR): HRESULT; stdcall;

    function SetCurrentFolderFlags(dwMask: DWORD;
                                   dwFlags: DWORD): HRESULT; stdcall;

    function GetCurrentFolderFlags(out pdwFlags: DWORD): HRESULT; stdcall;

    function GetSortColumnCount(out pcColumns: Integer): HRESULT; stdcall;

    // Sets the sort by property and starts a sort operation
    function SetSortColumns(rgSortColumns: PSORTCOLUMN;
                            cColumns: Integer): HRESULT; stdcall;

    function GetSortColumns(rgSortColumns: PSORTCOLUMN;
                            cColumns: Integer): HRESULT; stdcall;

    // return IShellItem for an item based on its index
    function GetItem(iItem: Integer;
                     const riid: TGUID;
                     out ppv): HRESULT; stdcall;

    function GetVisibleItem(iStart: Integer;
                            fPrevious: BOOL;
                            out piItem: Integer): HRESULT; stdcall;

    function GetSelectedItem(iStart: Integer;
                             out piItem: Integer): HRESULT; stdcall;

    function GetSelection(fNoneImpliesFolder: BOOL;
                          out ppsia: IShellItemArray): HRESULT; stdcall;

    // Gets the selection state including check state.  Same as the flags for IFolderView::SelectAndPositionItems
    function GetSelectionState(pidl: PCUITEMID_CHILD;
                               out pdwFlags: DWORD): HRESULT; stdcall;

    // If pszVerb is NULL, then the default verb is invoked.
    function InvokeVerbOnSelection(pszVerb: LPCSTR): HRESULT; stdcall;

    // Sets default icon size if iImageSize == -1
    function SetViewModeAndIconSize(uViewMode: FOLDERVIEWMODE;
                                    iImageSize: Integer): HRESULT; stdcall;

    function GetViewModeAndIconSize(out puViewMode: FOLDERVIEWMODE;
                                    out piImageSize: Integer): HRESULT; stdcall;

    function SetGroupSubsetCount(cVisibleRows: UINT): HRESULT; stdcall;

    function GetGroupSubsetCount(out pcVisibleRows: UINT): HRESULT; stdcall;

    function SetRedraw(fRedrawOn: BOOL): HRESULT; stdcall;

    // S_OK means this view sourced the current drag drop or cut/paste operation (used by drop target objects)
    function IsMoveInSameFolder(): HRESULT; stdcall;

    function DoRename(): HRESULT; stdcall;
  end;

  IID_IFolderView2 = IFolderView2;

  // Interface IFolderViewSettings
  // =============================
  //
  IFolderViewSettings = interface(IUnknown)
    ['{AE8C987D-8797-4ED3-BE72-2A47DD938DB0}']

    // GetColumnPropertyList - returns IPropertyDescriptionList.  Ordered list of columns that must correspond to column enumerated
    // via ISF::GetDetailsOf. Any column from ISF::GetDetailsOf not included in this list will be marked SHCOLSTATE_SECONDARYUI
    // (or maintain SHCOLSTATE_HIDDEN)
    function GetColumnPropertyList(const riid: TGUID;
                                   out ppv): HRESULT; stdcall;

    function GetGroupByProperty(out pkey: PROPERTYKEY;
                                out pfGroupAscending: BOOL): HRESULT; stdcall;

    function GetViewMode(out plvm: FOLDERLOGICALVIEWMODE): HRESULT; stdcall;

    function GetIconSize(out puIconSize: UINT): HRESULT; stdcall;

    function GetFolderFlags(out pfolderMask: FOLDERFLAGS;
                            out pfolderFlags: FOLDERFLAGS): HRESULT; stdcall;

    function GetSortColumns(rgSortColumns: PSORTCOLUMN;
                            cColumnsIn: UINT;
                            out pcColumnsOut: UINT): HRESULT; stdcall;

    function GetGroupSubsetCount(out pcVisibleRows: UINT): HRESULT; stdcall;
  end;

  IID_IFolderViewSettings = IFolderViewSettings;


  // Interface IInitializeNetworkFolder
  // ==================================
  //
  IInitializeNetworkFolder = interface(IUnknown)
    ['{6E0F9881-42A8-4F2A-97F8-8AF4E026D92D}']

    function Initialize(pidl: PCIDLIST_ABSOLUTE;
                        pidlTarget: PCIDLIST_ABSOLUTE;
                        uDisplayType: UINT;
                        pszResName: LPCWSTR;
                        pszProvider: LPCWSTR): HRESULT; stdcall;
  end;

  IID_IInitializeNetworkFolder = IInitializeNetworkFolder;



  // Interface INetworkFolderInternal
  // =================================
  //
  INetworkFolderInternal = interface(IUnknown)
    ['{CEB38218-C971-47BB-A703-F0BC99CCDB81}']

    function GetResourceDisplayType(out displayType: UINT): HRESULT; stdcall;

    function GetIDList(out idList: PIDLIST_ABSOLUTE): HRESULT; stdcall;

    function GetProvider(itemIdCount: UINT;
                         itemIds: PCUITEMID_CHILD_ARRAY;
                         providerMaxLength: UINT;
                         provider: LPWSTR): HRESULT; stdcall;
  end;

  IID_INetworkFolderInternal = INetworkFolderInternal;


  // Interface IPreviewHandlerVisuals
  // ================================
  //
  IPreviewHandlerVisuals = interface(IUnknown)
    ['{196BF9A5-B346-4EF0-AA1E-5DCDB76768B1}']

    function SetBackgroundColor(color: COLORREF): HRESULT; stdcall;

    function SetFont(plf: PLOGFONTW): HRESULT; stdcall;

    function SetTextColor(color: COLORREF): HRESULT; stdcall;
  end;

  IID_IPreviewHandlerVisuals = IPreviewHandlerVisuals;


  // Interface ICommDlgBrowser
  // =========================
  //
  ICommDlgBrowser = interface(IUnknown)
    ['{000214F1-0000-0000-C000-000000000046}']

    function OnDefaultCommand(ppshv: IShellView): HRESULT; stdcall;

    function OnStateChange(ppshv: IShellView;
                           uChange: ULONG): HRESULT; stdcall;

    function IncludeObject(ppshv: IShellView;
                           pidl: PCUITEMID_CHILD): HRESULT; stdcall;
  end;

  IID_ICommDlgBrowser = ICommDlgBrowser;


  // Interface ICommDlgBrowser2
  // ==========================
  //
  ICommDlgBrowser2 = interface(ICommDlgBrowser)
    ['{10339516-2894-11D2-9039-00C04F8EEB3E}']

    function Notify(ppshv: IShellView;
                    dwNotifyType: DWORD): HRESULT; stdcall;

    function GetDefaultMenuText(ppshv: IShellView;
                                pszText: LPWSTR;
                                cchMax: Integer): HRESULT; stdcall;

    function GetViewFlags(out pdwFlags: DWORD): HRESULT; stdcall;
  end;

  IID_ICommDlgBrowser2 = ICommDlgBrowser2;


  // Interface IColumnManager
  // ========================
  // IColumnManager is an interfaced provided by defview to
  // allow the manipulation of columns in details view.
  IColumnManager = interface(IUnknown)
    ['{D8EC27BB-3F3B-4042-B10A-4ACFD924D453}']

    // NOTE: These methods only accept physical pixel values.
    function SetColumnInfo(const propkey: PROPERTYKEY;
                           const pcmci: CM_COLUMNINFO): HRESULT; stdcall;

    function GetColumnInfo(const propkey: PROPERTYKEY;
                           pcmci: PCM_COLUMNINFO): HRESULT; stdcall;

    function GetColumnCount(dwFlags: CM_ENUM_FLAGS;
                            out puCount: UINT): HRESULT; stdcall;

    function GetColumns(dwFlags: CM_ENUM_FLAGS;
                        rgkeyOrder: PPROPERTYKEY;
                        cColumns: UINT): HRESULT; stdcall;

    function SetColumns(rgkeyOrder: PPROPERTYKEY;
                        cVisible: UINT): HRESULT; stdcall;
  end;

  IID_IColumnManager = IColumnManager;


  // Interface IFolderFilterSite
  // ===========================
  //
  IFolderFilterSite = interface(IUnknown)
    ['{C0A651F5-B48B-11D2-B5ED-006097C686F6}']

    function SetFilter(punk: IUnknown): HRESULT; stdcall;
  end;

  IID_IFolderFilterSite = IFolderFilterSite;


  // Interface IFolderFilter
  // =======================
  //
  IFolderFilter = interface(IUnknown)
    ['{9CC22886-DC8E-11D2-B1D0-00C04F8EEB3E}']

    function ShouldShow(psf: IShellFolder;
                        pidlFolder: PCIDLIST_ABSOLUTE;
                        pidlItem: PCUITEMID_CHILD): HRESULT; stdcall;

    function GetEnumFlags(psf: IShellFolder;
                          pidlFolder: PCIDLIST_ABSOLUTE;
                          out phwnd: HWND;
                          pgrfFlags: PDWORD): HRESULT; stdcall;
  end;

  IID_IFolderFilter = IFolderFilter;


  // Interface IInputObjectSite
  // ==========================
  //
  IInputObjectSite = interface(IUnknown)
    ['{F1DB8392-7331-11D0-8C99-00A0C92DBFE8}']

    function OnFocusChangeIS(punkObj: IUnknown;
                             fSetFocus: BOOL): HRESULT; stdcall;

  end;

  IID_IInputObjectSite = IInputObjectSite;


  // Interface IInputObject
  // ======================
  //
  IInputObject = interface(IUnknown)
    ['{68284FAA-6A48-11D0-8C78-00C04FD918B4}']

    // Activates or deactivates the object. lpMsg may be NULL.
    // Returns S_OK if the activation succeeded.
    function UIActivateIO(fActivate: BOOL;
                          pMsg: PMSG): HRESULT; stdcall;

    // Returns S_OK if the object has the focus, S_FALSE if not.
    function HasFocusIO(): HRESULT; stdcall;

    // Allow the object to process the message.
    // Returns S_OK if the message was processed (eaten).
    function TranslateAcceleratorIO(pMsg: PMSG): HRESULT; stdcall;
  end;

  IID_IInputObject = IInputObject;


  // Interface IInputObject2
  // =======================
  //
  IInputObject2 = interface(IInputObject)
    ['{6915C085-510B-44CD-94AF-28DFA56CF92B}']

    function TranslateAcceleratorGlobal(pMsg: PMSG): HRESULT; stdcall;
  end;

  IID_IInputObject2 = IInputObject2;


  // Interface IShellIcon
  // ====================
  //
  IShellIcon = interface(IUnknown)
    ['{000214E5-0000-0000-C000-000000000046}']

    function GetIconOf(pidl: PCUITEMID_CHILD;
                       flags: UINT;
                       out pIconIndex: int): HRESULT; stdcall;
  end;

  IID_IShellIcon = IShellIcon;


  // Interface IShellBrowser
  // =======================
  //
  IShellBrowser = interface(IOleWindow)
    ['{000214E2-0000-0000-C000-000000000046}']

    // same as IOleInPlaceFrame
    function InsertMenusSB(hmenuShared: HMENU;
                           lpMenuWidths: POLEMENUGROUPWIDTHS): HRESULT; stdcall;

    function SetMenuSB(hmenuShared: HMENU;
                       holemenuRes: HOLEMENU;
                       hwndActiveObject: HWND): HRESULT; stdcall;

    function RemoveMenusSB(hmenuShared: HMENU): HRESULT; stdcall;

    function SetStatusTextSB(pszStatusText: LPCWSTR): HRESULT; stdcall;

    function EnableModelessSB(fEnable: BOOL): HRESULT; stdcall;

    function TranslateAcceleratorSB(pmsg: PMSG;
                                    wID: WORD): HRESULT; stdcall;

    // IShellBrowser
    function BrowseObject(pidl: PCUIDLIST_RELATIVE;
                          wFlags: UINT): HRESULT; stdcall;

    function GetViewStateStream(grfMode: DWORD;
                                out ppStrm: IStream): HRESULT; stdcall;

    function GetControlWindow(id: UINT;
                              out phwnd: HWND): HRESULT; stdcall;

    function SendControlMsg(id: UINT;
                            uMsg: UINT;
                            wParam: WPARAM;
                            lParam: LPARAM;
                            pret: PLRESULT): HRESULT; stdcall;

    function QueryActiveShellView(out ppshv: IShellView): HRESULT; stdcall;

    function OnViewWindowActive(pshv: IShellView): HRESULT; stdcall;

    function SetToolbarItems(lpButtons: LPTBBUTTONSB;
                             nButtons: UINT;
                             uFlags: UINT): HRESULT; stdcall;
  end;

  IID_IShellBrowser = IShellBrowser;


  // Interface IProfferService
  // =========================
  //
  IProfferService = interface(IUnknown)
    ['{CB728B20-F786-11CE-92AD-00AA00A74CD0}']

    function ProfferService(const serviceId: REFGUID;
                            serviceProvider: IServiceProvider;
                            out cookie: DWORD): HRESULT; stdcall;

    function RevokeService(cookie: DWORD): HRESULT; stdcall;
  end;

  IID_IProfferService = IProfferService;


  // Interface IGetServiceIds
  // ========================
  //
  IGetServiceIds = interface(IUnknown)
    ['{4A073526-6103-4E21-B7BC-F519D1524E5D}']

    function GetServiceIds(out serviceIdCount: ULONG;
                           out serviceIds: PGUID): HRESULT; stdcall;
  end;

  IID_IGetServiceIds = IGetServiceIds;


  // Interface IShellItem
  // ====================
  //
  IShellItem = interface(IUnknown)
    ['{43826D1E-E718-42EE-BC55-A1E261C37BFE}']

    function BindToHandler(pbc: IBindCtx;
                           const bhid: TGUID;
                           const riid: TGUID;
                           out ppv): HRESULT; stdcall;

    function GetParent(out ppsi: IShellItem): HRESULT; stdcall;

    function GetDisplayName(sigdnName: SIGDN;
                            out ppszName: LPWSTR): HRESULT; stdcall;

    function GetAttributes(sfgaoMask: SFGAOF;
                           out psfgaoAttribs: SFGAOF): HRESULT; stdcall;

    function Compare(psi: IShellItem;
                     hint: SICHINTF;
                     out piOrder: Integer): HRESULT; stdcall;
  end;

  IID_IShellItem = IShellItem;


  // Interface IShellItem2
  // =====================
  //
  IShellItem2 = interface(IShellItem)
    ['{7E9FB0D3-919F-4307-AB2E-9B1860310C93}']

    function GetPropertyStore(flags: GETPROPERTYSTOREFLAGS;
                              const riid: TGUID;
                              out ppv): HRESULT; stdcall;

    function GetPropertyStoreWithCreateObject(flags: GETPROPERTYSTOREFLAGS;
                                              punkCreateObject: IUnknown;
                                              const riid: TGUID;
                                              out ppv): HRESULT; stdcall;

    function GetPropertyStoreForKeys(rgKeys: PPROPERTYKEY;
                                     cKeys: UINT;
                                     flags: GETPROPERTYSTOREFLAGS;
                                     const riid: TGUID;
                                     out ppv): HRESULT; stdcall;

    function GetPropertyDescriptionList(const keyType: PROPERTYKEY;
                                        const riid: TGUID;
                                        out ppv): HRESULT; stdcall;

    function Update(pbc: IBindCtx): HRESULT; stdcall;

    function GetProperty(const key: PROPERTYKEY;
                         out ppropvar: PROPVARIANT): HRESULT; stdcall;

    function GetCLSID(const key: PROPERTYKEY;
                      out pclsid: CLSID): HRESULT; stdcall;

    function GetFileTime(const key: PROPERTYKEY;
                         out pft: FILETIME): HRESULT; stdcall;

    function GetInt32(const key: PROPERTYKEY;
                      out pi: Integer): HRESULT; stdcall;

    function GetString(const key: PROPERTYKEY;
                       out ppsz: LPWSTR): HRESULT; stdcall;

    function GetUInt32(const key: PROPERTYKEY;
                       out pui: ULONG): HRESULT; stdcall;

    function GetUInt64(const key: PROPERTYKEY;
                       out pull: ULONGLONG): HRESULT; stdcall;

    function GetBool(const key: PROPERTYKEY;
                     out pf: BOOL): HRESULT; stdcall;
  end;

  IID_IShellItem2 = IShellItem2;


  // Interface IShellItemImageFactory
  // ================================
  //
  IShellItemImageFactory = interface(IUnknown)
    ['{BCC18B79-BA16-442F-80C4-8A59C30C463B}']

    function GetImage(size: SIZE;
                      flags: SIIGBF;
                      out phbm: HBITMAP): HRESULT; stdcall;
  end;

  IID_IShellItemImageFactory = IShellItemImageFactory;


  // Interface IEnumShellItems
  // =========================
  //
  IEnumShellItems = interface(IUnknown)
    ['{70629033-E363-4A28-A567-0DB78006E6D7}']

    function Next(celt: ULONG;
                  rgelt: PIShellItem;
                  pceltFetched: PULONG): HRESULT; stdcall;

    function Skip(celt: ULONG): HRESULT; stdcall;

    function Reset(): HRESULT; stdcall;

    function Clone(out ppenum: IEnumShellItems): HRESULT; stdcall;
  end;

  IID_IEnumShellItems = IEnumShellItems;


  // Interface ITransferAdviseSink
  // =============================
  //
  ITransferAdviseSink = interface(IUnknown)
    ['{D594D0D8-8DA7-457B-B3B4-CE5DBAAC0B88}']

    function UpdateProgress(ullSizeCurrent: ULONGLONG;
                            ullSizeTotal: ULONGLONG;
                            nFilesCurrent: Integer;
                            nFilesTotal: Integer;
                            nFoldersCurrent: Integer;
                            nFoldersTotal: Integer): HRESULT; stdcall;

    function UpdateTransferState(ts: TRANSFER_ADVISE_STATE): HRESULT; stdcall;

    function ConfirmOverwrite(psiSource: IShellItem;
                              psiDestParent: IShellItem;
                              pszName: LPCWSTR): HRESULT; stdcall;

    function ConfirmEncryptionLoss(psiSource: IShellItem): HRESULT; stdcall;

    function FileFailure(psi: IShellItem;
                         pszItem: LPCWSTR;
                         hrError: HRESULT;
                         pszRename: LPWSTR;
                         cchRename: ULONG): HRESULT; stdcall;

    function SubStreamFailure(psi: IShellItem;
                              pszStreamName: LPCWSTR;
                              hrError: HRESULT): HRESULT; stdcall;

    function PropertyFailure(psi: IShellItem;
                             const pkey: PROPERTYKEY;
                             hrError: HRESULT): HRESULT; stdcall;
  end;

  IID_ITransferAdviseSink = ITransferAdviseSink;


  // Interface ITransferSource
  // =========================
  //
  ITransferSource = interface(IUnknown)
    ['{00ADB003-BDE9-45C6-8E29-D09F9353E108}']

    function Advise(psink: ITransferAdviseSink;
                    out pdwCookie: DWORD): HRESULT; stdcall;

    function Unadvise(dwCookie: DWORD): HRESULT; stdcall;

    function SetProperties(pproparray: IPropertyChangeArray): HRESULT; stdcall;

    function OpenItem(psi: IShellItem;
                      flags: TRANSFER_SOURCE_FLAGS;
                      const riid: TGUID;
                      out ppv): HRESULT; stdcall;

    function MoveItem(psi: IShellItem;
                      psiParentDst: IShellItem;
                      pszNameDst: LPCWSTR;
                      flags: TRANSFER_SOURCE_FLAGS;
                      out ppsiNew: IShellItem): HRESULT; stdcall;

    function RecycleItem(psiSource: IShellItem;
                         psiParentDest: IShellItem;
                         flags: TRANSFER_SOURCE_FLAGS;
                         out ppsiNewDest: IShellItem): HRESULT; stdcall;

    function RemoveItem(psiSource: IShellItem;
                        flags: TRANSFER_SOURCE_FLAGS): HRESULT; stdcall;

    function RenameItem(psiSource: IShellItem;
                        pszNewName: LPCWSTR;
                        flags: TRANSFER_SOURCE_FLAGS;
                        out ppsiNewDest: IShellItem): HRESULT; stdcall;

    function LinkItem(psiSource: IShellItem;
                      psiParentDest: IShellItem;
                      pszNewName: LPCWSTR;
                      flags: TRANSFER_SOURCE_FLAGS;
                      out ppsiNewDest: IShellItem): HRESULT; stdcall;

    function ApplyPropertiesToItem(psiSource: IShellItem;
                                   out ppsiNew: IShellItem): HRESULT; stdcall;

    function GetDefaultDestinationName(psiSource: IShellItem;
                                       psiParentDest: IShellItem;
                                       out ppszDestinationName: LPWSTR): HRESULT; stdcall;

    function EnterFolder(psiChildFolderDest: IShellItem): HRESULT; stdcall;

    function LeaveFolder(psiChildFolderDest: IShellItem): HRESULT; stdcall;
  end;

  IID_ITransferSource = ITransferSource;

  // Interface IEnumResources
  // ========================
  //
  IEnumResources = interface(IUnknown)
    ['{2DD81FE3-A83C-4DA9-A330-47249D345BA1}']

    function Next(celt: ULONG;
                  psir: PSHELL_ITEM_RESOURCE;
                  pceltFetched: PULONG): HRESULT; stdcall;

    function Skip(celt: ULONG): HRESULT; stdcall;

    function Reset(): HRESULT; stdcall;

    function Clone(out ppenumr: IEnumResources): HRESULT; stdcall;
  end;

  IID_IEnumResources = IEnumResources;


  // Interface IShellItemResources
  // =============================
  //
  IShellItemResources = interface(IUnknown)
    ['{FF5693BE-2CE0-4D48-B5C5-40817D1ACDB9}']

    function GetAttributes(out pdwAttributes: DWORD): HRESULT; stdcall;

    function GetSize(out pullSize: ULONGLONG): HRESULT; stdcall;

    function GetTimes(out pftCreation: FILETIME;
                      out pftWrite: FILETIME;
                      out pftAccess: FILETIME): HRESULT; stdcall;

    function SetTimes(const pftCreation: PFILETIME;
                      const pftWrite: PFILETIME;
                      const pftAccess: PFILETIME): HRESULT; stdcall;

    function GetResourceDescription(const pcsir: PSHELL_ITEM_RESOURCE;
                                    out ppszDescription: LPWSTR): HRESULT; stdcall;

    function EnumResources(out ppenumr: IEnumResources): HRESULT; stdcall;

    function SupportsResource(const pcsir: PSHELL_ITEM_RESOURCE): HRESULT; stdcall;

    function OpenResource(const pcsir: PSHELL_ITEM_RESOURCE;
                          const riid: TGUID;
                          out ppv): HRESULT; stdcall;

    function CreateResource(const pcsir: PSHELL_ITEM_RESOURCE;
                            const riid: TGUID;
                            out ppv): HRESULT; stdcall;

    function MarkForDelete(): HRESULT; stdcall;
  end;

  IID_IShellItemResources = IShellItemResources;


  // Interface ITransferDestination
  // ==============================
  //
  ITransferDestination = interface(IUnknown)
    ['{48ADDD32-3CA5-4124-ABE3-B5A72531B207}']

    function Advise(psink: ITransferAdviseSink;
                    out pdwCookie: DWORD): HRESULT; stdcall;

    function Unadvise(dwCookie: DWORD): HRESULT; stdcall;

    function CreateItem(pszName: LPCWSTR;
                        dwAttributes: DWORD;
                        ullSize: ULONGLONG;
                        flags: TRANSFER_SOURCE_FLAGS;
                        const riidItem: TGUID;
                        out ppvItem;
                        const riidResources: TGUID;
                        out ppvResources): HRESULT; stdcall;
  end;

  IID_ITransferDestination = ITransferDestination;


  // Interface IFileOperationProgressSink
  // ====================================
  //
  IFileOperationProgressSink = interface(IUnknown)
    ['{04B0F1A7-9490-44BC-96E1-4296A31252E2}']

    function StartOperations(): HRESULT; stdcall;

    function FinishOperations(hrResult: HRESULT): HRESULT; stdcall;

    function PreRenameItem(dwFlags: DWORD;
                           psiItem: IShellItem;
                           pszNewName: LPCWSTR): HRESULT; stdcall;

    function PostRenameItem(dwFlags: DWORD;
                            psiItem: IShellItem;
                            pszNewName: LPCWSTR;
                            hrRename: HRESULT;
                            psiNewlyCreated: IShellItem): HRESULT; stdcall;

    function PreMoveItem(dwFlags: DWORD;
                         psiItem: IShellItem;
                         psiDestinationFolder: IShellItem;
                         pszNewName: LPCWSTR): HRESULT; stdcall;

    function PostMoveItem(dwFlags: DWORD;
                          psiItem: IShellItem;
                          psiDestinationFolder: IShellItem;
                          pszNewName: LPCWSTR;
                          hrMove: HRESULT;
                          psiNewlyCreated: IShellItem): HRESULT; stdcall;

    function PreCopyItem(dwFlags: DWORD;
                         psiItem: IShellItem;
                         psiDestinationFolder: IShellItem;
                         pszNewName: LPCWSTR): HRESULT; stdcall;

    function PostCopyItem(dwFlags: DWORD;
                          psiItem: IShellItem;
                          psiDestinationFolder: IShellItem;
                          pszNewName: LPCWSTR;
                          hrCopy: HRESULT;
                          psiNewlyCreated: IShellItem): HRESULT; stdcall;

    function PreDeleteItem(dwFlags: DWORD;
                           psiItem: IShellItem): HRESULT; stdcall;

    function PostDeleteItem(dwFlags: DWORD;
                            psiItem: IShellItem;
                            hrDelete: HRESULT;
                            psiNewlyCreated: IShellItem): HRESULT; stdcall;

    function PreNewItem(dwFlags: DWORD;
                        psiDestinationFolder: IShellItem;
                        pszNewName: LPCWSTR): HRESULT; stdcall;

    function PostNewItem(dwFlags: DWORD;
                         psiDestinationFolder: IShellItem;
                         pszNewName: LPCWSTR;
                         pszTemplateName: LPCWSTR;
                         dwFileAttributes: DWORD;
                         hrNew: HRESULT;
                         psiNewItem: IShellItem): HRESULT; stdcall;

    function UpdateProgress(iWorkTotal: UINT;
                            iWorkSoFar: UINT): HRESULT; stdcall;

    function ResetTimer(): HRESULT; stdcall;

    function PauseTimer(): HRESULT; stdcall;

    function ResumeTimer(): HRESULT; stdcall;
  end;

  IID_IFileOperationProgressSink = IFileOperationProgressSink;


  // Interface IShellItemArray
  // =========================
  //
  IShellItemArray = interface(IUnknown)
    ['{B63EA76D-1F85-456F-A19C-48159EFA858B}']

    function BindToHandler(pbc: IBindCtx;
                           const bhid: TGUID;
                           const riid: TGUID;
                           out ppvOut): HRESULT; stdcall;

    function GetPropertyStore(flags: GETPROPERTYSTOREFLAGS;
                              const riid: TGUID;
                              out ppv): HRESULT; stdcall;

    function GetPropertyDescriptionList(const keyType: PROPERTYKEY;
                                        const riid: TGUID;
                                        out ppv): HRESULT; stdcall;

    function GetAttributes(AttribFlags: SIATTRIBFLAGS;
                           sfgaoMask: SFGAOF;
                           out psfgaoAttribs: SFGAOF): HRESULT; stdcall;

    function GetCount(out pdwNumItems: DWORD): HRESULT; stdcall;

    function GetItemAt(dwIndex: DWORD;
                       out ppsi: IShellItem): HRESULT; stdcall;

    function EnumItems(out ppenumShellItems: IEnumShellItems): HRESULT; stdcall;
  end;

  IID_IShellItemArray = IShellItemArray;


  // Interface IInitializeWithItem
  // =============================
  //
  IInitializeWithItem = interface(IUnknown)
    ['{7F73BE3F-FB79-493C-A6C7-7EE14E245841}']

    function Initialize(psi: IShellItem;
                        grfMode: DWORD): HRESULT; stdcall;
  end;

  IID_IInitializeWithItem = IInitializeWithItem;


  // Interface IObjectWithSelection
  // ==============================
  //
  IObjectWithSelection = interface(IUnknown)
    ['{1C9CD5BB-98E9-4491-A60F-31AACC72B83C}']

    function SetSelection(psia: IShellItemArray): HRESULT; stdcall;

    function GetSelection(const riid: REFIID;
                          out ppv): HRESULT; stdcall;
  end;

  IID_IObjectWithSelection = IObjectWithSelection;


  // Interface IObjectWithBackReferences
  // ===================================
  //
  IObjectWithBackReferences = interface(IUnknown)
    ['{321A6A6A-D61F-4BF3-97AE-14BE2986BB36}']

    function RemoveBackReferences(): HRESULT; stdcall;
  end;

  IID_IObjectWithBackReferences = IObjectWithBackReferences;


  // Interface IPropertyUI
  // =====================
  //
  IPropertyUI = interface(IUnknown)
    ['{757A7D9F-919A-4118-99D7-DBB208C8CC66}']

    function ParsePropertyName(pszName: LPCWSTR;
                               out pfmtid: FMTID;
                               out ppid: PROPID;
                               pchEaten: PULONG): HRESULT; stdcall;

    function GetCannonicalName(const fmtid: FMTID;
                               pid: PROPID;
                               pwszText: LPWSTR;
                               cchText: DWORD): HRESULT; stdcall;

    function GetDisplayName(const fmtid: FMTID;
                            pid: PROPID;
                            flags: PROPERTYUI_NAME_FLAGS;
                            pwszText: LPWSTR;
                            cchText: DWORD): HRESULT; stdcall;

    function GetPropertyDescription(const fmtid: FMTID;
                                    pid: PROPID;
                                    pwszText: LPWSTR;
                                    cchText: DWORD): HRESULT; stdcall;

    function GetDefaultWidth(const fmtid: FMTID;
                             pid: PROPID;
                             out pcxChars: ULONG): HRESULT; stdcall;

    function GetFlags(const fmtid: FMTID;
                      pid: PROPID;
                      out pflags: PROPERTYUI_FLAGS): HRESULT; stdcall;

    function FormatForDisplay(const fmtid: FMTID;
                              pid: PROPID;
                              const ppropvar: PPROPVARIANT;
                              puiff: PROPERTYUI_FORMAT_FLAGS;
                              pwszText: LPWSTR;
                              cchText: DWORD): HRESULT; stdcall;

    function GetHelpInfo(const fmtid: FMTID;
                         pid: PROPID;
                         pwszHelpFile: LPWSTR;
                         cch: DWORD;
                         out puHelpID: UINT): HRESULT; stdcall;
  end;

  IID_IPropertyUI = IPropertyUI;


  // Interface ICategoryProvider
  // ===========================
  //
  ICategoryProvider = interface(IUnknown)
    ['{9AF64809-5864-4C26-A720-C1F78C086EE3}']

    function CanCategorizeOnSCID(const pscid: PSHCOLUMNID): HRESULT; stdcall;

    function GetDefaultCategory(out pguid: TGUID;
                                out pscid: SHCOLUMNID): HRESULT; stdcall;

    function GetCategoryForSCID(const pscid: PSHCOLUMNID;
                                out pguid: TGUID): HRESULT; stdcall;

    function EnumCategories(out penum: IEnumGUID): HRESULT; stdcall;

    function GetCategoryName(const pguid: PGUID;
                             pszName: LPWSTR;
                             cch: UINT): HRESULT; stdcall;

    function CreateCategory(const pguid: PGUID;
                            const riid: TGUID;
                            out ppv): HRESULT; stdcall;
  end;

  IID_ICategoryProvider = ICategoryProvider;


  // Interface ICategorizer
  // ======================
  //
  ICategorizer = interface(IUnknown)
    ['{A3B14589-9174-49A8-89A3-06A1AE2B9BA7}']

    function GetDescription(pszDesc: LPWSTR;
                            cch: UINT): HRESULT; stdcall;

    function GetCategory(cidl: UINT;
                         apidl: PCUITEMID_CHILD_ARRAY;
                         rgCategoryIds: PDWORD): HRESULT; stdcall;

    function GetCategoryInfo(dwCategoryId: DWORD;
                             out pci: CATEGORY_INFO): HRESULT; stdcall;

    function CompareCategory(csfFlags: CATSORT_FLAGS;
                             dwCategoryId1: DWORD;
                             dwCategoryId2: DWORD): HRESULT; stdcall;
  end;

  IID_ICategorizer = ICategorizer;


  // Interface IDropTargetHelper
  // ===========================
  //
  IDropTargetHelper = interface(IUnknown)
    ['{4657278B-411B-11D2-839A-00C04FD918D0}']

    function DragEnter(hwndTarget: HWND;
                       pDataObject: IDataObject;
                       ppt: PPOINT;
                       dwEffect: DWORD): HRESULT; stdcall;

    function DragLeave(): HRESULT; stdcall;

    function DragOver(ppt: PPOINT;
                      dwEffect: DWORD): HRESULT; stdcall;

    function Drop(pDataObject: IDataObject;
                  ppt: PPOINT;
                  dwEffect: DWORD): HRESULT; stdcall;

    function Show(fShow: BOOL): HRESULT; stdcall;
  end;

  IID_IDropTargetHelper = IDropTargetHelper;


  // Interface IDragSourceHelper
  // ==========================
  //
  IDragSourceHelper = interface(IUnknown)
    ['{DE5BF786-477A-11D2-839D-00C04FD918D0}']

    function InitializeFromBitmap(pshdi: LPSHDRAGIMAGE;
                                  pDataObject: IDataObject): HRESULT; stdcall;

    function InitializeFromWindow(hwnd: HWND;
                                  ppt: PPOINT;
                                  pDataObject: IDataObject): HRESULT; stdcall;
  end;

  IID_IDragSourceHelper = IDragSourceHelper;


  // Interface IShellLinkA
  // =====================
  //
  IShellLinkA = interface(IUnknown)
    ['{000214EE-0000-0000-C000-000000000046}']

    function GetPath(pszFile: LPSTR;
                     cch: Integer;
                     pfd: PWIN32_FIND_DATAA;
                     fFlags: DWORD): HRESULT; stdcall;

    function GetIDList(out ppidl: PIDLIST_ABSOLUTE): HRESULT; stdcall;

    function SetIDList(pidl: PCIDLIST_ABSOLUTE): HRESULT; stdcall;

    function GetDescription(pszName: LPSTR;
                            cch: Integer): HRESULT; stdcall;

    function SetDescription(pszName: LPCSTR): HRESULT; stdcall;

    function GetWorkingDirectory(pszDir: LPSTR;
                                 cch: Integer): HRESULT; stdcall;

    function SetWorkingDirectory(pszDir: LPCSTR): HRESULT; stdcall;

    function GetArguments(pszArgs: LPSTR;
                          cch: Integer): HRESULT; stdcall;

    function SetArguments(pszArgs: LPCSTR): HRESULT; stdcall;

    function GetHotkey(out pwHotkey: WORD): HRESULT; stdcall;

    function SetHotkey(wHotkey: WORD): HRESULT; stdcall;

    function GetShowCmd(out piShowCmd: Integer): HRESULT; stdcall;

    function SetShowCmd(iShowCmd: Integer): HRESULT; stdcall;

    function GetIconLocation(pszIconPath: LPSTR;
                             cch: Integer;
                             out piIcon: Integer): HRESULT; stdcall;

    function SetIconLocation(pszIconPath: LPCSTR;
                             iIcon: Integer): HRESULT; stdcall;

    function SetRelativePath(pszPathRel: LPCSTR;
                             dwReserved: DWORD): HRESULT; stdcall;

    function Resolve(hwnd: HWND;
                     fFlags: DWORD): HRESULT; stdcall;

    function SetPath(pszFile: LPCSTR): HRESULT; stdcall;
  end;

  IID_IShellLinkA = IShellLinkA;


  // Interface IShellLinkW
  // =====================
  //
  IShellLinkW = interface(IUnknown)
    ['{000214F9-0000-0000-C000-000000000046}']

    function GetPath(pszFile: LPWSTR;
                     cch: Integer;
                     pfd: PWIN32_FIND_DATAW;
                     fFlags: DWORD): HRESULT; stdcall;

    function GetIDList(out ppidl: PIDLIST_ABSOLUTE): HRESULT; stdcall;

    function SetIDList(pidl: PCIDLIST_ABSOLUTE): HRESULT; stdcall;

    function GetDescription(pszName: LPWSTR;
                            cch: Integer): HRESULT; stdcall;

    function SetDescription(pszName: LPCWSTR): HRESULT; stdcall;

    function GetWorkingDirectory(pszDir: LPWSTR;
                                 cch: Integer): HRESULT; stdcall;

    function SetWorkingDirectory(pszDir: LPCWSTR): HRESULT; stdcall;

    function GetArguments(pszArgs: LPWSTR;
                          cch: Integer): HRESULT; stdcall;

    function SetArguments(pszArgs: LPCWSTR): HRESULT; stdcall;

    function GetHotkey(out pwHotkey: WORD): HRESULT; stdcall;

    function SetHotkey(wHotkey: WORD): HRESULT; stdcall;

    function GetShowCmd(out piShowCmd: Integer): HRESULT; stdcall;

    function SetShowCmd(iShowCmd: Integer): HRESULT; stdcall;

    function GetIconLocation(pszIconPath: LPWSTR;
                             cch: Integer;
                             out piIcon: Integer): HRESULT; stdcall;

    function SetIconLocation(pszIconPath: LPCWSTR;
                             iIcon: Integer): HRESULT; stdcall;

    function SetRelativePath(pszPathRel: LPCWSTR;
                             dwReserved: DWORD): HRESULT; stdcall;

    function Resolve(hwnd: HWND;
                     fFlags: DWORD): HRESULT; stdcall;

    function SetPath(pszFile: LPCWSTR): HRESULT; stdcall;
  end;

  IID_IShellLinkW = IShellLinkW;


  // Interface IShellLinkDataList
  // ============================
  //
  IShellLinkDataList = interface(IUnknown)
    ['{45E2B4AE-B1C3-11D0-B92F-00A0C90312E1}']

    function AddDataBlock(pDataBlock: Pointer): HRESULT; stdcall;

    function CopyDataBlock(dwSig: DWORD;
                           out ppDataBlock: Pointer): HRESULT; stdcall;

    function RemoveDataBlock(dwSig: DWORD): HRESULT; stdcall;

    function GetFlags(out pdwFlags: DWORD): HRESULT; stdcall;

    function SetFlags(dwFlags: DWORD): HRESULT; stdcall;
  end;

  IID_IShellLinkDataList = IShellLinkDataList;


  // Interface IResolveShellLink
  // ===========================
  //
  IResolveShellLink = interface(IUnknown)
    ['{5CD52983-9449-11D2-963A-00C04F79ADF0}']

    function ResolveShellLink(punkLink: IUnknown;
                              hwnd: HWND;
                              fFlags: DWORD): HRESULT; stdcall;
  end;

  IID_IResolveShellLink = IResolveShellLink;


  // Interface IActionProgressDialog
  // ===============================
  //
  IActionProgressDialog = interface(IUnknown)
    ['{49FF1172-EADC-446D-9285-156453A6431C}']

    function Initialize(flags: SPINITF;
                        pszTitle: LPCWSTR;
                        pszCancel: LPCWSTR): HRESULT; stdcall;

    function Stop: HRESULT; stdcall;
  end;

  IID_IActionProgressDialog = IActionProgressDialog;


  // Interface IActionProgress
  // =========================
  //
  IActionProgress = interface(IUnknown)
    ['{49FF1173-EADC-446D-9285-156453A6431C}']

    function Begin_(action: SPACTION;
                    flags: SPBEGINF): HRESULT; stdcall;

    function UpdateProgress(ulCompleted: ULONGLONG;
                            ulTotal: ULONGLONG): HRESULT; stdcall;

    function UpdateText(sptext: SPTEXT;
                        pszText: LPCWSTR;
                        fMayCompact: BOOL): HRESULT; stdcall;

    function QueryCancel(out pfCancelled: BOOL): HRESULT; stdcall;

    function ResetCancel(): HRESULT; stdcall;

    function _End(): HRESULT; stdcall;
  end;

  IID_IActionProgress = IActionProgress;


  // Interface IShellExtInit
  // =======================
  //
  IShellExtInit = interface(IUnknown)
    ['{000214E8-0000-0000-C000-000000000046}']

    function Initialize(pidlFolder: PCIDLIST_ABSOLUTE;
                        pdtobj: IDataObject;
                        hkeyProgID: HKEY): HRESULT; stdcall;
  end;

  IID_IShellExtInit = IShellExtInit;


  // Interface IShellPropSheetExt
  // ============================
  //
  IShellPropSheetExt = interface(IUnknown)
    ['{000214E9-0000-0000-C000-000000000046}']

    function AddPages(pfnAddPage: LPFNSVADDPROPSHEETPAGE;
                      lParam: LPARAM): HRESULT; stdcall;

    function ReplacePage(uPageID: EXPPS;
                         pfnReplaceWith: LPFNSVADDPROPSHEETPAGE;
                         lParam: LPARAM): HRESULT; stdcall;
  end;

  IID_IShellPropSheetExt = IShellPropSheetExt;


  // Interface IRemoteComputer
  // =========================
  //
  IRemoteComputer = interface(IUnknown)
    ['{000214FE-0000-0000-C000-000000000046}']

    function Initialize(pszMachine: LPCWSTR;
                        bEnumerating: BOOL): HRESULT; stdcall;
  end;

  IID_IRemoteComputer = IRemoteComputer;


  // Interface IQueryContinue
  // ========================
  //
  IQueryContinue = interface(IUnknown)
    ['{7307055C-B24A-486B-9F25-163E597A28A9}']

    function QueryContinue(): HRESULT; stdcall;
  end;

  IID_IQueryContinue = IQueryContinue;


  // Interface IObjectWithCancelEvent
  // ================================
  //
  IObjectWithCancelEvent = interface(IUnknown)
    ['{F279B885-0AE9-4B85-AC06-DDECF9408941}']

    function GetCancelEvent(phEvent: PHANDLE): HRESULT; stdcall;
  end;

  IID_IObjectWithCancelEvent = IObjectWithCancelEvent;


  // Interface IUserNotification
  // ===========================
  //
  IUserNotification = interface(IUnknown)
    ['{BA9711BA-5893-4787-A7E1-41277151550B}']

    function SetBalloonInfo(pszTitle: LPCWSTR;
                            pszText: LPCWSTR;
                            dwInfoFlags: DWORD): HRESULT; stdcall;

    function SetBalloonRetry(dwShowTime: DWORD;
                             dwInterval: DWORD;
                             cRetryCount: UINT): HRESULT; stdcall;

    function SetIconInfo(hIcon: HICON;
                         pszToolTip: LPCWSTR): HRESULT; stdcall;

    function Show(pqc: IQueryContinue;
                  dwContinuePollInterval: DWORD): HRESULT; stdcall;

    function PlaySound(pszSoundName: LPCWSTR): HRESULT; stdcall;
  end;

  IID_IUserNotification = IUserNotification;


  // Interface IItemNameLimits
  // =========================
  //
  IItemNameLimits = interface(IUnknown)
    ['{1DF0D7F1-B267-4D28-8B10-12E23202A5C4}']

    function GetValidCharacters(out ppwszValidChars: LPWSTR;
                                out ppwszInvalidChars: LPWSTR): HRESULT; stdcall;

    function GetMaxLength(pszName: LPCWSTR;
                          out piMaxNameLen: Int): HRESULT; stdcall;
  end;

  IID_IItemNameLimits = IItemNameLimits;


  // Interface ISearchFolderItemFactory
  // ==================================
  //
  ISearchFolderItemFactory = interface(IUnknown)
    ['{A0FFBC28-5482-4366-BE27-3E81E78E06C2}']

    function SetDisplayName(pszDisplayName: LPCWSTR): HRESULT; stdcall;

    function SetFolderTypeID(ftid: FOLDERTYPEID): HRESULT; stdcall;

    function SetFolderLogicalViewMode(flvm: FOLDERLOGICALVIEWMODE): HRESULT; stdcall;

    function SetIconSize(iIconSize: Integer): HRESULT; stdcall;

    function SetVisibleColumns(cVisibleColumns: UINT;
                               const rgKey: PPROPERTYKEY): HRESULT; stdcall;

    function SetSortColumns(cSortColumns: UINT;
                            rgSortColumns: PSORTCOLUMN): HRESULT; stdcall;

    function SetGroupColumn(const keyGroup: PROPERTYKEY): HRESULT; stdcall;

    function SetStacks(cStackKeys: UINT;
                       rgStackKeys: PPROPERTYKEY): HRESULT; stdcall;

    function SetScope(psiaScope: IShellItemArray): HRESULT; stdcall;

    function SetCondition(pCondition: ICondition): HRESULT; stdcall;

    function GetShellItem(const riid: TGUID;
                          out ppv): HRESULT; stdcall;

    function GetIDList(out ppidl: PIDLIST_ABSOLUTE): HRESULT; stdcall;
  end;

  IID_ISearchFolderItemFactory = ISearchFolderItemFactory;


  // Interface IExtractImage
  // =======================
  //
  IExtractImage = interface(IUnknown)
    ['{BB2E617C-0920-11D1-9A0B-00C04FC2D6C1}']

    function GetLocation(pszPathBuffer: LPWSTR;
                         cch: DWORD;
                         pdwPriority: PDWORD;
                         const prgSize: PSIZE;
                         dwRecClrDepth: DWORD;
                         pdwFlags: PDWORD): HRESULT; stdcall;

    function Extract(out phBmpThumbnail: HBITMAP): HRESULT; stdcall;
  end;

  IID_IExtractImage = IExtractImage;


  // Interface IExtractImage2
  // ========================
  //
  IExtractImage2 = interface(IExtractImage)
    ['{953BB1EE-93B4-11D1-98A3-00C04FB687DA}']

    function GetDateStamp(out pDateStamp: FILETIME): HRESULT; stdcall;
  end;

  IID_IExtractImage2 = IExtractImage2;


  // Interface IThumbnailHandlerFactory
  // ==================================
  //
  IThumbnailHandlerFactory = interface(IUnknown)
    ['{E35B4B2E-00DA-4BC1-9F13-38BC11F5D417}']

    function GetThumbnailHandler(pidlChild: PCUITEMID_CHILD;
                                 pbc: IBindCtx;
                                 const riid: REFIID;
                                 out ppv): HRESULT; stdcall;
  end;

  IID_IThumbnailHandlerFactory = IThumbnailHandlerFactory;


  // Interface IParentAndItem
  // ========================
  //
  IParentAndItem = interface(IUnknown)
    ['{B3A4B685-B685-4805-99D9-5DEAD2873236}']

    function SetParentAndItem(pidlParent: PCIDLIST_ABSOLUTE;
                              psf: IShellFolder;
                              pidlChild: PCUITEMID_CHILD): HRESULT; stdcall;

    function GetParentAndItem(out ppidlParent: PIDLIST_ABSOLUTE;
                              out ppsf: IShellFolder;
                              out ppidlChild: PITEMID_CHILD): HRESULT; stdcall;
  end;

  IID_IParentAndItem = IParentAndItem;


  // Interface IDockingWindow
  // ========================
  //
  IDockingWindow = interface(IOleWindow)
    ['{012DD920-7B26-11D0-8CA9-00A0C92DBFE8}']

    function ShowDW(fShow: BOOL): HRESULT; stdcall;

    function CloseDW(dwReserved: DWORD): HRESULT; stdcall;

    function ResizeBorderDW(prcBorder: LPCRECT;
                            punkToolbarSite: IUnknown;
                            fReserved: BOOL): HRESULT; stdcall;
  end;

  IID_IDockingWindow = IDockingWindow;


  // Interface IDeskBand
  // ===================
  //
  IDeskBand = interface(IDockingWindow)
    ['{EB0FE172-1A3A-11D0-89B3-00A0C90A90AC}']

    function GetBandInfo(dwBandID: DWORD;
                         dwViewMode: DWORD;
    {in_out}  pdbi: PDESKBANDINFO): HRESULT; stdcall;
  end;

  IID_IDeskBand = IDeskBand;


  // Interface IDeskBandInfo
  // =======================
  //
  IDeskBandInfo = interface(IUnknown)
    ['{77E425FC-CBF9-4307-BA6A-BB5727745661}']

    function GetDefaultBandWidth(dwBandID: DWORD;
                                 dwViewMode: DWORD;
                                 out pnWidth: Int): HRESULT; stdcall;
  end;

  IID_IDeskBandInfo = IDeskBandInfo;


  // Interface ITaskbarList
  // ======================
  //
  ITaskbarList = interface(IUnknown)
    ['{56FDF342-FD6D-11D0-958A-006097C9A090}']

    function HrInit(): HRESULT; stdcall;

    function AddTab(hwnd: HWND): HRESULT; stdcall;

    function DeleteTab(hwnd: HWND): HRESULT; stdcall;

    function ActivateTab(hwnd: HWND): HRESULT; stdcall;

    function SetActiveAlt(hwnd: HWND): HRESULT; stdcall;
  end;

  IID_ITaskbarList = ITaskbarList;


  // Interface ITaskbarList2
  // =======================
  //
  ITaskbarList2 = interface(ITaskbarList)
    ['{602D4995-B13A-429B-A66E-1935E44F4317}']

    function MarkFullscreenWindow(hwnd: HWND;
                                  fFullscreen: BOOL): HRESULT; stdcall;
  end;

  IID_ITaskbarList2 = ITaskbarList2;


  // Interface ITaskbarList3
  // =======================
  //
  ITaskbarList3 = interface(ITaskbarList2)
    ['{EA1AFB91-9E28-4B86-90E9-9E9F8A5EEFAF}']

    function SetProgressValue(hwnd: HWND;
                              ullCompleted: ULONGLONG;
                              ullTotal: ULONGLONG): HRESULT; stdcall;

    function SetProgressState(hwnd: HWND;
                              tbpFlags: TBPFLAG): HRESULT; stdcall;

    function RegisterTab(hwndTab: HWND;
                         hwndMDI: HWND): HRESULT; stdcall;

    function UnregisterTab(hwndTab: HWND): HRESULT; stdcall;

    function SetTabOrder(hwndTab: HWND;
                         hwndInsertBefore: HWND): HRESULT; stdcall;

    function SetTabActive(hwndTab: HWND;
                          hwndMDI: HWND;
                          dwReserved: DWORD): HRESULT; stdcall;

    function ThumbBarAddButtons(hwnd: HWND;
                                cButtons: UINT;
                                pButton: LPTHUMBBUTTON): HRESULT; stdcall;

    function ThumbBarUpdateButtons(hwnd: HWND;
                                   cButtons: UINT;
                                   pButton: LPTHUMBBUTTON): HRESULT; stdcall;

    function ThumbBarSetImageList(hwnd: HWND;
                                  himl: HIMAGELIST): HRESULT; stdcall;

    function SetOverlayIcon(hwnd: HWND;
                            hIcon: HICON;
                            pszDescription: LPCWSTR): HRESULT; stdcall;

    function SetThumbnailTooltip(hwnd: HWND;
                                 pszTip: LPCWSTR): HRESULT; stdcall;

    function SetThumbnailClip(hwnd: HWND;
                              prcClip: PRECT): HRESULT; stdcall;
  end;

  IID_ITaskbarList3 = ITaskbarList3;


  // Interface ITaskbarList4
  // =======================
  //
  ITaskbarList4 = interface(ITaskbarList3)
    ['{C43DC798-95D1-4BEA-9030-BB99E2983A1A}']

    function SetTabProperties(hwndTab: HWND;
                              stpFlags: STPFLAG): HRESULT; stdcall;
  end;

  IID_ITaskbarList4 = ITaskbarList4;


  // Interface IExplorerBrowserEvents
  // ================================
  //
  IExplorerBrowserEvents = interface(IUnknown)
    ['{361BBDC7-E6EE-4E13-BE58-58E2240C810F}']

    function OnNavigationPending(pidlFolder: PCIDLIST_ABSOLUTE): HRESULT; stdcall;

    function OnViewCreated(psv: IShellView): HRESULT; stdcall;

    function OnNavigationComplete(pidlFolder: PCIDLIST_ABSOLUTE): HRESULT; stdcall;

    function OnNavigationFailed(pidlFolder: PCIDLIST_ABSOLUTE): HRESULT; stdcall;
  end;

  IID_IExplorerBrowserEvents = IExplorerBrowserEvents;


  // Interface IExplorerBrowser
  // ==========================
  //
  IExplorerBrowser = interface(IUnknown)
    ['{DFD3B6B5-C10C-4BE9-85F6-A66969F402F6}']

    function Initialize(hwndParent: HWND;
                        const prc: PRECT;
                        const pfs: PFOLDERSETTINGS): HRESULT; stdcall;

    function Destroy(): HRESULT; stdcall;

    function SetRect(phdwp: PHDWP;
                     rcBrowser: TRECT): HRESULT; stdcall;

    function SetPropertyBag(pszPropertyBag: LPCWSTR): HRESULT; stdcall;

    function SetEmptyText(pszEmptyText: LPCWSTR): HRESULT; stdcall;

    function SetFolderSettings(const pfs: PFOLDERSETTINGS): HRESULT; stdcall;

    function Advise(psbe: IExplorerBrowserEvents;
                    out pdwCookie: DWORD): HRESULT; stdcall;

    function Unadvise(dwCookie: DWORD): HRESULT; stdcall;

    function SetOptions(dwFlag: EXPLORER_BROWSER_OPTIONS): HRESULT; stdcall;

    function GetOptions(out pdwFlag: EXPLORER_BROWSER_OPTIONS): HRESULT; stdcall;

    function BrowseToIDList(pidl: PCUIDLIST_RELATIVE;
                            uFlags: UINT): HRESULT; stdcall;

    function BrowseToObject(punk: IUnknown;
                            uFlags: UINT): HRESULT; stdcall;

    function FillFromObject(punk: IUnknown;
                            dwFlags: EXPLORER_BROWSER_FILL_FLAGS): HRESULT; stdcall;

    function RemoveAll(): HRESULT; stdcall;

    function GetCurrentView(const riid: TGUID;
                            out ppv): HRESULT; stdcall;
  end;

  IID_IExplorerBrowser = IExplorerBrowser;


  // Interface IEnumObjects
  // ======================
  //
  IEnumObjects = interface(IUnknown)
    ['{2C1C7E2E-2D0E-4059-831E-1E6F82335C2E}']

    function Next(celt: ULONG;
                  const riid: TGUID;
                  rgelt: PPointer;
                  pceltFetched: PULONG): HRESULT; stdcall;

    function Skip(celt: ULONG): HRESULT; stdcall;

    function Reset(): HRESULT; stdcall;

    function Clone(out ppenum: IEnumObjects): HRESULT; stdcall;
  end;

  IID_IEnumObjects = IEnumObjects;


  // Interface IOperationsProgressDialog
  // ===================================
  //
  IOperationsProgressDialog = interface(IUnknown)
    ['{0C9FB851-E5C9-43EB-A370-F0677B13874C}']

    function StartProgressDialog(hwndOwner: HWND;
                                 flags: OPPROGDLGF): HRESULT; stdcall;

    function StopProgressDialog(): HRESULT; stdcall;

    function SetOperation(action: SPACTION): HRESULT; stdcall;

    function SetMode(mode: PDMODE): HRESULT; stdcall;

    function UpdateProgress(ullPointsCurrent: ULONGLONG;
                            ullPointsTotal: ULONGLONG;
                            ullSizeCurrent: ULONGLONG;
                            ullSizeTotal: ULONGLONG;
                            ullItemsCurrent: ULONGLONG;
                            ullItemsTotal: ULONGLONG): HRESULT; stdcall;

    function UpdateLocations(psiSource: IShellItem;
                             psiTarget: IShellItem;
                             psiItem: IShellItem): HRESULT; stdcall;

    function ResetTimer(): HRESULT; stdcall;

    function PauseTimer(): HRESULT; stdcall;

    function ResumeTimer(): HRESULT; stdcall;

    function GetMilliseconds(out pullElapsed: ULONGLONG;
                             out pullRemaining: ULONGLONG): HRESULT; stdcall;

    function GetOperationStatus(out popstatus: PDOPSTATUS): HRESULT; stdcall;
  end;

  IID_IOperationsProgressDialog = IOperationsProgressDialog;


  // Interface IIOCancelInformation
  // ==============================
  //
  IIOCancelInformation = interface(IUnknown)
    ['{F5B0BF81-8CB5-4B1B-9449-1A159E0C733C}']

    function SetCancelInformation(dwThreadID: DWORD;
                                  uMsgCancel: UINT): HRESULT; stdcall;

    function GetCancelInformation(pdwThreadID: PDWORD;
                                  puMsgCancel: PUINT): HRESULT; stdcall;
  end;

  IID_IIOCancelInformation = IIOCancelInformation;


  // Interface IFileOperation
  // ========================
  //
  IFileOperation = interface(IUnknown)
    ['{947AAB5F-0A5C-4C13-B4D6-4BF7836FC9F8}']

    function Advise(pfops: IFileOperationProgressSink;
                    out pdwCookie: DWORD): HRESULT; stdcall;

    function Unadvise(dwCookie: DWORD): HRESULT; stdcall;

    function SetOperationFlags(dwOperationFlags: DWORD): HRESULT; stdcall;

    function SetProgressMessage(pszMessage: LPCWSTR): HRESULT; stdcall;

    function SetProgressDialog(popd: IOperationsProgressDialog): HRESULT; stdcall;

    function SetProperties(pproparray: IPropertyChangeArray): HRESULT; stdcall;

    function SetOwnerWindow(hwndOwner: HWND): HRESULT; stdcall;

    function ApplyPropertiesToItem(psiItem: IShellItem): HRESULT; stdcall;

    function ApplyPropertiesToItems(punkItems: IUnknown): HRESULT; stdcall;

    function RenameItem(psiItem: IShellItem;
                        pszNewName: LPCWSTR;
                        pfopsItem: IFileOperationProgressSink): HRESULT; stdcall;

    function RenameItems(pUnkItems: IUnknown;
                         pszNewName: LPCWSTR): HRESULT; stdcall;

    function MoveItem(psiItem: IShellItem;
                      psiDestinationFolder: IShellItem;
                      pszNewName: LPCWSTR;
                      pfopsItem: IFileOperationProgressSink): HRESULT; stdcall;

    function MoveItems(punkItems: IUnknown;
                       psiDestinationFolder: IShellItem): HRESULT; stdcall;

    function CopyItem(psiItem: IShellItem;
                      psiDestinationFolder: IShellItem;
                      pszCopyName: LPCWSTR;
                      pfopsItem: IFileOperationProgressSink): HRESULT; stdcall;

    function CopyItems(punkItems: IUnknown;
                       psiDestinationFolder: IShellItem): HRESULT; stdcall;

    function DeleteItem(psiItem: IShellItem;
                        pfopsItem: IFileOperationProgressSink): HRESULT; stdcall;

    function DeleteItems(punkItems: IUnknown): HRESULT; stdcall;

    function NewItem(psiDestinationFolder: IShellItem;
                     dwFileAttributes: DWORD;
                     pszName: LPCWSTR;
                     pszTemplateName: LPCWSTR;
                     pfopsItem: IFileOperationProgressSink): HRESULT; stdcall;

    function PerformOperations(): HRESULT; stdcall;

    function GetAnyOperationsAborted(out pfAnyOperationsAborted: BOOL): HRESULT; stdcall;
  end;

  IID_IFileOperation = IFileOperation;


  // Interface IFileOperation2
  // =========================
  //
  IFileOperation2 = interface(IFileOperation)
    ['{CD8F23C1-8F61-4916-909D-55BDD0918753}']

    function SetOperationFlags2(operationFlags2: FILE_OPERATION_FLAGS2): HRESULT; stdcall;
  end;

  IID_IFileOperation2 = IFileOperation2;


  // Interface IObjectProvider
  // =========================
  //
  IObjectProvider = interface(IUnknown)
    ['{A6087428-3BE3-4D73-B308-7C04A540BF1A}']

    function QueryObject(const guidObject: TGUID;
                         const riid: TGUID;
                         out ppvOut): HRESULT; stdcall;
  end;

  IID_IObjectProvider = IObjectProvider;


  // Interface INamespaceWalkCB
  // ==========================
  //
  INamespaceWalkCB = interface(IUnknown)
    ['{D92995F8-CF5E-4A76-BF59-EAD39EA2B97E}']

    function FoundItem(psf: IShellFolder;
                       pidl: PCUITEMID_CHILD): HRESULT; stdcall;

    function EnterFolder(psf: IShellFolder;
                         pidl: PCUITEMID_CHILD): HRESULT; stdcall;

    function LeaveFolder(psf: IShellFolder;
                         pidl: PCUITEMID_CHILD): HRESULT; stdcall;

    function InitializeProgressDialog(out ppszTitle: LPWSTR;
                                      out ppszCancel: LPWSTR): HRESULT; stdcall;
  end;

  IID_INamespaceWalkCB = INamespaceWalkCB;


  // Interface INamespaceWalkCB2
  // ===========================
  //
  INamespaceWalkCB2 = interface(INamespaceWalkCB)
    ['{7AC7492B-C38E-438A-87DB-68737844FF70}']

    function WalkComplete(hr: HRESULT): HRESULT; stdcall;
  end;

  IID_INamespaceWalkCB2 = INamespaceWalkCB2;


  // Interface INamespaceWalk
  // ========================
  //
  INamespaceWalk = interface(IUnknown)
    ['{57CED8A7-3F4A-432C-9350-30F24483F74F}']

    function Walk(punkToWalk: IUnknown;
                  dwFlags: DWORD;
                  cDepth: Integer;
                  pnswcb: INamespaceWalkCB): HRESULT; stdcall;

    function GetIDArrayResult(out pcItems: UINT;
                              out prgpidl: PPIDLIST_ABSOLUTE): HRESULT; stdcall;
  end;

  IID_INamespaceWalk = INamespaceWalk;


  // Interface IBandSite
  // ===================
  //
  IBandSite = interface(IUnknown)
    ['{4CF504B0-DE96-11D0-8B3F-00A0C911E8E5}']

    function AddBand(punk: IUnknown): HRESULT; stdcall;

    function EnumBands(uBand: UINT;
                       out pdwBandID: DWORD): HRESULT; stdcall;

    function QueryBand(dwBandID: DWORD;
                       out ppstb: IDeskBand;
                       out pdwState: DWORD;
                       pszName: LPWSTR;
                       cchName: Integer): HRESULT; stdcall;

    function SetBandState(dwBandID: DWORD;
                          dwMask: DWORD;
                          dwState: DWORD): HRESULT; stdcall;

    function RemoveBand(dwBandID: DWORD): HRESULT; stdcall;

    function GetBandObject(dwBandID: DWORD;
                           const riid: TGUID;
                           out ppv): HRESULT; stdcall;

    function SetBandSiteInfo(const pbsinfo: BANDSITEINFO): HRESULT; stdcall;

    function GetBandSiteInfo(var pbsinfo: BANDSITEINFO): HRESULT; stdcall;
  end;

  IID_IBandSite = IBandSite;


  // Interface IModalWindow
  // ======================
  //
  IModalWindow = interface(IUnknown)
    ['{B4DB1657-70D7-485E-8E3E-6FCB5A5C1802}']

    function Show(hwndOwner: HWND): HRESULT; stdcall;
  end;

  IID_IModalWindow = IModalWindow;


  // Interface IContextMenuSite
  // ==========================
  //
  IContextMenuSite = interface(IUnknown)
    ['{0811AEBE-0B87-4C54-9E72-548CF649016B}']

    function DoContextMenuPopup(punkContextMenu: IUnknown;
                                fFlags: UINT;
                                pt: POINT): HRESULT; stdcall;
  end;

  IID_IContextMenuSite = IContextMenuSite;


  // Interface IMenuBand
  // ===================
  //
  IMenuBand = interface(IUnknown)
    ['{568804CD-CBD7-11D0-9816-00C04FD91972}']

    function IsMenuMessage(pmsg: PMSG): HRESULT; stdcall;

    function TranslateMenuMessage(pmsg: PMSG;
                                  plRet: PLRESULT): HRESULT; stdcall;
  end;

  IID_IMenuBand = IMenuBand;


  // Interface IRegTreeItem
  // ======================
  //
  IRegTreeItem = interface(IUnknown)
    ['{A9521922-0812-4D44-9EC3-7FD38C726F3D}']

    function GetCheckState(pbCheck: PBOOL): HRESULT; stdcall;

    function SetCheckState(bCheck: BOOL): HRESULT; stdcall;
  end;

  IID_IRegTreeItem = IRegTreeItem;


  // Interface IDeskBar
  // ==================
  //
  IDeskBar = interface(IOleWindow)
    ['{EB0FE173-1A3A-11D0-89B3-00A0C90A90AC}']

    function SetClient(punkClient: IUnknown): HRESULT; stdcall;

    function GetClient(out ppunkClient: IUnknown): HRESULT; stdcall;

    function OnPosRectChangeDB(prc: PRECT): HRESULT; stdcall;
  end;

  IID_IDeskBar = IDeskBar;


  // Interface IMenuPopup
  // ====================
  //
  IMenuPopup = interface(IDeskBar)
    ['{D1E7AFEB-6A2E-11D0-8C78-00C04FD918B4}']

    function Popup(ppt: PPOINTL;
                   prcExclude: PRECTL;
                   dwFlags: MP_POPUPFLAGS): HRESULT; stdcall;

    function OnSelect(dwSelectType: DWORD): HRESULT; stdcall;

    function SetSubMenu(pmp: IMenuPopup;
                        fSet: BOOL): HRESULT; stdcall;
  end;

  IID_IMenuPopup = IMenuPopup;


  // Interface IFileIsInUse
  // ======================
  //
  IFileIsInUse = interface(IUnknown)
    ['{64A1CBF0-3A1A-4461-9158-376969693950}']

    function GetAppName(out ppszName: LPWSTR): HRESULT; stdcall;

    function GetUsage(out pfut: FILE_USAGE_TYPE): HRESULT; stdcall;

    function GetCapabilities(out pdwCapFlags: DWORD): HRESULT; stdcall;

    function GetSwitchToHWND(out phwnd: HWND): HRESULT; stdcall;

    function CloseFile(): HRESULT; stdcall;
  end;

  IID_IFileIsInUse = IFileIsInUse;


  // Interface IFileDialogEvents
  // ===========================
  //
  IFileDialogEvents = interface(IUnknown)
    ['{973510DB-7D7F-452B-8975-74A85828D354}']

    function OnFileOk(pfd: IFileDialog): HRESULT; stdcall;

    function OnFolderChanging(pfd: IFileDialog;
                              psiFolder: IShellItem): HRESULT; stdcall;

    function OnFolderChange(pfd: IFileDialog): HRESULT; stdcall;

    function OnSelectionChange(pfd: IFileDialog): HRESULT; stdcall;

    function OnShareViolation(pfd: IFileDialog;
                              psi: IShellItem;
                              out pResponse: FDE_SHAREVIOLATION_RESPONSE): HRESULT; stdcall;

    function OnTypeChange(pfd: IFileDialog): HRESULT; stdcall;

    function OnOverwrite(pfd: IFileDialog;
                         psi: IShellItem;
                         out pResponse: FDE_OVERWRITE_RESPONSE): HRESULT; stdcall;
  end;

  IID_IFileDialogEvents = IFileDialogEvents;


  // Interface IFileDialog
  // =====================
  //
  IFileDialog = interface(IModalWindow)
    ['{42F85136-DB7E-439C-85F1-E4075D135FC8}']

    function SetFileTypes(cFileTypes: UINT;
                          const rgFilterSpec: PCOMDLG_FILTERSPEC): HRESULT; stdcall;

    function SetFileTypeIndex(iFileType: UINT): HRESULT; stdcall;

    function GetFileTypeIndex(out piFileType: UINT): HRESULT; stdcall;

    function Advise(pfde: IFileDialogEvents;
                    out pdwCookie: DWORD): HRESULT; stdcall;

    function Unadvise(dwCookie: DWORD): HRESULT; stdcall;

    function SetOptions(fos: FILEOPENDIALOGOPTIONS): HRESULT; stdcall;

    function GetOptions(out pfos: FILEOPENDIALOGOPTIONS): HRESULT; stdcall;

    function SetDefaultFolder(psi: IShellItem): HRESULT; stdcall;

    function SetFolder(psi: IShellItem): HRESULT; stdcall;

    function GetFolder(out ppsi: IShellItem): HRESULT; stdcall;

    function GetCurrentSelection(out ppsi: IShellItem): HRESULT; stdcall;

    function SetFileName(pszName: LPCWSTR): HRESULT; stdcall;

    function GetFileName(out pszName: LPWSTR): HRESULT; stdcall;

    function SetTitle(pszTitle: LPCWSTR): HRESULT; stdcall;

    function SetOkButtonLabel(pszText: LPCWSTR): HRESULT; stdcall;

    function SetFileNameLabel(pszLabel: LPCWSTR): HRESULT; stdcall;

    function GetResult(out ppsi: IShellItem): HRESULT; stdcall;

    function AddPlace(psi: IShellItem;
                      fdap: FDAP): HRESULT; stdcall;

    function SetDefaultExtension(pszDefaultExtension: LPCWSTR): HRESULT; stdcall;

    function Close(hr: HRESULT): HRESULT; stdcall;

    function SetClientGuid(const guid: TGUID): HRESULT; stdcall;

    function ClearClientData(): HRESULT; stdcall;

    function SetFilter(pFilter: IShellItemFilter): HRESULT; stdcall;
  end;

  IID_IFileDialog = IFileDialog;


  // Interface IFileSaveDialog
  // =========================
  //
  IFileSaveDialog = interface(IFileDialog)
    ['{84BCCD23-5FDE-4CDB-AEA4-AF64B83D78AB}']

    function SetSaveAsItem(psi: IShellItem): HRESULT; stdcall;

    function SetProperties(pStore: IPropertyStore): HRESULT; stdcall;

    function SetCollectedProperties(pList: IPropertyDescriptionList;
                                    fAppendDefault: BOOL): HRESULT; stdcall;

    function GetProperties(out ppStore: IPropertyStore): HRESULT; stdcall;

    function ApplyProperties(psi: IShellItem;
                             pStore: IPropertyStore;
                             hwnd: HWND;
                             pSink: IFileOperationProgressSink): HRESULT; stdcall;
  end;

  IID_IFileSaveDialog = IFileSaveDialog;


  // Interface IFileOpenDialog
  // =========================
  //
  IFileOpenDialog = interface(IFileDialog)
    ['{D57C7288-D4AD-4768-BE02-9D969532D960}']

    function GetResults(out ppenum: IShellItemArray): HRESULT; stdcall;

    function GetSelectedItems(out ppsai: IShellItemArray): HRESULT; stdcall;
  end;

  IID_IFileOpenDialog = IFileOpenDialog;


  // Interface IFileDialogCustomize
  // ==============================
  //
  IFileDialogCustomize = interface(IUnknown)
    ['{E6FDD21A-163F-4975-9C8C-A69F1BA37034}']

    // Methods for adding or enabling controls. All of these can have their
    // enabled/visible state set, however the default is for them to be enabled and visible,
    // so this parameter has been left off these methods.
    function EnableOpenDropDown(dwIDCtl: DWORD): HRESULT; stdcall;

    function AddMenu(dwIDCtl: DWORD;
                     pszLabel: LPCWSTR): HRESULT; stdcall;

    function AddPushButton(dwIDCtl: DWORD;
                           pszLabel: LPCWSTR): HRESULT; stdcall;

    function AddComboBox(dwIDCtl: DWORD): HRESULT; stdcall;

    function AddRadioButtonList(dwIDCtl: DWORD): HRESULT; stdcall;

    function AddCheckButton(dwIDCtl: DWORD;
                            pszLabel: LPCWSTR;
                            bChecked: BOOL): HRESULT; stdcall;

    function AddEditBox(dwIDCtl: DWORD;
                        pszText: LPCWSTR): HRESULT; stdcall;

    function AddSeparator(dwIDCtl: DWORD): HRESULT; stdcall;

    function AddText(dwIDCtl: DWORD;
                     pszText: LPCWSTR): HRESULT; stdcall;

    // Getting/setting attributes on controls on the fly
    function SetControlLabel(dwIDCtl: DWORD;
                             pszLabel: LPCWSTR): HRESULT; stdcall;

    function GetControlState(dwIDCtl: DWORD;
                             out pdwState: CDCONTROLSTATEF): HRESULT; stdcall;

    function SetControlState(dwIDCtl: DWORD;
                             dwState: CDCONTROLSTATEF): HRESULT; stdcall;

    function GetEditBoxText(dwIDCtl: DWORD;
                            out ppszText: LPWSTR): HRESULT; stdcall;

    function SetEditBoxText(dwIDCtl: DWORD;
                            pszText: LPCWSTR): HRESULT; stdcall;

    function GetCheckButtonState(dwIDCtl: DWORD;
                                 out pbChecked: BOOL): HRESULT; stdcall;

    function SetCheckButtonState(dwIDCtl: DWORD;
                                 bChecked: BOOL): HRESULT; stdcall;

    // Method for adding items to "container controls" (radiogroup, combobox, opendropdown, toolsmenu)
    function AddControlItem(dwIDCtl: DWORD;
                            dwIDItem: DWORD;
                            pszLabel: LPCWSTR): HRESULT; stdcall;

    // Methods for removing items in the "container controls"
    function RemoveControlItem(dwIDCtl: DWORD;
                               dwIDItem: DWORD): HRESULT; stdcall;

    function RemoveAllControlItems(dwIDCtl: DWORD): HRESULT; stdcall;

    // Getting/setting attributes on control items on the fly
    // Items are considered immutable once created, except for their state:
    function GetControlItemState(dwIDCtl: DWORD;
                                 dwIDItem: DWORD;
                                 out pdwState: CDCONTROLSTATEF): HRESULT; stdcall;

    function SetControlItemState(dwIDCtl: DWORD;
                                 dwIDItem: DWORD;
                                 dwState: CDCONTROLSTATEF): HRESULT; stdcall;

    // Methods for some "container controls": OpenDropDown, combobox, radiobuttongroup.
    // These methods don't apply to the tools menu.
    // These methods can be called after the dialog has closed, to determine the users final choice.
    // For comboboxes and radiobuttongroups, these methods may also be called while the
    // dialog is showing (which makes no sense for the OpenDropDown).
    function GetSelectedControlItem(dwIDCtl: DWORD;
                                    out pdwIDItem: DWORD): HRESULT; stdcall;

    function SetSelectedControlItem(dwIDCtl: DWORD;
                                    dwIDItem: DWORD): HRESULT; stdcall; // Not valid for OpenDropDown

    // Controls can be grouped by wrapping their adds in StartVisualGroup/EndVisualGroup
    // Groups have control IDs, and can be disabled/hidden, just like other controls.
    function StartVisualGroup(dwIDCtl: DWORD;
                              pszLabel: LPCWSTR): HRESULT; stdcall;

    function EndVisualGroup(): HRESULT; stdcall;

    // One control may be marked as appearing prominently in the UI
    function MakeProminent(dwIDCtl: DWORD): HRESULT; stdcall;

    // Set the text of a control item (RadioButton, or item in an OpenDropDown or Menu)
    function SetControlItemText(dwIDCtl: DWORD;
                                dwIDItem: DWORD;
                                pszLabel: LPCWSTR): HRESULT; stdcall;
  end;

  IID_IFileDialogCustomize = IFileDialogCustomize;


  // Interface IApplicationAssociationRegistration
  // =============================================
  //
  IApplicationAssociationRegistration = interface(IUnknown)
    ['{4E530B0A-E611-4C77-A3AC-9031D022281B}']

    function QueryCurrentDefault(pszQuery: LPCWSTR;
                                 atQueryType: ASSOCIATIONTYPE;
                                 alQueryLevel: ASSOCIATIONLEVEL;
                                 out ppszAssociation: LPWSTR): HRESULT; stdcall;

    function QueryAppIsDefault(pszQuery: LPCWSTR;
                               atQueryType: ASSOCIATIONTYPE;
                               alQueryLevel: ASSOCIATIONLEVEL;
                               pszAppRegistryName: LPCWSTR;
                               out pfDefault: BOOL): HRESULT; stdcall;

    function QueryAppIsDefaultAll(alQueryLevel: ASSOCIATIONLEVEL;
                                  pszAppRegistryName: LPCWSTR;
                                  out pfDefault: BOOL): HRESULT; stdcall;

    function SetAppAsDefault(pszAppRegistryName: LPCWSTR;
                             pszSet: LPCWSTR;
                             atSetType: ASSOCIATIONTYPE): HRESULT; stdcall;

    function SetAppAsDefaultAll(pszAppRegistryName: LPCWSTR): HRESULT; stdcall;

    function ClearUserAssociations(): HRESULT; stdcall;
  end;

  IID_IApplicationAssociationRegistration = IApplicationAssociationRegistration;


  // Interface IDelegateFolder
  // =========================
  //
  IDelegateFolder = interface(IUnknown)
    ['{ADD8BA80-002B-11D0-8F0F-00C04FD7D062}']

    function SetItemAlloc(pmalloc: IMalloc): HRESULT; stdcall;
  end;

  IID_IDelegateFolder = IDelegateFolder;


  // Interface IBrowserFrameOptions
  // ==============================
  //
  IBrowserFrameOptions = interface(IUnknown)
    ['{10DF43C8-1DBE-11D3-8B34-006097DF5BD4}']

    function GetFrameOptions(dwMask: BROWSERFRAMEOPTIONS;
                             pdwOptions: PBROWSERFRAMEOPTIONS): HRESULT; stdcall;
  end;

  IID_IBrowserFrameOptions = IBrowserFrameOptions;


  // Interface INewWindowManager
  // ===========================
  //
  INewWindowManager = interface(IUnknown)
    ['{D2BC4C84-3F72-4A52-A604-7BCBF3982CBB}']

    function EvaluateNewWindow(pszUrl: LPCWSTR;
                               pszName: LPCWSTR;
                               pszUrlContext: LPCWSTR;
                               pszFeatures: LPCWSTR;
                               fReplace: BOOL;
                               dwFlags: DWORD;
                               dwUserActionTime: DWORD): HRESULT; stdcall;
  end;

  IID_INewWindowManager = INewWindowManager;


  // Interface IAttachmentExecute
  // ============================
  //
  IAttachmentExecute = interface(IUnknown)
    ['{73DB1241-1E85-4581-8E4F-A81E1D0F8C57}']

    //
    //  IAttachmentExecute - COM object designed to help client applications
    //      safely manage saving and opening attachments for users.
    //      clients are assumed to have some policy/settings already
    //      to determine the support and behavior for attachments.
    //      this API assumes that the client is interactive with the user
    //
    //  ClientTitle - (optional) caller specific title for the prompt
    //    if unset, the prompts come with a default title of "File Download"
    function SetClientTitle(pszTitle: LPCWSTR): HRESULT; stdcall;

    //  ClientGuid - (optional) for storing user specific settings
    //      someprompts are allowed to be avoided in the future if the user
    //      chooses.  that choice is stored on per-client basis indexed by the ClientGuid
    //
    //      Specific Example: In the User Trust Prompt there is a check box that is checked
    //      by default, but may be unchecked by the user.  this option is stored under the ClientGuid
    //      based on the file type.
    //
    //      ClearClientState() will reset any user options stored on the clients behalf.
    function SetClientGuid(const guid: TGUID): HRESULT; stdcall;

    //  EVIDENCE properties

    //  LocalPath - (REQUIRED) path that would be passed to ShellExecute()
    //      if FileName was already used for the Check() and Prompt() calls,
    //      and the LocalPath points to a different handler than predicted,
    //      previous trust may be revoked, and the Policy and User trust re-verified.
    function SetLocalPath(pszLocalPath: LPCWSTR): HRESULT; stdcall;

    //  FileName - (optional) proposed name (not path) to be used to construct LocalPath
    //  optionally use this if the caller wants to perform Check() before copying
    //  the file to the LocalPath.  (eg, Check() proposed download)
    function SetFileName(pszFileName: LPCWSTR): HRESULT; stdcall;

    //  Source - (optional) alternate identity path or URL for a file transfer
    //      used as the primary Zone determinant.  if this is NULL default to the Restricted Zone.
    //      may also be used in the Prompt() UI for the "From" field
    //      may also be sent to handlers that can process URLs
    function SetSource(pszSource: LPCWSTR): HRESULT; stdcall;

    //  Referrer - (optional) Zone determinant for container or link types
    //      only used for Zone/Policy
    //      container formats like ZIP and OLE packager use the Referrer to
    //      indicate indirect inheritance and avoid Zone elevation.
    //      Shortcuts can also use it to limit elevation based on parameters
    function SetReferrer(pszReferrer: LPCWSTR): HRESULT; stdcall;

    //  CheckPolicy() - examines available evidence and checks the resultant policy
    //      * requires FileName or LocalPath
    //
    //  Returns S_OK for enable
    //          S_FALSE for prompt
    //          FAILURE for disable
    //
    function CheckPolicy(): HRESULT; stdcall;

    //  Prompt() - application can force UI at an earlier point,
    //      even before the file has been copied to disk
    //      * requires FileName or LocalPath
    function Prompt(hwnd: HWND;
                    prompt: ATTACHMENT_PROMPT;
                    out paction: ATTACHMENT_ACTION): HRESULT; stdcall;

    //  Save() - should always be called if LocalPath is in not in a temp dir
    //      * requires valid LocalPath
    //      * called after the file has been copied to LocalPath
    //      * may run virus scanners or other trust services to validate the file.
    //          these services may delete or alter the file
    //      * may attach evidence to the LocalPath
    function Save(): HRESULT; stdcall;

    //  Execute() - will call Prompt() if necessary, with the EXEC action
    //      * requires valid LocalPath
    //      * called after the file has been copied to LocalPath
    //      * may run virus scanners or other trust services to validate the file.
    //          these services may delete or alter the file
    //      * may attach evidence to the LocalPath
    //
    //      phProcess - if non-NULL Execute() will be synchronous and return an HPROCESS if available
    //                  if null Execute() will be async, implies that you have a message pump and a long lived window
    //
    function Execute(hwnd: HWND;
                     pszVerb: LPCWSTR;
                     phProcess: PHANDLE): HRESULT; stdcall;

    //   SaveWithUI() - superset of Save() that can show modal error UI, but still does not call Prompt()
    //      * requires valid LocalPath
    //      * called after the file has been copied to LocalPath
    //      * may run virus scanners or other trust services to validate the file.
    //          these services may delete or alter the file
    //      * may attach evidence to the LocalPath
    function SaveWithUI(hwnd: HWND): HRESULT; stdcall;

    //  ClearClientState() - removes any state that is stored based on the ClientGuid
    //      * requires SetClientGuid() to be called first
    function ClearClientState(): HRESULT; stdcall;
  end;

  IID_IAttachmentExecute = IAttachmentExecute;


  // Interface IAttachmentExecute2
  // =============================
  //
  IAttachmentExecute2 = interface(IAttachmentExecute)
    ['{4F2B781F-A608-4543-ABF0-49C246EBBBA9}']

    function SaveNoVirusCheck(): HRESULT; stdcall;

    function SaveWithUINoVirusCheck(hwnd: HWND): HRESULT; stdcall;
  end;

  IID_IAttachmentExecute2 = IAttachmentExecute2;


  // Interface IShellMenuCallback
  // ============================
  //
  IShellMenuCallback = interface(IUnknown)
    ['{4CA300A1-9B8D-11D1-8B22-00C04FD918D0}']

    function CallbackSM(psmd: LPSMDATA;
                        uMsg: UINT;
                        wParam: WPARAM;
                        lParam: LPARAM): HRESULT; stdcall;
  end;

  IID_IShellMenuCallback = IShellMenuCallback;


  // Interface IShellMenu
  // ====================
  //
  IShellMenu = interface(IUnknown)
    ['{EE1F7637-E138-11D1-8379-00C04FD918D0}']

    function Initialize(psmc: IShellMenuCallback;
                        uId: UINT;
                        uIdAncestor: UINT;
                        dwFlags: DWORD): HRESULT; stdcall;

    function GetMenuInfo(out ppsmc: IShellMenuCallback;
                         puId: PUINT;
                         puIdAncestor: PUINT;
                         pdwFlags: PDWORD): HRESULT; stdcall;

    function SetShellFolder(psf: IShellFolder;
                            pidlFolder: PCIDLIST_ABSOLUTE;
                            hKey: HKEY;
                            dwFlags: DWORD): HRESULT; stdcall;

    function GetShellFolder(out pdwFlags: DWORD;
                            out ppidl: PIDLIST_ABSOLUTE;
                            const riid: TGUID;
                            out ppv): HRESULT; stdcall;

    function SetMenu(hmenu: HMENU;
                     hwnd: HWND;
                     dwFlags: DWORD): HRESULT; stdcall;

    function GetMenu(out phmenu: HMENU;
                     phwnd: PHWND;
                     pdwFlags: PDWORD): HRESULT; stdcall;

    function InvalidateItem(psmd: LPSMDATA;
                            dwFlags: DWORD): HRESULT; stdcall;

    function GetState(psmd: LPSMDATA): HRESULT; stdcall;

    function SetMenuToolbar(punk: IUnknown;
                            dwFlags: DWORD): HRESULT; stdcall;
  end;

  IID_IShellMenu = IShellMenu;


  // Interface IKnownFolder
  // ======================
  //
  IKnownFolder = interface(IUnknown)
    ['{3AA7AF7E-9B36-420C-A8E3-F77D4674A488}']

    function GetId(out pkfid: KNOWNFOLDERID): HRESULT; stdcall;

    function GetCategory(out pCategory: KF_CATEGORY): HRESULT; stdcall;

    function GetShellItem(dwFlags: DWORD;
                          const riid: TGUID;
                          out ppv): HRESULT; stdcall;

    function GetPath(dwFlags: DWORD;
                     out ppszPath: LPWSTR): HRESULT; stdcall;

    function SetPath(dwFlags: DWORD;
                     pszPath: LPCWSTR): HRESULT; stdcall;

    function GetIDList(dwFlags: DWORD;
                       out ppidl: PIDLIST_ABSOLUTE): HRESULT; stdcall;

    function GetFolderType(out pftid: FOLDERTYPEID): HRESULT; stdcall;

    function GetRedirectionCapabilities(out pCapabilities: KF_REDIRECTION_CAPABILITIES): HRESULT; stdcall;

    function GetFolderDefinition(out pKFD: KNOWNFOLDER_DEFINITION): HRESULT; stdcall;
  end;

  IID_IKnownFolder = IKnownFolder;


  // Interface IKnownFolderManager
  // =============================
  //
  IKnownFolderManager = interface(IUnknown)
    ['{8BE2D872-86AA-4D47-B776-32CCA40C7018}']

    function FolderIdFromCsidl(nCsidl: Integer;
                               out pfid: KNOWNFOLDERID): HRESULT; stdcall;

    function FolderIdToCsidl(const rfid: KNOWNFOLDERID;
                             out pnCsidl: Integer): HRESULT; stdcall;

    function GetFolderIds(out ppKFId: PKNOWNFOLDERID;
                          var pCount: UINT): HRESULT; stdcall;

    function GetFolder(const rfid: KNOWNFOLDERID;
                       out ppkf: IKnownFolder): HRESULT; stdcall;

    function GetFolderByName(pszCanonicalName: LPCWSTR;
                             out ppkf: IKnownFolder): HRESULT; stdcall;

    function RegisterFolder(const rfid: KNOWNFOLDERID;
                            const pKFD: PKNOWNFOLDER_DEFINITION): HRESULT; stdcall;

    function UnregisterFolder(const rfid: KNOWNFOLDERID): HRESULT; stdcall;

    function FindFolderFromPath(pszPath: LPCWSTR;
                                mode: FFFP_MODE;
                                out ppkf: IKnownFolder): HRESULT; stdcall;

    function FindFolderFromIDList(pidl: PCIDLIST_ABSOLUTE;
                                  out ppkf: IKnownFolder): HRESULT; stdcall;

    function Redirect(const rfid: KNOWNFOLDERID;
                      hwnd: HWND;
                      flags: KF_REDIRECT_FLAGS;
                      pszTargetPath: LPCWSTR;
                      cFolders: UINT;
                      const pExclusion: PKNOWNFOLDERID;
                      out ppszError: LPWSTR): HRESULT; stdcall;
  end;

  IID_IKnownFolderManager = IKnownFolderManager;


  // Interface ISharingConfigurationManager
  // ======================================
  //
  ISharingConfigurationManager = interface(IUnknown)
    ['{B4CD448A-9C86-4466-9201-2E62105B87AE}']

    function CreateShare(dsid: DEF_SHARE_ID;
                         role: SHARE_ROLE): HRESULT; stdcall;

    function DeleteShare(dsid: DEF_SHARE_ID): HRESULT; stdcall;

    function ShareExists(dsid: DEF_SHARE_ID): HRESULT; stdcall;

    function GetSharePermissions(dsid: DEF_SHARE_ID;
                                 out pRole: SHARE_ROLE): HRESULT; stdcall;

    function SharePrinters(): HRESULT; stdcall;

    function StopSharingPrinters(): HRESULT; stdcall;

    function ArePrintersShared(): HRESULT; stdcall;
  end;

  IID_ISharingConfigurationManager = ISharingConfigurationManager;


  // Interface IRelatedItem
  // ======================
  //
  IRelatedItem = interface(IUnknown)
    ['{A73CE67A-8AB1-44F1-8D43-D2FCBF6B1CD0}']

    function GetItemIDList(out ppidl: PIDLIST_ABSOLUTE): HRESULT; stdcall;

    function GetItem(out ppsi: IShellItem): HRESULT; stdcall;
  end;

  IID_IRelatedItem = IRelatedItem;


  // Interface IIdentityName
  // =======================
  //
  IIdentityName = interface(IRelatedItem)
    ['{7D903FCA-D6F9-4810-8332-946C0177E247}']
  end;

  IID_IIdentityName = IIdentityName;


  // Interface IDelegateItem
  // =======================
  //
  IDelegateItem = interface(IRelatedItem)
    ['{3C5A1C94-C951-4CB7-BB6D-3B93F30CCE93}']
  end;

  IID_IDelegateItem = IDelegateItem;


  // Interface ICurrentItem
  // ======================
  //
  ICurrentItem = interface(IRelatedItem)
    ['{240A7174-D653-4A1D-A6D3-D4943CFBFE3D}']
  end;

  IID_ICurrentItem = ICurrentItem;


  // Interface ITransferMediumItem
  // =============================
  //
  ITransferMediumItem = interface(IRelatedItem)
    ['{77F295D5-2D6F-4E19-B8AE-322F3E721AB5}']
  end;

  IID_ITransferMediumItem = ITransferMediumItem;


  // Interface IDisplayItem
  // ======================
  //
  IDisplayItem = interface(IRelatedItem)
    ['{C6FD5997-9F6B-4888-8703-94E80E8CDE3F}']
  end;

  IID_IDisplayItem = IDisplayItem;


  // Interface IViewStateIdentityItem
  // ================================
  //
  IViewStateIdentityItem = interface(IRelatedItem)
    ['{9D264146-A94F-4195-9F9F-3BB12CE0C955}']
  end;

  IID_IViewStateIdentityItem = IViewStateIdentityItem;


  // Interface IPreviewItem
  // ======================
  //
  IPreviewItem = interface(IRelatedItem)
    ['{36149969-0A8F-49C8-8B00-4AECB20222FB}']
  end;

  IID_IPreviewItem = IPreviewItem;


  // Interface IDestinationStreamFactory
  // ===================================
  //
  IDestinationStreamFactory = interface(IUnknown)
    ['{8A87781B-39A7-4A1F-AAB3-A39B9C34A7D9}']

    function GetDestinationStream(out ppstm: IStream): HRESULT; stdcall;
  end;

  IID_IDestinationStreamFactory = IDestinationStreamFactory;


  // Interface ICreateProcessInputs
  // ==============================
  //
  ICreateProcessInputs = interface(IUnknown)
    ['{F6EF6140-E26F-4D82-BAC4-E9BA5FD239A8}']

    function GetCreateFlags(pdwCreationFlags: PDWORD): HRESULT; stdcall;

    function SetCreateFlags(dwCreationFlags: DWORD): HRESULT; stdcall;

    function AddCreateFlags(dwCreationFlags: DWORD): HRESULT; stdcall;

    function SetHotKey(wHotKey: WORD): HRESULT; stdcall;

    function AddStartupFlags(dwStartupInfoFlags: DWORD): HRESULT; stdcall;

    function SetTitle(pszTitle: LPCWSTR): HRESULT; stdcall;

    function SetEnvironmentVariable(pszName: LPCWSTR;
                                    pszValue: LPCWSTR): HRESULT; stdcall;
  end;

  IID_ICreateProcessInputs = ICreateProcessInputs;


  // Interface ICreatingProcess
  // ==========================
  //
  ICreatingProcess = interface(IUnknown)
    ['{C2B937A9-3110-4398-8A56-F34C6342D244}']

    function OnCreating(pcpi: ICreateProcessInputs): HRESULT; stdcall;
  end;

  IID_ICreatingProcess = ICreatingProcess;


  // Interface ILaunchUIContext
  // ==========================
  //
  ILaunchUIContext = interface(IUnknown)
    ['{1791E8F6-21C7-4340-882A-A6A93E3FD73B}']

    function SetAssociatedWindow(value: HWND): HRESULT; stdcall;

    function SetTabGroupingPreference(value: DWORD): HRESULT; stdcall;
  end;

  IID_ILaunchUIContext = ILaunchUIContext;


  // Interface ILaunchUIContextProvider
  // ==================================
  //
  ILaunchUIContextProvider = interface(IUnknown)
    ['{0D12C4C8-A3D9-4E24-94C1-0E20C5A956C4}']

    function UpdateContext(context: ILaunchUIContext): HRESULT; stdcall;
  end;

  IID_ILaunchUIContextProvider = ILaunchUIContextProvider;


  // Interface INewMenuClient
  // ========================
  //
  INewMenuClient = interface(IUnknown)
    ['{DCB07FDC-3BB5-451C-90BE-966644FED7B0}']

    function IncludeItems(out pflags: NMCII_FLAGS): HRESULT; stdcall;

    function SelectAndEditItem(pidlItem: PCIDLIST_ABSOLUTE;
                               flags: NMCSAEI_FLAGS): HRESULT; stdcall;
  end;

  IID_INewMenuClient = INewMenuClient;


  // Interface IInitializeWithBindCtx
  // ================================
  //
  IInitializeWithBindCtx = interface(IUnknown)
    ['{71C0D2BC-726D-45CC-A6C0-2E31C1DB2159}']

    function Initialize(pbc: IBindCtx): HRESULT; stdcall;
  end;

  IID_IInitializeWithBindCtx = IInitializeWithBindCtx;


  // Interface IShellItemFilter
  // ==========================
  //
  IShellItemFilter = interface(IUnknown)
    ['{2659B475-EEB8-48B7-8F07-B378810F48CF}']

    function IncludeItem(psi: IShellItem): HRESULT; stdcall;

    function GetEnumFlagsForItem(psi: IShellItem;
                                 out pgrfFlags: SHCONTF): HRESULT; stdcall;
  end;

  IID_IShellItemFilter = IShellItemFilter;


  // Interface INameSpaceTreeControl
  // ===============================
  //
  INameSpaceTreeControl = interface(IUnknown)
    ['{028212A3-B627-47E9-8856-C14265554E4F}']

    function Initialize(hwndParent: HWND;
                        prc: PRECT;
                        nsctsFlags: NSTCSTYLE): HRESULT; stdcall;

    function TreeAdvise(punk: IUnknown;
                        out pdwCookie: DWORD): HRESULT; stdcall;

    function TreeUnadvise(dwCookie: DWORD): HRESULT; stdcall;

    function AppendRoot(psiRoot: IShellItem;
                        grfEnumFlags: SHCONTF;
                        grfRootStyle: NSTCROOTSTYLE;
                        pif: IShellItemFilter): HRESULT; stdcall;

    function InsertRoot(iIndex: Integer;
                        psiRoot: IShellItem;
                        grfEnumFlags: SHCONTF;
                        grfRootStyle: NSTCROOTSTYLE;
                        pif: IShellItemFilter): HRESULT; stdcall;

    function RemoveRoot(psiRoot: IShellItem): HRESULT; stdcall;

    function RemoveAllRoots(): HRESULT; stdcall;

    function GetRootItems(out ppsiaRootItems: IShellItemArray): HRESULT; stdcall;

    function SetItemState(psi: IShellItem;
                          nstcisMask: NSTCITEMSTATE;
                          nstcisFlags: NSTCITEMSTATE): HRESULT; stdcall;

    function GetItemState(psi: IShellItem;
                          nstcisMask: NSTCITEMSTATE;
                          out pnstcisFlags: NSTCITEMSTATE): HRESULT; stdcall;

    function GetSelectedItems(out psiaItems: IShellItemArray): HRESULT; stdcall;

    function GetItemCustomState(psi: IShellItem;
                                out piStateNumber: Integer): HRESULT; stdcall;

    function SetItemCustomState(psi: IShellItem;
                                iStateNumber: Integer): HRESULT; stdcall;

    function EnsureItemVisible(psi: IShellItem): HRESULT; stdcall;

    function SetTheme(pszTheme: LPCWSTR): HRESULT; stdcall;

    function GetNextItem(psi: IShellItem;
                         nstcgi: NSTCGNI;
                         out ppsiNext: IShellItem): HRESULT; stdcall;

    function HitTest(ppt: PPOINT;
                     out ppsiOut: IShellItem): HRESULT; stdcall;

    function GetItemRect(psi: IShellItem;
                         out prect: TRECT): HRESULT; stdcall;

    function CollapseAll(): HRESULT; stdcall;
  end;

  IID_INameSpaceTreeControl = INameSpaceTreeControl;


  // Interface INameSpaceTreeControlFolderCapabilities
  // =================================================
  //
  INameSpaceTreeControlFolderCapabilities = interface(IUnknown)
    ['{E9701183-E6B3-4FF2-8568-813615FEC7BE}']

    function GetFolderCapabilities(nfcMask: NSTCFOLDERCAPABILITIES;
    {out} pnfcValue: PNSTCFOLDERCAPABILITIES): HRESULT; stdcall;
  end;

  IID_INameSpaceTreeControllFolderCapabilities = INameSpaceTreeControlFolderCapabilities;


  // Interface IPreviewHandler
  // =========================
  //
  IPreviewHandler = interface(IUnknown)
    ['{8895B1C6-B41F-4C1C-A562-0D564250836F}']

    function SetWindow(hwnd: HWND;
                       const prc: PRECT): HRESULT; stdcall;

    function SetRect(const prc: PRECT): HRESULT; stdcall;

    function DoPreview(): HRESULT; stdcall;

    function Unload(): HRESULT; stdcall;

    function SetFocus(): HRESULT; stdcall;

    function QueryFocus(out phwnd: HWND): HRESULT; stdcall;

    function TranslateAccelerator(pmsg: PMSG): HRESULT; stdcall;
  end;

  IID_IPreviewHandler = IPreviewHandler;


  // Interface IPreviewHandlerFrame
  // ==============================
  //
  IPreviewHandlerFrame = interface(IUnknown)
    ['{FEC87AAF-35F9-447A-ADB7-20234491401A}']

    function GetWindowContext(out pinfo: PREVIEWHANDLERFRAMEINFO): HRESULT; stdcall;

    function TranslateAccelerator(pmsg: PMSG): HRESULT; stdcall;
  end;

  IID_IPreviewHandlerFrame = IPreviewHandlerFrame;


  // Interface IExplorerPaneVisibility
  // =================================
  //
  IExplorerPaneVisibility = interface(IUnknown)
    ['{E07010EC-BC17-44C0-97B0-46C7C95B9EDC}']

    function GetPaneState(const ep: TGUID;
                          out peps: EXPLORERPANESTATE): HRESULT; stdcall;
  end;

  IID_IExplorerPaneVisibility = IExplorerPaneVisibility;


  // Interface IContextMenuCB
  // ========================
  //
  IContextMenuCB = interface(IUnknown)
    ['{3409E930-5A39-11D1-83FA-00A0C90DC849}']

    function CallBack(psf: IShellFolder;
                      hwndOwner: HWND;
                      pdtobj: IDataObject;
                      uMsg: UINT;
                      wParam: WPARAM;
                      lParam: LPARAM): HRESULT; stdcall;
  end;

  IID_IContextMenuCB = IContextMenuCB;


  // Interface IDefaultExtractIconInit
  // =================================
  //
  IDefaultExtractIconInit = interface(IUnknown)
    ['{41DED17D-D6B3-4261-997D-88C60E4B1D58}']

    function SetFlags(uFlags: UINT): HRESULT; stdcall;

    function SetKey(hkey: HKEY): HRESULT; stdcall;

    function SetNormalIcon(pszFile: LPCWSTR;
                           iIcon: Integer): HRESULT; stdcall;

    function SetOpenIcon(pszFile: LPCWSTR;
                         iIcon: Integer): HRESULT; stdcall;

    function SetShortcutIcon(pszFile: LPCWSTR;
                             iIcon: Integer): HRESULT; stdcall;

    function SetDefaultIcon(pszFile: LPCWSTR;
                            iIcon: Integer): HRESULT; stdcall;
  end;

  IID_IDefaultExtractIconInit = IDefaultExtractIconInit;


  // Interface IExplorerCommand
  // ==========================
  //
  IExplorerCommand = interface(IUnknown)
    ['{A08CE4D0-FA25-44AB-B57C-C7B1C323E0B9}']

    function GetTitle(psiItemArray: IShellItemArray;
                      out ppszName: LPWSTR): HRESULT; stdcall;

    function GetIcon(psiItemArray: IShellItemArray;
                     out ppszIcon: LPWSTR): HRESULT; stdcall;

    function GetToolTip(psiItemArray: IShellItemArray;
                        out ppszInfotip: LPWSTR): HRESULT; stdcall;

    function GetCanonicalName(out pguidCommandName: TGUID): HRESULT; stdcall;

    function GetState(psiItemArray: IShellItemArray;
                      fOkToBeSlow: BOOL;
                      out pCmdState: EXPCMDSTATE): HRESULT; stdcall;

    function Invoke(psiItemArray: IShellItemArray;
                    pbc: IBindCtx): HRESULT; stdcall;

    function GetFlags(out pFlags: EXPCMDFLAGS): HRESULT; stdcall;

    function EnumSubCommands(out ppEnum: IEnumExplorerCommand): HRESULT; stdcall;
  end;

  IID_IExplorerCommand = IExplorerCommand;


  // Interface IExplorerCommandState
  // ===============================
  //
  IExplorerCommandState = interface(IUnknown)
    ['{BDDACB60-7657-47AE-8445-D23E1ACF82AE}']

    function GetState(psiItemArray: IShellItemArray;
                      fOkToBeSlow: BOOL;
                      out pCmdState: EXPCMDSTATE): HRESULT; stdcall;
  end;

  IID_IExplorerCommandState = IExplorerCommandState;


  // Interface IInitializeCommand
  // ============================
  //
  IInitializeCommand = interface(IUnknown)
    ['{85075ACF-231F-40EA-9610-D26B7B58F638}']

    function Initialize(pszCommandName: LPCWSTR;
                        ppb: IPropertyBag): HRESULT; stdcall;
  end;

  IID_IInitializeCommand = IInitializeCommand;


  // Interface IEnumExplorerCommand
  // ==============================
  //
  IEnumExplorerCommand = interface(IUnknown)
    ['{A88826F8-186F-4987-AADE-EA0CEF8FBFE8}']

    function Next(celt: ULONG;
                  pUICommand: PIExplorerCommand;
                  pceltFetched: PULONG): HRESULT; stdcall;

    function Skip(celt: ULONG): HRESULT; stdcall;

    function Reset(): HRESULT; stdcall;

    function Clone(out ppenum: IEnumExplorerCommand): HRESULT; stdcall;
  end;

  IID_IEnumExplorerCommand = IEnumExplorerCommand;


  // Interface IExplorerCommandProvider
  // ==================================
  //
  IExplorerCommandProvider = interface(IUnknown)
    ['{64961751-0835-43C0-8FFE-D57686530E64}']

    function GetCommands(punkSite: IUnknown;
                         const riid: TGUID;
                         out ppv): HRESULT; stdcall;

    function GetCommand(const rguidCommandId: TGUID;
                        const riid: TGUID;
                        out ppv): HRESULT; stdcall;
  end;

  IID_IExplorerCommandProvider = IExplorerCommandProvider;


  // Interface IOpenControlPanel
  // ===========================
  //
  IOpenControlPanel = interface(IUnknown)
    ['{D11AD862-66DE-4DF4-BF6C-1F5621996AF1}']

    function Open(pszName: LPCWSTR;
                  pszPage: LPCWSTR;
                  punkSite: IUnknown): HRESULT; stdcall;

    function GetPath(pszName: LPCWSTR;
                     pszPath: LPWSTR;
                     cchPath: UINT): HRESULT; stdcall;

    function GetCurrentView(out pView: CPVIEW): HRESULT; stdcall;
  end;

  IID_IOpenControlPanel = IOpenControlPanel;


  // Interface IFileSystemBindData
  // =============================
  //
  IFileSystemBindData = interface(IUnknown)
    ['{01E18D10-4D8B-11D2-855D-006008059367}']

    function SetFindData(const pfd: WIN32_FIND_DATAW): HRESULT; stdcall;

    function GetFindData(out pfd: WIN32_FIND_DATAW): HRESULT; stdcall;
  end;

  IID_IFileSystemBindData = IFileSystemBindData;


  // Interface IFileSystemBindData2
  // ==============================
  //
  IFileSystemBindData2 = interface(IFileSystemBindData)
    ['{3ACF075F-71DB-4AFA-81F0-3FC4FDF2A5B8}']

    function SetFileID(liFileID: LARGE_INTEGER): HRESULT; stdcall;

    function GetFileID(out pliFileID: LARGE_INTEGER): HRESULT; stdcall;

    function SetJunctionCLSID(const clsid: TGUID): HRESULT; stdcall;

    function GetJunctionCLSID(out pclsid: CLSID): HRESULT; stdcall;
  end;

  IID_IFileSystemBindData2 = IFileSystemBindData2;


  // Interface ICustomDestinationList
  // ================================
  //
  ICustomDestinationList = interface(IUnknown)
    ['{6332DEBF-87B5-4670-90C0-5E57B408A49E}']

    function SetAppID(pszAppID: LPCWSTR): HRESULT; stdcall;

    function BeginList(out pcMinSlots: UINT;
                       const riid: TGUID;
                       out ppv): HRESULT; stdcall;

    function AppendCategory(pszCategory: LPCWSTR;
                            poa: IObjectArray): HRESULT; stdcall;

    function AppendKnownCategory(category: KNOWNDESTCATEGORY): HRESULT; stdcall;

    function AddUserTasks(poa: IObjectArray): HRESULT; stdcall;

    function CommitList(): HRESULT; stdcall;

    function GetRemovedDestinations(const riid: TGUID;
                                    out ppv): HRESULT; stdcall;

    function DeleteList(pszAppID: LPCWSTR): HRESULT; stdcall;

    function AbortList(): HRESULT; stdcall;
  end;

  IID_ICustomDestinationList = ICustomDestinationList;


  // Interface IApplicationDestinations
  // ==================================
  //
  IApplicationDestinations = interface(IUnknown)
    ['{12337D35-94C6-48A0-BCE7-6A9C69D4D600}']

    function SetAppID(pszAppID: LPCWSTR): HRESULT; stdcall;

    function RemoveDestination(punk: IUnknown): HRESULT; stdcall;

    function RemoveAllDestinations(): HRESULT; stdcall;
  end;

  IID_IApplicationDestinations = IApplicationDestinations;


  // Interface IApplicationDocumentLists
  // ===================================
  //
  IApplicationDocumentLists = interface(IUnknown)
    ['{3C594F9F-9F30-47A1-979A-C9E83D3D0A06}']

    function SetAppID(pszAppID: LPCWSTR): HRESULT; stdcall;

    function GetList(listtype: APPDOCLISTTYPE;
                     cItemsDesired: UINT;
                     const riid: TGUID;
                     out ppv): HRESULT; stdcall;
  end;

  IID_IApplicationDocumentLists = IApplicationDocumentLists;


  // Interface IObjectWithAppUserModelID
  // ===================================
  //
  IObjectWithAppUserModelID = interface(IUnknown)
    ['{36DB0196-9665-46D1-9BA7-D3709EECF9ED}']

    function SetAppID(pszAppID: LPCWSTR): HRESULT; stdcall;

    function GetAppID(out ppszAppID: LPWSTR): HRESULT; stdcall;
  end;

  IID_IObjectWithAppUserModelID = IObjectWithAppUserModelID;


  // Interface IObjectWithPackageFullName
  // ====================================
  //
  IObjectWithPackageFullName = interface(IUnknown)
    ['{ED2AA515-602F-469C-A130-CE69FD0FA878}']

    function GetPackageFullName(out packageFullName: LPWSTR): HRESULT; stdcall;
  end;

  IID_IObjectWithPackageFullName = IObjectWithPackageFullName;


  // Interface IObjectWithProgID
  // ===========================
  //
  IObjectWithProgID = interface(IUnknown)
    ['{71E806FB-8DEE-46FC-BF8C-7748A8A1AE13}']

    function SetProgID(pszProgID: LPCWSTR): HRESULT; stdcall;

    function GetProgID(out ppszProgID: LPWSTR): HRESULT; stdcall;
  end;

  IID_IObjectWithProgID = IObjectWithProgID;


  // Interface IUpdateIDList
  // =======================
  //
  IUpdateIDList = interface(IUnknown)
    ['{6589B6D2-5F8D-4B9E-B7E0-23CDD9717D8C}']

    function Update(pbc: IBindCtx;
                    pidlIn: PCUITEMID_CHILD;
                    out ppidlOut: PITEMID_CHILD): HRESULT; stdcall;
  end;

  IID_IUpdateIDList = IUpdateIDList;


  // Interface IDesktopWallpaper
  // ===========================
  //
  IDesktopWallpaper = interface(IUnknown)
    ['{B92B56A9-8B55-4E14-9A89-0199BBB6F93B}']

    function SetWallpaper(monitorID: LPCWSTR;
                          wallpaper: LPCWSTR): HRESULT; stdcall;

    function GetWallpaper(monitorID: LPCWSTR;
                          out wallpaper: LPWSTR): HRESULT; stdcall;

    function GetMonitorDevicePathAt(monitorIndex: UINT;
                                    out monitorID: LPWSTR): HRESULT; stdcall;

    function GetMonitorDevicePathCount(out count: UINT): HRESULT; stdcall;

    function GetMonitorRECT(monitorID: LPCWSTR;
                            out displayRect: TRect): HRESULT; stdcall;

    function SetBackgroundColor(color: COLORREF): HRESULT; stdcall;

    function GetBackgroundColor(out color: COLORREF): HRESULT; stdcall;

    function SetPosition(position: DESKTOP_WALLPAPER_POSITION): HRESULT; stdcall;

    function GetPosition(out position: DESKTOP_WALLPAPER_POSITION): HRESULT; stdcall;

    function SetSlideshow(items: IShellItemArray): HRESULT; stdcall;

    function GetSlideshow(out items: IShellItemArray): HRESULT; stdcall;

    function SetSlideshowOptions(options: DESKTOP_SLIDESHOW_OPTIONS;
                                 slideshowTick: UINT): HRESULT; stdcall;

    function GetSlideshowOptions(out options: DESKTOP_SLIDESHOW_OPTIONS;
                                 out slideshowTick: UINT): HRESULT; stdcall;

    function AdvanceSlideshow(monitorID: LPCWSTR;
                              direction: DESKTOP_SLIDESHOW_DIRECTION): HRESULT; stdcall;

    function GetStatus(out state: DESKTOP_SLIDESHOW_STATE): HRESULT; stdcall;

    function Enable(enable: BOOL): HRESULT; stdcall;
  end;

  IID_IDesktopWallpaper = IDesktopWallpaper;


  // Interface IHomeGroup
  // ====================
  //
  IHomeGroup = interface(IUnknown)
    ['{7A3BD1D9-35A9-4FB3-A467-F48CAC35E2D0}']

    function IsMember(member: PBOOL): HRESULT; stdcall;

    function ShowSharingWizard(owner: HWND;
                               sharingchoices: PHOMEGROUPSHARINGCHOICES): HRESULT; stdcall;
  end;

  IID_IHomeGroup = IHomeGroup;


  // Interface IInitializeWithPropertyStore
  // ======================================
  //
  IInitializeWithPropertyStore = interface(IUnknown)
    ['{C3E12EB5-7D8D-44F8-B6DD-0E77B34D6DE4}']

    function Initialize(pps: IPropertyStore): HRESULT; stdcall;
  end;

  IID_IInitializeWithPropertyStore = IInitializeWithPropertyStore;


  // Interface IOpenSearchSource
  // ===========================
  //
  IOpenSearchSource = interface(IUnknown)
    ['{F0EE7333-E6FC-479B-9F25-A860C234A38E}']

    function GetResults(hwnd: HWND;
                        pszQuery: LPCWSTR;
                        dwStartIndex: DWORD;
                        dwCount: DWORD;
                        const riid: TGUID;
                        out ppv): HRESULT; stdcall;
  end;

  IID_IOpenSearchSource = IOpenSearchSource;


  // Interface IShellLibrary
  // =======================
  //
  IShellLibrary = interface(IUnknown)
    ['{11A66EFA-382E-451A-9234-1E0E12EF3085}']

    function LoadLibraryFromItem(psiLibrary: IShellItem;
                                 grfMode: DWORD): HRESULT; stdcall;

    function LoadLibraryFromKnownFolder(const kfidLibrary: KNOWNFOLDERID;
                                        grfMode: DWORD): HRESULT; stdcall;

    function AddFolder(psiLocation: IShellItem): HRESULT; stdcall;

    function RemoveFolder(psiLocation: IShellItem): HRESULT; stdcall;

    function GetFolders(lff: LIBRARYFOLDERFILTER;
                        const riid: TGUID;
                        out ppv): HRESULT; stdcall;

    function ResolveFolder(psiFolderToResolve: IShellItem;
                           dwTimeout: DWORD;
                           const riid: TGUID;
                           out ppv): HRESULT; stdcall;

    function GetDefaultSaveFolder(dsft: DEFAULTSAVEFOLDERTYPE;
                                  const riid: TGUID;
                                  out ppv): HRESULT; stdcall;

    function SetDefaultSaveFolder(dsft: DEFAULTSAVEFOLDERTYPE;
                                  psi: IShellItem): HRESULT; stdcall;

    function GetOptions(out plofOptions: LIBRARYOPTIONFLAGS): HRESULT; stdcall;

    function SetOptions(lofMask: LIBRARYOPTIONFLAGS;
                        lofOptions: LIBRARYOPTIONFLAGS): HRESULT; stdcall;

    function GetFolderType(out pftid: FOLDERTYPEID): HRESULT; stdcall;

    function SetFolderType(const ftid: FOLDERTYPEID): HRESULT; stdcall;

    function GetIcon(out ppszIcon: LPWSTR): HRESULT; stdcall;

    function SetIcon(pszIcon: LPCWSTR): HRESULT; stdcall;

    function Commit(): HRESULT; stdcall;

    function Save(psiFolderToSaveIn: IShellItem;
                  pszLibraryName: LPCWSTR;
                  lsf: LIBRARYSAVEFLAGS;
                  out ppsiSavedTo: IShellItem): HRESULT; stdcall;

    function SaveInKnownFolder(const kfidToSaveIn: KNOWNFOLDERID;
                               pszLibraryName: LPCWSTR;
                               lsf: LIBRARYSAVEFLAGS;
                               out ppsiSavedTo: IShellItem): HRESULT; stdcall;
  end;

  IID_IShellLibrary = IShellLibrary;


  // Interface IDefaultFolderMenuInitialize
  // ======================================
  //
  IDefaultFolderMenuInitialize = interface(IUnknown)
    ['{7690AA79-F8FC-4615-A327-36F7D18F5D91}']

    function Initialize(hwnd: HWND;
                        pcmcb: IContextMenuCB;
                        pidlFolder: PCIDLIST_ABSOLUTE;
                        psf: IShellFolder;
                        cidl: UINT;
                        apidl: PCUITEMID_CHILD_ARRAY;
                        punkAssociation: IUnknown;
                        cKeys: UINT;
                        aKeys: PHKEY): HRESULT; stdcall;

    function SetMenuRestrictions(dfmrValues: DEFAULT_FOLDER_MENU_RESTRICTIONS): HRESULT; stdcall;

    function GetMenuRestrictions(dfmrMask: DEFAULT_FOLDER_MENU_RESTRICTIONS;
                                 out pdfmrValues: DEFAULT_FOLDER_MENU_RESTRICTIONS): HRESULT; stdcall;

    function SetHandlerClsid(const rclsid: TGUID): HRESULT; stdcall;
  end;

  IID_IDefaultFolderMenuInitialize = IDefaultFolderMenuInitialize;


  // Interface IApplicationActivationManager
  // =======================================
  //
  IApplicationActivationManager = interface(IUnknown)
    ['{2E941141-7F97-4756-BA1D-9DECDE894A3D}']

    function ActivateApplication(appUserModelId: LPCWSTR;
                                 arguments: LPCWSTR;
                                 options: ACTIVATEOPTIONS;
                                 out processId: DWORD): HRESULT; stdcall;

    function ActivateForFile(appUserModelId: LPCWSTR;
                             itemArray: IShellItemArray;
                             verb: LPCWSTR;
                             out processId: DWORD): HRESULT; stdcall;

    function ActivateForProtocol(appUserModelId: LPCWSTR;
                                 itemArray: IShellItemArray;
                                 out processId: DWORD): HRESULT; stdcall;
  end;

  IID_IApplicationActivationManager = IApplicationActivationManager;


  // Interface IVirtualDesktopManager
  // ================================
  //
  IVirtualDesktopManager = interface(IUnknown)
    ['{A5CD92FF-29BE-454C-8D04-D82879FB3F1B}']

    function IsWindowOnCurrentVirtualDesktop(topLevelWindow: HWND;
                                             out onCurrentDesktop: BOOL): HRESULT; stdcall;

    function GetWindowDesktopId(topLevelWindow: HWND;
                                out desktopId: TGUID): HRESULT; stdcall;

    function MoveWindowToDesktop(topLevelWindow: HWND;
                                 const desktopId: TGUID): HRESULT; stdcall;

  end;

  IID_IVirtualDesktopManager = IVirtualDesktopManager;


  // Interface IAssocHandlerInvoker
  // ==============================
  //
  IAssocHandlerInvoker = interface(IUnknown)
    ['{92218CAB-ECAA-4335-8133-807FD234C2EE}']

    function SupportsSelection: HRESULT; stdcall;

    function Invoke: HRESULT; stdcall;
  end;

  IID_IAssocHandlerInvoker = IAssocHandlerInvoker;


  // Interface IAssocHandler
  // =======================
  //
  IAssocHandler = interface(IUnknown)
    ['{F04061AC-1659-4A3F-A954-775AA57FC083}']

    function GetName(out ppsz: LPWSTR): HRESULT; stdcall;

    function GetUIName(out ppsz: LPWSTR): HRESULT; stdcall;

    function GetIconLocation(out ppszPath: LPWSTR;
                             pIndex: PInteger): HRESULT; stdcall;

    function IsRecommended: HRESULT; stdcall;

    function MakeDefault(pszDescription: LPCWSTR): HRESULT; stdcall;

    function Invoke(pdo: IDataObject): HRESULT; stdcall;

    function CreateInvoker(pdo: IDataObject;
                           out ppInvoker: IAssocHandlerInvoker): HRESULT; stdcall;
  end;

  IID_IAssocHandler = IAssocHandler;


  // Interface IEnumAssocHandlers
  // ============================
  //
  IEnumAssocHandlers = interface(IUnknown)
    ['{973810AE-9599-4B88-9E4D-6EE98C9552DA}']

    function Next(celt: ULONG;
                  out rgelt: IAssocHandler;
                  pceltFetched: PULONG): HRESULT; stdcall;
  end;

  IID_IEnumAssocHandlers = IEnumAssocHandlers;


  // Interface IDataObjectProvider
  // =============================
  //
  IDataObjectProvider = interface(IUnknown)
    ['{3D25F6D6-4B2A-433C-9184-7C33AD35D001}']

    function GetDataObject(out dataObject: IDataObject): HRESULT; stdcall;

    function SetDataObject(dataObject: IDataObject): HRESULT; stdcall;
  end;

  IID_IDataObjectProvider = IDataObjectProvider;


  // Interface IDataTransferManagerInterop
  // =====================================
  //
  IDataTransferManagerInterop = interface(IUnknown)
    ['{3A3DCD6C-3EAB-43DC-BCDE-45671CE800C8}']

    function GetForWindow(appWindow: HWND;
                          const riid: TGUID;
                          out dataTransferManager): HRESULT; stdcall;

    function ShowShareUIForWindow(appWindow: HWND): HRESULT; stdcall;
  end;

  IID_IDataTransferManagerInterop = IDataTransferManagerInterop;


  // Interface IFrameworkInputPaneHandler
  // ====================================
  //
  IFrameworkInputPaneHandler = interface(IUnknown)
    ['{226C537B-1E76-4D9E-A760-33DB29922F18}']

    function Showing(prcInputPaneScreenLocation: PRECT;
                     fEnsureFocusedElementInView: BOOL): HRESULT; stdcall;

    function Hiding(fEnsureFocusedElementInView: BOOL): HRESULT; stdcall;
  end;

  IID_IFrameworkInputPaneHandler = IFrameworkInputPaneHandler;


  // Interface IFrameworkInputPane
  // =============================
  //
  IFrameworkInputPane = interface(IUnknown)
    ['{5752238B-24F0-495A-82F1-2FD593056796}']

    function Advise(pWindow: IUnknown;
                    pHandler: IFrameworkInputPaneHandler;
                    out pdwCookie: DWORD): HRESULT; stdcall;

    function AdviseWithHWND(hwnd: HWND;
                            pHandler: IFrameworkInputPaneHandler;
                            out pdwCookie: DWORD): HRESULT; stdcall;

    function Unadvise(dwCookie: DWORD): HRESULT; stdcall;

    function Location(out prcInputPaneScreenLocation: TRECT): HRESULT; stdcall;

  end;

  IID_IFrameworkInputPane = IFrameworkInputPane;


  // Interface IAppVisibilityEvents
  // ===============================
  //
  IAppVisibilityEvents = interface(IUnknown)
    ['{6584CE6B-7D82-49C2-89C9-C6BC02BA8C38}']

    function AppVisibilityOnMonitorChanged(hMonitor: HMONITOR;
                                           previousMode: MONITOR_APP_VISIBILITY;
                                           currentMode: MONITOR_APP_VISIBILITY): HRESULT; stdcall;

    function LauncherVisibilityChange(currentVisibleState: BOOL): HRESULT; stdcall;
  end;

  IID_IAppVisibilityEvents = IAppVisibilityEvents;


  // Interface IAppVisibility
  // ========================
  //
  IAppVisibility = interface(IUnknown)
    ['{2246EA2D-CAEA-4444-A3C4-6DE827E44313}']

    function GetAppVisibilityOnMonitor(hMonitor: HMONITOR;
                                       out pMode: MONITOR_APP_VISIBILITY): HRESULT; stdcall;

    function IsLauncherVisible(out pfVisible: BOOL): HRESULT; stdcall;

    function Advise(pCallback: IAppVisibilityEvents;
                    out pdwCookie: DWORD): HRESULT; stdcall;

    function Unadvise(dwCookie: DWORD): HRESULT; stdcall;
  end;

  IID_IAppVisibility = IAppVisibility;


  // Interface IPackageExecutionStateChangeNotification
  // ==================================================
  //
  IPackageExecutionStateChangeNotification = interface(IUnknown)
    ['{1BB12A62-2AD8-432B-8CCF-0C2C52AFCD5B}']

    function OnStateChanged(pszPackageFullName: LPCWSTR;
                            pesNewState: PACKAGE_EXECUTION_STATE): HRESULT; stdcall;
  end;

  IID_IPackageExecutionStateChangeNotification =
    IPackageExecutionStateChangeNotification;


  // Interface IPackageDebugSettings
  // ===============================
  //
  IPackageDebugSettings = interface(IUnknown)
    ['{F27C3930-8029-4AD1-94E3-3DBA417810C1}']

    function EnableDebugging(packageFullName: LPCWSTR;
                             debuggerCommandLine: LPCWSTR;
                             environment: PZZWSTR): HRESULT; stdcall;

    function DisableDebugging(packageFullName: LPCWSTR): HRESULT; stdcall;

    function Suspend(packageFullName: LPCWSTR): HRESULT; stdcall;

    function Resume(packageFullName: LPCWSTR): HRESULT; stdcall;

    function TerminateAllProcesses(packageFullName: LPCWSTR): HRESULT; stdcall;

    function SetTargetSessionId(sessionId: ULONG): HRESULT; stdcall;

    function EnumerateBackgroundTasks(packageFullName: LPCWSTR;
                                      out taskCount: ULONG;
                                      out taskIds: LPCGUID;
                                      out taskNames: PPWideChar): HRESULT; stdcall;

    function ActivateBackgroundTask(taskId: LPCGUID): HRESULT; stdcall;

    function StartServicing(packageFullName: LPCWSTR): HRESULT; stdcall;

    function StopServicing(packageFullName: LPCWSTR): HRESULT; stdcall;

    function StartSessionRedirection(packageFullName: LPCWSTR;
                                     sessionId: ULONG): HRESULT; stdcall;

    function StopSessionRedirection(packageFullName: LPCWSTR): HRESULT; stdcall;

    function GetPackageExecutionState(packageFullName: LPCWSTR;
                                      out packageExecutionState: PACKAGE_EXECUTION_STATE): HRESULT; stdcall;

    function RegisterForPackageStateChanges(packageFullName: LPCWSTR;
                                            pPackageExecutionStateChangeNotification: IPackageExecutionStateChangeNotification;
                                            out pdwCookie: DWORD): HRESULT; stdcall;

    function UnregisterForPackageStateChanges(dwCookie: DWORD): HRESULT; stdcall;
  end;

  IID_IPackageDebugSettings = IPackageDebugSettings;


  // Interface IPackageDebugSettings2
  // ================================
  //
  IPackageDebugSettings2 = interface(IPackageDebugSettings)
    ['{6E3194BB-AB82-4D22-93F5-FABDA40E7B16}']

    function EnumerateApps(packageFullName: LPCWSTR;
                           appCount: PULONG;
                           out appUserModelIds: PLPWSTR;
                           out appDisplayNames: PLPWSTR): HRESULT; stdcall;
  end;

  IID_IPackageDebugSettings2 = IPackageDebugSettings2;


  // Interface ISuspensionDependencyManager
  // ======================================
  //
  ISuspensionDependencyManager = interface(IUnknown)
    ['{52B83A42-2543-416A-81D9-C0DE7969C8B3}']

    function RegisterAsChild(processHandle: THANDLE): HRESULT; stdcall;

    function GroupChildWithParent(childProcessHandle: THANDLE): HRESULT; stdcall;

    function UngroupChildFromParent(childProcessHandle: THANDLE): HRESULT; stdcall;
  end;

  IID_ISuspensionDependencyManager = ISuspensionDependencyManager;


  // Interface IExecuteCommandApplicationHostEnvironment
  // ===================================================
  //
  IExecuteCommandApplicationHostEnvironment = interface(IUnknown)
    ['{18B21AA9-E184-4FF0-9F5E-F882D03771B3}']

    function GetValue(out pahe: AHE_TYPE): HRESULT; stdcall;
  end;

  IID_IExecuteCommandApplicationHostEnvironment = IExecuteCommandApplicationHostEnvironment;


  // Interface IExecuteCommandHost
  // =============================
  //
  IExecuteCommandHost = interface(IUnknown)
    ['{4B6832A2-5F04-4C9D-B89D-727A15D103E7}']

    function GetUIMode(out pUIMode: EC_HOST_UI_MODE): HRESULT; stdcall;
  end;

  IID_IExecuteCommandHost = IExecuteCommandHost;


  // Interface IApplicationDesignModeSettings
  // ========================================
  //
  IApplicationDesignModeSettings = interface(IUnknown)
    ['{2A3DEE9A-E31D-46D6-8508-BCC597DB3557}']

    function SetNativeDisplaySize(nativeDisplaySizePixels: SIZE): HRESULT; stdcall;

    function SetScaleFactor(scaleFactor: DEVICE_SCALE_FACTOR): HRESULT; stdcall;

    function SetApplicationViewState(viewState: APPLICATION_VIEW_STATE): HRESULT; stdcall;

    function ComputeApplicationSize(out applicationSizePixels: SIZE): HRESULT; stdcall;

    function IsApplicationViewStateSupported(viewState: APPLICATION_VIEW_STATE;
                                             nativeDisplaySizePixels: SIZE;
                                             scaleFactor: DEVICE_SCALE_FACTOR;
                                             out supported: BOOL): HRESULT; stdcall;

    function TriggerEdgeGesture(edgeGestureKind: EDGE_GESTURE_KIND): HRESULT; stdcall;
  end;

  IID_IApplicationDesignModeSettings = IApplicationDesignModeSettings;


  // Interface IApplicationDesignModeSettings2
  // =========================================
  //
  IApplicationDesignModeSettings2 = interface(IApplicationDesignModeSettings)
    ['{490514E1-675A-4D6E-A58D-E54901B4CA2F}']

    function SetNativeDisplayOrientation(nativeDisplayOrientation: NATIVE_DISPLAY_ORIENTATION): HRESULT; stdcall;

    function SetApplicationViewOrientation(viewOrientation: APPLICATION_VIEW_ORIENTATION): HRESULT; stdcall;

    function SetAdjacentDisplayEdges(adjacentDisplayEdges: ADJACENT_DISPLAY_EDGES): HRESULT; stdcall;

    function SetIsOnLockScreen(isOnLockScreen: BOOL): HRESULT; stdcall;

    function SetApplicationViewMinWidth(viewMinWidth: APPLICATION_VIEW_MIN_WIDTH): HRESULT; stdcall;

    function GetApplicationSizeBounds(out minApplicationSizePixels: SIZE;
                                      out maxApplicationSizePixels: SIZE): HRESULT; stdcall;

    function GetApplicationViewOrientation(applicationSizePixels: SIZE;
                                           out viewOrientation: APPLICATION_VIEW_ORIENTATION): HRESULT; stdcall;

  end;

  IID_IApplicationDesignModeSettings2 = IApplicationDesignModeSettings2;


  // Interface ILaunchTargetMonitor
  // ==============================
  //
  ILaunchTargetMonitor = interface(IUnknown)
    ['{266FBC7E-490D-46ED-A96B-2274DB252003}']

    function GetMonitor(out monitor: HMONITOR): HRESULT; stdcall;
  end;

  IID_ILaunchTargetMonitor = ILaunchTargetMonitor;


  // Interface ILaunchSourceViewSizePreference
  // =========================================
  //
  ILaunchSourceViewSizePreference = interface(IUnknown)
    ['{E5AA01F7-1FB8-4830-8720-4E6734CBD5F3}']

    function GetSourceViewToPosition(out hwnd: HWND): HRESULT; stdcall;

    function GetSourceViewSizePreference(out sourceSizeAfterLaunch: APPLICATION_VIEW_SIZE_PREFERENCE): HRESULT; stdcall;

  end;

  IID_ILaunchSourceViewSizePreference = ILaunchSourceViewSizePreference;


  // Interface ILaunchTargetViewSizePreference
  // =========================================
  //
  ILaunchTargetViewSizePreference = interface(IUnknown)
    ['{2F0666C6-12F7-4360-B511-A394A0553725}']

    function GetTargetViewSizePreference(out targetSizeOnLaunch: APPLICATION_VIEW_SIZE_PREFERENCE): HRESULT; stdcall;

  end;

  IID_ILaunchTargetViewSizePreference = ILaunchTargetViewSizePreference;


  // Interface ILaunchSourceAppUserModelId
  // =====================================
  //
  ILaunchSourceAppUserModelId = interface(IUnknown)
    ['{989191AC-28FF-4CF0-9584-E0D078BC2396}']

    function GetAppUserModelId(
      out launchingApp: LPWSTR): HRESULT; stdcall;

  end;

  IID_ILaunchSourceAppUserModelId = ILaunchSourceAppUserModelId;


  // Interface IInitializeWithWindow
  // ===============================
  //
  IInitializeWithWindow = interface(IUnknown)
    ['{3E68D4BD-7135-4D10-8018-9FB6D9F33FA1}']

    function Initialize(_hwnd: HWND): HRESULT; stdcall;
  end;

  IID_IInitializeWithWindow = IInitializeWithWindow;


  // Interface IHandlerInfo
  // ======================
  //
  IHandlerInfo = interface(IUnknown)
    ['{997706EF-F880-453B-8118-39E1A2D2655A}']

    function GetApplicationDisplayName(out value: LPWSTR): HRESULT; stdcall;

    function GetApplicationPublisher(out value: LPWSTR): HRESULT; stdcall;

    function GetApplicationIconReference(out value: LPWSTR): HRESULT; stdcall;

  end;

  IID_IHandlerInfo = IHandlerInfo;


  // Interface IHandlerInfo2
  // =======================
  //
  IHandlerInfo2 = interface(IHandlerInfo)
    ['{31CCA04C-04D3-4EA9-90DE-97B15E87A532}']

    function GetApplicationId(out value: LPWSTR): HRESULT; stdcall;
  end;

  IID_IHandlerInfo2 = IHandlerInfo2;


  // Interface IHandlerActivationHost
  // ================================
  //
  IHandlerActivationHost = interface(IUnknown)
    ['{35094A87-8BB1-4237-96C6-C417EEBDB078}']

    function BeforeCoCreateInstance(const clsidHandler: CLSID;
                                    itemsBeingActivated: IShellItemArray;
                                    handlerInfo: IHandlerInfo): HRESULT; stdcall;

    function BeforeCreateProcess(applicationPath: LPCWSTR;
                                 commandLine: LPCWSTR;
                                 handlerInfo: IHandlerInfo): HRESULT; stdcall;

  end;

  IID_IHandlerActivationHost = IHandlerActivationHost;


  // Interface IAppActivationUIInfo
  // ==============================
  //
  IAppActivationUIInfo = interface(IUnknown)
    ['{ABAD189D-9FA3-4278-B3CA-8CA448A88DCB}']

    function GetMonitor(out value: HMONITOR): HRESULT; stdcall;

    function GetInvokePoint(out value: POINT): HRESULT; stdcall;

    function GetShowCommand(out value: Integer): HRESULT; stdcall;

    function GetShowUI(out value: BOOL): HRESULT; stdcall;

    function GetKeyState(out value: DWORD): HRESULT; stdcall;

  end;

  IID_IAppActivationUIInfo = IAppActivationUIInfo;


  // Interface IContactManagerInterop
  // ================================
  //
  IContactManagerInterop = interface(IUnknown)
    ['{99EACBA7-E073-43B6-A896-55AFE48A0833}']

    function ShowContactCardForWindow(appWindow: HWND;
                                      contact: IUnknown;
                                      const selection: TRECT;
                                      preferredPlacement: FLYOUT_PLACEMENT): HRESULT; stdcall;

  end;

  IID_IContactManagerInterop = IContactManagerInterop;


  // Interface IShellIconOverlayIdentifier
  // =====================================
  //
  IShellIconOverlayIdentifier = interface(IUnknown)
    ['{0C6C4200-C589-11D0-999A-00C04FD655E1}']

    function IsMemberOf(pwszPath: LPCWSTR;
                        dwAttrib: DWORD): HRESULT; stdcall;

    function GetOverlayInfo(pwszIconFile: LPWSTR;
                            cchMax: Integer;
                            out pIndex: Integer;
                            out pdwFlags: DWORD): HRESULT; stdcall;

    function GetPriority(out pPriority: Integer): HRESULT; stdcall;

  end;

  IID_IShellIconOverlayIdentifier = IShellIconOverlayIdentifier;


  // Interface IBannerNotificationHandler
  // ====================================
  //
  IBannerNotificationHandler = interface(IUnknown)
    ['{8D7B2BA7-DB05-46A8-823C-D2B6DE08EE91}']

    function OnBannerEvent(const notification: BANNER_NOTIFICATION): HRESULT; stdcall;

  end;

  IID_IBannerNotificationHandler = IBannerNotificationHandler;


  // Interface ISortColumnArray
  // ==========================
  //
  ISortColumnArray = interface(IUnknown)
    ['{6DFC60FB-F2E9-459B-BEB5-288F1A7C7D54}']

    function GetCount(out columnCount: UINT): HRESULT; stdcall;

    function GetAt(index: UINT;
                   out sortcolumn: SORTCOLUMN): HRESULT; stdcall;

    function GetSortType(out AType: SORT_ORDER_TYPE): HRESULT; stdcall;

  end;

  IID_ISortColumnArray = ISortColumnArray;


  // Interface IPropertyKeyStore
  // ===========================
  //
  IPropertyKeyStore = interface(IUnknown)
    ['{75BD59AA-F23B-4963-ABA4-0B355752A91B}']

    function GetKeyCount(out keyCount: Integer): HRESULT; stdcall;

    function GetKeyAt(index: Integer;
                      out pkey: PROPERTYKEY): HRESULT; stdcall;

    function AppendKey(const key: PROPERTYKEY): HRESULT; stdcall;

    function DeleteKey(index: Integer): HRESULT; stdcall;

    function IsKeyInStore(const key: PROPERTYKEY): HRESULT; stdcall;

    function RemoveKey(const key: PROPERTYKEY): HRESULT; stdcall;

  end;

  IID_IPropertyKeyStore = IPropertyKeyStore;



  // Type aliases that depend on translated interfaces
  // ================================================
  //
type
  IShellLink = IShellLinkW;

  // Constant aliases that depend on translated interface IIDs
  // ========================================================
  //
const

  CGID_DeskBand = IID_IDeskBand;
  // See above for other declarations.

// Helper function declarations
// ============================
//
procedure FreeIDListArray(ppidls: Pointer;
                          cItems: UINT);
procedure FreeIDListArrayFull(ppidls: Pointer;
                              cItems: UINT);
procedure FreeIDListArrayChild(ppidls: Pointer;
                               cItems: UINT);

// API function declarations
function SHSimpleIDListFromPath(pszPath: LPCWSTR): PIDLIST_ABSOLUTE; stdcall;

function SHCreateItemFromIDList(pidl: PCIDLIST_ABSOLUTE;
                                const riid: REFIID;
                                out ppv): HRESULT; stdcall;

function SHCreateItemFromParsingName(pszPath: LPCWSTR;
                                     pbc: IBindCtx;
                                     const riid: REFIID;
                                     out ppv): HRESULT; stdcall;

function SHCreateItemWithParent(pidlParent: PCIDLIST_ABSOLUTE;
                                psfParent: IShellFolder;
                                pidl: PCUITEMID_CHILD;
                                const riid: REFIID;
                                out ppvItem): HRESULT; stdcall;

function SHCreateItemFromRelativeName(psiParent: IShellItem;
                                      pszName: LPCWSTR;
                                      pbc: IBindCtx;
                                      const riid: REFIID;
                                      out ppv): HRESULT; stdcall;

function SHCreateItemInKnownFolder(kfid: REFKNOWNFOLDERID;
                                   dwKFFlags: DWORD;
                                   pszItem: LPCWSTR;
                                   const riid: REFIID;
                                   out ppv): HRESULT; stdcall;

function SHGetIDListFromObject(punk: IUnknown;
                               out ppidl: PIDLIST_ABSOLUTE): HRESULT; stdcall;

function SHGetItemFromObject(punk: IUnknown;
                             const riid: REFIID;
                             out ppv): HRESULT; stdcall;

function SHGetPropertyStoreFromIDList(pidl: PCIDLIST_ABSOLUTE;
                                      flags: GETPROPERTYSTOREFLAGS;
                                      const riid: REFIID;
                                      out ppv): HRESULT; stdcall;

function SHGetPropertyStoreFromParsingName(pszPath: LPCWSTR;
                                           pbc: IBindCtx;
                                           flags: GETPROPERTYSTOREFLAGS;
                                           const riid: REFIID;
                                           out ppv): HRESULT; stdcall;

function SHGetNameFromIDList(pidl: PCIDLIST_ABSOLUTE;
                             sigdnName: SIGDN;
                             out ppszName: LPWSTR): HRESULT; stdcall;

function SHGetItemFromDataObject(pdtobj: IDataObject;
                                 dwFlags: DATAOBJ_GET_ITEM_FLAGS;
                                 const riid: REFIID;
                                 out ppv): HRESULT; stdcall;

function SHCreateShellItemArray(pidlParent: PCIDLIST_ABSOLUTE;
                                psf: IShellFolder;
                                cidl: UINT;
                                ppidl: PCUITEMID_CHILD_ARRAY;
                                out ppsiItemArray: IShellItemArray): HRESULT; stdcall;

function SHCreateShellItemArrayFromDataObject(pdo: IDataObject;
                                              const riid: REFIID;
                                              out ppv): HRESULT; stdcall;

function SHCreateShellItemArrayFromIDLists(cidl: UINT;
                                           rgpidl: PCIDLIST_ABSOLUTE_ARRAY;
                                           out ppsiItemArray: IShellItemArray): HRESULT; stdcall;

function SHCreateShellItemArrayFromShellItem(psi: IShellItem;
                                             const riid: REFIID;
                                             out ppv: Pointer): HRESULT; stdcall;

function SHCreateAssociationRegistration(const riid: REFIID;
                                         out ppv: Pointer): HRESULT; stdcall;

function SHCreateDefaultExtractIcon(const riid: REFIID;
                                    out ppv): HRESULT; stdcall;

function SetCurrentProcessExplicitAppUserModelID(AppID: LPCWSTR): HRESULT; stdcall;

function GetCurrentProcessExplicitAppUserModelID(out AppID: LPWSTR): HRESULT; stdcall;

function SHGetTemporaryPropertyForItem(psi: IShellItem;
                                       const propkey: REFPROPERTYKEY;
                                       out ppropvar: PROPVARIANT): HRESULT; stdcall;

function SHSetTemporaryPropertyForItem(psi: IShellItem;
                                       const propkey: REFPROPERTYKEY;
                                       propvar: REFPROPVARIANT): HRESULT; stdcall;

function SHShowManageLibraryUI(psiLibrary: IShellItem;
                               hwndOwner: HWND;
                               pszTitle: LPCWSTR;
                               pszInstruction: LPCWSTR;
                               lmdOptions: LIBRARYMANAGEDIALOGOPTIONS): HRESULT; stdcall;

function SHResolveLibrary(psiLibrary: IShellItem): HRESULT; stdcall;

function SHAssocEnumHandlers(pszExtra: LPCWSTR;
                             afFilter: ASSOC_FILTER;
                             out ppEnumHandler: IEnumAssocHandlers): HRESULT; stdcall;

function SHAssocEnumHandlersForProtocolByApplication(protocol: LPCWSTR;
                                                     const riid: REFIID;
                                                     out enumHandlers: Pointer): HRESULT; stdcall;


// Additional Prototypes for ALL interfaces

// End of Additional Prototypes

implementation


const
  Shell32Lib = 'shell32.dll';
  ExplorerFrameLib = 'ExplorerFrame.dll';


procedure FreeIDListArray(ppidls: Pointer;
                          cItems: UINT);
var
  I: UINT;
  Items: PPointer;

begin

  Items := PPointer(ppidls);

  for I := 0 to cItems - 1 do
    begin

      CoTaskMemFree(Items^);
      Inc(Items);
    end;

  CoTaskMemFree(ppidls);
end;


procedure FreeIDListArrayFull(ppidls: Pointer;
                              cItems: UINT);

begin

  FreeIDListArray(ppidls,
                  cItems);
end;


procedure FreeIDListArrayChild(ppidls: Pointer;
                               cItems: UINT);

begin

  FreeIDListArray(ppidls,
                  cItems);
end;



function SHSimpleIDListFromPath; external Shell32Lib name 'SHSimpleIDListFromPath';
function SHCreateItemFromIDList; external Shell32Lib name 'SHCreateItemFromIDList';
function SHCreateItemFromParsingName; external Shell32Lib name 'SHCreateItemFromParsingName';
function SHCreateItemWithParent; external Shell32Lib name 'SHCreateItemWithParent';
function SHCreateItemFromRelativeName; external Shell32Lib name 'SHCreateItemFromRelativeName';
function SHCreateItemInKnownFolder; external Shell32Lib name 'SHCreateItemInKnownFolder';
function SHGetIDListFromObject; external Shell32Lib name 'SHGetIDListFromObject';
function SHGetItemFromObject; external Shell32Lib name 'SHGetItemFromObject';
function SHGetPropertyStoreFromIDList; external Shell32Lib name 'SHGetPropertyStoreFromIDList';
function SHGetPropertyStoreFromParsingName; external Shell32Lib name 'SHGetPropertyStoreFromParsingName';
function SHGetNameFromIDList; external Shell32Lib name 'SHGetNameFromIDList';
function SHGetItemFromDataObject; external Shell32Lib name 'SHGetItemFromDataObject';
function SHCreateShellItemArray; external Shell32Lib name 'SHCreateShellItemArray';
function SHCreateShellItemArrayFromDataObject; external Shell32Lib name 'SHCreateShellItemArrayFromDataObject';
function SHCreateShellItemArrayFromIDLists; external Shell32Lib name 'SHCreateShellItemArrayFromIDLists';
function SHCreateShellItemArrayFromShellItem; external Shell32Lib name 'SHCreateShellItemArrayFromShellItem';
function SHCreateAssociationRegistration; external Shell32Lib name 'SHCreateAssociationRegistration';
function SHCreateDefaultExtractIcon; external Shell32Lib name 'SHCreateDefaultExtractIcon';
function SetCurrentProcessExplicitAppUserModelID; external Shell32Lib name 'SetCurrentProcessExplicitAppUserModelID';
function GetCurrentProcessExplicitAppUserModelID; external Shell32Lib name 'GetCurrentProcessExplicitAppUserModelID';
function SHGetTemporaryPropertyForItem; external Shell32Lib name 'SHGetTemporaryPropertyForItem';
function SHSetTemporaryPropertyForItem; external Shell32Lib name 'SHSetTemporaryPropertyForItem';
function SHShowManageLibraryUI; external Shell32Lib name 'SHShowManageLibraryUI';
function SHResolveLibrary; external Shell32Lib name 'SHResolveLibrary';
function SHAssocEnumHandlers; external Shell32Lib name 'SHAssocEnumHandlers';
function SHAssocEnumHandlersForProtocolByApplication; external Shell32Lib name 'SHAssocEnumHandlersForProtocolByApplication';


// Implement Additional functions here.


end.
