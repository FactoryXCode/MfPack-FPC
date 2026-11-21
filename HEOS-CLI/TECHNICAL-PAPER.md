# HEOS/AVR implementation notes for Free Pascal

The reusable HEOS API serializes commands, parses UTF-8 JSON frames, correlates replies, bounds event backlogs and dispatches callbacks on the caller's thread. AVR uses CR-terminated receiver commands on its separate protocol. Timeouts isolate late responses; uncertain writes are not automatically replayed after reconnect.

The port uses native Windows sockets, FPC generics and fpjson. Reusable console API units have no LCL dependency. GUI samples use Lazarus LCL; full streaming samples use the containing MfPack/src Media Foundation and WASAPI bindings. There are no source references to another checkout.

## Ownership

Socket workers own their connections. Forms own request objects, dispatch timers and media resources. Thread callbacks are explicit methods rather than Delphi anonymous methods. UI animation uses owned LCL timers. Capability and UPnP XML use DOM/XMLRead and free documents explicitly. Pending URL probes are retired by a separate worker that owns no form references.

Playlist connections and transactions use the copied SQLDB adapter. SQLite is an x64 runtime dependency deployed from the bundled Redist archive. Unicode paths use wide Windows APIs; protocol and LCL boundaries convert explicitly between UnicodeString and UTF-8. Settings are saved through checked temporary files and atomic replacement.

## Projects and design packages

Five relative .lpi projects mirror the console and GUI samples. HEOS controls live under RDJRemote/Controls. Additional sample buttons and their runtime/design packages live under Controls. Runtime registration permits command-line builds without installing IDE packages; the designer requires the design packages to be installed locally.

## Validation scope

Test.ps1 builds and runs console checks, localhost HEOS/AVR/HTTP simulators, resource/database tests, normal message-loop shutdown, browser pixel/font checks and the AAC settings matrix. Private access is changed only in generated fixture copies. Profiles, media and databases are isolated beneath the build directory.

See PORTING.md for the final checks and limitations. The protocol PDFs copied under Docs are upstream reference material; the command catalog is COMMANDS.md. Physical receiver, service-account and live capture behavior must be checked in the intended network and audio setup.
