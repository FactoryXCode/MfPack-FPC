# AVR control for Free Pascal

AVR/Source provides typed receiver commands, asynchronous requests and capability caching. It uses the Denon/Marantz AVR protocol separately from the HEOS CLI. Support depends on receiver model, firmware, zone and sound mode.

Open Samples/AvrCliDemo.lpi for the read-only console demo, or Samples/HEOSRemote/HEOSRemote.lpi for the full Lazarus remote. Build targets are AvrCliDemo and HEOSRemoteAvr.

Avr.Capabilities.pas is included locally. The supplied PROJECTS Delphi tree lacked that dependency; its matching source was recovered from the local FactoryX-HEOS-CLI GitHub checkout and ported to DOM/XMLRead. There is no build reference to that checkout.

Capability XML has explicit document ownership and rejects external XML declarations. Identity-based cache refreshes preserve known data across failed requests and discard stale asynchronous results. Unsupported controls are gated by capability and current receiver state. Local simulator tests cover these paths.
