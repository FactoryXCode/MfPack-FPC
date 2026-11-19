# MfPack `compat` files

**compatibility**.
These are ordinary Pascal units that adapt Delphi functionality or Windows API details for the FPC/Lazarus port of MfPack 4.1.0.
They compile into your application alongside the other units.

For example, the loopback samples use:

| Unit | What it does |
| --- | --- |
| `MfLoopbackSamples.Platform` | Sets UTF-8 conversion and filesystem handling for filenames. Its setup runs automatically when the unit initializes. |
| `MfLoopbackSamples.Diagnostics` | Supplies the `TStopwatch` functionality used by the sample forms. |
| `MfLoopbackSamples.Events` | Supplies `TMfLoopbackEvent`, which owns a real Windows event handle for WASAPI and native wait functions. FPC's standard event object's `Handle` cannot be passed directly to those APIs. |

Other sample groups have their own helpers, such as Unicode regex or LCL dialog adapters.
Use the compatibility folder belonging to your sample group.

To use them:

1. **Open the supplied Lazarus project.** Its `.lpi` and build scripts already configure the required compatibility paths.
2. **For a new project**, add the relevant `compat` folder to Lazarus **Project Options → Compiler Options → Paths → Other unit files**. The loopback projects use `../compat`. Keep the MfPack `src` unit and include paths configured too. For command-line FPC builds, add the compatibility folder with `-Fu`.
3. **Add the required unit to `uses`** and call its public types/functions. A unit may already be included by another sample unit. The Platform helper performs its setup automatically.

For example:

```pascal
uses
  MfLoopbackSamples.Diagnostics;

var
  Watch: TStopwatch;

begin
  Watch := TStopwatch.StartNew();
  // Perform the operation to measure.
  Watch.Stop();
  Writeln(Watch.ElapsedMilliseconds);
end.
```

The event helper is used like an owned object: create it, use `SetEvent`, `ResetEvent` or `WaitFor`, and free it after capture and waiting have stopped.
The object owns its `Handle`, so its destructor closes that handle.

These helpers support the ported samples.
The original Delphi projects retain their Delphi units and native implementations; they do not need the FPC compatibility units added to their search paths.

