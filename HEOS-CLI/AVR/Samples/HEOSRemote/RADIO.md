# Radio playback in the FPC/Lazarus remote

The Radio form browses receiver music services, search criteria, categories and pages, and supports receiver favourites and saved custom station URLs. Playback remains receiver-direct; browsing does not start audio capture or an HTTP audio publisher.

A website URL is resolved once to its direct AAC endpoint when the site exposes the supported radio endpoint. Redirects, content type, bounded HTML fallback and asynchronous logos are checked. PNG, JPEG, GIF and BMP artwork use LCL graphics support. Failed URL probes are retired off the UI thread.

Source changes complete Stop before starting the next file or station. Stop cancels queued starts; a failed Stop requires a retry rather than guessing the receiver state. Playback confirmation and later status polls update the UI while rejecting stale replies.

Receiver and station settings use the FactoryX/HEOSRemote directory under LOCALAPPDATA, falling back to APPDATA. The regression suite overrides these environment variables with temporary profiles. It covers Unicode station settings, service browsing, artwork, status polling, source handovers, failure paths and shutdown using only localhost servers.

Run the complete suite from the HEOS-CLI root with Test.ps1. After building the radio targets, Run-RadioTests.py can also run them using --build-directory and --output-root. Physical service accounts and receiver firmware are not simulated.
