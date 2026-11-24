# MfPlaylist — FPC/Lazarus sequencer source sample

NOTES:  
  
* This release is updated for compiler version 3.2.2 (64 bit).
* SDK version 10.0.28000.2705 (Win 11)  
* Requires Windows 10 or later.  
* Minimum supported MfPack version: 4.1.0  

A following Microsoft's [How to Create a Playlist](https://learn.microsoft.com/en-us/windows/win32/medfound/how-to-create-a-playlist).
It uses the FPC MfPack COM and Media Foundation declarations directly, keeping the native topology and session calls visible for study.
  
## Open and run  
  
Open `MfPlaylist.lpi` in Lazarus, select Debug or Release, and run the project.  
The project targets Windows x86-64 with the Win32 LCL widgetset.  
It expects the standard layout `MfPack\samples\MfPlaylist` beside `MfPack\src`.  
No third-party component package is required.
  
1. Add two or more local media files and arrange them with Up, Down, Remove and Clear.
2. Click **Build playlist** and wait for **State: Ready**.
3. Click **Play**. The trace shows `MENewPresentation` queuing subsequent topologies before renderer handoffs.
4. Use Pause/Resume, Stop or **Play selected**. After Stop or completion, Play restarts the first segment.
5. Click **Release** before editing the list. Closing the form also closes the session and sources.

Click the progress bar to play the current segment from that position.  
Right-click the bar for **Play from this position**.  
The handlers use the progress bar's `OnMouseDown` and `OnContextPopup` events and check both mouse coordinates against its client rectangle.  
Other controls and the form caption cannot initiate seeking.  
Seeking requires a current segment with a known duration and starts playback even when paused or stopped.

For video, the preview hosts EVR. For audio-only segments, it displays artwork from the audio file's folder, scaled with its proportions preserved.  
It tries the track basename first, then Art, Cover, Folder, Front and Album, then other images in alphabetical order.  
Supported formats are JPG/JPEG, PNG and BMP. Unreadable images are skipped.  
The image changes with the segment and clears on Release or when the next folder contains no artwork.

The form, image and popup menu are all defined in `frmMfPlaylist.lfm` and editable in the Lazarus designer.

## Follow the walkthrough

| Microsoft step | Implementation in `MfPlaylistPlayer.pas` |
| --- | --- |
| Create a Media Session | `BuildPlaylist`: `MFCreateMediaSession`, callback subscription and presentation clock |
| Create the Sequencer Source | `BuildPlaylist`: `MFCreateSequencerSource`, query `IMFMediaSource` and `IMFMediaSourceTopologyProvider` |
| Create native sources | `AddSegment`: source resolution and each source's presentation descriptor |
| Create partial topologies | `CreateTopology`: source-stream nodes connected to audio renderer and EVR output nodes |
| Append topologies | `AddSegment`: `AppendTopology`, clearing the previous Last flag and marking the final entry |
| Queue the first topology | `BuildPlaylist` gets the sequencer's descriptor; `QueuePresentation` submits the provider's rewritten topology |
| Handle events | `ProcessEvent`: queue on `MENewPresentation`, update state and active segment from native status events |
| Shut down | `ClosePlaylist`: shut down sequencer sources, close and await the session, then shut down the session |
   
The original per-file topology must be rewritten by `IMFMediaSourceTopologyProvider` before submission to the Media Session.  
The next topology is queued on `MENewPresentation`, allowing native preparation before the current segment ends.  
Topology IDs identify the active entry; `MF_TOPOSTATUS_SINK_SWITCHED` identifies the actual renderer handoff.  
`MESessionNotifyPresentationTime` supplies the offset used for segment-relative time.  
Seeking uses `MFCreateSequencerSegmentOffset` and `MF_TIME_FORMAT_SEGMENT_OFFSET`.
  
## FPC/Lazarus details  
  
- Each Pascal unit includes `MfPack.Fpc.inc` and retains MfPack formatting and source headers.
- `MfPlaylistPlatform.pas` configures UTF-8 RTL conversions for LCL strings and filenames; native source resolution receives UTF-16 strings. The tests include non-ASCII filenames and artwork folders.
- A dedicated `LCLIntf.AllocateHWnd` window survives recreation of the main form's handle. FPC 3.2.2's Win64 `Classes.AllocateHWnd` is not implemented and is deliberately avoided.
- Media Foundation callbacks run on MF workers and post owned event packets to that window. GUI handling remains on the creating thread. Generations reject stale packets, and shutdown detaches the callback and drains queued packets before destroying the notification window.
- The EVR surface uses Lazarus paint/resize messages. Standard LCL graphics classes load artwork; no Delphi VCL units are needed.
- COM is initialized before the form/controller and released after their destruction. `MFStartup`/`MFShutdown` are balanced.
  
  
Set `-LazarusRoot` or `-MfPackRoot` for other installations. `-BuildDirectory` redirects all build/test outputs and the isolated Lazarus profile.  
The default output is `bin\x86_64-win64\<Config>`.  
The IDE uses that same executable layout and stores units under `lib`.
  
  
## Scope  
  
This is a static local-file sequence with one selected audio and one selected video stream per item. 
Release and rebuild to edit the list.  
Other selected streams are deselected. Subtitle/track selection and dynamic sequence editing are outside this sample.  
Playback and transitions depend on installed native sources, decoders and renderers; gapless transitions across differing formats are not guaranteed.  
Source resolution runs synchronously under the busy cursor for readability.
  
Please see Microsoft's [complete example](https://learn.microsoft.com/en-us/windows/win32/medfound/sequencer-source-example-code) and [sequencer source events](https://learn.microsoft.com/en-us/windows/win32/medfound/sequencer-source-events).
  
Project: MFPack - Samples - MfPlaylist  
Project location: https://github.com/FactoryXCode/MfPack-FPC  
  
First release date: 05-02-2016  
Final release date: 24/11/2026  
  
Copyright © FactoryX. All rights reserved.

