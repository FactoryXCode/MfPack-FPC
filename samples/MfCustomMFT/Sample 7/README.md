# Sample 7 - A DTS decoder for Media Foundation

Version: 4.1.0

## Requirements

- Free Pascal 3.2.2, targeting Windows x64.
- Lazarus 4.8 for opening the supplied Lazarus projects.
- MfPack 4.1.0 or later, with its FPC-compatible SDK units.
- Windows 10 or later.
- SDK declarations based on Windows SDK 10.0.28000.2705 (Windows 11).
- Matching 64-bit C bridge and FFmpeg runtime DLLs.

This sample implements a Media Foundation Transform (MFT) that wraps FFmpeg's
DTS decoder. An application can request PCM output through Media Foundation
without calling FFmpeg directly.

It shows how Free Pascal, a small C bridge, FFmpeg
and Media Foundation work together while keeping FFmpeg's internal C structures
outside the Pascal code.

The FPC port retains the original folder names. In particular, `Delphi/` now
contains the FPC-compatible Pascal sources and Lazarus DLL project. The folder
name does not mean that the Delphi compiler is required.

## The parts involved

There are three main layers:

```text
MfPack application / Media Foundation
                 |
                 | IMFTransform calls
                 v
        MfPackDtsMFT.dll (FPC)
                 |
                 | exported C functions, cdecl
                 v
       MfPackDtsBridge.dll (C)
                 |
                 | FFmpeg API
                 v
 avcodec + avutil + swresample DLLs
```

### 1. The MFT

`Delphi/MfDtsDecoderMFT.pas` implements `IMFTransform`, the interface that Media
Foundation uses to negotiate media types and exchange samples.

It accepts compressed DTS audio and advertises one fixed output format:

- signed 16-bit PCM;
- two interleaved channels, stereo;
- 48,000 samples per second;
- 192,000 bytes per second.

The MFT copies the input timestamp and calculates the output duration from the
number of decoded PCM bytes.

`Delphi/MfPackDtsMFT.dpr` is the COM DLL entry point.
`Delphi/MfPackDtsMFT.lpi` is its Lazarus project. The DLL exports the COM
class-factory and registration functions needed for activation and registration
as a Media Foundation audio decoder.

### 2. The C bridge

FFmpeg is a C library. Translating its complete API into Pascal would introduce
many records, constants and version-dependent details. Instead, the bridge
exposes a small interface:

```text
create decoder
send a DTS packet
ask how many PCM bytes are ready
read the PCM bytes
flush or drain the decoder
destroy the decoder
```

This interface is declared in `Bridge/MfPackDtsBridge.h` and implemented in
`Bridge/MfPackDtsBridge.c`.

`Delphi/MfDtsBridgeApi.pas` contains the matching Pascal declarations. Both
sides use compatible parameter types and the `cdecl` calling convention.
No assembly or machine-code programming is required.

The Pascal code never accesses an `AVCodecContext`, `AVPacket`, `AVFrame` or
`SwrContext`. It receives an opaque decoder pointer and passes that pointer
back to the bridge. The C code owns the FFmpeg objects and uses the matching
FFmpeg headers.

The exported function `mfpack_dts_bridge_abi` returns an interface version.
The Pascal loader checks this value before using the bridge. An incompatible
change to the exported interface must also change its ABI version.

### 3. The Pascal bridge loader

`Delphi/MfDtsBridgeApi.pas` loads `MfPackDtsBridge.dll` from the directory
containing `MfPackDtsMFT.dll`, resolves its exports with `GetProcAddress` and
checks the ABI version.

This keeps the FFmpeg dependency separate from COM activation. Media Foundation
can inspect the MFT without a working bridge, while DTS input-type negotiation
fails with `MF_E_TOPO_CODEC_NOT_FOUND` if the required runtime cannot be loaded
or initialized.

## What happens to one DTS sample?

The normal data flow is:

1. Media Foundation calls `ProcessInput` with a compressed DTS sample.
2. The Pascal MFT obtains a contiguous buffer from that sample.
3. It sends the compressed bytes to `MfPackDtsBridge.dll`.
4. The bridge passes the packet to FFmpeg's `dca` decoder.
5. FFmpeg produces decoded audio frames when enough input is available.
6. `libswresample` converts and downmixes those frames to 48 kHz, 16-bit stereo
   PCM.
7. The bridge queues the PCM bytes.
8. The MFT reads the available bytes into its pending output buffer.
9. Media Foundation calls `ProcessOutput` and receives a PCM sample with its
   timestamp and duration.

A compressed packet does not always produce output immediately. The bridge
therefore separates sending input, checking available output and reading PCM.

On `MFT_MESSAGE_COMMAND_FLUSH`, the MFT clears its pending output and resets
the decoder's buffered state. The bridge also exposes a separate drain operation
for returning buffered audio at the end of a stream.

## Folder layout

```text
Bridge/       C bridge source and FFmpeg build notes
Delphi/       FPC-compatible MFT sources and Lazarus DLL project
Installer/    Original Inno Setup and package-build scripts
Runtime/      Supplied Win32 and Win64 runtime DLL sets
Tests/        C bridge smoke test and FPC-compatible MFT smoke client
ThirdParty/   FFmpeg source, license and reproducible-build information
```

