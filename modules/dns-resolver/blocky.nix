{ den, ... }:

{
  den.aspects.dns-resolver = {
    nixos =
      { config, lib, ... }:
      let
        cfg = den.aspects.${config.networking.hostName}.meta;
        dnsInterfaces = (cfg.dns-resolver.interfaces or [ ]);
        trustedInterfaces = cfg.firewall.trustedInterfaces;

        deviceIps = den.aspects.base.meta.networking.ips;
      in
      {
        services.blocky = {
          enable = true;

          settings = {
            ports = {
              http = [ "127.0.0.1:8053" ];
              freeBind = true;
            };

            upstreams = {
              groups.default = [
                "quic:doq.ffmuc.net"
                "quic:blank.dnsforge.de"
                "tcp-tls:dns.digitalsize.net:853"
                "tcp-tls:dns3.digitalcourage.de:853"
                "tcp-tls:dot.sb:853"
              ];

              strategy = "parallel_best";
              timeout = "2s";
            };

            connectIPVersion = "dual";

            bootstrapDns = [
              "tcp+udp:9.9.9.9"
              "tcp+udp:149.112.112.112"
              "tcp+udp:86.54.11.100"
            ];

            customDNS = {
              mapping = {
                "fritz.box" = "10.0.200.2";
              };
            };

            blocking = {
              denylists = {
                basic = [
                  "https://hagezi-mirror.dnsbunker.org/wildcard/tif.mini.txt"
                  "https://malware-filter.gitlab.io/malware-filter/urlhaus-filter-wildcard-online.txt"
                  "https://hagezi-mirror.dnsbunker.org/wildcard/fake.txt"
                ];

                expert = [
                  "https://big.oisd.nl/domainswild"
                  "https://hagezi-mirror.dnsbunker.org/wildcard/pro.txt"
                ];

                iot = [
                  "https://hagezi-mirror.dnsbunker.org/wildcard/native.lgwebos.txt"
                  "https://hagezi-mirror.dnsbunker.org/wildcard/native.samsung.txt"
                  "https://hagezi-mirror.dnsbunker.org/wildcard/dyndns.txt"
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
              clients = {
                inherit (deviceIps.tailscale) daniels-iphone pallas;

                styx = [
                  "100.90.80.127"
                  "fd7a:115c:a1e0::401:507f"
                ];
              };
            };

            dnssec = {
              validate = false;
              cacheExpirationHours = 2;
            };

            caching = {
              prefetching = true;

              exclude = [
                "/.*\\.lan$/"
                "/.*\\.lansecurity$/"
                "/.*\\.laniot$/"
                "/.*\\.languest$/"
                "/.*\\.lanmgmt$/"
                "/.*\\.landtag$/"
                "/.*\\.local$/"
              ];
            };

            queryLog.type = "none";

            prometheus.enable = true;

            ede.enable = true;

            ecs = {
              useAsClient = false;
              forward = false;
            };
          };
        };

        networking.firewall.interfaces =
          let
            interfaces =
              if builtins.length dnsInterfaces == 0 then
                (
                  lib.mapAttrsToList (
                    _: lib.attrsets.attrByPath [ "matchConfig" "Name" ] null
                  ) config.systemd.network.networks
                  ++ trustedInterfaces
                )
              else
                dnsInterfaces;
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
      };
  };
}
