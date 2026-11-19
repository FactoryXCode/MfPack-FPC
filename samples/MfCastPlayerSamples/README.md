## MfCastPlayer Samples
  
Version: 4.1.0  
  
NOTES:  
This release is updated for compiler version 3.2.2 (64 bit).  
SDK version: 10.0.28000.2705 (Win 11)  
Requires Windows 10 or later.  
Minimum supported MfPack version: 4.1.0  
  
There are 3 levels of CastPlayer samples:
**MfSimpleCastPlayer Sample**
  
**This sample demonstrates:**
  
- Asynchronous Chromecast discovery.
- Device selection.
- Casting a compatible local file through a built-in HTTP server.
- Casting a directly reachable HTTP/HTTPS media URL.
- Play, pause, stop, seek, volume, mute, and disconnect.
- External subtitle files and embedded text-subtitle enumeration. External subtitle  
  files are preferred when the same language exists in both sources.
- Exact embedded-track selection and subtitle switching while casting.
  
  
**MfCastPlayer Sample**
  
This it the extended version of MfSimpleCastPlayer.  
  
**This sample demonstrates the following additions of MfSimpleCastPlayer:**
  
- Casting a YouTube URL through an application-provided
  `IMfCastSourceResolver` implementation;
- A fast YouTube mode that resolves a combined H.264/AAC stream for direct
  playback;
- A best-quality YouTube mode that downloads separate video and audio streams
  and merges them into an MP4 file;
- Local video and audio preview through the `TMfCast` main interface;
- Audio-only playback with optional JPG, PNG, BMP, or GIF artwork;
- Heartbeat monitoring and automatic cleanup when the receiver is switched
  off or stops responding.
  
The sample enables the optional Media Foundation conversion stack.  
Compatible MP4/H.264/AAC, WebM, MP3, M4A, AAC, FLAC, WAV, and Ogg sources can use direct  
playback. Other containers and codecs, including AVI and MKV when required,  
are remuxed or converted to fragmented MP4 and published by the local HTTP server.  
  
  
**MfCastPlayer Sample II**
  
This is the alternative version of MfCastPlayer.  
  
**This sample demonstrates the following differences of MfCastPlayer:**  
  
The sample uses DXGI desktop duplication to make it possible casting from for example browser or other player content.  
It avoids installing 3th party apps viewing web content like YouTube.  
There is some trade off: The quality of origin is downgraded to the monitor resolution it play's on.
  
  
Project: Media Foundation - MFPack - Samples  
Project location:  
https://github.com/FactoryXCode/MfPack-FPC  
  
First release date: 02/08/2026  
Final release date: 18/11/2026  
  
Copyright © FactoryX. All rights reserved.
   