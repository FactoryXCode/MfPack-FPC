# HEOS CLI samples for FPC and Lazarus

HEOS is a sidekick implementation inside MfPack. This Windows x64 port lives at \MfPack\HEOS-CLI; it does not require a separate HEOS source checkout. The Delphi originals remain in FactoryX-HEOS-CLI.

Use Free Pascal 3.2.2 and Lazarus 4.8 on Windows 10 22H2 or newer. The HEOS/AVR APIs and console examples use native Windows sockets and the FPC libraries. The full remotes also use the containing MfPack's src units for Media Foundation and WASAPI. All application helpers and custom controls are included here.

## Applications

| Sample | Lazarus project | Purpose |
| --- | --- | --- |
| HEOS CLI demo | Examples/HeosCliDemo.lpi | Read players, sources and groups; optionally watch events. |
| AVR CLI demo | AVR/Samples/AvrCliDemo.lpi | Read receiver and zone status using the AVR protocol. |
| Small remote | Examples/MfHeosRemote/MfHeosRemote.lpi | Standard LCL controls, player selection, transport, volume and file serving. |
| API remote | Examples/HEOSRemoteApi/HEOSRemote.lpi | Full remote with playlist/database editing, streaming and AVR controls. |
| AVR remote | AVR/Samples/HEOSRemote/HEOSRemote.lpi | Full remote with radio browsing, website-to-AAC resolution, artwork and capability-aware controls. |

## Build and run

From this directory, run PowerShell:

    .\Build.ps1

The helper builds all five applications into Build/<target>/<target>.exe. Use -LazarusRoot if Lazarus is not installed at C:\lazarus. To build one sample:

    .\Build.ps1 -Targets HEOSRemoteAvr

The projects use relative paths. Open the .lpi files in Lazarus for editing; executable and unit output go into each sample's bin and lib directories. The full remotes need sqlite3.dll beside the executable. Build.ps1 deploys the bundled x64 runtime; Deploy-Runtime.ps1 also prepares the IDE output directories.

Before opening the full forms in the designer, compile RDJRemote/Controls/HeosControlsRuntime.lpk and install HeosControlsDesign.lpk, then compile Controls/HeosSampleControlsRuntime.lpk and install HeosSampleControlsDesign.lpk. Runtime builds register the controls themselves and do not require installing packages into the IDE.

## Validation

    .\Test.ps1 -PythonPath C:\path\to\python.exe

The suite builds the targets and runs localhost HEOS/AVR/HTTP fixtures, resource/database and normal-shutdown checks, AAC format checks, and browser-color checks. Python 3.10 or newer is needed only for the simulator runners. Test profiles and media stay in the build directory. Tests do not contact a physical receiver or start a live broadcast.

## Layout

Source and AVR/Source contain the reusable APIs. RDJRemote remains the facade used by RDJ Pro. compat contains local Unicode, JSON, SQLDB, Windows and LCL adapters. Controls contains the additional sample buttons; HEOS controls and their packages remain under RDJRemote/Controls. Tests/Fixtures/RDJ contains copied regression dependencies, not links to another project.

The browser's owner drawing explicitly uses each control's Color and Font. Selected rows retain system highlight colors. Both full remotes preserve this fix in their LWFileBrowserExDlg units.

See [the technical notes](TECHNICAL-PAPER.md), [command catalog](COMMANDS.md), [AVR notes](AVR/README.md), and [port validation](PORTING.md). Original FactoryX copyright and license headers are preserved; see LICENSE.