The original C bridge, native runtime DLLs, installer files and third-party
materials are retained. Porting the Pascal MFT does not rebuild those components.
The FPC validation described below covers Windows x64.

## Building with FPC or Lazarus

Run the build wrapper from the FPC MfPack root. For example:

```powershell
.\build-custom-mft.ps1 `
  -BuildDirectory .\build\dts-fpc `
  -Toolchain FPC `
  -Groups S7,S7TEST `
  -RunTests
```

To build and test through Lazarus instead:

```powershell
.\build-custom-mft.ps1 `
  -BuildDirectory .\build\dts-lazarus `
  -Toolchain Lazarus `
  -Groups S7,S7TEST `
  -RunTests
```

`S7` builds the decoder DLL. `S7TEST` builds the supplied local-registration
smoke client. Omit `-RunTests` to compile only.

The wrapper builds the decoder before its client, stages the supplied Win64
bridge and FFmpeg dependencies, and places the newly compiled decoder beside
the test executable. It uses private build directories and Lazarus profiles.

You can also open `Delphi/MfPackDtsMFT.lpi` directly in Lazarus. Its source
search paths are relative to the FPC MfPack tree, and its target is a Windows
x64 library. A direct project build does not stage the bridge dependencies;
place them beside the resulting DLL before using the decoder.

### Rebuilding the native runtime

If the supplied native DLLs need to be rebuilt:

1. Build the reduced FFmpeg shared libraries using `Bridge/build-ffmpeg.md`.
2. Build `MfPackDtsBridge.dll` against the headers and import libraries from
   that same FFmpeg build.
3. Place the bridge and matching FFmpeg DLLs in `Runtime/Win64`.
4. Build the Pascal MFT with FPC or Lazarus.
5. Run the decoder checks before packaging the runtime.

All DLLs loaded into one process must have the same architecture. A 64-bit MFT
cannot load a 32-bit bridge or FFmpeg DLL. The retained Win32 files do not
constitute validation of an FPC Win32 build.

`Installer/Build-Package.ps1` belongs to the original packaging workflow. Its
build assumptions must be checked before using it with FPC-produced binaries;
installer creation and system registration were not part of the FPC validation.

## Testing

`Tests/MfDtsBridgeSmoke.c` tests the C bridge directly. It is useful for
diagnosing missing native dependencies and bridge ABI mismatches.

`Tests/MfDtsMftSmoke.dpr`, with its Lazarus `.lpi`, loads the COM DLL, registers
its class factory within the current process, enumerates the MFT and negotiates
DTS input to PCM output. It also contains a Source Reader file-decoding path
when a media filename is supplied.

The FPC MfPack test suite adds two checks under `tests/CustomMft`:

- `MfMftDllChecks` checks exported factories, transform activation, stream counts
  and the DLL's unload policy.
- `MfDtsDecodeChecks` sends a generated silent DTS frame directly to the newly
  compiled transform and verifies 2,048 PCM output bytes across three decoder
  lifetimes, including drain and flush operations.

These checks passed with standalone FPC 3.2.2 and Lazarus/FPC on Windows x64.
They use process-local activation and registration; they do not call
`DllRegisterServer` or write COM/MFT registry entries.

Direct transform decoding passed. End-to-end DTS file decoding through the
Source Reader remains unverified: the raw DTS and generated DTS-in-MP4/M2TS
fixtures tried during validation were rejected by the Source Reader. A working
decoder alone does not guarantee that Media Foundation can open a particular
container or expose its DTS stream.

FPC 3.2.2's `ComServ.TComServer.CanUnloadNow` returns False unconditionally.
This DLL therefore conservatively reports `S_FALSE` from `DllCanUnloadNow`
after its transform references are released. The tests verify that behavior.

## Application-local deployment

Sample 8 demonstrates loading this decoder beside an application executable.
Its client obtains the decoder's class factory and calls `MFTRegisterLocal`
without changing the decoder or writing system registry entries.

See [Sample 8](../Sample%208/README.md).

System-wide COM/MFT registration is a separate deployment option provided by
the DLL's registration exports and the original installer workflow. It was
not exercised by the FPC tests.

## Runtime files

Keep these matching 64-bit files together:

```text
MfPackDtsMFT.dll
MfPackDtsBridge.dll
avcodec-63.dll
avutil-61.dll
swresample-7.dll
```

For application-local deployment, place them beside the executable as shown
in Sample 8. If the bridge or one of its dependencies cannot be loaded, the
MFT rejects DTS input-type negotiation.

## FFmpeg and licensing

The supplied FFmpeg 9.0.1 libraries are reduced shared-library builds with
the `dca` decoder and parser enabled. Their recorded configuration does not
enable GPL or non-free components.

`ThirdParty` contains the source archive, its signature, LGPL text, configure
commands and declaration of source changes. Retain these materials with
distributed binary packages. See `ThirdParty/NOTICE.md` for the supplied
third-party notice.

## Where can the decoder be used?

The decoder is independent of a particular Cast API version. An FPC MfPack
application can use it through Media Foundation once the decoder is available
to that process, provided the application's source pipeline can deliver a
supported DTS stream to the MFT.

Project: Media Foundation - MfPack - Samples

Project locations:

- MfPack on GitHub: https://github.com/FactoryXCode/MfPack-FPC

First release date: 02/08/2026  
Final release date: 18/11/2026

Copyright © FactoryX. All rights reserved.
