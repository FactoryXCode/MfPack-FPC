# Sample 8 - Application-local DTS decoder

Version: 4.1.0  
  
  
NOTES:  
  
* This release is updated for compiler version 3.2.2 (64 bit).
* SDK version: 10.0.28000.2705 (Win 11)
* Requires Windows 10 or later.
* Minimum supported MfPack version: 4.1.0

Sample 7 installs its DTS decoder as a system-wide COM server and Media
Foundation Transform. This sample uses the same `MfPackDtsMFT.dll` without an
installer or registry changes. The application loads the DLL from its own
directory, obtains its exported `IClassFactory`, and calls `MFTRegisterLocal`.
Only this process can discover the registration. The decoder implementation
and its FFmpeg bridge are unchanged.

`MfLocalDtsClient.exe --check` enumerates the decoder with
`MFT_ENUM_FLAG_LOCALMFT`, activates it, and negotiates DTS input to PCM output.
With a DTS media filename instead, the program also asks Media Foundation's
Source Reader to decode the selected audio stream to 48 kHz, 16-bit stereo PCM
and reports the number of samples and bytes. It releases reader objects,
calls `MFTUnregisterLocal` with the same class factory, then unloads the DLL.

## Build and run

Build Sample 7's Win64 runtime sets first.
Then build this console project in the IDE.

The application and all five runtime DLLs must stay together.
Note that a Win32 host needs Win32 DLLs and a Win64 host needs Win64 DLLs.
The local registration ends when the process exits, so other applications do not see this decoder.
The Sample 7 installer remains available when machine-wide discovery is wanted.
  
Project: Media Foundation - MFPack - Samples  
Project location:  
https://github.com/FactoryXCode/MfPack-FPC  
  
First release date: 02/08/2026  
Final release date: 18/11/2026  
  
Copyright © FactoryX. All rights reserved.