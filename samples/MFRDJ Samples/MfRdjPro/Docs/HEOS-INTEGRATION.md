# RDJ Pro HEOS output

Open the HEOS window with the **HEOS** button beside **Broadcast**. Find/select your receiver, then click **Stream RDJ** in the Console panel. The checked button requests streaming from RDJ's Masterdeck; the status and log report connection progress. Clicking Stream RDJ again ends the stream. Closing or hiding this window keeps streaming; exiting RDJ stops the sender. Stopping this stream does not stop local RDJ playback.

The source is RDJ's stereo Masterdeck mix after Master FX. Masterdeck left/right volume and balance are applied to the network copy. Cue/PFL and unrelated Windows sounds are excluded. The receiver's volume control changes the receiver volume independently. HEOS buffers network audio, so receiver playback has a delay relative to RDJ's local output.

## RDJ Master Volume and receiver volume

These controls work in sequence and remain independent:

| Control | Effect |
|---|---|
| RDJ Master Left/Right volume | Changes the PCM level sent to HEOS before AAC encoding, as well as the local master output level. |
| RDJ Master balance | Applies left/right attenuation to the outgoing stream. |
| HEOS Remote volume | Changes the receiver's main-zone listening level without moving RDJ's Master faders or changing encoded audio. |
| HEOS Remote balance and tone | Apply additional receiver-side processing where supported; RDJ's mix stays unchanged. |
| PFL/cue volume | Changes headphone monitoring only. |

With centred RDJ balance, lowering both Master faders from 100 to 50 halves the
stream's PCM amplitude (about -6 dB). The HEOS Remote volume slider stays at the
receiver's setting. At RDJ Master zero the stream carries silence; increasing
receiver volume cannot recover it. Both RDJ and receiver balance affect the
final stereo image.

The receiver's current display uses a `%` suffix for its volume scale. This is
not a linear audio-amplitude percentage and cannot be multiplied by RDJ's fader
percentage to calculate output level. Use RDJ Master for the program level you
want to send and receiver volume for listening level. Allow for HEOS buffering
when judging a change to RDJ Master Volume.

## Streaming implementation

`RDJ.HeosOutput` copies PCM into a bounded preallocated queue. The render callback does not encode, perform network I/O, access LCL controls or wait for the encoder. A background worker initializes COM/Media Foundation and produces AAC/ADTS. `RDJ.HeosAudioServer` serves that stream on the PC interface routed to the selected receiver, using the PC address and TCP port configured in the HEOS remote. Allow the RDJ application through the private-network firewall if the device cannot fetch the stream.

HEOS Setup offers 96, 128, 160 and 192 kbps AAC-LC, with stereo or mono output. The default is 192 kbps stereo. Choices are saved in the RDJ setup INI under `[HEOS]` and apply when Stream RDJ starts. Stop streaming to edit them. Mono averages left and right after Master gains; the local mix stays stereo. The public broadcast reads the same saved AAC settings when starting or retrying; active streams keep their current format. ADTS framing and the sample rate are automatic.

The current RDJ engine uses 44100 Hz stereo float PCM; the sender also accepts 48000 Hz. Changing sample rate while streaming is reported in the HEOS log and requires restarting the sender. Queue overflow drops network-copy blocks instead of delaying local playback; the window displays a dropped-block count.

The separate window uses the TDn controls and glyphs from `D:\PROJECTS\FPC\MfPack-FPC\HEOS-CLI\RDJRemote\Controls`. It contains the Masterdeck stream toggle, elapsed streaming time, receiver discovery and connection settings, zone power, volume, balance, input, mute and bass/treble. All controls are designed in the LFM. Closing the window hides it while streaming continues.

This embedded remote has no file browser, playlist editor, file transport, seek bar or loop controls. RDJ Pro manages the music and playlists; the HEOS window sends the resulting Masterdeck mix. Its embedded HEOS request worker only starts the live URL or ends that stream. The standalone HEOS Remote sample is maintained separately.

The upstream Delphi project has additional receiver and encoder tests. This FPC edition validates the HEOS form offline and does not claim a live receiver test.

## Connection and troubleshooting

- Start the RDJ audio engine and play music through its decks, then enable **Stream RDJ**. Files and playlists are selected in RDJ.
- Use **Find HEOS Device** if the receiver address is unknown or has changed. Check receiver power, network access and standby network-control settings if it cannot be reached.
- HEOS control uses receiver TCP port 1255 and AVR controls use port 23. The receiver connects back to the PC's HTTP port, default 8890. **PC IP** may be blank for automatic routing.
- If commands succeed but the HTTP request count remains zero, check the PC IP, configured port and private-network firewall access. FxServe and Caddy are not involved in this audio path.
- If HTTP requests arrive but audio is silent, check RDJ playback, both Master faders, receiver zone power, receiver mute and receiver volume.
- Receiver buffering creates a delay from the local master output. HEOS is not a replacement for the immediate PFL/cue output.

See the [technical handout](<RDJPro TechStuff.md>) for the full signal path
and source-unit responsibilities, and the [setup guide](<RDJPro Step-by-Step Setup.md>)
for component packages and project search paths.

## Background AAC audio

The public broadcast automatically supplies a separate AAC stream for audio-only
listeners, with no extra controls. Browser/PWA playback continues using MP4
fragments. AAC follows broadcast start/stop and Master volume/balance, stays
independent of private HEOS output and retries failures without stopping MP4.
See [background AAC setup and technical notes](<../../Controls/AUDIO-RADIO.md>).

## Live error handling

HEOS output startup returns an HRESULT and exposes the accompanying text through ErrorText. The caller checks the result before reporting streaming as started. Encoder/COM failures retain their HRESULT status, and expected socket failures use checked results. Network failures stop only the HEOS sender, leaving local RDJ playback running.

## Shared API dependency

The installed MfRdjJ.lpi references `D:\PROJECTS\FPC\MfPack-FPC\HEOS-CLI`. It uses Source, AVR/Source, RDJRemote and RDJRemote/Controls. The Delphi source tree remains separate. HEOSTransport adapts requests to the HEOS/AVR APIs; RDJ.HeosOutput supplies the mixed audio stream.

## Build and validation in this FPC edition

Use FPC 3.2.2 / Lazarus 4.8 on Windows x64. The HEOS dependency is under `D:\PROJECTS\FPC\MfPack-FPC\HEOS-CLI`: Source, AVR/Source, RDJRemote, RDJRemote/Controls and compat are referenced by the installed RDJ Pro project. Compile HeosControlsRuntime.lpk and install HeosControlsDesign.lpk for designer use.

The shipped FPC regression constructs and destroys the HEOS receiver form and checks the application media/data paths offline. It does not contact a receiver. Live HEOS/AVR commands, receiver listening and network delay require a configured physical receiver and are not claimed as validated by this port.

Copyright FactoryX. Original source and documentation license notices apply.
