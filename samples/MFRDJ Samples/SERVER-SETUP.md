# RDJ services for the FPC/Lazarus samples

Radio uses Icecast for its audio broadcast. Pro publishes browser-playable fMP4/MSE video and audio through FxServe or Caddy. Neither service is started by building the projects or running the offline checks.

FxServe source remains under D:/PROJECTS/FPC/MfPack/Proxy Servers/FxServe. FxRecord source and FxRecordAdmin are under samples/MFRDJ Samples/MfRdjPro/FxRecord. The bundled Icecast installer is under MFRDJ Samples/Redist. Configure and start services explicitly using their own installation instructions.

Choose the web root and public URL in RDJ Setup. Use matching paths for nowplaying.json, Artwork and the live broadcast output. A UNC path is a file-sharing path, while an http(s) URL is the address clients use. Grant the running RDJ account file access to the chosen output directory.

Start with local playback and a local browser URL. For receiver playback use an address reachable from that receiver. External access, HTTPS, DNS, router/firewall configuration and credentials belong to the deployment configuration and are not changed by the port or its tests. Existing operational sections in the Radio/Pro setup guides explain those options.

Copyright FactoryX.
