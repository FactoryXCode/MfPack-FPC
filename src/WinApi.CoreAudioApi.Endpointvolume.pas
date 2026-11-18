// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MfPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.CoreAudioApi.Endpointvolume.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 04-05-2012
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: Audio Endpoint Volume API
//              Provides Volume and muting control for an audio endpoint,
//              either per-channel or total volume.
//
// Organisation: FactoryX
// Initiator(s): Tony (maXcomX), Peter (OzShips)
// Contributor(s): Tony Kalf (maXcomX), Peter Larson (ozships)
//
//------------------------------------------------------------------------------
// CHANGE LOG
// Date       Person              Reason
// ---------- ------------------- ----------------------------------------------
// 15/11/2026 All                 Eels release  SDK 10.0.28000.2705 (Windows 11)
// 03/04/2026 Tony                Fixed cwAUDIO_VOLUME_NOTIFICATION_DATA
//------------------------------------------------------------------------------
//
// Remarks: Pay close attention for supported platforms (ie Vista or Win 7/8/8.1/10).
//
//          FPC: Use the MfPack COM interface declarations consistently.
//          Use declared COM interfaces and their reference-counting ownership rules.
// 
//          This unit has a different BOOL behaviour! See: Remarks for BOOL in
//          MfPack.MfTypes.pas
// 
//          Requires Windows Vista or later.
// 
// Related objects: -
// Related projects: MfPack FPC/Lazarus port
// Known Issues: -
//
// Compiler version: FPC 3.2.2 (Windows x64 port baseline)
// SDK version: 10.0.28000.2705
//
// Todo: -
//
//==============================================================================
// Source: endpointvolume.h
//
// Copyright (c) Microsoft Corporation. All rights reserved.
//==============================================================================
//
// FPC port updated: 2026-11-14
// Lazarus version: 4.8
// FPC mode: DelphiUnicode; COM interfaces; UTF-8 source.
// COM headers: MfPack WinApi.ActiveX.* and WinApi.ComBaseApi.
//
//==============================================================================
// LICENSE
//
// The contents of this file are subject to the Mozilla Public License
// Version 2.0 (the "License"); you may not use this file except in
// compliance with the License. You may obtain a copy of the License at
// https://www.mozilla.org/en-US/MPL/2.0/
//
// Software distributed under the License is distributed on an "AS IS"
// basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
// License for the specific language governing rights and limitations
// under the License.
//
// Non commercial users may distribute this sourcecode provided that this
// header is included in full at the top of the file.
// Commercial users are not allowed to distribute this sourcecode as part of
// their product.
//
//==============================================================================
unit WinApi.CoreAudioApi.EndPointVolume;

{$I MfPack.Fpc.inc}


interface

uses
  {WinApi}
  Windows,
  WinApi.WinApiTypes;

  {$PACKENUM 4}

  {$IFDEF WIN32}
    {$ALIGN 1}
  {$ELSE}
    {$ALIGN 8} // Win64
  {$ENDIF}

  {$I 'WinApiTypes.inc'}

const

  // Hardware support mask - if the endpoint provides hardware support
  // for volume/mute/meter, this bit will be on in the
  // DWORD returned by the IAudioEndpointVolume QueryHardwareSupport and
  // the IAudioEndpointMeter QueryHardwareSupport API
  ENDPOINT_HARDWARE_SUPPORT_VOLUME    = $00000001;
  ENDPOINT_HARDWARE_SUPPORT_MUTE      = $00000002;
  ENDPOINT_HARDWARE_SUPPORT_METER     = $00000004;


