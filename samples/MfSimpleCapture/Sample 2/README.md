# MfSimpleCapture — Sample 2
  
Version: 4.1.0  
  
NOTES:  
  
* This release is updated for compiler version 3.2.2 (64 bit).
* SDK version: 10.0.28000.2705 (Win 11)
* Requires Windows 7 or later.
* Minimum supported MfPack version: 4.1.0
  
Capture and preview use Media Foundation with the Enhanced Video Renderer.  
Camera properties use DirectShow IAMCameraControl and IAMVideoProcAmp: use these if you have an older modelthat does not support the Media Foundation interfaces.  

## Interface
Choose a camera, then show its properties.  
Supported values and the current Auto/Manual mode are read from the device.  
Select a value or mode to apply it.  
Unsupported properties display X.  
Rotation offers 0, 90, 180 and 270 degrees and reopens the selected camera.  
Driver support determines which settings are available.  
  
Note: The FPC WinApi.StrmIf header must define CameraControl_Flags_Auto = 1 and CameraControl_Flags_Manual = 2, matching the Windows SDK.
  
Project: MFPack - Samples - MfSimpleCapure 2  
Project location: https://github.com/FactoryXCode/MfPack  
  
First release date: 05-05-2016  
Final release date: 25/11/2026  
  
Copyright © FactoryX. All rights reserved.

