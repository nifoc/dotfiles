{
  pkgs,
  config,
  lib,
  ...
}:

let
  profileName = "daniel";

  settings = {
    # Arkenfox
    "browser.newtabpage.activity-stream.showSponsored" = false;
    "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;

    "geo.provider.network.url" =
      "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%";

    "extensions.getAddons.showPane" = false;
    "extensions.htmlaboutaddons.recommendations.enabled" = false;
    "browser.discovery.enabled" = false;
    "browser.shopping.experience2023.enabled" = false;

    "datareporting.policy.dataSubmissionEnabled" = false;
    "datareporting.healthreport.uploadEnabled" = false;
    "toolkit.telemetry.unified" = false;
    "toolkit.telemetry.enabled" = false;
    "toolkit.telemetry.server" = "data:,";
    "toolkit.telemetry.archive.enabled" = false;
    "toolkit.telemetry.newProfilePing.enabled" = false;
    "toolkit.telemetry.shutdownPingSender.enabled" = false;
    "toolkit.telemetry.updatePing.enabled" = false;
    "toolkit.telemetry.bhrPing.enabled" = false;
    "toolkit.telemetry.firstShutdownPing.enabled" = false;
    "toolkit.telemetry.coverage.opt-out" = true;
    "toolkit.coverage.opt-out" = true;
    "toolkit.coverage.endpoint.base" = "";
    "browser.ping-centre.telemetry" = false;
    "browser.newtabpage.activity-stream.feeds.telemetry" = false;
    "browser.newtabpage.activity-stream.telemetry" = false;
    "dom.private-attribution.submission.enabled" = false;

    "app.shield.optoutstudies.enabled" = false;
    "app.normandy.enabled" = false;
    "app.normandy.api_url" = "";

    "breakpad.reportURL" = "";
    "browser.tabs.crashReporting.sendReport" = false;
    "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;

    "extensions.blocklist.url" =
      "https://blocklist.addons.mozilla.org/blocklist/3/%APP_ID%/%APP_VERSION%/";

    "network.prefetch-next" = false;
    "network.dns.disablePrefetch" = true;
    "network.predictor.enabled" = false;
    "network.predictor.enable-prefetch" = false;
    "network.http.speculative-parallel-limit" = 0;
    "browser.places.speculativeConnect.enabled" = false;

    "network.gio.supported-protocols" = "";

    "browser.fixup.alternate.enabled" = false;
    "browser.search.suggest.enabled" = false;
    "browser.urlbar.suggest.searches" = false;
    "browser.urlbar.speculativeConnect.enabled" = false;
    "browser.urlbar.dnsResolveSingleWordsAfterSearch" = 0;
    "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
    "browser.urlbar.suggest.quicksuggest.sponsored" = false;
    "browser.urlbar.trending.featureGate" = false;
    "browser.urlbar.addons.featureGate" = false;
    "browser.urlbar.mdn.featureGate" = false;
    "browser.urlbar.pocket.featureGate" = false;
    "browser.urlbar.weather.featureGate" = false;
    "browser.urlbar.yelp.featureGate" = false;
    "browser.formfill.enable" = false;

    "browser.search.separatePrivateDefault" = true;
    "browser.search.separatePrivateDefault.ui.enabled" = true;

    "browser.privatebrowsing.forceMediaMemoryCache" = true;
    "media.memory_cache_max_size" = 65536;

    "security.ssl.require_safe_negotiation" = true;

    "security.OCSP.enabled" = 1;
    "security.OCSP.require" = true;

    "security.cert_pinning.enforcement_level" = 2;
    "security.remote_settings.crlite_filters.enabled" = true;
    "security.pki.crlite_mode" = 2;

    "dom.security.https_only_mode" = true;
    "dom.security.https_only_mode_send_http_background_request" = false;

    "security.ssl.treat_unsafe_negotiation_as_broken" = true;
    "browser.xul.error_pages.expert_bad_cert" = true;

    "network.http.referer.XOriginTrimmingPolicy" = 2;

    "media.peerconnection.ice.proxy_only_if_behind_proxy" = true;
    "media.peerconnection.ice.default_address_only" = true;

    "browser.uitour.enabled" = false;
    "devtools.debugger.remote-enabled" = false;
    "network.IDN_show_punycode" = true;

    "browser.contentblocking.category" = "strict";
    "privacy.partition.serviceWorkers" = true;
    "privacy.partition.always_partition_third_party_non_cookie_storage" = true;
    "privacy.partition.always_partition_third_party_non_cookie_storage.exempt_sessionstorage" = false;

    "privacy.sanitize.sanitizeOnShutdown" = true;
    "privacy.clearOnShutdown.cache" = true;
    "privacy.clearOnShutdown_v2.cache" = true;
    "privacy.clearOnShutdown.downloads" = true;
    "privacy.clearOnShutdown.formdata" = true;
    "privacy.clearOnShutdown.history" = true;
    "privacy.clearOnShutdown_v2.historyFormDataAndDownloads" = true;
    "privacy.clearOnShutdown.sessions" = true;
    "privacy.clearOnShutdown.cookies" = false;
    "privacy.clearOnShutdown.offlineApps" = false;

    "privacy.clearSiteData.cache" = true;
    "privacy.clearSiteData.historyFormDataAndDownloads" = true;

    "privacy.clearHistory.historyFormDataAndDownloads" = true;

    "browser.messaging-system.whatsNewPanel.enabled" = false;
    "browser.urlbar.showSearchTerms.enabled" = false;

    # Custom
    "extensions.pocket.enabled" = false;

    "privacy.globalprivacycontrol.functionality.enabled" = true;
    "privacy.globalprivacycontrol.enabled" = true;

    "network.proxy.type" = 2;
    "network.proxy.autoconfig_url" = "file:///Users/daniel/Documents/Firefox/default.pac";

    "network.trr.mode" = 2;
    "network.dns.echconfig.enabled" = true;

    "browser.tabs.loadDivertedInBackground" = true;
    "browser.tabs.loadBookmarksInBackground" = true;

    "findbar.highlightAll" = true;

    "cookiebanners.service.mode" = 1;
    "cookiebanners.service.mode.privateBrowsing" = 1;

    "browser.translations.select.enable" = true;
    "network.dns.preferIPv6" = true;

    # Themes
    "browser.uidensity" = 1;
    "browser.compactmode.show" = true;
    "layout.css.prefers-color-scheme.content-override" = 2;
  };
in
{
  programs.firefox = {
    enable = true;

    package = null;

    nativeMessagingHosts = with pkgs; [
      tridactyl-native
    ];
  };

  home.file =
    let
      fullProfilePath = "Library/Application Support/Firefox/Profiles/${profileName}";

      userPrefValue =
        pref:
        builtins.toJSON (
          if lib.isBool pref || lib.isInt pref || lib.isString pref then pref else builtins.toJSON pref
        );

      mkUserJs = prefs: ''
        ${lib.concatStrings (
          lib.mapAttrsToList (name: value: ''
            user_pref("${name}", ${userPrefValue value});
          '') prefs
        )}
      '';
    in
    {
      "${fullProfilePath}/user.js".text = mkUserJs settings;
    };

  xdg.configFile."tridactyl/tridactylrc".text =
    let
      wezterm = "${pkgs.wezterm}/bin/wezterm";
      nvim = "${config.programs.neovim.finalPackage}/bin/nvim";
    in
    # vim
    ''
      set editorcmd ${wezterm} -e ${nvim}

      set smoothscroll true

      bind x tabclose
    '';
}