type

  PAUDIO_VOLUME_NOTIFICATION_DATA = ^AUDIO_VOLUME_NOTIFICATION_DATA;
  cwAUDIO_VOLUME_NOTIFICATION_DATA = record
    guidEventContext: TGUID;  // Context associated with the originator of the event.
    bMuted: BOOL;
    fMasterVolume: Single;
    nChannels: UINT;
    afChannelVolumes: array [0..0] of Single;
  end;
  AUDIO_VOLUME_NOTIFICATION_DATA = cwAUDIO_VOLUME_NOTIFICATION_DATA;


  // INTERFACES
  // ==========


  // Interface IAudioEndpointVolumeCallback
  // ======================================
  // Description:
  //
  //  Callback interface to be implemented by clients to respond to changes in
  //  the volume/mute state of an endpoint.
  //  Called when the endpoint volume changes.
  //
  // Parameters:
  //
  //  pNotify - [in] A pointer (PAUDIO_VOLUME_NOTIFICATION_DATA) to the structure
  //                 containing information about the new endpoint volume.
  //
  // Return values:
  //      S_OK if successful
  //      <other error> If registration for notification failed.
  //
  // Remarks:
  //      Please note: The caller of this function ignores all return
  //      codes from the OnNotify method.
  //
  IAudioEndpointVolumeCallback = interface(IUnknown)
  ['{657804FA-D6AD-4496-8A60-352752AF4F89}']

    function OnNotify(pNotify: PAUDIO_VOLUME_NOTIFICATION_DATA): HRESULT; stdcall;

  end;
  IID_IAudioEndpointVolumeCallback = IAudioEndpointVolumeCallback;


  // >= Vista
  // Interface IAudioEndpointVolume
  // ==============================
  // Description:
  //
  //  Volume control interface for a device endpoint.
  //  Registers the client for change notifications on this volume control.
  //
  // Parameters:
  //
  //  pNotify - [in] Notification interface that gets called when volume changes.
  //
  // Remarks:
  //
  // Return values:
  //      S_OK if successful
  //      <other error> If registration for notification failed.
  //
  IAudioEndpointVolume = interface(IUnknown)
  ['{5CDF2C82-841E-4546-9722-0CF74078229A}']

    function RegisterControlChangeNotify(pNotify: IAudioEndpointVolumeCallback): HRESULT; stdcall;

    function UnregisterControlChangeNotify(pNotify: IAudioEndpointVolumeCallback): HRESULT; stdcall;

    function GetChannelCount(out pnChannelCount: UINT): HRESULT; stdcall;

    function SetMasterVolumeLevel(fLevelDB: Single;
                                  const pguidEventContext: LPCGUID): HRESULT; stdcall;

    function SetMasterVolumeLevelScalar(fLevel: Single;
                                        const pguidEventContext: LPCGUID): HRESULT; stdcall;

    function GetMasterVolumeLevel(out pfLevelDB: Single): HRESULT; stdcall;

    function GetMasterVolumeLevelScalar(out pfLevel: Single): HRESULT; stdcall;

    function SetChannelVolumeLevel(nChannel: UINT;
                                   fLevelDB: Single;
                                   const pguidEventContext: LPCGUID): HRESULT; stdcall;

    function SetChannelVolumeLevelScalar(nChannel: UINT;
                                         fLevel: Single;
                                         const pguidEventContext: LPCGUID): HRESULT; stdcall;

    function GetChannelVolumeLevel(nChannel: UINT;
                                   out fLevelDB: Single): HRESULT; stdcall;

    function GetChannelVolumeLevelScalar(nChannel: UINT;
                                         out fLevel: Single): HRESULT; stdcall;

    function SetMute(const bMute: INT {BOOL};  // See BOOL comments in WinApiTypes.pas (See for a workaround Components/example MfAudioEndPoint)
                     const pguidEventContext: LPCGUID): HRESULT; stdcall;

    function GetMute(out pbMute: INT {BOOL}): HRESULT; stdcall; // See BOOL comments in WinApi.WinApiTypes.pas (See for a workaround Components/example MfAudioEndPoint)

    function GetVolumeStepInfo(out pnStep: UINT;
                               out pnStepCount: UINT): HRESULT; stdcall;

    function VolumeStepUp(const pguidEventContext: LPCGUID): HRESULT; stdcall;

    function VolumeStepDown(const pguidEventContext: LPCGUID): HRESULT; stdcall;

    function QueryHardwareSupport(out pdwHardwareSupportMask: DWORD): HRESULT; stdcall;

    function GetVolumeRange(out pflVolumeMindB: Single;
                            out pflVolumeMaxdB: Single;
                            out pflVolumeIncrementdB: Single): HRESULT; stdcall;
  end;
  IID_IAudioEndpointVolume = IAudioEndpointVolume;


  // Interface IAudioEndpointVolumeEx
  // ================================
  // >= Windows 7
  //
  IAudioEndpointVolumeEx = interface(IAudioEndpointVolume)
  ['{66E11784-F695-4F28-A505-A7080081A78F}']

    function GetVolumeRangeChannel(iChannel: UINT;
                                   out pflVolumeMinDB: Single;
                                   out pflVolumeMaxDB: Single;
                                   out pflVolumeIncrementDB: Single): HRESULT; stdcall;
  end;
  IID_IAudioEndpointVolumeEx = IAudioEndpointVolumeEx;


  // Interface IAudioMeterInformation
  // ================================
  //  Volume control interface for a device endpoint.
  //  Gets the volume range for a particular channel
  //
  // Parameters:
  //      iChannel - [in] Channel number
  //      pflVolumeMinDB - [out] Minimum dB for the channel.
  //      pflVolumeMaxDB - [out] Maximum dB for the channel.
  //      pflVolumeIncrementDB - [out] dB step for the channel.
  //
  // Remarks:
  //
  // Return values:
  //      S_OK if successful
  //      <other error> If failed.
  //
  IAudioMeterInformation = interface(IUnknown)
  ['{C02216F6-8C67-4B5B-9D00-D008E73E0064}']

    function GetPeakValue(out pfPeak: Single): HResult; stdcall;
    // The GetPeakValue method gets the peak sample value for the channels in the audio stream.
    // Parameters
    // pfPeak [out]
    // Pointer to a float variable into which the method writes the peak sample value
    // for the audio stream.
    // The peak value is a number in the normalized range from 0.0 to 1.0.

    function GetMeteringChannelCount(out pnChannelCount: UINT): HResult; stdcall;
    // The GetMeteringChannelCount method gets the number of channels in the
    // audio stream that are monitored by peak meters.
    // Parameters
    // pnChannelCount [out]
    //  Pointer to a UINT variable into which the method writes the number of channels.
    
    function GetChannelsPeakValues(u32ChannelCount: UINT32;
                                   afPeakValues: PFloat): HResult; stdcall;
    // The GetChannelsPeakValues method gets the peak sample values for all the channels in the audio stream.
    // Parameters
    // u32ChannelCount [in]
    // The channel count. This parameter also specifies the number of elements in
    // the afPeakValues array. If the specified count does not match the number of
    // channels in the stream, the method returns error code E_INVALIDARG.

    // afPeakValues [out]
    // Array of peak sample values.
    // The method writes the peak values for the channels into the array.
    // The array contains one element for each channel in the stream.
    // The peak values are numbers in the normalized range from 0.0 to 1.0.
    // NOTE: Parameter afPeakValues points to a caller-allocated float array.

    function QueryHardwareSupport(pdwHardwareSupportMask: PDWORD): HResult; stdcall;
    // Use this on special needs ie you want to create and use a custom software peakmeter.
    // By default: If hardware does not support a peakmeter,
    // the system will create and use a software peakmeter automaticly.
    // Parameters
    // pdwHardwareSupportMask [out]
    //    Pointer to a DWORD variable into which the method writes a hardware support mask
    //    that indicates the hardware capabilities of the audio endpoint device.
    //    The method can set the mask to 0 or to the bitwise-OR combination of one or
    //    more ENDPOINT_HARDWARE_SUPPORT_XXX constants.
    //
    // Return code          Description
    //  E_POINTER           Parameter pdwHardwareSupportMask is Nil.
    //
    // Remarks
    //  This method indicates whether the audio endpoint device implements
    //  the following functions in hardware:
    //    Volume control
    //    Mute control
    //    Peak meter

  end;
  IID_IAudioMeterInformation = IAudioMeterInformation;


  // Additional Prototypes for ALL interfaces

  // End of Additional Prototypes

implementation

  // Implement Additional functions here.

end.
