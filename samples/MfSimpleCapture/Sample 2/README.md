# MfSimpleCapture — Sample 2 (FPC/Lazarus)

Windows x64 port of the Delphi/VCL Sample 2. Capture and preview use Media Foundation with the Enhanced Video Renderer. Camera properties use DirectShow IAMCameraControl and IAMVideoProcAmp. Sample 3 demonstrates the newer Media Foundation camera control interfaces.

Open MfSimpleCapture.lpi in Lazarus 4.8 with FPC 3.2.2. Select Debug or Release and build/run. The project finds MfPack headers in ../../../src and writes the executable to bin/x86_64-win64/<configuration>. The project resource is included; Build.ps1 regenerates it.

Choose a camera, then show its properties. Supported values and the current Auto/Manual mode are read from the device. Select a value or mode to apply it. Unsupported properties display X. Rotation offers 0, 90, 180 and 270 degrees and reopens the selected camera. Driver support determines which settings are available.

Command-line build and checks:

    powershell -ExecutionPolicy Bypass -File .\Build.ps1 -Smoke -Tests
    powershell -ExecutionPolicy Bypass -File .\Build.ps1 -Config Release -Smoke -Hardware

-Hardware activates connected cameras and tests preview resizing, repeated camera switching, unchanged brightness writes/readback, rotation and shutdown. No camera settings are saved as defaults. -Smoke creates and destroys the forms without opening a camera.

The FPC WinApi.StrmIf header must define CameraControl_Flags_Auto = 1 and CameraControl_Flags_Manual = 2, matching the Windows SDK.
