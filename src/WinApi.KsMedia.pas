// FactoryX
//
// Copyright: © FactoryX. All rights reserved.
//
// Project: MfPack - FPC/Lazarus port
// Project location: https://sourceforge.net/projects/MFPack
//                   https://github.com/FactoryXCode/MfPack
// Module: WinApi.KsMedia.pas
// Kind: Free Pascal unit (Lazarus compatible)
// Release date: 02-06-2016
// Language: ENU
//
// Upstream revision: 4.1.0
// Description: WDM-CSA Multimedia Definitions.
//
// Organisation: FactoryX
// Initiator(s): Tony (maXcomX), Peter (OzShips)
// Contributor(s): Tony Kalf (maXcomX), Peter Larson (ozships), Ramyses De Macedo Rodrigues
//
//------------------------------------------------------------------------------
// CHANGE LOG
// Date       Person              Reason
// ---------- ------------------- ----------------------------------------------
// 15/11/2026 All                 Eels release  SDK 10.0.28000.2705 (Windows 11)
//------------------------------------------------------------------------------
//
// Remarks: Requires Windows Vista or later.
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
// Source: ksmedia.h
//
// Copyright (c) Microsoft Corporation. All rights reserved.
//==============================================================================
//
// FPC port updated: 2026-11-13
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
unit WinApi.KsMedia;

{$I MfPack.Fpc.inc}


interface

uses

  {WinApi}
  Windows,
  WinApi.WinApiTypes,
  WinApi.VpType,
  WinApi.KsProxy,
  WinApi.Ks,
  {ActiveX}
  ActiveX,
  {WinMM}
  WinApi.WinMM.MMReg,
  WinApi.WinMM.MMeApi;

  {$PACKENUM 4}

  {$IFDEF WIN32}
    {$ALIGN 1}
  {$ELSE}
    {$PACKRECORDS C} // Win64
  {$ENDIF}


type

  PKSMULTIPLE_DATA_PROP = ^KSMULTIPLE_DATA_PROP;
  KSMULTIPLE_DATA_PROP = record
    Property_    : KSPROPERTY;
    MultipleItem : KSMULTIPLE_ITEM;
  end;


const

  KSMEDIUMSETID_MidiBus  : TGUID = '{05908040-3246-11D0-A5D6-28DB04C10000}';
  KSMEDIUMSETID_VPBus    : TGUID = '{A18C15EC-CE43-11D0-ABE7-00A0C9223196}';
  KSINTERFACESETID_Media : TGUID = '{3A13EB40-30A7-11D0-A5D6-28DB04C10000}';


type

  PKSINTERFACE_MEDIA = ^KSINTERFACE_MEDIA;
  KSINTERFACE_MEDIA = (
    KSINTERFACE_MEDIA_MUSIC = 0,               // Reserved for system use
    KSINTERFACE_MEDIA_WAVE_BUFFERED,       // Reserved for system use
    KSINTERFACE_MEDIA_WAVE_QUEUED
  );


  procedure INIT_USBAUDIO_MID(var guid: TGuid;
                              id: USHORT);

  function IS_COMPATIBLE_USBAUDIO_MID(const guid: TGuid): BOOL;

  procedure INIT_USBAUDIO_PID(var guid: TGuid; id: USHORT);

  function IS_COMPATIBLE_USBAUDIO_PID(const guid: TGuid): BOOL;

  procedure INIT_USBAUDIO_PRODUCT_NAME(var guid: TGuid;
                                       vid: USHORT;
                                       pid: USHORT;
                                       strIndex: USHORT);


  // USB Terminals
  procedure INIT_USB_TERMINAL(var guid: TGuid;
                              id: USHORT);

  function EXTRACT_USB_TERMINAL(const guid: TGUID): USHORT;

  function DEFINE_USB_TERMINAL_GUID(id: USHORT): TGuid;


const

  KSNODETYPE_INPUT_UNDEFINED                 : TGUID = '{DFF21BE0-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_MICROPHONE                      : TGUID = '{DFF21BE1-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_DESKTOP_MICROPHONE              : TGUID = '{DFF21BE2-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_PERSONAL_MICROPHONE             : TGUID = '{DFF21BE3-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_OMNI_DIRECTIONAL_MICROPHONE     : TGUID = '{DFF21BE4-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_MICROPHONE_ARRAY                : TGUID = '{DFF21BE5-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_PROCESSING_MICROPHONE_ARRAY     : TGUID = '{DFF21BE6-F70F-11D0-B917-00A0C9223196}';
  KSCATEGORY_MICROPHONE_ARRAY_PROCESSOR      : TGUID = '{830a44f2-a32d-476b-be97-42845673b35a}';

  KSNODETYPE_OUTPUT_UNDEFINED                : TGUID = '{DFF21CE0-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_SPEAKER                         : TGUID = '{DFF21CE1-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_HEADPHONES                      : TGUID = '{DFF21CE2-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_HEAD_MOUNTED_DISPLAY_AUDIO      : TGUID = '{DFF21CE3-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_DESKTOP_SPEAKER                 : TGUID = '{DFF21CE4-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_ROOM_SPEAKER                    : TGUID = '{DFF21CE5-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_COMMUNICATION_SPEAKER           : TGUID = '{DFF21CE6-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_LOW_FREQUENCY_EFFECTS_SPEAKER   : TGUID = '{DFF21CE7-F70F-11D0-B917-00A0C9223196}';

  KSNODETYPE_BIDIRECTIONAL_UNDEFINED         : TGUID = '{DFF21DE0-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_HANDSET                         : TGUID = '{DFF21DE1-F70F-11D0-B917-00A0C9223196}';

  //KSNODETYPE_HEADSET_MICROPHONE       = KSNODETYPE_PERSONAL_MICROPHONE;
  KSNODETYPE_HEADSET_MICROPHONE              : TGUID = '{DFF21BE3-F70F-11D0-B917-00A0C9223196}';
  //KSNODETYPE_HEADSET_SPEAKERS         = KSNODETYPE_COMMUNICATION_SPEAKER;
  KSNODETYPE_HEADSET_SPEAKERS                : TGUID = '{DFF21CE6-F70F-11D0-B917-00A0C9223196}';

  KSNODETYPE_HEADSET                         : TGUID = '{DFF21DE2-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_SPEAKERPHONE_NO_ECHO_REDUCTION  : TGUID = '{DFF21DE3-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_ECHO_SUPPRESSING_SPEAKERPHONE   : TGUID = '{DFF21DE4-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_ECHO_CANCELING_SPEAKERPHONE     : TGUID = '{DFF21DE5-F70F-11D0-B917-00A0C9223196}';

  KSNODETYPE_TELEPHONY_UNDEFINED             : TGUID = '{DFF21EE0-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_PHONE_LINE                      : TGUID = '{DFF21EE1-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_TELEPHONE                       : TGUID = '{DFF21EE2-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_DOWN_LINE_PHONE                 : TGUID = '{DFF21EE3-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_ANALOG_CONNECTOR                : TGUID = '{DFF21FE1-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_DIGITAL_AUDIO_INTERFACE         : TGUID = '{DFF21FE2-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_LINE_CONNECTOR                  : TGUID = '{DFF21FE3-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_LEGACY_AUDIO_CONNECTOR          : TGUID = '{DFF21FE4-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_SPDIF_INTERFACE                 : TGUID = '{DFF21FE5-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_1394_DA_STREAM                  : TGUID = '{DFF21FE6-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_1394_DV_STREAM_SOUNDTRACK       : TGUID = '{DFF21FE7-F70F-11D0-B917-00A0C9223196}';

  KSNODETYPE_EMBEDDED_UNDEFINED              : TGUID = '{DFF220E0-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_LEVEL_CALIBRATION_NOISE_SOURCE  : TGUID = '{DFF220E1-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_EQUALIZATION_NOISE              : TGUID = '{DFF220E2-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_CD_PLAYER                       : TGUID = '{DFF220E3-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_DAT_IO_DIGITAL_AUDIO_TAPE       : TGUID = '{DFF220E4-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_DCC_IO_DIGITAL_COMPACT_CASSETTE : TGUID = '{DFF220E5-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_MINIDISK                        : TGUID = '{DFF220E6-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_ANALOG_TAPE                     : TGUID = '{DFF220E7-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_PHONOGRAPH                      : TGUID = '{DFF220E8-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_VCR_AUDIO                       : TGUID = '{DFF220E9-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_VIDEO_DISC_AUDIO                : TGUID = '{DFF220EA-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_DVD_AUDIO                       : TGUID = '{DFF220EB-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_TV_TUNER_AUDIO                  : TGUID = '{DFF220EC-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_SATELLITE_RECEIVER_AUDIO        : TGUID = '{DFF220ED-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_CABLE_TUNER_AUDIO               : TGUID = '{DFF220EE-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_DSS_AUDIO                       : TGUID = '{DFF220EF-F70F-11D0-B917-00A0C9223196}';

  KSNODETYPE_RADIO_RECEIVER                  : TGUID = '{DFF220F0-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_RADIO_TRANSMITTER               : TGUID = '{DFF220F1-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_MULTITRACK_RECORDER             : TGUID = '{DFF220F2-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_SYNTHESIZER                     : TGUID = '{DFF220F3-F70F-11D0-B917-00A0C9223196}';

  KSNODETYPE_HDMI_INTERFACE                  : TGUID = '{D1B9CC2A-F519-417f-91C9-55FA65481001}';

  KSNODETYPE_DISPLAYPORT_INTERFACE           : TGUID = '{E47E4031-3EA6-418d-8F9B-B73843CCBA97}';

  KSNODETYPE_AUDIO_LOOPBACK                  : TGUID = '{8F42C0B2-91CE-4BCF-9CCD-0E599037AB35}';
  // Win10
  KSNODETYPE_AUDIO_KEYWORDDETECTOR           : TGUID = '{3817E0B8-DF58-4375-B669-C49634331F9D}';

// NTDDI_VERSION >= NTDDI_WIN10_19H1
  KSNODETYPE_AUDIO_MODULE                    : TGUID = '{45AAB42E-CAEB-4052-8AA9-B38CB5109619}';
// end NTDDI_VERSION >= NTDDI_WIN10_19H1

  // USB MIDI Nodes
  KSNODETYPE_MIDI_JACK                       : TGUID = '{265E0C3F-FA39-4df3-AB04-BE01B91E299A}';
  KSNODETYPE_MIDI_ELEMENT                    : TGUID = '{01C6FE66-6E48-4c65-AC9B-52DB5D656C7E}';

  // Hardware Audio Engine Node
  KSNODETYPE_AUDIO_ENGINE                    : TGUID = '{35CAF6E4-F3B3-4168-BB4B-55E77A461C7E}';

  // KS Node type for speakers node with static jack
  KSNODETYPE_SPEAKERS_STATIC_JACK            : TGUID = '{28E04F87-4DBE-4f8d-8589-025D209DFB4A}';

  // GUID for Spdif Out pin name
  PINNAME_SPDIF_OUT                          : TGUID = '{3A264481-E52C-4b82-8E7A-C8E2F91DC380}';

  // GUID for Spdif In pin name
  PINNAME_SPDIF_IN                           : TGUID = '{15DC9025-22AD-41b3-8875-F4CEB0299E20}';

  // GUID for HDMI Out pin name
  PINNAME_HDMI_OUT                           : TGUID = '{387BFC03-E7EF-4901-86E0-35B7C32B00EF}';

  // GUID for Display Port Out pin name
  PINNAME_DISPLAYPORT_OUT                    : TGUID = '{21FBB329-1A4A-48da-A076-2318A3C59B26}';

  // Microsoft's WDMAUD virtual swsynth pin name guid
  KSNODETYPE_SWSYNTH                         : TGUID = '{423274A0-8B81-11D1-A050-0000F8004788}';

  // Microsoft's SWMIDI midi pin and node name guid
  KSNODETYPE_SWMIDI                          : TGUID = '{CB9BEFA0-A251-11D1-A050-0000F8004788}';

  KSNODETYPE_DRM_DESCRAMBLE                  : TGUID = '{FFBB6E3F-CCFE-4D84-90D9-421418B03A8E}';

  // Win10
  //
  // Nodetypes for Windows Phone Cellular Streaming.
  //
  KSNODETYPE_TELEPHONY_BIDI                  : TGUID = '{686D7CC0-D903-4258-B443-3A3D3580741C}';

  //
  // Nodetype for FM Receiver.
  //
  KSNODETYPE_FM_RX                           : TGUID = '{834A733C-F485-41C0-A62B-513025014E40}';
  //end Win10


  // General categories
  KSCATEGORY_AUDIO                           : TGUID = '{6994AD04-93EF-11D0-A3CC-00A0C9223196}';
  KSCATEGORY_VIDEO                           : TGUID = '{6994AD05-93EF-11D0-A3CC-00A0C9223196}';
  KSCATEGORY_REALTIME                        : TGUID = '{EB115FFC-10C8-4964-831D-6DCB02E6F23F}';
  KSCATEGORY_TEXT                            : TGUID = '{6994AD06-93EF-11D0-A3CC-00A0C9223196}';
  KSCATEGORY_NETWORK                         : TGUID = '{67C9CC3C-69C4-11D2-8759-00A0C9223196}';
  KSCATEGORY_TOPOLOGY                        : TGUID = '{DDA54A40-1E4C-11D1-A050-405705C10000}';
  KSCATEGORY_VIRTUAL                         : TGUID = '{3503EAC4-1F26-11D1-8AB0-00A0C9223196}';
  KSCATEGORY_ACOUSTIC_ECHO_CANCEL            : TGUID = '{BF963D80-C559-11D0-8A2B-00A0C9255AC1}';

  // > WinXp & < Win Vista, deprecated.
  KSCATEGORY_SYSAUDIO                        : TGUID = '{A7C7A5B1-5AF3-11D1-9CED-00A024BF0407}';
  KSCATEGORY_WDMAUD                          : TGUID = '{3E227E76-690D-11D2-8161-0000F8775BF1}';

  KSCATEGORY_AUDIO_GFX                       : TGUID = '{9BAF9572-340C-11D3-ABDC-00A0C90AB16F}';
  KSCATEGORY_AUDIO_SPLITTER                  : TGUID = '{9EA331FA-B91B-45F8-9285-BD2BC77AFCDE}';

  KSCATEGORY_SYNTHESIZER                     : TGUID = '{DFF220F3-F70F-11D0-B917-00A0C9223196}'; //KSNODETYPE_SYNTHESIZER
  KSCATEGORY_DRM_DESCRAMBLE                  : TGUID = '{FFBB6E3F-CCFE-4D84-90D9-421418B03A8E}'; //KSNODETYPE_DRM_DESCRAMBLE

  // < WinVista, deprecated
  KSCATEGORY_AUDIO_DEVICE                    : TGUID = '{FBF6F530-07B9-11D2-A71E-0000F8004788}';
  KSCATEGORY_PREFERRED_WAVEOUT_DEVICE        : TGUID = '{D6C5066E-72C1-11D2-9755-0000F8004788}';
  KSCATEGORY_PREFERRED_WAVEIN_DEVICE         : TGUID = '{D6C50671-72C1-11D2-9755-0000F8004788}';
  KSCATEGORY_PREFERRED_MIDIOUT_DEVICE        : TGUID = '{D6C50674-72C1-11D2-9755-0000F8004788}';

  // Special pin category for wdmaud
  KSCATEGORY_WDMAUD_USE_PIN_NAME             : TGUID = '{47A4FA20-A251-11D1-A050-0000F8004788}';

  // Escalante Platform Interface
  KSCATEGORY_ESCALANTE_PLATFORM_DRIVER       : TGUID = '{74f3aea8-9768-11d1-8e07-00a0c95ec22e}';


  // -- major types ---

  // 'vids' == MEDIATYPE_Video,
  KSDATAFORMAT_TYPE_VIDEO                    : TGUID = '{73646976-0000-0010-8000-00aa00389b71}';

  // 'auds' = MEDIATYPE_Audio
  KSDATAFORMAT_TYPE_AUDIO                    : TGUID = '{73647561-0000-0010-8000-00aa00389b71}';
  // 'txts' = MEDIATYPE_Text
  KSDATAFORMAT_TYPE_TEXT                     : TGUID = '{73747874-0000-0010-8000-00aa00389b71}';


  //#if !defined( DEFINE_WAVEFORMATEX_GUID )
  //#define DEFINE_WAVEFORMATEX_GUID(x) (USHORT)(x), 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71
  //#endif

  KSDATAFORMAT_SUBTYPE_WAVEFORMATEX          : TGUID = '{00000000-0000-0010-8000-00aa00389b71}';
  KSDATAFORMAT_SUBTYPE_ANALOG                : TGUID = '{6dba3190-67bd-11cf-a0f7-0020afd156e4}';
  KSDATAFORMAT_SUBTYPE_PCM                   : TGUID = '{00000001-0000-0010-8000-00aa00389b71}';
  KSDATAFORMAT_SUBTYPE_IEEE_FLOAT            : TGUID = '{00000003-0000-0010-8000-00aa00389b71}';
  KSDATAFORMAT_SUBTYPE_DRM                   : TGUID = '{00000009-0000-0010-8000-00aa00389b71}';
  KSDATAFORMAT_SUBTYPE_ALAW                  : TGUID = '{00000006-0000-0010-8000-00aa00389b71}';
  KSDATAFORMAT_SUBTYPE_MULAW                 : TGUID = '{00000007-0000-0010-8000-00aa00389b71}';
  KSDATAFORMAT_SUBTYPE_ADPCM                 : TGUID = '{00000002-0000-0010-8000-00aa00389b71}';
  KSDATAFORMAT_SUBTYPE_MPEG                  : TGUID = '{00000050-0000-0010-8000-00aa00389b71}';
  KSDATAFORMAT_SPECIFIER_VC_ID               : TGUID = '{AD98D184-AAC3-11D0-A41C-00A0C9223196}';
  KSDATAFORMAT_SPECIFIER_WAVEFORMATEX        : TGUID = '{05589f81-c356-11ce-bf01-00aa0055595a}';
  KSDATAFORMAT_SPECIFIER_DSOUND              : TGUID = '{518590a2-a184-11d0-8522-00c04fd9baf3}';


type

  // Convenient wrapper structure for the case in which the WaveFormatEx is
  // known not to contain extra data.
  PKSDATAFORMAT_WAVEFORMATEX = ^KSDATAFORMAT_WAVEFORMATEX;
  KSDATAFORMAT_WAVEFORMATEX = packed record
    DataFormat   : KSDATAFORMAT;
    _WaveFormatEx : WAVEFORMATEX;
  end;

  // Also defined in MMreg.pas and MMSystem !
{$IFNDEF _WAVEFORMATEXTENSIBLE_DEFINED}

  //
  // The WAVEFORMATEXTENSIBLE structure defines the format of waveform-audio data
  // for formats having more than two channels.
  // This structure is part of the Platform SDK and is not declared in Dsound.h.
  // It is included here for convenience.
  //

  PWAVEFORMATEXTENSIBLE = ^WAVEFORMATEXTENSIBLE;
  WAVEFORMATEXTENSIBLE = packed record
    Format: WAVEFORMATEX;
    samples: record                        // union part
      case integer of
        0: (wValidBitsPerSample : WORD);   // bits of precision
        1: (wSamplesPerBlock    : WORD);   // valid if wBitsPerSample = 0
        2: (wReserved           : WORD);   // If neither applies, set to zero.
      end;
    dwChannelMask       : DWORD;  // which channels are present in stream
    SubFormat           : TGUID;
  end;

{$DEFINE _WAVEFORMATEXTENSIBLE_DEFINED}
{$ENDIF} // !_WAVEFORMATEXTENSIBLE_


const

  WAVE_FORMAT_EXTENSIBLE          = $FFFE;


type

  // Convenient wrapper structure for the case in which the WaveFormatExt is
  // known not to contain extra data.

  PKSDATAFORMAT_WAVEFORMATEXTENSIBLE = ^KSDATAFORMAT_WAVEFORMATEXTENSIBLE;
  KSDATAFORMAT_WAVEFORMATEXTENSIBLE = packed record
    DataFormat: KSDATAFORMAT;
    WaveFormatExt: WAVEFORMATEXTENSIBLE;
  end;


  // DirectSound buffer description
  PKSDSOUND_BUFFERDESC = ^KSDSOUND_BUFFERDESC;
  KSDSOUND_BUFFERDESC = packed record
    Flags        : ULONG;
    Control      : ULONG;
    WaveFormatEx : WAVEFORMATEX;
  end;

  // DirectSound format
  PKSDATAFORMAT_DSOUND = ^KSDATAFORMAT_DSOUND;
  KSDATAFORMAT_DSOUND = packed record
    DataFormat : KSDATAFORMAT;
    BufferDesc : KSDSOUND_BUFFERDESC;
  end;


const

  // DirectSound buffer flags
  KSDSOUND_BUFFER_PRIMARY     = $00000001;
  KSDSOUND_BUFFER_STATIC      = $00000002;
  KSDSOUND_BUFFER_LOCHARDWARE = $00000004;
  KSDSOUND_BUFFER_LOCSOFTWARE = $00000008;


  // DirectSound buffer control flags
  KSDSOUND_BUFFER_CTRL_3D             = $00000001;
  KSDSOUND_BUFFER_CTRL_FREQUENCY      = $00000002;
  KSDSOUND_BUFFER_CTRL_PAN            = $00000004;
  KSDSOUND_BUFFER_CTRL_VOLUME         = $00000008;
  KSDSOUND_BUFFER_CTRL_POSITIONNOTIFY = $00000010;


type

  PKSAUDIO_POSITION = ^KSAUDIO_POSITION;
  KSAUDIO_POSITION = record
    PlayOffset  : DWORDLONG;
    WriteOffset : DWORDLONG;
  end;


  // The KSAUDIO_PRESENTATION_POSITION structure specifies the current positions
  // of audio data being rendered to the KS pin instance.
  PKSAUDIO_PRESENTATION_POSITION = ^KSAUDIO_PRESENTATION_POSITION;
  KSAUDIO_PRESENTATION_POSITION = record
    u64PositionInBlocks: UINT64;     // The block offset from the start of the stream to the current post-decoded uncompressed
                                     // position in the stream, where a block is the group of channels in the same sample; for a PCM stream,
                                     // a block is same as a frame. For compressed formats, a block is a single sample within a frame
                                     // (eg. each MP3 frame has 1152 samples or 1152 blocks)
    u64QPCPosition: UINT64;          // The value of the performance counter at the time that the audio endpoint device read the device
                                     // position (*pu64Position) in response to the KSAUDIO_PRESENTATION_POSITION call.
  end;


  PCONSTRICTOR_OPTION = ^CONSTRICTOR_OPTION;
  CONSTRICTOR_OPTION           = (
    CONSTRICTOR_OPTION_DISABLE = 0,
    CONSTRICTOR_OPTION_MUTE
  );

const
  // Win10
  DEVPKEY_KsAudio_PacketSize_Constraints :	PROPERTYKEY = (fmtid: (D1: $13e004d6;
                                                                   D2: $b066;
                                                                   D3: $43bd;
                                                                   D4: ($91, $3b, $a4, $15, $cd, $13, $da, $87));
                                                                   pid: 2);

  //#if (NTDDI_VERSION >= NTDDI_WIN10_RS5) // Redstone 5

  // {13E004D6-B066-43BD-913B-A415CD13DA87},3
  // This property is the symbolic link to an interface of type 'GUID_KSCATEGORY_AUDIO_CONTROLLER_INTERFACE' published
  // by the KS Filter or miniport drivers on the KSCATEGORY_AUDIO interface to indicate the audio system about the 'controller'
  // device interface symbolic link that will provide extended information about this audio endpoint
  DEVPKEY_KsAudio_Controller_DeviceInterface_Path :	PROPERTYKEY = (fmtid: (D1: $13e004d6;
                                                                           D2: $b066;
                                                                           D3: $43bd;
                                                                           D4: ($91, $3b, $a4, $15, $cd, $13, $da, $87));
                                                                           pid: 3); // DEVPROP_TYPE_STRING

//#endif // (NTDDI_VERSION >= NTDDI_WIN10_RS5)


type

  PKSAUDIO_PACKETSIZE_PROCESSINGMODE_CONSTRAINT = ^_KSAUDIO_PACKETSIZE_SIGNALPROCESSINGMODE_CONSTRAINT;
  _KSAUDIO_PACKETSIZE_SIGNALPROCESSINGMODE_CONSTRAINT = record
    ProcessingMode: TGUID;
    SamplesPerProcessingPacket: ULONG;
    ProcessingPacketDurationInHns: ULONG;
  end;
  KSAUDIO_PACKETSIZE_PROCESSINGMODE_CONSTRAINT = _KSAUDIO_PACKETSIZE_SIGNALPROCESSINGMODE_CONSTRAINT;

  PProcessingModeConstraints = ^_ProcessingModeConstraints;
  _ProcessingModeConstraints = array [0..ANYSIZE_ARRAY - 1] of KSAUDIO_PACKETSIZE_PROCESSINGMODE_CONSTRAINT;
  TProcessingModeConstraints = _ProcessingModeConstraints;

  PKSAUDIO_PACKETSIZE_CONSTRAINTS = ^_KSAUDIO_PACKETSIZE_CONSTRAINTS;
  _KSAUDIO_PACKETSIZE_CONSTRAINTS = record
    MinPacketPeriodInHns: ULONG;
    PacketSizeFileAlignment: ULONG;
    Reserved: ULONG;
    NumProcessingModeConstraints: ULONG;
    ProcessingModeConstraints: _ProcessingModeConstraints;
  end;
  KSAUDIO_PACKETSIZE_CONSTRAINTS = _KSAUDIO_PACKETSIZE_CONSTRAINTS;

const
//#if (NTDDI_VERSION >= NTDDI_WIN10_RS1)
  DEVPKEY_KsAudio_PacketSize_Constraints2 :	PROPERTYKEY = (fmtid: (D1: $9404f781;
                                                                   D2: $7191;
                                                                   D3: $409b;
                                                                   D4: ($8b, $0b, $80, $bf, $6e, $c2, $29, $ae));
                                                                   pid: 2);

type
  PKSAUDIO_PACKETSIZE_CONSTRAINTS2 = ^_KSAUDIO_PACKETSIZE_CONSTRAINTS2;
  _KSAUDIO_PACKETSIZE_CONSTRAINTS2 = record
    MinPacketPeriodInHns: ULONG;
    PacketSizeFileAlignment: ULONG;
    MaxPacketSizeInBytes: ULONG;
    NumProcessingModeConstraints: ULONG;
    ProcessingModeConstraints: array [0..ANYSIZE_ARRAY - 1] of KSAUDIO_PACKETSIZE_PROCESSINGMODE_CONSTRAINT;
  end;
  KSAUDIO_PACKETSIZE_CONSTRAINTS2 = _KSAUDIO_PACKETSIZE_CONSTRAINTS2;
//#endif // (NTDDI_VERSION >= NTDDI_WIN10_RS1)


  //===========================================================================
  // Microphone array pin descriptor

// > Win Vista

  PKSMICARRAY_MICTYPE = ^KSMICARRAY_MICTYPE;
  KSMICARRAY_MICTYPE = (
    KSMICARRAY_MICTYPE_OMNIDIRECTIONAL,
    KSMICARRAY_MICTYPE_SUBCARDIOID,
    KSMICARRAY_MICTYPE_CARDIOID,
    KSMICARRAY_MICTYPE_SUPERCARDIOID,
    KSMICARRAY_MICTYPE_HYPERCARDIOID,
    KSMICARRAY_MICTYPE_8SHAPED,
    KSMICARRAY_MICTYPE_VENDORDEFINED = $0F
  );


  PKSAUDIO_MICROPHONE_COORDINATES = ^KSAUDIO_MICROPHONE_COORDINATES;
  KSAUDIO_MICROPHONE_COORDINATES = record
    usType: USHORT;                  // Type of Microphone
    wXCoord: SHORT;                  // X Coordinate of Mic
    wYCoord: SHORT;                  // Y Coordinate of Mic
    wZCoord: SHORT;                  // Z Coordinate of Mic
    wVerticalAngle: SHORT;           // MRA Vertical Angle
    wHorizontalAngle: SHORT;         // MRA Horizontal Angle
  end;


  PKSMICARRAY_MICARRAYTYPE = ^KSMICARRAY_MICARRAYTYPE;
  KSMICARRAY_MICARRAYTYPE = (
    KSMICARRAY_MICARRAYTYPE_LINEAR,
    KSMICARRAY_MICARRAYTYPE_PLANAR,
    KSMICARRAY_MICARRAYTYPE_3D);


  PKSAUDIO_MIC_ARRAY_GEOMETRY = ^KSAUDIO_MIC_ARRAY_GEOMETRY;
  KSAUDIO_MIC_ARRAY_GEOMETRY = record
    usVersion: USHORT;                                           // Version of Mic array specification (0x0100)
    usMicArrayType: USHORT;                                      // Type of Mic Array
    wVerticalAngleBegin: SHORT;                                  // Work Volume Vertical Angle Begin
    wVerticalAngleEnd: SHORT;                                    // Work Volume Vertical Angle End
    wHorizontalAngleBegin: SHORT;                                // Work Volume HorizontalAngle Begin
    wHorizontalAngleEnd: SHORT;                                  // Work Volume HorizontalAngle End
    usFrequencyBandLo: USHORT;                                   // Low end of Freq Range
    usFrequencyBandHi: USHORT;                                   // High end of Freq Range
    usNumberOfMicrophones: USHORT;                               // Count of microphone
                                                                 // coordinate structures
                                                                 // to follow.
    KsMicCoord: array[0..0] of KSAUDIO_MICROPHONE_COORDINATES;         // Array of Microphone
                                                                 // Coordinate structures
  end;
// END > Win Vista


  // ===========================================================================
  // DirectSound3D HAL

  PDS3DVECTOR = ^_DS3DVECTOR;
  _DS3DVECTOR = record
    case Integer of
      0: (x: Single;
          y: Single;
          z: Single);
      1: (dvX: Single;
          dvY: Single;
          dvZ: Single);
  end;
  DS3DVECTOR = _DS3DVECTOR;

  // ===========================================================================
  // ===========================================================================

const

  KSPROPSETID_DirectSound3DListener : TGUID = '{437B3414-D060-11d0-8583-00C04FD9BAF3}';


type

  PKSPROPERTY_DIRECTSOUND3DLISTENER = ^KSPROPERTY_DIRECTSOUND3DLISTENER;
  KSPROPERTY_DIRECTSOUND3DLISTENER = (
    KSPROPERTY_DIRECTSOUND3DLISTENER_ALL = 0,
    KSPROPERTY_DIRECTSOUND3DLISTENER_POSITION,
    KSPROPERTY_DIRECTSOUND3DLISTENER_VELOCITY,
    KSPROPERTY_DIRECTSOUND3DLISTENER_ORIENTATION,
    KSPROPERTY_DIRECTSOUND3DLISTENER_DISTANCEFACTOR,
    KSPROPERTY_DIRECTSOUND3DLISTENER_ROLLOFFFACTOR,
    KSPROPERTY_DIRECTSOUND3DLISTENER_DOPPLERFACTOR,
    KSPROPERTY_DIRECTSOUND3DLISTENER_BATCH,
    KSPROPERTY_DIRECTSOUND3DLISTENER_ALLOCATION
  );

  PKSDS3D_LISTENER_ALL = ^KSDS3D_LISTENER_ALL;
  KSDS3D_LISTENER_ALL = record
    Position: DS3DVECTOR;
    Velocity: DS3DVECTOR;
    OrientFront: DS3DVECTOR;
    OrientTop: DS3DVECTOR;
    DistanceFactor: Single;
    RolloffFactor: Single;
    DopplerFactor: Single;
  end;

  PKSDS3D_LISTENER_ORIENTATION = ^KSDS3D_LISTENER_ORIENTATION;
  KSDS3D_LISTENER_ORIENTATION = record
    Front: DS3DVECTOR;
    Top: DS3DVECTOR;
  end;

  //===========================================================================
  //===========================================================================

const

  KSPROPSETID_DirectSound3DBuffer : TGUID = '{437B3411-D060-11d0-8583-00C04FD9BAF3}';

type

  PKSPROPERTY_DIRECTSOUND3DBUFFER = ^KSPROPERTY_DIRECTSOUND3DBUFFER;
  KSPROPERTY_DIRECTSOUND3DBUFFER = (
    KSPROPERTY_DIRECTSOUND3DBUFFER_ALL = 0,
    KSPROPERTY_DIRECTSOUND3DBUFFER_POSITION,
    KSPROPERTY_DIRECTSOUND3DBUFFER_VELOCITY,
    KSPROPERTY_DIRECTSOUND3DBUFFER_CONEANGLES,
    KSPROPERTY_DIRECTSOUND3DBUFFER_CONEORIENTATION,
    KSPROPERTY_DIRECTSOUND3DBUFFER_CONEOUTSIDEVOLUME,
    KSPROPERTY_DIRECTSOUND3DBUFFER_MINDISTANCE,
    KSPROPERTY_DIRECTSOUND3DBUFFER_MAXDISTANCE,
    KSPROPERTY_DIRECTSOUND3DBUFFER_MODE
  );

  PKSDS3D_BUFFER_ALL = ^KSDS3D_BUFFER_ALL;
  KSDS3D_BUFFER_ALL = record
    Position: DS3DVECTOR;
    Velocity: DS3DVECTOR;
    InsideConeAngle: ULONG;
    OutsideConeAngle: ULONG;
    ConeOrientation: DS3DVECTOR;
    ConeOutsideVolume: LONG;
    MinDistance: Single;
    MaxDistance: Single;
    Mode: ULONG;
  end;

  PKSDS3D_BUFFER_CONE_ANGLES = ^KSDS3D_BUFFER_CONE_ANGLES;
  KSDS3D_BUFFER_CONE_ANGLES = record
    InsideConeAngle : ULONG;
    OutsideConeAngle: ULONG;
  end;

const

  KSAUDIO_STEREO_SPEAKER_GEOMETRY_HEADPHONE = (- 1);
  KSAUDIO_STEREO_SPEAKER_GEOMETRY_MIN       = 5;
  KSAUDIO_STEREO_SPEAKER_GEOMETRY_NARROW    = 10;
  KSAUDIO_STEREO_SPEAKER_GEOMETRY_WIDE      = 20;
  KSAUDIO_STEREO_SPEAKER_GEOMETRY_MAX       = 180;

  KSDSOUND_3D_MODE_NORMAL             = $00000000;
  KSDSOUND_3D_MODE_HEADRELATIVE       = $00000001;
  KSDSOUND_3D_MODE_DISABLE            = $00000002;

  //===========================================================================
  // Definitions intended for hardware acceleration of the HRTF 3D algorithm
  //===========================================================================

  KSDSOUND_BUFFER_CTRL_HRTF_3D        = $40000000;

type

  PKSDS3D_HRTF_PARAMS_MSG = ^KSDS3D_HRTF_PARAMS_MSG;
  KSDS3D_HRTF_PARAMS_MSG = record
    Size: ULONG;                     // This is the size of the struct in bytes
    Enabled: ULONG;
    SwapChannels: BOOL;
    ZeroAzimuth: BOOL;
    CrossFadeOutput: BOOL;
    FilterSize: ULONG;              // This is the additional size of the filter coeff in bytes
  end;

  // HRTF filter quality levels
  PKsds3dHrtfFilterQuality = ^KSDS3D_HRTF_FILTER_QUALITY;
  KSDS3D_HRTF_FILTER_QUALITY = (
    FULL_FILTER,
    LIGHT_FILTER,
    KSDS3D_FILTER_QUALITY_COUNT
  );
  TKsds3dHrtfFilterQuality = KSDS3D_HRTF_FILTER_QUALITY;


  PKSDS3D_HRTF_INIT_MSG = ^KSDS3D_HRTF_INIT_MSG;
  KSDS3D_HRTF_INIT_MSG = record
    Size: ULONG;                    // This is the size of the struct in bytes
    Quality: KSDS3D_HRTF_FILTER_QUALITY;
    SampleRate: Single;
    MaxFilterSize: ULONG;
    FilterTransientMuteLength: ULONG;
    FilterOverlapBufferLength: ULONG;
    OutputOverlapBufferLength: ULONG;
    Reserved: ULONG;
  end;

  // Coefficient formats
  PKSDS3D_HRTF_COEFF_FORMAT = ^KSDS3D_HRTF_COEFF_FORMAT;
  KSDS3D_HRTF_COEFF_FORMAT = (
    FLOAT_COEFF,
    SHORT_COEFF,
    KSDS3D_COEFF_COUNT);

  // Filter methods
  PKSDS3D_HRTF_FILTER_METHOD = ^KSDS3D_HRTF_FILTER_METHOD;
  KSDS3D_HRTF_FILTER_METHOD = (
    DIRECT_FORM,
    CASCADE_FORM,
    KSDS3D_FILTER_METHOD_COUNT);

  // Filter methods
  PKSDS3D_HRTF_FILTER_VERSION = ^KSDS3D_HRTF_FILTER_VERSION;
  KSDS3D_HRTF_FILTER_VERSION = (
    DS3D_HRTF_VERSION_1);

  PKSDS3D_HRTF_FILTER_FORMAT_MSG = ^KSDS3D_HRTF_FILTER_FORMAT_MSG;
  KSDS3D_HRTF_FILTER_FORMAT_MSG = record
    FilterMethod: KSDS3D_HRTF_FILTER_METHOD;
    CoeffFormat: KSDS3D_HRTF_COEFF_FORMAT;
    Version: KSDS3D_HRTF_FILTER_VERSION;
    Reserved: ULONG;
  end;

const

  KSPROPSETID_Hrtf3d : TGUID = '{b66decb0-a083-11d0-851e-00c04fd9baf3}';

type
  PKspropertyHrtf3d = ^KSPROPERTY_HRTF3D;
  KSPROPERTY_HRTF3D          = (
    KSPROPERTY_HRTF3D_PARAMS = 0,
    KSPROPERTY_HRTF3D_INITIALIZE,
    KSPROPERTY_HRTF3D_FILTER_FORMAT
  );
  TKspropertyHrtf3d = ^KSPROPERTY_HRTF3D;

  //===========================================================================
  // Definitions related to the obsolete Interaural Time Delay 3D algorithm
  //===========================================================================

  // DirectSound3D FIR context
  PKSDS3D_ITD_PARAMS = ^KSDS3D_ITD_PARAMS;
  KSDS3D_ITD_PARAMS = record
    Channel: LONG;
    VolSmoothScale: Single;
    TotalDryAttenuation: Single;
    TotalWetAttenuation: Single;
    SmoothFrequency: LONG;
    Delay: LONG;
  end;

  PKSDS3D_ITD_PARAMS_MSG = ^KSDS3D_ITD_PARAMS_MSG;
  KSDS3D_ITD_PARAMS_MSG = record
    Enabled: ULONG;
    LeftParams: KSDS3D_ITD_PARAMS;
    RightParams: KSDS3D_ITD_PARAMS;
    Reserved: ULONG;
  end;


const

  KSPROPSETID_Itd3d : TGUID = '{6429f090-9fd9-11d0-a75b-00a0c90365e3}';

type

  PKSPROPERTY_ITD3D = ^KSPROPERTY_ITD3D;
  KSPROPERTY_ITD3D          = (
    KSPROPERTY_ITD3D_PARAMS = 0
  );


  PKSDATARANGE_AUDIO = ^KSDATARANGE_AUDIO;
  KSDATARANGE_AUDIO = record
    DataRange              : KSDATARANGE;
    MaximumChannels        : ULONG;
    MinimumBitsPerSample   : ULONG;
    MaximumBitsPerSample   : ULONG;
    MinimumSampleFrequency : ULONG;
    MaximumSampleFrequency : ULONG;
  end;

  //---------------------------------------------------------------------------

const
  KSDATAFORMAT_SUBTYPE_RIFF     : TGUID = '{4995DAEE-9EE6-11D0-A40E-00A0C9223196}';
  KSDATAFORMAT_SUBTYPE_RIFFWAVE : TGUID = '{e436eb8b-524f-11ce-9f53-0020af0ba770}';

  //===========================================================================

  KSPROPSETID_Bibliographic     : TGUID = '{07BA150E-E2B1-11D0-AC17-00A0C9223196}';


type
  // Repeatable tags contain all entries within the property, each preceeded by length
  KSPROPERTY_BIBLIOGRAPHIC = Integer;
const
  // C++ multi-character constants are always of type Int (Integer)
  // How to handle those in Delphi:
  //   'RDL ' would be: ord('R') or (ord('D') shl 8) or (ord('L') shl 16) or (ord(' ') shl 24) and results in Int $52444C20

  KSPROPERTY_BIBLIOGRAPHIC_LEADER                      = ord('R') or (ord('D') shl 8) or (ord('L') shl 16) or (ord(' ') shl 24); // 'RDL '
  KSPROPERTY_BIBLIOGRAPHIC_LCCN                        = ord('0') or (ord('1') shl 8) or (ord('0') shl 16) or (ord(' ') shl 24); // '010 '
  KSPROPERTY_BIBLIOGRAPHIC_ISBN                        = ord('0') or (ord('2') shl 8) or (ord('0') shl 16) or (ord(' ') shl 24); // '020 '
  KSPROPERTY_BIBLIOGRAPHIC_ISSN                        = ord('2') or (ord('2') shl 8) or (ord('0') shl 16) or (ord(' ') shl 24); // '220 '
  KSPROPERTY_BIBLIOGRAPHIC_CATALOGINGSOURCE            = ord('0') or (ord('4') shl 8) or (ord('0') shl 16) or (ord(' ') shl 24); // '040 '
  KSPROPERTY_BIBLIOGRAPHIC_MAINPERSONALNAME            = ord('0') or (ord('0') shl 8) or (ord('1') shl 16) or (ord(' ') shl 24); // '001 '
  KSPROPERTY_BIBLIOGRAPHIC_MAINCORPORATEBODY           = ord('0') or (ord('1') shl 8) or (ord('1') shl 16) or (ord(' ') shl 24); // '011 '
  KSPROPERTY_BIBLIOGRAPHIC_MAINMEETINGNAME             = ord('1') or (ord('1') shl 8) or (ord('1') shl 16) or (ord(' ') shl 24); // '111 '
  KSPROPERTY_BIBLIOGRAPHIC_MAINUNIFORMTITLE            = ord('0') or (ord('3') shl 8) or (ord('1') shl 16) or (ord(' ') shl 24); // '031 '
  KSPROPERTY_BIBLIOGRAPHIC_UNIFORMTITLE                = ord('0') or (ord('4') shl 8) or (ord('2') shl 16) or (ord(' ') shl 24); // '042 '
  KSPROPERTY_BIBLIOGRAPHIC_TITLESTATEMENT              = ord('5') or (ord('4') shl 8) or (ord('2') shl 16) or (ord(' ') shl 24); // '542 '
  KSPROPERTY_BIBLIOGRAPHIC_VARYINGFORMTITLE            = ord('6') or (ord('4') shl 8) or (ord('2') shl 16) or (ord(' ') shl 24); // '642 '
  KSPROPERTY_BIBLIOGRAPHIC_PUBLICATION                 = ord('0') or (ord('6') shl 8) or (ord('2') shl 16) or (ord(' ') shl 24); // '062 '
  KSPROPERTY_BIBLIOGRAPHIC_PHYSICALDESCRIPTION         = ord('0') or (ord('0') shl 8) or (ord('3') shl 16) or (ord(' ') shl 24); // '003 '
  KSPROPERTY_BIBLIOGRAPHIC_ADDEDENTRYTITLE             = ord('0') or (ord('4') shl 8) or (ord('4') shl 16) or (ord(' ') shl 24); // '044 '
  KSPROPERTY_BIBLIOGRAPHIC_SERIESSTATEMENT             = ord('0') or (ord('9') shl 8) or (ord('4') shl 16) or (ord(' ') shl 24); // '094 '
  KSPROPERTY_BIBLIOGRAPHIC_GENERALNOTE                 = ord('0') or (ord('0') shl 8) or (ord('5') shl 16) or (ord(' ') shl 24); // '005 '
  KSPROPERTY_BIBLIOGRAPHIC_BIBLIOGRAPHYNOTE            = ord('4') or (ord('0') shl 8) or (ord('5') shl 16) or (ord(' ') shl 24); // '405 '
  KSPROPERTY_BIBLIOGRAPHIC_CONTENTSNOTE                = ord('5') or (ord('0') shl 8) or (ord('5') shl 16) or (ord(' ') shl 24); // '505 '
  KSPROPERTY_BIBLIOGRAPHIC_CREATIONCREDIT              = ord('8') or (ord('0') shl 8) or (ord('5') shl 16) or (ord(' ') shl 24); // '805 '
  KSPROPERTY_BIBLIOGRAPHIC_CITATION                    = ord('0') or (ord('1') shl 8) or (ord('5') shl 16) or (ord(' ') shl 24); // '015 '
  KSPROPERTY_BIBLIOGRAPHIC_PARTICIPANT                 = ord('1') or (ord('1') shl 8) or (ord('5') shl 16) or (ord(' ') shl 24); // '115 '
  KSPROPERTY_BIBLIOGRAPHIC_SUMMARY                     = ord('0') or (ord('2') shl 8) or (ord('5') shl 16) or (ord(' ') shl 24); // '025 '
  KSPROPERTY_BIBLIOGRAPHIC_TARGETAUDIENCE              = ord('1') or (ord('2') shl 8) or (ord('5') shl 16) or (ord(' ') shl 24); // '125 '
  KSPROPERTY_BIBLIOGRAPHIC_ADDEDFORMAVAILABLE          = ord('0') or (ord('3') shl 8) or (ord('5') shl 16) or (ord(' ') shl 24); // '035 '
  KSPROPERTY_BIBLIOGRAPHIC_SYSTEMDETAILS               = ord('8') or (ord('3') shl 8) or (ord('5') shl 16) or (ord(' ') shl 24); // '835 '
  KSPROPERTY_BIBLIOGRAPHIC_AWARDS                      = ord('6') or (ord('8') shl 8) or (ord('5') shl 16) or (ord(' ') shl 24); // '685 '
  KSPROPERTY_BIBLIOGRAPHIC_ADDEDENTRYPERSONALNAME      = ord('0') or (ord('0') shl 8) or (ord('6') shl 16) or (ord(' ') shl 24); // '006 '
  KSPROPERTY_BIBLIOGRAPHIC_ADDEDENTRYTOPICALTERM       = ord('0') or (ord('5') shl 8) or (ord('6') shl 16) or (ord(' ') shl 24); // '056 '
  KSPROPERTY_BIBLIOGRAPHIC_ADDEDENTRYGEOGRAPHIC        = ord('1') or (ord('5') shl 8) or (ord('6') shl 16) or (ord(' ') shl 24); // '156 '
  KSPROPERTY_BIBLIOGRAPHIC_INDEXTERMGENRE              = ord('5') or (ord('5') shl 8) or (ord('6') shl 16) or (ord(' ') shl 24); // '556 '
  KSPROPERTY_BIBLIOGRAPHIC_INDEXTERMCURRICULUM         = ord('8') or (ord('5') shl 8) or (ord('6') shl 16) or (ord(' ') shl 24); // '856 '
  KSPROPERTY_BIBLIOGRAPHIC_ADDEDENTRYUNIFORMTITLE      = ord('0') or (ord('3') shl 8) or (ord('7') shl 16) or (ord(' ') shl 24); // '037 '
  KSPROPERTY_BIBLIOGRAPHIC_ADDEDENTRYRELATED           = ord('0') or (ord('4') shl 8) or (ord('7') shl 16) or (ord(' ') shl 24); // '047 '
  KSPROPERTY_BIBLIOGRAPHIC_SERIESSTATEMENTPERSONALNAME = ord('0') or (ord('0') shl 8) or (ord('8') shl 16) or (ord(' ') shl 24); // '008 '
  KSPROPERTY_BIBLIOGRAPHIC_SERIESSTATEMENTUNIFORMTITLE = ord('0') or (ord('3') shl 8) or (ord('8') shl 16) or (ord(' ') shl 24); // '038 '

const

  KSPROPSETID_TopologyNode : TGUID = '{45FFAAA1-6E1B-11D0-BCF2-444553540000}';


type

  PKSPROPERTY_TOPOLOGYNODE = ^KSPROPERTY_TOPOLOGYNODE;
  KSPROPERTY_TOPOLOGYNODE = (
    KSPROPERTY_TOPOLOGYNODE_ENABLE = 1,
    KSPROPERTY_TOPOLOGYNODE_RESET  = 2
  );

  //===========================================================================

const

  KSPROPSETID_RtAudio : TGUID = '{A855A48C-2F78-4729-9051-1968746B9EEF}';

type

  PKSPROPERTY_RTAUDIO = ^KSPROPERTY_RTAUDIO;
  KSPROPERTY_RTAUDIO = (
    KSPROPERTY_RTAUDIO_GETPOSITIONFUNCTION,
    // >= Win Vista
    KSPROPERTY_RTAUDIO_BUFFER,
    KSPROPERTY_RTAUDIO_HWLATENCY,
    KSPROPERTY_RTAUDIO_POSITIONREGISTER,
    KSPROPERTY_RTAUDIO_CLOCKREGISTER,
    KSPROPERTY_RTAUDIO_BUFFER_WITH_NOTIFICATION,
    KSPROPERTY_RTAUDIO_REGISTER_NOTIFICATION_EVENT,
    KSPROPERTY_RTAUDIO_UNREGISTER_NOTIFICATION_EVENT,
    // >= Win7
    KSPROPERTY_RTAUDIO_QUERY_NOTIFICATION_SUPPORT,
    // >= Win10
    KSPROPERTY_RTAUDIO_PACKETCOUNT,
    KSPROPERTY_RTAUDIO_PRESENTATION_POSITION,
    KSPROPERTY_RTAUDIO_GETREADPACKET,
    KSPROPERTY_RTAUDIO_SETWRITEPACKET,
    // >= WIN10_RS5
    KSPROPERTY_RTAUDIO_PACKETVREGISTER
  );


  // >= Win Vista

  PKSRTAUDIO_BUFFER_PROPERTY = ^KSRTAUDIO_BUFFER_PROPERTY;
  KSRTAUDIO_BUFFER_PROPERTY = record
    _Property: KSPROPERTY;
    BaseAddress: Pointer;
    RequestedBufferSize: ULONG;
  end;


  PKSRTAUDIO_BUFFER_PROPERTY32 = ^KSRTAUDIO_BUFFER_PROPERTY32;
  KSRTAUDIO_BUFFER_PROPERTY32 = record
    _Property: KSPROPERTY;
    BaseAddress: ULONG;
    RequestedBufferSize: ULONG;
  end;


  PKSRTAUDIO_BUFFER_PROPERTY_WITH_NOTIFICATION = ^KSRTAUDIO_BUFFER_PROPERTY_WITH_NOTIFICATION;
  KSRTAUDIO_BUFFER_PROPERTY_WITH_NOTIFICATION = record
    _Property: KSPROPERTY;
    BaseAddress: Pointer;
    RequestedBufferSize: ULONG;
    NotificationCount: ULONG;
  end;


  PKSRTAUDIO_BUFFER_PROPERTY_WITH_NOTIFICATION32 = ^KSRTAUDIO_BUFFER_PROPERTY_WITH_NOTIFICATION32;
  KSRTAUDIO_BUFFER_PROPERTY_WITH_NOTIFICATION32 = record
    _Property: KSPROPERTY;
    BaseAddress: ULONG;
    RequestedBufferSize: ULONG;
    NotificationCount: ULONG;
  end;


  PKSRTAUDIO_BUFFER = ^KSRTAUDIO_BUFFER;
  KSRTAUDIO_BUFFER = record
    BufferAddress: Pointer;
    ActualBufferSize: ULONG;
    CallMemoryBarrier: BOOL;
  end;


  PKSRTAUDIO_BUFFER32 = ^KSRTAUDIO_BUFFER32;
  KSRTAUDIO_BUFFER32 = record
    BufferAddress: ULONG;
    ActualBufferSize: ULONG;
    CallMemoryBarrier: BOOL;
  end;


  PKSRTAUDIO_HWLATENCY = ^KSRTAUDIO_HWLATENCY;
  KSRTAUDIO_HWLATENCY = record
    FifoSize: ULONG;
    ChipsetDelay: ULONG;
    CodecDelay: ULONG;
  end;


  PKSRTAUDIO_HWREGISTER_PROPERTY = ^KSRTAUDIO_HWREGISTER_PROPERTY;
  KSRTAUDIO_HWREGISTER_PROPERTY = record
    _Property: KSPROPERTY;
    BaseAddress: Pointer;
  end;


  PKSRTAUDIO_HWREGISTER_PROPERTY32 = ^KSRTAUDIO_HWREGISTER_PROPERTY32;
  KSRTAUDIO_HWREGISTER_PROPERTY32 = record
    _Property: KSPROPERTY;
    BaseAddress: ULONG;
  end;


  PKSRTAUDIO_HWREGISTER = ^KSRTAUDIO_HWREGISTER;
  KSRTAUDIO_HWREGISTER = record
    _Register: Pointer;
    Width: ULONG;
    Numerator: ULONGLONG;
    Denominator: ULONGLONG;
    Accuracy: ULONG;
  end;


  PKSRTAUDIO_HWREGISTER32 = ^KSRTAUDIO_HWREGISTER32;
  KSRTAUDIO_HWREGISTER32 = record
    _Register: ULONG;
    Width: ULONG;
    Numerator: ULONGLONG;
    Denominator: ULONGLONG;
    Accuracy: ULONG;
  end;


  PKSRTAUDIO_NOTIFICATION_EVENT_PROPERTY = ^KSRTAUDIO_NOTIFICATION_EVENT_PROPERTY;
  KSRTAUDIO_NOTIFICATION_EVENT_PROPERTY = record
    _Property: KSPROPERTY;
    NotificationEvent: THandle;
  end;

  PKSRTAUDIO_NOTIFICATION_EVENT_PROPERTY32 = ^KSRTAUDIO_NOTIFICATION_EVENT_PROPERTY32;
  KSRTAUDIO_NOTIFICATION_EVENT_PROPERTY32 = record
    _Property: KSPROPERTY;
    NotificationEvent: ULONG;
  end;

  // end >= Win Vista

  // >= Win 10

  PKSRTAUDIO_GETREADPACKET_INFO = ^KSRTAUDIO_GETREADPACKET_INFO;
  KSRTAUDIO_GETREADPACKET_INFO = record
    PacketNumber: ULONG;
    Flags: DWORD;
    PerformanceCounterValue: ULONG64;
    MoreData: BOOL;
  end;

  PKSRTAUDIO_SETWRITEPACKET_INFO = ^KSRTAUDIO_SETWRITEPACKET_INFO;
  KSRTAUDIO_SETWRITEPACKET_INFO = record
    PacketNumber: ULONG;
    Flags: DWORD;
    EosPacketLength: ULONG;
  end;

  // end >= Win 10

//#if (NTDDI_VERSION >= NTDDI_WIN10_RS5)

  PKSRTAUDIO_PACKETVREGISTER_PROPERTY = ^KSRTAUDIO_PACKETVREGISTER_PROPERTY;
  KSRTAUDIO_PACKETVREGISTER_PROPERTY = record
    _Property:   KSPROPERTY;
    BaseAddress: Pointer;
  end;

  PKSRTAUDIO_PACKETVREGISTER = ^KSRTAUDIO_PACKETVREGISTER;
  KSRTAUDIO_PACKETVREGISTER = record
    CompletedPacketCount: PULONG64;
    CompletedPacketQPC:   PULONG64;
    CompletedPacketHash:  PULONG64;
  end;

//#endif


  // >= Win 7
  //===========================================================================

const
  KSPROPSETID_BtAudio : TGUID = '{7FA06C40-B8F6-4C7E-8556-E8C33A12E54D}';


type

  PKspropertyBtaudio = ^KSPROPERTY_BTAUDIO;
  KSPROPERTY_BTAUDIO = (
    KSPROPERTY_ONESHOT_RECONNECT,
    KSPROPERTY_ONESHOT_DISCONNECT
  );
  TKspropertyBtaudio = KSPROPERTY_BTAUDIO;


const

  KSPROPSETID_DrmAudioStream : TGUID = '{2F2C8DDD-4198-4fac-BA29-61BB05B7DE06}';


type

  PKSPROPERTY_DRMAUDIOSTREAM = ^KSPROPERTY_DRMAUDIOSTREAM;
  KSPROPERTY_DRMAUDIOSTREAM = (
    KSPROPERTY_DRMAUDIOSTREAM_CONTENTID,
    KSPROPERTY_DRMAUDIOSTREAM_AUTHENTICATEFUNCTION
  );


  //===========================================================================


  //#if (NTDDI_VERSION >= NTDDI_WINTHRESHOLD)
  //===========================================================================

const

  KSPROPSETID_SoundDetector    : TGUID = '{113C425E-FD17-4057-B422-ED4074F1AFDF}';

  //#if (NTDDI_VERSION >= NTDDI_WIN10_19H1)
  KSPROPSETID_SoundDetector2   : TGUID = '{FE07E322-450C-4BD5-84CA-A948500EA6AA}';
  KSPROPSETID_InterleavedAudio : TGUID = '{E9EBE550-D619-4C0A-976B-7062322B3006}';


type

  PKSPROPERTY_INTERLEAVEDAUDIO = ^KSPROPERTY_INTERLEAVEDAUDIO;
  KSPROPERTY_INTERLEAVEDAUDIO                     = (
    KSPROPERTY_INTERLEAVEDAUDIO_FORMATINFORMATION = 1);

  PINTERLEAVED_AUDIO_FORMAT_INFORMATION = ^INTERLEAVED_AUDIO_FORMAT_INFORMATION;
  INTERLEAVED_AUDIO_FORMAT_INFORMATION = record
    Size: ULONG;
    PrimaryChannelCount: DWORD;
    PrimaryChannelStartPosition: DWORD;
    PrimaryChannelMask: DWORD;
    InterleavedChannelCount: DWORD;
    InterleavedChannelStartPosition: DWORD;
    InterleavedChannelMask: DWORD;
  end;

  PKSSOUNDDETECTORPROPERTY = ^KSSOUNDDETECTORPROPERTY;
  KSSOUNDDETECTORPROPERTY = record
    &Property: KSPROPERTY;
    EventId: TGUID;
  end;

 // #endif // (NTDDI_VERSION >= NTDDI_WIN10_19H1)

  PKSPROPERTY_SOUNDDETECTOR = ^KSPROPERTY_SOUNDDETECTOR;
  KSPROPERTY_SOUNDDETECTOR = (
    KSPROPERTY_SOUNDDETECTOR_SUPPORTEDPATTERNS = 1,
    KSPROPERTY_SOUNDDETECTOR_PATTERNS          = 2,
    KSPROPERTY_SOUNDDETECTOR_ARMED             = 3,
    KSPROPERTY_SOUNDDETECTOR_MATCHRESULT       = 4
  );

  PSOUNDDETECTOR_PATTERNHEADER = ^SOUNDDETECTOR_PATTERNHEADER;
  SOUNDDETECTOR_PATTERNHEADER = record
    Size: ULONG;
    PatternType: TGUID;
  end;


const

  KSEVENTSETID_SoundDetector : TGUID = '{69785C9B-FC2D-49D6-AC32-4799F87DE9F6}';

type

  PKSEVENT_SOUNDDETECTOR = ^KSEVENT_SOUNDDETECTOR;
  KSEVENT_SOUNDDETECTOR                 = (
    KSEVENT_SOUNDDETECTOR_MATCHDETECTED = 1
  );

  //#endif // (NTDDI_VERSION >= NTDDI_WINTHRESHOLD)

  //===========================================================================

{NTDDI_VERSION >= NTDDI_WIN10_19H1}
const
  // The payload of this notification is a SOUNDDETECTOR_PATTERNHEADER
  KSNOTIFICATIONID_SoundDetector : TGUID = '{6389D844-BB32-4C4C-A802-F4B4B77AFEAD}';

{END NTDDI_VERSION >= NTDDI_WIN10_19H1}

  KSPROPSETID_Audio : TGUID = '{45FFAAA0-6E1B-11D0-BCF2-444553540000}';

type

  PKSPROPERTY_AUDIO = ^KSPROPERTY_AUDIO;
  KSPROPERTY_AUDIO = (
    KSPROPERTY_AUDIO_LATENCY                                  = 1,
    KSPROPERTY_AUDIO_COPY_PROTECTION                          = 2,
    KSPROPERTY_AUDIO_CHANNEL_CONFIG                           = 3,
    KSPROPERTY_AUDIO_VOLUMELEVEL                              = 4,
    KSPROPERTY_AUDIO_POSITION                                 = 5,
    KSPROPERTY_AUDIO_DYNAMIC_RANGE                            = 6,
    KSPROPERTY_AUDIO_QUALITY                                  = 7,
    KSPROPERTY_AUDIO_SAMPLING_RATE                            = 8,
    KSPROPERTY_AUDIO_DYNAMIC_SAMPLING_RATE                    = 9,
    KSPROPERTY_AUDIO_MIX_LEVEL_TABLE                          = 10,
    KSPROPERTY_AUDIO_MIX_LEVEL_CAPS                           = 11,
    KSPROPERTY_AUDIO_MUX_SOURCE                               = 12,
    KSPROPERTY_AUDIO_MUTE                                     = 13,
    KSPROPERTY_AUDIO_BASS                                     = 14,
    KSPROPERTY_AUDIO_MID                                      = 15,
    KSPROPERTY_AUDIO_TREBLE                                   = 16,
    KSPROPERTY_AUDIO_BASS_BOOST                               = 17,
    KSPROPERTY_AUDIO_EQ_LEVEL                                 = 18,
    KSPROPERTY_AUDIO_NUM_EQ_BANDS                             = 19,
    KSPROPERTY_AUDIO_EQ_BANDS                                 = 20,
    KSPROPERTY_AUDIO_AGC                                      = 21,
    KSPROPERTY_AUDIO_DELAY                                    = 22,
    KSPROPERTY_AUDIO_LOUDNESS                                 = 23,
    KSPROPERTY_AUDIO_WIDE_MODE                                = 24,                 //Reserved for system use
    KSPROPERTY_AUDIO_WIDENESS                                 = 25,
    KSPROPERTY_AUDIO_REVERB_LEVEL                             = 26,
    KSPROPERTY_AUDIO_CHORUS_LEVEL                             = 27,
    KSPROPERTY_AUDIO_DEV_SPECIFIC                             = 28,
    KSPROPERTY_AUDIO_DEMUX_DEST                               = 29,
    KSPROPERTY_AUDIO_STEREO_ENHANCE                           = 30,            //Reserved for system use
    KSPROPERTY_AUDIO_MANUFACTURE_GUID                         = 31,          //Reserved for system use
    KSPROPERTY_AUDIO_PRODUCT_GUID                             = 32,              //Reserved for system use
    KSPROPERTY_AUDIO_CPU_RESOURCES                            = 33,
    KSPROPERTY_AUDIO_STEREO_SPEAKER_GEOMETRY                  = 34,
    KSPROPERTY_AUDIO_SURROUND_ENCODE                          = 35,
    KSPROPERTY_AUDIO_3D_INTERFACE                             = 36,
    // >= Win XP
    KSPROPERTY_AUDIO_PEAKMETER                                = 37,
    KSPROPERTY_AUDIO_ALGORITHM_INSTANCE                       = 38,
    KSPROPERTY_AUDIO_FILTER_STATE                             = 39,
    KSPROPERTY_AUDIO_PREFERRED_STATUS                         = 40,
    // >= Win Vista
    KSPROPERTY_AUDIO_PEQ_MAX_BANDS                            = 41,
    KSPROPERTY_AUDIO_PEQ_NUM_BANDS                            = 42,
    KSPROPERTY_AUDIO_PEQ_BAND_CENTER_FREQ                     = 43,
    KSPROPERTY_AUDIO_PEQ_BAND_Q_FACTOR                        = 44,
    KSPROPERTY_AUDIO_PEQ_BAND_LEVEL                           = 45,
    KSPROPERTY_AUDIO_CHORUS_MODULATION_RATE                   = 46,
    KSPROPERTY_AUDIO_CHORUS_MODULATION_DEPTH                  = 47,
    KSPROPERTY_AUDIO_REVERB_TIME                              = 48,
    KSPROPERTY_AUDIO_REVERB_DELAY_FEEDBACK                    = 49,
    KSPROPERTY_AUDIO_POSITIONEX                               = 50,
    KSPROPERTY_AUDIO_MIC_ARRAY_GEOMETRY                       = 51,
    // >= Win 8
    KSPROPERTY_AUDIO_PRESENTATION_POSITION                    = 52,
    KSPROPERTY_AUDIO_WAVERT_CURRENT_WRITE_POSITION            = 53,
    KSPROPERTY_AUDIO_LINEAR_BUFFER_POSITION                   = 54,
    KSPROPERTY_AUDIO_PEAKMETER2                               = 55,
    // >= Win 8.1
    KSPROPERTY_AUDIO_WAVERT_CURRENT_WRITE_LASTBUFFER_POSITION = 56,
    KSPROPERTY_AUDIO_VOLUMELIMIT_ENGAGED                      = 57,
    // >= Win10 RS1
    KSPROPERTY_AUDIO_MIC_SENSITIVITY                          = 58, // deprecated in favor of KSPROPERTY_AUDIO_MIC_SENSITIVITY2
    KSPROPERTY_AUDIO_MIC_SNR                                  = 59,
    // >= NTDDI_WIN10_RS4)
    KSPROPERTY_AUDIO_MIC_SENSITIVITY2                         = 60
  );


const
  // Audio quality constants
  KSAUDIO_QUALITY_WORST     = $0;
  KSAUDIO_QUALITY_PC        = $1;
  KSAUDIO_QUALITY_BASIC     = $2;
  KSAUDIO_QUALITY_ADVANCED  = $3;


  // Audio CPU resource constants
  KSAUDIO_CPU_RESOURCES_NOT_HOST_CPU = $00000000;
  KSAUDIO_CPU_RESOURCES_HOST_CPU     = $7FFFFFFF;


type

  PKSAUDIO_COPY_PROTECTION = ^KSAUDIO_COPY_PROTECTION;
  KSAUDIO_COPY_PROTECTION = record
    fCopyrighted : BOOL;
    fOriginal    : BOOL;
  end;

  PKSAUDIO_CHANNEL_CONFIG = ^KSAUDIO_CHANNEL_CONFIG;
  KSAUDIO_CHANNEL_CONFIG = record
    ActiveSpeakerPositions: LONG;
  end;


const
  // Speaker Positions:
  SPEAKER_FRONT_LEFT            = $1;
  SPEAKER_FRONT_RIGHT           = $2;
  SPEAKER_FRONT_CENTER          = $4;
  SPEAKER_LOW_FREQUENCY         = $8;
  SPEAKER_BACK_LEFT             = $10;
  SPEAKER_BACK_RIGHT            = $20;
  SPEAKER_FRONT_LEFT_OF_CENTER  = $40;
  SPEAKER_FRONT_RIGHT_OF_CENTER = $80;
  SPEAKER_BACK_CENTER           = $100;
  SPEAKER_SIDE_LEFT             = $200;
  SPEAKER_SIDE_RIGHT            = $400;
  SPEAKER_TOP_CENTER            = $800;
  SPEAKER_TOP_FRONT_LEFT        = $1000;
  SPEAKER_TOP_FRONT_CENTER      = $2000;
  SPEAKER_TOP_FRONT_RIGHT       = $4000;
  SPEAKER_TOP_BACK_LEFT         = $8000;
  SPEAKER_TOP_BACK_CENTER       = $10000;
  SPEAKER_TOP_BACK_RIGHT        = $20000;


  // Bit mask locations reserved for future use
  SPEAKER_RESERVED  = $7FFC0000;


  // Used to specify that any possible permutation of speaker configurations
  SPEAKER_ALL       = $80000000;


  // DirectSound Speaker Config
  KSAUDIO_SPEAKER_MONO = (SPEAKER_FRONT_CENTER);

  KSAUDIO_SPEAKER_1POINT1 = (SPEAKER_FRONT_CENTER or
                             SPEAKER_LOW_FREQUENCY);

  KSAUDIO_SPEAKER_STEREO = (SPEAKER_FRONT_LEFT Or
                            SPEAKER_FRONT_RIGHT);

  KSAUDIO_SPEAKER_2POINT1 = (SPEAKER_FRONT_LEFT or
                             SPEAKER_FRONT_RIGHT or
                             SPEAKER_LOW_FREQUENCY);

  KSAUDIO_SPEAKER_3POINT0 = (SPEAKER_FRONT_LEFT or
                             SPEAKER_FRONT_RIGHT or
                             SPEAKER_FRONT_CENTER);

  KSAUDIO_SPEAKER_3POINT1 = (SPEAKER_FRONT_LEFT or
                             SPEAKER_FRONT_RIGHT or
                             SPEAKER_FRONT_CENTER or
                             SPEAKER_LOW_FREQUENCY);

  KSAUDIO_SPEAKER_QUAD = (SPEAKER_FRONT_LEFT Or
                          SPEAKER_FRONT_RIGHT Or
                          SPEAKER_BACK_LEFT Or
                          SPEAKER_BACK_RIGHT);

  KSAUDIO_SPEAKER_SURROUND = (SPEAKER_FRONT_LEFT Or
                              SPEAKER_FRONT_RIGHT Or
                              SPEAKER_FRONT_CENTER Or
                              SPEAKER_BACK_CENTER);

  KSAUDIO_SPEAKER_5POINT1 = (SPEAKER_FRONT_LEFT Or
                             SPEAKER_FRONT_RIGHT Or
                             SPEAKER_FRONT_CENTER Or
                             SPEAKER_LOW_FREQUENCY Or
                             SPEAKER_BACK_LEFT Or
                             SPEAKER_BACK_RIGHT);

  KSAUDIO_SPEAKER_7POINT1 = (SPEAKER_FRONT_LEFT Or
                             SPEAKER_FRONT_RIGHT Or
                             SPEAKER_FRONT_CENTER Or
                             SPEAKER_LOW_FREQUENCY Or
                             SPEAKER_BACK_LEFT Or
                             SPEAKER_BACK_RIGHT Or
                             SPEAKER_FRONT_LEFT_OF_CENTER Or
                             SPEAKER_FRONT_RIGHT_OF_CENTER);

  KSAUDIO_SPEAKER_5POINT1_SURROUND = (SPEAKER_FRONT_LEFT Or
                                      SPEAKER_FRONT_RIGHT Or
                                      SPEAKER_FRONT_CENTER Or
                                      SPEAKER_LOW_FREQUENCY Or
                                      SPEAKER_SIDE_LEFT Or
                                      SPEAKER_SIDE_RIGHT);

  KSAUDIO_SPEAKER_7POINT1_SURROUND = (SPEAKER_FRONT_LEFT Or
                                      SPEAKER_FRONT_RIGHT Or
                                      SPEAKER_FRONT_CENTER Or
                                      SPEAKER_LOW_FREQUENCY Or
                                      SPEAKER_BACK_LEFT Or
                                      SPEAKER_BACK_RIGHT Or
                                      SPEAKER_SIDE_LEFT Or
                                      SPEAKER_SIDE_RIGHT);

  // The following are obsolete 5.1 and 7.1 settings (they lack side speakers).
  // Note this means that the default 5.1 and 7.1 settings (KSAUDIO_SPEAKER_5POINT1 and
  // KSAUDIO_SPEAKER_7POINT1) are similarly obsolete but are unchanged for compatibility reasons.
  KSAUDIO_SPEAKER_5POINT1_BACK = KSAUDIO_SPEAKER_5POINT1;
  KSAUDIO_SPEAKER_7POINT1_WIDE = KSAUDIO_SPEAKER_7POINT1;



  // DVD Speaker Positions
  KSAUDIO_SPEAKER_GROUND_FRONT_LEFT   = SPEAKER_FRONT_LEFT;
  KSAUDIO_SPEAKER_GROUND_FRONT_CENTER = SPEAKER_FRONT_CENTER;
  KSAUDIO_SPEAKER_GROUND_FRONT_RIGHT  = SPEAKER_FRONT_RIGHT;
  KSAUDIO_SPEAKER_GROUND_REAR_LEFT    = SPEAKER_BACK_LEFT;
  KSAUDIO_SPEAKER_GROUND_REAR_RIGHT   = SPEAKER_BACK_RIGHT;
  KSAUDIO_SPEAKER_TOP_MIDDLE          = SPEAKER_TOP_CENTER;
  KSAUDIO_SPEAKER_SUPER_WOOFER        = SPEAKER_LOW_FREQUENCY;


type

  PKSAUDIO_DYNAMIC_RANGE = ^KSAUDIO_DYNAMIC_RANGE;
  KSAUDIO_DYNAMIC_RANGE = record
    QuietCompression : ULONG;
    LoudCompression  : ULONG;
  end;

  PKSAUDIO_MIXLEVEL = ^KSAUDIO_MIXLEVEL;
  KSAUDIO_MIXLEVEL = record
    Mute  : BOOL;
    Level : Longint;
  end;

  PKSAUDIO_MIX_CAPS = ^KSAUDIO_MIX_CAPS;
  KSAUDIO_MIX_CAPS = record
    Mute: BOOL;
    Minimum: LONG;
    Maximum: LONG;
    case Integer of
      0: (Resolution: LONG);
      1: (Reset: LONG);
  end;

  // LEFT OUT < WIN VISTA

  PKSAUDIO_MIXCAP_TABLE = ^KSAUDIO_MIXCAP_TABLE;
  KSAUDIO_MIXCAP_TABLE = record
    InputChannels  : ULONG;
    OutputChannels : ULONG;
    Capabilities: array[0..0] of KSAUDIO_MIX_CAPS;
  end;

  PKSAUDIO_POSITIONEX = ^KSAUDIO_POSITIONEX;
  KSAUDIO_POSITIONEX = record
    TimerFrequency: LARGE_INTEGER;
    TimeStamp1: LARGE_INTEGER;
    Position: KSAUDIO_POSITION;
    TimeStamp2: LARGE_INTEGER;
  end;

const
  // >= Win 10
  KSPROPSETID_TelephonyControl : TGUID = '{B6DF7EB1-D099-489F-A6A0-C0106F0887A7}';

type

  PKSPROPERTY_TELEPHONY_CONTROL = ^KSPROPERTY_TELEPHONY_CONTROL;
  KSPROPERTY_TELEPHONY_CONTROL      = (
    KSPROPERTY_TELEPHONY_PROVIDERID = 0,
    KSPROPERTY_TELEPHONY_CALLINFO,
    KSPROPERTY_TELEPHONY_CALLCONTROL,
    KSPROPERTY_TELEPHONY_PROVIDERCHANGE,
    KSPROPERTY_TELEPHONY_CALLHOLD,
    KSPROPERTY_TELEPHONY_MUTE_TX
  );

  PTELEPHONY_CALLTYPE = ^TELEPHONY_CALLTYPE;
  TELEPHONY_CALLTYPE                   = (
    TELEPHONY_CALLTYPE_CIRCUITSWITCHED = 0,
    TELEPHONY_CALLTYPE_PACKETSWITCHED_LTE,
    TELEPHONY_CALLTYPE_PACKETSWITCHED_WLAN
  );

  PTELEPHONY_CALLCONTROLOP = ^TELEPHONY_CALLCONTROLOP;
  TELEPHONY_CALLCONTROLOP           = (
    TELEPHONY_CALLCONTROLOP_DISABLE = 0,
    TELEPHONY_CALLCONTROLOP_ENABLE
  );

  PKSTELEPHONY_CALLCONTROL = ^_tagKSTELEPHONY_CALLCONTROL;
  _tagKSTELEPHONY_CALLCONTROL = record
    CallType: TELEPHONY_CALLTYPE;
    CallControlOp: TELEPHONY_CALLCONTROLOP;
  end;
  KSTELEPHONY_CALLCONTROL = _tagKSTELEPHONY_CALLCONTROL;

  PTELEPHONY_PROVIDERCHANGEOP = ^TELEPHONY_PROVIDERCHANGEOP;
  TELEPHONY_PROVIDERCHANGEOP       = (
    TELEPHONY_PROVIDERCHANGEOP_END = 0,
    TELEPHONY_PROVIDERCHANGEOP_BEGIN,
    TELEPHONY_PROVIDERCHANGEOP_CANCEL
  );

  PKSTELEPHONY_PROVIDERCHANGE = ^_tagKSTELEPHONY_PROVIDERCHANGE;
  _tagKSTELEPHONY_PROVIDERCHANGE = record
    CallType: TELEPHONY_CALLTYPE;
    ProviderChangeOp: TELEPHONY_PROVIDERCHANGEOP;
  end;
  KSTELEPHONY_PROVIDERCHANGE = _tagKSTELEPHONY_PROVIDERCHANGE;

  PTelephonyCallstate = ^TTelephonyCallstate;
  TELEPHONY_CALLSTATE            = (
    TELEPHONY_CALLSTATE_DISABLED = 0,
    TELEPHONY_CALLSTATE_ENABLED,
    TELEPHONY_CALLSTATE_HOLD,
    TELEPHONY_CALLSTATE_PROVIDERTRANSITION
  );
  TTelephonyCallstate = TELEPHONY_CALLSTATE;

  PKSTELEPHONY_CALLINFO = ^_tagKSTELEPHONY_CALLINFO;
  _tagKSTELEPHONY_CALLINFO = record
    CallType: TELEPHONY_CALLTYPE;
    CallState: TELEPHONY_CALLSTATE;
  end;
  KSTELEPHONY_CALLINFO = _tagKSTELEPHONY_CALLINFO;


const

  KSPROPSETID_TelephonyTopology : TGUID = '{ABF25C7E-0E64-4E32-B190-D0F6D7C53E97}';

type
  PKspropertyTelephonyTopology = ^KSPROPERTY_TELEPHONY_TOPOLOGY;
  KSPROPERTY_TELEPHONY_TOPOLOGY         = (
    KSPROPERTY_TELEPHONY_ENDPOINTIDPAIR = 0,
    KSPROPERTY_TELEPHONY_VOLUME
  );
  TKspropertyTelephonyTopology = KSPROPERTY_TELEPHONY_TOPOLOGY;

  PKSTOPOLOGY_ENDPOINTID = ^_tagKSTOPOLOGY_ENDPOINTID;
  _tagKSTOPOLOGY_ENDPOINTID = record
    TopologyName: array[0..MAX_PATH - 1] of WCHAR;  // Reference string for topology filter of an endpoint
    PinId: ULONG;                                   // Topology filter pin id to which endpoint is connected
  end;
  KSTOPOLOGY_ENDPOINTID = _tagKSTOPOLOGY_ENDPOINTID;

  PKSTOPOLOGY_ENDPOINTIDPAIR = ^_tagKSTOPOLOGY_ENDPOINTIDPAIR;
  _tagKSTOPOLOGY_ENDPOINTIDPAIR = record
    RenderEndpoint: KSTOPOLOGY_ENDPOINTID;
    CaptureEndpoint: KSTOPOLOGY_ENDPOINTID;
  end;
  KSTOPOLOGY_ENDPOINTIDPAIR = _tagKSTOPOLOGY_ENDPOINTIDPAIR;


const

  KSPROPSETID_FMRXTopology : TGUID = '{0C46CE8F-DC2D-4204-9DC9-F58963366563}';

type

  PKSPROPERTY_FMRX_TOPOLOGY = ^KSPROPERTY_FMRX_TOPOLOGY;
  KSPROPERTY_FMRX_TOPOLOGY     = (
    KSPROPERTY_FMRX_ENDPOINTID = 0,
    KSPROPERTY_FMRX_VOLUME,
    KSPROPERTY_FMRX_ANTENNAENDPOINTID
  );


const

  KSPROPSETID_FMRXControl : TGUID = '{947BBA3A-E8EE-4786-90C4-8428185F05BE}';


type

  PKSPROPERTY_FMRX_CONTROL = ^KSPROPERTY_FMRX_CONTROL;
  KSPROPERTY_FMRX_CONTROL = (
    KSPROPERTY_FMRX_STATE = 0
  );

// END >= Win 10



// >= NTDDI_WIN10_RS4
const

  KSEVENTSETID_Telephony  : TGUID = '{B77F12B4-CEB4-4484-8D5E-52C1E7D8762D}';

type

  PKSEVENT_TELEPHONY = ^KSEVENT_TELEPHONY;
  KSEVENT_TELEPHONY = (
    KSEVENT_TELEPHONY_ENDPOINTPAIRS_CHANGED);
// End >= NTDDI_WIN10_RS4)



  //===========================================================================
  // Topology Node Type GUIDs

const

  KSNODETYPE_DAC                        : TGUID = '{507AE360-C554-11D0-8A2B-00A0C9255AC1}';
  KSNODETYPE_ADC                        : TGUID = '{4D837FE0-C555-11D0-8A2B-00A0C9255AC1}';
  KSNODETYPE_SRC                        : TGUID = '{9DB7B9E0-C555-11D0-8A2B-00A0C9255AC1}';
  KSNODETYPE_SUPERMIX                   : TGUID = '{E573ADC0-C555-11D0-8A2B-00A0C9255AC1}';
  KSNODETYPE_MUX                        : TGUID = '{2CEAF780-C556-11D0-8A2B-00A0C9255AC1}';
  KSNODETYPE_DEMUX                      : TGUID = '{C0EB67D4-E807-11D0-958A-00C04FB925D3}';
  KSNODETYPE_SUM                        : TGUID = '{DA441A60-C556-11D0-8A2B-00A0C9255AC1}';
  KSNODETYPE_MUTE                       : TGUID = '{02B223C0-C557-11D0-8A2B-00A0C9255AC1}';
  KSNODETYPE_VOLUME                     : TGUID = '{3A5ACC00-C557-11D0-8A2B-00A0C9255AC1}';
  KSNODETYPE_TONE                       : TGUID = '{7607E580-C557-11D0-8A2B-00A0C9255AC1}';
  KSNODETYPE_EQUALIZER                  : TGUID = '{9D41B4A0-C557-11D0-8A2B-00A0C9255AC1}';
  KSNODETYPE_AGC                        : TGUID = '{E88C9BA0-C557-11D0-8A2B-00A0C9255AC1}';
  KSNODETYPE_NOISE_SUPPRESS             : TGUID = '{E07F903F-62FD-4e60-8CDD-DEA7236665B5}';
  KSNODETYPE_DELAY                      : TGUID = '{144981E0-C558-11D0-8A2B-00A0C9255AC1}';
  KSNODETYPE_LOUDNESS                   : TGUID = '{41887440-C558-11D0-8A2B-00A0C9255AC1}';
  KSNODETYPE_PROLOGIC_DECODER           : TGUID = '{831C2C80-C558-11D0-8A2B-00A0C9255AC1}';
  KSNODETYPE_STEREO_WIDE                : TGUID = '{A9E69800-C558-11D0-8A2B-00A0C9255AC1}';
  KSNODETYPE_REVERB                     : TGUID = '{EF0328E0-C558-11D0-8A2B-00A0C9255AC1}';
  KSNODETYPE_CHORUS                     : TGUID = '{20173F20-C559-11D0-8A2B-00A0C9255AC1}';
  KSNODETYPE_3D_EFFECTS                 : TGUID = '{55515860-C559-11D0-8A2B-00A0C9255AC1}';
  KSNODETYPE_PARAMETRIC_EQUALIZER       : TGUID = '{19BB3A6A-CE2B-4442-87EC-6727C3CAB477}';
  KSNODETYPE_UPDOWN_MIX                 : TGUID = '{B7EDC5CF-7B63-4ee2-A100-29EE2CB6B2DE}';
  KSNODETYPE_DYN_RANGE_COMPRESSOR       : TGUID = '{08C8A6A8-601F-4af8-8793-D905FF4CA97D}';

  KSNODETYPE_ACOUSTIC_ECHO_CANCEL       : TGUID = '{BF963D80-C559-11D0-8A2B-00A0C9255AC1}'; // = KSCATEGORY_ACOUSTIC_ECHO_CANCEL
  KSNODETYPE_MICROPHONE_ARRAY_PROCESSOR : TGUID = '{830a44f2-a32d-476b-be97-42845673b35a}'; // = KSCATEGORY_MICROPHONE_ARRAY_PROCESSOR

  KSALGORITHMINSTANCE_SYSTEM_ACOUSTIC_ECHO_CANCEL       : TGUID = '{1C22C56D-9879-4f5b-A389-27996DDC2810}';
  KSALGORITHMINSTANCE_SYSTEM_NOISE_SUPPRESS             : TGUID = '{5AB0882E-7274-4516-877D-4EEE99BA4FD0}';
  KSALGORITHMINSTANCE_SYSTEM_AGC                        : TGUID = '{950E55B9-877C-4c67-BE08-E47B5611130A}';
  KSALGORITHMINSTANCE_SYSTEM_MICROPHONE_ARRAY_PROCESSOR : TGUID = '{B6F5A0A0-9E61-4f8c-91E3-76CF0F3C471F}';

  KSNODETYPE_DEV_SPECIFIC               : TGUID = '{941C7AC0-C559-11D0-8A2B-00A0C9255AC1}';
  KSNODETYPE_PROLOGIC_ENCODER           : TGUID = '{8074C5B2-3C66-11D2-B45A-3078302C2030}';
  KSNODETYPE_PEAKMETER                  : TGUID = '{A085651E-5F0D-4b36-A869-D195D6AB4B9E}';
  KSNODETYPE_SURROUND_ENCODER           : TGUID = '{8074C5B2-3C66-11D2-B45A-3078302C2030}'; // = KSNODETYPE_PROLOGIC_ENCODER

  //===========================================================================
  // Topology Node Name GUIDs for common audio nodes

  KSAUDFNAME_BASS                       : TGUID = '{185FEDE0-9905-11D1-95A9-00C04FB925D3}';
  KSAUDFNAME_TREBLE                     : TGUID = '{185FEDE1-9905-11D1-95A9-00C04FB925D3}';
  KSAUDFNAME_MIDRANGE                   : TGUID = '{A2CBE478-AE84-49A1-8B72-4AD09B78ED34}';
  KSAUDFNAME_3D_STEREO                  : TGUID = '{185FEDE2-9905-11D1-95A9-00C04FB925D3}';
  KSAUDFNAME_MASTER_VOLUME              : TGUID = '{185FEDE3-9905-11D1-95A9-00C04FB925D3}';
  KSAUDFNAME_MASTER_MUTE                : TGUID = '{185FEDE4-9905-11D1-95A9-00C04FB925D3}';
  KSAUDFNAME_WAVE_VOLUME                : TGUID = '{185FEDE5-9905-11D1-95A9-00C04FB925D3}';
  KSAUDFNAME_WAVE_MUTE                  : TGUID = '{185FEDE6-9905-11D1-95A9-00C04FB925D3}';
  KSAUDFNAME_MIDI_VOLUME                : TGUID = '{185FEDE7-9905-11D1-95A9-00C04FB925D3}';
  KSAUDFNAME_MIDI_MUTE                  : TGUID = '{185FEDE8-9905-11D1-95A9-00C04FB925D3}';
  KSAUDFNAME_CD_VOLUME                  : TGUID = '{185FEDE9-9905-11D1-95A9-00C04FB925D3}';
  KSAUDFNAME_CD_MUTE                    : TGUID = '{185FEDEA-9905-11D1-95A9-00C04FB925D3}';
  KSAUDFNAME_LINE_VOLUME                : TGUID = '{185FEDEB-9905-11D1-95A9-00C04FB925D3}';
  KSAUDFNAME_LINE_MUTE                  : TGUID = '{185FEDEC-9905-11D1-95A9-00C04FB925D3}';
  KSAUDFNAME_MIC_VOLUME                 : TGUID = '{185FEDED-9905-11D1-95A9-00C04FB925D3}';
  KSAUDFNAME_MIC_MUTE                   : TGUID = '{185FEDEE-9905-11D1-95A9-00C04FB925D3}';
  KSAUDFNAME_RECORDING_SOURCE           : TGUID = '{185FEDEF-9905-11D1-95A9-00C04FB925D3}';
  KSAUDFNAME_PC_SPEAKER_VOLUME          : TGUID = '{185FEDF0-9905-11D1-95A9-00C04FB925D3}';
  KSAUDFNAME_PC_SPEAKER_MUTE            : TGUID = '{185FEDF1-9905-11D1-95A9-00C04FB925D3}';
  KSAUDFNAME_MIDI_IN_VOLUME             : TGUID = '{185FEDF2-9905-11D1-95A9-00C04FB925D3}';
  KSAUDFNAME_CD_IN_VOLUME               : TGUID = '{185FEDF3-9905-11D1-95A9-00C04FB925D3}';
  KSAUDFNAME_LINE_IN_VOLUME             : TGUID = '{185FEDF4-9905-11D1-95A9-00C04FB925D3}';
  KSAUDFNAME_MIC_IN_VOLUME              : TGUID = '{185FEDF5-9905-11D1-95A9-00C04FB925D3}';
  KSAUDFNAME_WAVE_IN_VOLUME             : TGUID = '{185FEDF6-9905-11D1-95A9-00C04FB925D3}';
  KSAUDFNAME_VOLUME_CONTROL             : TGUID = '{185FEDF7-9905-11D1-95A9-00C04FB925D3}';
  KSAUDFNAME_MIDI                       : TGUID = '{185FEDF8-9905-11D1-95A9-00C04FB925D3}';
  KSAUDFNAME_LINE_IN                    : TGUID = '{185FEDF9-9905-11D1-95A9-00C04FB925D3}';
  KSAUDFNAME_RECORDING_CONTROL          : TGUID = '{185FEDFA-9905-11D1-95A9-00C04FB925D3}';
  KSAUDFNAME_CD_AUDIO                   : TGUID = '{185FEDFB-9905-11D1-95A9-00C04FB925D3}';
  KSAUDFNAME_AUX_VOLUME                 : TGUID = '{185FEDFC-9905-11D1-95A9-00C04FB925D3}';
  KSAUDFNAME_AUX_MUTE                   : TGUID = '{185FEDFD-9905-11D1-95A9-00C04FB925D3}';
  KSAUDFNAME_AUX                        : TGUID = '{185FEDFE-9905-11D1-95A9-00C04FB925D3}';
  KSAUDFNAME_PC_SPEAKER                 : TGUID = '{185FEDFF-9905-11D1-95A9-00C04FB925D3}';
  KSAUDFNAME_WAVE_OUT_MIX               : TGUID = '{185FEE00-9905-11D1-95A9-00C04FB925D3}';
  KSAUDFNAME_MONO_OUT                   : TGUID = '{F9B41DC3-96E2-11d2-AC4C-00C04F8EFB68}';
  KSAUDFNAME_STEREO_MIX                 : TGUID = '{00DFF077-96E3-11d2-AC4C-00C04F8EFB68}';
  KSAUDFNAME_MONO_MIX                   : TGUID = '{00DFF078-96E3-11d2-AC4C-00C04F8EFB68}';
  KSAUDFNAME_MONO_OUT_VOLUME            : TGUID = '{1AD247EB-96E3-11d2-AC4C-00C04F8EFB68}';
  KSAUDFNAME_MONO_OUT_MUTE              : TGUID = '{1AD247EC-96E3-11d2-AC4C-00C04F8EFB68}';
  KSAUDFNAME_STEREO_MIX_VOLUME          : TGUID = '{1AD247ED-96E3-11d2-AC4C-00C04F8EFB68}';
  KSAUDFNAME_STEREO_MIX_MUTE            : TGUID = '{22B0EAFD-96E3-11d2-AC4C-00C04F8EFB68}';
  KSAUDFNAME_MONO_MIX_VOLUME            : TGUID = '{22B0EAFE-96E3-11d2-AC4C-00C04F8EFB68}';
  KSAUDFNAME_MONO_MIX_MUTE              : TGUID = '{2BC31D69-96E3-11d2-AC4C-00C04F8EFB68}';
  KSAUDFNAME_MICROPHONE_BOOST           : TGUID = '{2BC31D6A-96E3-11d2-AC4C-00C04F8EFB68}';
  KSAUDFNAME_ALTERNATE_MICROPHONE       : TGUID = '{2BC31D6B-96E3-11d2-AC4C-00C04F8EFB68}';
  KSAUDFNAME_3D_DEPTH                   : TGUID = '{63FF5747-991F-11d2-AC4D-00C04F8EFB68}';
  KSAUDFNAME_3D_CENTER                  : TGUID = '{9F0670B4-991F-11d2-AC4D-00C04F8EFB68}';
  KSAUDFNAME_VIDEO_VOLUME               : TGUID = '{9B46E708-992A-11d2-AC4D-00C04F8EFB68}';
  KSAUDFNAME_VIDEO_MUTE                 : TGUID = '{9B46E709-992A-11d2-AC4D-00C04F8EFB68}';
  KSAUDFNAME_VIDEO                      : TGUID = '{915DAEC4-A434-11d2-AC52-00C04F8EFB68}';
  KSAUDFNAME_PEAKMETER                  : TGUID = '{57E24340-FC5B-4612-A562-72B11A29DFAE}';


  // Internal topology node pin definitions

  KSNODEPIN_STANDARD_IN     = 1;
  KSNODEPIN_STANDARD_OUT    = 0;


  KSNODEPIN_SUM_MUX_IN      = 1; // can be >= 1
  KSNODEPIN_SUM_MUX_OUT     = 0;


  KSNODEPIN_DEMUX_IN        = 0;
  KSNODEPIN_DEMUX_OUT       = 1; // can be >= 1

  // < Win Vista
  KSNODEPIN_AEC_RENDER_IN   = 1;
  KSNODEPIN_AEC_RENDER_OUT  = 0;
  KSNODEPIN_AEC_CAPTURE_IN  = 2;
  KSNODEPIN_AEC_CAPTURE_OUT = 3;
  // END < Win Vista

  //===========================================================================
  //===========================================================================

  KSMETHODSETID_Wavetable : TGUID = '{DCEF31EB-D907-11D0-9583-00C04FB925D3}';


type

  PKSMETHOD_WAVETABLE = ^KSMETHOD_WAVETABLE;
  KSMETHOD_WAVETABLE = (
    KSMETHOD_WAVETABLE_WAVE_ALLOC,
    KSMETHOD_WAVETABLE_WAVE_FREE,
    KSMETHOD_WAVETABLE_WAVE_FIND,
    KSMETHOD_WAVETABLE_WAVE_WRITE
  );

  PKSWAVETABLE_WAVE_DESC = ^KSWAVETABLE_WAVE_DESC;
  KSWAVETABLE_WAVE_DESC = record
    Identifier : KSIDENTIFIER;  // wave identifier
    Size       : ULONG;         // wave size
    Looped     : BOOL;          // wave looped flag
    LoopPoint  : ULONG;         // wave loop point
    InROM      : BOOL;          // wave InROM flag
    Format     : KSDATAFORMAT;  // wave format
  end;


  //===========================================================================
  //===========================================================================

  //  Property sets and items

  //===========================================================================
  //===========================================================================

  // < Win Vista
  // Left out

  //===========================================================================
  //===========================================================================

  // < NTDDI_WS03
  // Left out

const

  KSPROPSETID_Wave : TGUID = '{924e54b0-630f-11cf-ada7-08003e30494a}';


type

  PKSPROPERTY_WAVE = ^KSPROPERTY_WAVE;
  KSPROPERTY_WAVE = (
    KSPROPERTY_WAVE_COMPATIBLE_CAPABILITIES,
    KSPROPERTY_WAVE_INPUT_CAPABILITIES,
    KSPROPERTY_WAVE_OUTPUT_CAPABILITIES,
    KSPROPERTY_WAVE_BUFFER,
    KSPROPERTY_WAVE_FREQUENCY,
    KSPROPERTY_WAVE_VOLUME,
    KSPROPERTY_WAVE_PAN
  );

  PKSWAVE_COMPATCAPS = ^KSWAVE_COMPATCAPS;
  KSWAVE_COMPATCAPS = record
    ulDeviceType : ULONG;
  end;


const

  KSWAVE_COMPATCAPS_INPUT  = $00000000;
  KSWAVE_COMPATCAPS_OUTPUT = $00000001;


type

  PKSWAVE_INPUT_CAPABILITIES = ^KSWAVE_INPUT_CAPABILITIES;
  KSWAVE_INPUT_CAPABILITIES = record
    MaximumChannelsPerConnection : ULONG;
    MinimumBitsPerSample         : ULONG;
    MaximumBitsPerSample         : ULONG;
    MinimumSampleFrequency       : ULONG;
    MaximumSampleFrequency       : ULONG;
    TotalConnections             : ULONG;
    ActiveConnections            : ULONG;
  end;

  PKSWAVE_OUTPUT_CAPABILITIES = ^KSWAVE_OUTPUT_CAPABILITIES;
  KSWAVE_OUTPUT_CAPABILITIES = record
    MaximumChannelsPerConnection      : ULONG;
    MinimumBitsPerSample              : ULONG;
    MaximumBitsPerSample              : ULONG;
    MinimumSampleFrequency            : ULONG;
    MaximumSampleFrequency            : ULONG;
    TotalConnections                  : ULONG;
    StaticConnections                 : ULONG;
    StreamingConnections              : ULONG;
    ActiveConnections                 : ULONG;
    ActiveStaticConnections           : ULONG;
    ActiveStreamingConnections        : ULONG;
    Total3DConnections                : ULONG;
    Static3DConnections               : ULONG;
    Streaming3DConnections            : ULONG;
    Active3DConnections               : ULONG;
    ActiveStatic3DConnections         : ULONG;
    ActiveStreaming3DConnections      : ULONG;
    TotalSampleMemory                 : ULONG;
    FreeSampleMemory                  : ULONG;
    LargestFreeContiguousSampleMemory : ULONG;
  end;

  PKSWAVE_VOLUME = ^KSWAVE_VOLUME;
  KSWAVE_VOLUME = record
    LeftAttenuation  : LONG;
    RightAttenuation : LONG;
  end;


const

  KSWAVE_BUFFER_ATTRIBUTEF_LOOPING = $00000001;
  KSWAVE_BUFFER_ATTRIBUTEF_STATIC  = $00000002;


type

  PKSWAVE_BUFFER = ^KSWAVE_BUFFER;
  KSWAVE_BUFFER = record
    Attributes    : ULONG;
    BufferSize    : ULONG;
    BufferAddress : Pointer;
  end;

  //===========================================================================
  //===========================================================================


const

 KSMUSIC_TECHNOLOGY_PORT      : TGUID = '{86C92E60-62E8-11CF-A5D6-28DB04C10000}';
 KSMUSIC_TECHNOLOGY_SQSYNTH   : TGUID = '{0ECF4380-62E9-11CF-A5D6-28DB04C10000}';
 KSMUSIC_TECHNOLOGY_FMSYNTH   : TGUID = '{252C5C80-62E9-11CF-A5D6-28DB04C10000}';
 KSMUSIC_TECHNOLOGY_WAVETABLE : TGUID = '{394EC7C0-62E9-11CF-A5D6-28DB04C10000}';
 KSMUSIC_TECHNOLOGY_SWSYNTH   : TGUID = '{37407736-3620-11D1-85D3-0000F8754380}';

 // < NTDDI_WS03
 // Left out

type

  PKSDATARANGE_MUSIC = ^KSDATARANGE_MUSIC;
  KSDATARANGE_MUSIC = record
    DataRange   : KSDATARANGE;
    Technology  : TGUID;
    Channels    : ULONG;
    Notes       : ULONG;
    ChannelMask : ULONG;
  end;

  //===========================================================================

  // < NTDDI_WS03
  // Left out


const
  KSPROPSETID_Cyclic : TGUID = '{3FFEAEA0-2BEE-11CF-A5D6-28DB04C10000}';


type

  PKSPROPERTY_CYCLIC = ^KSPROPERTY_CYCLIC;
  KSPROPERTY_CYCLIC = (
    KSPROPERTY_CYCLIC_POSITION
  );

  //===========================================================================

const

  KSEVENTSETID_AudioControlChange : TGUID = '{E85E9698-FA2F-11D1-95BD-00C04FB925D3}';


type

  PKSEVENT_AUDIO_CONTROL_CHANGE = ^KSEVENT_AUDIO_CONTROL_CHANGE;
  KSEVENT_AUDIO_CONTROL_CHANGE = (
    KSEVENT_CONTROL_CHANGE
  );

  //===========================================================================

const

  KSEVENTSETID_LoopedStreaming : TGUID = '{4682B940-C6EF-11D0-96D8-00AA0051E51D}';


type

  PKSEVENT_LOOPEDSTREAMING = ^KSEVENT_LOOPEDSTREAMING;
  KSEVENT_LOOPEDSTREAMING = (
    KSEVENT_LOOPEDSTREAMING_POSITION
  );

  PLOOPEDSTREAMING_POSITION_EVENT_DATA = ^LOOPEDSTREAMING_POSITION_EVENT_DATA;
  LOOPEDSTREAMING_POSITION_EVENT_DATA = record
    KsEventData : KSEVENTDATA;
    Position    : LONGLONG;
  end;


  // <= WINXP
  // Left out

  // < Win VISTA
  // Left out


  PKSNODEPROPERTY = ^KSNODEPROPERTY;
  KSNODEPROPERTY = record
    _Property: KSPROPERTY;
    NodeId: ULONG;
    Reserved: ULONG;
  end;

  PKSNODEPROPERTY_AUDIO_CHANNEL = ^KSNODEPROPERTY_AUDIO_CHANNEL;
  KSNODEPROPERTY_AUDIO_CHANNEL = record
    NodeProperty: KSNODEPROPERTY;
    Channel: LONG;                  // value to get or set
    Reserved: ULONG;
  end;

  PKSNODEPROPERTY_AUDIO_DEV_S = ^KSNODEPROPERTY_AUDIO_DEV_S;
  KSNODEPROPERTY_AUDIO_DEV_S = record
    NodeProperty: KSNODEPROPERTY;
    DevSpecificId: ULONG;
    DeviceInfo: ULONG;
    Length: ULONG;
  end;
  PKSNODEPROPERTY_AUDIO_DEV_SPECIFIC = ^KSNODEPROPERTY_AUDIO_DEV_SPECIFIC;
  KSNODEPROPERTY_AUDIO_DEV_SPECIFIC = KSNODEPROPERTY_AUDIO_DEV_S;

  PKSNODEPROPERTY_AUDIO_3D_LISTENER = ^KSNODEPROPERTY_AUDIO_3D_LISTENER;
  KSNODEPROPERTY_AUDIO_3D_LISTENER = record
    NodeProperty: KSNODEPROPERTY;
    ListenerId: Pointer;
{$ifndef WIN64}
    Reserved: ULONG;
{$endif} // _WIN64
  end;

  PKsnodepropertyAudioProperty = ^TKsnodepropertyAudioProperty;
  PKSNODEPROPERTY_AUDIO_PROPERTY = ^KSNODEPROPERTY_AUDIO_PROPERTY;
  KSNODEPROPERTY_AUDIO_PROPERTY = record
    NodeProperty: KSNODEPROPERTY;
    AppContext: Pointer;
    Length: ULONG;
{$ifndef WIN64}
    Reserved: ULONG;
{$endif} // _WIN64
  end;
  TKsnodepropertyAudioProperty = KSNODEPROPERTY_AUDIO_PROPERTY;

  // < NTDDI_WS03
  // Left out


  //
  // Midi definitions
  //
  //  Formats

const

  KSDATAFORMAT_TYPE_MUSIC       : TGUID = '{E725D360-62CC-11CF-A5D6-28DB04C10000}';
  // 'mids' == MEDIATYPE_Midi
  KSDATAFORMAT_TYPE_MIDI        : TGUID = '{7364696D-0000-0010-8000-00aa00389b71}';
  KSDATAFORMAT_SUBTYPE_MIDI     : TGUID = '{1D262760-E957-11CF-A5D6-28DB04C10000}';
  KSDATAFORMAT_SUBTYPE_MIDI_BUS : TGUID = '{2CA15FA0-6CFE-11CF-A5D6-28DB04C10000}';
  KSDATAFORMAT_SUBTYPE_RIFFMIDI : TGUID = '{4995DAF0-9EE6-11D0-A40E-00A0C9223196}';

  // if (NTDDI_VERSION >= NTDDI_WIN11_DT)
  KSDATAFORMAT_SUBTYPE_UNIVERSALMIDIPACKET  : TGUID = '{fbffd49e-ce26-464a-9dfc-fee42456c81c}';
  KSPROPSETID_MidiLoopedStreaming           : TGUID = '{1f306ba6-fd9b-427a-bcb3-27cbcf0e0f19}';

type
  PKSPROPERTY_MIDILOOPEDSTREAMING = ^KSPROPERTY_MIDILOOPEDSTREAMING;
  KSPROPERTY_MIDILOOPEDSTREAMING = (
    KSPROPERTY_MIDILOOPEDSTREAMING_BUFFER,
    KSPROPERTY_MIDILOOPEDSTREAMING_REGISTERS,
    KSPROPERTY_MIDILOOPEDSTREAMING_NOTIFICATION_EVENT
  );


  KSMIDILOOPED_BUFFER = record
    BufferAddress: Pointer;
    ActualBufferSize: ULONG;
  end;
  PKSMIDILOOPED_BUFFER = ^KSMIDILOOPED_BUFFER;


  KSMIDILOOPED_REGISTERS = record
    WritePosition: Pointer;
    ReadPosition: Pointer;
  end;
  PKSMIDILOOPED_REGISTERS = ^KSMIDILOOPED_REGISTERS;


  KSMIDILOOPED_EVENT = record
    WriteEvent: THandle;
  end;
  PKSMIDILOOPED_EVENT = ^KSMIDILOOPED_EVENT;

  { 10.0.28000.0  }
  KSMIDILOOPED_EVENT2 = record
    WriteEvent: THandle;
    ReadEvent: THandle;
  end;
  PKSMIDILOOPED_EVENT2 = ^KSMIDILOOPED_EVENT2;


  KSMIDILOOPED_BUFFER_PROPERTY = record
    _Property: KSPROPERTY;
    RequestedBufferSize: ULONG;
  end;
  PKSMIDILOOPED_BUFFER_PROPERTY = ^KSMIDILOOPED_BUFFER_PROPERTY;

  // Data format for KSDATAFORMAT_SUBTYPE_UNIVERSALMIDIPACKET
  UMPDATAFORMAT = record
    Position: LONGLONG;
    ByteCount: ULONG;
  end;
  PUMPDATAFORMAT = ^UMPDATAFORMAT;

  LOOPEDDATAFORMAT                    = UMPDATAFORMAT;
  PLOOPEDDATAFORMAT                   = PUMPDATAFORMAT;
  // endif //  (NTDDI_VERSION >= NTDDI_WIN11_DT)


  //  KSDATAFORMAT_SUBTYPE_DIRECTMUSIC
  //    see DMusicKS.h


  // WARNING! This structure MUST be dword aligned
  // regardless of the number of data bytes.

type

{$A4}

  PKSMUSICFORMAT = ^KSMUSICFORMAT;
  KSMUSICFORMAT = record
    TimeDeltaMs : ULONG;    // Delta Milliseconds from the previous midiformat
                            // in the packet. The first midiformat in the packet
                            // is a delta from the PTS in the KSSTREAM_HEADER.
    ByteCount   : ULONG;    // Number of bytes of data that follow this struct.
  end;

// back
{$IFDEF WIN32}
  {$ALIGN 1}
{$ELSE}
  {$PACKRECORDS C}
{$ENDIF}

  //
  // This entire set of MPEG Standard/Dialect Guids are obsolete. Do not use them.
  //
  //====================================================================================================
  //====================================================================================================
  // The following official MPEG Formats, Subtypes and Specifiers are listed as required or optional
  // These official MPEG GUIDs are the preferred method of supporting MPEG/AC-3 media types in new code.
  // Older MPEG GUIDs should also be supported for compatibilty, but these new modes are still required.
  //====================================================================================================
  //====================================================================================================

  {
  This is a summary of what media types/specifiers will be required for all DVD+DSS+DVB+DTV MPEG decoders.
  These media types are what the decoder driver must accept, hardware support for all of these media types
  may or may not actually be provided by the decoder natively.  These media types are intended to define
  the "officially" supported MPEG/AC-3 media types that all WHQL certified decoders must implement.  This
  specifically includes driver and/or hardware support for all the required standards and dialects.

  All MPEG video decoders must support all of the MPEG video modes shown as [required] below.
  All MPEG audio decoders must support all of the MPEG audio modes shown as [required] below.
  All AC-3 audio decoders must support all of the AC-3 audio modes shown as [required] below.
  The line items shown as [optional] need not be implemented, but are possible formats that might be implemented.

  Note that the input/output pin formats are defined by 2 or 3 GUIDs: TYPE, SUBTYPE, and maybe SPECIFIER.
  The specifiers are included if the data format is a "dialect" that needs to be differentiated during decoding.
  The decoder MUST be prepared to deal with ALL requests for _required_ "Standard" formats OR _required_ "Dialects".

  STATIC_KSDATAFORMAT_TYPE_STANDARD_ELEMENTARY_STREAM         [required]
    STATIC_KSDATAFORMAT_SUBTYPE_STANDARD_MPEG1_VIDEO            [required]
        STATIC_KSDATAFORMAT_SPECIFIER_DIALECT_MPEG1_VIDEO           [optional]
    STATIC_KSDATAFORMAT_SUBTYPE_STANDARD_MPEG1_AUDIO            [required]
        STATIC_KSDATAFORMAT_SPECIFIER_DIALECT_MPEG1_AUDIO           [optional]
    STATIC_KSDATAFORMAT_SUBTYPE_STANDARD_MPEG2_VIDEO            [required]
        STATIC_KSDATAFORMAT_SPECIFIER_DIALECT_MPEG2_VIDEO           [required]
    STATIC_KSDATAFORMAT_SUBTYPE_STANDARD_MPEG2_AUDIO            [required]
        STATIC_KSDATAFORMAT_SPECIFIER_DIALECT_MPEG2_AUDIO           [optional]
    STATIC_KSDATAFORMAT_SUBTYPE_STANDARD_AC3_AUDIO              [required]
        STATIC_KSDATAFORMAT_SPECIFIER_DIALECT_AC3_AUDIO             [optional]
  STATIC_KSDATAFORMAT_TYPE_STANDARD_PES_PACKET                [required]
    STATIC_KSDATAFORMAT_SUBTYPE_STANDARD_MPEG1_VIDEO            [optional]
        STATIC_KSDATAFORMAT_SPECIFIER_DIALECT_MPEG1_VIDEO           [optional]
    STATIC_KSDATAFORMAT_SUBTYPE_STANDARD_MPEG1_AUDIO            [optional]
        STATIC_KSDATAFORMAT_SPECIFIER_DIALECT_MPEG1_AUDIO           [optional]
    STATIC_KSDATAFORMAT_SUBTYPE_STANDARD_MPEG2_VIDEO            [required]
        STATIC_KSDATAFORMAT_SPECIFIER_DIALECT_MPEG2_VIDEO           [required]
    STATIC_KSDATAFORMAT_SUBTYPE_STANDARD_MPEG2_AUDIO            [required]
        STATIC_KSDATAFORMAT_SPECIFIER_DIALECT_MPEG2_AUDIO           [required]
    STATIC_KSDATAFORMAT_SUBTYPE_STANDARD_AC3_AUDIO              [required]
        STATIC_KSDATAFORMAT_SPECIFIER_DIALECT_AC3_AUDIO             [optional]
  STATIC_KSDATAFORMAT_TYPE_STANDARD_PACK_HEADER               [required]
    STATIC_KSDATAFORMAT_SUBTYPE_STANDARD_MPEG2_VIDEO            [required]
        STATIC_KSDATAFORMAT_SPECIFIER_DIALECT_MPEG2_VIDEO           [required]
    STATIC_KSDATAFORMAT_SUBTYPE_STANDARD_MPEG2_AUDIO            [required]
        STATIC_KSDATAFORMAT_SPECIFIER_DIALECT_MPEG2_AUDIO           [optional]
    STATIC_KSDATAFORMAT_SUBTYPE_STANDARD_AC3_AUDIO              [required]
        STATIC_KSDATAFORMAT_SPECIFIER_DIALECT_AC3_AUDIO             [optional]

  Note that the SPECIFIER GUIDs normally identify particular versions of MPEG such as DSS and DVD.
  This approach was taken to minimize the number of DSS/DVB/DVD/DTV etc. media SUBTYPES.
  These specifiers are currently required to disambiguate MPEG syntax _parsing_ by the decoder
  using alternate parsing routines or downloadable firmware or hardware decode settings.

  In the future these specifiers will be extended to cover new KS MPEG flavors such as DVB and DTV.
  Thus, the optional specifiers will be subject to clarification and/or definition as they are needed.

  Important note: Per the ITU MPEG specs, MPEG 2 media may contain pure MPEG 1 syntax and
  any "MPEG 2" PES packets may actually contain MPEG 1 payloads and MPEG 1 syntax.  Some MPEG
  broadcasts can revert from MPEG2 to MPEG1 format data at their discretion, without warning.

  CAUTION: Decoders MUST attempt to process MPEG data AS SOON AS POSSIBLE after reception.
  In particular, elementary MPEG or MPEG PES packet streams should not be aggregated into DVD
  "pack headers" internally before submission to the codec hardware if AT ALL POSSIBLE.  The
  reason is that mpeg data may need to be processed immediately but there may be no additional
  MPEG data forthcoming to fill up the PES packet OR DVD "pack" in a timely fashion.  This is
  particularly True of MPEG dialects that utilize "repeat field signally" to reuse the last
  decoded MPEG video field.
  }

  /////////////////////////////////////////////////////////////////////////
  // The major data type GUIDs that define the data packet encapsulation //
  /////////////////////////////////////////////////////////////////////////
  //
const

  // STATIC_KSDATAFORMAT_TYPE_STANDARD_ELEMENTARY_STREAM
  KSDATAFORMAT_TYPE_STANDARD_ELEMENTARY_STREAM  : TGUID = '{36523B11-8EE5-11d1-8CA3-0060B057664A}';
  // STATIC_KSDATAFORMAT_TYPE_STANDARD_PES_PACKET
  KSDATAFORMAT_TYPE_STANDARD_PES_PACKET         : TGUID = '{36523B12-8EE5-11d1-8CA3-0060B057664A}';
  // STATIC_KSDATAFORMAT_TYPE_STANDARD_PACK_HEADER
  KSDATAFORMAT_TYPE_STANDARD_PACK_HEADER        : TGUID = '{36523B13-8EE5-11d1-8CA3-0060B057664A}';


  ///////////////////////////////////////////////////////////////////////////////
  // The minor data subtype GUIDs that define the exact class of the data type.//
  ///////////////////////////////////////////////////////////////////////////////

  // STATIC_KSDATAFORMAT_SUBTYPE_STANDARD_MPEG1_VIDEO
  KSDATAFORMAT_SUBTYPE_STANDARD_MPEG1_VIDEO     : TGUID = '{36523B21-8EE5-11d1-8CA3-0060B057664A}';
  // STATIC_KSDATAFORMAT_SUBTYPE_STANDARD_MPEG1_AUDIO
  KSDATAFORMAT_SUBTYPE_STANDARD_MPEG1_AUDIO     : TGUID = '{36523B22-8EE5-11d1-8CA3-0060B057664A}';
  // STATIC_KSDATAFORMAT_SUBTYPE_STANDARD_MPEG2_VIDEO
  KSDATAFORMAT_SUBTYPE_STANDARD_MPEG2_VIDEO     : TGUID = '{36523B23-8EE5-11d1-8CA3-0060B057664A}';
  // STATIC_KSDATAFORMAT_SUBTYPE_STANDARD_MPEG2_AUDIO
  KSDATAFORMAT_SUBTYPE_STANDARD_MPEG2_AUDIO     : TGUID = '{36523B24-8EE5-11d1-8CA3-0060B057664A}';
  // STATIC_KSDATAFORMAT_SUBTYPE_STANDARD_AC3_AUDIO
  KSDATAFORMAT_SUBTYPE_STANDARD_AC3_AUDIO       : TGUID = '{36523B25-8EE5-11d1-8CA3-0060B057664A}';


  ///////////////////////////////////////////////////////////////////////////////
  // The low-level specifier GUIDs that define the flavor of the data subtype. //
  // Some SUBTYPES, notably MPEG2_VIDEO, MPEG2_AUDIO have different dialects.  //
  // These specifiers are intended to be accompanied by a specifier structure. //
  ///////////////////////////////////////////////////////////////////////////////

  // STATIC_KSDATAFORMAT_SPECIFIER_DIALECT_MPEG1_VIDEO
  KSDATAFORMAT_SPECIFIER_DIALECT_MPEG1_VIDEO    : TGUID = '{36523B31-8EE5-11d1-8CA3-0060B057664A}';
  // STATIC_KSDATAFORMAT_SPECIFIER_DIALECT_MPEG1_AUDIO
  KSDATAFORMAT_SPECIFIER_DIALECT_MPEG1_AUDIO    : TGUID = '{36523B32-8EE5-11d1-8CA3-0060B057664A}';
  // STATIC_KSDATAFORMAT_SPECIFIER_DIALECT_MPEG2_VIDEO    Associated with KS_MPEGVIDEOINFO2 defined later
  KSDATAFORMAT_SPECIFIER_DIALECT_MPEG2_VIDEO    : TGUID = '{36523B33-8EE5-11d1-8CA3-0060B057664A}';
  // STATIC_KSDATAFORMAT_SPECIFIER_DIALECT_MPEG2_AUDIO    Associated with KS_MPEGAUDIOINFO defined later
  KSDATAFORMAT_SPECIFIER_DIALECT_MPEG2_AUDIO    : TGUID = '{36523B34-8EE5-11d1-8CA3-0060B057664A}';
  // STATIC_KSDATAFORMAT_SPECIFIER_DIALECT_AC3_AUDIO
  KSDATAFORMAT_SPECIFIER_DIALECT_AC3_AUDIO      : TGUID = '{36523B35-8EE5-11d1-8CA3-0060B057664A}';


  //====================================================================================================
  //====================================================================================================
  //                              *** COMPATIBILITY WARNING ***
  // The *following* older DSS, MPEG, DVD & AC-3 GUID definitions are retained for backward compability.
  // These MPEG GUIDs should also be supported for compatibilty, but the above newer modes are still required.
  //====================================================================================================
  //====================================================================================================

  //
  // DSS definitions
  //

  KSDATAFORMAT_SUBTYPE_DSS_VIDEO : TGUID = '{a0af4f81-e163-11d0-bad9-00609744111a}';
  KSDATAFORMAT_SUBTYPE_DSS_AUDIO : TGUID = '{a0af4f82-e163-11d0-bad9-00609744111a}';

  //
  // End of obsolete MPEG definitions.
  //

  //
  // mpeg 1 definitions
  //
  KSDATAFORMAT_SUBTYPE_MPEG1Packet    : TGUID = '{e436eb80-524f-11ce-9F53-0020af0ba770}';
  KSDATAFORMAT_SUBTYPE_MPEG1Payload   : TGUID = '{e436eb81-524f-11ce-9F53-0020af0ba770}';

  // MEDIASUBTYPE_MPEG1Video
  KSDATAFORMAT_SUBTYPE_MPEG1Video     : TGUID = '{e436eb86-524f-11ce-9f53-0020af0ba770}';

  //FORMAT_MPEGVideo
  KSDATAFORMAT_SPECIFIER_MPEG1_VIDEO  : TGUID = '{05589f82-c356-11ce-bf01-00aa0055595a}';


  //
  // mpeg 2 definitions
  //

  KSDATAFORMAT_TYPE_MPEG2_PES        : TGUID = '{e06d8020-db46-11cf-b4d1-00805f6cbbea}';
  KSDATAFORMAT_TYPE_MPEG2_PROGRAM    : TGUID = '{e06d8022-db46-11cf-b4d1-00805f6cbbea}';
  KSDATAFORMAT_TYPE_MPEG2_TRANSPORT  : TGUID = '{e06d8023-db46-11cf-b4d1-00805f6cbbea}';
  KSDATAFORMAT_SUBTYPE_MPEG2_VIDEO   : TGUID = '{e06d8026-db46-11cf-b4d1-00805f6cbbea}';
  // use MPEGVIDEOINFO2 (defined below) with KSDATAFORMAT_SPECIFIER_MPEG2_VIDEO
  KSDATAFORMAT_SPECIFIER_MPEG2_VIDEO : TGUID = '{e06d80e3-db46-11cf-b4d1-00805f6cbbea}';

  //
  // Mpeg2 video properties
  //
  KSPROPSETID_Mpeg2Vid : TGUID = '{C8E11B60-0CC9-11D0-BD69-003505C103A9}';


type

  PKSPROPERTY_MPEG2VID = ^KSPROPERTY_MPEG2VID;
  KSPROPERTY_MPEG2VID = (
    KSPROPERTY_MPEG2VID_MODES,          // available output modes of decoder
    KSPROPERTY_MPEG2VID_CUR_MODE,       // current mode of the decoder
    KSPROPERTY_MPEG2VID_4_3_RECT,       // output coordinates for 4:3 source
    KSPROPERTY_MPEG2VID_16_9_RECT,      // output coordinates for 16:9 source
    KSPROPERTY_MPEG2VID_16_9_PANSCAN    // pan and scan vectors
  );

  //
  // bit field definitions for MPEG2 VIDEO mode
  //
const

  KSMPEGVIDMODE_PANSCAN = $0001;
  KSMPEGVIDMODE_LTRBOX  = $0002;
  KSMPEGVIDMODE_SCALE   = $0004;


  //
  // rectangle definitions for the 4/3 and 16/9 cropping properties of
  // the MPEG2Video decoder
  //

type

  PKSMPEGVID_RECT = ^KSMPEGVID_RECT;
  _KSMPEGVID_RECT = record
    StartX : ULONG;
    StartY : ULONG;
    EndX   : ULONG;
    EndY   : ULONG;
  end;
  KSMPEGVID_RECT = _KSMPEGVID_RECT;


  //
  // Params for pan / scan
  //


  //
  // MPEG2 Audio definition
  //

const

  KSDATAFORMAT_SUBTYPE_MPEG2_AUDIO   : TGUID = '{e06d802b-db46-11cf-b4d1-00805f6cbbea}';
  KSDATAFORMAT_SPECIFIER_MPEG2_AUDIO : TGUID = '{e06d80e5-db46-11cf-b4d1-00805f6cbbea}';


  //
  // DVD LPCM Audio definition
  //

  KSDATAFORMAT_SUBTYPE_LPCM_AUDIO    : TGUID = '{e06d8032-db46-11cf-b4d1-00805f6cbbea}';
  KSDATAFORMAT_SPECIFIER_LPCM_AUDIO  : TGUID = '{e06d80e6-db46-11cf-b4d1-00805f6cbbea}';


  //
  // AC-3 definition
  //

  KSDATAFORMAT_SUBTYPE_AC3_AUDIO     : TGUID = '{e06d802c-db46-11cf-b4d1-00805f6cbbea}';
  KSDATAFORMAT_SPECIFIER_AC3_AUDIO   : TGUID = '{e06d80e4-db46-11cf-b4d1-00805f6cbbea}';
  KSPROPSETID_AC3                    : TGUID = '{BFABE720-6E1F-11D0-BCF2-444553540000}';


type

  PKSPROPERTY_AC3 = ^KSPROPERTY_AC3;
  KSPROPERTY_AC3 = (
    KSPROPERTY_AC3_Invalid,
    KSPROPERTY_AC3_ERROR_CONCEALMENT,
    KSPROPERTY_AC3_ALTERNATE_AUDIO,
    KSPROPERTY_AC3_DOWNMIX,
    KSPROPERTY_AC3_BIT_STREAM_MODE,
    KSPROPERTY_AC3_DIALOGUE_LEVEL,
    KSPROPERTY_AC3_LANGUAGE_CODE,
    KSPROPERTY_AC3_ROOM_TYPE
  );

  PKSAC3_ERROR_CONCEALMENT = ^KSAC3_ERROR_CONCEALMENT;
  KSAC3_ERROR_CONCEALMENT = record
    fRepeatPreviousBlock : BOOL;
    fErrorInCurrentBlock : BOOL;
  end;

  PKSAC3_ALTERNATE_AUDIO = ^KSAC3_ALTERNATE_AUDIO;
  KSAC3_ALTERNATE_AUDIO = record
    fStereo  : BOOL;
    DualMode : ULONG;
  end;


const

  KSAC3_ALTERNATE_AUDIO_1    = 1;
  KSAC3_ALTERNATE_AUDIO_2    = 2;
  KSAC3_ALTERNATE_AUDIO_BOTH = 3;


type

  PKSAC3_DOWNMIX = ^KSAC3_DOWNMIX;
  KSAC3_DOWNMIX = record
    fDownMix       : BOOL;
    fDolbySurround : BOOL;
  end;

  PKSAC3_BIT_STREAM_MODE = ^KSAC3_BIT_STREAM_MODE;
  KSAC3_BIT_STREAM_MODE = record
    BitStreamMode : LONG;
  end;


const

  KSAC3_SERVICE_MAIN_AUDIO        = 0;
  KSAC3_SERVICE_NO_DIALOG         = 1;
  KSAC3_SERVICE_VISUALLY_IMPAIRED = 2;
  KSAC3_SERVICE_HEARING_IMPAIRED  = 3;
  KSAC3_SERVICE_DIALOG_ONLY       = 4;
  KSAC3_SERVICE_COMMENTARY        = 5;
  KSAC3_SERVICE_EMERGENCY_FLASH   = 6;
  KSAC3_SERVICE_VOICE_OVER        = 7;


type

  PKSAC3_DIALOGUE_LEVEL = ^KSAC3_DIALOGUE_LEVEL;
  KSAC3_DIALOGUE_LEVEL = record
    DialogueLevel : ULONG;
  end;

  PKSAC3_ROOM_TYPE = ^KSAC3_ROOM_TYPE;
  KSAC3_ROOM_TYPE = record
    fLargeRoom : BOOL;
  end;


const
  // New formats enabled by CEA 861 specifciation
  KSDATAFORMAT_SUBTYPE_IEC61937_DOLBY_DIGITAL : TGUID = '{00000092-0000-0010-8000-00aa00389b71}';
  KSDATAFORMAT_SUBTYPE_IEC61937_WMA_PRO       : TGUID = '{00000164-0000-0010-8000-00aa00389b71}';
  KSDATAFORMAT_SUBTYPE_IEC61937_DTS           : TGUID = '{00000008-0000-0010-8000-00aa00389b71}';
  KSDATAFORMAT_SUBTYPE_IEC61937_MPEG1         : TGUID = '{00000003-0cea-0010-8000-00aa00389b71}';
  KSDATAFORMAT_SUBTYPE_IEC61937_MPEG2         : TGUID = '{00000004-0cea-0010-8000-00aa00389b71}';
  KSDATAFORMAT_SUBTYPE_IEC61937_MPEG3         : TGUID = '{00000005-0cea-0010-8000-00aa00389b71}';
  KSDATAFORMAT_SUBTYPE_IEC61937_AAC           : TGUID = '{00000006-0cea-0010-8000-00aa00389b71}';
  KSDATAFORMAT_SUBTYPE_IEC61937_ATRAC         : TGUID = '{00000008-0cea-0010-8000-00aa00389b71}';
  KSDATAFORMAT_SUBTYPE_IEC61937_ONE_BIT_AUDIO : TGUID = '{00000009-0cea-0010-8000-00aa00389b71}';
  KSDATAFORMAT_SUBTYPE_IEC61937_DOLBY_DIGITAL_PLUS       : TGUID = '{0000000a-0cea-0010-8000-00aa00389b71}';
  KSDATAFORMAT_SUBTYPE_IEC61937_DOLBY_DIGITAL_PLUS_ATMOS : TGUID = '{0000010a-0cea-0010-8000-00aa00389b71}';
  KSDATAFORMAT_SUBTYPE_IEC61937_DTS_HD        : TGUID = '{0000000b-0cea-0010-8000-00aa00389b71}';
  KSDATAFORMAT_SUBTYPE_IEC61937_DTSX_E1       : TGUID = '{0000010b-0cea-0010-8000-00aa00389b71}';
  KSDATAFORMAT_SUBTYPE_IEC61937_DTSX_E2       : TGUID = '{0000030b-0cea-0010-8000-00aa00389b71}';
  KSDATAFORMAT_SUBTYPE_IEC61937_DOLBY_MLP     : TGUID = '{0000000c-0cea-0010-8000-00aa00389b71}';
  KSDATAFORMAT_SUBTYPE_IEC61937_DOLBY_MAT20   : TGUID = '{0000010c-0cea-0010-8000-00aa00389b71}';
  KSDATAFORMAT_SUBTYPE_IEC61937_DOLBY_MAT21   : TGUID = '{0000030c-0cea-0010-8000-00aa00389b71}';
  KSDATAFORMAT_SUBTYPE_IEC61937_DOLBY_MAT21_PROFILE4 : TGUID = '{0000070c-0cea-0010-8000-00aa00389b71}';
  KSDATAFORMAT_SUBTYPE_IEC61937_DST             : TGUID = '{0000000d-0cea-0010-8000-00aa00389b71}';

  KSDATAFORMAT_SUBTYPE_IEC61937_MPEGH_LEVEL1_LC : TGUID = '{000110bf-0cea-0010-8000-00aa00389b71}';
  KSDATAFORMAT_SUBTYPE_IEC61937_MPEGH_LEVEL2_LC : TGUID = '{000120bf-0cea-0010-8000-00aa00389b71}';
  KSDATAFORMAT_SUBTYPE_IEC61937_MPEGH_LEVEL3_LC : TGUID = '{000130bf-0cea-0010-8000-00aa00389b71}';
  KSDATAFORMAT_SUBTYPE_IEC61937_MPEGH_LEVEL4_LC : TGUID = '{000140bf-0cea-0010-8000-00aa00389b71}';
  KSDATAFORMAT_SUBTYPE_IEC61937_MPEGH_LEVEL5_LC : TGUID = '{000150bf-0cea-0010-8000-00aa00389b71}';
  KSDATAFORMAT_SUBTYPE_IEC61937_MPEGH_LEVEL1_BL : TGUID = '{000210bf-0cea-0010-8000-00aa00389b71}';
  KSDATAFORMAT_SUBTYPE_IEC61937_MPEGH_LEVEL2_BL : TGUID = '{000220bf-0cea-0010-8000-00aa00389b71}';
  KSDATAFORMAT_SUBTYPE_IEC61937_MPEGH_LEVEL3_BL : TGUID = '{000230bf-0cea-0010-8000-00aa00389b71}';
  KSDATAFORMAT_SUBTYPE_IEC61937_MPEGH_LEVEL4_BL : TGUID = '{000240bf-0cea-0010-8000-00aa00389b71}';
  KSDATAFORMAT_SUBTYPE_IEC61937_MPEGH_LEVEL5_BL : TGUID = '{000250bf-0cea-0010-8000-00aa00389b71}';

  // MP3
  KSDATAFORMAT_SUBTYPE_MPEGLAYER3 : TGUID = '{00000055-0000-0010-8000-00aa00389b71}';
  // AAC
  KSDATAFORMAT_SUBTYPE_MPEG_HEAAC : TGUID = '{00001610-0000-0010-8000-00aa00389b71}';
  // WMA STD
  KSDATAFORMAT_SUBTYPE_WMAUDIO2   : TGUID = '{00000161-0000-0010-8000-00aa00389b71}';
  // WMA PRO
  KSDATAFORMAT_SUBTYPE_WMAUDIO3   : TGUID = '{00000162-0000-0010-8000-00aa00389b71}';
  // WMA LOSSLESS
  KSDATAFORMAT_SUBTYPE_WMAUDIO_LOSSLESS  : TGUID = '{00000163-0000-0010-8000-00aa00389b71}';


  //
  // DTS and SDDS definitions (media subtype GUIDs)
  //

const

  KSDATAFORMAT_SUBTYPE_DTS_AUDIO  : TGUID = '{e06d8033-db46-11cf-b4d1-00805f6cbbea}';
  KSDATAFORMAT_SUBTYPE_SDDS_AUDIO : TGUID = '{e06d8034-db46-11cf-b4d1-00805f6cbbea}';


  //
  // audio decoder output properties
  //

  KSPROPSETID_AudioDecoderOut     : TGUID = '{6ca6e020-43bd-11d0-bd6a-003505c103a9}';


type

  PKSPROPERTY_AUDDECOUT = ^KSPROPERTY_AUDDECOUT;
  KSPROPERTY_AUDDECOUT = (
    KSPROPERTY_AUDDECOUT_MODES,        // available output modes of decoder
    KSPROPERTY_AUDDECOUT_CUR_MODE      // current mode of the decoder
  );

const

  KSAUDDECOUTMODE_STEREO_ANALOG = $0001;
  KSAUDDECOUTMODE_PCM_51        = $0002;
  KSAUDDECOUTMODE_SPDIFF        = $0004;


  //
  // subpicture definition
  //

  KSDATAFORMAT_SUBTYPE_SUBPICTURE : TGUID = '{e06d802d-db46-11cf-b4d1-00805f6cbbea}';
  KSPROPSETID_DvdSubPic           : TGUID = '{ac390460-43af-11d0-bd6a-003505c103a9}';


type

  PKSPROPERTY_DVDSUBPIC = ^KSPROPERTY_DVDSUBPIC;
  KSPROPERTY_DVDSUBPIC = (
    KSPROPERTY_DVDSUBPIC_PALETTE,
    KSPROPERTY_DVDSUBPIC_HLI,
    KSPROPERTY_DVDSUBPIC_COMPOSIT_ON  // TRUE for subpicture is displayed
  );


  PKS_DVD_YCrCb = ^KS_DVD_YCrCb;
  _KS_DVD_YCrCb = record
    Reserved : UCHAR;
    Y        : UCHAR;
    Cr       : UCHAR;
    Cb       : UCHAR;
  end;
  KS_DVD_YCrCb = _KS_DVD_YCrCb;


  // The KS_DVD_YUV structure is now superseded by KS_DVD_YCrCb above and is
  // here for backward compatibility only

  PKS_DVD_YUV = ^KS_DVD_YUV;
  _KS_DVD_YUV = record
    Reserved : UCHAR;
    Y        : UCHAR;
    V        : UCHAR;
    U        : UCHAR;
  end;
  KS_DVD_YUV = _KS_DVD_YUV;

  PKSPROPERTY_SPPAL = ^KSPROPERTY_SPPAL;
  _KSPROPERTY_SPPAL = record
    sppal : array[0..15] of KS_DVD_YUV;
  end;
  KSPROPERTY_SPPAL = _KSPROPERTY_SPPAL;


PKS_COLCON = ^KS_COLCON;
  _KS_COLCON = record
    private
      FData: array[0..3] of UCHAR;
      function GetNibble(Index: Integer): UCHAR;
      procedure SetNibble(Index: Integer;Value: UCHAR);
    public
      property emph1col: UCHAR index 0 read GetNibble write SetNibble;
      property emph2col: UCHAR index 1 read GetNibble write SetNibble;
      property backcol: UCHAR index 2 read GetNibble write SetNibble;
      property patcol: UCHAR index 3 read GetNibble write SetNibble;
      property emph1con: UCHAR index 4 read GetNibble write SetNibble;
      property emph2con: UCHAR index 5 read GetNibble write SetNibble;
      property backcon: UCHAR index 6 read GetNibble write SetNibble;
      property patcon: UCHAR index 7 read GetNibble write SetNibble;
  end;
  KS_COLCON = _KS_COLCON;

  PKSPROPERTY_SPHLI = ^KSPROPERTY_SPHLI;
  _KSPROPERTY_SPHLI = record
    HLISS    : WORD;
    Reserved : WORD;
    StartPTM : ULONG;      // start presentation time in x/90000
    EndPTM   : ULONG;      // end PTM in x/90000
    StartX   : WORD;
    StartY   : WORD;
    StopX    : WORD;
    StopY    : WORD;
    ColCon: KS_COLCON; // color contrast description (4 bytes as given in HLI)
  end;
  KSPROPERTY_SPHLI = _KSPROPERTY_SPHLI;

{$PACKRECORDS C}

  PKSPROPERTY_COMPOSIT_ON = ^KSPROPERTY_COMPOSIT_ON;
  KSPROPERTY_COMPOSIT_ON = {$IFDEF TYPE_IDENTITY}type {$ENDIF} BOOL;


const

  KSPROPSETID_CopyProt : TGUID = '{0E8A0A40-6AEF-11D0-9ED0-00A024CA19B3}';


type

  PKSPROPERTY_COPYPROT = ^KSPROPERTY_COPYPROT;
  KSPROPERTY_COPYPROT = (
    KSPROPERTY_DVDCOPY_CHLG_KEY       = $01,
    KSPROPERTY_DVDCOPY_DVD_KEY1       = $02,
    KSPROPERTY_DVDCOPY_DEC_KEY2       = $03,
    KSPROPERTY_DVDCOPY_TITLE_KEY      = $04,
    KSPROPERTY_COPY_MACROVISION       = $05,
    KSPROPERTY_DVDCOPY_REGION         = $06,
    KSPROPERTY_DVDCOPY_SET_COPY_STATE = $07,
    KSPROPERTY_DVDCOPY_DISC_KEY       = $80
  );

  PKS_DVDCOPY_CHLGKEY = ^KS_DVDCOPY_CHLGKEY;
  _KS_DVDCOPY_CHLGKEY = record
   ChlgKey   : array[0..9] of BYTE;
   Reserved  : array[0..1] of BYTE;
  end;
  KS_DVDCOPY_CHLGKEY = _KS_DVDCOPY_CHLGKEY;

  PKS_DVDCOPY_BUSKEY = ^KS_DVDCOPY_BUSKEY;
  _KS_DVDCOPY_BUSKEY = record
    BusKey   : array[0..4] of BYTE;
    Reserved: array[0..0] of BYTE;
  end;
  KS_DVDCOPY_BUSKEY = _KS_DVDCOPY_BUSKEY;

  PKS_DVDCOPY_DISCKEY = ^KS_DVDCOPY_DISCKEY;
  _KS_DVDCOPY_DISCKEY = record
    DiscKey : array[0..2047] of BYTE;
  end;
  KS_DVDCOPY_DISCKEY = _KS_DVDCOPY_DISCKEY;

  PKS_DVDCOPY_REGION = ^KS_DVDCOPY_REGION;
  _KS_DVDCOPY_REGION = record
    Reserved   : UCHAR;
    RegionData : UCHAR;
    Reserved2  : array[0..1] of UCHAR;
  end;
  KS_DVDCOPY_REGION = _KS_DVDCOPY_REGION;

  PKS_DVDCOPY_TITLEKEY = ^KS_DVDCOPY_TITLEKEY;
  _KS_DVDCOPY_TITLEKEY = record
    KeyFlags   : ULONG;
    ReservedNT : array[0..1] of ULONG;
    TitleKey   : array[0..5] of UCHAR;
    Reserved   : array[0..1] of UCHAR;
  end;
  KS_DVDCOPY_TITLEKEY = _KS_DVDCOPY_TITLEKEY;

  PKS_COPY_MACROVISION = ^KS_COPY_MACROVISION;
  _KS_COPY_MACROVISION = record
    MACROVISIONLevel : ULONG;
  end;
  KS_COPY_MACROVISION = _KS_COPY_MACROVISION;

  PKS_DVDCOPY_SET_COPY_STATE = ^KS_DVDCOPY_SET_COPY_STATE;
  _KS_DVDCOPY_SET_COPY_STATE = record
    DVDCopyState : ULONG;
  end;
  KS_DVDCOPY_SET_COPY_STATE = _KS_DVDCOPY_SET_COPY_STATE;

  PKS_DVDCOPYSTATE = ^KS_DVDCOPYSTATE;
  KS_DVDCOPYSTATE = (
    KS_DVDCOPYSTATE_INITIALIZE,         // indicates we are starting a full
                                        // copy protection sequence.
    KS_DVDCOPYSTATE_INITIALIZE_TITLE,   // indicates we are starting a title
                                        // key copy protection sequence
    KS_DVDCOPYSTATE_AUTHENTICATION_NOT_REQUIRED,
    KS_DVDCOPYSTATE_AUTHENTICATION_REQUIRED,
    KS_DVDCOPYSTATE_DONE
  );

  PKS_COPY_MACROVISION_LEVEL = ^KS_COPY_MACROVISION_LEVEL;
  KS_COPY_MACROVISION_LEVEL = (
    KS_MACROVISION_DISABLED,
    KS_MACROVISION_LEVEL1,
    KS_MACROVISION_LEVEL2,
    KS_MACROVISION_LEVEL3
  );


  //
  // CGMS Copy Protection Flags
  //
const
  KS_DVD_CGMS_RESERVED_MASK     = $00000078;
  KS_DVD_CGMS_COPY_PROTECT_MASK = $00000018;
  KS_DVD_CGMS_COPY_PERMITTED    = $00000000;
  KS_DVD_CGMS_COPY_ONCE         = $00000010;
  KS_DVD_CGMS_NO_COPY           = $00000018;

  KS_DVD_COPYRIGHT_MASK         = $00000040;
  KS_DVD_NOT_COPYRIGHTED        = $00000000;
  KS_DVD_COPYRIGHTED            = $00000040;

  KS_DVD_SECTOR_PROTECT_MASK    = $00000020;
  KS_DVD_SECTOR_NOT_PROTECTED   = $00000000;
  KS_DVD_SECTOR_PROTECTED       = $00000020;


  //===========================================================================
  // The following MUST match the structures in WinGDI.h and AMVideo.h
  //===========================================================================

  KSCATEGORY_TVTUNER                 : TGUID = '{a799a800-a46d-11d0-a18c-00a02401dcd4}';
  KSCATEGORY_CROSSBAR                : TGUID = '{a799a801-a46d-11d0-a18c-00a02401dcd4}';
  KSCATEGORY_TVAUDIO                 : TGUID = '{a799a802-a46d-11d0-a18c-00a02401dcd4}';
  KSCATEGORY_VPMUX                   : TGUID = '{a799a803-a46d-11d0-a18c-00a02401dcd4}';
  KSCATEGORY_VBICODEC                : TGUID = '{07dad660-22f1-11d1-a9f4-00c04fbbde8f}';

  // SUBTYPE_VPVideo
  KSDATAFORMAT_SUBTYPE_VPVideo       : TGUID = '{5a9b6a40-1a22-11d1-bad9-00609744111a}';
  // SUBTYPE_VPVBI
  KSDATAFORMAT_SUBTYPE_VPVBI         : TGUID = '{5a9b6a41-1a22-11d1-bad9-00609744111a}';
  // FORMAT_VideoInfo
  KSDATAFORMAT_SPECIFIER_VIDEOINFO   : TGUID = '{05589f80-c356-11ce-bf01-00aa0055595a}';
  // FORMAT_VideoInfo2
  KSDATAFORMAT_SPECIFIER_VIDEOINFO2  : TGUID = '{f72a76A0-eb0a-11d0-ace4-0000c0cc16ba}';
  // FORMAT_UVCH264Video
  KSDATAFORMAT_SPECIFIER_H264_VIDEO  : TGUID = '{2017be05-6629-4248-aaed-7e1a47bc9b9c}';
  // FORMAT_JPEGImage
  KSDATAFORMAT_SPECIFIER_JPEG_IMAGE  : TGUID = '{692fa379-d3e8-4651-b5b4-0b94b013eeaf}';
  // FORMAT_Image
  KSDATAFORMAT_SPECIFIER_IMAGE       : TGUID = '{692fa379-d3e8-4651-b5b4-0b94b013eeaf}';
  // MEDIATYPE_Image: same as MFMEDIATYPE_Image
  KSDATAFORMAT_TYPE_IMAGE            : TGUID = '{72178c23-e45b-11d5-bc2a-00b0d0f3f4ab}';
  // SUBTYPE_JPEG: same as WIC container format JPEG
  KSDATAFORMAT_SUBTYPE_JPEG          : TGUID = '{19e4a5aa-5662-4fc5-a0c0-1758028e1057}';
  // SUBTYPE_IMAGE_RGB32: same as MFVideoFormat_RGB32
  KSDATAFORMAT_SUBTYPE_IMAGE_RGB32   : TGUID = '{00000016-0000-0010-8000-00aa00389b71}';

//#if (NTDDI_VERSION >= NTDDI_WIN10)

  // KSDATAFORMAT_SUBTYPE_L8:
  KSDATAFORMAT_SUBTYPE_L8             : TGUID = '{00000032-0000-0010-8000-00aa00389b71}';
  // KSDATAFORMAT_SUBTYPE_L8_IR:
  KSDATAFORMAT_SUBTYPE_L8_IR          : TGUID = '{00000032-0002-0010-8000-00aa00389b71}';
  // KSDATAFORMAT_SUBTYPE_L8_CUSTOM:
  KSDATAFORMAT_SUBTYPE_L8_CUSTOM      : TGUID = '{00000032-8000-0010-8000-00aa00389b71}';
  // KSDATAFORMAT_SUBTYPE_L16:
  KSDATAFORMAT_SUBTYPE_L16            : TGUID = '{00000051-0000-0010-8000-00aa00389b71}';
  // KSDATAFORMAT_SUBTYPE_L16_IR:
  KSDATAFORMAT_SUBTYPE_L16_IR         : TGUID = '{00000051-0002-0010-8000-00aa00389b71}';
  // KSDATAFORMAT_SUBTYPE_D16:
  KSDATAFORMAT_SUBTYPE_D16            : TGUID = '{00000050-0004-0010-8000-00aa00389b71}';
  // KSDATAFORMAT_SUBTYPE_L16_CUSTOM:
  KSDATAFORMAT_SUBTYPE_L16_CUSTOM     : TGUID = '{00000051-8000-0010-8000-00aa00389b71}';
  // KSDATAFORMAT_SUBTYPE_MJPG_IR:
  KSDATAFORMAT_SUBTYPE_MJPG_IR        : TGUID = '{47504a4d-0002-0010-8000-00aa00389b71}';
  // KSDATAFORMAT_SUBTYPE_MJPG_DEPTH:
  KSDATAFORMAT_SUBTYPE_MJPG_DEPTH     : TGUID = '{47504a4d-0004-0010-8000-00aa00389b71}';
  // KSDATAFORMAT_SUBTYPE_MJPG_CUSTOM:
  KSDATAFORMAT_SUBTYPE_MJPG_CUSTOM    : TGUID = '{47504a4d-8000-0010-8000-00aa00389b71}';

//#endif //(NTDDI_VERSION >= NTDDI_WIN10)


  // MEDIATYPE_AnalogVideo
  KSDATAFORMAT_TYPE_ANALOGVIDEO      : TGUID = '{0482dde1-7817-11cf-8a03-00aa006ecb65}';
  // FORMAT_AnalogVideo
  KSDATAFORMAT_SPECIFIER_ANALOGVIDEO : TGUID = '{0482dde0-7817-11cf-8a03-00aa006ecb65}';
  // FORMAT_VBI
  KSDATAFORMAT_SPECIFIER_VBI         : TGUID = '{f72a76e0-eb0a-11d0-ace4-0000c0cc16ba}';
  // MEDIATYPE_VBI
  KSDATAFORMAT_TYPE_VBI              : TGUID = '{f72a76e1-eb0a-11d0-ace4-0000c0cc16ba}';
  // SUBTYPE_RAW8
  KSDATAFORMAT_SUBTYPE_RAW8          : TGUID = '{ca20d9a0-3e3e-11d1-9bf9-00c04fbbdebf}';
  // MEDIASUBTYPE_CC
  KSDATAFORMAT_SUBTYPE_CC            : TGUID = '{33214CC1-011F-11D2-B4B1-00A0D102CFBE}';
  // MEDIASUBTYPE_NABTS
  KSDATAFORMAT_SUBTYPE_NABTS         : TGUID = '{f72a76e2-eb0a-11d0-ace4-0000c0cc16ba}';
  // MEDIASUBTYPE_TELETEXT
  KSDATAFORMAT_SUBTYPE_TELETEXT      : TGUID = '{f72a76e3-eb0a-11d0-ace4-0000c0cc16ba}';


  // constants for the biCompression field
  KS_BI_RGB       = 0;
  KS_BI_RLE8      = 1;
  KS_BI_RLE4      = 2;
  KS_BI_BITFIELDS = 3;


type

  PKS_RGBQUAD = ^KS_RGBQUAD;
  tagKS_RGBQUAD = record // rgbq
    rgbBlue     : BYTE;
    rgbGreen    : BYTE;
    rgbRed      : BYTE;
    rgbReserved : BYTE;
  end;
  KS_RGBQUAD = tagKS_RGBQUAD;



const
  // constants for palettes
  KS_iPALETTE_COLORS  = 256; // Maximum colours in palette
  KS_iEGA_COLORS      = 16;  // Number colours in EGA palette
  KS_iMASK_COLORS     = 3;   // Maximum three components
  KS_iTRUECOLOR       = 16;  // Minimum True colour device
  KS_iRED             = 0;   // Index position for RED mask
  KS_iGREEN           = 1;   // Index position for GREEN mask
  KS_iBLUE            = 2;   // Index position for BLUE mask
  KS_iPALETTE         = 8;   // Maximum colour depth using a palette
  KS_iMAXBITS         = 8;   // Maximum bits per colour component
  KS_SIZE_EGA_PALETTE = (KS_iEGA_COLORS * sizeof(KS_RGBQUAD));
  KS_SIZE_PALETTE     = (KS_iPALETTE_COLORS * sizeof(KS_RGBQUAD));


type

  PKS_BITMAPINFOHEADER = ^KS_BITMAPINFOHEADER;
  tagKS_BITMAPINFOHEADER = record
    biSize          : DWORD;
    biWidth         : LONG;
    biHeight        : LONG;
    biPlanes        : WORD;
    biBitCount      : WORD;
    biCompression   : DWORD;
    biSizeImage     : DWORD;
    biXPelsPerMeter : LONG;
    biYPelsPerMeter : LONG;
    biClrUsed       : DWORD;
    biClrImportant  : DWORD;
  end;
  KS_BITMAPINFOHEADER = tagKS_BITMAPINFOHEADER;

  // Used for True colour images that also have a palette
  PKS_TRUECOLORINFO = ^KS_TRUECOLORINFO;
  tag_KS_TRUECOLORINFO = record
    dwBitMasks : array[0..KS_iMASK_COLORS - 1] of DWORD;
    bmiColors  : array[0..KS_iPALETTE_COLORS - 1] of KS_RGBQUAD;
  end;
  KS_TRUECOLORINFO = tag_KS_TRUECOLORINFO;


  // The BITMAPINFOHEADER contains all the details about the video stream such
  // as the actual image dimensions and their pixel depth. A source filter may
  // also request that the sink take only a section of the video by providing a
  // clipping rectangle in rcSource. In the worst case where the sink filter
  // forgets to check this on connection it will simply render the whole thing
  // which isn't a disaster. Ideally a sink filter will check the rcSource and
  // if it doesn't support image extraction and the rectangle is not empty then
  // it will reject the connection. A filter should use SetRectEmpty to reset a
  // rectangle to all zeroes (and IsRectEmpty to later check the rectangle).
  // The rcTarget specifies the destination rectangle for the video, for most
  // source filters they will set this to all zeroes, a downstream filter may
  // request that the video be placed in a particular area of the buffers it
  // supplies in which case it will call QueryAccept with a non empty target

  PKS_VIDEOINFOHEADER = ^KS_VIDEOINFOHEADER;
  tagKS_VIDEOINFOHEADER = record
    rcSource        : TRECT;               // The bit we really want to use
    rcTarget        : TRECT;               // Where the video should go
    dwBitRate       : DWORD;               // Approximate bit data rate
    dwBitErrorRate  : DWORD;               // Bit error rate for this stream
    AvgTimePerFrame : LONGLONG;            // Average time per frame (100ns units)
    bmiHeader       : KS_BITMAPINFOHEADER;
  end;
  KS_VIDEOINFOHEADER = tagKS_VIDEOINFOHEADER;


  // !!! WARNING !!!
  // DO NOT use the following structure unless you are sure that the BITMAPINFOHEADER
  // has a normal biSize = sizeof(BITMAPINFOHEADER) !
  // !!! WARNING !!!

  PKS_VIDEOINFO = ^tagKS_VIDEOINFO;
  tagKS_VIDEOINFO = record
    rcSource        : TRECT;                // The bit we really want to use
    rcTarget        : TRECT;                // Where the video should go
    dwBitRate       : DWORD;                // Approximate bit data rate
    dwBitErrorRate  : DWORD;                // Bit error rate for this stream
    AvgTimePerFrame : LONGLONG;             // Average time per frame (100ns units)
    bmiHeader       : KS_BITMAPINFOHEADER;
    case integer of
      0: (bmiColors : array[0..KS_iPALETTE_COLORS - 1] of KS_RGBQUAD); // Colour palette
      1: (dwBitMasks : array[0..KS_iMASK_COLORS - 1] of DWORD);        // True colour masks
      2: (TrueColorInfo : KS_TRUECOLORINFO);                           // Both of the above
  end;
  KS_VIDEOINFO = tagKS_VIDEOINFO;


const

  KS_SIZE_MASKS = (KS_iMASK_COLORS * sizeof(DWORD));

  //KS_SIZE_PREHEADER = (FIELD_OFFSET(KS_VIDEOINFOHEADER,bmiHeader))

  //For normal size
  //#define KS_SIZE_VIDEOHEADER (sizeof(KS_BITMAPINFOHEADER) + KS_SIZE_PREHEADER)
  //!!! for abnormal biSizes
  //#define KS_SIZE_VIDEOHEADER(pbmi) ((pbmi)->bmiHeader.biSize + KS_SIZE_PREHEADER)

  // VBI
  // Used for NABTS, CC, Intercast,
type

  PKS_VBIINFOHEADER = ^KS_VBIINFOHEADER;
  tagKS_VBIINFOHEADER = record
    StartLine           : ULONG; // inclusive
    EndLine             : ULONG; // inclusive
    SamplingFrequency   : ULONG; // Hz.
    MinLineStartTime    : ULONG; // microSec * 100 from HSync LE
    MaxLineStartTime    : ULONG; // microSec * 100 from HSync LE
    ActualLineStartTime : ULONG; // microSec * 100 from HSync LE
    ActualLineEndTime   : ULONG; // microSec * 100 from HSync LE
    VideoStandard       : ULONG; // KS_AnalogVideoStandard*
    SamplesPerLine      : ULONG;
    StrideInBytes       : ULONG; // May be > SamplesPerLine
    BufferSize          : ULONG; // Bytes
  end;
  KS_VBIINFOHEADER = tagKS_VBIINFOHEADER;


  // VBI Sampling Rates
const

  KS_VBIDATARATE_NABTS         = 5727272;
  KS_VBIDATARATE_CC            = 503493;    // ~= 1/1.986125e-6
  KS_VBISAMPLINGRATE_4X_NABTS  = longint(4 * KS_VBIDATARATE_NABTS);
  KS_VBISAMPLINGRATE_47X_NABTS = longint(27000000);
  KS_VBISAMPLINGRATE_5X_NABTS  = longint(5 * KS_VBIDATARATE_NABTS);

  KS_47NABTS_SCALER = KS_VBISAMPLINGRATE_47X_NABTS div KS_VBIDATARATE_NABTS;


  // Analog video variant - Use this when the format is FORMAT_AnalogVideo
  //
  // rcSource defines the portion of the active video signal to use
  // rcTarget defines the destination rectangle both of the above are relative to the
  // dwActiveWidth and dwActiveHeight fields dwActiveWidth is currently set to 720
  // for all formats (but could change for HDTV) dwActiveHeight is 483 for NTSC and
  // 575 for PAL/SECAM (but could change for HDTV)
type

  PKS_ANALOGVIDEOINFO = ^KS_ANALOGVIDEOINFO;
  tagKS_AnalogVideoInfo = record
    rcSource        : TRECT;           // Width max is 720, height varies w/ TransmissionStd
    rcTarget        : TRECT;           // Where the video should go
    dwActiveWidth   : DWORD;           // Always 720 (CCIR-601 active samples per line)
    dwActiveHeight  : DWORD;           // 483 for NTSC, 575 for PAL/SECAM
    AvgTimePerFrame : LONGLONG;        // Normal ActiveMovie units (100 nS)
  end;
  KS_AnalogVideoInfo = tagKS_AnalogVideoInfo;


  //===========================================================================
  // Data packet passed on Analog video stream channel change
  //===========================================================================
const

  KS_TVTUNER_CHANGE_BEGIN_TUNE = $0001;  // Starting a tuning operation
  KS_TVTUNER_CHANGE_END_TUNE   = $0002;  // Ending a tuning operation


type

  PKS_TVTUNER_CHANGE_INFO = ^KS_TVTUNER_CHANGE_INFO;
  tagKS_TVTUNER_CHANGE_INFO = record
   dwFlags               : DWORD; // KS_TVTUNER_CHANGE_*
   dwCountryCode         : DWORD;
   dwAnalogVideoStandard : DWORD; // KS_AnalogVideoStandard
   dwChannel             : DWORD;
  end;
  KS_TVTUNER_CHANGE_INFO = tagKS_TVTUNER_CHANGE_INFO;


  //===========================================================================
  // Video format blocks
  //===========================================================================

  PKS_MPEG2Level = ^KS_MPEG2Level;
  KS_MPEG2Level = (
    KS_MPEG2Level_Low,
    KS_MPEG2Level_Main,
    KS_MPEG2Level_High1440,
    KS_MPEG2Level_High
  );

  PKS_MPEG2Profile = ^KS_MPEG2Profile;
  KS_MPEG2Profile = (
    KS_MPEG2Profile_Simple,
    KS_MPEG2Profile_Main,
    KS_MPEG2Profile_SNRScalable,
    KS_MPEG2Profile_SpatiallyScalable,
    KS_MPEG2Profile_High
  );

const

  KS_INTERLACE_IsInterlaced          = $00000001; // if 0, other interlace bits are irrelevent

  KS_INTERLACE_1FieldPerSample       = $00000002; // else 2 fields per media sample

  KS_INTERLACE_Field1First           = $00000004; // else Field 2 is first;  top field in PAL is field 1, top field in NTSC is field 2?

  KS_INTERLACE_UNUSED                = $00000008; //

  KS_INTERLACE_FieldPatternMask      = $00000030; // use this mask with AMINTERLACE_FieldPat*

  KS_INTERLACE_FieldPatField1Only    = $00000000; // Data never contains a Field2

  KS_INTERLACE_FieldPatField2Only    = $00000010; // Data never contains a Field1

  KS_INTERLACE_FieldPatBothRegular   = $00000020; // There will be a Field2 for every Field1 (required for Weave?)

  KS_INTERLACE_FieldPatBothIrregular = $00000030; // Random pattern of Field1s and Field2s

  KS_INTERLACE_DisplayModeMask       = $000000c0;

  KS_INTERLACE_DisplayModeBobOnly    = $00000000;

  KS_INTERLACE_DisplayModeWeaveOnly  = $00000040;

  KS_INTERLACE_DisplayModeBobOrWeave = $00000080;

  KS_COPYPROTECT_RestrictDuplication = $00000001; // duplication of this stream should be restricted

  KS_MPEG2_DoPanScan           = $00000001; //if set, the MPEG-2 video decoder should crop output image
  {$EXTERNALSYM KS_MPEG2_DoPanScan}         // based on pan-scan vectors in picture_display_extension
                                            // and change the picture aspect ratio accordingly.

  KS_MPEG2_DVDLine21Field1     = $00000002;  //if set, the MPEG-2 decoder must be able to produce an output
  {$EXTERNALSYM KS_MPEG2_DVDLine21Field1}    // pin for DVD style closed caption data found in GOP layer of field 1

  KS_MPEG2_DVDLine21Field2     = $00000004; //if set, the MPEG-2 decoder must be able to produce an output
  {$EXTERNALSYM KS_MPEG2_DVDLine21Field2}   // pin for DVD style closed caption data found in GOP layer of field 2

  KS_MPEG2_SourceIsLetterboxed = $00000008;    //if set, indicates that black bars have been encoded in the top
  {$EXTERNALSYM KS_MPEG2_SourceIsLetterboxed}  // and bottom of the video.

  KS_MPEG2_FilmCameraMode      = $00000010; //if set, indicates "film mode" used for 625/50 content.  If cleared,
  {$EXTERNALSYM KS_MPEG2_FilmCameraMode}    // indicates that "camera mode" was used.

  KS_MPEG2_LetterboxAnalogOut  = $00000020;   //if set and this stream is sent to an analog output, it should
  {$EXTERNALSYM KS_MPEG2_LetterboxAnalogOut}  // be letterboxed. Streams sent to VGA should be letterboxed only by renderers.

  KS_MPEG2_DSS_UserData        = $00000040; //if set, the MPEG-2 decoder must process DSS style user data

  KS_MPEG2_DVB_UserData        = $00000080; //if set, the MPEG-2 decoder must process DVB style user data

  KS_MPEG2_27MhzTimebase       = $00000100; //if set, the PTS,DTS timestamps advance at 27MHz rather than 90KHz

  KS_MPEG2_WidescreenAnalogOut = $00000200;   //if set and this stream is sent to an analog output, it should
  {$EXTERNALSYM KS_MPEG2_WidescreenAnalogOut} //  be in widescreen format (4x3 content should be centered on a 16x9 output).
                                              //  Streams sent to VGA should be widescreened only by renderers.

  KS_AMCONTROL_USED              = $00000001; // Used to test if these flags are supported.  Set and test for AcceptMediaType.
  {$EXTERNALSYM KS_AMCONTROL_USED}            // If rejected, then you cannot use the AMCONTROL flags (send 0 for dwReserved1)

  KS_AMCONTROL_PAD_TO_4x3        = $00000002; // if set means display the image in a 4x3 area

  KS_AMCONTROL_PAD_TO_16x9       = $00000004; // if set means display the image in a 16x9 area

  KS_AMCONTROL_COLORINFO_PRESENT = $00000080; // if set, indicates DXVA color info is present in the upper (24) bits of the dwControlFlags

type

  PKS_VIDEOINFOHEADER2 = ^KS_VIDEOINFOHEADER2;
  tagKS_VIDEOINFOHEADER2 = record
    rcSource: TRECT;
    rcTarget: TRECT;
    dwBitRate: DWORD;
    dwBitErrorRate: DWORD;
    AvgTimePerFrame: LONGLONG;
    dwInterlaceFlags: DWORD;
    dwCopyProtectFlags: DWORD;
    dwPictAspectRatioX: DWORD;
    dwPictAspectRatioY: DWORD;
    case Integer of
      0: (dwControlFlags: DWORD;
          dwReserved2: DWORD;
          bmiHeader: KS_BITMAPINFOHEADER);
      1: (dwReserved1: DWORD);
  end;
  KS_VIDEOINFOHEADER2 = tagKS_VIDEOINFOHEADER2;


  PKS_MPEG1VIDEOINFO = ^KS_MPEG1VIDEOINFO;
  tagKS_MPEG1VIDEOINFO = record
    hdr: KS_VIDEOINFOHEADER ; // Compatible with VIDEOINFO
    dwStartTimeCode  : DWORD ;               // 25-bit Group of pictures time code at start of data
    cbSequenceHeader : DWORD ;               // Length in bytes of bSequenceHeader
    bSequenceHeader: array [0..0] of Byte;   // Sequence header including quantization matrices if any

  end;
  KS_MPEG1VIDEOINFO = tagKS_MPEG1VIDEOINFO;


const

  KS_MAX_SIZE_MPEG1_SEQUENCE_INFO = 140;
  //#define KS_SIZE_MPEG1VIDEOINFO(pv) (FIELD_OFFSET(KS_MPEG1VIDEOINFO, bSequenceHeader[0]) + (pv)->cbSequenceHeader)
  //#define KS_MPEG1_SEQUENCE_INFO(pv) ((const BYTE *)(pv)->bSequenceHeader)

type

  PKS_MPEGVIDEOINFO2 = ^KS_MPEGVIDEOINFO2;
  tagKS_MPEGVIDEOINFO2 = record
    hdr              : KS_VIDEOINFOHEADER2;
    dwStartTimeCode  : DWORD;                // ?? not used for DVD ??
    cbSequenceHeader : DWORD;                // is 0 for DVD (no sequence header)
    dwProfile        : DWORD;                // use enum MPEG2Profile
    dwLevel          : DWORD;                // use enum MPEG2Level
    dwFlags          : DWORD;                // use AMMPEG2_* defines. Reject connection if undefined bits are not 0
    bSequenceHeader  : array [0..0] of DWORD; // DWORD instead of Byte for alignment purposes
                                              // For MPEG-2, if a sequence_header is included, the sequence_extension
                                              // should also be included
  end;
  KS_MPEGVIDEOINFO2 = tagKS_MPEGVIDEOINFO2;


  PKS_H264VIDEOINFO = ^tagKS_H264VIDEOINFO;
  tagKS_H264VIDEOINFO = record
    // from UVC 1.5 H.264 frame descriptor
    wWidth: WORD;
    wHeight: WORD;
    wSARwidth: WORD;
    wSARheight: WORD;
    wProfile: WORD;
    bLevelIDC: Byte;
    wConstrainedToolset: WORD;
    bmSupportedUsages: DWORD;
    bmCapabilities: WORD;
    bmSVCCapabilities: DWORD;
    bmMVCCapabilities: DWORD;
    dwFrameInterval: DWORD;
    // from UVC 1.5 H.264 format descriptor
    bMaxCodecConfigDelay: Byte;
    bmSupportedSliceModes: Byte;
    bmSupportedSyncFrameTypes: Byte;
    bResolutionScaling: Byte;
    bSimulcastSupport: Byte;
    bmSupportedRateControlModes: Byte;
    wMaxMBperSecOneResolutionNoScalability: WORD;
    wMaxMBperSecTwoResolutionsNoScalability: WORD;
    wMaxMBperSecThreeResolutionsNoScalability: WORD;
    wMaxMBperSecFourResolutionsNoScalability: WORD;
    wMaxMBperSecOneResolutionTemporalScalability: WORD;
    wMaxMBperSecTwoResolutionsTemporalScalablility: WORD;
    wMaxMBperSecThreeResolutionsTemporalScalability: WORD;
    wMaxMBperSecFourResolutionsTemporalScalability: WORD;
    wMaxMBperSecOneResolutionTemporalQualityScalability: WORD;
    wMaxMBperSecTwoResolutionsTemporalQualityScalability: WORD;
    wMaxMBperSecThreeResolutionsTemporalQualityScalablity: WORD;
    wMaxMBperSecFourResolutionsTemporalQualityScalability: WORD;
    wMaxMBperSecOneResolutionTemporalSpatialScalability: WORD;
    wMaxMBperSecTwoResolutionsTemporalSpatialScalability: WORD;
    wMaxMBperSecThreeResolutionsTemporalSpatialScalablity: WORD;
    wMaxMBperSecFourResolutionsTemporalSpatialScalability: WORD;
    wMaxMBperSecOneResolutionFullScalability: WORD;
    wMaxMBperSecTwoResolutionsFullScalability: WORD;
    wMaxMBperSecThreeResolutionsFullScalability: WORD;
    wMaxMBperSecFourResolutionsFullScalability: WORD;
  end;
  KS_H264VIDEOINFO = tagKS_H264VIDEOINFO;


const
  //KS_SIZE_MPEGVIDEOINFO2(pv) (FIELD_OFFSET(KS_MPEGVIDEOINFO2, bSequenceHeader[0]) + (pv)->cbSequenceHeader)
  //KS_MPEG1_SEQUENCE_INFO(pv) ((const BYTE *)(pv)->bSequenceHeader)



  //===========================================================================
  // Audio format blocks
  //===========================================================================

  //if set, the PTS,DTS timestamps advance at 27MHz rather than 90KHz
  KS_MPEGAUDIOINFO_27MhzTimebase = $00000001;

type

  PKS_MPEGAUDIOINFO = ^KS_MPEGAUDIOINFO;
  tagKS_MPEAUDIOINFO = record
    dwFlags     : DWORD; // use KS_MPEGAUDIOINFO_* defines.  Reject connection if undefined bits are not 0
    dwReserved1 : DWORD; // must be 0; reject connection otherwise
    dwReserved2 : DWORD; // must be 0; reject connection otherwise
    dwReserved3 : DWORD; // must be 0; reject connection otherwise
  end;
  KS_MPEGAUDIOINFO = tagKS_MPEAUDIOINFO;


  //===========================================================================
  // Video DATAFORMATs
  //===========================================================================

  PKS_DATAFORMAT_VIDEOINFOHEADER = ^KS_DATAFORMAT_VIDEOINFOHEADER;
  tagKS_DATAFORMAT_VIDEOINFOHEADER = record
    DataFormat      : KSDATAFORMAT;
    VideoInfoHeader : KS_VIDEOINFOHEADER;
  end;
  KS_DATAFORMAT_VIDEOINFOHEADER = tagKS_DATAFORMAT_VIDEOINFOHEADER;

  PKS_DATAFORMAT_VIDEOINFOHEADER2 = ^KS_DATAFORMAT_VIDEOINFOHEADER2;
  tagKS_DATAFORMAT_VIDEOINFOHEADER2 = record
    DataFormat       : KSDATAFORMAT;
    VideoInfoHeader2 : KS_VIDEOINFOHEADER2;
  end;
  KS_DATAFORMAT_VIDEOINFOHEADER2 = tagKS_DATAFORMAT_VIDEOINFOHEADER2;

  PKS_DATAFORMAT_MPEGVIDEOINFO2 = ^tagKS_DATAFORMAT_MPEGVIDEOINFO2;
  tagKS_DATAFORMAT_MPEGVIDEOINFO2 = record
    DataFormat: KSDATAFORMAT;
    MpegVideoInfoHeader2: KS_MPEGVIDEOINFO2;
  end;
  KS_DATAFORMAT_MPEGVIDEOINFO2 = tagKS_DATAFORMAT_MPEGVIDEOINFO2;

  PKS_DATAFORMAT_H264VIDEOINFO = ^tagKS_DATAFORMAT_H264VIDEOINFO;
  tagKS_DATAFORMAT_H264VIDEOINFO = record
    DataFormat: KSDATAFORMAT;
    H264VideoInfoHeader: KS_H264VIDEOINFO;
  end;
  KS_DATAFORMAT_H264VIDEOINFO = tagKS_DATAFORMAT_H264VIDEOINFO;

  PKS_DATAFORMAT_IMAGEINFO = ^tagKS_DATAFORMAT_IMAGEINFO;
  tagKS_DATAFORMAT_IMAGEINFO = record
    DataFormat: KSDATAFORMAT;
    ImageInfoHeader: KS_BITMAPINFOHEADER;
  end;
  KS_DATAFORMAT_IMAGEINFO = tagKS_DATAFORMAT_IMAGEINFO;

  PKS_DATAFORMAT_VIDEOINFO_PALETTE = ^KS_DATAFORMAT_VIDEOINFO_PALETTE;
  tagKS_DATAFORMAT_VIDEOINFO_PALETTE = record
    DataFormat : KSDATAFORMAT;
    VideoInfo  : KS_VIDEOINFO;
  end;
  KS_DATAFORMAT_VIDEOINFO_PALETTE = tagKS_DATAFORMAT_VIDEOINFO_PALETTE;

  PKS_DATAFORMAT_VBIINFOHEADER = ^tagKS_DATAFORMAT_VBIINFOHEADER;
  tagKS_DATAFORMAT_VBIINFOHEADER = record
    DataFormat: KSDATAFORMAT;
    VBIInfoHeader: KS_VBIINFOHEADER;
  end;
  KS_DATAFORMAT_VBIINFOHEADER = tagKS_DATAFORMAT_VBIINFOHEADER;



  PKS_VIDEO_STREAM_CONFIG_CAPS = ^KS_VIDEO_STREAM_CONFIG_CAPS;
  _KS_VIDEO_STREAM_CONFIG_CAPS = record
    guid               : TGUID;    // will be MEDIATYPE_Video
    VideoStandard      : ULONG;    // logical OR of all AnalogVideoStandards
                                   // supported
    InputSize          : TSIZE;    // the inherent size of the incoming signal
                                   // (every pixel unique)
    MinCroppingSize    : TSIZE;    // smallest rcSrc cropping rect allowed
    MaxCroppingSize    : TSIZE;    // largest rcSrc cropping rect allowed
    CropGranularityX   : integer;  // granularity of cropping size
    CropGranularityY   : integer;
    CropAlignX         : integer;  // alignment of cropping rect
    CropAlignY         : integer;
    MinOutputSize      : TSIZE;    // smallest bitmap stream can produce
    MaxOutputSize      : TSIZE;    // largest  bitmap stream can produce
    OutputGranularityX : integer;  // granularity of output bitmap size
    OutputGranularityY : integer;
    StretchTapsX       : integer;  // 0, no stretch, 1 pix dup, 2 interp, ...
    StretchTapsY       : integer;  //    Describes quality of hardware scaler
    ShrinkTapsX        : integer;  //
    ShrinkTapsY        : integer;  //
    MinFrameInterval   : LONGLONG; // 100 nS units
    MaxFrameInterval   : LONGLONG;
    MinBitsPerSecond   : LONG;
    MaxBitsPerSecond   : LONG;
  end;
  KS_VIDEO_STREAM_CONFIG_CAPS = _KS_VIDEO_STREAM_CONFIG_CAPS;


  //===========================================================================
  // Video DATARANGEs
  //===========================================================================

  PKS_DATARANGE_VIDEO = ^KS_DATARANGE_VIDEO;
  tagKS_DATARANGE_VIDEO = record
    DataRange              : KSDATARANGE;
    bFixedSizeSamples      : BOOL;                         // all samples same size?
    bTemporalCompression   : BOOL;                         // all I frames?
    StreamDescriptionFlags : DWORD;                        // KS_VIDEO_DESC_*
    MemoryAllocationFlags  : DWORD;                        // KS_VIDEO_ALLOC_*
    ConfigCaps             : KS_VIDEO_STREAM_CONFIG_CAPS;
    VideoInfoHeader        : KS_VIDEOINFOHEADER;           // default format
  end;
  KS_DATARANGE_VIDEO = tagKS_DATARANGE_VIDEO;

  PKS_DATARANGE_VIDEO2 = ^KS_DATARANGE_VIDEO2;
  tagKS_DATARANGE_VIDEO2 = record
    DataRange              : KSDATARANGE;
    bFixedSizeSamples      : BOOL;  // all samples same size?
    bTemporalCompression   : BOOL;  // all I frames?
    StreamDescriptionFlags : DWORD; // KS_VIDEO_DESC_*
    MemoryAllocationFlags  : DWORD; // KS_VIDEO_ALLOC_*
    ConfigCaps             : KS_VIDEO_STREAM_CONFIG_CAPS;
    VideoInfoHeader        : KS_VIDEOINFOHEADER2;        // default format
  end;
  KS_DATARANGE_VIDEO2 = tagKS_DATARANGE_VIDEO2;

  PKS_DATARANGE_MPEG1_VIDEO = ^KS_DATARANGE_MPEG1_VIDEO;
  tagKS_DATARANGE_MPEG1_VIDEO = record
    DataRange              : KSDATARANGE ;
    bFixedSizeSamples      : BOOL ;  // all samples same size?
    bTemporalCompression   : BOOL ;  // all I frames?
    StreamDescriptionFlags : DWORD ; // KS_VIDEO_DESC_*
    MemoryAllocationFlags  : DWORD ; // KS_VIDEO_ALLOC_*
    ConfigCaps             : KS_VIDEO_STREAM_CONFIG_CAPS ;
    VideoInfoHeader        : KS_MPEG1VIDEOINFO ; // default format
  end;
  KS_DATARANGE_MPEG1_VIDEO = tagKS_DATARANGE_MPEG1_VIDEO;

  PKS_DATARANGE_MPEG2_VIDEO = ^KS_DATARANGE_MPEG2_VIDEO;
  tagKS_DATARANGE_MPEG2_VIDEO = record
    DataRange              : KSDATARANGE;
    bFixedSizeSamples      : BOOL;        // all samples same size?
    bTemporalCompression   : BOOL;        // all I frames?
    StreamDescriptionFlags : DWORD;       // KS_VIDEO_DESC_*
    MemoryAllocationFlags  : DWORD;       // KS_VIDEO_ALLOC_*
    ConfigCaps             : KS_VIDEO_STREAM_CONFIG_CAPS;
    VideoInfoHeader        : KS_MPEGVIDEOINFO2;  // default format
  end;
  KS_DATARANGE_MPEG2_VIDEO = tagKS_DATARANGE_MPEG2_VIDEO;

  PKS_DATARANGE_H264_VIDEO = ^tagKS_DATARANGE_H264_VIDEO;
  tagKS_DATARANGE_H264_VIDEO = record
    DataRange: KSDATARANGE;
    bFixedSizeSamples: BOOL;             // all samples same size?
    bTemporalCompression: BOOL;          // all I frames?
    StreamDescriptionFlags: DWORD;       // KS_VIDEO_DESC_*
    MemoryAllocationFlags: DWORD;        // KS_VIDEO_ALLOC_*
    ConfigCaps: KS_VIDEO_STREAM_CONFIG_CAPS;
    VideoInfoHeader: KS_H264VIDEOINFO;  // default format
  end;
  KS_DATARANGE_H264_VIDEO = tagKS_DATARANGE_H264_VIDEO;

  PKS_DATARANGE_IMAGE = ^tagKS_DATARANGE_IMAGE;
  tagKS_DATARANGE_IMAGE = record
    DataRange: KSDATARANGE;
    ConfigCaps: KS_VIDEO_STREAM_CONFIG_CAPS;
    ImageInfoHeader: KS_BITMAPINFOHEADER;
  end;
  KS_DATARANGE_IMAGE = tagKS_DATARANGE_IMAGE;

  PKS_DATARANGE_VIDEO_PALETTE = ^tagKS_DATARANGE_VIDEO_PALETTE;
  tagKS_DATARANGE_VIDEO_PALETTE = record
    DataRange              : KSDATARANGE;
    bFixedSizeSamples      : BOOL;  // all samples same size?
    bTemporalCompression   : BOOL;  // all I frames?
    StreamDescriptionFlags : DWORD; // KS_VIDEO_DESC_*
    MemoryAllocationFlags  : DWORD; // KS_VIDEO_ALLOC_*
    ConfigCaps             : KS_VIDEO_STREAM_CONFIG_CAPS;
    VideoInfo              : KS_VIDEOINFO; // default format
  end;
  KS_DATARANGE_VIDEO_PALETTE = tagKS_DATARANGE_VIDEO_PALETTE;

  PKS_DATARANGE_VIDEO_VBI = ^tagKS_DATARANGE_VIDEO_VBI;
  tagKS_DATARANGE_VIDEO_VBI = record
    DataRange              : KSDATARANGE;
    bFixedSizeSamples      : BOOL;  // all samples same size?
    bTemporalCompression   : BOOL;  // all I frames?
    StreamDescriptionFlags : DWORD; // KS_VIDEO_DESC_*
    MemoryAllocationFlags  : DWORD; // KS_VIDEO_ALLOC_*
    ConfigCaps             : KS_VIDEO_STREAM_CONFIG_CAPS;
    VBIInfoHeader          : KS_VBIINFOHEADER; // default format
  end;
  KS_DATARANGE_VIDEO_VBI = tagKS_DATARANGE_VIDEO_VBI;

  PKS_DATARANGE_ANALOGVIDEO = ^tagKS_DATARANGE_ANALOGVIDEO;
  tagKS_DATARANGE_ANALOGVIDEO = record
    DataRange       : KSDATARANGE;
    AnalogVideoInfo : KS_ANALOGVIDEOINFO;
  end;
  KS_DATARANGE_ANALOGVIDEO = tagKS_DATARANGE_ANALOGVIDEO;


  //===========================================================================
  // StreamDescriptionFlags
  //
  // These define the "purpose" of each video stream
  //===========================================================================
const

  KS_VIDEOSTREAM_PREVIEW     = $0001;  // Preview stream
  KS_VIDEOSTREAM_CAPTURE     = $0002;  // Capture stream
  KS_VIDEOSTREAM_VBI         = $0010;  // Field1 VBI
  KS_VIDEOSTREAM_NABTS       = $0020;  // Field1 NABTS
  KS_VIDEOSTREAM_CC          = $0100;  // Closed Captioning
  KS_VIDEOSTREAM_EDS         = $0200;  // Extended Data Services
  KS_VIDEOSTREAM_TELETEXT    = $0400;  // Field1 Teletext only
  KS_VIDEOSTREAM_STILL       = $1000;  // Still image input
  KS_VIDEOSTREAM_IS_VPE      = $8000;  // Is a VPE based stream?


  // MemoryAllocationFlags
  KS_VIDEO_ALLOC_VPE_SYSTEM  = $0001;  // VPE surface in system memory
  KS_VIDEO_ALLOC_VPE_DISPLAY = $0002;  // VPE surface in display memory
  KS_VIDEO_ALLOC_VPE_AGP     = $0004;  // VPE surface in AGP memory


  //////////////////////////////////////////////////////////////
  // Capture driver VBI property sets
  //////////////////////////////////////////////////////////////

  // {F162C607-7B35-496f-AD7F-2DCA3B46B718}
  KSPROPSETID_VBICAP_PROPERTIES : TGUID = '{F162C607-7B35-496f-AD7F-2DCA3B46B718}';

type

  PKSPROPERTY_VBICAP = ^KSPROPERTY_VBICAP;
  KSPROPERTY_VBICAP = (
    KSPROPERTY_VBICAP_PROPERTIES_PROTECTION = $01);

  PVBICAP_PROPERTIES_PROTECTION_S = ^_VBICAP_PROPERTIES_PROTECTION_S;
  _VBICAP_PROPERTIES_PROTECTION_S = record
    Property_   : KSPROPERTY;
    StreamIndex : ULONG; // Index of stream
    Status      : ULONG;
  end;
  VBICAP_PROPERTIES_PROTECTION_S = _VBICAP_PROPERTIES_PROTECTION_S;


const

  KS_VBICAP_PROTECTION_MV_PRESENT  = $0001;
  KS_VBICAP_PROTECTION_MV_HARDWARE = $0002;
  KS_VBICAP_PROTECTION_MV_DETECTED = $0004;


  //***************************************************************************/
  //* VBI Related GUIDs, structs and properties for codecs(generic, cc, nabts)*/
  //***************************************************************************/

  ///////////////////////////////////////////////////////////////////////////////////////
  // IP/NABTS Protocol Reserved Group IDs - Overall Range 0x800-0x8FF [Decimal 2048-2079]
  // Intervening values(0-F) are used if there are multiple providers at a particular tier
  ///////////////////////////////////////////////////////////////////////////////////////

  // Used by individual content creators in show footage/data
  KS_NABTS_GROUPID_ORIGINAL_CONTENT_BASE              = $800;
  KS_NABTS_GROUPID_ORIGINAL_CONTENT_ADVERTISER_BASE   = $810;

  // Used by production company in finished show data
  KS_NABTS_GROUPID_PRODUCTION_COMPANY_CONTENT_BASE    = $820;
  KS_NABTS_GROUPID_PRODUCTION_COMPANY_ADVERTISER_BASE = $830;

  // Used by broadcast syndicates in syndicated show data
  KS_NABTS_GROUPID_SYNDICATED_SHOW_CONTENT_BASE       = $840;
  KS_NABTS_GROUPID_SYNDICATED_SHOW_ADVERTISER_BASE    = $850;

  // Used by tv networks in network television data
  KS_NABTS_GROUPID_NETWORK_WIDE_CONTENT_BASE          = $860;
  KS_NABTS_GROUPID_NETWORK_WIDE_ADVERTISER_BASE       = $870;

  // Used by telvision stations in local programming data
  KS_NABTS_GROUPID_TELEVISION_STATION_CONTENT_BASE    = $880;
  KS_NABTS_GROUPID_TELEVISION_STATION_ADVERTISER_BASE = $890;

  // Used by cable system in cable head-end originated data
  KS_NABTS_GROUPID_LOCAL_CABLE_SYSTEM_CONTENT_BASE    = $8A0;
  KS_NABTS_GROUPID_LOCAL_CABLE_SYSTEM_ADVERTISER_BASE = $8B0;


  // The values between 0x8C0 - 0x8EF are reserved for future expansion

  // Used by Microsoft for Testing purposes (0x8F0 - 0x8FF)
  KS_NABTS_GROUPID_MICROSOFT_RESERVED_TEST_DATA_BASE  = $8F0;


  //////////////////////////////////////////////////////////////
  // Stream Format FEC-corrected NABTS bundles
  //////////////////////////////////////////////////////////////

  KSDATAFORMAT_TYPE_NABTS        : TGUID = '{E757BCA0-39AC-11d1-A9F5-00C04FBBDE8F}';
  KSDATAFORMAT_SUBTYPE_NABTS_FEC : TGUID = '{E757BCA1-39AC-11d1-A9F5-00C04FBBDE8F}';



  //////////////////////////////////////////////////////////////
  // NABTS Bundle data structure definition
  //////////////////////////////////////////////////////////////

  MAX_NABTS_VBI_LINES_PER_FIELD = 11;
  NABTS_LINES_PER_BUNDLE        = 16;
  NABTS_PAYLOAD_PER_LINE        = 28;
  NABTS_BYTES_PER_LINE          = 36;


type
PNABTSFEC_BUFFER = ^NABTSFEC_BUFFER;
  _NABTSFEC_BUFFER = record
    dataSize : ULONG;
    groupID  : USHORT;
    Reserved : USHORT;
    data     : array[0..(NABTS_LINES_PER_BUNDLE * NABTS_PAYLOAD_PER_LINE)-1] of UCHAR;
  end;
  NABTSFEC_BUFFER = _NABTSFEC_BUFFER;
{$PACKRECORDS C}

  //////////////////////////////////////////////////////////////
  // vbi codec filtering pin properties
  //////////////////////////////////////////////////////////////
const

  KSPROPSETID_VBICodecFiltering : TGUID = '{cafeb0ca-8715-11d0-bd6a-0035c0edbabe}';


type

  PKSPROPERTY_VBICODECFILTERING = ^KSPROPERTY_VBICODECFILTERING;
  KSPROPERTY_VBICODECFILTERING = (
    KSPROPERTY_VBICODECFILTERING_SCANLINES_REQUESTED_BIT_ARRAY   = $01,
    KSPROPERTY_VBICODECFILTERING_SCANLINES_DISCOVERED_BIT_ARRAY  = $02,
    KSPROPERTY_VBICODECFILTERING_SUBSTREAMS_REQUESTED_BIT_ARRAY  = $03,
    KSPROPERTY_VBICODECFILTERING_SUBSTREAMS_DISCOVERED_BIT_ARRAY = $04,
    KSPROPERTY_VBICODECFILTERING_STATISTICS                      = $05
    );

  PVBICODECFILTERING_SCANLINES = ^_VBICODECFILTERING_SCANLINES;
  _VBICODECFILTERING_SCANLINES = record
    DwordBitArray : array[0..31] of DWORD;      // An array of scanline bits 0..1024(32*32)
  end;
  VBICODECFILTERING_SCANLINES = _VBICODECFILTERING_SCANLINES;

  PVBICODECFILTERING_NABTS_SUBSTREAMS = ^_VBICODECFILTERING_NABTS_SUBSTREAMS;
  _VBICODECFILTERING_NABTS_SUBSTREAMS = record
    SubstreamMask : array[0..127] of DWORD;   // An array of 4096 bits (one for each NABTS GroupID)
  end;
  VBICODECFILTERING_NABTS_SUBSTREAMS = _VBICODECFILTERING_NABTS_SUBSTREAMS;

  PVBICODECFILTERING_CC_SUBSTREAMS = ^_VBICODECFILTERING_CC_SUBSTREAMS;
  _VBICODECFILTERING_CC_SUBSTREAMS = record
    SubstreamMask : DWORD;        // An array of 32 bits (see KS_CC_SUBSTREAM *)
  end;
  VBICODECFILTERING_CC_SUBSTREAMS = _VBICODECFILTERING_CC_SUBSTREAMS;


const

  // The following flags describe CC field 1 substreams: CC1,CC2,TT1,TT2
  KS_CC_SUBSTREAM_FIELD1_MASK         = $00F0;
  KS_CC_SUBSTREAM_SERVICE_CC1         = $0010;
  KS_CC_SUBSTREAM_SERVICE_CC2         = $0020;
  KS_CC_SUBSTREAM_SERVICE_T1          = $0040;
  KS_CC_SUBSTREAM_SERVICE_T2          = $0080;

  // The following flags describe CC field 2 substreams: CC3,CC4,TT3,TT4,XDS
  KS_CC_SUBSTREAM_FIELD2_MASK         = $1F00;
  KS_CC_SUBSTREAM_SERVICE_CC3         = $0100;
  KS_CC_SUBSTREAM_SERVICE_CC4         = $0200;
  KS_CC_SUBSTREAM_SERVICE_T3          = $0400;
  KS_CC_SUBSTREAM_SERVICE_T4          = $0800;
  KS_CC_SUBSTREAM_SERVICE_XDS         = $1000;

  // Special Note: field 1 or 2 substreams are usually on found on field 1 and 2 respectively
  // If the VBI odd/even polarity is reversed, the correct filtered data will still be found.



  ///////////////////////////////////////////////////////////////////
  // Hardware decoded CC stream format
  ///////////////////////////////////////////////////////////////////

  CC_MAX_HW_DECODE_LINES = 12;

type

  PCC_BYTE_PAIR = ^_CC_BYTE_PAIR;
  _CC_BYTE_PAIR = record
    Decoded  : array[0..1] of BYTE;
    Reserved : word;
  end;
  CC_BYTE_PAIR = _CC_BYTE_PAIR;

  PCC_HW_FIELD = ^_CC_HW_FIELD;
  _CC_HW_FIELD = record
   ScanlinesRequested : VBICODECFILTERING_SCANLINES;
   fieldFlags         : ULONG;    // KS_VBI_FLAG_FIELD1,2
   PictureNumber      : Int64;
   Lines              : array[0..CC_MAX_HW_DECODE_LINES-1] of CC_BYTE_PAIR;
  end;
  CC_HW_FIELD = _CC_HW_FIELD;


  ///////////////////////////////////////////////////////////////////
  // Raw NABTS stream format (TYPE_NABTS, SUBTYPE_NABTS)
  ///////////////////////////////////////////////////////////////////

  // These low-level structures are byte packed( -Zp1 )

{$ALIGN 1}
  PNABTS_BUFFER_LINE = ^_NABTS_BUFFER_LINE;
  _NABTS_BUFFER_LINE = packed record
    Confidence : BYTE;
    Bytes      : array[0..NABTS_BYTES_PER_LINE - 1] of BYTE;
  end;
  NABTS_BUFFER_LINE = _NABTS_BUFFER_LINE;

const

  NABTS_BUFFER_PICTURENUMBER_SUPPORT = 1;

type

  PNABTS_BUFFER = ^_NABTS_BUFFER;
  _NABTS_BUFFER = packed record
    ScanlinesRequested : VBICODECFILTERING_SCANLINES;
    PictureNumber      : Int64;
    NabtsLines         : array[0..MAX_NABTS_VBI_LINES_PER_FIELD - 1] of NABTS_BUFFER_LINE;
  end;
  NABTS_BUFFER = _NABTS_BUFFER;

{$PACKRECORDS C}



  //////////////////////////////////////////////////////////////
  // WST Codec Teletext Media Sample Format
  //////////////////////////////////////////////////////////////

const

  WST_TVTUNER_CHANGE_BEGIN_TUNE  =  $1000;  // Starting a tuning operation
  WST_TVTUNER_CHANGE_END_TUNE    =  $2000;  // Ending a tuning operation

  MAX_WST_VBI_LINES_PER_FIELD = 17;
  WST_BYTES_PER_LINE          = 42;


type

  PWST_BUFFER_LINE = ^_WST_BUFFER_LINE;
  _WST_BUFFER_LINE = record
    Confidence: BYTE;
    Bytes : array[0..WST_BYTES_PER_LINE-1] of BYTE;
  end;
  WST_BUFFER_LINE = _WST_BUFFER_LINE;

  PWST_BUFFER = ^_WST_BUFFER;
  _WST_BUFFER = record
    ScanlinesRequested: VBICODECFILTERING_SCANLINES;
    WstLines: array[0..MAX_WST_VBI_LINES_PER_FIELD - 1] of WST_BUFFER_LINE;
  end;
  WST_BUFFER = _WST_BUFFER;

  //
  // Common codec statistics
  //

  PVBICODECFILTERING_STATISTICS_COMMON = ^_VBICODECFILTERING_STATISTICS_COMMON;
  _VBICODECFILTERING_STATISTICS_COMMON = record
    InputSRBsProcessed   : DWORD; // upstream SRBs received
    OutputSRBsProcessed  : DWORD; // downstream SRBs sent
    SRBsIgnored          : DWORD; // SRBs ignored due to no requests
    InputSRBsMissing     : DWORD; // SRBs dropped upstream
    OutputSRBsMissing    : DWORD; // Output dropped because no SRB pending
    OutputFailures       : DWORD; // dropped because of other failure
    InternalErrors       : DWORD; // could not process due to int. failure
    ExternalErrors       : DWORD; // could not process due to ext. failure
    InputDiscontinuities : DWORD; // discontinuities received
    DSPFailures          : DWORD; // DSP confidence failure
    TvTunerChanges       : DWORD; // number of received KS_TVTUNER_CHANGE_BEGIN_TUNE and KS_TVTUNER_CHANGE_END_TUNE pairs.
    VBIHeaderChanges     : DWORD; // number of received KS_VBI_FLAG_VBIINFOHEADER_CHANGE
    LineConfidenceAvg    : DWORD; // Average of all DSP confidence results
    BytesOutput          : DWORD; // Bytes sent downstream
  end;
  VBICODECFILTERING_STATISTICS_COMMON = _VBICODECFILTERING_STATISTICS_COMMON;

  PVBICODECFILTERING_STATISTICS_COMMON_PIN = ^_VBICODECFILTERING_STATISTICS_COMMON_PIN;
  _VBICODECFILTERING_STATISTICS_COMMON_PIN = record
    SRBsProcessed     : DWORD; // SRBs sent/received
    SRBsIgnored       : DWORD; // SRBs ignored due to filtering
    SRBsMissing       : DWORD; // SRBs not sent/received
    InternalErrors    : DWORD; // could not send/receive due to int. failure
    ExternalErrors    : DWORD; // could not send/receive due to ext. failure
    Discontinuities   : DWORD; // discontinuities received/sent
    LineConfidenceAvg : DWORD; // Average of all DSP confidence results for this pin
    BytesOutput       : DWORD; // Bytes sent downstream
  end;
  VBICODECFILTERING_STATISTICS_COMMON_PIN = _VBICODECFILTERING_STATISTICS_COMMON_PIN;


  //
  // Codec-specific statistics - NABTS
  //

  PVBICODECFILTERING_STATISTICS_NABTS = ^_VBICODECFILTERING_STATISTICS_NABTS;
  _VBICODECFILTERING_STATISTICS_NABTS = record
    Common                : VBICODECFILTERING_STATISTICS_COMMON; // Generic VBI statistics
    FECBundleBadLines     : DWORD; // Un-FEC-correctable lines
    FECQueueOverflows     : DWORD; // Number of times FEC queue overflowed
    FECCorrectedLines     : DWORD; // Lines CSUM corrected by FEC
    FECUncorrectableLines : DWORD; // FEC input lines not CSUM correctable
    BundlesProcessed      : DWORD; // Bundles received from FEC
    BundlesSent2IP        : DWORD; // Bundles sent to IP driver
    FilteredLines         : DWORD; // Lines processed and then dropped
                                   // because no one was interested
  end;
  VBICODECFILTERING_STATISTICS_NABTS = _VBICODECFILTERING_STATISTICS_NABTS;

  PVBICODECFILTERING_STATISTICS_NABTS_PIN = ^_VBICODECFILTERING_STATISTICS_NABTS_PIN;
  _VBICODECFILTERING_STATISTICS_NABTS_PIN = record
    Common: VBICODECFILTERING_STATISTICS_COMMON_PIN; // Generic VBI pin statistics
  end;
  VBICODECFILTERING_STATISTICS_NABTS_PIN = _VBICODECFILTERING_STATISTICS_NABTS_PIN;


  //
  // Codec-specific statistics - Closed Caption
  //

  PVBICODECFILTERING_STATISTICS_CC = ^_VBICODECFILTERING_STATISTICS_CC;
  _VBICODECFILTERING_STATISTICS_CC = record
    Common: VBICODECFILTERING_STATISTICS_COMMON; // Generic VBI statistics
  end;
  VBICODECFILTERING_STATISTICS_CC = _VBICODECFILTERING_STATISTICS_CC;

  PVBICODECFILTERING_STATISTICS_CC_PIN = ^_VBICODECFILTERING_STATISTICS_CC_PIN;
  _VBICODECFILTERING_STATISTICS_CC_PIN = record
    Common: VBICODECFILTERING_STATISTICS_COMMON_PIN; // Generic VBI pin statistics
  end;
  VBICODECFILTERING_STATISTICS_CC_PIN = _VBICODECFILTERING_STATISTICS_CC_PIN;


  //
  // Codec-specific statistics - Closed Caption
  //

  PVBICODECFILTERING_STATISTICS_TELETEXT = ^_VBICODECFILTERING_STATISTICS_TELETEXT;
  _VBICODECFILTERING_STATISTICS_TELETEXT = record
    Common: VBICODECFILTERING_STATISTICS_COMMON ; // Generic VBI statistics
  end;
  VBICODECFILTERING_STATISTICS_TELETEXT = _VBICODECFILTERING_STATISTICS_TELETEXT;

  PVBICODECFILTERING_STATISTICS_TELETEXT_PIN = ^_VBICODECFILTERING_STATISTICS_TELETEXT_PIN;
  _VBICODECFILTERING_STATISTICS_TELETEXT_PIN = record
    Common: VBICODECFILTERING_STATISTICS_COMMON_PIN ; // Generic VBI pin statistics
  end;
  VBICODECFILTERING_STATISTICS_TELETEXT_PIN = _VBICODECFILTERING_STATISTICS_TELETEXT_PIN;


  ////////////////////////////////////////////////////////////////////////////
  // VBI codec property structures(based on KSPROPERTY_VBICODECFILTERING enum)
  ////////////////////////////////////////////////////////////////////////////

  // *** Most codecs support this property
  //    KSPROPERTY_VBICODECFILTERING_SCANLINES_REQUESTED_BIT_ARRAY
  //    KSPROPERTY_VBICODECFILTERING_SCANLINES_DISCOVERED_BIT_ARRAY,

  PKSPropertyVBICodecFilteringScanlinesS = ^KSPROPERTY_VBICODECFILTERING_SCANLINES_S;
  PKSPROPERTY_VBICODECFILTERING_SCANLINES_S = ^KSPROPERTY_VBICODECFILTERING_SCANLINES_S;
  KSPROPERTY_VBICODECFILTERING_SCANLINES_S = record
    Property_ : KSPROPERTY;
    Scanlines : VBICODECFILTERING_SCANLINES;
  end;
  TKSPropertyVBICodecFilteringScanlinesS = KSPROPERTY_VBICODECFILTERING_SCANLINES_S;

  // *** NABTS codecs support this property
  //    KSPROPERTY_VBICODECFILTERING_SUBSTREAMS_REQUESTED_BIT_ARRAY,
  //    KSPROPERTY_VBICODECFILTERING_SUBSTREAMS_DISCOVERED_BIT_ARRAY,
  PKSPROPERTY_VBICODECFILTERING_NABTS_SUBSTREAMS_S = ^KSPROPERTY_VBICODECFILTERING_NABTS_SUBSTREAMS_S;
  KSPROPERTY_VBICODECFILTERING_NABTS_SUBSTREAMS_S = record
    _Property  : KSPROPERTY;
    Substreams : VBICODECFILTERING_NABTS_SUBSTREAMS;
  end;


  // *** Closed captioning codecs support this property
  //    KSPROPERTY_VBICODECFILTERING_SUBSTREAMS_REQUESTED_BIT_ARRAY,
  //    KSPROPERTY_VBICODECFILTERING_SUBSTREAMS_DISCOVERED_BIT_ARRAY,
  PKSPROPERTY_VBICODECFILTERING_CC_SUBSTREAMS_S = ^KSPROPERTY_VBICODECFILTERING_CC_SUBSTREAMS_S;
  KSPROPERTY_VBICODECFILTERING_CC_SUBSTREAMS_S = record
    _Property  : KSPROPERTY;
    Substreams : VBICODECFILTERING_CC_SUBSTREAMS;
  end;


  // *** Most codecs support these versions of the global and pin properties
  //    KSPROPERTY_VBICODECFILTERING_STATISTICS
  PKSPROPERTY_VBICODECFILTERING_STATISTICS_COMMON_S = ^KSPROPERTY_VBICODECFILTERING_STATISTICS_COMMON_S;
  KSPROPERTY_VBICODECFILTERING_STATISTICS_COMMON_S = record
    _Property  : KSPROPERTY;
    Statistics : VBICODECFILTERING_STATISTICS_COMMON;
  end;

  PKSPROPERTY_VBICODECFILTERING_STATISTICS_COMMON_PIN_S = ^KSPROPERTY_VBICODECFILTERING_STATISTICS_COMMON_PIN_S;
  KSPROPERTY_VBICODECFILTERING_STATISTICS_COMMON_PIN_S = record
    Property_  : KSPROPERTY;
    Statistics : VBICODECFILTERING_STATISTICS_COMMON_PIN;
  end;


  // *** NABTS codecs support this version of the global and pin properties
  //    KSPROPERTY_VBICODECFILTERING_STATISTICS
  PKSPROPERTY_VBICODECFILTERING_STATISTICS_NABTS_S = ^KSPROPERTY_VBICODECFILTERING_STATISTICS_NABTS_S;
  KSPROPERTY_VBICODECFILTERING_STATISTICS_NABTS_S = record
    Property_  : KSPROPERTY;
    Statistics : VBICODECFILTERING_STATISTICS_NABTS;
  end;

  PKSPROPERTY_VBICODECFILTERING_STATISTICS_NABTS_PIN_S = ^KSPROPERTY_VBICODECFILTERING_STATISTICS_NABTS_PIN_S;
  KSPROPERTY_VBICODECFILTERING_STATISTICS_NABTS_PIN_S = record
    Property_  : KSPROPERTY;
    Statistics : VBICODECFILTERING_STATISTICS_NABTS_PIN;
  end;


  // *** Closed captioning codecs support this version of the global and pin properties
  //    KSPROPERTY_VBICODECFILTERING_STATISTICS
  PKSPROPERTY_VBICODECFILTERING_STATISTICS_CC_S = ^KSPROPERTY_VBICODECFILTERING_STATISTICS_CC_S;
  KSPROPERTY_VBICODECFILTERING_STATISTICS_CC_S = record
    Property_  : KSPROPERTY;
    Statistics : VBICODECFILTERING_STATISTICS_CC;
  end;

  PKSPROPERTY_VBICODECFILTERING_STATISTICS_CC_PIN_S = ^KSPROPERTY_VBICODECFILTERING_STATISTICS_CC_PIN_S;
  KSPROPERTY_VBICODECFILTERING_STATISTICS_CC_PIN_S = record
    Property_  : KSPROPERTY;
    Statistics : VBICODECFILTERING_STATISTICS_CC_PIN;
  end;


const

  // Standard Pin Names for the video capture filter
  // ===========================================================================

  PINNAME_VIDEO_CAPTURE       : TGUID = '{FB6C4281-0353-11d1-905F-0000C0CC16BA}';
  PINNAME_VIDEO_CC_CAPTURE    : TGUID = '{1AAD8061-012D-11d2-B4B1-00A0D102CFBE}';
  PINNAME_VIDEO_NABTS_CAPTURE : TGUID = '{29703660-498A-11d2-B4B1-00A0D102CFBE}';
  PINNAME_VIDEO_PREVIEW       : TGUID = '{FB6C4282-0353-11d1-905F-0000C0CC16BA}';
  PINNAME_VIDEO_ANALOGVIDEOIN : TGUID = '{FB6C4283-0353-11d1-905F-0000C0CC16BA}';
  PINNAME_VIDEO_VBI           : TGUID = '{FB6C4284-0353-11d1-905F-0000C0CC16BA}';
  PINNAME_VIDEO_VIDEOPORT     : TGUID = '{FB6C4285-0353-11d1-905F-0000C0CC16BA}';
  PINNAME_VIDEO_NABTS         : TGUID = '{FB6C4286-0353-11d1-905F-0000C0CC16BA}';
  PINNAME_VIDEO_EDS           : TGUID = '{FB6C4287-0353-11d1-905F-0000C0CC16BA}';
  PINNAME_VIDEO_TELETEXT      : TGUID = '{FB6C4288-0353-11d1-905F-0000C0CC16BA}';
  PINNAME_VIDEO_CC            : TGUID = '{FB6C4289-0353-11d1-905F-0000C0CC16BA}';
  PINNAME_VIDEO_STILL         : TGUID = '{FB6C428A-0353-11d1-905F-0000C0CC16BA}';
  PINNAME_IMAGE               : TGUID = '{38A0CD98-D49B-4ce8-B48A-344667A17830}';
  PINNAME_VIDEO_TIMECODE      : TGUID = '{FB6C428B-0353-11d1-905F-0000C0CC16BA}';
  PINNAME_VIDEO_VIDEOPORT_VBI : TGUID = '{FB6C428C-0353-11d1-905F-0000C0CC16BA}';


  // KSPROPSETID_VIDMEM_TRANSPORT related guids, structs and enums
  // ===========================================================================

type
  //
  // Capture MemoryAllocationFlags
  //
  PCAPTURE_MEMORY_ALLOCATION_FLAGS = ^CAPTURE_MEMORY_ALLOCATION_FLAGS;
  CAPTURE_MEMORY_ALLOCATION_FLAGS = (
    KS_CAPTURE_ALLOC_INVALID     = 0,
    KS_CAPTURE_ALLOC_SYSTEM      = $0001,  // surface in system memory
    KS_CAPTURE_ALLOC_VRAM        = $0002,  // surface in display memory
    KS_CAPTURE_ALLOC_SYSTEM_AGP  = $0004,  // surface in system memory tagged as AGP accessible
    KS_CAPTURE_ALLOC_VRAM_MAPPED = $0008   // surface in system memory mapped into VRAM address space
  );

const
  //
  //Video memory capture KSPROPSETID
  //
  KSPROPSETID_VramCapture : TGUID = '{E73FACE3-2880-4902-B799-88D0CD634E0F}';

type

  PKSPROPERTY_VIDMEM_TRANSPORT = ^KSPROPERTY_VIDMEM_TRANSPORT;
  KSPROPERTY_VIDMEM_TRANSPORT = (
    //
    // enum value '0' means an invalid KSPROPERTY request.
    // Drivers should return an error.
    //
    KSPROPERTY_DISPLAY_ADAPTER_GUID               = 1, //Returns the Adapter GUID.
    KSPROPERTY_PREFERRED_CAPTURE_SURFACE          = 2, //Returns the memory surface preferred by that pin
    KSPROPERTY_CURRENT_CAPTURE_SURFACE            = 3, //Sets/Gets currently selected capture surface
    KSPROPERTY_MAP_CAPTURE_HANDLE_TO_VRAM_ADDRESS = 4  //Maps VRAM surface handle to VRAM physical address
  );

  //
  //Surface info passed on to the mini driver.
  //
  PVRAM_SURFACE_INFO = ^VRAM_SURFACE_INFO;
  VRAM_SURFACE_INFO = record
    hSurface: UINT_PTR;
    VramPhysicalAddress: LONGLONG;
    cbCaptured: DWORD;
    dwWidth: DWORD;
    dwHeight: DWORD;
    dwLinearSize: DWORD;
    lPitch: LONG;
    ullReserved: array[0..15] of ULONGLONG;
  end;

  PVRAM_SURFACE_INFO_PROPERTY_S = ^VRAM_SURFACE_INFO_PROPERTY_S;
  VRAM_SURFACE_INFO_PROPERTY_S = record
    _Property: KSPROPERTY;
    pVramSurfaceInfo: PVRAM_SURFACE_INFO;
  end;


  // Secure buffer info passed on to the mini driver.
  // ================================================
  PSECURE_BUFFER_INFO = ^SECURE_BUFFER_INFO;
  SECURE_BUFFER_INFO = record
    guidBufferIdentifier: TGUID;
    cbBufferSize: DWORD;
    cbCaptured: DWORD;
    ullReserved: array[0..15] of ULONGLONG;
  end;

const

  // Sceanrio ID for secure buffer for camera
  KS_SECURE_CAMERA_SCENARIO_ID : TGUID = '{AE53FC6E-8D89-4488-9D2E-4D008731C5FD}';

  KSPROPSETID_MPEG4_MediaType_Attributes : TGUID = '{FF6C4BFA-07A9-4c7b-A237-672F9D68065F}';


type

  PKSPROPERTY_MPEG4_MEDIATYPE_ATTRIBUTES = ^KSPROPERTY_MPEG4_MEDIATYPE_ATTRIBUTES;
  KSPROPERTY_MPEG4_MEDIATYPE_ATTRIBUTES = (
    KSPROPERTY_MPEG4_MEDIATYPE_SD_BOX = 1);

const

  KSEVENTSETID_DynamicFormatChange : TGUID = '{162AC456-83D7-4239-96DF-C75FFA138BC6}';


type

  PKSEVENT_DYNAMICFORMATCHANGE = ^KSEVENT_DYNAMICFORMATCHANGE;
  KSEVENT_DYNAMICFORMATCHANGE     = (
    KSEVENT_DYNAMIC_FORMAT_CHANGE = 0
  );

const
  { 10.0.28000.0  }
  KSATTRIBUTEID_VIDEOFORMAT_DX12 : TGUID = '{FC9D87B5-0B02-438E-89B0-E241FCE889AD}';

type
  PVIDEOFORMAT_DX12 = ^VIDEOFORMAT_DX12;
  VIDEOFORMAT_DX12 = record
    Header: KSATTRIBUTE;
    resourceLayout: ULONG; // D3D12_TEXTURE_LAYOUT
    resourceFlags: ULONG;  // D3D12_RESOURCE_FLAGS
    customLayout: TGUID;
  end;


  //===========================================================================
  // KSSTREAM_HEADER extensions for digital video
  //===========================================================================
const

  KS_VIDEO_FLAG_FIELD_MASK  = $0003;  // Frame or Field (default is frame)
  KS_VIDEO_FLAG_FRAME       = $0000;  // Frame or Field (default is frame)
  KS_VIDEO_FLAG_FIELD1      = $0001;
  KS_VIDEO_FLAG_FIELD2      = $0002;
  KS_VIDEO_FLAG_FIELD1FIRST = $0004;
  KS_VIDEO_FLAG_WEAVE       = $0008;

  KS_VIDEO_FLAG_IPB_MASK     = $0030;  // I, B, or P (default is I)
  KS_VIDEO_FLAG_I_FRAME      = $0000;  // I, B, or P (default is I)
  KS_VIDEO_FLAG_P_FRAME      = $0010;
  KS_VIDEO_FLAG_B_FRAME      = $0020;
  KS_VIDEO_FLAG_REPEAT_FIELD = $0040;


type

  PKS_FRAME_INFO = ^tagKS_FRAME_INFO;
  tagKS_FRAME_INFO = record
    ExtendedHeaderSize: ULONG;
    dwFrameFlags: DWORD;
    PictureNumber: LONGLONG;
    DropCount: LONGLONG;
    hDirectDraw: THandle;
    hSurfaceHandle: THandle;
    DirectDrawRect: TRECT;
    case Integer of
      0: (lSurfacePitch: LONG;
          Reserved2: DWORD;
          Reserved3: DWORD;
          Reserved4: DWORD);
      1: (Reserved1: DWORD);
      2: (_PitchPadding: DWORD;
          _Reserved2Padding: DWORD;
          FrameCompletionNumber: ULONGLONG);
  end;
  KS_FRAME_INFO = tagKS_FRAME_INFO;


  //===========================================================================
  // KSSTREAM_HEADER extensions for VBI
  //===========================================================================
const

  KS_VBI_FLAG_FRAME                = $0000; // Frame or Field (default is frame)
  KS_VBI_FLAG_FIELD1               = $0001;
  KS_VBI_FLAG_FIELD2               = $0002;


  KS_VBI_FLAG_MV_PRESENT           = $0100;
  KS_VBI_FLAG_MV_HARDWARE          = $0200;
  KS_VBI_FLAG_MV_DETECTED          = $0400;


  KS_VBI_FLAG_TVTUNER_CHANGE       = $0010; // TvTunerChangeInfo is valid
  KS_VBI_FLAG_VBIINFOHEADER_CHANGE = $0020; // VBIInfoHeader is valid


type

  PKS_VBI_FRAME_INFO = ^KS_VBI_FRAME_INFO;
  tagKS_VBI_FRAME_INFO = record
    ExtendedHeaderSize  : ULONG; // Size of this extended header
    dwFrameFlags        : DWORD; // Field1, Field2, or Frame; & etc
    PictureNumber       : LONGLONG; // Test only?
    DropCount           : LONGLONG; // Test only?
    dwSamplingFrequency : DWORD;
    TvTunerChangeInfo   : KS_TVTUNER_CHANGE_INFO;
    VBIInfoHeader       : KS_VBIINFOHEADER;
  end;
  KS_VBI_FRAME_INFO = tagKS_VBI_FRAME_INFO;


//===========================================================================
// Analog video formats, used with:
//      Analog Video Decoders
//      TVTuners
//      Analog Video Encoders
//
// XXX_STANDARDS_SUPPORTED returns a bitmask
//===========================================================================
const
  KS_AnalogVideo_None        = $00000000; // This is a digital sensor
  KS_AnalogVideo_NTSC_M      = $00000001; //        75 IRE Setup
  KS_AnalogVideo_NTSC_M_J    = $00000002; // Japan,  0 IRE Setup
  KS_AnalogVideo_NTSC_433    = $00000004;
  KS_AnalogVideo_PAL_B       = $00000010;
  KS_AnalogVideo_PAL_D       = $00000020;
  KS_AnalogVideo_PAL_G       = $00000040;
  KS_AnalogVideo_PAL_H       = $00000080;
  KS_AnalogVideo_PAL_I       = $00000100;
  KS_AnalogVideo_PAL_M       = $00000200;
  KS_AnalogVideo_PAL_N       = $00000400;
  KS_AnalogVideo_PAL_60      = $00000800;
  KS_AnalogVideo_SECAM_B     = $00001000;
  KS_AnalogVideo_SECAM_D     = $00002000;
  KS_AnalogVideo_SECAM_G     = $00004000;
  KS_AnalogVideo_SECAM_H     = $00008000;
  KS_AnalogVideo_SECAM_K     = $00010000;
  KS_AnalogVideo_SECAM_K1    = $00020000;
  KS_AnalogVideo_SECAM_L     = $00040000;
  KS_AnalogVideo_SECAM_L1    = $00080000;
  KS_AnalogVideo_PAL_N_COMBO = $00100000;


  KS_AnalogVideo_NTSC_Mask  = $00000007;
  KS_AnalogVideo_PAL_Mask   = $00100FF0;
  KS_AnalogVideo_SECAM_Mask = $000FF000;


  //===========================================================================
  // Property set definitions
  // The comments show whether a given property is:
  //      R  : READ only
  //      w  : WRITE only
  //      RW : READ / WRITE
  //      O  : Optional (return E_UNSUPPORTED if you don't handle this)
  //===========================================================================

  PROPSETID_ALLOCATOR_CONTROL : TGUID = '{53171960-148E-11d2-9979-0000C0CC16BA}';


type

  PKSPROPERTY_ALLOCATOR_CONTROL = ^KSPROPERTY_ALLOCATOR_CONTROL;
  KSPROPERTY_ALLOCATOR_CONTROL = (
    KSPROPERTY_ALLOCATOR_CONTROL_HONOR_COUNT,   // R O (will allocate exactly this number of buffers)
    KSPROPERTY_ALLOCATOR_CONTROL_SURFACE_SIZE,  // R O (return 2 DWORDs specifying surface size)

// NTDDI_VERSION >= NTDDI_WINXP
    // W I (informn a capture driver whether interleave capture is possible or
    //      not - a value of 1 means that interleaved capture is supported)
    KSPROPERTY_ALLOCATOR_CONTROL_CAPTURE_CAPS,
    // R O (if value = 1, then the ovmixer will turn on the DDVP_INTERLEAVE
    //      flag thus allowing interleaved capture of the video)
    KSPROPERTY_ALLOCATOR_CONTROL_CAPTURE_INTERLEAVE
// end TDDI_VERSION >= NTDDI_WINXP
  );


  PKSPROPERTY_ALLOCATOR_CONTROL_SURFACE_SIZE_S = ^KSPROPERTY_ALLOCATOR_CONTROL_SURFACE_SIZE_S;
  KSPROPERTY_ALLOCATOR_CONTROL_SURFACE_SIZE_S = record
    //KSPROPERTY Property;
    CX: ULONG;
    CY: ULONG;
  end;


  PKSPROPERTY_ALLOCATOR_CONTROL_CAPTURE_CAPS_S = ^KSPROPERTY_ALLOCATOR_CONTROL_CAPTURE_CAPS_S;
  KSPROPERTY_ALLOCATOR_CONTROL_CAPTURE_CAPS_S = record
    //KSPROPERTY Property;
    InterleavedCapSupported: ULONG;
  end;

  PKSPROPERTY_ALLOCATOR_CONTROL_CAPTURE_INTERLEAVE_S = ^KSPROPERTY_ALLOCATOR_CONTROL_CAPTURE_INTERLEAVE_S;
  KSPROPERTY_ALLOCATOR_CONTROL_CAPTURE_INTERLEAVE_S = record
    //KSPROPERTY Property;
    InterleavedCapPossible: ULONG;
  end;


  //===========================================================================

const

  PROPSETID_VIDCAP_VIDEOPROCAMP : TGUID = '{C6E13360-30AC-11d0-A18C-00A0C9118956}';


type

  PKSPROPERTY_VIDCAP_VIDEOPROCAMP = ^KSPROPERTY_VIDCAP_VIDEOPROCAMP;
  KSPROPERTY_VIDCAP_VIDEOPROCAMP = (
    KSPROPERTY_VIDEOPROCAMP_BRIGHTNESS,              // RW O
    KSPROPERTY_VIDEOPROCAMP_CONTRAST,                // RW O
    KSPROPERTY_VIDEOPROCAMP_HUE,                     // RW O
    KSPROPERTY_VIDEOPROCAMP_SATURATION,              // RW O
    KSPROPERTY_VIDEOPROCAMP_SHARPNESS,               // RW O
    KSPROPERTY_VIDEOPROCAMP_GAMMA,                   // RW O
    KSPROPERTY_VIDEOPROCAMP_COLORENABLE,             // RW O
    KSPROPERTY_VIDEOPROCAMP_WHITEBALANCE,            // RW O
    KSPROPERTY_VIDEOPROCAMP_BACKLIGHT_COMPENSATION,  // RW O
    KSPROPERTY_VIDEOPROCAMP_GAIN,                    // RW O
    // With the introduction of the USB Video Class Driver (Windows XP SP2),
    // the following properties were added to the KSPROPERTY_VIDCAP_VIDEOPROCAMP enumeration:
    KSPROPERTY_VIDEOPROCAMP_DIGITAL_MULTIPLIER,      // RW O
    KSPROPERTY_VIDEOPROCAMP_DIGITAL_MULTIPLIER_LIMIT,// RW O
    KSPROPERTY_VIDEOPROCAMP_WHITEBALANCE_COMPONENT,  // RW O
    KSPROPERTY_VIDEOPROCAMP_POWERLINE_FREQUENCY      // RW O
  );

  PKSPROPERTY_VIDEOPROCAMP_S = ^KSPROPERTY_VIDEOPROCAMP_S;
  KSPROPERTY_VIDEOPROCAMP_S = record
    Property_    : KSPROPERTY;
    Value        : longint;     // Value to set or get
    Flags        : ULONG;       // KSPROPERTY_VIDEOPROCAMP_FLAGS_*
    Capabilities : ULONG;       // KSPROPERTY_VIDEOPROCAMP_FLAGS_*
  end;

  PKSPROPERTY_VIDEOPROCAMP_NODE_S = ^KSPROPERTY_VIDEOPROCAMP_NODE_S;
  KSPROPERTY_VIDEOPROCAMP_NODE_S = record
    NodeProperty: KSP_NODE;
    Value: LONG;                        // Value to set or get
    Flags: ULONG;                       // KSPROPERTY_VIDEOPROCAMP_FLAGS_*
    Capabilities: ULONG;                // KSPROPERTY_VIDEOPROCAMP_FLAGS_*
  end;

  PKSPROPERTY_VIDEOPROCAMP_S2 = ^KSPROPERTY_VIDEOPROCAMP_S2;
  KSPROPERTY_VIDEOPROCAMP_S2 = record
    Property_: KSPROPERTY;
    Value1: LONG;
    Flags: ULONG;
    Capabilities: ULONG;
    Value2: LONG;
  end;

  PKSPROPERTY_VIDEOPROCAMP_NODE_S2 = ^KSPROPERTY_VIDEOPROCAMP_NODE_S2;
  KSPROPERTY_VIDEOPROCAMP_NODE_S2 = record
    NodeProperty: KSP_NODE;
    Value1: LONG;
    Flags: ULONG;
    Capabilities: ULONG;
    Value2: LONG;
  end;


const

  KSPROPERTY_VIDEOPROCAMP_FLAGS_AUTO   = $0001;
  KSPROPERTY_VIDEOPROCAMP_FLAGS_MANUAL = $0002;


  //===========================================================================

  PROPSETID_VIDCAP_SELECTOR : TGUID = '{1ABDAECA-68B6-4F83-9371-B413907C7B9F}';


type

  PKSPROPERTY_VIDCAP_SELECTOR = ^KSPROPERTY_VIDCAP_SELECTOR;
  KSPROPERTY_VIDCAP_SELECTOR = (
    KSPROPERTY_SELECTOR_SOURCE_NODE_ID,              // RW
    KSPROPERTY_SELECTOR_NUM_SOURCES                  // R
  );


  PKSPROPERTY_SELECTOR_S = ^KSPROPERTY_SELECTOR_S;
  KSPROPERTY_SELECTOR_S = record
    Property_: KSPROPERTY;
    Value: LONG;                        // Value to set or get
    Flags: ULONG;
    Capabilities: ULONG;
  end;


  PKSPROPERTY_SELECTOR_NODE_S = ^KSPROPERTY_SELECTOR_NODE_S;
  KSPROPERTY_SELECTOR_NODE_S = record
    NodeProperty: KSP_NODE;
    Value: Integer;                        // Value to set or get
    Flags: ULONG;
    Capabilities: ULONG;
  end;


//===========================================================================

const

  PROPSETID_TUNER : TGUID = '{6a2e0605-28e4-11d0-a18c-00a0c9118956}';


type

  PKSPropertyTuner = ^KSPROPERTY_TUNER;
  KSPROPERTY_TUNER = (
    KSPROPERTY_TUNER_CAPS,              // R  -overall device capabilities
    KSPROPERTY_TUNER_MODE_CAPS,         // R  -capabilities in this mode
    KSPROPERTY_TUNER_MODE,              // RW -set a mode (TV, FM, AM, DSS)
    KSPROPERTY_TUNER_STANDARD,          // R  -get TV standard (only if TV mode)
    KSPROPERTY_TUNER_FREQUENCY,         // RW -set/get frequency
    KSPROPERTY_TUNER_INPUT,             // RW -select an input
    KSPROPERTY_TUNER_STATUS,            // R  -tuning status
    KSPROPERTY_TUNER_IF_MEDIUM          // R O-Medium for IF or Transport Pin
  );
  TKSPropertyTuner = KSPROPERTY_TUNER;

  //
  // Tuning support definitions and interfaces
  //

  // Definitions

  PKSPROPERTY_TUNER_MODES = ^KSPROPERTY_TUNER_MODES;
  KSPROPERTY_TUNER_MODES           = (
    KSPROPERTY_TUNER_MODE_TV       = $0001,
    KSPROPERTY_TUNER_MODE_FM_RADIO = $0002,
    KSPROPERTY_TUNER_MODE_AM_RADIO = $0004,
    KSPROPERTY_TUNER_MODE_DSS      = $0008,
    KSPROPERTY_TUNER_MODE_ATSC     = $0010    // also used for DVB-T, DVB-C
  );
  // Describes how the device tunes.  Only one of these flags may be set
  // in KSPROPERTY_TUNER_MODE_CAPS_S.Strategy

  // Describe how the driver should attempt to tune:
  // EXACT:   just go to the frequency specified (no fine tuning)
  // FINE:    (slow) do an exhaustive search for the best signal
  // COARSE:  (fast) use larger frequency jumps to just determine if any signal

  PKS_TUNER_TUNING_FLAGS = ^KS_TUNER_TUNING_FLAGS;
  KS_TUNER_TUNING_FLAGS   = (
    KS_TUNER_TUNING_EXACT = 1,      // No fine tuning
    KS_TUNER_TUNING_FINE,           // Fine grained search
    KS_TUNER_TUNING_COARSE          // Coarse search
  );

  PKS_TUNER_STRATEGY = ^KS_TUNER_STRATEGY;
  KS_TUNER_STRATEGY                   = (
    KS_TUNER_STRATEGY_PLL             = $01,    // Tune by PLL offset
    KS_TUNER_STRATEGY_SIGNAL_STRENGTH = $02,    // Tune by signal strength
    KS_TUNER_STRATEGY_DRIVER_TUNES    = $04     // Driver does fine tuning
  );

  // Tuning operations

  PKSPROPERTY_TUNER_CAPS_S = ^KSPROPERTY_TUNER_CAPS_S;
  KSPROPERTY_TUNER_CAPS_S = record
    _Property: KSPROPERTY;
    ModesSupported: ULONG;            // KS_PROPERTY_TUNER_MODES_*
    VideoMedium: KSPIN_MEDIUM;        // GUID_NULL (no pin), or GUID
    TVAudioMedium: KSPIN_MEDIUM;      // GUID_NULL (no pin), or GUID
    RadioAudioMedium: KSPIN_MEDIUM;   // GUID_NULL (no pin), or GUID
  end;

  PKSPROPERTY_TUNER_IF_MEDIUM_S = ^KSPROPERTY_TUNER_IF_MEDIUM_S;
  KSPROPERTY_TUNER_IF_MEDIUM_S = record
    _Property: KSPROPERTY;
    IFMedium: KSPIN_MEDIUM;         // GUID_NULL (no pin), or GUID
  end;

  PKSPROPERTY_TUNER_MODE_CAPS_S = ^KSPROPERTY_TUNER_MODE_CAPS_S;
  KSPROPERTY_TUNER_MODE_CAPS_S = record
    _Property: KSPROPERTY;
    Mode: ULONG;                     // IN: KSPROPERTY_TUNER_MODE
    StandardsSupported: ULONG;       // KS_AnalogVideo_* (if TV or DSS)
    MinFrequency: ULONG;             // Hz
    MaxFrequency: ULONG;             // Hz
    TuningGranularity: ULONG;        // Hz
    NumberOfInputs: ULONG;           // count of inputs
    SettlingTime: ULONG;             // milliSeconds
    Strategy: ULONG;                 // KS_TUNER_STRATEGY
  end;

  PKSPROPERTY_TUNER_MODE_S = ^KSPROPERTY_TUNER_MODE_S;
  KSPROPERTY_TUNER_MODE_S = record
    Property_ : KSPROPERTY;
    Mode      : ULONG;      // IN: KSPROPERTY_TUNER_MODE
  end;

  PKSPROPERTY_TUNER_FREQUENCY_S = ^KSPROPERTY_TUNER_FREQUENCY_S;
  KSPROPERTY_TUNER_FREQUENCY_S = record
    Property_       : KSPROPERTY;
    Frequency       : ULONG; // Hz
    LastFrequency   : ULONG; // Hz (last known good)
    TuningFlags     : ULONG; // KS_TUNER_TUNING_FLAGS
    VideoSubChannel : ULONG; // DSS
    AudioSubChannel : ULONG; // DSS
    Channel         : ULONG; // VBI decoders
    Country         : ULONG; // VBI decoders
  end;

  PKSPROPERTY_TUNER_STANDARD_S = ^KSPROPERTY_TUNER_STANDARD_S;
  KSPROPERTY_TUNER_STANDARD_S = record
    Property_ : KSPROPERTY;
    Standard  : ULONG;      // KS_AnalogVideo_*
  end;

  PKSPROPERTY_TUNER_INPUT_S = ^KSPROPERTY_TUNER_INPUT_S;
  KSPROPERTY_TUNER_INPUT_S = record
    Property_  : KSPROPERTY;
    InputIndex : ULONG;  // 0 to (n-1) inputs
  end;

 PKSPROPERTY_TUNER_STATUS_S = ^KSPROPERTY_TUNER_STATUS_S;
 KSPROPERTY_TUNER_STATUS_S = record
    Property_        : KSPROPERTY;
    CurrentFrequency : ULONG; // Hz
    PLLOffset        : ULONG; // if Strategy.KS_TUNER_STRATEGY_PLL
    SignalStrength   : ULONG; // if Stretegy.KS_TUNER_STRATEGY_SIGNAL_STRENGTH
    Busy             : ULONG; // TRUE if in the process of tuning
  end;

  //
  // Exhaustive Scanning tuner support definitions and interfaces
  //

  // Definitions

  PTunerLockType = ^_TunerDecoderLockType;
  _TunerDecoderLockType                      = (
    Tuner_LockType_None                      = $00,      // Not locked on a signal. Can be returned at end of scan.
    Tuner_LockType_Within_Scan_Sensing_Range = $01,      // Signal is near by, not able to report exact frequency. Can be returned at end of scan.
    Tuner_LockType_Locked                    = $02       // Fine tune signal lock established. Can be returned at end of scan.
  );
  TunerLockType = _TunerDecoderLockType;

  // Data structures returned for KSPROPERTY_TUNER_NETWORKTYPE_SCAN_CAPS_S operations

  PTUNER_ANALOG_CAPS_S = ^TUNER_ANALOG_CAPS_S;
  TUNER_ANALOG_CAPS_S = record
    Mode: ULONG;                     // IN -KSPROPERTY_TUNER_MODE
    StandardsSupported: ULONG;       // KS_AnalogVideo_* (defined in KS_AnalogVideoStandard)
    MinFrequency: ULONG;             // R -Hz
    MaxFrequency: ULONG;             // R -Hz
    TuningGranularity: ULONG;        // R -Hz
    SettlingTime: ULONG;             // R -milliSeconds
    ScanSensingRange: ULONG;         // R -max range (Hz) in which tuner can detect presence of a signal
    FineTuneSensingRange: ULONG;     // R -max range (Hz) in which tuner can detect actual frequency of a signal
  end;

  // ...
  // More to come if new structures are needed for different network types.



const

  EVENTSETID_TUNER : TGUID = '{6a2e0606-28e4-11d0-a18c-00a0c9118956}';


type

  PKSEVENT_TUNER = ^KSEVENT_TUNER;
  KSEVENT_TUNER = (
    KSEVENT_TUNER_CHANGED,
    KSEVENT_TUNER_INITIATE_SCAN      // initiate frequency scan
  );

  // Exhaustive Scanning operations


  // Determine if ES is possible with device
  PKSPROPERTY_TUNER_SCAN_CAPS_S = ^KSPROPERTY_TUNER_SCAN_CAPS_S;
  KSPROPERTY_TUNER_SCAN_CAPS_S = record
    _Property: KSPROPERTY;
    fSupportsHardwareAssistedScanning: BOOL;  // R
    SupportedBroadcastStandards: ULONG;       // R
    GUIDBucket: Pointer;                      // RW
    lengthofBucket: ULONG;                    // R
  end;

  // Get specific network type capabilities structure (such as TUNER_ANALOG_CAPS_S for example)
  PKSPROPERTY_TUNER_NETWORKTYPE_SCAN_CAPS_S = ^KSPROPERTY_TUNER_NETWORKTYPE_SCAN_CAPS_S;
  KSPROPERTY_TUNER_NETWORKTYPE_SCAN_CAPS_S = record
    _Property: KSPROPERTY;
    NetworkType: TGUID;                  // R  -one of the interested GUIDs returned in KSPROPERTY_TUNER_SCAN_CAPS_S
    BufferSize: ULONG;                   // R  -size of the buffer;
    NetworkTunerCapabilities: Pointer;  // RW -Buffer
  end;

  // Obtain current scan operation status
  PKSPROPERTY_TUNER_SCAN_STATUS_S = ^KSPROPERTY_TUNER_SCAN_STATUS_S;
  KSPROPERTY_TUNER_SCAN_STATUS_S = record
    _Property: KSPROPERTY;
    LockStatus: TunerLockType;      // R -none, within scan sensing range, or locked
    CurrentFrequency: ULONG;        // R -current frequency
  end;

  // Start a scan
  PKSEVENT_TUNER_INITIATE_SCAN_S = ^KSEVENT_TUNER_INITIATE_SCAN_S;
  KSEVENT_TUNER_INITIATE_SCAN_S = record
    EventData: KSEVENTDATA;
    StartFrequency: ULONG;          // W -initial frequency for the scan
    EndFrequency: ULONG;            // W -final frequency for the scan
  end;

  //
  // Kernel Streaming Video node type definitions
  //

  //===========================================================================
  // USB Video Class Definitions
const

  KSNODETYPE_VIDEO_STREAMING       : TGUID = '{DFF229E1-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_VIDEO_INPUT_TERMINAL  : TGUID = '{DFF229E2-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_VIDEO_OUTPUT_TERMINAL : TGUID = '{DFF229E3-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_VIDEO_SELECTOR        : TGUID = '{DFF229E4-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_VIDEO_PROCESSING      : TGUID = '{DFF229E5-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_VIDEO_CAMERA_TERMINAL : TGUID = '{DFF229E6-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_VIDEO_INPUT_MTT       : TGUID = '{DFF229E7-F70F-11D0-B917-00A0C9223196}';
  KSNODETYPE_VIDEO_OUTPUT_MTT      : TGUID = '{DFF229E8-F70F-11D0-B917-00A0C9223196}';

//===========================================================================

const

  PROPSETID_VIDCAP_VIDEOENCODER : TGUID = '{6a2e0610-28e4-11d0-a18c-00a0c9118956}';


type
  PKSPROPERTY_VIDCAP_VIDEOENCODER = ^KSPROPERTY_VIDCAP_VIDEOENCODER;
  KSPROPERTY_VIDCAP_VIDEOENCODER = (
    KSPROPERTY_VIDEOENCODER_CAPS,                       // R
    KSPROPERTY_VIDEOENCODER_STANDARD,                   // RW
    KSPROPERTY_VIDEOENCODER_COPYPROTECTION,             // RW O
    KSPROPERTY_VIDEOENCODER_CC_ENABLE                   // RW O
  );

  PKSPROPERTY_VIDEOENCODER_S = ^KSPROPERTY_VIDEOENCODER_S;
  KSPROPERTY_VIDEOENCODER_S = record
    Property_    : KSPROPERTY;
    Value        : longint;    // value to get or set
    Flags        : ULONG;      //
    Capabilities : ULONG;      //
  end;

//===========================================================================
const

  PROPSETID_VIDCAP_VIDEODECODER : TGUID = '{C6E13350-30AC-11d0-A18C-00A0C9118956}';


type
  PKSPROPERTY_VIDCAP_VIDEODECODER = ^KSPROPERTY_VIDCAP_VIDEODECODER;
  KSPROPERTY_VIDCAP_VIDEODECODER = (
    KSPROPERTY_VIDEODECODER_CAPS,                       // R
    KSPROPERTY_VIDEODECODER_STANDARD,                   // RW
    KSPROPERTY_VIDEODECODER_STATUS,                     // R
    KSPROPERTY_VIDEODECODER_OUTPUT_ENABLE,              // Rw O
    KSPROPERTY_VIDEODECODER_VCR_TIMING,                 // RW O
    KSPROPERTY_VIDEODECODER_STATUS2                     // R
  );

  PKS_VIDEODECODER_FLAGS = ^KS_VIDEODECODER_FLAGS;
  KS_VIDEODECODER_FLAGS                       = (
    KS_VIDEODECODER_FLAGS_CAN_DISABLE_OUTPUT  = $0001,  // VP Output can tri-stae
    KS_VIDEODECODER_FLAGS_CAN_USE_VCR_LOCKING = $0002,  // VCR PLL timings
    KS_VIDEODECODER_FLAGS_CAN_INDICATE_LOCKED = $0004   // Can indicate valid signal
  );

type

  PKSPROPERTY_VIDEODECODER_CAPS_S = ^KSPROPERTY_VIDEODECODER_CAPS_S;
  KSPROPERTY_VIDEODECODER_CAPS_S = record
    Property_          : KSPROPERTY;
    StandardsSupported : ULONG;      // KS_AnalogVideo_*
    Capabilities       : ULONG;      // KS_VIDEODECODER_FLAGS_*
    SettlingTime       : ULONG;      // milliseconds
    HSyncPerVSync      : ULONG;      // Number of HSync Pulses per VSync
  end;

  PKSPROPERTY_VIDEODECODER_STATUS_S = ^KSPROPERTY_VIDEODECODER_STATUS_S;
  KSPROPERTY_VIDEODECODER_STATUS_S = record
    Property_     : KSPROPERTY;
    NumberOfLines : ULONG;           // 525 or 625 lines detected
    SignalLocked  : ULONG;           // TRUE if signal is locked
  end;

  PKSPROPERTY_VIDEODECODER_S = ^KSPROPERTY_VIDEODECODER_S;
  KSPROPERTY_VIDEODECODER_S = record
    Property_ : KSPROPERTY;
    Value     : ULONG;      // Get or set a value
  end;


const
  EVENTSETID_VIDEODECODER : TGUID = '{6a2e0621-28e4-11d0-a18c-00a0c9118956}';


type
  PKSEVENT_VIDEODECODER = ^KSEVENT_VIDEODECODER;
  KSEVENT_VIDEODECODER = (
    KSEVENT_VIDEODECODER_CHANGED);

//===========================================================================
const

  PROPSETID_VIDCAP_CAMERACONTROL : TGUID = '{C6E13370-30AC-11d0-A18C-00A0C9118956}';


type

  PKSPROPERTY_VIDCAP_CAMERACONTROL = ^KSPROPERTY_VIDCAP_CAMERACONTROL;
  KSPROPERTY_VIDCAP_CAMERACONTROL = (
    KSPROPERTY_CAMERACONTROL_PAN,                       // RW O
    KSPROPERTY_CAMERACONTROL_TILT,                      // RW O
    KSPROPERTY_CAMERACONTROL_ROLL,                      // RW O
    KSPROPERTY_CAMERACONTROL_ZOOM,                      // RW O
    KSPROPERTY_CAMERACONTROL_EXPOSURE,                  // RW O
    KSPROPERTY_CAMERACONTROL_IRIS,                      // RW O
    KSPROPERTY_CAMERACONTROL_FOCUS,                     // RW O
    KSPROPERTY_CAMERACONTROL_SCANMODE,                  // RW O
    KSPROPERTY_CAMERACONTROL_PRIVACY,                   // RW O
    KSPROPERTY_CAMERACONTROL_PANTILT,                   // RW O
    KSPROPERTY_CAMERACONTROL_PAN_RELATIVE,              // RW O
    KSPROPERTY_CAMERACONTROL_TILT_RELATIVE,             // RW O
    KSPROPERTY_CAMERACONTROL_ROLL_RELATIVE,             // RW O
    KSPROPERTY_CAMERACONTROL_ZOOM_RELATIVE,             // RW O
    KSPROPERTY_CAMERACONTROL_EXPOSURE_RELATIVE,         // RW O
    KSPROPERTY_CAMERACONTROL_IRIS_RELATIVE,             // RW O
    KSPROPERTY_CAMERACONTROL_FOCUS_RELATIVE,            // RW O
    KSPROPERTY_CAMERACONTROL_PANTILT_RELATIVE,          // RW O
    KSPROPERTY_CAMERACONTROL_FOCAL_LENGTH,              // R  O
    KSPROPERTY_CAMERACONTROL_AUTO_EXPOSURE_PRIORITY     // RW O
  );


  // >= Win 8
  PKS_CameraControlAsyncOperation = ^KS_CameraControlAsyncOperation;
  KS_CameraControlAsyncOperation = (
    KS_CAMERACONTROL_ASYNC_START = $0001,
    KS_CAMERACONTROL_ASYNC_STOP  = $0002,
    KS_CAMERACONTROL_ASYNC_RESET = $0003
  );

  PKSPROPERTY_CAMERACONTROL_S_EX = ^KSPROPERTY_CAMERACONTROL_S_EX;
  KSPROPERTY_CAMERACONTROL_S_EX = record
    _Property: KSPROPERTY;
    Value: LONG;                     // value to get or set
    Flags: ULONG;                    // KSPROPERTY_CAMERACONTROL_FLAGS_*
    Capabilities: ULONG;             // KSPROPERTY_CAMERACONTROL_FLAGS_*
    FocusRect: TRECT;
  end;
  // END >= Win 8


  PKSPROPERTY_CAMERACONTROL_S = ^KSPROPERTY_CAMERACONTROL_S;
  KSPROPERTY_CAMERACONTROL_S = record
    Property_    : KSPROPERTY;
    Value        : LONG;       // value to get or set
    Flags        : ULONG;      // KSPROPERTY_CAMERACONTROL_FLAGS_*
    Capabilities : ULONG;      // KSPROPERTY_CAMERACONTROL_FLAGS_*
  end;

const

  KSPROPERTY_CAMERACONTROL_FLAGS_AUTO         = $0001;
  KSPROPERTY_CAMERACONTROL_FLAGS_MANUAL       = $0002;
  // >= Win 8
  KSPROPERTY_CAMERACONTROL_FLAGS_ASYNCHRONOUS = $0004;
  // END >= Win 8
  KSPROPERTY_CAMERACONTROL_FLAGS_ABSOLUTE     = $0000;
  KSPROPERTY_CAMERACONTROL_FLAGS_RELATIVE     = $0010;


type

  PKSPROPERTY_CAMERACONTROL_NODE_S = ^KSPROPERTY_CAMERACONTROL_NODE_S;
  KSPROPERTY_CAMERACONTROL_NODE_S = record
    NodeProperty: KSP_NODE;
    Value: LONG;                        // value to get or set
    Flags: ULONG;                       // KSPROPERTY_CAMERACONTROL_FLAGS_*
    Capabilities: ULONG;                // KSPROPERTY_CAMERACONTROL_FLAGS_*
  end;

  PKSPROPERTY_CAMERACONTROL_S2 = ^KSPROPERTY_CAMERACONTROL_S2;
  KSPROPERTY_CAMERACONTROL_S2 = record
    Property_: KSPROPERTY;
    Value1: Integer;
    Flags: ULONG;
    Capabilities: ULONG;
    Value2: Integer;
  end;

  PKSPROPERTY_CAMERACONTROL_NODE_S2 = ^KSPROPERTY_CAMERACONTROL_NODE_S2;
  KSPROPERTY_CAMERACONTROL_NODE_S2 = record
    NodeProperty: KSP_NODE ;
    Value1: Integer;
    Flags: ULONG;
    Capabilities: ULONG;
    Value2: Integer;
  end;

  PKSPROPERTY_CAMERACONTROL_FOCAL_LENGTH_S = ^KSPROPERTY_CAMERACONTROL_FOCAL_LENGTH_S;
  KSPROPERTY_CAMERACONTROL_FOCAL_LENGTH_S = record
    Property_: KSPROPERTY;
    lOcularFocalLength: Integer;
    lObjectiveFocalLengthMin: Integer;
    lObjectiveFocalLengthMax: Integer;
  end;


  PKSPROPERTY_CAMERACONTROL_NODE_FOCAL_LENGTH_S = ^KSPROPERTY_CAMERACONTROL_NODE_FOCAL_LENGTH_S;
  KSPROPERTY_CAMERACONTROL_NODE_FOCAL_LENGTH_S = record
    NodeProperty: KSNODEPROPERTY;
    lOcularFocalLength: Integer;
    lObjectiveFocalLengthMin: Integer;
    lObjectiveFocalLengthMax: Integer;
  end;


const

  PROPSETID_VIDCAP_CAMERACONTROL_FLASH : TGUID = '{785E8F49-63A2-4144-AB70-FFB278FA26CE}';


type

  PKSPROPERTY_CAMERACONTROL_FLASH = ^KSPROPERTY_CAMERACONTROL_FLASH;
  KSPROPERTY_CAMERACONTROL_FLASH               = (
    KSPROPERTY_CAMERACONTROL_FLASH_PROPERTY_ID = 0);

const

  KSPROPERTY_CAMERACONTROL_FLASH_OFF          = $00000000;
  KSPROPERTY_CAMERACONTROL_FLASH_ON           = $00000001;
  KSPROPERTY_CAMERACONTROL_FLASH_AUTO         = $00000002;

  KSPROPERTY_CAMERACONTROL_FLASH_FLAGS_AUTO   = $00000001;
  KSPROPERTY_CAMERACONTROL_FLASH_FLAGS_MANUAL = $00000002;

type

  PKSPROPERTY_CAMERACONTROL_FLASH_S = ^KSPROPERTY_CAMERACONTROL_FLASH_S;
  KSPROPERTY_CAMERACONTROL_FLASH_S = record
    Flash: ULONG;
    Capabilities: ULONG;
  end;

const

  PROPSETID_VIDCAP_CAMERACONTROL_VIDEO_STABILIZATION : TGUID = '{43964BD3-7716-404e-8BE1-D299B20E50FD}';

type

  PKSPROPERTY_CAMERACONTROL_VIDEO_STABILIZATION_MODE = ^KSPROPERTY_CAMERACONTROL_VIDEO_STABILIZATION_MODE;
  KSPROPERTY_CAMERACONTROL_VIDEO_STABILIZATION_MODE               = (
    KSPROPERTY_CAMERACONTROL_VIDEO_STABILIZATION_MODE_PROPERTY_ID = 0
  );

const

  KSPROPERTY_CAMERACONTROL_VIDEOSTABILIZATION_MODE_OFF    = $00000000;
  KSPROPERTY_CAMERACONTROL_VIDEOSTABILIZATION_MODE_HIGH   = $00000001;
  KSPROPERTY_CAMERACONTROL_VIDEOSTABILIZATION_MODE_MEDIUM = $00000002;
  KSPROPERTY_CAMERACONTROL_VIDEOSTABILIZATION_MODE_LOW    = $00000003;
  KSPROPERTY_CAMERACONTROL_VIDEOSTABILIZATION_MODE_AUTO   = $00000004;

  KSPROPERTY_CAMERACONTROL_VIDEOSTABILIZATION_MODE_FLAGS_AUTO   = $00000001;
  KSPROPERTY_CAMERACONTROL_VIDEOSTABILIZATION_MODE_FLAGS_MANUAL = $00000002;

type

  PKSPROPERTY_CAMERACONTROL_VIDEOSTABILIZATION_MODE_S = ^KSPROPERTY_CAMERACONTROL_VIDEOSTABILIZATION_MODE_S;
  KSPROPERTY_CAMERACONTROL_VIDEOSTABILIZATION_MODE_S = record
    VideoStabilizationMode: ULONG;
    Capabilities: ULONG;
  end;

const

  PROPSETID_VIDCAP_CAMERACONTROL_REGION_OF_INTEREST : TGUID = '{9D12D198-F86C-4fed-B023-5D87653DA793}';

type

  PKSPROPERTY_CAMERACONTROL_REGION_OF_INTEREST = ^KSPROPERTY_CAMERACONTROL_REGION_OF_INTEREST;
  KSPROPERTY_CAMERACONTROL_REGION_OF_INTEREST               = (
    KSPROPERTY_CAMERACONTROL_REGION_OF_INTEREST_PROPERTY_ID = 0
  );

const

  KSPROPERTY_CAMERACONTROL_REGION_OF_INTEREST_FLAGS_AUTO      = $00000001;
  KSPROPERTY_CAMERACONTROL_REGION_OF_INTEREST_FLAGS_MANUAL    = $00000002;
  KSPROPERTY_CAMERACONTROL_REGION_OF_INTEREST_FLAGS_ASYNC     = $80000000;
  KSPROPERTY_CAMERACONTROL_REGION_OF_INTEREST_CONFIG_FOCUS    = $00000100;
  KSPROPERTY_CAMERACONTROL_REGION_OF_INTEREST_CONFIG_EXPOSURE = $00000200;
  KSPROPERTY_CAMERACONTROL_REGION_OF_INTEREST_CONFIG_WB       = $00000400;
  KSPROPERTY_CAMERACONTROL_REGION_OF_INTEREST_CONVERGEMODE    = $40000000;


  EVENTSETID_VIDCAP_CAMERACONTROL_REGION_OF_INTEREST : TGUID = '{2FDFFC5D-C732-4BA6-B5DF-6B4D7FC88B8B}';

type

  PKSPROPERTY_CAMERACONTROL_REGION_OF_INTEREST_S = ^KSPROPERTY_CAMERACONTROL_REGION_OF_INTEREST_S;
  KSPROPERTY_CAMERACONTROL_REGION_OF_INTEREST_S = record
    FocusRect: TRECT;
    AutoFocusLock: BOOL;
    AutoExposureLock: BOOL;
    AutoWhitebalanceLock: BOOL;
    case Integer of
      0: (Capabilities: ULONG);
      1: (Configuration: ULONG);
  end;

const

  PROPSETID_VIDCAP_CAMERACONTROL_IMAGE_PIN_CAPABILITY : TGUID = '{9D3D7BBF-5C6D-4138-BB00-584EDD20F7C5}';

type

  PKSPROPERTY_CAMERACONTROL_IMAGE_PIN_CAPABILITY = ^KSPROPERTY_CAMERACONTROL_IMAGE_PIN_CAPABILITY;
  KSPROPERTY_CAMERACONTROL_IMAGE_PIN_CAPABILITY               = (
    KSPROPERTY_CAMERACONTROL_IMAGE_PIN_CAPABILITY_PROPERTY_ID = 0);

const

  KSPROPERTY_CAMERACONTROL_IMAGE_PIN_CAPABILITY_EXCLUSIVE_WITH_RECORD          = $00000001;
  KSPROPERTY_CAMERACONTROL_IMAGE_PIN_CAPABILITY_SEQUENCE_EXCLUSIVE_WITH_RECORD = $00000002;

type

  PKSPROPERTY_CAMERACONTROL_IMAGE_PIN_CAPABILITY_S = ^KSPROPERTY_CAMERACONTROL_IMAGE_PIN_CAPABILITY_S;
  KSPROPERTY_CAMERACONTROL_IMAGE_PIN_CAPABILITY_S = record
    Capabilities: ULONG;
    Reserved0: ULONG;
  end;


//#if (NTDDI_VERSION >= NTDDI_WIN8)
  PKSPROPERTY_CAMERACONTROL_EXTENDED_PROPERTY = ^KSPROPERTY_CAMERACONTROL_EXTENDED_PROPERTY;
  KSPROPERTY_CAMERACONTROL_EXTENDED_PROPERTY = (
    KSPROPERTY_CAMERACONTROL_EXTENDED_PHOTOMODE = 0,                            // 0
    KSPROPERTY_CAMERACONTROL_EXTENDED_PHOTOFRAMERATE,                           // 1
    KSPROPERTY_CAMERACONTROL_EXTENDED_PHOTOMAXFRAMERATE,                        // 2
    KSPROPERTY_CAMERACONTROL_EXTENDED_PHOTOTRIGGERTIME,                         // 3
    KSPROPERTY_CAMERACONTROL_EXTENDED_WARMSTART,                                // 4
    KSPROPERTY_CAMERACONTROL_EXTENDED_MAXVIDFPS_PHOTORES,                       // 5
    KSPROPERTY_CAMERACONTROL_EXTENDED_PHOTOTHUMBNAIL,                           // 6
    KSPROPERTY_CAMERACONTROL_EXTENDED_SCENEMODE,                                // 7
    KSPROPERTY_CAMERACONTROL_EXTENDED_TORCHMODE,                                // 8
    KSPROPERTY_CAMERACONTROL_EXTENDED_FLASHMODE,                                // 9
    KSPROPERTY_CAMERACONTROL_EXTENDED_OPTIMIZATIONHINT,                         // 10
    KSPROPERTY_CAMERACONTROL_EXTENDED_WHITEBALANCEMODE,                         // 11
    KSPROPERTY_CAMERACONTROL_EXTENDED_EXPOSUREMODE,                             // 12
    KSPROPERTY_CAMERACONTROL_EXTENDED_FOCUSMODE,                                // 13
    KSPROPERTY_CAMERACONTROL_EXTENDED_ISO,                                      // 14
    KSPROPERTY_CAMERACONTROL_EXTENDED_FIELDOFVIEW,                              // 15
    KSPROPERTY_CAMERACONTROL_EXTENDED_EVCOMPENSATION,                           // 16
    KSPROPERTY_CAMERACONTROL_EXTENDED_CAMERAANGLEOFFSET,                        // 17
//#if (NTDDI_VERSION >= NTDDI_WINBLUE)
    KSPROPERTY_CAMERACONTROL_EXTENDED_METADATA,                                 // 18
    KSPROPERTY_CAMERACONTROL_EXTENDED_FOCUSPRIORITY,                            // 19
    KSPROPERTY_CAMERACONTROL_EXTENDED_FOCUSSTATE,                               // 20
    KSPROPERTY_CAMERACONTROL_EXTENDED_ROI_CONFIGCAPS,                           // 21
    KSPROPERTY_CAMERACONTROL_EXTENDED_ROI_ISPCONTROL,                           // 22
    KSPROPERTY_CAMERACONTROL_EXTENDED_PHOTOCONFIRMATION,                        // 23
    KSPROPERTY_CAMERACONTROL_EXTENDED_ZOOM,                                     // 24
    KSPROPERTY_CAMERACONTROL_EXTENDED_MCC,                                      // 25
    KSPROPERTY_CAMERACONTROL_EXTENDED_ISO_ADVANCED,                             // 26
//#endif // (NTDDI_VERSION >= NTDDI_WINBLUE)
//#if (NTDDI_VERSION >= NTDDI_WINTHRESHOLD)
    KSPROPERTY_CAMERACONTROL_EXTENDED_VIDEOSTABILIZATION,                       // 27
    KSPROPERTY_CAMERACONTROL_EXTENDED_VFR,                                      // 28
    KSPROPERTY_CAMERACONTROL_EXTENDED_FACEDETECTION,                            // 29
    KSPROPERTY_CAMERACONTROL_EXTENDED_VIDEOHDR,                                 // 30
    KSPROPERTY_CAMERACONTROL_EXTENDED_HISTOGRAM,                                // 31
    KSPROPERTY_CAMERACONTROL_EXTENDED_OIS,                                      // 32
    KSPROPERTY_CAMERACONTROL_EXTENDED_ADVANCEDPHOTO,                            // 33
    KSPROPERTY_CAMERACONTROL_EXTENDED_PROFILE,                                  // 34
//#endif
//#if (NTDDI_VERSION >= NTDDI_WIN10_RS1)
    KSPROPERTY_CAMERACONTROL_EXTENDED_FACEAUTH_MODE,                            // 35
//#endif // (NTDDI_VERSION >= NTDDI_WIN10_RS1)
    KSPROPERTY_CAMERACONTROL_EXTENDED_SECURE_MODE,                              // 36
//#if (NTDDI_VERSION >= NTDDI_WIN10_RS3)
    KSPROPERTY_CAMERACONTROL_EXTENDED_VIDEOTEMPORALDENOISING,                   // 37
//#endif // (NTDDI_VERSION >= NTDDI_WIN10_RS3)
// #if (NTDDI_VERSION >= NTDDI_WIN10_19H1)
    KSPROPERTY_CAMERACONTROL_EXTENDED_IRTORCHMODE,                              // 38
// #endif // (NTDDI_VERSION >= NTDDI_WIN10_19H1)
//#if (NTDDI_VERSION >= NTDDI_WIN10_VB)
    KSPROPERTY_CAMERACONTROL_EXTENDED_RELATIVEPANELOPTIMIZATION,                // 39
//#endif //  (NTDDI_VERSION >= NTDDI_WIN10_VB)
//#if(NTDDI_VERSION >= NTDDI_WIN10_MN)
    KSPROPERTY_CAMERACONTROL_EXTENDED_EYEGAZECORRECTION,                        // 40
    KSPROPERTY_CAMERACONTROL_EXTENDED_BACKGROUNDSEGMENTATION,                   // 41
//#endif //  (NTDDI_VERSION >= NTDDI_WIN10_MN)
//#if (NTDDI_VERSION >= NTDDI_WIN10_FE)
    KSPROPERTY_CAMERACONTROL_EXTENDED_DIGITALWINDOW_CONFIGCAPS,                 // 42
    KSPROPERTY_CAMERACONTROL_EXTENDED_DIGITALWINDOW,                            // 43
//#endif //  (NTDDI_VERSION >= NTDDI_WIN10_FE)
//#if (NTDDI_VERSION >= NTDDI_WIN11_ZN)
    KSPROPERTY_CAMERACONTROL_EXTENDED_FRAMERATE_THROTTLE,                       // 44
    KSPROPERTY_CAMERACONTROL_EXTENDED_FIELDOFVIEW2_CONFIGCAPS,                  // 45
    KSPROPERTY_CAMERACONTROL_EXTENDED_FIELDOFVIEW2,                             // 46
//#endif //  (NTDDI_VERSION >= NTDDI_WIN11_ZN)

    KSPROPERTY_CAMERACONTROL_EXTENDED_END,  // All new controls must be before this!
    KSPROPERTY_CAMERACONTROL_EXTENDED_END2 = KSPROPERTY_CAMERACONTROL_EXTENDED_END
  );

const

  KSPROPERTYSETID_ExtendedCameraControl : TGUID = '{1CB79112-C0D2-4213-9CA6-CD4FDB927972}';
  KSEVENTSETID_ExtendedCameraControl    : TGUID = '{571C92C9-13A2-47E3-A649-D2A778166384}';

const

  KSCAMERA_EXTENDEDPROP_FILTERSCOPE   = MAXDWORD;

//#if (NTDDI_VERSION >= NTDDI_WINBLUE)

  KSCAMERA_EXTENDEDPROP_CAPS_RESERVED = $FF00000000000000;


  KSEVENTSETID_CameraEvent    : TGUID = '{7899B2E0-6B43-4964-9D2A-A21F4061F576}';

type

  PKSEVENT_CAMERAEVENT = ^KSEVENT_CAMERAEVENT;
  KSEVENT_CAMERAEVENT = (
    KSEVENT_PHOTO_SAMPLE_SCANNED);

//#endif // (NTDDI_VERSION >= NTDDI_WINBLUE)


// #if (NTDDI_VERSION >= NTDDI_WIN11_ZN)

  // Property set implemented exclusively by Windows Studio camera effect pack (also known as MEP)
const
  STATIC_KSPROPERTYSETID_WindowsCameraEffect : TGUID = '{1666D655-21A6-4982-9728-52C39E869F90}';
//#endif (NTDDI_VERSION >= NTDDI_WIN11_ZN)



const
  KSCAMERA_EXTENDEDPROP_CAPS_ASYNCCONTROL       = $8000000000000000;
  KSCAMERA_EXTENDEDPROP_CAPS_CANCELLABLE        = $4000000000000000;

  KSCAMERA_EXTENDEDPROP_FLAG_CANCELOPERATION    = $8000000000000000;

  // This mask represents the reserved bits for all capability flags.  All EXTENDEDPROP capability
  // flags defined below must NOT use the upper 8 bits.
  // Same applies to the flags.
  KSCAMERA_EXTENDEDPROP_CAPS_MASK               = $FF00000000000000;
  KSCAMERA_EXTENDEDPROP_FLAG_MASK               = $FF00000000000000;

  KSCAMERA_EXTENDEDPROP_PHOTOMODE_NORMAL        = $0000000000000000;
  KSCAMERA_EXTENDEDPROP_PHOTOMODE_SEQUENCE      = $0000000000000001;

  KSCAMERA_EXTENDEDPROP_WARMSTART_MODE_DISABLED = $0000000000000000;
  KSCAMERA_EXTENDEDPROP_WARMSTART_MODE_ENABLED  = $0000000000000001;

  KSCAMERA_EXTENDEDPROP_PHOTOTHUMBNAIL_DISABLE  = $0000000000000000;
  KSCAMERA_EXTENDEDPROP_PHOTOTHUMBNAIL_2X       = $0000000000000001;
  KSCAMERA_EXTENDEDPROP_PHOTOTHUMBNAIL_4X       = $0000000000000002;
  KSCAMERA_EXTENDEDPROP_PHOTOTHUMBNAIL_8X       = $0000000000000004;
  KSCAMERA_EXTENDEDPROP_PHOTOTHUMBNAIL_16X      = $0000000000000008;

  KSCAMERA_EXTENDEDPROP_SCENEMODE_AUTO          = $0000000000000000;
  KSCAMERA_EXTENDEDPROP_SCENEMODE_MACRO         = $0000000000000001;
  KSCAMERA_EXTENDEDPROP_SCENEMODE_PORTRAIT      = $0000000000000002;
  KSCAMERA_EXTENDEDPROP_SCENEMODE_SPORT         = $0000000000000004;
  KSCAMERA_EXTENDEDPROP_SCENEMODE_SNOW          = $0000000000000008;
  KSCAMERA_EXTENDEDPROP_SCENEMODE_NIGHT         = $0000000000000010;
  KSCAMERA_EXTENDEDPROP_SCENEMODE_BEACH         = $0000000000000020;
  KSCAMERA_EXTENDEDPROP_SCENEMODE_SUNSET        = $0000000000000040;
  KSCAMERA_EXTENDEDPROP_SCENEMODE_CANDLELIGHT   = $0000000000000080;
  KSCAMERA_EXTENDEDPROP_SCENEMODE_LANDSCAPE     = $0000000000000100;
  KSCAMERA_EXTENDEDPROP_SCENEMODE_NIGHTPORTRAIT = $0000000000000200;
  KSCAMERA_EXTENDEDPROP_SCENEMODE_BACKLIT       = $0000000000000400;
  KSCAMERA_EXTENDEDPROP_SCENEMODE_MANUAL        = $0080000000000000;

  KSCAMERA_EXTENDEDPROP_VIDEOTORCH_OFF          = $0000000000000000;
  KSCAMERA_EXTENDEDPROP_VIDEOTORCH_ON           = $0000000000000001;
  KSCAMERA_EXTENDEDPROP_VIDEOTORCH_ON_ADJUSTABLEPOWER = $0000000000000002;

  KSCAMERA_EXTENDEDPROP_FLASH_OFF                   = $0000000000000000;
  KSCAMERA_EXTENDEDPROP_FLASH_ON                    = $0000000000000001;
  KSCAMERA_EXTENDEDPROP_FLASH_ON_ADJUSTABLEPOWER    = $0000000000000002;
  KSCAMERA_EXTENDEDPROP_FLASH_AUTO                  = $0000000000000004;
  KSCAMERA_EXTENDEDPROP_FLASH_AUTO_ADJUSTABLEPOWER  = $0000000000000008;
  KSCAMERA_EXTENDEDPROP_FLASH_REDEYEREDUCTION       = $0000000000000010;
  KSCAMERA_EXTENDEDPROP_FLASH_SINGLEFLASH           = $0000000000000020;
  KSCAMERA_EXTENDEDPROP_FLASH_MULTIFLASHSUPPORTED   = $0000000000000040;
  KSCAMERA_EXTENDEDPROP_FLASH_MODE_MASK             = (KSCAMERA_EXTENDEDPROP_FLASH_ON or
                                                       KSCAMERA_EXTENDEDPROP_FLASH_ON_ADJUSTABLEPOWER or
                                                       KSCAMERA_EXTENDEDPROP_FLASH_AUTO or
                                                       KSCAMERA_EXTENDEDPROP_FLASH_AUTO_ADJUSTABLEPOWER);


  KSCAMERA_EXTENDEDPROP_OPTIMIZATION_PHOTO   = $0000000000000001;
  KSCAMERA_EXTENDEDPROP_OPTIMIZATION_VIDEO   = $0000000000000002;

//#if (NTDDI_VERSION >= NTDDI_WINTHRESHOLD)

  KSCAMERA_EXTENDEDPROP_OPTIMIZATION_DEFAULT = $0000000000000000;
  KSCAMERA_EXTENDEDPROP_OPTIMIZATION_QUALITY = $0000000000000004;
  KSCAMERA_EXTENDEDPROP_OPTIMIZATION_LATENCY = $0000000000000008;
  KSCAMERA_EXTENDEDPROP_OPTIMIZATION_POWER   = $0000000000000010;

  KSCAMERA_EXTENDEDPROP_OPTIMIZATION_PERF_MASK = (KSCAMERA_EXTENDEDPROP_OPTIMIZATION_QUALITY or
                                                  KSCAMERA_EXTENDEDPROP_OPTIMIZATION_LATENCY or
                                                  KSCAMERA_EXTENDEDPROP_OPTIMIZATION_POWER);

  KSCAMERA_EXTENDEDPROP_OPTIMIZATION_PRIMARYUSE_MASK = (KSCAMERA_EXTENDEDPROP_OPTIMIZATION_PHOTO or
                                                        KSCAMERA_EXTENDEDPROP_OPTIMIZATION_VIDEO);

//#endif // (NTDDI_VERSION >= NTDDI_WINTHRESHOLD)

  KSCAMERA_EXTENDEDPROP_VIDEOPROCFLAG_AUTO    = $0000000000000001;
  KSCAMERA_EXTENDEDPROP_VIDEOPROCFLAG_MANUAL  = $0000000000000002;
  KSCAMERA_EXTENDEDPROP_VIDEOPROCFLAG_LOCK    = $0000000000000004;

  // This combines the generic Video Proc bits shared by all video proc controls.
  KSCAMERA_EXTENDEDPROP_VIDEOPROCFLAG_MASK    = (KSCAMERA_EXTENDEDPROP_VIDEOPROCFLAG_AUTO or
                                                 KSCAMERA_EXTENDEDPROP_VIDEOPROCFLAG_MANUAL or
                                                 KSCAMERA_EXTENDEDPROP_VIDEOPROCFLAG_LOCK);

type

  PKSCAMERA_EXTENDEDPROP_WHITEBALANCE_MODE = ^KSCAMERA_EXTENDEDPROP_WHITEBALANCE_MODE;
  KSCAMERA_EXTENDEDPROP_WHITEBALANCE_MODE = (
    KSCAMERA_EXTENDEDPROP_WHITEBALANCE_TEMPERATURE = 1,
    KSCAMERA_EXTENDEDPROP_WHITEBALANCE_PRESET
  );

  PKSCAMERA_EXTENDEDPROP_WBPRESET = ^KSCAMERA_EXTENDEDPROP_WBPRESET;
  KSCAMERA_EXTENDEDPROP_WBPRESET          = (
    KSCAMERA_EXTENDEDPROP_WBPRESET_CLOUDY = 1,
    KSCAMERA_EXTENDEDPROP_WBPRESET_DAYLIGHT,
    KSCAMERA_EXTENDEDPROP_WBPRESET_FLASH,
    KSCAMERA_EXTENDEDPROP_WBPRESET_FLUORESCENT,
    KSCAMERA_EXTENDEDPROP_WBPRESET_TUNGSTEN,
    KSCAMERA_EXTENDEDPROP_WBPRESET_CANDLELIGHT
  );

const
  KSCAMERA_EXTENDEDPROP_FOCUS_CONTINUOUS = $0000000000000100;

  // Focus control extends the generic video proc mask by adding the continous flag.
  KSCAMERA_EXTENDEDPROP_FOCUS_MODE_MASK= (KSCAMERA_EXTENDEDPROP_VIDEOPROCFLAG_MASK or
                                          KSCAMERA_EXTENDEDPROP_FOCUS_CONTINUOUS);

  KSCAMERA_EXTENDEDPROP_FOCUS_RANGE_MACRO       = $0000000000010000;
  KSCAMERA_EXTENDEDPROP_FOCUS_RANGE_NORMAL      = $0000000000020000;
  KSCAMERA_EXTENDEDPROP_FOCUS_RANGE_FULLRANGE   = $0000000000040000;
  KSCAMERA_EXTENDEDPROP_FOCUS_RANGE_INFINITY    = $0000000000080000;
  KSCAMERA_EXTENDEDPROP_FOCUS_RANGE_HYPERFOCAL  = $0000000000100000;
  KSCAMERA_EXTENDEDPROP_FOCUS_RANGE_MASK        = (KSCAMERA_EXTENDEDPROP_FOCUS_RANGE_MACRO or
                                                   KSCAMERA_EXTENDEDPROP_FOCUS_RANGE_NORMAL or
                                                   KSCAMERA_EXTENDEDPROP_FOCUS_RANGE_FULLRANGE or
                                                   KSCAMERA_EXTENDEDPROP_FOCUS_RANGE_INFINITY or
                                                   KSCAMERA_EXTENDEDPROP_FOCUS_RANGE_HYPERFOCAL);


//#if (NTDDI_VERSION >= NTDDI_WINBLUE)

  // Spare bits 0x200000 - 0x800000 in case of future range expansion
  KSCAMERA_EXTENDEDPROP_FOCUS_DISTANCE_INFINITY   = $0000000001000000;
  KSCAMERA_EXTENDEDPROP_FOCUS_DISTANCE_HYPERFOCAL = $0000000002000000;
  KSCAMERA_EXTENDEDPROP_FOCUS_DISTANCE_NEAREST    = $0000000004000000;
  KSCAMERA_EXTENDEDPROP_FOCUS_DISTANCE_MASK       = (KSCAMERA_EXTENDEDPROP_FOCUS_DISTANCE_INFINITY or
                                                     KSCAMERA_EXTENDEDPROP_FOCUS_DISTANCE_HYPERFOCAL or
                                                     KSCAMERA_EXTENDEDPROP_FOCUS_DISTANCE_NEAREST);
//#endif // (NTDDI_VERSION >= NTDDI_WINBLUE)



  KSCAMERA_EXTENDEDPROP_ISO_AUTO      = $0000000000000001;
  KSCAMERA_EXTENDEDPROP_ISO_50        = $0000000000000002;
  KSCAMERA_EXTENDEDPROP_ISO_80        = $0000000000000004;
  KSCAMERA_EXTENDEDPROP_ISO_100       = $0000000000000008;
  KSCAMERA_EXTENDEDPROP_ISO_200       = $0000000000000010;
  KSCAMERA_EXTENDEDPROP_ISO_400       = $0000000000000020;
  KSCAMERA_EXTENDEDPROP_ISO_800       = $0000000000000040;
  KSCAMERA_EXTENDEDPROP_ISO_1600      = $0000000000000080;
  KSCAMERA_EXTENDEDPROP_ISO_3200      = $0000000000000100;
  KSCAMERA_EXTENDEDPROP_ISO_6400      = $0000000000000200;
  KSCAMERA_EXTENDEDPROP_ISO_12800     = $0000000000000400;
  KSCAMERA_EXTENDEDPROP_ISO_25600     = $0000000000000800;


//#if (NTDDI_VERSION >= NTDDI_WINBLUE)

  KSCAMERA_EXTENDEDPROP_FOCUS_CONTINUOUSLOCK      = $0000000000000200;
  KSCAMERA_EXTENDEDPROP_FOCUS_UNLOCK              = $0000000000000400;
  KSCAMERA_EXTENDEDPROP_FOCUS_DRIVERFALLBACK_OFF  = $0000000000000800;
  KSCAMERA_EXTENDEDPROP_FOCUS_REGIONBASED         = $0000000000001000;

  KSCAMERA_EXTENDEDPROP_FOCUS_MODE_ADVANCED_MASK  = (KSCAMERA_EXTENDEDPROP_FOCUS_CONTINUOUSLOCK or
                                                     KSCAMERA_EXTENDEDPROP_FOCUS_UNLOCK or
                                                     KSCAMERA_EXTENDEDPROP_FOCUS_DRIVERFALLBACK_OFF or
                                                     KSCAMERA_EXTENDEDPROP_FOCUS_REGIONBASED);

  KSCAMERA_EXTENDEDPROP_ISO_MANUAL                = $0080000000000000;

  KSCAMERA_EXTENDEDPROP_FLASH_ASSISTANT_OFF       = $0000000000000000;
  KSCAMERA_EXTENDEDPROP_FLASH_ASSISTANT_ON        = $0000000000000080;
  KSCAMERA_EXTENDEDPROP_FLASH_ASSISTANT_AUTO      = $0000000000000100;
  KSCAMERA_EXTENDEDPROP_FLASH_ASSISTANT_MASK      = (KSCAMERA_EXTENDEDPROP_FLASH_ASSISTANT_ON or
                                                     KSCAMERA_EXTENDEDPROP_FLASH_ASSISTANT_AUTO);

//#endif // (NTDDI_VERSION >= NTDDI_WINBLUE)


  KSCAMERA_EXTENDEDPROP_EVCOMP_SIXTHSTEP          = $0000000000000001;
  KSCAMERA_EXTENDEDPROP_EVCOMP_QUARTERSTEP        = $0000000000000002;
  KSCAMERA_EXTENDEDPROP_EVCOMP_THIRDSTEP          = $0000000000000004;
  KSCAMERA_EXTENDEDPROP_EVCOMP_HALFSTEP           = $0000000000000008;
  KSCAMERA_EXTENDEDPROP_EVCOMP_FULLSTEP           = $0000000000000010;

type

  PKSPROPERTY_CAMERA_PHOTOTRIGGERTIME_FLAGS = ^KSPROPERTY_CAMERA_PHOTOTRIGGERTIME_FLAGS;
  KSPROPERTY_CAMERA_PHOTOTRIGGERTIME_FLAGS = (
    KSPROPERTY_CAMERA_PHOTOTRIGGERTIME_CLEAR = 0,
    KSPROPERTY_CAMERA_PHOTOTRIGGERTIME_SET
  );

  PKSCAMERA_EXTENDEDPROP_HEADER = ^tagKSCAMERA_EXTENDEDPROP_HEADER;
  tagKSCAMERA_EXTENDEDPROP_HEADER = record
    Version: ULONG;
    PinId: ULONG;
    Size: ULONG;
    Result: ULONG;
    Flags: ULONGLONG;
    Capability: ULONGLONG;
  end;
  KSCAMERA_EXTENDEDPROP_HEADER = tagKSCAMERA_EXTENDEDPROP_HEADER;

  PKSCAMERA_EXTENDEDPROP_VALUE = ^tagKSCAMERA_EXTENDEDPROP_VALUE;
  tagKSCAMERA_EXTENDEDPROP_VALUE = record
    case Integer of
      0: (Value: record
            case Integer of
              0: (dbl: Double);
              1: (ull: ULONGLONG);
              2: (ul: ULONG);
              3: (ratio: ULARGE_INTEGER);
              4: (l: LONG);
              5: (ll: LONGLONG);
          end);
      1: (dbl: Double);
      2: (ull: ULONGLONG);
      3: (ul: ULONG);
      4: (ratio: ULARGE_INTEGER);
      5: (l: LONG);
      6: (ll: LONGLONG);
  end;
  KSCAMERA_EXTENDEDPROP_VALUE = tagKSCAMERA_EXTENDEDPROP_VALUE;

  // This is the payload structure fo the Maximum video sensor frame rate possible
  // based on the photo resolution being programmed on the sensor.  The PhotoRes fields
  // are provided by the application, the preview/capture FPS fields are filled in
  // by the driver to indicate the maximum sensor frame rate.
  PKSCAMERA_MAXVIDEOFPS_FORPHOTORES = ^tagKSCAMERA_MAXVIDEOFPS_FORPHOTORES;
  tagKSCAMERA_MAXVIDEOFPS_FORPHOTORES = record
    PhotoResWidth: ULONG;
    PhotoResHeight: ULONG;
    PreviewFPSNum: ULONG;
    PreviewFPSDenom: ULONG;
    CaptureFPSNum: ULONG;
    CaptureFPSDenom: ULONG;
  end;
  KSCAMERA_MAXVIDEOFPS_FORPHOTORES = tagKSCAMERA_MAXVIDEOFPS_FORPHOTORES;

//#if (NTDDI_VERSION >= NTDDI_WINBLUE)

const

  KSCAMERA_EXTENDEDPROP_PHOTOMODE_SEQUENCE_SUB_NONE     = $00000000;
  KSCAMERA_EXTENDEDPROP_PHOTOMODE_SEQUENCE_SUB_VARIABLE = $00000001;

//#endif // (NTDDI_VERSION >= NTDDI_WINBLUE)

type

  PKSCAMERA_EXTENDEDPROP_PHOTOMODE = ^tagKSCAMERA_EXTENDEDPROP_PHOTOMODE;
  tagKSCAMERA_EXTENDEDPROP_PHOTOMODE = record
    RequestedHistoryFrames: ULONG;
    MaxHistoryFrames: ULONG;
    SubMode: ULONG;
    Reserved: ULONG;
  end;
  KSCAMERA_EXTENDEDPROP_PHOTOMODE = tagKSCAMERA_EXTENDEDPROP_PHOTOMODE;

  PKSCAMERA_EXTENDEDPROP_VIDEOPROCSETTING = ^tagKSCAMERA_EXTENDEDPROP_VIDEOPROCSETTING;
  tagKSCAMERA_EXTENDEDPROP_VIDEOPROCSETTING = record
    Mode: ULONG;
    Min: LONG;
    Max: LONG;
    Step: LONG;
    VideoProc: KSCAMERA_EXTENDEDPROP_VALUE;
    Reserved: ULONGLONG;
  end;
  KSCAMERA_EXTENDEDPROP_VIDEOPROCSETTING = tagKSCAMERA_EXTENDEDPROP_VIDEOPROCSETTING;

  PKSCAMERA_EXTENDEDPROP_EVCOMPENSATION = ^tagKSCAMERA_EXTENDEDPROP_EVCOMPENSATION;
  tagKSCAMERA_EXTENDEDPROP_EVCOMPENSATION = record
    Mode: ULONG;
    Min: LONG;
    Max: LONG;
    Value: LONG;
    Reserved: ULONGLONG;
  end;
  KSCAMERA_EXTENDEDPROP_EVCOMPENSATION = tagKSCAMERA_EXTENDEDPROP_EVCOMPENSATION;

  PKSCAMERA_EXTENDEDPROP_FIELDOFVIEW = ^tagKSCAMERA_EXTENDEDPROP_FIELDOFVIEW;
  tagKSCAMERA_EXTENDEDPROP_FIELDOFVIEW = record
    NormalizedFocalLengthX: ULONG;
    NormalizedFocalLengthY: ULONG;
    Flag: ULONG;
    Reserved: ULONG;
  end;
  KSCAMERA_EXTENDEDPROP_FIELDOFVIEW = tagKSCAMERA_EXTENDEDPROP_FIELDOFVIEW;

  PKSCAMERA_EXTENDEDPROP_CAMERAOFFSET = ^tagKSCAMERA_EXTENDEDPROP_CAMERAOFFSET;
  tagKSCAMERA_EXTENDEDPROP_CAMERAOFFSET = record
    PitchAngle: LONG;
    YawAngle: LONG;
    Flag: ULONG;
    Reserved: ULONG;
  end;
  KSCAMERA_EXTENDEDPROP_CAMERAOFFSET = tagKSCAMERA_EXTENDEDPROP_CAMERAOFFSET;

//#if (NTDDI_VERSION >= NTDDI_WINBLUE)

  // Metadata
  PKSCAMERA_EXTENDEDPROP_METADATAINFO = ^tagKSCAMERA_EXTENDEDPROP_METADATAINFO;
  tagKSCAMERA_EXTENDEDPROP_METADATAINFO = record
    BufferAlignment: LONG;           // Required alignment for metadata buffer
    MaxMetadataBufferSize: ULONG;   // Required metadata buffer size
  end;
  KSCAMERA_EXTENDEDPROP_METADATAINFO = tagKSCAMERA_EXTENDEDPROP_METADATAINFO;

type
  PKSCAMERA_EXTENDEDPROP_MetadataAlignment = ^KSCAMERA_EXTENDEDPROP_MetadataAlignment;
  KSCAMERA_EXTENDEDPROP_MetadataAlignment = DWord;
const
  KSCAMERA_EXTENDEDPROP_MetadataAlignment_16    = 4;  // Aligned at 16 bytes
  KSCAMERA_EXTENDEDPROP_MetadataAlignment_32    = 5;
  KSCAMERA_EXTENDEDPROP_MetadataAlignment_64    = 6;
  KSCAMERA_EXTENDEDPROP_MetadataAlignment_128   = 7;
  KSCAMERA_EXTENDEDPROP_MetadataAlignment_256   = 8;
  KSCAMERA_EXTENDEDPROP_MetadataAlignment_512   = 9;
  KSCAMERA_EXTENDEDPROP_MetadataAlignment_1024  = 10;
  KSCAMERA_EXTENDEDPROP_MetadataAlignment_2048  = 11;
  KSCAMERA_EXTENDEDPROP_MetadataAlignment_4096  = 12;
  KSCAMERA_EXTENDEDPROP_MetadataAlignment_8192  = 13;


const

  KSCAMERA_EXTENDEDPROP_METADATA_MEMORYTYPE_MASK    = $00000000000000FF;

  KSCAMERA_EXTENDEDPROP_METADATA_SYSTEMMEMORY       = $0000000000000001;
  KSCAMERA_EXTENDEDPROP_METADATA_ALIGNMENTREQUIRED  = $0000000000000100;

type
  PKSCAMERA_MetadataId = ^KSCAMERA_MetadataId;
  KSCAMERA_MetadataId = (
    MetadataId_Standard_Start    = 1,
    MetadataId_PhotoConfirmation = MetadataId_Standard_Start,
    MetadataId_UsbVideoHeader,
    MetadataId_CaptureStats,
    MetadataId_CameraExtrinsics,
    MetadataId_CameraIntrinsics,
    MetadataId_FrameIllumination,
    MetadataId_DigitalWindow,
    MetadataId_BackgroundSegmentationMask,
    MetadataId_Standard_End = MetadataId_BackgroundSegmentationMask,
    MetadataId_Custom_Start = Integer($80000000)
  );

  PKSCAMERA_METADATA_ITEMHEADER = ^tagKSCAMERA_METADATA_ITEMHEADER;
  tagKSCAMERA_METADATA_ITEMHEADER = record
    MetadataId: ULONG;
    Size: ULONG;                    // Size of this header + metadata payload following
  end;
  KSCAMERA_METADATA_ITEMHEADER = tagKSCAMERA_METADATA_ITEMHEADER;

  PKSCAMERA_METADATA_PHOTOCONFIRMATION = ^tagKSCAMERA_METADATA_PHOTOCONFIRMATION;
  tagKSCAMERA_METADATA_PHOTOCONFIRMATION = record
    Header: KSCAMERA_METADATA_ITEMHEADER;
    PhotoConfirmationIndex: ULONG;
    Reserved: ULONG;
  end;
  KSCAMERA_METADATA_PHOTOCONFIRMATION = tagKSCAMERA_METADATA_PHOTOCONFIRMATION;

  PKSCAMERA_METADATA_FRAMEILLUMINATION = ^tagKSCAMERA_METADATA_FRAMEILLUMINATION;
  tagKSCAMERA_METADATA_FRAMEILLUMINATION = record
    Header: KSCAMERA_METADATA_ITEMHEADER;
    Flags: ULONG;
    Reserved: ULONG;
  end;
  KSCAMERA_METADATA_FRAMEILLUMINATION = tagKSCAMERA_METADATA_FRAMEILLUMINATION;


const
  KSCAMERA_METADATA_FRAMEILLUMINATION_FLAG_ON = $00000001;


type

  PKSCAMERA_METADATA_CAPTURESTATS = ^tagKSCAMERA_METADATA_CAPTURESTATS;
  tagKSCAMERA_METADATA_CAPTURESTATS = record
    Header: KSCAMERA_METADATA_ITEMHEADER;
    Flags: ULONG;
    Reserved: ULONG;
    ExposureTime: ULONGLONG;
    ExposureCompensationFlags: ULONGLONG;
    ExposureCompensationValue: LONG;
    IsoSpeed: ULONG;
    FocusState: ULONG;
    LensPosition: ULONG;            // a.k.a Focus
    WhiteBalance: ULONG;
    Flash: ULONG;
    FlashPower: ULONG;
    ZoomFactor: ULONG;
    SceneMode: ULONGLONG;
    SensorFramerate: ULONGLONG;
  end;
  KSCAMERA_METADATA_CAPTURESTATS = tagKSCAMERA_METADATA_CAPTURESTATS;

const

  KSCAMERA_METADATA_CAPTURESTATS_FLAG_EXPOSURETIME         = $00000001;
  KSCAMERA_METADATA_CAPTURESTATS_FLAG_EXPOSURECOMPENSATION = $00000002;
  KSCAMERA_METADATA_CAPTURESTATS_FLAG_ISOSPEED             = $00000004;
  KSCAMERA_METADATA_CAPTURESTATS_FLAG_FOCUSSTATE           = $00000008;
  KSCAMERA_METADATA_CAPTURESTATS_FLAG_LENSPOSITION         = $00000010;
  KSCAMERA_METADATA_CAPTURESTATS_FLAG_WHITEBALANCE         = $00000020;
  KSCAMERA_METADATA_CAPTURESTATS_FLAG_FLASH                = $00000040;
  KSCAMERA_METADATA_CAPTURESTATS_FLAG_FLASHPOWER           = $00000080;
  KSCAMERA_METADATA_CAPTURESTATS_FLAG_ZOOMFACTOR           = $00000100;
  KSCAMERA_METADATA_CAPTURESTATS_FLAG_SCENEMODE            = $00000200;
  KSCAMERA_METADATA_CAPTURESTATS_FLAG_SENSORFRAMERATE      = $00000400;

  // Focus Priority
  KSCAMERA_EXTENDEDPROP_FOCUSPRIORITY_OFF   = $0000000000000000;
  KSCAMERA_EXTENDEDPROP_FOCUSPRIORITY_ON    = $0000000000000001;

type
  // Focus State
  PKSCAMERA_EXTENDEDPROP_FOCUSSTATE = ^KSCAMERA_EXTENDEDPROP_FOCUSSTATE;
  KSCAMERA_EXTENDEDPROP_FOCUSSTATE                 = (
    KSCAMERA_EXTENDEDPROP_FOCUSSTATE_UNINITIALIZED = 0,
    KSCAMERA_EXTENDEDPROP_FOCUSSTATE_LOST,
    KSCAMERA_EXTENDEDPROP_FOCUSSTATE_SEARCHING,
    KSCAMERA_EXTENDEDPROP_FOCUSSTATE_FOCUSED,
    KSCAMERA_EXTENDEDPROP_FOCUSSTATE_FAILED
  );

  // Extended ROI
  PKSCAMERA_EXTENDEDPROP_ROI_CONFIGCAPSHEADER = ^tagKSCAMERA_EXTENDEDPROP_ROI_CONFIGCAPSHEADER;
  tagKSCAMERA_EXTENDEDPROP_ROI_CONFIGCAPSHEADER = record
    Size: ULONG;                     // Size of this header + all _CONFIGCAPS structures followed
    ConfigCapCount: ULONG;           // Number of _CONFIGCAPS structures followed
    Reserved: ULONGLONG;
  end;
  KSCAMERA_EXTENDEDPROP_ROI_CONFIGCAPSHEADER = tagKSCAMERA_EXTENDEDPROP_ROI_CONFIGCAPSHEADER;

  PKSCAMERA_EXTENDEDPROP_ROI_CONFIGCAPS = ^tagKSCAMERA_EXTENDEDPROP_ROI_CONFIGCAPS;
  tagKSCAMERA_EXTENDEDPROP_ROI_CONFIGCAPS = record
    ControlId: ULONG;                // ISP control ID (focus, exposure, or white balance)
    MaxNumberOfROIs: ULONG;          // Max ROIs supported for this ISP control
    Capability: ULONGLONG;          // Caps for this ISP control
  end;
  KSCAMERA_EXTENDEDPROP_ROI_CONFIGCAPS = tagKSCAMERA_EXTENDEDPROP_ROI_CONFIGCAPS;

  PKSCAMERA_EXTENDEDPROP_ROI_ISPCONTROLHEADER = ^tagKSCAMERA_EXTENDEDPROP_ROI_ISPCONTROLHEADER;
  tagKSCAMERA_EXTENDEDPROP_ROI_ISPCONTROLHEADER = record
    Size: ULONG;                     // Size of this header + all _ ISPCONTROL + all _RECTINFO
    ControlCount: ULONG;             // Number of ISP controls. 0 indicating clear all ROIs
    Reserved: ULONGLONG;
  end;
  KSCAMERA_EXTENDEDPROP_ROI_ISPCONTROLHEADER = tagKSCAMERA_EXTENDEDPROP_ROI_ISPCONTROLHEADER;

  PKSCAMERA_EXTENDEDPROP_ROI_ISPCONTROL = ^tagKSCAMERA_EXTENDEDPROP_ROI_ISPCONTROL;
  tagKSCAMERA_EXTENDEDPROP_ROI_ISPCONTROL = record
    ControlId: ULONG;                // ISP control ID (focus, exposure, or white balance)
    ROICount: ULONG;                 // Number of ROIs associated with this ISP control
    Result: ULONG;                   // Error results of the last SET operation for this ISP control
    Reserved: ULONG;
  end;
  KSCAMERA_EXTENDEDPROP_ROI_ISPCONTROL = tagKSCAMERA_EXTENDEDPROP_ROI_ISPCONTROL;

  PKSCAMERA_EXTENDEDPROP_ROI_INFO = ^tagKSCAMERA_EXTENDEDPROP_ROI_INFO;
  tagKSCAMERA_EXTENDEDPROP_ROI_INFO = record
    Region: TRECT;                    // Relative coordinates on the frame that face detection is running (Q31 format)
    Flags: ULONGLONG;                 // VIDEOPROCFLAG flags indicating the op mode for the ISP control. Default is 0 for focus
    Weight: LONG;                     // Weight of the region   (0 -100)
    RegionOfInterestType: LONG;       // KSCAMERA_EXTENDEDPROP_ROITYPE_FACE, if the region is a face; Unknown otherwise
  end;
  KSCAMERA_EXTENDEDPROP_ROI_INFO = tagKSCAMERA_EXTENDEDPROP_ROI_INFO;

  PKscameraExtendedpropRoitype = ^KSCAMERA_EXTENDEDPROP_ROITYPE;
  KSCAMERA_EXTENDEDPROP_ROITYPE           = (
    KSCAMERA_EXTENDEDPROP_ROITYPE_UNKNOWN = 0,
    KSCAMERA_EXTENDEDPROP_ROITYPE_FACE);
  TKscameraExtendedpropRoitype = KSCAMERA_EXTENDEDPROP_ROITYPE;

  PKSCAMERA_EXTENDEDPROP_ROI_WHITEBALANCE = ^tagKSCAMERA_EXTENDEDPROP_ROI_WHITEBALANCE;
  tagKSCAMERA_EXTENDEDPROP_ROI_WHITEBALANCE = record
    ROIInfo: KSCAMERA_EXTENDEDPROP_ROI_INFO;  // Must be the first field
    Reserved: ULONGLONG;
  end;
  KSCAMERA_EXTENDEDPROP_ROI_WHITEBALANCE = tagKSCAMERA_EXTENDEDPROP_ROI_WHITEBALANCE;

  PKSCAMERA_EXTENDEDPROP_ROI_EXPOSURE = ^tagKSCAMERA_EXTENDEDPROP_ROI_EXPOSURE;
  tagKSCAMERA_EXTENDEDPROP_ROI_EXPOSURE = record
    ROIInfo: KSCAMERA_EXTENDEDPROP_ROI_INFO;  // Must be the first field
    Reserved: ULONGLONG;
  end;
  KSCAMERA_EXTENDEDPROP_ROI_EXPOSURE = tagKSCAMERA_EXTENDEDPROP_ROI_EXPOSURE;

  PKSCAMERA_EXTENDEDPROP_ROI_FOCUS = ^tagKSCAMERA_EXTENDEDPROP_ROI_FOCUS;
  tagKSCAMERA_EXTENDEDPROP_ROI_FOCUS = record
    ROIInfo: KSCAMERA_EXTENDEDPROP_ROI_INFO;  // Must be the first field
    Reserved: ULONGLONG;
  end;
  KSCAMERA_EXTENDEDPROP_ROI_FOCUS = tagKSCAMERA_EXTENDEDPROP_ROI_FOCUS;

const
  // Photo confirmation (aka still confirmation)
  KSCAMERA_EXTENDEDPROP_PHOTOCONFIRMATION_OFF   = $0000000000000000;
  KSCAMERA_EXTENDEDPROP_PHOTOCONFIRMATION_ON    = $0000000000000001;

  //
  // Per Frame Settings
  //

  KSPROPERTYSETID_PerFrameSettingControl : TGUID = '{F1F3E261-DEE6-4537-BFF5-EE206DB54AAC}';

type

  PKSPROPERTY_CAMERACONTROL_PERFRAMESETTING_PROPERTY = ^KSPROPERTY_CAMERACONTROL_PERFRAMESETTING_PROPERTY;
  KSPROPERTY_CAMERACONTROL_PERFRAMESETTING_PROPERTY = (
    KSPROPERTY_CAMERACONTROL_PERFRAMESETTING_CAPABILITY = 0,
    KSPROPERTY_CAMERACONTROL_PERFRAMESETTING_SET,
    KSPROPERTY_CAMERACONTROL_PERFRAMESETTING_CLEAR
  );

const

  KSCAMERA_PERFRAMESETTING_AUTO       = $0000000100000000;
  KSCAMERA_PERFRAMESETTING_MANUAL     = $0000000200000000;

type

  PKSCAMERA_PERFRAMESETTING_ITEM_TYPE = ^KSCAMERA_PERFRAMESETTING_ITEM_TYPE;
  KSCAMERA_PERFRAMESETTING_ITEM_TYPE            = (
    KSCAMERA_PERFRAMESETTING_ITEM_EXPOSURE_TIME = 1,
    KSCAMERA_PERFRAMESETTING_ITEM_FLASH,
    KSCAMERA_PERFRAMESETTING_ITEM_EXPOSURE_COMPENSATION,
    KSCAMERA_PERFRAMESETTING_ITEM_ISO,
    KSCAMERA_PERFRAMESETTING_ITEM_FOCUS,
    KSCAMERA_PERFRAMESETTING_ITEM_PHOTOCONFIRMATION,
    KSCAMERA_PERFRAMESETTING_ITEM_CUSTOM
  );

  PKSCAMERA_PERFRAMESETTING_CAP_ITEM_HEADER = ^KSCAMERA_PERFRAMESETTING_CAP_ITEM_HEADER;
  KSCAMERA_PERFRAMESETTING_CAP_ITEM_HEADER = record
    Size: ULONG;
    _Type: ULONG;                     // KSCAMERA_PERFRAMESETTING_ITEM_TYPE
    Flags: ULONGLONG;                 // Supported Flags
  end;

  PKSCAMERA_PERFRAMESETTING_CAP_HEADER = ^KSCAMERA_PERFRAMESETTING_CAP_HEADER;
  KSCAMERA_PERFRAMESETTING_CAP_HEADER = record
    Size: ULONG;
    ItemCount: ULONG;
    Flags: ULONGLONG;
  end;

  PKSCAMERA_PERFRAMESETTING_CUSTOM_ITEM = ^KSCAMERA_PERFRAMESETTING_CUSTOM_ITEM;
  KSCAMERA_PERFRAMESETTING_CUSTOM_ITEM = record
    Size: ULONG;
    Reserved: ULONG;
    Id: TGUID;
  end;

  PKSCAMERA_PERFRAMESETTING_ITEM_HEADER = ^KSCAMERA_PERFRAMESETTING_ITEM_HEADER;
  KSCAMERA_PERFRAMESETTING_ITEM_HEADER = record
    Size: ULONG;
    _Type: ULONG;                    // KSCAMERA_PERFRAMESETTING_ITEM_TYPE
    Flags: ULONGLONG;
  end;

  PKSCAMERA_PERFRAMESETTING_FRAME_HEADER = ^KSCAMERA_PERFRAMESETTING_FRAME_HEADER;
  KSCAMERA_PERFRAMESETTING_FRAME_HEADER = record
    Size: ULONG;
    Id: ULONG;
    ItemCount: ULONG;
    Reserved: ULONG;
  end;

  PKSCAMERA_PERFRAMESETTING_HEADER = ^KSCAMERA_PERFRAMESETTING_HEADER;
  KSCAMERA_PERFRAMESETTING_HEADER = record
    Size: ULONG;
    FrameCount: ULONG;
    Id: TGUID;
    Flags: ULONGLONG;
    LoopCount: ULONG;
    Reserved: ULONG;
  end;

//#endif // (NTDDI_VERSION >= NTDDI_WINBLUE)

const

//#if (NTDDI_VERSION >= NTDDI_WINTHRESHOLD)
  KSCAMERA_EXTENDEDPROP_VIDEOSTABILIZATION_OFF      = $0000000000000000;
  KSCAMERA_EXTENDEDPROP_VIDEOSTABILIZATION_ON       = $0000000000000001;
  KSCAMERA_EXTENDEDPROP_VIDEOSTABILIZATION_AUTO     = $0000000000000002;

  KSCAMERA_EXTENDEDPROP_VFR_OFF                     = $0000000000000000;
  KSCAMERA_EXTENDEDPROP_VFR_ON                      = $0000000000000001;

  KSCAMERA_EXTENDEDPROP_FACEDETECTION_OFF           = $0000000000000000;
  KSCAMERA_EXTENDEDPROP_FACEDETECTION_ON            = $0000000000000001;
  KSCAMERA_EXTENDEDPROP_FACEDETECTION_PREVIEW       = $0000000000000001;
  KSCAMERA_EXTENDEDPROP_FACEDETECTION_VIDEO         = $0000000000000002;
  KSCAMERA_EXTENDEDPROP_FACEDETECTION_PHOTO         = $0000000000000004;
  KSCAMERA_EXTENDEDPROP_FACEDETECTION_BLINK         = $0000000000000008;
  KSCAMERA_EXTENDEDPROP_FACEDETECTION_SMILE         = $0000000000000010;

  KSCAMERA_EXTENDEDPROP_FACEDETECTION_MASK          = (KSCAMERA_EXTENDEDPROP_FACEDETECTION_PREVIEW or
                                                       KSCAMERA_EXTENDEDPROP_FACEDETECTION_VIDEO or
                                                       KSCAMERA_EXTENDEDPROP_FACEDETECTION_PHOTO);

  KSCAMERA_EXTENDEDPROP_FACEDETECTION_ADVANCED_MASK = (KSCAMERA_EXTENDEDPROP_FACEDETECTION_BLINK or
                                                       KSCAMERA_EXTENDEDPROP_FACEDETECTION_SMILE);

  KSCAMERA_EXTENDEDPROP_VIDEOHDR_OFF                = $0000000000000000;
  KSCAMERA_EXTENDEDPROP_VIDEOHDR_ON                 = $0000000000000001;
  KSCAMERA_EXTENDEDPROP_VIDEOHDR_AUTO               = $0000000000000002;

  KSCAMERA_EXTENDEDPROP_HISTOGRAM_OFF               = $0000000000000000;
  KSCAMERA_EXTENDEDPROP_HISTOGRAM_ON                = $0000000000000001;

  KSCAMERA_EXTENDEDPROP_OIS_OFF                     = $0000000000000000;
  KSCAMERA_EXTENDEDPROP_OIS_ON                      = $0000000000000001;
  KSCAMERA_EXTENDEDPROP_OIS_AUTO                    = $0000000000000002;

  KSCAMERA_EXTENDEDPROP_ADVANCEDPHOTO_OFF           = $0000000000000000;
  KSCAMERA_EXTENDEDPROP_ADVANCEDPHOTO_AUTO          = $0000000000000001;
  KSCAMERA_EXTENDEDPROP_ADVANCEDPHOTO_HDR           = $0000000000000002;
  KSCAMERA_EXTENDEDPROP_ADVANCEDPHOTO_FNF           = $0000000000000004;
  KSCAMERA_EXTENDEDPROP_ADVANCEDPHOTO_ULTRALOWLIGHT = $0000000000000008;

  KSCAMERA_EXTENDEDPROP_ZOOM_DEFAULT                = $0000000000000000;
  KSCAMERA_EXTENDEDPROP_ZOOM_DIRECT                 = $0000000000000001;
  KSCAMERA_EXTENDEDPROP_ZOOM_SMOOTH                 = $0000000000000002;

  KSCAMERA_EXTENDEDPROP_FACEAUTH_MODE_DISABLED      = $0000000000000001;
  KSCAMERA_EXTENDEDPROP_FACEAUTH_MODE_ALTERNATIVE_FRAME_ILLUMINATION  = $0000000000000002;
  KSCAMERA_EXTENDEDPROP_FACEAUTH_MODE_BACKGROUND_SUBTRACTION          = $0000000000000004;

  KSCAMERA_EXTENDEDPROP_SECUREMODE_DISABLED         = $0000000000000001;
  KSCAMERA_EXTENDEDPROP_SECUREMODE_ENABLED          = $0000000000000002;

  KSCAMERA_EXTENDEDPROP_VIDEOTEMPORALDENOISING_AUTO = $0000000000000001;
  KSCAMERA_EXTENDEDPROP_VIDEOTEMPORALDENOISING_OFF  = $0000000000000002;
  KSCAMERA_EXTENDEDPROP_VIDEOTEMPORALDENOISING_ON   = $0000000000000004;

  KSCAMERA_EXTENDEDPROP_IRTORCHMODE_OFF                               = $0000000000000001;
  KSCAMERA_EXTENDEDPROP_IRTORCHMODE_ALWAYS_ON                         = $0000000000000002;
  KSCAMERA_EXTENDEDPROP_IRTORCHMODE_ALTERNATING_FRAME_ILLUMINATION    = $0000000000000004;

  KSCAMERA_EXTENDEDPROP_RELATIVEPANELOPTIMIZATION_OFF                 = $0000000000000000;
  KSCAMERA_EXTENDEDPROP_RELATIVEPANELOPTIMIZATION_ON                  = $0000000000000001;
  KSCAMERA_EXTENDEDPROP_RELATIVEPANELOPTIMIZATION_DYNAMIC             = $0000000000000002;

  KSCAMERA_EXTENDEDPROP_RELATIVEPANELOPTIMIZATION_MASK                = (KSCAMERA_EXTENDEDPROP_RELATIVEPANELOPTIMIZATION_ON or
                                                                         KSCAMERA_EXTENDEDPROP_RELATIVEPANELOPTIMIZATION_DYNAMIC);

  KSCAMERA_EXTENDEDPROP_EYEGAZECORRECTION_OFF                         = $0000000000000000;
  KSCAMERA_EXTENDEDPROP_EYEGAZECORRECTION_ON                          = $0000000000000001;
  // if (NTDDI_VERSION >= NTDDI_WIN10_NI)
  KSCAMERA_EXTENDEDPROP_EYEGAZECORRECTION_STARE                       = $0000000000000002;
  // endif //  (NTDDI_VERSION >= NTDDI_WIN10_NI)

  KSCAMERA_EXTENDEDPROP_BACKGROUNDSEGMENTATION_OFF                    = $0000000000000000;
  KSCAMERA_EXTENDEDPROP_BACKGROUNDSEGMENTATION_BLUR                   = $0000000000000001;
  KSCAMERA_EXTENDEDPROP_BACKGROUNDSEGMENTATION_MASK                   = $0000000000000002;
  // if (NTDDI_VERSION >= NTDDI_WIN10_NI)
  KSCAMERA_EXTENDEDPROP_BACKGROUNDSEGMENTATION_SHALLOWFOCUS           = $0000000000000004;
  // endif //  (NTDDI_VERSION >= NTDDI_WIN10_NI)

  // Digital Window Framing Flags
  KSCAMERA_EXTENDEDPROP_DIGITALWINDOW_MANUAL                          = $0000000000000000;
  KSCAMERA_EXTENDEDPROP_DIGITALWINDOW_AUTOFACEFRAMING                 = $0000000000000001;
  KSCAMERA_EXTENDEDPROP_DIGITALWINDOW_MASK                            = (KSCAMERA_EXTENDEDPROP_DIGITALWINDOW_MANUAL or
                                                                         KSCAMERA_EXTENDEDPROP_DIGITALWINDOW_AUTOFACEFRAMING);

  // #if (NTDDI_VERSION >= NTDDI_WIN11_ZN)

  // Dynamic Framerate Throttle Flags
  KSCAMERA_EXTENDEDPROP_FRAMERATE_THROTTLE_OFF                        = $0000000000000000;
  KSCAMERA_EXTENDEDPROP_FRAMERATE_THROTTLE_ON                         = $0000000000000001;

  // #endif (NTDDI_VERSION >= NTDDI_WIN11_ZN)

type

  // Digital Window Region
  tagKSCAMERA_EXTENDEDPROP_DIGITALWINDOW_SETTING = record
    OriginX: LONG;                   // in Q24
    OriginY: LONG;                   // in Q24
    WindowSize: LONG;                // in Q24
    Reserved: ULONG;
  end;
  KSCAMERA_EXTENDEDPROP_DIGITALWINDOW_SETTING = tagKSCAMERA_EXTENDEDPROP_DIGITALWINDOW_SETTING;
  PKSCAMERA_EXTENDEDPROP_DIGITALWINDOW_SETTING = ^tagKSCAMERA_EXTENDEDPROP_DIGITALWINDOW_SETTING;


  tagKSCAMERA_METADATA_DIGITALWINDOW = record
    Header: KSCAMERA_METADATA_ITEMHEADER;
    Window: KSCAMERA_EXTENDEDPROP_DIGITALWINDOW_SETTING;
  end;
  KSCAMERA_METADATA_DIGITALWINDOW = tagKSCAMERA_METADATA_DIGITALWINDOW;
  PKSCAMERA_METADATA_DIGITALWINDOW = ^tagKSCAMERA_METADATA_DIGITALWINDOW;


  // Digital Window Capabilities
  tagKSCAMERA_EXTENDEDPROP_DIGITALWINDOW_CONFIGCAPSHEADER = record
    Size: ULONG;                    // Size of this header + all _CONFIGCAPS structures followed
    Count: ULONG;                   // Number of _CONFIGCAPS structures followed
  end;
  KSCAMERA_EXTENDEDPROP_DIGITALWINDOW_CONFIGCAPSHEADER = tagKSCAMERA_EXTENDEDPROP_DIGITALWINDOW_CONFIGCAPSHEADER;
  PKSCAMERA_EXTENDEDPROP_DIGITALWINDOW_CONFIGCAPSHEADER = ^tagKSCAMERA_EXTENDEDPROP_DIGITALWINDOW_CONFIGCAPSHEADER;


  tagKSCAMERA_EXTENDEDPROP_DIGITALWINDOW_CONFIGCAPS = record
    ResolutionX: LONG;               // Output width in pixels
    ResolutionY: LONG;               // Output height in pixels
    PorchTop: LONG;                  // Upper porch region in Q24
    PorchLeft: LONG;                 // Left-most porch region in Q24
    PorchBottom: LONG;               // Lower porch region in Q24
    PorchRight: LONG;                // Right-most porch region in Q24
    NonUpscalingWindowSize: LONG;    // Q24 value to get no scaling
    MinWindowSize: LONG;             // Smallest legal WindowSize
    MaxWindowSize: LONG;             // Largest legal WindowSize
    Reserved: LONG;                  // Reserved
  end;
  KSCAMERA_EXTENDEDPROP_DIGITALWINDOW_CONFIGCAPS = tagKSCAMERA_EXTENDEDPROP_DIGITALWINDOW_CONFIGCAPS;
  PKSCAMERA_EXTENDEDPROP_DIGITALWINDOW_CONFIGCAPS = ^tagKSCAMERA_EXTENDEDPROP_DIGITALWINDOW_CONFIGCAPS;

  // #if (NTDDI_VERSION >= NTDDI_WIN11_ZN)

  tagKSCAMERA_EXTENDEDPROP_FIELDOFVIEW2_CONFIGCAPS = record
    DefaultDiagonalFieldOfViewInDegrees: WORD;  // This is the default Field of View value in degrees.
    DiscreteFoVStopsCount: WORD;                // Count of used entries in DiscreteFoVStops array.
    DiscreteFoVStops: array[0..359] of WORD;    // Descending list of FoV Stops in degrees.
    Reserved: ULONG;                            // For 8-byte size align
  end;
  KSCAMERA_EXTENDEDPROP_FIELDOFVIEW2_CONFIGCAPS = tagKSCAMERA_EXTENDEDPROP_FIELDOFVIEW2_CONFIGCAPS;
  PKSCAMERA_EXTENDEDPROP_FIELDOFVIEW2_CONFIGCAPS = ^tagKSCAMERA_EXTENDEDPROP_FIELDOFVIEW2_CONFIGCAPS;

  // #endif (NTDDI_VERSION >= NTDDI_WIN11_ZN)


{NTDDI_VERSION >= NTDDI_WIN10_CO}

  tagKSCAMERA_EXTENDEDPROP_BACKGROUNDSEGMENTATION_CONFIGCAPS = record
    // Output width and height in pixels
    Resolution: SIZE;
    // The maximum frame rate the driver can accommodate  for achieving
    // background segmentation for each frame corresponding to Resolution
    MaxFrameRate: record
      Numerator: LONG;
      Denominator: LONG;
    end;
    // The width and height of the mask produced when streaming
    // with a MediaType corresponding to Resolution and MaxFrameRate
    MaskResolution: SIZE;
    // Optional subtype for which this configuration capability applies. If left
    // to zero, all streams conforming the Resolution and MaxFrameRate will support
    // background segmentation with the specified MaskResolution.
    SubType: TGUID;
  end;
  KSCAMERA_EXTENDEDPROP_BACKGROUNDSEGMENTATION_CONFIGCAPS = tagKSCAMERA_EXTENDEDPROP_BACKGROUNDSEGMENTATION_CONFIGCAPS;
  PKSCAMERA_EXTENDEDPROP_BACKGROUNDSEGMENTATION_CONFIGCAPS = ^tagKSCAMERA_EXTENDEDPROP_BACKGROUNDSEGMENTATION_CONFIGCAPS;


  tagKSCAMERA_METADATA_BACKGROUNDSEGMENTATIONMASK = record
    Header: KSCAMERA_METADATA_ITEMHEADER;
    MaskCoverageBoundingBox: TRect;
    MaskResolution: SIZE;
    ForegroundBoundingBox: TRect;
    MaskData: array[0..0] of Byte;  // Array of mask data of dimension MaskResolution.cx * MaskResolution.cy
  end;
  KSCAMERA_METADATA_BACKGROUNDSEGMENTATIONMASK = tagKSCAMERA_METADATA_BACKGROUNDSEGMENTATIONMASK;
  PKSCAMERA_METADATA_BACKGROUNDSEGMENTATIONMASK = ^tagKSCAMERA_METADATA_BACKGROUNDSEGMENTATIONMASK;

{END NTDDI_VERSION >= NTDDI_WIN10_CO}



  _KSCAMERA_EXTENDEDPROP_PROFILE = record
    ProfileId: TGUID;
    Index: UINT32;
    Reserved: UINT32;
  end;
  KSCAMERA_EXTENDEDPROP_PROFILE = _KSCAMERA_EXTENDEDPROP_PROFILE;
  PKSCAMERA_EXTENDEDPROP_PROFILE = ^_KSCAMERA_EXTENDEDPROP_PROFILE;


const

  KSCAMERAPROFILE_Legacy                  : TGUID = '{B4894D81-62B7-4EEC-8740-80658C4A9D3E}';
  KSCAMERAPROFILE_VideoRecording          : TGUID = '{A0E517E8-8F8C-4F6F-9A57-46FC2F647EC0}';
  KSCAMERAPROFILE_HighQualityPhoto        : TGUID = '{32440725-961B-4CA3-B5B2-854E719D9E1B}';
  KSCAMERAPROFILE_BalancedVideoAndPhoto   : TGUID = '{6B52B017-42C7-4A21-BFE3-23F009149887}';
  KSCAMERAPROFILE_VideoConferencing       : TGUID = '{C5444A88-E1BF-4597-B2DD-9E1EAD864BB8}';
  KSCAMERAPROFILE_PhotoSequence           : TGUID = '{02399D9D-4EE8-49BA-BC07-5FF156531413}';
  KSCAMERAPROFILE_FaceAuth_Mode           : TGUID = '{81361B22-700B-4546-A2D4-C52E907BFC27}';
  KSCAMERAPROFILE_HighFrameRate           : TGUID = '{566E6113-8C35-48E7-B89F-D23FDC1219DC}';
  KSCAMERAPROFILE_HDRWithWCGVideo         : TGUID = '{4B27C336-4924-4989-B994-FDAF1DC7CD85}';
  KSCAMERAPROFILE_HDRWithWCGPhoto         : TGUID = '{9BF6F1FF-B555-4625-B326-A46DEF318FB7}';
  KSCAMERAPROFILE_VariablePhotoSequence   : TGUID = '{9FF2CB56-E75A-49B1-A928-9985D5946F87}';
  KSCAMERAPROFILE_VideoHDR8               : TGUID = '{D4F3F4EC-BDFF-4314-B1D4-008E281F74E7}';
  KSCAMERAPROFILE_CompressedCamera        : TGUID = '{0E34CDC1-27AD-437F-ABDE-02B629F37B44}';

const

  KSCAMERAPROFILE_FLAGS_VIDEOSTABLIZATION       = $0000000000000001;
  KSCAMERAPROFILE_FLAGS_VIDEOHDR                = $0000000000000002;
  KSCAMERAPROFILE_FLAGS_PHOTOHDR                = $0000000000000004;
  KSCAMERAPROFILE_FLAGS_FACEDETECTION           = $0000000000000008;
  KSCAMERAPROFILE_FLAGS_VARIABLEPHOTOSEQUENCE   = $0000000000000010;
  KSCAMERAPROFILE_FLAGS_PREVIEW_RES_MUSTMATCH   = $0000000000000020;

  KSDEVICE_PROFILE_TYPE_UNKNOWN                 = $00000000;
  KSDEVICE_PROFILE_TYPE_CAMERA                  = $00000001;

  //
  // Camera Pin Sensor output type should be in sync with MFFrameSourceTypes
  //
  KSCameraProfileSensorType_RGB                 = $0001;
  KSCameraProfileSensorType_Infrared            = $0002;
  KSCameraProfileSensorType_Depth               = $0004;
  KSCameraProfileSensorType_PoseTracking        = $0008;
  KSCameraProfileSensorType_ImageSegmentation   = $0010;
  KSCameraProfileSensorType_Custom              = $0080;

type

  _KSCAMERA_PROFILE_MEDIAINFO = record
    Resolution: record
      X: UINT32;
      Y: UINT32;
    end;
    MaxFrameRate: record
      Numerator: UINT32;
      Denominator: UINT32;
    end;
    Flags: ULONGLONG;
    Data0: UINT32;
    Data1: UINT32;
    Data2: UINT32;
    Data3: UINT32;
  end;
  KSCAMERA_PROFILE_MEDIAINFO = _KSCAMERA_PROFILE_MEDIAINFO;
  PKSCAMERA_PROFILE_MEDIAINFO = ^_KSCAMERA_PROFILE_MEDIAINFO;


  _KSCAMERA_PROFILE_PININFO = record
    PinCategory: TGUID;
    case Integer of
      0: (PinIndex: USHORT;
          ProfileSensorType: USHORT;
          MediaInfoCount: UINT32;
          MediaInfos: PKSCAMERA_PROFILE_MEDIAINFO);
      1: (Reserved: UINT32);
  end;
  KSCAMERA_PROFILE_PININFO = _KSCAMERA_PROFILE_PININFO;
  PKSCAMERA_PROFILE_PININFO = ^KSCAMERA_PROFILE_PININFO;


  _KSCAMERA_PROFILE_INFO = record
    ProfileId: TGUID;
    Index: UINT32;
    PinCount: UINT32;
    Pins: PKSCAMERA_PROFILE_PININFO;
  end;
  KSCAMERA_PROFILE_INFO = _KSCAMERA_PROFILE_INFO;
  PKSCAMERA_PROFILE_INFO = ^_KSCAMERA_PROFILE_INFO;


  _KSCAMERA_PROFILE_CONCURRENCYINFO = record
    ReferenceGuid: TGUID;
    Reserved: UINT32;
    ProfileCount: UINT32;
    Profiles: PKSCAMERA_PROFILE_INFO;
  end;
  KSCAMERA_PROFILE_CONCURRENCYINFO = _KSCAMERA_PROFILE_CONCURRENCYINFO;
  PKSCAMERA_PROFILE_CONCURRENCYINFO = ^_KSCAMERA_PROFILE_CONCURRENCYINFO;


  _KSDEVICE_PROFILE_INFO = record
    _Type: UINT32;
    Size: UINT32;
    Camera: record
      Info: KSCAMERA_PROFILE_INFO;
      Reserved: UINT32;
      ConcurrencyCount: UINT32;
      Concurrency: PKSCAMERA_PROFILE_CONCURRENCYINFO;
    end;
  end;
  KSDEVICE_PROFILE_INFO = _KSDEVICE_PROFILE_INFO;
  PKSDEVICE_PROFILE_INFO = ^KSDEVICE_PROFILE_INFO;


//#endif // (NTDDI_VERSION >= NTDDI_WINTHRESHOLD)

//#endif // (NTDDI_VERSION >= NTDDI_WIN8)


  _WNF_KSCAMERA_STREAMSTATE_INFO = record
    ProcessId: ULONG;
    SessionId: ULONG;
    StreamState: ULONG;
    Reserved: ULONG;
  end;
  WNF_KSCAMERA_STREAMSTATE_INFO = _WNF_KSCAMERA_STREAMSTATE_INFO;
  PWNF_KSCAMERA_STREAMSTATE_INFO = ^_WNF_KSCAMERA_STREAMSTATE_INFO;


  //
  // Network Camera related definitions
  //
  KSPROPERTY_NETWORKCAMERACONTROL_NTPINFO_TYPE = (
    KSPROPERTY_NETWORKCAMERACONTROL_NTPINFO_TYPE_DISABLE = 0,
    KSPROPERTY_NETWORKCAMERACONTROL_NTPINFO_TYPE_HOSTNTP,
    KSPROPERYT_NETWORKCAMERACONTROL_NTPINFO_TYPE_CUSTOM
  );
  PKSPROPERTY_NETWORKCAMERACONTROL_NTPINFO_TYPE = ^KSPROPERTY_NETWORKCAMERACONTROL_NTPINFO_TYPE;


  KSPROPERTY_NETWORKCAMERACONTROL_NTPINFO_HEADER = record
    Size: ULONG;
    _Type: KSPROPERTY_NETWORKCAMERACONTROL_NTPINFO_TYPE;
  end;
  PKSPROPERTY_NETWORKCAMERACONTROL_NTPINFO_HEADER = ^KSPROPERTY_NETWORKCAMERACONTROL_NTPINFO_HEADER;


  KSPROPERTY_NETWORKCAMERACONTROL_PROPERTY = (
    KSPROPERTY_NETWORKCAMERACONTROL_NTP,
    KSPROPERTY_NETWORKCAMERACONTROL_URI,
//#if(NTDDI_VERSION >= NTDDI_WIN10_FE)
    KSPROPERTY_NETWORKCAMERACONTROL_METADATA,
    KSPROPERTY_NETWORKCAMERACONTROL_EVENTTOPICS_XML
//#endif
  );
  PKSPROPERTY_NETWORKCAMERACONTROL_PROPERTY = ^KSPROPERTY_NETWORKCAMERACONTROL_PROPERTY;

//#if(NTDDI_VERSION >= NTDDI_WIN10_FE)
  KSPROPERTY_NETWORKCAMERACONTROL_METADATA_TYPE = (
    KSPROPERTY_NETWORKCAMERACONTROL_METADATA_TYPE_EVENTSINFO
  );

  _KSPROPERTY_NETWORKCAMERACONTROL_METADATA_INFO = record
    MetadataItems: ULONG;
    Size: ULONG;
    PTZStatus: BOOL;
    Events: BOOL;
    Analytics: BOOL;
    Reserved: BOOL;
  end;
  KSPROPERTY_NETWORKCAMERACONTROL_METADATA_INFO = _KSPROPERTY_NETWORKCAMERACONTROL_METADATA_INFO;
  PKSPROPERTY_NETWORKCAMERACONTROL_METADATA_INFO = ^_KSPROPERTY_NETWORKCAMERACONTROL_METADATA_INFO;

  _KSPROPERTY_NETWORKCAMERACONTROL_EVENT_INFO = record
    Header: KSCAMERA_METADATA_ITEMHEADER;
    EventFilter: array[0..0] of WideChar;
  end;
  KSPROPERTY_NETWORKCAMERACONTROL_EVENT_INFO = _KSPROPERTY_NETWORKCAMERACONTROL_EVENT_INFO;
  PKSPROPERTY_NETWORKCAMERACONTROL_EVENT_INFO = ^_KSPROPERTY_NETWORKCAMERACONTROL_EVENT_INFO;

//#endif


const
  KSPROPERTYSETID_NetworkCameraControl : TGUID = '{0E780F09-5745-4E3A-BC9F-F226EA43A6EC}';

  // end Network Camera related definitions

  //===========================================================================

  PROPSETID_EXT_DEVICE                 : TGUID = '{B5730A90-1A2C-11cf-8C23-00AA006B6814}';

type

  KSPROPERTY_EXTDEVICE = (
    KSPROPERTY_EXTDEVICE_ID,             // R
    KSPROPERTY_EXTDEVICE_VERSION,        // R
    KSPROPERTY_EXTDEVICE_POWER_STATE,    // RW
    KSPROPERTY_EXTDEVICE_PORT,           // R
    KSPROPERTY_EXTDEVICE_CAPABILITIES    // R
  );
  PKSPROPERTY_EXTDEVICE = ^KSPROPERTY_EXTDEVICE;

  tagDEVCAPS = record
    CanRecord: LONG;
    CanRecordStrobe: LONG;
    HasAudio: LONG;
    HasVideo: LONG;
    UsesFiles: LONG;
    CanSave: LONG;
    DeviceType: LONG;
    TCRead: LONG;
    TCWrite: LONG;
    CTLRead: LONG;
    IndexRead: LONG;
    Preroll: LONG;
    Postroll: LONG;
    SyncAcc: LONG;
    NormRate: LONG;
    CanPreview: LONG;
    CanMonitorSrc: LONG;
    CanTest: LONG;
    VideoIn: LONG;
    AudioIn: LONG;
    Calibrate: LONG;
    SeekType: LONG;
    SimulatedHardware: LONG;
  end;
  DEVCAPS = tagDEVCAPS;
  PDEVCAPS = ^tagDEVCAPS;


  KSPROPERTY_EXTDEVICE_S = record
    _Property: KSPROPERTY;
    case Integer of
      0: (u: record
            case Integer of
              0: (Capabilities: DEVCAPS);
              1: (DevPort: ULONG);
              2: (PowerState: ULONG);
              3: (pawchString: array[0..MAX_PATH - 1] of WideChar);
              4: (NodeUniqueID: array[0..1] of DWORD);
          end);
      1: (Capabilities: DEVCAPS);
      2: (DevPort: ULONG);
      3: (PowerState: ULONG);
      4: (pawchString: array[0..MAX_PATH - 1] of WideChar);
      5: (NodeUniqueID: array[0..1] of DWORD);
  end;
  PKSPROPERTY_EXTDEVICE_S = ^KSPROPERTY_EXTDEVICE_S;

  //===========================================================================

const

  PROPSETID_EXT_TRANSPORT : TGUID = '{A03CD5F0-3045-11cf-8C44-00AA006B6814}';

type

  PKSPROPERTY_EXTXPORT = ^KSPROPERTY_EXTXPORT;
  KSPROPERTY_EXTXPORT = ULONG;
const
  KSPROPERTY_EXTXPORT_CAPABILITIES       = KSPROPERTY_EXTXPORT(0);  // (R)  Transport specific capability
  KSPROPERTY_EXTXPORT_INPUT_SIGNAL_MODE  = KSPROPERTY_EXTXPORT(1);  // (RW) Input signal: e.g. dvsd/NTSC/PAL, dvsl/NTSC/PAL, MPEG2-TS etc
  KSPROPERTY_EXTXPORT_OUTPUT_SIGNAL_MODE = KSPROPERTY_EXTXPORT(2);  // (RW) Output signal: e.g. dvsd/NTSC/PAL, dvsl/NTSC/PAL, MPEG2-TS etc
  KSPROPERTY_EXTXPORT_LOAD_MEDIUM        = KSPROPERTY_EXTXPORT(3);  // (RW) Eject, open tray, close tray
  KSPROPERTY_EXTXPORT_MEDIUM_INFO        = KSPROPERTY_EXTXPORT(4);  // (R)  Cassettte type, tape grade and write protection
  KSPROPERTY_EXTXPORT_STATE              = KSPROPERTY_EXTXPORT(5);  // (RW) Current transport mode and state
  KSPROPERTY_EXTXPORT_STATE_NOTIFY       = KSPROPERTY_EXTXPORT(6);  // (RW) Notify of transport mode and state change
  KSPROPERTY_EXTXPORT_TIMECODE_SEARCH    = KSPROPERTY_EXTXPORT(7);  // (W)  Search to a specific timecode on a tape
  KSPROPERTY_EXTXPORT_ATN_SEARCH         = KSPROPERTY_EXTXPORT(8);  // (W)  Search to a specific absolute track number (ATN) on a tape
  KSPROPERTY_EXTXPORT_RTC_SEARCH         = KSPROPERTY_EXTXPORT(9);  // (W)  Search to a specific relative time counter (RTC) on a tape
  KSPROPERTY_RAW_AVC_CMD                 = KSPROPERTY_EXTXPORT(10); // (RW) Issue a raw AVC commnad

type
  tagTRANSPORTSTATUS = record
    Mode: LONG;
    LastError: LONG;
    RecordInhibit: LONG;
    ServoLock: LONG;
    MediaPresent: LONG;
    MediaLength: LONG;
    MediaSize: LONG;
    MediaTrackCount: LONG;
    MediaTrackLength: LONG;
    MediaTrackSide: LONG;
    MediaType: LONG;
    LinkMode: LONG;
    NotifyOn: LONG;
  end;
  TRANSPORTSTATUS = tagTRANSPORTSTATUS;
  PTRANSPORTSTATUS = ^tagTRANSPORTSTATUS;


  tagTRANSPORTBASICPARMS = record
    TimeFormat: LONG;
    TimeReference: LONG;
    Superimpose: LONG;
    EndStopAction: LONG;
    RecordFormat: LONG;
    StepFrames: LONG;
    SetpField: LONG;
    Preroll: LONG;
    RecPreroll: LONG;
    Postroll: LONG;
    EditDelay: LONG;
    PlayTCDelay: LONG;
    RecTCDelay: LONG;
    EditField: LONG;
    FrameServo: LONG;
    ColorFrameServo: LONG;
    ServoRef: LONG;
    WarnGenlock: LONG;
    SetTracking: LONG;
    VolumeName: array[0..39] of WideChar;
    Ballistic: array[0..19] of LONG;
    Speed: LONG;
    CounterFormat: LONG;
    TunerChannel: LONG;
    TunerNumber: LONG;
    TimerEvent: LONG;
    TimerStartDay: LONG;
    TimerStartTime: LONG;
    TimerStopDay: LONG;
    TimerStopTime: LONG;
  end;
  TRANSPORTBASICPARMS = tagTRANSPORTBASICPARMS;
  PTRANSPORTBASICPARMS = ^tagTRANSPORTBASICPARMS;


  tagTRANSPORTVIDEOPARMS = record
    OutputMode: LONG;
    Input: LONG;
  end;
  TRANSPORTVIDEOPARMS = tagTRANSPORTVIDEOPARMS;
  PTRANSPORTVIDEOPARMS = ^tagTRANSPORTVIDEOPARMS;


  tagTRANSPORTAUDIOPARMS = record
    EnableOutput: LONG;
    EnableRecord: LONG;
    EnableSelsync: LONG;
    Input: LONG;
    MonitorSource: LONG;
  end;
  TRANSPORTAUDIOPARMS = tagTRANSPORTAUDIOPARMS;
  PTRANSPORTAUDIOPARMS = ^tagTRANSPORTAUDIOPARMS;


  MEDIUM_INFO = record
    MediaPresent: BOOL;
    MediaType: ULONG;
    RecordInhibit: BOOL;
  end;
  PMEDIUM_INFO = ^MEDIUM_INFO;


  TRANSPORT_STATE = record
    Mode: ULONG;
    State: ULONG;
  end;
  PTRANSPORT_STATE = ^TRANSPORT_STATE;


  KSPROPERTY_EXTXPORT_S = record
    _Property: KSPROPERTY;
    case Integer of
      0: (u: record
            case Integer of
              0: (Capabilities: ULONG);
              1: (SignalMode: ULONG);
              2: (LoadMedium: ULONG);
              3: (MediumInfo: MEDIUM_INFO);
              4: (XPrtState: TRANSPORT_STATE);
              5: (Timecode: record
                    frame: Byte;
                    second: Byte;
                    minute: Byte;
                    hour: Byte;
                  end);
              6: (dwTimecode: DWORD);
              7: (dwAbsTrackNumber: DWORD);
              8: (RawAVC: record
                    PayloadSize: ULONG;
                    Payload: array[0..511] of Byte;
                  end);
          end);
      1: (Capabilities: ULONG);
      2: (SignalMode: ULONG);
      3: (LoadMedium: ULONG);
      4: (MediumInfo: MEDIUM_INFO);
      5: (XPrtState: TRANSPORT_STATE);
      6: (Timecode: record
            frame: Byte;
            second: Byte;
            minute: Byte;
            hour: Byte;
          end);
      7: (dwTimecode: DWORD);
      8: (dwAbsTrackNumber: DWORD);
      9: (RawAVC: record
            PayloadSize: ULONG;
            Payload: array[0..511] of Byte;
          end);
  end;
  PKSPROPERTY_EXTXPORT_S = ^KSPROPERTY_EXTXPORT_S;


  KSPROPERTY_EXTXPORT_NODE_S = record
    NodeProperty: KSP_NODE;
    case Integer of
      0: (u: record
            case Integer of
              0: (Capabilities: ULONG);
              1: (SignalMode: ULONG);
              2: (LoadMedium: ULONG);
              3: (MediumInfo: MEDIUM_INFO);
              4: (XPrtState: TRANSPORT_STATE);
              5: (Timecode: record
                    frame: Byte;
                    second: Byte;
                    minute: Byte;
                    hour: Byte;
                  end);
              6: (dwTimecode: DWORD);
              7: (dwAbsTrackNumber: DWORD);
              8: (RawAVC: record
                    PayloadSize: ULONG;
                    Payload: array[0..511] of Byte;
                  end);
          end);
      1: (Capabilities: ULONG);
      2: (SignalMode: ULONG);
      3: (LoadMedium: ULONG);
      4: (MediumInfo: MEDIUM_INFO);
      5: (XPrtState: TRANSPORT_STATE);
      6: (Timecode: record
            frame: Byte;
            second: Byte;
            minute: Byte;
            hour: Byte;
          end);
      7: (dwTimecode: DWORD);
      8: (dwAbsTrackNumber: DWORD);
      9: (RawAVC: record
            PayloadSize: ULONG;
            Payload: array[0..511] of Byte;
          end);
  end;
  PKSPROPERTY_EXTXPORT_NODE_S = ^KSPROPERTY_EXTXPORT_NODE_S;

  //===========================================================================

const

  PROPSETID_TIMECODE_READER : TGUID = '{9B496CE1-811B-11cf-8C77-00AA006B6814}';

type

  KSPROPERTY_TIMECODE = (
    KSPROPERTY_TIMECODE_READER,     // (R) Timecode for the current tape position
    KSPROPERTY_ATN_READER,          // (R) Absolute track number for the current tape position
    KSPROPERTY_RTC_READER           // (R) Relative time counter for the current tape position
  );
  PKSPROPERTY_TIMECODE = ^KSPROPERTY_TIMECODE;

{$ifndef TIMECODE_DEFINED}
{$define TIMECODE_DEFINED}
  _timecode = record
    case Integer of
      0: (wFrameRate: Word;
          wFrameFract: Word;
          dwFrames: DWORD);
      1: (qw: DWORDLONG);
  end;
  TIMECODE = _timecode;
  PTIMECODE = ^TIMECODE;

  tagTIMECODE_SAMPLE = record
    qwTick: LONGLONG;
    timecode: TIMECODE;
    dwUser: DWORD;
    dwFlags: DWORD;
  end;
  TIMECODE_SAMPLE = tagTIMECODE_SAMPLE;
  PTIMECODE_SAMPLE = ^TIMECODE_SAMPLE;

{$endif} //* TIMECODE_DEFINED */

  KSPROPERTY_TIMECODE_S = record
    _Property: KSPROPERTY;
    TimecodeSamp: TIMECODE_SAMPLE;
  end;
  PKSPROPERTY_TIMECODE_S = ^KSPROPERTY_TIMECODE_S;


  KSPROPERTY_TIMECODE_NODE_S = record
    NodeProperty: KSP_NODE;
    TimecodeSamp: TIMECODE_SAMPLE;
  end;
  PKSPROPERTY_TIMECODE_NODE_S = ^KSPROPERTY_TIMECODE_NODE_S;


  //===========================================================================

const

  KSEVENTSETID_EXTDEV_Command : TGUID = '{109c7988-b3cb-11d2-b48e-006097b3391b}';

type

  KSEVENT_DEVCMD = (
    KSEVENT_EXTDEV_COMMAND_NOTIFY_INTERIM_READY,   // Final response is ready for notify command
    KSEVENT_EXTDEV_COMMAND_CONTROL_INTERIM_READY,  // Final response is ready for control command.
    KSEVENT_EXTDEV_COMMAND_BUSRESET,               // A bus reset has occured.
    KSEVENT_EXTDEV_TIMECODE_UPDATE,                // Timecode has changed.
    KSEVENT_EXTDEV_OPERATION_MODE_UPDATE,          // Operting mode (VCR,Camera, etc.) has changed.
    KSEVENT_EXTDEV_TRANSPORT_STATE_UPDATE,         // Transport state has changed.
    KSEVENT_EXTDEV_NOTIFY_REMOVAL,                 // Device was surprise removal.
    KSEVENT_EXTDEV_NOTIFY_MEDIUM_CHANGE            // Tape medium is removed or added.
  );
  PKSEVENT_DEVCMD = ^KSEVENT_DEVCMD;

//#endif // XP SP2 and later (chronologically)


//===========================================================================
const

  PROPSETID_VIDCAP_CROSSBAR : TGUID = '{6a2e0640-28e4-11d0-a18c-00a0c9118956}';


type

  KSPROPERTY_VIDCAP_CROSSBAR = (
    KSPROPERTY_CROSSBAR_CAPS,                     // R
    KSPROPERTY_CROSSBAR_PININFO,                  // R
    KSPROPERTY_CROSSBAR_CAN_ROUTE,                // R
    KSPROPERTY_CROSSBAR_ROUTE,                    // RW
    KSPROPERTY_CROSSBAR_INPUT_ACTIVE              // R
 );
  PKSPROPERTY_VIDCAP_CROSSBAR = ^KSPROPERTY_VIDCAP_CROSSBAR;


  KSPROPERTY_CROSSBAR_CAPS_S = record
    Property_       : KSPROPERTY;
    NumberOfInputs  : ULONG;     // the number of audio and video input pins
    NumberOfOutputs : ULONG;     // the number of audio and video output pins
  end;
  PKSPROPERTY_CROSSBAR_CAPS_S = ^KSPROPERTY_CROSSBAR_CAPS_S;


  KSPROPERTY_CROSSBAR_PININFO_S = record
    Property_       : KSPROPERTY;
    Direction       : KSPIN_DATAFLOW; // KSPIN_DATAFLOW_IN or KSPIN_DATAFLOW_OUT?
    Index           : ULONG;          // Which pin to return data for?
    PinType         : ULONG;          // KS_PhysConn_Video_* or KS_PhysConn_Audio_*
    RelatedPinIndex : ULONG;          // For video pins, this is the related audio pin
    Medium          : KSPIN_MEDIUM;   // Identifies the hardware connection
  end;
  PKSPROPERTY_CROSSBAR_PININFO_S = ^KSPROPERTY_CROSSBAR_PININFO_S;


  KSPROPERTY_CROSSBAR_ROUTE_S = record
    Property_      : KSPROPERTY;
    IndexInputPin  : ULONG;      // Zero based index of the input pin
    IndexOutputPin : ULONG;      // Zero based index of the output pin
    CanRoute       : ULONG;      // returns non-zero on CAN_ROUTE if routing is possible
  end;
  PKSPROPERTY_CROSSBAR_ROUTE_S = ^KSPROPERTY_CROSSBAR_ROUTE_S;


  PKSPROPERTY_CROSSBAR_ACTIVE_S = ^KSPROPERTY_CROSSBAR_ACTIVE_S;
  KSPROPERTY_CROSSBAR_ACTIVE_S = record
    _Property: KSPROPERTY;
    IndexInputPin: ULONG;           // W - Zero based index of the input pin
    Active: ULONG;                  // R - returns whether an active signal is present on the given input
  end;


const

  EVENTSETID_CROSSBAR : TGUID = '{6a2e0641-28e4-11d0-a18c-00a0c9118956}';


type

  KSEVENT_CROSSBAR = (
    KSEVENT_CROSSBAR_CHANGED);
  PKSEVENT_CROSSBAR = ^KSEVENT_CROSSBAR;

  // The following IDs should match the AM equivalents
  KS_PhysicalConnectorType = (
    KS_PhysConn_Video_Tuner           = 1,
    KS_PhysConn_Video_Composite       = 2,
    KS_PhysConn_Video_SVideo          = 3,
    KS_PhysConn_Video_RGB             = 4,
    KS_PhysConn_Video_YRYBY           = 5,
    KS_PhysConn_Video_SerialDigital   = 6,
    KS_PhysConn_Video_ParallelDigital = 7,
    KS_PhysConn_Video_SCSI            = 8,
    KS_PhysConn_Video_AUX             = 9,
    KS_PhysConn_Video_1394            = 10,
    KS_PhysConn_Video_USB             = 11,
    KS_PhysConn_Video_VideoDecoder    = 12,
    KS_PhysConn_Video_VideoEncoder    = 13,
    KS_PhysConn_Video_SCART           = 14,

    KS_PhysConn_Audio_Tuner           = 4096,
    KS_PhysConn_Audio_Line            = 4097,
    KS_PhysConn_Audio_Mic             = 4098,
    KS_PhysConn_Audio_AESDigital      = 4099,
    KS_PhysConn_Audio_SPDIFDigital    = 4100,
    KS_PhysConn_Audio_SCSI            = 4101,
    KS_PhysConn_Audio_AUX             = 4102,
    KS_PhysConn_Audio_1394            = 4103,
    KS_PhysConn_Audio_USB             = 4104,
    KS_PhysConn_Audio_AudioDecoder    = 4105
  );
  PKS_PhysicalConnectorType = ^KS_PhysicalConnectorType;

//===========================================================================
const

  PROPSETID_VIDCAP_TVAUDIO : TGUID = '{6a2e0650-28e4-11d0-a18c-00a0c9118956}';


type

  KSPROPERTY_VIDCAP_TVAUDIO = (
    KSPROPERTY_TVAUDIO_CAPS,                            // R
    KSPROPERTY_TVAUDIO_MODE,                            // RW
    KSPROPERTY_TVAUDIO_CURRENTLY_AVAILABLE_MODES        // R
  );
  PKSPROPERTY_VIDCAP_TVAUDIO = ^KSPROPERTY_VIDCAP_TVAUDIO;

const

  KS_TVAUDIO_MODE_MONO   = $0001;          // Mono
  KS_TVAUDIO_MODE_STEREO = $0002;          // Stereo
  KS_TVAUDIO_MODE_LANG_A = $0010;          // Primary language
  KS_TVAUDIO_MODE_LANG_B = $0020;          // 2nd avail language
  KS_TVAUDIO_MODE_LANG_C = $0040;          // 3rd avail language


type

  KSPROPERTY_TVAUDIO_CAPS_S = record
    Property_    : KSPROPERTY;
    Capabilities : ULONG; // Bitmask of KS_TVAUDIO_MODE_*
    InputMedium  : KSPIN_MEDIUM;
    OutputMedium : KSPIN_MEDIUM;
  end;
  PKSPROPERTY_TVAUDIO_CAPS_S = ^KSPROPERTY_TVAUDIO_CAPS_S;

  KSPROPERTY_TVAUDIO_S = record
    Property_ : KSPROPERTY;
    Mode : ULONG; // KS_TVAUDIO_MODE_*
  end;
  PKSPROPERTY_TVAUDIO_S = ^KSPROPERTY_TVAUDIO_S;


const

  KSEVENTSETID_VIDCAP_TVAUDIO : TGUID = '{6a2e0651-28e4-11d0-a18c-00a0c9118956}';


type

  KSEVENT_TVAUDIO = (
    KSEVENT_TVAUDIO_CHANGED);
  PKSEVENT_TVAUDIO = ^KSEVENT_TVAUDIO;

//===========================================================================
const

  PROPSETID_VIDCAP_VIDEOCOMPRESSION : TGUID = '{C6E13343-30AC-11d0-A18C-00A0C9118956}';


type
  KSPROPERTY_VIDCAP_VIDEOCOMPRESSION = (
    KSPROPERTY_VIDEOCOMPRESSION_GETINFO,              // R
    KSPROPERTY_VIDEOCOMPRESSION_KEYFRAME_RATE,        // RW
    KSPROPERTY_VIDEOCOMPRESSION_PFRAMES_PER_KEYFRAME, // RW
    KSPROPERTY_VIDEOCOMPRESSION_QUALITY,              // RW
    KSPROPERTY_VIDEOCOMPRESSION_OVERRIDE_KEYFRAME,    // W
    KSPROPERTY_VIDEOCOMPRESSION_OVERRIDE_FRAME_SIZE,  // W
    KSPROPERTY_VIDEOCOMPRESSION_WINDOWSIZE            // RW
  );
  PKSPROPERTY_VIDCAP_VIDEOCOMPRESSION = ^KSPROPERTY_VIDCAP_VIDEOCOMPRESSION;

type
  PKS_CompressionCaps = ^KS_CompressionCaps;
  KS_CompressionCaps = LONG;
const
  KS_CompressionCaps_CanQuality  = KS_CompressionCaps(1);
  KS_CompressionCaps_CanCrunch   = KS_CompressionCaps(2);
  KS_CompressionCaps_CanKeyFrame = KS_CompressionCaps(4);
  KS_CompressionCaps_CanBFrame   = KS_CompressionCaps(8);
  KS_CompressionCaps_CanWindow   = KS_CompressionCaps($10);

type
  KSPROPERTY_VIDEOCOMPRESSION_GETINFO_S = record
    _Property               : KSPROPERTY;
    // Note, no VersionString!
    // Note, no DescriptionString!
    StreamIndex             : ULONG;   // zero based index of stream
    DefaultKeyFrameRate     : longint; // Key frame rate
    DefaultPFrameRate       : longint; // Predeicted frames per Key frame
    DefaultQuality          : longint; // 0 to 10000
    NumberOfQualitySettings : longint; // How many discreet quality settings?
    Capabilities            : longint; // KS_CompressionCaps_*
  end;
  PKSPROPERTY_VIDEOCOMPRESSION_GETINFO_S = ^KSPROPERTY_VIDEOCOMPRESSION_GETINFO_S;


  KSPROPERTY_VIDEOCOMPRESSION_S = record
    _Property   : KSPROPERTY;
    StreamIndex : ULONG;      // zero based index of stream
    Value       : longint;    // value to get or set
  end;
  PKSPROPERTY_VIDEOCOMPRESSION_S = ^KSPROPERTY_VIDEOCOMPRESSION_S;


//===========================================================================
// MEDIASUBTYPE_Overlay
const

  KSDATAFORMAT_SUBTYPE_OVERLAY : TGUID = '{e436eb7f-524f-11ce-9f53-0020af0ba770}';
  KSPROPSETID_OverlayUpdate    : TGUID = '{490EA5CF-7681-11D1-A21C-00A0C9223196}';


type

  KSPROPERTY_OVERLAYUPDATE                 = (
    KSPROPERTY_OVERLAYUPDATE_INTERESTS,
    KSPROPERTY_OVERLAYUPDATE_CLIPLIST      = $1,
    KSPROPERTY_OVERLAYUPDATE_PALETTE       = $2,
    KSPROPERTY_OVERLAYUPDATE_COLORKEY      = $4,
    KSPROPERTY_OVERLAYUPDATE_VIDEOPOSITION = $8,
    KSPROPERTY_OVERLAYUPDATE_DISPLAYCHANGE = $10,
    KSPROPERTY_OVERLAYUPDATE_COLORREF      = $10000000
  );
  PKSPROPERTY_OVERLAYUPDATE = ^KSPROPERTY_OVERLAYUPDATE;


  KSDISPLAYCHANGE = record
    PelsWidth  : ULONG;
    PelsHeight : ULONG;
    BitsPerPel : ULONG;
    DeviceID: array[0..0] of WideChar;
  end;
  PKSDISPLAYCHANGE = ^KSDISPLAYCHANGE;


{#define DEFINE_KSPROPERTY_ITEM_OVERLAYUPDATE_INTERESTS(Handler)\
    DEFINE_KSPROPERTY_ITEM(\
        KSPROPERTY_OVERLAYUPDATE_INTERESTS,\
        (Handler),\
        sizeof(KSPROPERTY),\
        sizeof(ULONG),\
        NULL, NULL, 0, NULL, NULL, 0)

#define DEFINE_KSPROPERTY_ITEM_OVERLAYUPDATE_PALETTE(Handler)\
    DEFINE_KSPROPERTY_ITEM(\
        KSPROPERTY_OVERLAYUPDATE_PALETTE,\
        NULL,\
        sizeof(KSPROPERTY),\
        0,\
        (Handler),\
        NULL, 0, NULL, NULL, 0)

#define DEFINE_KSPROPERTY_ITEM_OVERLAYUPDATE_COLORKEY(Handler)\
    DEFINE_KSPROPERTY_ITEM(\
        KSPROPERTY_OVERLAYUPDATE_COLORKEY,\
        NULL,\
        sizeof(KSPROPERTY),\
        sizeof(COLORKEY),\
        (Handler),\
        NULL, 0, NULL, NULL, 0)

#define DEFINE_KSPROPERTY_ITEM_OVERLAYUPDATE_CLIPLIST(Handler)\
    DEFINE_KSPROPERTY_ITEM(\
        KSPROPERTY_OVERLAYUPDATE_CLIPLIST,\
        NULL,\
        sizeof(KSPROPERTY),\
        2 * sizeof(RECT) + sizeof(RGNDATAHEADER),\
        (Handler),\
        NULL, 0, NULL, NULL, 0)

#define DEFINE_KSPROPERTY_ITEM_OVERLAYUPDATE_VIDEOPOSITION(Handler)\
    DEFINE_KSPROPERTY_ITEM(\
        KSPROPERTY_OVERLAYUPDATE_VIDEOPOSITION,\
        NULL,\
        sizeof(KSPROPERTY),\
        2 * sizeof(RECT),\
        (Handler),\
        NULL, 0, NULL, NULL, 0)

#define DEFINE_KSPROPERTY_ITEM_OVERLAYUPDATE_DISPLAYCHANGE(Handler)\
    DEFINE_KSPROPERTY_ITEM(\
        KSPROPERTY_OVERLAYUPDATE_DISPLAYCHANGE,\
        NULL,\
        sizeof(KSPROPERTY),\
        sizeof(KSDISPLAYCHANGE),\
        (Handler),\
        NULL, 0, NULL, NULL, 0)

#define DEFINE_KSPROPERTY_ITEM_OVERLAYUPDATE_COLORREF(Handler)\
    DEFINE_KSPROPERTY_ITEM(\
        KSPROPERTY_OVERLAYUPDATE_COLORREF,\
        (Handler),\
        sizeof(KSPROPERTY),\
        sizeof(COLORREF),\
        NULL,\
        NULL, 0, NULL, NULL, 0) }

//===========================================================================
const

  PROPSETID_VIDCAP_VIDEOCONTROL : TGUID = '{6a2e0670-28e4-11d0-a18c-00a0c9118956}';


type

  KSPROPERTY_VIDCAP_VIDEOCONTROL = (
    KSPROPERTY_VIDEOCONTROL_CAPS,               // R
    KSPROPERTY_VIDEOCONTROL_ACTUAL_FRAME_RATE,  // R O
    KSPROPERTY_VIDEOCONTROL_FRAME_RATES,        // R O
    KSPROPERTY_VIDEOCONTROL_MODE                // RWO
  );
  PKSPROPERTY_VIDCAP_VIDEOCONTROL = ^KSPROPERTY_VIDCAP_VIDEOCONTROL;

type
  PKS_VideoControlFlags = ^KS_VideoControlFlags;
  KS_VideoControlFlags = ULONG;
const
  KS_VideoControlFlag_FlipHorizontal                 = KS_VideoControlFlags($0001);
  KS_VideoControlFlag_FlipVertical                   = KS_VideoControlFlags($0002);
  KS_Obsolete_VideoControlFlag_ExternalTriggerEnable = KS_VideoControlFlags($0010);  // ***WARNING *** Flag msimatch with DSHOW.
  KS_Obsolete_VideoControlFlag_Trigger               = KS_VideoControlFlags($0020);  // ***WARNING *** Flag msimatch with DSHOW.
  KS_VideoControlFlag_ExternalTriggerEnable          = KS_VideoControlFlags($0004);
  KS_VideoControlFlag_Trigger                        = KS_VideoControlFlags($0008);
  KS_VideoControlFlag_IndependentImagePin            = KS_VideoControlFlags($0040);
  // >= Win 8)
  KS_VideoControlFlag_StillCapturePreviewFrame       = KS_VideoControlFlags($0080);
  KS_VideoControlFlag_StartPhotoSequenceCapture      = KS_VideoControlFlags($0100);
  KS_VideoControlFlag_StopPhotoSequenceCapture       = KS_VideoControlFlags($0200);
  // END >= Win 8


type

  KSPROPERTY_VIDEOCONTROL_CAPS_S = record
    Property_        : KSPROPERTY;
    StreamIndex      : ULONG;
    VideoControlCaps : ULONG;                // KS_VideoControlFlags_*
  end;
  PKSPROPERTY_VIDEOCONTROL_CAPS_S = ^KSPROPERTY_VIDEOCONTROL_CAPS_S;


  KSPROPERTY_VIDEOCONTROL_MODE_S = record
    Property_   : KSPROPERTY;
    StreamIndex : ULONG;
    Mode        : LONG; // KS_VideoControlFlags_*
  end;
  PKSPROPERTY_VIDEOCONTROL_MODE_S = ^KSPROPERTY_VIDEOCONTROL_MODE_S;

  KSPROPERTY_VIDEOCONTROL_ACTUAL_FRAME_RATE_S = record
    Property_                    : KSPROPERTY;
    StreamIndex                  : ULONG; // Index of stream
    RangeIndex                   : ULONG; // Index of range
    Dimensions                   : TSIZE; // Size of image
    CurrentActualFrameRate       : LONGLONG; // Only correct if pin is open
    CurrentMaxAvailableFrameRate : LONGLONG; // Max Rate temporarily limited on USB or 1394?
  end;
  PKSPROPERTY_VIDEOCONTROL_ACTUAL_FRAME_RATE_S = ^KSPROPERTY_VIDEOCONTROL_ACTUAL_FRAME_RATE_S;

  // KSPROPERTY_VIDEOCONTROL_FRAME_RATES returns a list of available frame rates in 100 nS units
  KSPROPERTY_VIDEOCONTROL_FRAME_RATES_S = record
    Property_   : KSPROPERTY;
    StreamIndex : ULONG; // Index of stream
    RangeIndex  : ULONG; // Index of range
    Dimensions  : TSIZE; // Size of image
  end;
  PKSPROPERTY_VIDEOCONTROL_FRAME_RATES_S = ^KSPROPERTY_VIDEOCONTROL_FRAME_RATES_S;

//===========================================================================
const

  PROPSETID_VIDCAP_DROPPEDFRAMES : TGUID = '{C6E13344-30AC-11d0-A18C-00A0C9118956}';


type

  KSPROPERTY_VIDCAP_DROPPEDFRAMES = (
    KSPROPERTY_DROPPEDFRAMES_CURRENT            // R
  );
  PKSPROPERTY_VIDCAP_DROPPEDFRAMES = ^KSPROPERTY_VIDCAP_DROPPEDFRAMES;

  KSPROPERTY_DROPPEDFRAMES_CURRENT_S = record
    Property_        : KSPROPERTY;
    PictureNumber    : LONGLONG; // Current Picture Number
    DropCount        : LONGLONG; // Count of frames dropped
    AverageFrameSize : ULONG;    // Average size of frames captured
  end;
  PKSPROPERTY_DROPPEDFRAMES_CURRENT_S = ^KSPROPERTY_DROPPEDFRAMES_CURRENT_S;

  //===========================================================================
  // VPE
const

  KSPROPSETID_VPConfig    : TGUID = '{bc29a660-30e3-11d0-9e69-00c04fd7c15b}';
  KSPROPSETID_VPVBIConfig : TGUID = '{ec529b00-1a1f-11d1-bad9-00609744111a}';


  // Both of the above property sets use the same list of properties below

type

  KSPROPERTY_VPCONFIG = (
    KSPROPERTY_VPCONFIG_NUMCONNECTINFO,
    KSPROPERTY_VPCONFIG_GETCONNECTINFO,
    KSPROPERTY_VPCONFIG_SETCONNECTINFO,
    KSPROPERTY_VPCONFIG_VPDATAINFO,
    KSPROPERTY_VPCONFIG_MAXPIXELRATE,
    KSPROPERTY_VPCONFIG_INFORMVPINPUT,
    KSPROPERTY_VPCONFIG_NUMVIDEOFORMAT,
    KSPROPERTY_VPCONFIG_GETVIDEOFORMAT,
    KSPROPERTY_VPCONFIG_SETVIDEOFORMAT,
    KSPROPERTY_VPCONFIG_INVERTPOLARITY,
    KSPROPERTY_VPCONFIG_DECIMATIONCAPABILITY,   // E_NOTIMPL for VBI
    KSPROPERTY_VPCONFIG_SCALEFACTOR,            // E_NOTIMPL for VBI
    KSPROPERTY_VPCONFIG_DDRAWHANDLE,
    KSPROPERTY_VPCONFIG_VIDEOPORTID,
    KSPROPERTY_VPCONFIG_DDRAWSURFACEHANDLE,
    KSPROPERTY_VPCONFIG_SURFACEPARAMS
  );
  PKSPROPERTY_VPCONFIG = ^KSPROPERTY_VPCONFIG;



  //=========================
  // IBasicAudio
  //
const

  CLSID_KsIBasicAudioInterfaceHandler : TGUID = '{b9f8ac3e-0f71-11d2-b72c-00c04fb6bd3d}';


type

  KSVPMAXPIXELRATE = record
    Size               : AMVPSIZE;
    MaxPixelsPerSecond : DWORD;
    Reserved           : DWORD;
  end;
  PKSVPMAXPIXELRATE = ^KSVPMAXPIXELRATE;

  KSVPSIZE_PROP = record
    Property_ : KSPROPERTY;
    Size      : AMVPSIZE;
  end;
  PKSVPSIZE_PROP = ^KSVPSIZE_PROP;

  KSVPSURFACEPARAMS = record
    dwPitch   : DWORD;
    dwXOrigin : DWORD;
    dwYOrigin : DWORD;
  end;
  PKSVPSURFACEPARAMS = ^KSVPSURFACEPARAMS;

  //==========================================================================
  // The following definitions must be in sync with DDraw.h in DirectX SDK
  //==========================================================================


  //*
  //* The FourCC code is valid.
  //*

const
  DDPF_FOURCC                         = $00000004;

  // As you can see, this _DDPIXELFORMAT record format is different with the earlier version
  // of DirectDraw.

  //Tony; Note: You have to comment this out, if you are going to use a different
  //version of DirectDraw than the one that comes with Windows 10.

type

  _DDPIXELFORMAT = record
    dwSize: DWORD;
    dwFlags: DWORD;
    dwFourCC: DWORD;
    case Integer of
      0: (dwRGBBitCount: DWORD;
          dwRBitMask: DWORD;
          dwGBitMask: DWORD;
          dwBBitMask: DWORD;
          dwRGBAlphaBitMask: DWORD);
      1: (dwYUVBitCount: DWORD;
          dwYBitMask: DWORD;
          dwUBitMask: DWORD;
          dwVBitMask: DWORD;
          dwYUVAlphaBitMask: DWORD);
      2: (dwZBufferBitDepth: DWORD);
      3: (dwAlphaBitDepth: DWORD);
      4: (_RGBZPadding: array[0..3] of DWORD;
          dwRGBZBitMask: DWORD);
      5: (_YUVZPadding: array[0..3] of DWORD;
          dwYUVZBitMask: DWORD);
  end;
  DDPIXELFORMAT = _DDPIXELFORMAT;
  PDDPIXELFORMAT = ^DDPIXELFORMAT;


  //==========================================================================
  // End of DDraw.h header info
  //==========================================================================


  //==========================================================================
  // The following definitions must be in sync with DVP.h in DirectX SDK
  //==========================================================================


  _DDVIDEOPORTCONNECT = record
    dwSize      : DWORD;     // size of the DDVIDEOPORTCONNECT structure
    dwPortWidth : DWORD;     // Width of the video port
    guidTypeID  : TGUID;     // Description of video port connection
    dwFlags     : DWORD;     // Connection flags
    dwReserved1 : ULONG_PTR; // Reserved, set to zero.
  end;
  DDVIDEOPORTCONNECT = _DDVIDEOPORTCONNECT;
  PDDVIDEOPORTCONNECT = ^DDVIDEOPORTCONNECT;


const

  DDVPTYPE_E_HREFH_VREFH : TGUID = '{54F39980-DA60-11CF-9B06-00A0C903A3B8}';
  DDVPTYPE_E_HREFL_VREFL : TGUID = '{E09C77E0-DA60-11CF-9B06-00A0C903A3B8}';


  //==========================================================================
  // End of DVP.h header info
  //==========================================================================


  //==========================================================================
  // The following definitions must be in sync with VPType.h in AM 2.0 SDK
  //==========================================================================

type

// pixel aspect ratios corresponding to a 720x480 NTSC image or a 720x576 image
  PKS_AMPixAspectRatio = ^KS_AMPixAspectRatio;
  KS_AMPixAspectRatio = ( // AMPixAspectRatio
    KS_PixAspectRatio_NTSC4x3,
    KS_PixAspectRatio_NTSC16x9,
    KS_PixAspectRatio_PAL4x3,
    KS_PixAspectRatio_PAL16x9
  );

  PKS_AMVP_SELECTFORMATBY = ^KS_AMVP_SELECTFORMATBY;
  KS_AMVP_SELECTFORMATBY = ( // AMVP_SELECTFORMATBY
    KS_AMVP_DO_NOT_CARE,
    KS_AMVP_BEST_BANDWIDTH,
    KS_AMVP_INPUT_SAME_AS_OUTPUT);

  PKS_AMVP_MODE = ^KS_AMVP_MODE;
  KS_AMVP_MODE = ( // AMVP_MODE
    KS_AMVP_MODE_WEAVE,
    KS_AMVP_MODE_BOBINTERLEAVED,
    KS_AMVP_MODE_BOBNONINTERLEAVED,
    KS_AMVP_MODE_SKIPEVEN,
    KS_AMVP_MODE_SKIPODD
  );

  PKS_AMVPDIMINFO = ^KS_AMVPDIMINFO;
  tagKS_AMVPDIMINFO = record  // AMVPDIMINFO
    dwFieldWidth  : DWORD;    // [out] field width
    dwFieldHeight : DWORD;    // [out] field height
    dwVBIWidth    : DWORD;    // [out] VBI data width
    dwVBIHeight   : DWORD;    // [out] VBI data height
    rcValidRegion : TRECT;    // [out] valid rect for data cropping
  end;
  KS_AMVPDIMINFO = tagKS_AMVPDIMINFO;


  PKS_AMVPDATAINFO = ^KS_AMVPDATAINFO;
  tagKS_AMVPDATAINFO = record                 // AMVPDATAINFO
    dwSize                 : DWORD;           // Size of the struct
    dwMicrosecondsPerField : DWORD;           // Time taken by each field
    amvpDimInfo            : KS_AMVPDIMINFO;  // Dimensional Information
    dwPictAspectRatioX     : DWORD;           // Pict aspect ratio in X dimn
    dwPictAspectRatioY     : DWORD;           // Pict aspect ratio in Y dimn
    bEnableDoubleClock     : BOOL;            // Videoport should enable double clocking
    bEnableVACT            : BOOL;            // Videoport should use an external VACT signal
    bDataIsInterlaced      : BOOL;            // Indicates that the signal is interlaced
    lHalfLinesOdd          : LONG;            // number of halflines in the odd field
    bFieldPolarityInverted : BOOL;            // Device inverts the polarity by default
    dwNumLinesInVREF       : DWORD;           // Number of lines of data in VREF
    lHalfLinesEven         : LONG;            // number of halflines in the even field
    dwReserved1            : DWORD;           // Reserved for future use
  end;
  KS_AMVPDATAINFO = tagKS_AMVPDATAINFO;

  PKS_AMVPSIZE = ^KS_AMVPSIZE;
  tagKS_AMVPSIZE = record        // AMVPSIZE
    dwWidth  : DWORD;            // [in] width in pixels
    dwHeight : DWORD;            // [in] height in pixels
  end;
  KS_AMVPSIZE = tagKS_AMVPSIZE;

  //==========================================================================
  // End of VPType.h header info
  //==========================================================================


  //
  //  IVPNotify event notification
  //
const

  KSEVENTSETID_VPNotify : TGUID = '{20c5598e-d3c8-11d0-8dfc-00c04fd7c08b}';


type

  PKSEVENT_VPNOTIFY = ^KSEVENT_VPNOTIFY;
  KSEVENT_VPNOTIFY = (
    KSEVENT_VPNOTIFY_FORMATCHANGE
  );

  //
  //  VIDCAPTOSTI event notification
  //
const

  KSEVENTSETID_VIDCAPTOSTI : TGUID = '{DB47DE20-F628-11d1-BA41-00A0C90D2B05}';


type

  PKSEVENT_VIDCAPTOSTI = ^KSEVENT_VIDCAPTOSTI;
  KSEVENT_VIDCAPTOSTI = (
    KSEVENT_VIDCAPTOSTI_EXT_TRIGGER,
    KSEVENT_VIDCAP_AUTO_UPDATE,
    KSEVENT_VIDCAP_SEARCH
  );

  //
  // Extension Unit Properties
  //
const

  KSPROPERTY_EXTENSION_UNIT_PASS_THROUGH = $ffff;    // (RW)


type

  PKSPROPERTY_EXTENSION_UNIT = ^KSPROPERTY_EXTENSION_UNIT;
  KSPROPERTY_EXTENSION_UNIT = (
    KSPROPERTY_EXTENSION_UNIT_INFO,                  // (R)
    KSPROPERTY_EXTENSION_UNIT_CONTROL                // (RW)
  );


  //
  //  IVPVBINotify event notification
  //
const

  KSEVENTSETID_VPVBINotify : TGUID = '{ec529b01-1a1f-11d1-bad9-00609744111a}';


type

  PKSEVENT_VPVBINOTIFY = ^KSEVENT_VPVBINOTIFY;
  KSEVENT_VPVBINOTIFY = (
    KSEVENT_VPVBINOTIFY_FORMATCHANGE
  );

  //
  // closed caption information
  //
const

  KSDATAFORMAT_TYPE_AUXLine21Data       : TGUID = '{670aea80-3a82-11d0-b79b-00aa003767a7}';
  KSDATAFORMAT_SUBTYPE_Line21_BytePair  : TGUID = '{6e8d4a22-310c-11d0-b79a-00aa003767a7}';
  KSDATAFORMAT_SUBTYPE_Line21_GOPPacket : TGUID = '{6e8d4a23-310c-11d0-b79a-00aa003767a7}';


type

  PKSGOP_USERDATA = ^KSGOP_USERDATA;
  _KSGOP_USERDATA = record
    sc        : ULONG;
    reserved1 : ULONG;
    cFields   : BYTE;
    l21Data: array[0..2] of AnsiChar;
  end;
  KSGOP_USERDATA = _KSGOP_USERDATA;


  //
  // DVD encrypted PACK format type definition
  //
const

  KSDATAFORMAT_TYPE_DVD_ENCRYPTED_PACK : TGUID = '{ed0b916a-044d-11d1-aa78-00c04fc31d60}';

  KS_AM_UseNewCSSKey = $1;


  // -----------------------------------------------------------------------
  // KS_AM_KSPROPSETID_TSRateChange property set definitions for time stamp
  // rate changes.
  // -----------------------------------------------------------------------

  KSPROPSETID_TSRateChange : TGUID = '{A503C5C0-1D1D-11D1-AD80-444553540000}';


type

  PKS_AM_PROPERTY_TS_RATE_CHANGE = ^KS_AM_PROPERTY_TS_RATE_CHANGE;
  KS_AM_PROPERTY_TS_RATE_CHANGE = (
    KS_AM_RATE_SimpleRateChange = 1,  // rw, use KS_AM_SimpleRateChange
    KS_AM_RATE_ExactRateChange  = 2,  // rw, use KS_AM_ExactRateChange
    KS_AM_RATE_MaxFullDataRate  = 3,  // r, use KS_AM_MaxFullDataRate
    KS_AM_RATE_Step             = 4   // w, use KS_AM_Step
  );


  PKS_AM_SimpleRateChange = ^KS_AM_SimpleRateChange;
  KS_AM_SimpleRateChange = record
    // this is the simplest mechanism to set a time stamp rate change on
    // a filter (simplest for the person setting the rate change, harder
    // for the filter doing the rate change).
    StartTime : LONGLONG;  //stream time at which to start this rate
    Rate      : LONG;      //new rate * 10000 (decimal)
  end;

  PKS_AM_ExactRateChange = ^KS_AM_ExactRateChange;
  KS_AM_ExactRateChange = record
    OutputZeroTime : LONGLONG; //input TS that maps to zero output TS
    Rate           : LONG;     //new rate * 10000 (decimal)
  end;



  KS_AM_MaxFullDataRate = type LONG; //rate * 10000 (decimal)
  KS_AM_Step = type DWORD; // number of frame to step


  //===========================================================================
  //ENCODER API DEFINITIONS
  //===========================================================================
const

  KSCATEGORY_ENCODER         : TGUID = '{19689BF6-C384-48fd-AD51-90E58C79F70B}';
  KSCATEGORY_MULTIPLEXER     : TGUID = '{7A5DE1D3-01A1-452c-B481-4FA2B96271E8}';

  ENCAPIPARAM_BITRATE        : TGUID = '{49CC4C43-CA83-4ad4-A9AF-F3696AF666DF}';
  ENCAPIPARAM_PEAK_BITRATE   : TGUID = '{703F16A9-3D48-44a1-B077-018DFF915D19}';
  ENCAPIPARAM_BITRATE_MODE   : TGUID = '{EE5FB25C-C713-40d1-9D58-C0D7241E250F}';

  // deprecated
  CODECAPI_CHANGELISTS       : TGUID = '{62B12ACF-F6B0-47D9-9456-96F22C4E0B9D}';
  CODECAPI_VIDEO_ENCODER     : TGUID = '{7112E8E1-3D03-47EF-8E60-03F1CF537301}';
  CODECAPI_AUDIO_ENCODER     : TGUID = '{B9D19A3E-F897-429C-BC46-8138B7272B2D}';
  CODECAPI_SETALLDEFAULTS    : TGUID = '{6C5E6A7C-ACF8-4F55-A999-1A628109051B}';
  CODECAPI_ALLSETTINGS       : TGUID = '{6A577E92-83E1-4113-ADC2-4FCEC32F83A1}';
  CODECAPI_SUPPORTSEVENTS    : TGUID = '{0581AF97-7693-4DBD-9DCA-3F9EBD6585A1}';
  CODECAPI_CURRENTCHANGELIST : TGUID = '{1CB14E83-7D72-4657-83FD-47A2C5B9D13D}';


type

  PVIDEOENCODER_BITRATE_MODE = ^VIDEOENCODER_BITRATE_MODE;
  VIDEOENCODER_BITRATE_MODE = (
    //
    // Bit rate used for encoding is constant
    //
    ConstantBitRate = 0,

    //
    // Bit rate used for encoding is variable with the specified bitrate used
    // as a guaranteed average over a specified window.  The default window
    // size is considered to be 5 minutes.
    //
    VariableBitRateAverage = 1,

    //
    // Bit rate used for encoding is variable with the specified bitrate used
    // as an average with a peak not to exceed the specified peak bitrate over
    // a specified window.  The default window size is considered to be 500ms
    // (classically one GOP).
    //
    VariableBitRatePeak  = 2
  );


  //===========================================================================
  // JACK DESCRIPTION DEFINITIONS
  //===========================================================================

const

  KSPROPSETID_Jack : TGUID = '{4509F757-2D46-4637-8E62-CE7DB944F57B}';

type

  // define new property id
  PKSPROPERTY_JACK = ^KSPROPERTY_JACK;
  KSPROPERTY_JACK = (
    KSPROPERTY_JACK_DESCRIPTION  = 1,
    KSPROPERTY_JACK_DESCRIPTION2 = 2,
    KSPROPERTY_JACK_SINK_INFO    = 3,
    KSPROPERTY_JACK_CONTAINERID  = 4,
    // if (NTDDI_VERSION >= NTDDI_WIN10_NI)
    KSPROPERTY_JACK_DESCRIPTION3 = 5
    //endif // (NTDDI_VERSION >= NTDDI_WIN10_NI)
  );

  // Enums used in KSPROPERTY_JACK_INFO_STRUCT

  PEPcxConnectionType = ^TEPcxConnectionType;
  EPcxConnectionType = (
    eConnTypeUnknown,
    eConnType3Point5mm,
    eConnTypeQuarter,
    eConnTypeAtapiInternal,
    eConnTypeRCA,
    eConnTypeOptical,
    eConnTypeOtherDigital,
    eConnTypeOtherAnalog,
    eConnTypeMultichannelAnalogDIN,
    eConnTypeXlrProfessional,
    eConnTypeRJ11Modem,
    eConnTypeCombination
  );
  TEPcxConnectionType = EPcxConnectionType;

  // eGeoLocReserved5                    = eGeoLocNotApplicable;

  PEPcxGeoLocation = ^EPcxGeoLocation;
  EPcxGeoLocation = (
    eGeoLocRear = $1,
    eGeoLocFront,
    eGeoLocLeft,
    eGeoLocRight,
    eGeoLocTop,
    eGeoLocBottom,
    eGeoLocRearPanel,
    eGeoLocRiser,
    eGeoLocInsideMobileLid,
    eGeoLocDrivebay,
    eGeoLocHDMI,
    eGeoLocOutsideMobileLid,
    eGeoLocATAPI,
    eGeoLocNotApplicable,
    eGeoLocReserved6,
    EPcxGeoLocation_enum_count
  );

  PEPcxGenLocation = ^EPcxGenLocation;
  EPcxGenLocation = (
    eGenLocPrimaryBox = 0,
    eGenLocInternal = 1,
    eGenLocSeparate = 2,
    eGenLocOther = 3,
    EPcxGenLocation_enum_count = 4
  );

  EPxcPortConnection = (
    ePortConnJack = 0,
    ePortConnIntegratedDevice = 1,
    ePortConnBothIntegratedAndJack = 2,
    ePortConnUnknown = 3
  );
  TEPxcPortConnection = EPxcPortConnection;

  // structure for KSPROPERTY_JACK_DESCRIPTION pin property
  PKSJACK_DESCRIPTION = ^KSJACK_DESCRIPTION;
  KSJACK_DESCRIPTION = record
    ChannelMapping: DWORD;
    Color: DWORD;                   // 0x00rrggbb; (NOT a COLORREF)
    ConnectionType: EPcxConnectionType;
    GeoLocation: EPcxGeoLocation;
    GenLocation: EPcxGenLocation;
    PortConnection: EPxcPortConnection;
    IsConnected: BOOL;
  end;

  PKSJACK_SINK_CONNECTIONTYPE = ^KSJACK_SINK_CONNECTIONTYPE;
  KSJACK_SINK_CONNECTIONTYPE = (
    KSJACK_SINK_CONNECTIONTYPE_HDMI = 0,          // HDMI
    KSJACK_SINK_CONNECTIONTYPE_DISPLAYPORT = 1    // DisplayPort
  );


const

  MAX_SINK_DESCRIPTION_NAME_LENGTH = 32;


type

  PKSJACK_SINK_INFORMATION = ^_tagKSJACK_SINK_INFORMATION;
  _tagKSJACK_SINK_INFORMATION = record
    ConnType: KSJACK_SINK_CONNECTIONTYPE;                                          // Connection Type
    ManufacturerId: WORD;                                                          // Sink manufacturer ID
    ProductId: WORD;                                                               // Sink product ID
    AudioLatency: WORD;                                                            // Sink audio latency
    HDCPCapable: BOOL;                                                             // HDCP Support
    AICapable: BOOL;                                                               // ACP Packet, ISRC1, and ISRC2 Support
    SinkDescriptionLength: UCHAR;                                                  // Monitor/Sink name length
    SinkDescription: array[0..MAX_SINK_DESCRIPTION_NAME_LENGTH - 1] of WCHAR;      // Monitor/Sink name
    PortId: LUID;                                                                  // Video port identifier
  end;
  KSJACK_SINK_INFORMATION = _tagKSJACK_SINK_INFORMATION;


const

  JACKDESC2_PRESENCE_DETECT_CAPABILITY       = $00000001;
  JACKDESC2_DYNAMIC_FORMAT_CHANGE_CAPABILITY = $00000002;


type
  // This record is also defined in MfPack.DeviceTopology.pas !
  PKSJACK_DESCRIPTION2 = ^_tagKSJACK_DESCRIPTION2;
  _tagKSJACK_DESCRIPTION2 = record
    DeviceStateInfo: DWORD;         // Top 16 bits: Report current device state, active, streaming, idle, or hardware not ready
                                    // Bottom 16 bits: detailed reason to further explain state in top 16 bits
    JackCapabilities: DWORD;        // Report jack capabilities such as jack presence detection capability
                                    // or dynamic format changing capability
  end;
  KSJACK_DESCRIPTION2 = _tagKSJACK_DESCRIPTION2;

  // if (NTDDI_VERSION >= NTDDI_WIN10_NI)
  PKSJACK_DESCRIPTION3 = ^_tagKSJACK_DESCRIPTION3;
  _tagKSJACK_DESCRIPTION3 = record
    ConfigId: ULONG;                // Driver defined bitmask or enum describing the current configuration, changing this value causes
                                    // audioendpointbuilder to refresh the cache to ensure that the published endpoint matches the current config.
  end;
  KSJACK_DESCRIPTION3 = _tagKSJACK_DESCRIPTION3;
  //endif // (NTDDI_VERSION >= NTDDI_WIN10_NI)


// NTDDI_VERSION >= NTDDI_WIN10_VB

  //===========================================================================
  // AUDIO POSTURE DEFINITIONS
  //===========================================================================
  // {A3FB7B0D-474E-4F51-A379-51282DD4FA8F}

const

  KSPROPSETID_AudioPosture : TGUID = '{A3FB7B0D-474E-4F51-A379-51282DD4FA8F}';

type

  PKSPROPERTY_AUDIOPOSTURE = ^KSPROPERTY_AUDIOPOSTURE;
  KSPROPERTY_AUDIOPOSTURE = (
    KSPROPERTY_AUDIOPOSTURE_ORIENTATION = 1);

  PAUDIOPOSTURE_ORIENTATION = ^AUDIOPOSTURE_ORIENTATION;
  AUDIOPOSTURE_ORIENTATION = (
    AUDIOPOSTURE_ORIENTATION_NOTROTATED = 0,
    AUDIOPOSTURE_ORIENTATION_ROTATED90DEGREESCOUNTERCLOCKWISE,
    AUDIOPOSTURE_ORIENTATION_ROTATED180DEGREESCOUNTERCLOCKWISE,
    AUDIOPOSTURE_ORIENTATION_ROTATED270DEGREESCOUNTERCLOCKWISE
  );

// end NTDDI_VERSION >= NTDDI_WIN10_FE


  //===========================================================================
  // Audio Buffer Duration
const

  KSPROPSETID_AudioBufferDuration : TGUID = '{4E73C07F-23CC-4955-A7EA-3DA502496290}';

  // define new property id
  KSPROPERTY_AUDIO_BUFFER_DURATION = 1;

  //===========================================================================
  // HARDWARE AUDIO ENGINE DEFINITIONS
  //===========================================================================

  KSPROPSETID_AudioEngine : TGUID = '{3A2F82DC-886F-4BAA-9EB4-082B9025C536}';

type

  KSPROPERTY_AUDIOENGINE                          = (
    KSPROPERTY_AUDIOENGINE_LFXENABLE              = 0,
    KSPROPERTY_AUDIOENGINE_GFXENABLE              = 1,
    KSPROPERTY_AUDIOENGINE_MIXFORMAT              = 2,
    // constant "3" was skipped on purpose for backward compatibility
    // from the removal of unused KSPROPERTY_AUDIOENGINE_PROCESSINGPERIOD
    KSPROPERTY_AUDIOENGINE_DEVICEFORMAT           = 4,
    KSPROPERTY_AUDIOENGINE_SUPPORTEDDEVICEFORMATS = 5,
    KSPROPERTY_AUDIOENGINE_DESCRIPTOR             = 6,
    KSPROPERTY_AUDIOENGINE_BUFFER_SIZE_RANGE      = 7,
    KSPROPERTY_AUDIOENGINE_LOOPBACK_PROTECTION    = 8,
    KSPROPERTY_AUDIOENGINE_VOLUMELEVEL            = 9
  );
  PKSPROPERTY_AUDIOENGINE = ^KSPROPERTY_AUDIOENGINE;

  _tagKSAUDIOENGINE_DESCRIPTOR = record
    nHostPinId: UINT;
    nOffloadPinId: UINT;
    nLoopbackPinId: UINT;
  end;
  KSAUDIOENGINE_DESCRIPTOR = _tagKSAUDIOENGINE_DESCRIPTOR;
  PKSAUDIOENGINE_DESCRIPTOR = ^_tagKSAUDIOENGINE_DESCRIPTOR;

  _tagKSAUDIOENGINE_BUFFER_SIZE_RANGE = record
    MinBufferBytes: ULONG;
    MaxBufferBytes: ULONG;
  end;
  KSAUDIOENGINE_BUFFER_SIZE_RANGE = _tagKSAUDIOENGINE_BUFFER_SIZE_RANGE;
  PKSAUDIOENGINE_BUFFER_SIZE_RANGE = ^_tagKSAUDIOENGINE_BUFFER_SIZE_RANGE;


  AUDIO_CURVE_TYPE                = (
    AUDIO_CURVE_TYPE_NONE         = 0,
    AUDIO_CURVE_TYPE_WINDOWS_FADE = 1
  );
  PAUDIO_CURVE_TYPE = ^AUDIO_CURVE_TYPE;

  _tagKSAUDIOENGINE_VOLUMELEVEL = record
    TargetVolume: LONG;
    CurveType: AUDIO_CURVE_TYPE;
    CurveDuration: ULONGLONG;
  end;
  KSAUDIOENGINE_VOLUMELEVEL = _tagKSAUDIOENGINE_VOLUMELEVEL;
  PKSAUDIOENGINE_VOLUMELEVEL = ^_tagKSAUDIOENGINE_VOLUMELEVEL;

  // if (NTDDI_VERSION >= NTDDI_WIN10_NI)
  PEDeviceControlUseType = ^EDeviceControlUseType;
  EDeviceControlUseType        = (
    eDeviceControlUseMissing   = 0,
    eDeviceControlUsePrimary   = 1,
    eDeviceControlUseSecondary = 2
  );

  PKSAUDIOENGINE_DEVICECONTROLS = ^_tagKSAUDIOENGINE_DEVICECONTROLS;
  _tagKSAUDIOENGINE_DEVICECONTROLS = record
    Volume: EDeviceControlUseType;
    Mute: EDeviceControlUseType;
    PeakMeter: EDeviceControlUseType;
  end;
  KSAUDIOENGINE_DEVICECONTROLS = _tagKSAUDIOENGINE_DEVICECONTROLS;
  // endif // (NTDDI_VERSION >= NTDDI_WIN10_NI)



  //===========================================================================
  // AUDIO SIGNAL PROCESSING DEFINITIONS
  //===========================================================================

const

  KSPROPSETID_AudioSignalProcessing : TGUID = '{4F67B528-30C9-40DE-B2FB-859DDD1F3470}';

type

  PKSPROPERTY_AUDIOSIGNALPROCESSING = ^KSPROPERTY_AUDIOSIGNALPROCESSING;
  KSPROPERTY_AUDIOSIGNALPROCESSING = (
    KSPROPERTY_AUDIOSIGNALPROCESSING_MODES);

const

  KSATTRIBUTEID_AUDIOSIGNALPROCESSING_MODE : TGUID = '{E1F89EB5-5F46-419B-967B-FF6770B98401}';

type
  // Define structure of the KSATTRIBUTE_AUDIOSIGNALPROCESSING_MODE attribute
  PKSATTRIBUTE_AUDIOSIGNALPROCESSING_MODE = ^tagKSATTRIBUTE_AUDIOSIGNALPROCESSING_MODE;
  tagKSATTRIBUTE_AUDIOSIGNALPROCESSING_MODE = record
    AttributeHeader: KSATTRIBUTE;
    SignalProcessingMode: TGUID;
  end;
  KSATTRIBUTE_AUDIOSIGNALPROCESSING_MODE  = tagKSATTRIBUTE_AUDIOSIGNALPROCESSING_MODE;

const

  AUDIO_SIGNALPROCESSINGMODE_DEFAULT            : TGUID = '{C18E2F7E-933D-4965-B7D1-1EEF228D2AF3}';
  AUDIO_SIGNALPROCESSINGMODE_RAW                : TGUID = '{9E90EA20-B493-4FD1-A1A8-7E1361A956CF}';

  // #if (NTDDI_VERSION >= NTDDI_WIN10_CU)
  //============================================================================
  // AUDIO LOOPBACK DEFINITIONS
  //============================================================================
  KSPROPSETID_AudioLoopback : TGUID = '{B3648BC8-5B91-468A-B94D-F4641250917C}';

type
  PKSPROPERTY_AUDIOLOOPBACK = ^KSPROPERTY_AUDIOLOOPBACK;
  KSPROPERTY_AUDIOLOOPBACK = (
    KSPROPERTY_AUDIOLOOPBACK_TAPPOINT_CAPS
  );

const
  AUDIOLOOPBACK_TAPPOINT_CAPS_PREVOLUMEMUTE= ($1);
  AUDIOLOOPBACK_TAPPOINT_CAPS_POSTVOLUMEMUTE= ($2);

  KSATTRIBUTEID_AUDIOLOOPBACK_TAPPOINT : TGUID = '{2795A0F7-1688-44FE-BC14-BF8273992141}';

type
  PAUDIOLOOPBACK_TAPPOINT_TYPE = ^AUDIOLOOPBACK_TAPPOINT_TYPE;
  tagAUDIOLOOPBACK_TAPPOINT_TYPE = (
    AUDIOLOOPBACK_TAPPOINT_PREVOLUMEMUTE,
    AUDIOLOOPBACK_TAPPOINT_POSTVOLUMEMUTE
  );
  AUDIOLOOPBACK_TAPPOINT_TYPE = tagAUDIOLOOPBACK_TAPPOINT_TYPE;

  // Define structure of the KSATTRIBUTE_AUDIOLOOPBACK_TAPPOINT attribute
  tagKSATTRIBUTE_AUDIOLOOPBACK_TAPPOINT = record
    AttributeHeader: KSATTRIBUTE;
    TapPoint: AUDIOLOOPBACK_TAPPOINT_TYPE;
  end;
  KSATTRIBUTE_AUDIOLOOPBACK_TAPPOINT = tagKSATTRIBUTE_AUDIOLOOPBACK_TAPPOINT;
  PKSATTRIBUTE_AUDIOLOOPBACK_TAPPOINT = ^tagKSATTRIBUTE_AUDIOLOOPBACK_TAPPOINT;
  // #endif (NTDDI_VERSION >= NTDDI_WIN10_CU)

{NTDDI_VERSION >= NTDDI_WIN10_CO}


//===========================================================================
// AUDIO RESOURCE MANAGEMENT DEFINITIONS
//===========================================================================
  // {D0B305E1-B2CC-484C-8F23-E5D28AD9CF88}
const
  KSPROPSETID_AudioResourceManagement           : TGUID = '{D0B305E1-B2CC-484C-8F23-E5D28AD9CF88}';

  // define new property id
type

  PKSPROPERTY_AUDIORESOURCEMANAGEMENT = ^KSPROPERTY_AUDIORESOURCEMANAGEMENT;
  KSPROPERTY_AUDIORESOURCEMANAGEMENT = (
    KSPROPERTY_AUDIORESOURCEMANAGEMENT_RESOURCEGROUP
  );


const MAX_RESOURCEGROUPID_LENGTH = 256;

  // structure for KSPROPERTY_AUDIORESOURCEMANAGEMENT_RESOURCEGROUP
type

  AUDIORESOURCEMANAGEMENT_RESOURCEGROUP = record
    ResourceGroupAcquired: BOOL;
    ResourceGroupName: array[0..MAX_RESOURCEGROUPID_LENGTH - 1] of WideChar;
  end;
  PAUDIORESOURCEMANAGEMENT_RESOURCEGROUP = ^AUDIORESOURCEMANAGEMENT_RESOURCEGROUP;

{END NTDDI_VERSION >= NTDDI_WIN10_CO}


  //
  // UUIDs defined for Bluetooth Midi
  //

//#if (NTDDI_VERSION >= NTDDI_WIN10_RS1)

const

  // Bluetooth MIDI service UUID
  BLUETOOTHLE_MIDI_SERVICE_UUID                 : TGUID = '{03B80E5A-EDE8-4B33-A751-6CE34EC4C700}';

  // Bluetooth MIDI IO Characteristic UUID
  BLUETOOTH_MIDI_DATAIO_CHARACTERISTIC          : TGUID = '{7772E5DB-3868-4112-A1A9-F2669D106BF3}';

  //
  // UUID for Audio Processing Object (APO) device class
  //
  APO_CLASS_UUID                                : TGUID = '{5989fce8-9cd0-467d-8a6a-5419e31529d4}';

  //
  // UUID for audio endpoint device class
  //
  AUDIOENDPOINT_CLASS_UUID                      : TGUID = '{C166523C-FE0C-4A94-A586-F1A80CFBBF3E}';

//#endif // (NTDDI_VERSION >= NTDDI_WIN10_RS1)


  // >= Win 10
  // Communications mode specifies that the application expects VoIP specific signal processing at the lowest latency and the hardware preferred sample rate for wideband speech (such as 16 kHz).
  // For both Capture and Render.
  AUDIO_SIGNALPROCESSINGMODE_COMMUNICATIONS     : TGUID = '{98951333-B9CD-48B1-A0A3-FF40682D73F7}';
  // Speech mode specifies that the application expects speech recognition specific signal processing at the lowest latency and the hardware preferred sample rate for wideband speech (such as 16 kHz).
  // For Capture only.
  AUDIO_SIGNALPROCESSINGMODE_SPEECH             : TGUID = '{FC1CFC9B-B9D6-4CFA-B5E0-4BB2166878B2}';
  // Notification Mode
  // For both render and capture.
  AUDIO_SIGNALPROCESSINGMODE_NOTIFICATION       : TGUID = '{9CF2A70B-F377-403B-BD6B-360863E0355C}';
  // Media Mode specifies that the application expects post processing suitable for media content if available or else the same treatments as Default mode.
  // For Render only.
  AUDIO_SIGNALPROCESSINGMODE_MEDIA              : TGUID = '{4780004E-7133-41D8-8C74-660DADD2C0EE}';
  // Movie Mode specifies that the application expects post processing suitable for movie or video content if available or else the same treatments as Default mode.
  AUDIO_SIGNALPROCESSINGMODE_MOVIE              : TGUID = '{B26FEB0D-EC94-477C-9494-D1AB8E753F6E}';
  // END >= Win 10
  // #if (NTDDI_VERSION >= NTDDI_WIN10_FE)
  // Far-Field speech mode specifies that the application expects speech recognition from the far-field
  // For capture only
  STATIC_AUDIO_SIGNALPROCESSINGMODE_FAR_FIELD_SPEECH : TGUID = '{28941CBA-3BE6-4A78-9A76-30FD91559B64}';
  //#endif

  AUDIO_EFFECT_TYPE_ACOUSTIC_ECHO_CANCELLATION  : TGUID = '{6f64adbe-8211-11e2-8c70-2c27d7f001fa}';
  AUDIO_EFFECT_TYPE_NOISE_SUPPRESSION           : TGUID = '{6f64adbf-8211-11e2-8c70-2c27d7f001fa}';
  AUDIO_EFFECT_TYPE_AUTOMATIC_GAIN_CONTROL      : TGUID = '{6f64adc0-8211-11e2-8c70-2c27d7f001fa}';
  AUDIO_EFFECT_TYPE_BEAMFORMING                 : TGUID = '{6f64adc1-8211-11e2-8c70-2c27d7f001fa}';
  AUDIO_EFFECT_TYPE_CONSTANT_TONE_REMOVAL       : TGUID = '{6f64adc2-8211-11e2-8c70-2c27d7f001fa}';
  AUDIO_EFFECT_TYPE_EQUALIZER                   : TGUID = '{6f64adc3-8211-11e2-8c70-2c27d7f001fa}';
  AUDIO_EFFECT_TYPE_LOUDNESS_EQUALIZER          : TGUID = '{6f64adc4-8211-11e2-8c70-2c27d7f001fa}';
  AUDIO_EFFECT_TYPE_BASS_BOOST                  : TGUID = '{6f64adc5-8211-11e2-8c70-2c27d7f001fa}';
  AUDIO_EFFECT_TYPE_VIRTUAL_SURROUND            : TGUID = '{6f64adc6-8211-11e2-8c70-2c27d7f001fa}';
  AUDIO_EFFECT_TYPE_VIRTUAL_HEADPHONES          : TGUID = '{6f64adc7-8211-11e2-8c70-2c27d7f001fa}';
  AUDIO_EFFECT_TYPE_SPEAKER_FILL                : TGUID = '{6f64adc8-8211-11e2-8c70-2c27d7f001fa}';
  AUDIO_EFFECT_TYPE_ROOM_CORRECTION             : TGUID = '{6f64adc9-8211-11e2-8c70-2c27d7f001fa}';
  AUDIO_EFFECT_TYPE_BASS_MANAGEMENT             : TGUID = '{6f64adca-8211-11e2-8c70-2c27d7f001fa}';
  AUDIO_EFFECT_TYPE_ENVIRONMENTAL_EFFECTS       : TGUID = '{6f64adcb-8211-11e2-8c70-2c27d7f001fa}';
  AUDIO_EFFECT_TYPE_SPEAKER_PROTECTION          : TGUID = '{6f64adcc-8211-11e2-8c70-2c27d7f001fa}';
  AUDIO_EFFECT_TYPE_SPEAKER_COMPENSATION        : TGUID = '{6f64adcd-8211-11e2-8c70-2c27d7f001fa}';
  AUDIO_EFFECT_TYPE_DYNAMIC_RANGE_COMPRESSION   : TGUID = '{6f64adce-8211-11e2-8c70-2c27d7f001fa}';

{NTDDI_VERSION >= NTDDI_WIN10_FE}

  AUDIO_EFFECT_TYPE_FAR_FIELD_BEAMFORMING       : TGUID = '{6f64adcf-8211-11e2-8c70-2c27d7f001fa}';
  AUDIO_EFFECT_TYPE_DEEP_NOISE_SUPPRESSION      : TGUID = '{6f64add0-8211-11e2-8c70-2c27d7f001fa}';

{END NTDDI_VERSION >= NTDDI_WIN10_FE}


//#if (NTDDI_VERSION >= NTDDI_WIN10_RS2)

  // Interface to get audio modules information.
  // ===========================================
  KSPROPSETID_AudioModule                       : TGUID = '{C034FDB0-FF75-47C8-AA3C-EE46716B50C6}';


type

  PKSPROPERTY_AUDIOMODULE = ^KSPROPERTY_AUDIOMODULE;
  KSPROPERTY_AUDIOMODULE                          = (
    KSPROPERTY_AUDIOMODULE_DESCRIPTORS            = 1,
    KSPROPERTY_AUDIOMODULE_COMMAND                = 2,
    KSPROPERTY_AUDIOMODULE_NOTIFICATION_DEVICE_ID = 3
  );

const

  AUDIOMODULE_MAX_DATA_SIZE           = 64000;
  AUDIOMODULE_MAX_NAME_CCH_SIZE       = 128;


type

  PKSAUDIOMODULE_DESCRIPTOR = ^_KSAUDIOMODULE_DESCRIPTOR;
  _KSAUDIOMODULE_DESCRIPTOR = record
    ClassId: TGUID;
    InstanceId: ULONG;
    VersionMajor: ULONG;
    VersionMinor: ULONG;
    Name: array[0..AUDIOMODULE_MAX_NAME_CCH_SIZE - 1] of WideChar;
  end;
  KSAUDIOMODULE_DESCRIPTOR = _KSAUDIOMODULE_DESCRIPTOR;


  PKSAUDIOMODULE_PROPERTY = ^_KSAUDIOMODULE_PROPERTY;
  _KSAUDIOMODULE_PROPERTY = record
    _Property: KSPROPERTY;
    ClassId: TGUID;
    InstanceId: ULONG;
  end;
  KSAUDIOMODULE_PROPERTY = _KSAUDIOMODULE_PROPERTY;


const

  // Audio module notification definitions.
  // ======================================

  KSNOTIFICATIONID_AudioModule                     : TGUID = '{9C2220F0-D9A6-4D5C-A036-573857FD50D2}';

type

  PKSAUDIOMODULE_NOTIFICATION = ^KSAUDIOMODULE_NOTIFICATION;
  _KSAUDIOMODULE_NOTIFICATION = record
    case Integer of
      0: (ProviderId: record
            DeviceId: TGUID;
            ClassId: TGUID;
            InstanceId: ULONG;
            Reserved: ULONG;
          end);
      1: (Alignment: LONGLONG);
  end;
  KSAUDIOMODULE_NOTIFICATION = _KSAUDIOMODULE_NOTIFICATION;

//#endif // (NTDDI_VERSION >= NTDDI_WIN10_RS2)


  // Additional Prototypes for ALL interfaces


  // end of Additional Prototypes

implementation

function _KS_COLCON.GetNibble(Index: Integer): UCHAR;
begin
  Result := (FData[Index shr 1] shr ((Index and 1) * 4)) and $0F;
end;


procedure _KS_COLCON.SetNibble(Index: Integer;Value: UCHAR);
var
  Shift: Integer;
begin
  Shift := (Index and 1) * 4;
  FData[Index shr 1] := (FData[Index shr 1] and ($FF xor ($0F shl Shift))) or
                        ((Value and $0F) shl Shift);
end;




  // Implement Additional Prototypes here.

procedure INIT_USBAUDIO_MID(var guid: TGuid;
                            id: USHORT);
begin
  guid.D1 := $4e1cecd2 + USHORT(id);
  guid.D2 := $1679;
  guid.D3 := $463b;
  guid.D4[0] := $a7;
  guid.D4[1] := $2f;
  guid.D4[2] := $a5;
  guid.D4[3] := $bf;
  guid.D4[4] := $64;
  guid.D4[5] := $c8;
  guid.D4[6] := $6e;
  guid.D4[7] := $ba;
end;


function IS_COMPATIBLE_USBAUDIO_MID(const guid: TGuid): BOOL;
begin
  Result := ((guid.D1 >= $4e1cecd2) And
             (guid.D1 < ($4e1cecd2 + $ffff)) And
             (guid.D2 = $1679) And
             (guid.D3 =  $463b) And
             (guid.D4[0] = $a7) And
             (guid.D4[1] = $2f) And
             (guid.D4[2] = $a5) And
             (guid.D4[3] = $bf) And
             (guid.D4[4] = $64) And
             (guid.D4[5] = $c8) And
             (guid.D4[6] = $6e) And
             (guid.D4[7] = $ba));
end;


procedure INIT_USBAUDIO_PID(var guid: TGuid;
                            id: USHORT);
begin
    guid.D1 := $abcc5a5e + USHORT(id);
    guid.D2 := $c263;
    guid.D3 := $463b;
    guid.D4[0] := $a7;
    guid.D4[1] := $2f;
    guid.D4[2] := $a5;
    guid.D4[3] := $bf;
    guid.D4[4] := $64;
    guid.D4[5] := $c8;
    guid.D4[6] := $6e;
    guid.D4[7] := $ba;
end;


function IS_COMPATIBLE_USBAUDIO_PID(const guid: TGuid): BOOL;
begin
  Result := ((guid.D1 >= $abcc5a5e) And
             (guid.D1 < ($abcc5a5e + $ffff)) And
             (guid.D2 = $c263) And
             (guid.D3 =  $463b) And
             (guid.D4[0] = $a7) And
             (guid.D4[1] = $2f) And
             (guid.D4[2] = $a5) And
             (guid.D4[3] = $bf) And
             (guid.D4[4] = $64) And
             (guid.D4[5] = $c8) And
             (guid.D4[6] = $6e) And
             (guid.D4[7] = $ba));
end;


procedure INIT_USBAUDIO_PRODUCT_NAME(var guid: TGuid;
                                     vid: USHORT;
                                     pid: USHORT;
                                     strIndex: USHORT);
begin
  guid.D1 := $FC575048 + vid;
  guid.D2 := USHORT((DWORD($2E08) + pid) and $FFFF);
  guid.D3 := USHORT((DWORD($463B) + strIndex) and $FFFF);
  guid.D4[0] := $A7;
  guid.D4[1] := $2F;
  guid.D4[2] := $A5;
  guid.D4[3] := $BF;
  guid.D4[4] := $64;
  guid.D4[5] := $C8;
  guid.D4[6] := $6E;
  guid.D4[7] := $BA;
end;


 // USB Terminals

procedure INIT_USB_TERMINAL(var guid: TGuid;
                            id: USHORT);
begin
  guid.D1 := $DFF219E0 + USHORT(id);
  guid.D2 := $F70F;
  guid.D3 := $11D0;
  guid.D4[0] := $b9;
  guid.D4[1] := $17;
  guid.D4[2] := $00;
  guid.D4[3] := $a0;
  guid.D4[4] := $c9;
  guid.D4[5] := $22;
  guid.D4[6] := $31;
  guid.D4[7] := $96;
end;


function EXTRACT_USB_TERMINAL(const guid: TGUID): USHORT;
begin
  Result := USHORT((UInt64(guid.D1) + $100000000 - $DFF219E0) and $FFFF);
end;


function DEFINE_USB_TERMINAL_GUID(id: USHORT): TGuid;
begin
  Result.d1 := $DFF219E0 + id;
  Result.D2 := $F70F;
  Result.D3 := $11D0;
  Result.D4[0] := $b9;
  Result.D4[1] := $17;
  Result.D4[2] := $00;
  Result.D4[3] := $a0;
  Result.D4[4] := $c9;
  Result.D4[5] := $22;
  Result.D4[6] := $31;
  Result.D4[7] := $96;
end;

end.
