// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: WinApi - Shared
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.ShErrors.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 24-07-2025
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: Shell API error code values.
//
// Organisation: FactoryX
// Initiator(s): Tony (maXcomX), Peter (OzShips)
// Contributor(s): Tony Kalf (maXcomX), Peter Larson (ozships), Ciaran (Ciaran3)
//
//------------------------------------------------------------------------------
// CHANGE LOG
// Date       Person              Reason
// ---------- ------------------- ----------------------------------------------
// 15/11/2026 All                 Eels release  SDK 10.0.28000.2705 (Windows 11)
//------------------------------------------------------------------------------
//
// Remarks: When using MfPack, use this unit and not the outdated
//          Upstream error-code definitions adapted from Embarcadero; preserve SDK values.
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
// Source: WinError.h
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
unit WinApi.ShErrors;

{$I MfPack.Fpc.inc}

interface

uses
  
  {WinApi}
  WinApi.WinError;

const

  //  COPYENGINE codes use FACILITY_SHELL and 0 in the second lowest byte
  // Success/Informational codes
  COPYENGINE_S_YES                    = HRESULT($00270001);
  COPYENGINE_S_NOT_HANDLED            = HRESULT($00270003);
  COPYENGINE_S_USER_RETRY             = HRESULT($00270004);
  COPYENGINE_S_USER_IGNORED           = HRESULT($00270005);
  COPYENGINE_S_MERGE                  = HRESULT($00270006);
  COPYENGINE_S_DONT_PROCESS_CHILDREN  = HRESULT($00270008);
  COPYENGINE_S_ALREADY_DONE           = HRESULT($0027000A);
  COPYENGINE_S_PENDING                = HRESULT($0027000B);
  COPYENGINE_S_KEEP_BOTH              = HRESULT($0027000C);
  COPYENGINE_S_CLOSE_PROGRAM          = HRESULT($0027000D);  // Close the program using the current file
  COPYENGINE_S_COLLISIONRESOLVED      = HRESULT($0027000E);  // Returned by a transfer source when a collision occurs                         // during a file operation but the source resolved the collision
                                                                        // on the users behalf.

  COPYENGINE_S_PROGRESS_PAUSE         = HRESULT($0027000F);
  COPYENGINE_S_PENDING_DELETE         = HRESULT($00270010);  // Returned by initiating async delete operation. It's different                            // from COPYENGINE_S_PENDING which is used for operation queued due to error.
  COPYENGINE_S_PENDING_BATCH_COPY     = HRESULT($00270011);  // Returned by initiating batch copy operation. Like COPYENGINE_S_PENDING_DELETE,                        // it indicates a non-error queued retry of the operation.

  // Failure/Error codes
  COPYENGINE_E_USER_CANCELLED         = HRESULT($80270000);  // User wants to canceled entire job
  COPYENGINE_E_CANCELLED              = HRESULT($80270001);  // Engine wants to canceled entire job, don't set the CANCELLED bit
  COPYENGINE_E_REQUIRES_ELEVATION     = HRESULT($80270002);  // Need to elevate the process to complete the operation

  COPYENGINE_E_SAME_FILE              = HRESULT($80270003);  // Source and destination file are the same
  COPYENGINE_E_DIFF_DIR               = HRESULT($80270004);  // Trying to rename a file into a different location, use move instead
  COPYENGINE_E_MANY_SRC_1_DEST        = HRESULT($80270005);  // One source specified, multiple destinations

  COPYENGINE_E_DEST_SUBTREE           = HRESULT($80270009);  // The destination is a sub-tree of the source
  COPYENGINE_E_DEST_SAME_TREE         = HRESULT($8027000A);  // The destination is the same folder as the source

  COPYENGINE_E_FLD_IS_FILE_DEST       = HRESULT($8027000B);  // Existing destination file with same name as folder
  COPYENGINE_E_FILE_IS_FLD_DEST       = HRESULT($8027000C);  // Existing destination folder with same name as file

  COPYENGINE_E_FILE_TOO_LARGE         = HRESULT($8027000D);  // File too large for destination file system
  COPYENGINE_E_REMOVABLE_FULL         = HRESULT($8027000E);  // Destination device is full and happens to be removable

  COPYENGINE_E_DEST_IS_RO_CD          = HRESULT($8027000F);  // Destination is a Read-Only CDRom, possibly unformatted
  COPYENGINE_E_DEST_IS_RW_CD          = HRESULT($80270010);  // Destination is a Read/Write CDRom, possibly unformatted
  COPYENGINE_E_DEST_IS_R_CD           = HRESULT($80270011);  // Destination is a Recordable (AudioL) CDRom, possibly unformatted

  COPYENGINE_E_DEST_IS_RO_DVD         = HRESULT($80270012);  // Destination is a Read-Only DVD, possibly unformatted
  COPYENGINE_E_DEST_IS_RW_DVD         = HRESULT($80270013);  // Destination is a Read/Wrote DVD, possibly unformatted
  COPYENGINE_E_DEST_IS_R_DVD          = HRESULT($80270014);  // Destination is a Recordable (AudioL) DVD, possibly unformatted

  COPYENGINE_E_SRC_IS_RO_CD           = HRESULT($80270015);  // Source is a Read-Only CDRom, possibly unformatted
  COPYENGINE_E_SRC_IS_RW_CD           = HRESULT($80270016);  // Source is a Read/Write CDRom, possibly unformatted
  COPYENGINE_E_SRC_IS_R_CD            = HRESULT($80270017);  // Source is a Recordable (AudioL) CDRom, possibly unformatted

  COPYENGINE_E_SRC_IS_RO_DVD          = HRESULT($80270018);  // Source is a Read-Only DVD, possibly unformatted
  COPYENGINE_E_SRC_IS_RW_DVD          = HRESULT($80270019);  // Source is a Read/Wrote DVD, possibly unformatted
  COPYENGINE_E_SRC_IS_R_DVD           = HRESULT($8027001A);  // Source is a Recordable (AudioL) DVD, possibly unformatted

  COPYENGINE_E_INVALID_FILES_SRC      = HRESULT($8027001B);  // Invalid source path
  COPYENGINE_E_INVALID_FILES_DEST     = HRESULT($8027001C);  // Invalid destination path
  COPYENGINE_E_PATH_TOO_DEEP_SRC      = HRESULT($8027001D);  // Source Files within folders where the overall path is longer than MAX_PATH
  COPYENGINE_E_PATH_TOO_DEEP_DEST     = HRESULT($8027001E);  // Destination files would be within folders where the overall path is longer than MAX_PATH
  COPYENGINE_E_ROOT_DIR_SRC           = HRESULT($8027001F);  // Source is a root directory, cannot be moved or renamed
  COPYENGINE_E_ROOT_DIR_DEST          = HRESULT($80270020);  // Destination is a root directory, cannot be renamed
  COPYENGINE_E_ACCESS_DENIED_SRC      = HRESULT($80270021);  // Security problem on source
  COPYENGINE_E_ACCESS_DENIED_DEST     = HRESULT($80270022);  // Security problem on destination
  COPYENGINE_E_PATH_NOT_FOUND_SRC     = HRESULT($80270023);  // Source file does not exist, or is unavailable
  COPYENGINE_E_PATH_NOT_FOUND_DEST    = HRESULT($80270024);  // Destination file does not exist, or is unavailable
  COPYENGINE_E_NET_DISCONNECT_SRC     = HRESULT($80270025);  // Source file is on a disconnected network location
  COPYENGINE_E_NET_DISCONNECT_DEST    = HRESULT($80270026);  // Destination file is on a disconnected network location
  COPYENGINE_E_SHARING_VIOLATION_SRC  = HRESULT($80270027);  // Sharing Violation on source
  COPYENGINE_E_SHARING_VIOLATION_DEST = HRESULT($80270028);  // Sharing Violation on destination

  COPYENGINE_E_ALREADY_EXISTS_NORMAL  = HRESULT($80270029);  // Destination exists, cannot replace
  COPYENGINE_E_ALREADY_EXISTS_READONLY= HRESULT($8027002A);  // Destination with read-only attribute exists, cannot replace
  COPYENGINE_E_ALREADY_EXISTS_SYSTEM  = HRESULT($8027002B);  // Destination with system attribute exists, cannot replace
  COPYENGINE_E_ALREADY_EXISTS_FOLDER  = HRESULT($8027002C);  // Destination folder exists, cannot replace
  COPYENGINE_E_STREAM_LOSS            = HRESULT($8027002D);  // Secondary Stream information would be lost
  COPYENGINE_E_EA_LOSS                = HRESULT($8027002E);  // Extended Attributes would be lost
  COPYENGINE_E_PROPERTY_LOSS          = HRESULT($8027002F);  // Property would be lost
  COPYENGINE_E_PROPERTIES_LOSS        = HRESULT($80270030);  // Properties would be lost
  COPYENGINE_E_ENCRYPTION_LOSS        = HRESULT($80270031);  // Encryption would be lost
  COPYENGINE_E_DISK_FULL              = HRESULT($80270032);  // Entire operation likely won't fit
  COPYENGINE_E_DISK_FULL_CLEAN        = HRESULT($80270033);  // Entire operation likely won't fit, clean-up wizard available
  COPYENGINE_E_EA_NOT_SUPPORTED       = HRESULT($80270034);  // Volume does not support Extended Attributes
  COPYENGINE_E_CANT_REACH_SOURCE      = HRESULT($80270035);  // Can't reach source folder

  COPYENGINE_E_RECYCLE_UNKNOWN_ERROR  = HRESULT($80270035);  // ???
  COPYENGINE_E_RECYCLE_FORCE_NUKE     = HRESULT($80270036);  // Recycling not available (usually turned offL)
  COPYENGINE_E_RECYCLE_SIZE_TOO_BIG   = HRESULT($80270037);  // Item is too large for the recycle-bin
  COPYENGINE_E_RECYCLE_PATH_TOO_LONG  = HRESULT($80270038);  // Folder is too deep to fit in the recycle-bin
  COPYENGINE_E_RECYCLE_BIN_NOT_FOUND  = HRESULT($8027003A);  // Recycle bin could not be found or is unavailable
  COPYENGINE_E_NEWFILE_NAME_TOO_LONG  = HRESULT($8027003B);  // Name of the new file being created is too long
  COPYENGINE_E_NEWFOLDER_NAME_TOO_LONG= HRESULT($8027003C);  // Name of the new folder being created is too long
  COPYENGINE_E_DIR_NOT_EMPTY          = HRESULT($8027003D);  // The directory being processed is not empty
  COPYENGINE_E_FAT_MAX_IN_ROOT        = HRESULT($8027003E);  // A Fat drive cannot only store and rename a limited number of items on the root.
  COPYENGINE_E_ACCESSDENIED_READONLY  = HRESULT($8027003F);  // The item cannot be modified because it is set to readonly.

  COPYENGINE_E_REDIRECTED_TO_WEBPAGE  = HRESULT($80270040);  // The server redirected the download request to a web page.
  COPYENGINE_E_SERVER_BAD_FILE_TYPE   = HRESULT($80270041);  // The server returned data with an unexpected MIME type or extension.

  COPYENGINE_E_INTERNET_ITEM_UNAVAILABLE    = HRESULT($80270042);  // The item is unavailable currently due to no internet connectivity

  COPYENGINE_E_CANNOT_MOVE_FROM_RECYCLE_BIN = HRESULT($80270043);  // The item cannot be moved out of the recycle bin, can perform other operations like restored/delete

  COPYENGINE_E_CANNOT_MOVE_SHARED_FOLDER    = HRESULT($80270044);  // The item cannot be moved from a grouped folder to another shared folder

  COPYENGINE_E_INTERNET_ITEM_STORAGE_PROVIDER_ERROR  = HRESULT($80270045);  // The item is unavailable currently due to storage provider being in error state
  COPYENGINE_E_INTERNET_ITEM_STORAGE_PROVIDER_PAUSED = HRESULT($80270046);  // The item is unavailable currently due to storage provider being paused

  COPYENGINE_E_REQUIRES_EDP_CONSENT   = HRESULT($80270047);  // The file can only be copied if the user consents to override the EDP block
  COPYENGINE_E_BLOCKED_BY_EDP_POLICY  = HRESULT($80270048);  // The file cannot be copied per EDP policy
  COPYENGINE_E_REQUIRES_EDP_CONSENT_FOR_REMOVABLE_DRIVE     = HRESULT($80270049);  // The file can be copied as personal if the user consents to override the EDP block
  COPYENGINE_E_BLOCKED_BY_EDP_FOR_REMOVABLE_DRIVE           = HRESULT($8027004A);  // The file can only be copied as work protected per EDP policy
  COPYENGINE_E_RMS_REQUIRES_EDP_CONSENT_FOR_REMOVABLE_DRIVE = HRESULT($8027004B);  // The file can be copied as personal if the user consents to override the EDP block
  COPYENGINE_E_RMS_BLOCKED_BY_EDP_FOR_REMOVABLE_DRIVE       = HRESULT($8027004C);  // The file can only be copied as work protected per EDP policy

  COPYENGINE_E_WARNED_BY_DLP_POLICY      = HRESULT($8027004D);  // The file is warned against being copied per DLP policy
  COPYENGINE_E_BLOCKED_BY_DLP_POLICY     = HRESULT($8027004E);  // The file cannot be copied per DLP policy
  COPYENGINE_E_SILENT_FAIL_BY_DLP_POLICY = HRESULT($8027004F);  // The file cannot be copied per DLP policy, and the caller is requested to silently fail

  COPYENGINE_E_SUPPRESS_DIALOG        = HRESULT($80270050);  // Returned by copy engine to indicate that the shell dialog should not be shown in favor to the cloud provider's or the app's dialog

  // error codes without a more specific group use FACILITY_SHELL and 0x01 in the second lowest byte.
  NETCACHE_E_NEGATIVE_CACHE           = HRESULT($80270100);  // The item requested is in the negative net parsing cache
  EXECUTE_E_LAUNCH_APPLICATION        = HRESULT($80270101);  // for returned by command delegates to indicate that they did no work
  SHELL_E_WRONG_BITDEPTH              = HRESULT($80270102);  // returned when trying to create a thumbnail extractor at too low a bitdepth for high fidelity
  LINK_E_DELETE                       = HRESULT($80270103);  // returned from IShellLink::Resolve when SLR_OFFER_DELETE_WITHOUT_FILE is passed and the user requested to delete the item
  STORE_E_NEWER_VERSION_AVAILABLE     = HRESULT($80270104);  // returned from IAppItemsStateModify to indicate a commit failed because there is newer version already available

  // File Placeholder success and error codes
  E_FILE_PLACEHOLDER_NOT_INITIALIZED  = HRESULT($80270110);  // The placeholder file or property store isn't initialized.
  E_FILE_PLACEHOLDER_VERSION_MISMATCH = HRESULT($80270111);  // The sync engine detected that the local placeholder file's version doesn't match the latest version.
  E_FILE_PLACEHOLDER_SERVER_TIMED_OUT = HRESULT($80270112);  // The placeholder platform timed out waiting for a stream resolver call that didn't complete in time.
  E_FILE_PLACEHOLDER_STORAGEPROVIDER_NOT_FOUND = HRESULT($80270113);  // The placeholder platform cannot find the storage provider for the placeholder.

  // Camera Roll error codes
  CAMERAROLL_E_NO_DOWNSAMPLING_REQUIRED= HRESULT($80270120);  // The provided image didn't require downsampling because it was small enough already

  // Error codes for when Shell denies a WinRT app activation request via Window Manager/View Manager.
  // These should be considered subsets of NAV_E_SHELLVALIDATIONFAILED.
  // By the time the activation request reached shell, the scenario was already over and the activation is intentionally denied (not an error).
  E_ACTIVATIONDENIED_USERCLOSE        = HRESULT($80270130);
  // The shell hit a critical error while handling the activation request and cannot process it correctly, so the activation must be denied.
  E_ACTIVATIONDENIED_SHELLERROR       = HRESULT($80270131);
  // The shell restarted while the activation was in-progress, and it is unable to process it properly.
  E_ACTIVATIONDENIED_SHELLRESTART     = HRESULT($80270132);
  // Placeholder for an unexpected error that we cannot definitively map into one of the above buckets. Not expected to fire in practice.
  E_ACTIVATIONDENIED_UNEXPECTED       = HRESULT($80270133);
  // The shell was not ready when the activation started, so the activation was aborted immediately.
  E_ACTIVATIONDENIED_SHELLNOTREADY    = HRESULT($80270134);

  // Library error/failure code
  LIBRARY_E_NO_SAVE_LOCATION          = HRESULT($80270200);
  LIBRARY_E_NO_ACCESSIBLE_LOCATION    = HRESULT($80270201);


  // User Tile error/failure codes
  E_USERTILE_UNSUPPORTEDFILETYPE   =   HRESULT($80270210);

  // User Tile error codes that map to the WinRT enum Windows.System.UserProfile.SetAccountPictureResult
  E_USERTILE_CHANGEDISABLED           = HRESULT($80270211);
  E_USERTILE_LARGEORDYNAMIC           = HRESULT($80270212);
  E_USERTILE_VIDEOFRAMESIZE           = HRESULT($80270213);
  E_USERTILE_FILESIZE                 = HRESULT($80270214);


  // Immersive Accessibility Docking Service Error Codes
  IMM_ACC_DOCKING_E_INSUFFICIENTHEIGHT= HRESULT($80270230);
  IMM_ACC_DOCKING_E_DOCKOCCUPIED         = HRESULT($80270231);

  // Immersive Shell Startup Failure Code
  IMSC_E_SHELL_COMPONENT_STARTUP_FAILURE = HRESULT($80270233);  // An immersive shell component failed to start correctly

  // Shell Service Host Startup Failure Code
  SHC_E_SHELL_COMPONENT_STARTUP_FAILURE  = HRESULT($80270234);  // A shell service host component failed to start correctly

  // Tile notifications - Failure to initialize the notification platform
  E_TILE_NOTIFICATIONS_PLATFORM_FAILURE  = HRESULT($80270249);

  E_SHELL_EXTENSION_BLOCKED              = HRESULT($80270301);

  E_IMAGEFEED_CHANGEDISABLED             = HRESULT($80270310);


  // Additional Prototypes for ALL interfaces

  // end of Additional Prototypes

implementation

  // Implement Additional Prototypes here.

end.
