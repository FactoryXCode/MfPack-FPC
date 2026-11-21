# FPC/Lazarus port notes

The port preserves the supplied HEOS Remote application behavior and source notices. It adds Lazarus projects and resources, local compatibility units, SQLDB playlist storage, FPC XML handling, native LCL dialogs, owned animation timers and offline regression runners.

The folder-list/location owner-draw fix is retained: normal rows use the control's configured Color and Font, while selection uses system highlight colors. Shutdown and partial-construction cleanup are covered by form tests.

See the root PORTING.md for the tested toolchain and validation results. Historical Delphi revision identifiers remain in the upstream source headers for provenance.
