# MfComponents
  
Version: 4.1.0  
  
  
NOTES:  
  
* This release is updated for compiler version 3.2.2 (64 bit).
* SDK version: 10.0.28000.2705 (Win 11)
* Requires Windows 10 22H2 or later.
* Minimum supported MfPack version: 4.1.0
  
```
  
# MfPack Visual Components and classes
  
This package contains the following -installable- components:  
  
* TQTimer - Queue Timer component. For precise timing.
* MfPeakMeter - Simple PeakMeter control.
* MfPeakMeterEx - Enhanged PeakMeter control.
* MfPeakMeterMmcs - Derived from MfPeakMeterEx with MMCS support and direct feed from external source.
* MfAudioEndPoint - Audio EndPoint component that responds to volume changes.
  Uses: IAudioEndpointVolumeEx, IAudioEndpointVolumeCallback and IMMDeviceEnumerator.
* TThreadedQTimer - A threaded queue timer (experimental)
* MfAudioVisualizer - A visual component that uses WASAPI loopback, Peak/RMS, optional spectrum bars or VU.
* MfAudioVisualizerEx - Extended MfAudioVisualizer.
  
# WASAPI player / dsp / mft components:
  
* MfWasApiPlayerEngineComponent - WasApi renderer component supporting the MfWasApiEffectsRack and effects.
* MfParametricEqComponent - Parametric equalizer component.
* MfFlangerEchoComponent - Flanger / Echo component.
* MfCompressorLimiterComponent - Compressor / Limiter component.
* MfPitchTempoComponent - Pitching / tempo component.
* MfChorusComponent - Chorus component.
* MfWasApiEffectsRack - Effects rack component that controls FX DSP's and MFT's.
  
Note: On how to use these components, please read the WasApiPlayer sample 5 documentation.
  
# Other files/ helpers for the components.
* PcmLib.pas - A very convenient unit that is capable of recoding diverse WAV formats.
* WASAPIEngine.pas - Universal WASAPIEngine 
```
   
Project: Media Foundation - MFPack - Samples  
Project location: https://github.com/FactoryXCode/MfPack-FPC  
  
```
  
First release date: 05-02-2016  
Final release date: 18-11-2026  
  
Copyright © FactoryX. All rights reserved.
