# Lazarus application notes

This application is maintained inside MfPack/HEOS-CLI. Open HEOSRemote.lpi, not the upstream Delphi project. Source, AVR APIs, helpers, controls and tests are included locally. Only MfPack/src is shared with the containing SDK.

LCL controls use UTF-8 strings at their boundaries; API records and path operations use UnicodeString with explicit conversions. JSON adapters use fpjson, playlist storage uses SQLDB/SQLite, and UPnP/capability XML uses DOM/XMLRead with explicit ownership. Unsupported VCL-only resource properties were removed while preserving layout, event wiring and custom colors.

Destructors tolerate partial form construction and release streaming resources without updating missing controls. Test-only fixtures expose private members without changing the application units. See ../../Test.ps1 and ../../PORTING.md for validation.
