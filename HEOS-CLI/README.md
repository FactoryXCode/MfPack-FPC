# HEOS CLI for Free Pascal and Lazarus

Windows x64 port of the FactoryX HEOS/AVR dependency used by RDJ Pro. Its Delphi source remains in D:/PROJECTS/FactoryX-HEOS-CLI. This FPC copy lives in D:/PROJECTS/FPC/MfPack-FPC/HEOS-CLI.

Source contains the HEOS CLI API; AVR/Source contains AVR commands/client code. RDJRemote contains the transport facade, discovery, socket and UPnP helpers needed by RDJ Pro. RDJRemote/Controls contains Lazarus versions of the TDn button, level bar and trackbar. compat supplies FPC-only JSON, text, timing and Windows declarations. Source headers retain their upstream copyright and license.

Use FPC 3.2.2 and Lazarus 4.8 on Windows. Unit include paths are relative. Add Source, AVR/Source, RDJRemote, RDJRemote/Controls and compat to a consuming project's unit paths. RDJ Pro's installed project already includes those paths. To use controls in the form designer, compile HeosControlsRuntime.lpk and install HeosControlsDesign.lpk in RDJRemote/Controls. The application runtime does not require an IDE rebuild.

UPnP XML uses FPC DOM/XMLRead with explicit document ownership. HEOS JSON and percent-encoded protocol fields preserve Unicode through UTF-8. Trackbar animation uses an owned LCL timer. Physical receiver and AVR integration requires a configured receiver on the user's network; offline validation does not contact one.

Copyright FactoryX. Original source-license notices apply.
