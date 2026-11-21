# FPC HEOS examples

Build from the HEOS-CLI root with Build.ps1, or open the relative Lazarus projects.

HeosCliDemo accepts a receiver IPv4 address and optional event-watch duration in seconds. Running without arguments prints usage and does not contact a receiver. AvrCliDemo under AVR/Samples is the matching read-only AVR console example.

MfHeosRemote is the small LCL remote. HEOSRemoteApi is the full API-based application. Both use the local Source and AVR/Source trees. Full media features use only the containing MfPack's src SDK; no Delphi checkout is searched.
