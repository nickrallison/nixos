# firefox.nix
{pkgs, ...}: {
  programs.firefox = {
    enable = true;
    profiles.default = {
      isDefault = true;

      extraConfig = ''
        user_pref("keyword.enabled", true);

        // Homepage
        user_pref("browser.startup.homepage", "about:home");
        user_pref("browser.startup.page", 1);
        user_pref("browser.newtabpage.enabled", true);

        /* Upgrade locally hosted HTTP to HTTPS. */
        user_pref("dom.security.https_only_mode.upgrade_local", true);


        user_pref("browser.safebrowsing.downloads.remote.enabled", true);


        user_pref("browser.urlbar.suggest.history", false);
        user_pref("browser.urlbar.suggest.bookmark", false);
        user_pref("browser.urlbar.suggest.openpage", false);
        user_pref("browser.urlbar.suggest.topsites", false);
        user_pref("browser.urlbar.autoFill", false);


        user_pref("extensions.pocket.enabled", false);
        user_pref("extensions.pocket.onSaveRecs", false);


        user_pref("privacy.resistFingerprinting.randomization.daily_reset.enabled", true);
        user_pref("privacy.resistFingerprinting.randomization.daily_reset.private.enabled", true);
        user_pref("privacy.resistFingerprinting.randomization.enabled", true);



        user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

        // Enable CSD
        user_pref("browser.tabs.drawInTitlebar", true);

        // Set UI density to normal
        user_pref("browser.uidensity", 0);

        #### Arkenfox user.js
        user_pref("_user.js.parrot", "START: Oh yes, the Norwegian Blue... what's wrong with it?");
        user_pref("browser.aboutConfig.showWarning", false);
        user_pref("_user.js.parrot", "0100 syntax error: the parrot's dead!");
        user_pref("browser.startup.page", 0);
        user_pref("browser.startup.homepage", "about:blank");
        user_pref("browser.newtabpage.enabled", false);
        user_pref("browser.newtabpage.activity-stream.showSponsored", false); // [FF58+] Pocket > Sponsored Stories
        user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false); // [FF83+] Sponsored shortcuts
        user_pref("browser.newtabpage.activity-stream.default.sites", "");
        user_pref("_user.js.parrot", "0200 syntax error: the parrot's definitely deceased!");
        user_pref("geo.provider.network.url", "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%");
        user_pref("geo.provider.ms-windows-location", false); // [WINDOWS]
        user_pref("geo.provider.use_corelocation", false); // [MAC]
        user_pref("geo.provider.use_gpsd", false); // [LINUX] [HIDDEN PREF]
        user_pref("geo.provider.use_geoclue", false); // [FF102+] [LINUX]
        user_pref("_user.js.parrot", "0300 syntax error: the parrot's not pinin' for the fjords!");
        user_pref("extensions.getAddons.showPane", false); // [HIDDEN PREF]
        user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);
        user_pref("browser.discovery.enabled", false);
        user_pref("browser.shopping.experience2023.enabled", false); // [DEFAULT: false]
        user_pref("datareporting.policy.dataSubmissionEnabled", false);
        user_pref("datareporting.healthreport.uploadEnabled", false);
        user_pref("toolkit.telemetry.unified", false);
        user_pref("toolkit.telemetry.enabled", false); // see [NOTE]
        user_pref("toolkit.telemetry.server", "data:,");
        user_pref("toolkit.telemetry.archive.enabled", false);
        user_pref("toolkit.telemetry.newProfilePing.enabled", false); // [FF55+]
        user_pref("toolkit.telemetry.shutdownPingSender.enabled", false); // [FF55+]
        user_pref("toolkit.telemetry.updatePing.enabled", false); // [FF56+]
        user_pref("toolkit.telemetry.bhrPing.enabled", false); // [FF57+] Background Hang Reporter
        user_pref("toolkit.telemetry.firstShutdownPing.enabled", false); // [FF57+]
        user_pref("toolkit.telemetry.coverage.opt-out", true); // [HIDDEN PREF]
        user_pref("toolkit.coverage.opt-out", true); // [FF64+] [HIDDEN PREF]
        user_pref("toolkit.coverage.endpoint.base", "");
        user_pref("browser.ping-centre.telemetry", false);
        user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
        user_pref("browser.newtabpage.activity-stream.telemetry", false);
        user_pref("app.shield.optoutstudies.enabled", false);
        user_pref("app.normandy.enabled", false);
        user_pref("app.normandy.api_url", "");
        user_pref("breakpad.reportURL", "");
        user_pref("browser.tabs.crashReporting.sendReport", false); // [FF44+]
        user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", false); // [DEFAULT: false]
        user_pref("captivedetect.canonicalURL", "");
        user_pref("network.captive-portal-service.enabled", false); // [FF52+]
        user_pref("network.connectivity-service.enabled", false);
        user_pref("_user.js.parrot", "0400 syntax error: the parrot's passed on!");
        user_pref("browser.safebrowsing.downloads.remote.enabled", false);
        user_pref("_user.js.parrot", "0600 syntax error: the parrot's no more!");
        user_pref("network.prefetch-next", false);
        user_pref("network.dns.disablePrefetch", true);
        user_pref("network.predictor.enabled", false);
        user_pref("network.predictor.enable-prefetch", false); // [FF48+] [DEFAULT: false]
        user_pref("network.http.speculative-parallel-limit", 0);
        user_pref("browser.places.speculativeConnect.enabled", false);
        user_pref("_user.js.parrot", "0700 syntax error: the parrot's given up the ghost!");
        /* 0702: set the proxy server to do any DNS lookups when using SOCKS
         * e.g. in Tor, this stops your local DNS server from knowing your Tor destination
         * as a remote Tor node will handle the DNS request
         * [1] https://trac.torproject.org/projects/tor/wiki/doc/TorifyHOWTO/WebBrowsers ***/
        user_pref("network.proxy.socks_remote_dns", true);
        /* 0703: disable using UNC (Uniform Naming Convention) paths [FF61+]
         * [SETUP-CHROME] Can break extensions for profiles on network shares
         * [1] https://bugzilla.mozilla.org/1413868 ***/
        user_pref("network.file.disable_unc_paths", true); // [HIDDEN PREF]
        /* 0704: disable GIO as a potential proxy bypass vector
         * Gvfs/GIO has a set of supported protocols like obex, network, archive, computer,
         * dav, cdda, gphoto2, trash, etc. From FF87-117, by default only sftp was accepted
         * [1] https://bugzilla.mozilla.org/1433507
         * [2] https://en.wikipedia.org/wiki/GVfs
         * [3] https://en.wikipedia.org/wiki/GIO_(software) ***/
        user_pref("network.gio.supported-protocols", ""); // [HIDDEN PREF] [DEFAULT: "" FF118+]
        /* 0705: disable proxy direct failover for system requests [FF91+]
         * [WARNING] Default true is a security feature against malicious extensions [1]
         * [SETUP-CHROME] If you use a proxy and you trust your extensions
         * [1] https://blog.mozilla.org/security/2021/10/25/securing-the-proxy-api-for-firefox-add-ons/ ***/
           // user_pref("network.proxy.failover_direct", false);
        /* 0706: disable proxy bypass for system request failures [FF95+]
         * RemoteSettings, UpdateService, Telemetry [1]
         * [WARNING] If false, this will break the fallback for some security features
         * [SETUP-CHROME] If you use a proxy and you understand the security impact
         * [1] https://bugzilla.mozilla.org/buglist.cgi?bug_id=1732792,1733994,1733481 ***/
           // user_pref("network.proxy.allow_bypass", false);
        /* 0710: enable DNS-over-HTTPS (DoH) [FF60+]
         * 0=default, 2=increased (TRR (Trusted Recursive Resolver) first), 3=max (TRR only), 5=off (no rollout)
         * see "doh-rollout.home-region": USA 2019, Canada 2021, Russia/Ukraine 2022 [3]
         * [SETTING] Privacy & Security>DNS over HTTPS
         * [1] https://hacks.mozilla.org/2018/05/a-cartoon-intro-to-dns-over-https/
         * [2] https://wiki.mozilla.org/Security/DOH-resolver-policy
         * [3] https://support.mozilla.org/en-US/kb/firefox-dns-over-https
         * [4] https://www.eff.org/deeplinks/2020/12/dns-doh-and-odoh-oh-my-year-review-2020 ***/
           // user_pref("network.trr.mode", 3);
        /* 0712: set DoH provider
         * The custom uri is the value shown when you "Choose provider>Custom>"
         * [NOTE] If you USE custom then "network.trr.uri" should be set the same
         * [SETTING] Privacy & Security>DNS over HTTPS>Increased/Max>Choose provider ***/
           // user_pref("network.trr.uri", "https://example.dns");
           // user_pref("network.trr.custom_uri", "https://example.dns");


        user_pref("_user.js.parrot", "0800 syntax error: the parrot's ceased to be!");
        /* 0801: disable location bar making speculative connections [FF56+]
         * [1] https://bugzilla.mozilla.org/1348275 ***/
        user_pref("browser.urlbar.speculativeConnect.enabled", false);
        /* 0802: disable location bar contextual suggestions
         * [SETTING] Privacy & Security>Address Bar>Suggestions from...
         * [1] https://blog.mozilla.org/data/2021/09/15/data-and-firefox-suggest/ ***/
        user_pref("browser.urlbar.suggest.quicksuggest.nonsponsored", false); // [FF95+]
        user_pref("browser.urlbar.suggest.quicksuggest.sponsored", false); // [FF92+]
        /* 0803: disable live search suggestions
         * [NOTE] Both must be true for the location bar to work
         * [SETUP-CHROME] Override these if you trust and use a privacy respecting search engine
         * [SETTING] Search>Provide search suggestions | Show search suggestions in address bar results ***/
        user_pref("browser.search.suggest.enabled", false);
        user_pref("browser.urlbar.suggest.searches", false);

        user_pref("browser.urlbar.trending.featureGate", false);

        user_pref("browser.urlbar.addons.featureGate", false); // [FF115+]
        user_pref("browser.urlbar.mdn.featureGate", false); // [FF117+] [HIDDEN PREF]
        user_pref("browser.urlbar.pocket.featureGate", false); // [FF116+] [DEFAULT: false]
        user_pref("browser.urlbar.weather.featureGate", false); // [FF108+] [DEFAULT: false]

           // user_pref("browser.urlbar.clipboard.featureGate", false); // [DEFAULT: false]
        /* 0810: disable search and form history
         * [SETUP-WEB] Be aware that autocomplete form data can be read by third parties [1][2]
         * [NOTE] We also clear formdata on exit (2811)
         * [SETTING] Privacy & Security>History>Custom Settings>Remember search and form history
         * [1] https://blog.mindedsecurity.com/2011/10/autocompleteagain.html
         * [2] https://bugzilla.mozilla.org/381681 ***/
        user_pref("browser.formfill.enable", false);

           // user_pref("browser.urlbar.suggest.engines", false);
        /* 0820: disable coloring of visited links
         * [SETUP-HARDEN] Bulk rapid history sniffing was mitigated in 2010 [1][2]. Slower and more expensive
         * redraw timing attacks were largely mitigated in FF77+ [3]. Using RFP (4501) further hampers timing
         * attacks. Don't forget clearing history on exit (2811). However, social engineering [2#limits][4][5]
         * and advanced targeted timing attacks could still produce usable results
         * [1] https://developer.mozilla.org/docs/Web/CSS/Privacy_and_the_:visited_selector
         * [2] https://dbaron.org/mozilla/visited-privacy
         * [3] https://bugzilla.mozilla.org/1632765
         * [4] https://earthlng.github.io/testpages/visited_links.html (see github wiki APPENDIX A on how to use)
         * [5] https://lcamtuf.blogspot.com/2016/08/css-mix-blend-mode-is-bad-for-keeping.html ***/
           // user_pref("layout.css.visited_links_enabled", false);

        user_pref("browser.search.separatePrivateDefault", true); // [FF70+]
        user_pref("browser.search.separatePrivateDefault.ui.enabled", true); // [FF71+]

        /*** [SECTION 0900]: PASSWORDS
           [1] https://support.mozilla.org/kb/use-primary-password-protect-stored-logins-and-pas
        ***/
        user_pref("_user.js.parrot", "0900 syntax error: the parrot's expired!");
        /* 0903: disable auto-filling username & password form fields
         * can leak in cross-site forms *and* be spoofed
         * [NOTE] Username & password is still available when you enter the field
         * [SETTING] Privacy & Security>Logins and Passwords>Autofill logins and passwords
         * [1] https://freedom-to-tinker.com/2017/12/27/no-boundaries-for-user-identities-web-trackers-exploit-browser-login-managers/
         * [2] https://homes.esat.kuleuven.be/~asenol/leaky-forms/ ***/
        user_pref("signon.autofillForms", false);

        user_pref("signon.formlessCapture.enabled", false);
        /* 0905: limit (or disable) HTTP authentication credentials dialogs triggered by sub-resources [FF41+]
         * hardens against potential credentials phishing
         * 0 = don't allow sub-resources to open HTTP authentication credentials dialogs
         * 1 = don't allow cross-origin sub-resources to open HTTP authentication credentials dialogs
         * 2 = allow sub-resources to open HTTP authentication credentials dialogs (default) ***/
        user_pref("network.auth.subresource-http-auth-allow", 1);

           // user_pref("network.http.windows-sso.enabled", false); // [DEFAULT: false]


        user_pref("_user.js.parrot", "1000 syntax error: the parrot's gone to meet 'is maker!");
        /* 1001: disable disk cache
         * [SETUP-CHROME] If you think disk cache helps perf, then feel free to override this
         * [NOTE] We also clear cache on exit (2811) ***/
        user_pref("browser.cache.disk.enable", false);
        /* 1002: disable media cache from writing to disk in Private Browsing
         * [NOTE] MSE (Media Source Extensions) are already stored in-memory in PB ***/
        user_pref("browser.privatebrowsing.forceMediaMemoryCache", true); // [FF75+]
        user_pref("media.memory_cache_max_size", 65536);

        user_pref("browser.sessionstore.privacy_level", 2);

        user_pref("toolkit.winRegisterApplicationRestart", false);
        /* 1006: disable favicons in shortcuts [WINDOWS]
         * URL shortcuts use a cached randomly named .ico file which is stored in your
         * profile/shortcutCache directory. The .ico remains after the shortcut is deleted
         * If set to false then the shortcuts use a generic Firefox icon ***/
        user_pref("browser.shell.shortcutFavicons", false);

        /*** [SECTION 1200]: HTTPS (SSL/TLS / OCSP / CERTS / HPKP)
           Your cipher and other settings can be used in server side fingerprinting
           [TEST] https://www.ssllabs.com/ssltest/viewMyClient.html
           [TEST] https://browserleaks.com/ssl
           [TEST] https://ja3er.com/
           [1] https://www.securityartwork.es/2017/02/02/tls-client-fingerprinting-with-bro/
        ***/
        user_pref("_user.js.parrot", "1200 syntax error: the parrot's a stiff!");

        /* 1201: require safe negotiation
         * Blocks connections to servers that don't support RFC 5746 [2] as they're potentially vulnerable to a
         * MiTM attack [3]. A server without RFC 5746 can be safe from the attack if it disables renegotiations
         * but the problem is that the browser can't know that. Setting this pref to true is the only way for the
         * browser to ensure there will be no unsafe renegotiations on the channel between the browser and the server
         * [SETUP-WEB] SSL_ERROR_UNSAFE_NEGOTIATION: is it worth overriding this for that one site?
         * [STATS] SSL Labs (Nov 2023) reports over 99.5% of top sites have secure renegotiation [4]
         * [1] https://wiki.mozilla.org/Security:Renegotiation
         * [2] https://datatracker.ietf.org/doc/html/rfc5746
         * [3] https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2009-3555
         * [4] https://www.ssllabs.com/ssl-pulse/ ***/
        user_pref("security.ssl.require_safe_negotiation", true);
        /* 1206: disable TLS1.3 0-RTT (round-trip time) [FF51+]
         * This data is not forward secret, as it is encrypted solely under keys derived using
         * the offered PSK. There are no guarantees of non-replay between connections
         * [1] https://github.com/tlswg/tls13-spec/issues/1001
         * [2] https://www.rfc-editor.org/rfc/rfc9001.html#name-replay-attacks-with-0-rtt
         * [3] https://blog.cloudflare.com/tls-1-3-overview-and-q-and-a/ ***/
        user_pref("security.tls.enable_0rtt_data", false);

        /** OCSP (Online Certificate Status Protocol)
           [1] https://scotthelme.co.uk/revocation-is-broken/
           [2] https://blog.mozilla.org/security/2013/07/29/ocsp-stapling-in-firefox/
        ***/
        /* 1211: enforce OCSP fetching to confirm current validity of certificates
         * 0=disabled, 1=enabled (default), 2=enabled for EV certificates only
         * OCSP (non-stapled) leaks information about the sites you visit to the CA (cert authority)
         * It's a trade-off between security (checking) and privacy (leaking info to the CA)
         * [NOTE] This pref only controls OCSP fetching and does not affect OCSP stapling
         * [SETTING] Privacy & Security>Security>Certificates>Query OCSP responder servers...
         * [1] https://en.wikipedia.org/wiki/Ocsp ***/
        user_pref("security.OCSP.enabled", 1); // [DEFAULT: 1]
        /* 1212: set OCSP fetch failures (non-stapled, see 1211) to hard-fail
         * [SETUP-WEB] SEC_ERROR_OCSP_SERVER_ERROR
         * When a CA cannot be reached to validate a cert, Firefox just continues the connection (=soft-fail)
         * Setting this pref to true tells Firefox to instead terminate the connection (=hard-fail)
         * It is pointless to soft-fail when an OCSP fetch fails: you cannot confirm a cert is still valid (it
         * could have been revoked) and/or you could be under attack (e.g. malicious blocking of OCSP servers)
         * [1] https://blog.mozilla.org/security/2013/07/29/ocsp-stapling-in-firefox/
         * [2] https://www.imperialviolet.org/2014/04/19/revchecking.html ***/
        user_pref("security.OCSP.require", true);


        /* 1223: enable strict PKP (Public Key Pinning)
         * 0=disabled, 1=allow user MiTM (default; such as your antivirus), 2=strict
         * [SETUP-WEB] MOZILLA_PKIX_ERROR_KEY_PINNING_FAILURE ***/
        user_pref("security.cert_pinning.enforcement_level", 2);
        /* 1224: enable CRLite [FF73+]
         * 0 = disabled
         * 1 = consult CRLite but only collect telemetry
         * 2 = consult CRLite and enforce both "Revoked" and "Not Revoked" results
         * 3 = consult CRLite and enforce "Not Revoked" results, but defer to OCSP for "Revoked" (default)
         * [1] https://bugzilla.mozilla.org/buglist.cgi?bug_id=1429800,1670985,1753071
         * [2] https://blog.mozilla.org/security/tag/crlite/ ***/
        user_pref("security.remote_settings.crlite_filters.enabled", true);
        user_pref("security.pki.crlite_mode", 2);



           // user_pref("security.mixed_content.block_display_content", true); // Defense-in-depth (see 1244)
        /* 1244: enable HTTPS-Only mode in all windows
         * When the top-level is HTTPS, insecure subresources are also upgraded (silent fail)
         * [SETTING] to add site exceptions: Padlock>HTTPS-Only mode>On (after "Continue to HTTP Site")
         * [SETTING] Privacy & Security>HTTPS-Only Mode (and manage exceptions)
         * [TEST] http://example.com [upgrade]
         * [TEST] http://httpforever.com/ | http://http.rip [no upgrade] ***/
        user_pref("dom.security.https_only_mode", true); // [FF76+]
           // user_pref("dom.security.https_only_mode_pbm", true); // [FF80+]

           // user_pref("dom.security.https_only_mode.upgrade_local", true);

        user_pref("dom.security.https_only_mode_send_http_background_request", false);



        user_pref("security.ssl.treat_unsafe_negotiation_as_broken", true);

        user_pref("browser.xul.error_pages.expert_bad_cert", true);


        user_pref("_user.js.parrot", "1600 syntax error: the parrot rests in peace!");

        user_pref("network.http.referer.XOriginTrimmingPolicy", 2);


        user_pref("_user.js.parrot", "1700 syntax error: the parrot's bit the dust!");

        user_pref("privacy.userContext.enabled", true);
        user_pref("privacy.userContext.ui.enabled", true);

           // user_pref("privacy.userContext.newTabContainerOnLeftClick.enabled", true);


        user_pref("_user.js.parrot", "2000 syntax error: the parrot's snuffed it!");

        user_pref("media.peerconnection.ice.proxy_only_if_behind_proxy", true);

        user_pref("media.peerconnection.ice.default_address_only", true);

           // user_pref("media.peerconnection.ice.no_host", true);

           // user_pref("media.gmp-provider.enabled", false);


        user_pref("_user.js.parrot", "2400 syntax error: the parrot's kicked the bucket!");

        user_pref("dom.disable_window_move_resize", true);


        user_pref("_user.js.parrot", "2600 syntax error: the parrot's run down the curtain!");

        user_pref("browser.download.start_downloads_in_tmp_dir", true); // [FF102+]
        user_pref("browser.helperApps.deleteTempFileOnExit", true);

        user_pref("browser.uitour.enabled", false);
           // user_pref("browser.uitour.url", ""); // Defense-in-depth

        user_pref("devtools.debugger.remote-enabled", false); // [DEFAULT: false]

           // user_pref("permissions.default.shortcuts", 2);

        user_pref("permissions.manager.defaultsUrl", "");

        user_pref("webchannel.allowObject.urlWhitelist", "");

        user_pref("network.IDN_show_punycode", true);

        user_pref("pdfjs.disabled", false); // [DEFAULT: false]
        user_pref("pdfjs.enableScripting", false); // [FF86+]

        user_pref("browser.tabs.searchclipboardfor.middleclick", false); // [DEFAULT: false NON-LINUX]



        user_pref("browser.download.useDownloadDir", false);

        user_pref("browser.download.alwaysOpenPanel", false);

        user_pref("browser.download.manager.addToRecentDocs", false);

        user_pref("browser.download.always_ask_before_handling_new_types", true);



        user_pref("extensions.enabledScopes", 5); // [HIDDEN PREF]
           // user_pref("extensions.autoDisableScopes", 15); // [DEFAULT: 15]

        user_pref("extensions.postDownloadThirdPartyPrompt", false);

           // user_pref("extensions.webextensions.restrictedDomains", "");


        user_pref("_user.js.parrot", "2700 syntax error: the parrot's joined the bleedin' choir invisible!");

        user_pref("browser.contentblocking.category", "strict"); // [HIDDEN PREF]

           // user_pref("privacy.antitracking.enableWebcompat", false);


        user_pref("_user.js.parrot", "2800 syntax error: the parrot's bleedin' demised!");

        user_pref("privacy.sanitize.sanitizeOnShutdown", true);



        user_pref("privacy.clearOnShutdown.cache", true);     // [DEFAULT: true]
        user_pref("privacy.clearOnShutdown.downloads", true); // [DEFAULT: true]
        user_pref("privacy.clearOnShutdown.formdata", true);  // [DEFAULT: true]
        user_pref("privacy.clearOnShutdown.history", true);   // [DEFAULT: true]
        user_pref("privacy.clearOnShutdown.sessions", true);  // [DEFAULT: true]
           // user_pref("privacy.clearOnShutdown.siteSettings", false); // [DEFAULT: false]

           // user_pref("privacy.clearOnShutdown.openWindows", true);



        user_pref("privacy.clearOnShutdown.cookies", true); // Cookies
        user_pref("privacy.clearOnShutdown.offlineApps", true); // Site Data



        user_pref("privacy.cpd.cache", true);    // [DEFAULT: true]
        user_pref("privacy.cpd.formdata", true); // [DEFAULT: true]
        user_pref("privacy.cpd.history", true);  // [DEFAULT: true]
        user_pref("privacy.cpd.sessions", true); // [DEFAULT: true]
        user_pref("privacy.cpd.offlineApps", false); // [DEFAULT: false]
        user_pref("privacy.cpd.cookies", false);
           // user_pref("privacy.cpd.downloads", true); // not used, see note above
           // user_pref("privacy.cpd.openWindows", false); // Session Restore
           // user_pref("privacy.cpd.passwords", false);
           // user_pref("privacy.cpd.siteSettings", false);

        user_pref("privacy.sanitize.timeSpan", 0);


        user_pref("_user.js.parrot", "1400 syntax error: the parrot's bereft of life!");

           // user_pref("privacy.fingerprintingProtection.pbmode", true); // [DEFAULT: true FF118+]

           // user_pref("privacy.fingerprintingProtection.overrides", "");


        user_pref("_user.js.parrot", "4500 syntax error: the parrot's popped 'is clogs");

        user_pref("privacy.resistFingerprinting", true); // [FF41+]
           // user_pref("privacy.resistFingerprinting.pbmode", true); // [FF114+]

        user_pref("privacy.window.maxInnerWidth", 1600);
        user_pref("privacy.window.maxInnerHeight", 900);

        user_pref("privacy.resistFingerprinting.block_mozAddonManager", true);

        user_pref("privacy.resistFingerprinting.letterboxing", true); // [HIDDEN PREF]
           // user_pref("privacy.resistFingerprinting.letterboxing.dimensions", ""); // [HIDDEN PREF]

           // user_pref("privacy.resistFingerprinting.exemptedDomains", "*.example.invalid");

        user_pref("browser.display.use_system_colors", false); // [DEFAULT: false NON-WINDOWS]

        user_pref("widget.non-native-theme.enabled", true); // [DEFAULT: true]

        user_pref("browser.link.open_newwindow", 3); // [DEFAULT: 3]

        user_pref("browser.link.open_newwindow.restriction", 0);

        user_pref("webgl.disabled", true);


        user_pref("_user.js.parrot", "5000 syntax error: the parrot's taken 'is last bow");

           // user_pref("browser.privatebrowsing.autostart", true);

           // user_pref("browser.cache.memory.enable", false);
           // user_pref("browser.cache.memory.capacity", 0);

           // user_pref("signon.rememberSignons", false);

           // user_pref("permissions.memory_only", true); // [HIDDEN PREF]

           // user_pref("security.nocertdb", true);

           // user_pref("browser.chrome.site_icons", false);

           // user_pref("browser.sessionstore.max_tabs_undo", 0);

           // user_pref("browser.sessionstore.resume_from_crash", false);

           // user_pref("browser.download.forbid_open_with", true);

           // user_pref("browser.urlbar.suggest.history", false);
           // user_pref("browser.urlbar.suggest.bookmark", false);
           // user_pref("browser.urlbar.suggest.openpage", false);
           // user_pref("browser.urlbar.suggest.topsites", false); // [FF78+]

           // user_pref("browser.urlbar.maxRichResults", 0);

           // user_pref("browser.urlbar.autoFill", false);

           // user_pref("places.history.enabled", false);

           // user_pref("browser.taskbar.lists.enabled", false);
           // user_pref("browser.taskbar.lists.frequent.enabled", false);
           // user_pref("browser.taskbar.lists.recent.enabled", false);
           // user_pref("browser.taskbar.lists.tasks.enabled", false);

           // user_pref("browser.download.folderList", 2);

           // user_pref("extensions.formautofill.addresses.enabled", false); // [FF55+]
           // user_pref("extensions.formautofill.creditCards.enabled", false); // [FF56+]

           // user_pref("dom.popup_allowed_events", "click dblclick mousedown pointerdown");

           // user_pref("browser.pagethumbnails.capturing_disabled", true); // [HIDDEN PREF]

           // user_pref("alerts.useSystemBackend.windows.notificationserver.enabled", false);

           // user_pref("keyword.enabled", false);


        user_pref("_user.js.parrot", "5500 syntax error: this is an ex-parrot!");

           // user_pref("mathml.disabled", true); // 1173199

           // user_pref("svg.disabled", true); // 1216893

           // user_pref("gfx.font_rendering.graphite.enabled", false);

           // user_pref("javascript.options.asmjs", false);

           // user_pref("javascript.options.ion", false);
           // user_pref("javascript.options.baselinejit", false);
           // user_pref("javascript.options.jit_trustedprincipals", true); // [FF75+] [HIDDEN PREF]

           // user_pref("javascript.options.wasm", false);

           // user_pref("gfx.font_rendering.opentype_svg.enabled", false);

           // user_pref("media.eme.enabled", false);
           // user_pref("browser.eme.ui.enabled", false);

           // user_pref("network.dns.disableIPv6", true);

           // user_pref("network.http.referer.XOriginPolicy", 2);

           // user_pref("network.trr.bootstrapAddr", "10.0.0.1"); // [HIDDEN PREF]


        user_pref("_user.js.parrot", "6000 syntax error: the parrot's 'istory!");

        user_pref("extensions.blocklist.enabled", true); // [DEFAULT: true]

        user_pref("network.http.referer.spoofSource", false); // [DEFAULT: false]

        user_pref("security.dialog_enable_delay", 1000); // [DEFAULT: 1000]

        user_pref("privacy.firstparty.isolate", false); // [DEFAULT: false]

        user_pref("extensions.webcompat.enable_shims", true); // [HIDDEN PREF] [DEFAULT: true]

        user_pref("security.tls.version.enable-deprecated", false); // [DEFAULT: false]

        user_pref("extensions.webcompat-reporter.enabled", false); // [DEFAULT: false]

        user_pref("extensions.quarantinedDomains.enabled", true); // [DEFAULT: true]

           // user_pref("accessibility.force_disabled", "");
           // user_pref("browser.urlbar.dnsResolveSingleWordsAfterSearch", "");
           // user_pref("network.protocol-handler.external.ms-windows-store", "");
           // user_pref("privacy.partition.always_partition_third_party_non_cookie_storage", "");
           // user_pref("privacy.partition.always_partition_third_party_non_cookie_storage.exempt_sessionstorage", "");
           // user_pref("privacy.partition.serviceWorkers", "");


        user_pref("_user.js.parrot", "7000 syntax error: the parrot's pushing up daisies!");

           // user_pref("geo.enabled", false);
           // user_pref("full-screen-api.enabled", false);

           // user_pref("permissions.default.geo", 0);
           // user_pref("permissions.default.camera", 0);
           // user_pref("permissions.default.microphone", 0);
           // user_pref("permissions.default.desktop-notification", 0);
           // user_pref("permissions.default.xr", 0); // Virtual Reality

           // user_pref("security.ssl3.ecdhe_ecdsa_aes_128_sha", false);
           // user_pref("security.ssl3.ecdhe_ecdsa_aes_256_sha", false);
           // user_pref("security.ssl3.ecdhe_rsa_aes_128_sha", false);
           // user_pref("security.ssl3.ecdhe_rsa_aes_256_sha", false);
           // user_pref("security.ssl3.rsa_aes_128_gcm_sha256", false); // no PFS
           // user_pref("security.ssl3.rsa_aes_256_gcm_sha384", false); // no PFS
           // user_pref("security.ssl3.rsa_aes_128_sha", false); // no PFS
           // user_pref("security.ssl3.rsa_aes_256_sha", false); // no PFS

           // user_pref("security.tls.version.min", 3); // [DEFAULT: 3]
           // user_pref("security.tls.version.max", 4);

           // user_pref("security.ssl.disable_session_identifiers", true);

           // user_pref("dom.securecontext.allowlist_onions", true); // [FF97+] 1382359/1744006
           // user_pref("network.http.referer.hideOnionSource", true); // 1305144

           // user_pref("network.http.sendRefererHeader", 2);
           // user_pref("network.http.referer.trimmingPolicy", 0);

           // user_pref("network.http.referer.defaultPolicy", 2); // [DEFAULT: 2]
           // user_pref("network.http.referer.defaultPolicy.pbmode", 2); // [DEFAULT: 2]

           // user_pref("network.http.altsvc.enabled", false);

           // user_pref("dom.event.contextmenu.enabled", false);

           // user_pref("gfx.downloadable_fonts.enabled", false); // [FF41+]
           // user_pref("gfx.downloadable_fonts.fallback_delay", -1);

           // user_pref("dom.event.clipboardevents.enabled", false);

           // user_pref("extensions.systemAddon.update.enabled", false); // [FF62+]
           // user_pref("extensions.systemAddon.update.url", ""); // [FF44+]

           // user_pref("privacy.donottrackheader.enabled", true);

           // user_pref("network.cookie.cookieBehavior", 5); // [DEFAULT: 5]
           // user_pref("privacy.fingerprintingProtection", true); // [FF114+] [ETP FF119+]
           // user_pref("network.http.referer.disallowCrossSiteRelaxingDefault", true);
           // user_pref("network.http.referer.disallowCrossSiteRelaxingDefault.top_navigation", true); // [FF100+]
           // user_pref("privacy.partition.network_state.ocsp_cache", true); // [DEFAULT: true FF123+]
           // user_pref("privacy.query_stripping.enabled", true); // [FF101+]
           // user_pref("privacy.trackingprotection.enabled", true);
           // user_pref("privacy.trackingprotection.socialtracking.enabled", true);
           // user_pref("privacy.trackingprotection.cryptomining.enabled", true); // [DEFAULT: true]
           // user_pref("privacy.trackingprotection.fingerprinting.enabled", true); // [DEFAULT: true]

           // user_pref("dom.serviceWorkers.enabled", false);

           // user_pref("dom.webnotifications.enabled", false);

           // user_pref("dom.push.enabled", false);

           // user_pref("media.peerconnection.enabled", false);


        user_pref("_user.js.parrot", "8000 syntax error: the parrot's crossed the Jordan");

           // user_pref("browser.display.use_document_fonts", "");
           // user_pref("browser.zoom.siteSpecific", "");
           // user_pref("device.sensors.enabled", "");
           // user_pref("dom.enable_performance", "");
           // user_pref("dom.enable_resource_timing", "");
           // user_pref("dom.gamepad.enabled", "");
           // user_pref("dom.maxHardwareConcurrency", "");
           // user_pref("dom.w3c_touch_events.enabled", "");
           // user_pref("dom.webaudio.enabled", "");
           // user_pref("font.system.whitelist", "");
           // user_pref("general.appname.override", "");
           // user_pref("general.appversion.override", "");
           // user_pref("general.buildID.override", "");
           // user_pref("general.oscpu.override", "");
           // user_pref("general.platform.override", "");
           // user_pref("general.useragent.override", "");
           // user_pref("media.navigator.enabled", "");
           // user_pref("media.ondevicechange.enabled", "");
           // user_pref("media.video_stats.enabled", "");
           // user_pref("media.webspeech.synth.enabled", "");
           // user_pref("ui.use_standins_for_native_colors", "");
           // user_pref("webgl.enable-debug-renderer-info", "");


        user_pref("_user.js.parrot", "9000 syntax error: the parrot's cashed in 'is chips!");

        user_pref("browser.startup.homepage_override.mstone", "ignore"); // [HIDDEN PREF]

        user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);
        user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);

        user_pref("browser.messaging-system.whatsNewPanel.enabled", false);

        user_pref("browser.urlbar.showSearchTerms.enabled", false);


        user_pref("_user.js.parrot", "9999 syntax error: the parrot's shuffled off 'is mortal coil!");



        user_pref("_user.js.parrot", "SUCCESS: No no he's not dead, he's, he's restin'!");

        user_pref("keyword.enabled", true);

        // Homepage
        user_pref("browser.startup.homepage", "about:home");
        user_pref("browser.startup.page", 1);
        user_pref("browser.newtabpage.enabled", true);


        user_pref("dom.security.https_only_mode.upgrade_local", true);


        user_pref("browser.safebrowsing.downloads.remote.enabled", true);


        user_pref("browser.urlbar.suggest.history", false);
        user_pref("browser.urlbar.suggest.bookmark", false);
        user_pref("browser.urlbar.suggest.openpage", false);
        user_pref("browser.urlbar.suggest.topsites", false);
        user_pref("browser.urlbar.autoFill", false);


        user_pref("extensions.pocket.enabled", false);
        user_pref("extensions.pocket.onSaveRecs", false);


        user_pref("privacy.resistFingerprinting.randomization.daily_reset.enabled", true);
        user_pref("privacy.resistFingerprinting.randomization.daily_reset.private.enabled", true);
        user_pref("privacy.resistFingerprinting.randomization.enabled", true);



        user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

        // Enable CSD
        user_pref("browser.tabs.drawInTitlebar", true);

        // Set UI density to normal
        user_pref("browser.uidensity", 0);

      '';
    };
  };
}
