/* Source file made available under Mozilla Public License v. 2.0 See the main repository for updates as well as full license text.
   https://github.com/Godiesc/opera-gx */

/* Personal configuration by Enríque González aka (Usergh0st) */

/* Default rules */
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
user_pref("svg.context-properties.content.enabled", true);
user_pref("browser.tabs.delayHidingAudioPlayingIconMS", 0);
user_pref("browser.newtabpage.activity-stream.improvesearch.handoffToAwesomebar", false);
user_pref("browser.tabs.allow_transparent_browser", true);
user_pref("sidebar.revamp.round-content-area", false);

/* Personal config with firefox */
user_pref("dom.ipc.processCount", 8);
user_pref("dom.ipc.keepProcessesAlive.web", 1);
user_pref("dom.ipc.keepProcessesAlive.privilegedabout", 0);
user_pref("dom.ipc.keepProcessesAlive.extension", 1);
user_pref("browser.tabs.unloadOnLowMemory", true);


/*To active container tabs without any extension */
user_pref("privacy.userContext.enabled", true);
user_pref("privacy.userContext.ui.enabled", true);
user_pref("privacy.userContext.longPressBehavior", 2);

/* Make it all false if you don't want other forms of tabs than default */
user_pref("userChrome.tab.bottom_rounded_corner", true);

/* Make it True (only one) the rule with the form of the tab you want */
user_pref("userChrome.tab.bottom_rounded_corner.wave",          false);
user_pref("userChrome.tab.bottom_rounded_corner.australis",     false);
user_pref("userChrome.tab.bottom_rounded_corner.chrome",        false);
user_pref("userChrome.tab.bottom_rounded_corner.chrome_legacy", false);
user_pref("userChrome.tab.bottom_rounded_corner.edge",          true);

/* Performance Boost */
user_pref("gfx.webrender.all", true);
user_pref("layers.acceleration.force-enabled", true);
user_pref("browser.cache.disk.enable", false);
user_pref("browser.cache.memory.enable", true);
user_pref("network.http.pipelining", true);
user_pref("network.http.proxy.pipelining", true);
user_pref("network.http.pipelining.maxrequests", 8);
user_pref("network.dns.disablePrefetch", false);
user_pref("network.prefetch-next", true);

/* Tracking Protection */
user_pref("browser.contentblocking.category", "strict");
user_pref("browser.download.start_downloads_in_tmp_dir", true);
user_pref("browser.uitour.enabled", false);
user_pref("privacy.globalprivacycontrol.enabled", true);

/* Performance Boost More Options */
user_pref("browser.cache.disk.enable", false);
user_pref("browser.privatebrowsing.forceMediaMemoryCache", true);
user_pref("media.memory_cache_max_size", 65536);
user_pref("browser.sessionstore.interval", 60000);
