{
  config,
  lib,
  blockyPorts,
  valkeyInstance ? { },
  ...
}:

{
  services = {
    blocky = {
      enable = true;

      settings = {
        ports = blockyPorts;

        upstreams = {
          groups.default = [
            "tcp-tls:blank.dnsforge.de:853"
            "tcp-tls:dns.digitalsize.net:853"
            "tcp-tls:dns3.digitalcourage.de:853"
            "https://doh.ffmuc.net/dns-query"
            "https://doh.dns.sb/dns-query"
            "https://dns.mullvad.net/dns-query"
            "https://dns.artikel10.org/dns-query"
          ];

          strategy = "parallel_best";
          timeout = "2s";
        };

        connectIPVersion = "dual";

        bootstrapDns = [
          "tcp+udp:9.9.9.9"
          "tcp+udp:149.112.112.112"
          "tcp+udp:193.110.81.0"
          "tcp+udp:185.253.5.0"
        ];

        customDNS = {
          mapping = {
            "fritz.box" = "10.0.0.14";
          };
        };

        conditional = {
          mapping = {
            "lan" = "10.0.0.1";
            "lansecurity" = "10.0.0.1";
            "laniot" = "10.0.0.1";
            "languest" = "10.0.0.1";
            "lanmgmt" = "10.0.0.1";
            "0.0.10.in-addr.arpa" = "10.0.0.1";
            "50.0.10.in-addr.arpa" = "10.0.0.1";
            "51.0.10.in-addr.arpa" = "10.0.0.1";
            "99.0.10.in-addr.arpa" = "10.0.0.1";
            "100.0.10.in-addr.arpa" = "10.0.0.1";
          };
        };

        blocking = {
          denylists = {
            basic = [
              "https://raw.githubusercontent.com/hagezi/dns-blocklists/main/wildcard/tif.txt"
              "https://malware-filter.gitlab.io/malware-filter/urlhaus-filter-wildcard-online.txt"
            ];

            expert = [
              "https://raw.githubusercontent.com/sjhgvr/oisd/refs/heads/main/domainswild_big.txt"
              "https://raw.githubusercontent.com/hagezi/dns-blocklists/main/wildcard/pro.txt"
            ];
          };

          clientGroupsBlock = {
            default = [ "basic" ];

            pallas = [
              "basic"
              "expert"
            ];

            styx = [
              "basic"
              "expert"
            ];

            daniels-browser = [
              "basic"
              "expert"
            ];

            daniels-iphone = [
              "basic"
              "expert"
            ];
          };

          blockType = "nxDomain";
          blockTTL = "5m";

          loading = {
            refreshPeriod = "4h";

            downloads = {
              timeout = "10s";
              writeTimeout = "20s";
              readTimeout = "20s";
              readHeaderTimeout = "10s";
              attempts = 3;
              cooldown = "2s";
            };
          };
        };

        clientLookup = {
          upstream = "10.0.0.1";

          clients = {
            pallas = [
              "100.89.41.25"
              "fd7a:115c:a1e0::f401:2919"
            ];

            styx = [
              "100.90.80.127"
              "fd7a:115c:a1e0::401:507f"
            ];

            daniels-iphone = [
              "100.90.174.92"
              "fd7a:115c:a1e0::2a01:ae5c"
            ];
          };
        };

        caching = {
          exclude = [
            "/.*\.lan$/"
            "/.*\.lansecurity$/"
            "/.*\.laniot$/"
            "/.*\.languest$/"
            "/.*\.lanmgmt$/"
            "/.*\.local$/"
          ];
        };

        redis = lib.mkIf (builtins.hasAttr "connect" valkeyInstance) {
          address = "${valkeyInstance.connect}:${toString valkeyInstance.port}";
          password = "didYouFindTheSecret?";
          required = false;
          connectionAttempts = 10;
          connectionCooldown = "10s";
        };

        ede.enable = true;
      };
    };

    nginx = lib.mkIf (builtins.hasAttr "http" blockyPorts) {
      virtualHosts."dns.internal.kempkens.network" = {
        quic = true;
        http3 = true;

        onlySSL = true;
        useACMEHost = "internal.kempkens.network";

        locations."/dns-query" = {
          recommendedProxySettings = true;
          proxyPass = "http://127.0.0.1:8053";
        };
      };
    };

    redis.servers = lib.mkIf (builtins.hasAttr "bind" valkeyInstance) {
      blocky = {
        enable = true;

        inherit (valkeyInstance) bind;
        inherit (valkeyInstance) port;

        openFirewall = true;
        requirePass = "didYouFindTheSecret?";

        databases = 1;
        save = [ ];
        appendOnly = false;
        appendFsync = "no";
      };
    };
  };

  systemd.services.blocky = {
    wants = [ "tailscaled.service" ];
    after = [ "tailscaled.service" ];
  };

  networking.firewall.interfaces =
    let
      interfaces =
        lib.mapAttrsToList (
          _: lib.attrsets.attrByPath [ "matchConfig" "Name" ] null
        ) config.systemd.network.networks
        ++ [ "tailscale0" ];
    in
    builtins.listToAttrs (
      builtins.map (iface: {
        name = iface;
        value = {
          allowedTCPPorts = [ 53 ];
          allowedUDPPorts = [ 53 ];
        };
      }) (builtins.filter builtins.isString interfaces)
    );

  virtualisation.podman.defaultNetwork.settings.dns_enabled = true;
}
