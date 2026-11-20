# RDJ for FPC and Lazarus

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

## Configure RDJ Pro

## 8. First Run

Run RDJPro.

On first start, RDJ Pro creates its setup `.ini` file and opens the setup dialog.

## 9. Configure General Audio

In the General setup page:

1. Select the main output device. This is the master/PA output.
2. Enable headphone/PFL output if needed.
3. Select the headphone output device.
4. Choose the number of channel decks.
5. Choose the number of loopback decks.
6. Set the capture buffer size.
7. Enable and select the microphone input if needed.

### Optional: Stream the Masterdeck to HEOS

1. Put the PC and HEOS receiver on a network where they can reach each other.
2. Open **HEOS** from RDJ's main window. In **Settings**, use **Find HEOS Device**
   and select the receiver, or enter its IPv4 address.
3. Leave **PC IP** blank for automatic routing, or enter the PC's reachable LAN
   address. The default HTTP port is 8890; allow RDJ through the private-network
   firewall so the receiver can fetch the audio.
4. Ensure the receiver's main zone is on. Start audio through RDJ's decks and
   set RDJ Master Left/Right volume above zero.
5. Return to **Console** and click **Stream RDJ**. Check the status/log and HTTP
   request count, and allow time for the receiver to buffer the stream.
6. Adjust the HEOS Remote volume for listening level. RDJ Master Volume and
   balance already affect the encoded stream; receiver volume and balance act
   afterwards. The two volume sliders are independent. RDJ Master at zero sends
   silence even with receiver volume raised.
7. Click **Stream RDJ** again to stop streaming. Closing the window keeps it
   running; exiting RDJ stops the sender.

This is direct audio streaming from the Masterdeck. FxServe, Caddy and the browser
broadcast setup below are not required. Receiver commands use TCP ports 1255
(HEOS) and 23 (AVR); the receiver must remain network-accessible for those
controls to work. See [HEOS integration notes](../HEOS-INTEGRATION.md).

## 10. Configure Recording

In the recorder settings:

1. Select the recorder output folder.
2. Choose the required recording format.
3. Set capture buffer size and latency.
4. Enable stream-switch detection if needed.
5. Enable the option to avoid overwriting active files if desired.

## 11. Install FxServe or Caddy For Browser Broadcast

If you want browser broadcasting, install FxServe or Caddy. The next sections
describe the older Caddy layout. For FxServe, use this server folder:

```text
C:\FxServe
```

Set the RDJ Pro web paths to:

```text
Root path:              \\ServerName\FxServe\www
Config file:            \\ServerName\FxServe\FxServe.ini
NowPlaying JSON file:   \\ServerName\FxServe\www\nowplaying.json
Artwork path:           \\ServerName\FxServe\www\Artwork
Video/stream path:      \\ServerName\FxServe\www\Stream
```

Run `Install-FxServe.cmd`, then use FxServeAdmin to start FxServe and stop the
alternative proxy. Continue with the Caddy steps below only when Caddy is your
chosen web server.

1. Unpack the Caddy package.
2. Copy the Caddy web files to a folder such as:

```text
C:\Caddy
```

3. Make sure the folder contains at least:

```text
caddy.exe
caddy.cff
index.html
nowplaying.json
artwork\
stream\
```

## 12. Configure Caddy in RDJ Pro

Open the RDJ Pro setup dialog and configure the Caddy paths.

For a local Caddy setup:

```text
Caddy path:              C:\Caddy
Caddy config file:       C:\Caddy\caddy.cff
NowPlaying JSON file:    C:\Caddy\nowplaying.json
Artwork path:            C:\Caddy\artwork
Video/stream path:       C:\Caddy\stream
Caddy command:           caddy.exe run --config "C:\Caddy\caddy.cff" --adapter caddyfile
Log file:                Caddy.log
```

For a Caddy server on another machine, use UNC paths, for example:

```text
\\ServerName\Caddy
\\ServerName\Caddy\nowplaying.json
\\ServerName\Caddy\artwork
\\ServerName\Caddy\stream
```

## 13. Enable Caddy Access Logging

Listener count depends on the Caddy access log. The Caddy config should contain:

```caddyfile
log {
    output file C:\Caddy\Caddy.log
    format json
}
```

Restart Caddy after changing the config.

## 14. Start Caddy

Start Caddy with the configured command, for example:

```text
caddy.exe run --config "C:\Caddy\caddy.cff" --adapter caddyfile
```

If Caddy runs on another machine, start it on that machine.

## 15. Router And HTTPS Setup

For public internet access:

1. Forward HTTP port 80 to the web-server machine.
2. Forward HTTPS port 443 to the web-server machine.
3. Configure your DNS or DDNS hostname.
4. Let Caddy manage its certificate, or run `Install-Renewal.cmd` once for FxServe.

For local testing, this step is not required.

## 16. Start Broadcasting

In RDJ Pro:

1. Load or start your decks.
2. Open the media/broadcast server dialog.
3. Select the camera or static video source if video is required.
4. Enable broadcast.
5. Open the FxServe or Caddy web page in a browser.
6. Confirm that audio/video plays and now-playing metadata updates.

## 17. Verify The Browser Files

During broadcast, the selected stream folder should update with files like:

```text
init.mp4
live.json
patched_frag_000001.m4s
patched_frag_000002.m4s
```

The selected web root should update:

```text
nowplaying.json
```

## 18. Recommended Long-Run Settings

For long broadcasts:

1. Disable Windows sleep or enable the RDJ Pro sleep override option.
2. Do not close the laptop lid when RDJ pro is running on a laptop, unless the lid action is configured correctly.
3. Keep FxServe or Caddy running.
4. Make sure the selected stream folder is writable.
5. Watch RDJPro debug/memory heartbeat messages during testing.

## 19. Common Problems

Missing controls in Lazarus:

Install the MfComponentsDesign and RDJControlsDesign Lazarus packages described above before opening forms in the designer.

Project does not compile:

Check the Delphi search paths.

SQLite cannot load, or Windows reports a bad image:

Install the bundled x64 sqlite3.dll beside the executable. The FPC port uses SQLDB/SQLite and requires no FireDAC installation. Check that the process and DLL both target Windows x64.

Playlist Composer opens an empty database unexpectedly:

Check the `Data` folder beside the executable you actually started. Debug and
Release output folders each have their own database unless you copy or redirect
the data deliberately.

Browser shows no metadata:

Check the `nowplaying.json` path.

Browser does not play video/audio:

Check that `live.json`, `init.mp4`, and `patched_frag_*.m4s` are being written to the selected stream folder.

Listener count stays at zero:

Check that Caddy JSON access logging is enabled and that RDJPro points to the correct Caddy log file.

Broadcast stops after sleep:

Check Windows power settings and the RDJ Pro sleep override setting.

Copyright FactoryX. Original source and documentation license notices apply.
