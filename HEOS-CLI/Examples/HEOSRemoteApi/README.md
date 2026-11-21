# API-based HEOS remote for FPC/Lazarus

Open HEOSRemote.lpi or run Build.ps1 -Targets HEOSRemoteApi from the HEOS-CLI root. The port targets Windows x64 with FPC 3.2.2 and Lazarus 4.8. It uses local HEOS helpers and controls, plus the containing MfPack's src units.

Before opening forms in the designer, install both local design packages described in [the root README](../../README.md). Runtime builds do not require IDE package installation. The full form layouts are .lfm resources; changes belong in these files, not the Delphi .dfm originals.

sqlite3.dll must be beside the executable. Build.ps1 deploys the bundled x64 runtime, and Deploy-Runtime.ps1 prepares Lazarus bin/x86_64-win64 output directories. The playlist database is Data/RDJLibrary.db beside the executable; do not replace an existing user library with a test database.

The remote keeps receiver work off the UI thread. Requests are owned and joined or retired during shutdown; LCL timers replace anonymous animation threads. Start with a reachable receiver address and select its HEOS player. Streaming needs a PC address and port reachable from the receiver. No receiver commands are sent by --smoke.

LWFileBrowserExDlg explicitly passes Color and Font into its owner-draw helper for both the folder list and locations dropdown. The dark background and white font fix is included.

Offline validation loads all child forms, opens a temporary playlist database, verifies browser colors and closes through the normal LCL message loop. Receiver-dependent playback, capture and network topology still need checking on the intended hardware.
