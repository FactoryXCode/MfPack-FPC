# MfSimpleCapture — Sample 3, FPC/Lazarus

This Windows x64 learning sample ports Delphi Sample 3 to FPC 3.2.2 and Lazarus 4.8. It uses the MF camera source, Media Session and EVR preview, with source-level kernel-streaming controls, extended MF camera interfaces, saved camera defaults and control-change monitoring. Existing FPC capture samples are unchanged.

Open **MfSimpleCapture.lpi** and select **Debug** or **Release**. The form resources are native Lazarus `.lfm` files and can be edited in the designer. Output goes to `bin/x86_64-win64/<BuildMode>`.

## Using the sample

1. Select a capture device. With **Start preview automatically** checked, preview starts immediately.
2. Use **Rotation** to select 0, 90, 180 or 270 degrees. The selected source is reopened and rotation is set before topology resolution. Automatic/deferred preview is preserved.
3. Open **MF camera controls**. **Live controls** shows current values, ranges, steps and automatic/manual capabilities. Unsupported controls are shown as unavailable. **Apply live value** changes the current source; **Apply driver default** uses its reported default.
4. **Extended MF controls** demonstrates HDR, optical stabilization, eye-gaze correction and background segmentation through `IMFExtendedCameraController` and `IMFExtendedCameraControl`. Only supported flag modes are offered.
5. **Saved camera defaults** reads the current Windows user's stored controls. Save/remove applies to the selected standard live control and preserves unrelated entries. These are separate persistent actions; reading the dialog does not save settings.
6. Close the camera before changing pre-start controls such as HDR. Uncheck automatic preview, select the camera, configure the feature, then press **Start preview**. Topology resolution is deferred as well as streaming.

The rotation selector changes video-frame orientation through `MF_MT_VIDEO_ROTATION`. The separate **Roll** live control is a hardware-dependent camera property.

## APIs and ownership

- Standard controls use `IKsControl` obtained from the MF media source. Extended controls use the dedicated MF interfaces, without a DirectShow graph or `IAMCameraControl`/`IAMVideoProcAmp`.
- `IMFCameraConfigurationManager`, `IMFCameraControlDefaultsCollection` and `IMFCameraControlDefaults` load, inspect and update per-user defaults. Every successful `LockControlData` is paired with `UnlockControlData`.
- `MFCreateCameraControlMonitor`, `IMFCameraControlMonitor` and `IMFCameraControlNotify` provide notifications. A native callback posts scalar messages to a Lazarus `LCLIntf.AllocateHWnd` window; it does not access LCL controls. Stop/detach precedes window destruction, and generation checks reject stale notifications.
- Session callbacks carry their originating session as context and queue the next event after processing the current one. Close completion is the callback's last access to the capture object before the waiting GUI thread can release it.
- Enumeration reads activation metadata without activating every camera. One source is opened by symbolic link for each capture session.
- The platform unit configures UTF-8 conversion for LCL text while camera symbolic links remain UTF-16. COM/MF initialization is paired with shutdown after forms and capture objects are destroyed.

## Requirements

- Windows x64, FPC 3.2.2, Lazarus 4.8 and the FPC MfPack header tree.
- Supported live controls depend on the camera driver.
- Saved defaults and control monitoring require Windows 11 build 22621 or later. Optional APIs are detected at runtime, so an unavailable optional feature does not prevent preview.

The FPC headers include the declaration fixes required by this sample: monitor subscription GUIDs passed by value, `stdcall` on monitor shutdown, and native 40-byte standard camera payload layouts. The Win32 packed record declarations retain explicit native tail padding; this Lazarus project targets Win64.

## Build and checks

```powershell
.\Build.ps1 -Config Debug -Smoke -Tests
.\Build.ps1 -Config Release -Smoke -Hardware
```

`-LazarusRoot`, `-MfPackRoot` and `-BuildDirectory` can select another installation or output folder. The script generates the icon/manifest resource using the Lazarus toolchain and handles sample paths containing spaces.

`-Smoke` creates/destroys the forms without opening a camera. `-Tests` verifies native record sizes, signed range parsing, malformed payload rejection, numeric validation and unbound editor state. `-Hardware` also reads camera capabilities/defaults, starts monitoring, reapplies the existing brightness setting, exercises preview start/stop/restart, tests all four rotation selections, and switches between the connected cameras with notification teardown/restart. Saved-default save/remove is not invoked by these tests.

Both connected cameras passed the Debug/Release preview and switching checks during development. The first test camera supports standard exposure and video controls but does not advertise the demonstrated extended features. Persistent-default writes and extended-control writes require manual testing on appropriate hardware.

## Microsoft references

- [IMFCameraConfigurationManager](https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imfcameraconfigurationmanager)
- [IMFCameraControlDefaults](https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imfcameracontroldefaults)
- [IMFExtendedCameraController](https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imfextendedcameracontroller)
- [IMFCameraControlMonitor](https://learn.microsoft.com/en-us/windows/win32/api/mfidl/nn-mfidl-imfcameracontrolmonitor)
- [MF_MT_VIDEO_ROTATION](https://learn.microsoft.com/en-us/windows/win32/medfound/mf-mt-video-rotation)
