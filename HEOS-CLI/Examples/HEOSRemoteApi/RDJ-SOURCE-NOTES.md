# RDJ-derived code in the Lazarus sample

The playlist, tagging and file-browser units retain their FactoryX source headers. The FPC port includes the required SQLDB, dialog, text and JSON adapters locally. Additional RDJ units used only by regressions are copied under Tests/Fixtures/RDJ at the HEOS-CLI root.

There are no unit-search references to a separate RDJ application, another checkout, or a Delphi installation. The containing MfPack/src supplies Windows media API bindings.
