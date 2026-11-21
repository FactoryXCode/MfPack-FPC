# Small HEOS remote for Lazarus

Open MfHeosRemote.lpi, or run Build.ps1 -Targets MfHeosRemote from the HEOS-CLI root. This Windows x64 sample uses standard LCL controls and the local HEOS API. No custom design package is required.

Enter a receiver IPv4 address, connect, choose a player, and use the transport/volume controls. Local-file playback serves the selected file over HTTP on this computer, so the receiver must be able to reach the advertised PC address and port. File and receiver paths retain Unicode through UTF-8 protocol encoding.

The --smoke argument loads the form and releases its resources without showing it or connecting. Physical receiver and firewall behavior is outside the offline checks.
