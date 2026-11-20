# RDJ Radio for FPC and Lazarus

These Windows x64 ports use Free Pascal 3.2.2 and Lazarus 4.8. Windows 10 22H2 or later and MfPack 4.1.0 are required. This is the FPC sample distribution; it has no separate Git repository. The upstream Delphi project is [FactoryX-RDJ](https://github.com/FactoryXCode/FactoryX-RDJ).

## Source layout

- Radio: `D:\PROJECTS\FPC\MfPack\samples\MFRDJ Samples\MfRdjJ`.
- Pro: `D:\PROJECTS\FPC\MfPack\samples\MFRDJ Samples\MfRdjPro`.
- Shared RDJ controls: `../Controls`; FPC adapters: `../compat`.
- HEOS/AVR API and receiver controls: `D:\PROJECTS\FPC\MfPack-FPC\HEOS-CLI`.
- FxRecord and its administration app: `MfRdjPro/FxRecord`.
- FxServe remains under `D:\PROJECTS\FPC\MfPack\Proxy Servers\FxServe`.

The Delphi dependency at `D:\PROJECTS\FactoryX-HEOS-CLI` is maintained separately. The FPC application does not use that source path.

## Build and open in Lazarus

Open `MfRdjJ.lpi` in either application folder. Both upstream programs retain the historical executable name `MfRdjJ.exe`, so build outputs are separated by folder. The project files use relative include and unit paths.

From PowerShell, build both applications with:

```powershell
& 'D:\PROJECTS\FPC\MfPack\build-rdj.ps1' -Toolchain Lazarus
```

Use `-Toolchain FPC` for standalone FPC, `-Groups RADIO` or `-Groups PRO` to select an app, and `-RunTests` to run the offline regression suite. Tests create temporary databases and generated media under the build directory. They do not start a public broadcast or contact a HEOS receiver.

For form-designer support, open and compile `samples/MfComponents/MfComponentsRuntime.lpk`, then install `MfComponentsDesign.lpk`. Open the RDJ Controls folder, compile `RDJControlsRuntime.lpk`, then install `RDJControlsDesign.lpk`. For Pro's HEOS dialog, compile `HEOS-CLI/RDJRemote/Controls/HeosControlsRuntime.lpk` and install `HeosControlsDesign.lpk`. Register the runtime package links before compiling dependent design packages. Command-line application builds already register their custom streaming classes and do not require an IDE rebuild.

## Runtime dependencies and data

Place the x64 `sqlite3.dll` beside the executable; the build helper copies it from the bundled `Redist/sqlite-dll-win-x64-3530000.zip`. The FPC port uses SQLDB with SQLite in place of FireDAC, preserving the RDJ schema and parameterized queries. Existing application settings and audio routing remain applicable. Back up an existing library database before opening it with any updated application version.

Start the application normally to choose master, cue and microphone endpoints in Setup. Use Unicode file paths normally. The startup switch `--smoke` checks construction and teardown of the main, browser and media-server forms without opening Setup or starting a broadcast.

## Radio, Pro and services

Radio provides deck mixing, playlist/tag editing, effects, local recording and Icecast audio broadcasting. Pro adds video composition, archive MP4 recording, live fMP4/MSE broadcasting, Cast and HEOS output. Configure external services and credentials explicitly in Setup before going on air.

FxRecord was already ported and tested. Its FPC source now belongs under `MfRdjPro/FxRecord`, matching the Delphi sample layout. Its administration application remains in the nested `FxRecordAdmin` folder. The Proxy Servers build helper resolves the relocated source for the FxRecord group; FxServe retains its existing location.

## Scope of validation

See `D:\PROJECTS\FPC\MfPack\docs\RDJ_PORTING.md` for the final compiler and runtime evidence. Local regressions cover playlist transactions and persistence, Unicode metadata, offline Media Foundation decoding, form lifetimes, archive MP4 encoding/reopen and live fMP4 fragment extraction. Physical HEOS receivers, live public servers, Cast hardware, device hot-unplug and long-running on-air operation require system-specific checks.

Copyright FactoryX. Original source and documentation license notices apply.
