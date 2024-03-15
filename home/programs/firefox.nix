{ pkgs, config, secret, ... }:

{
  programs.firefox = {
    enable = true;

    package = null;

    nativeMessagingHosts = with pkgs; [
      tridactyl-native
    ];

    profiles = {
      "daniel" = {
        id = 0;

        settings = {
          # Arkenfox
          "browser.newtabpage.activity-stream.showSponsored" = false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;

          "geo.provider.network.url" = "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%";

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

          "app.shield.optoutstudies.enabled" = false;
          "app.normandy.enabled" = false;
          "app.normandy.api_url" = "";

          "breakpad.reportURL" = "";
          "browser.tabs.crashReporting.sendReport" = false;
          "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;

          "extensions.blocklist.url" = "https://blocklist.addons.mozilla.org/blocklist/3/%APP_ID%/%APP_VERSION%/";

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
          "privacy.clearOnShutdown.downloads" = true;
          "privacy.clearOnShutdown.formdata" = true;
          "privacy.clearOnShutdown.history" = true;
          "privacy.clearOnShutdown.sessions" = true;
          "privacy.clearOnShutdown.cookies" = false;
          "privacy.clearOnShutdown.offlineApps" = false;

          "browser.messaging-system.whatsNewPanel.enabled" = false;
          "browser.urlbar.showSearchTerms.enabled" = false;

          # Custom
          "extensions.pocket.enabled" = false;

          "privacy.globalprivacycontrol.functionality.enabled" = true;
          "privacy.globalprivacycontrol.enabled" = true;

          "network.proxy.type" = 2;
          "network.proxy.autoconfig_url" = "file:///Users/daniel/Documents/Firefox/default.pac";

          "network.trr.mode" = 2;
          "network.trr.uri" = secret.firefox.settings.doh_uri;
          "network.trr.custom_uri" = secret.firefox.settings.doh_uri;
          "network.dns.echconfig.enabled" = true;

          "browser.uidensity" = 1;
          "browser.tabs.loadDivertedInBackground" = true;
          "browser.tabs.loadBookmarksInBackground" = true;

          "findbar.highlightAll" = true;

          "cookiebanners.service.mode" = 1;
          "cookiebanners.service.mode.privateBrowsing" = 1;

          # Themes
          "browser.compactmode.show" = true;
          "layout.css.prefers-color-scheme.content-override" = 2;
        };

        search = {
          force = true;

          default = "Kagi";
          privateDefault = "DuckDuckGo";

          order = [
            "Kagi"
            "DuckDuckGo"
            "Nix Packages"
            "NixOS Options"
            "GitHub"
            "Hex"
            "Google"
            "Brave"
          ];

          engines = {
            "DuckDuckGo".metaData.alias = "!d";
            "Google".metaData.alias = "!g";

            "Bing".metaData.hidden = true;
            "eBay".metaData.hidden = true;
            "Ecosia".metaData.hidden = true;
            "LEO Eng-Deu".metaData.hidden = true;

            "Kagi" = {
              urls = [{
                template = "https://kagi.com/search";
                params = [
                  { name = "q"; value = "{searchTerms}"; }
                ];
              }];

              iconUpdateURL = "https://assets.kagi.com/v1/favicon-32x32.png";
              updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = [ "!k" ];
            };

            "Brave" = {
              urls = [{
                template = "https://search.brave.com/search";
                params = [
                  { name = "q"; value = "{searchTerms}"; }
                ];
              }];

              iconUpdateURL = "https://cdn.search.brave.com/serp/v1/static/brand/eebf5f2ce06b0b0ee6bbd72d7e18621d4618b9663471d42463c692d019068072-brave-lion-favicon.png";
              updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = [ "!b" ];
            };

            "GitHub" = {
              urls = [{
                template = "https://github.com/search";
                params = [
                  { name = "type"; value = "repositories"; }
                  { name = "q"; value = "{searchTerms}"; }
                ];
              }];

              iconUpdateURL = "https://github.githubassets.com/favicons/favicon.svg";
              updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = [ "!gh" ];
            };

            "Nix Packages" = {
              urls = [{
                template = "https://search.nixos.org/packages";
                params = [
                  { name = "type"; value = "packages"; }
                  { name = "channel"; value = "unstable"; }
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];

              icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "!nix" ];
            };

            "NixOS Options" = {
              urls = [{
                template = "https://search.nixos.org/options";
                params = [
                  { name = "type"; value = "packages"; }
                  { name = "channel"; value = "unstable"; }
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];

              icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "!nixopt" ];
            };

            "Hex" = {
              urls = [{
                template = "https://hex.pm/packages";
                params = [
                  { name = "search"; value = "{searchTerms}"; }
                ];
              }];

              iconUpdateURL = "https://hex.pm/favicon.ico";
              updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = [ "!hex" ];
            };

            "Emojipedia" = {
              urls = [{
                template = "https://emojipedia.org/search";
                params = [
                  { name = "q"; value = "{searchTerms}"; }
                ];
              }];

              iconUpdateURL = "https://emojipedia.org/images/favicon-32x32.png";
              updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = [ "!emoji" ];
            };
          };
        };
      };
    };
  };

  xdg.configFile."tridactyl/tridactylrc".text =
    let
      wezterm = "${pkgs.wezterm}/bin/wezterm";
      nvim = "${config.programs.neovim.finalPackage}/bin/nvim";
    in
      /* vim */ ''
      set editorcmd ${wezterm} -e ${nvim}

      set smoothscroll true

      bind x tabclose
    '';
}
