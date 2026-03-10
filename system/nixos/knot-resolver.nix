{
  pkgs,
  config,
  lib,
  workers ? 2,
  extraLlisten ? [ ],
  ...
}:

{
  services = {
    knot-resolver = {
      enable = true;
      # managerPackage = pkgs.knot-resolver-manager_6.override { extraFeatures = true; };

      settings = {
        inherit workers;

        network = {
          listen = [
            {
              interface = [
                "127.0.0.1"
                "::1"
              ];
              kind = "dns";
              freebind = false;
            }

            {
              interface = [
                "127.0.0.1"
                "::1"
              ];
              port = 8053;
              kind = "doh2";
              freebind = false;
            }
          ]
          ++ extraLlisten;

          proxy-protocol = {
            enable = true;
            allow = [
              "127.0.0.1"
              "::1"
            ];
          };
        };

        forward =
          let
            localDomains = [
              "lan"
              "lansecurity"
              "laniot"
              "languest"
              "lanmgmt"
              "landtag"
              "0.0.10.in-addr.arpa"
              "50.0.10.in-addr.arpa"
              "51.0.10.in-addr.arpa"
              "99.0.10.in-addr.arpa"
              "100.0.10.in-addr.arpa"
              "200.0.10.in-addr.arpa"
            ];

            localForwards = map (domain: {
              subtree = "${domain}.";
              servers = [ "10.0.0.1" ];
              options = {
                authoritative = true;
                dnssec = false;
              };
            }) localDomains;
          in
          [
            {
              subtree = ".";
              servers = [
                {
                  address = [
                    "2001:678:e68:f000::"
                    "5.1.66.255"
                    "2001:678:ed0:f000::"
                    "185.150.99.255"
                  ];
                  transport = "tls";
                  hostname = "dot.ffmuc.net";
                }

                {
                  address = [
                    "2a01:4f8:c17:7aa5::249"
                    "78.47.71.194"
                    "2a01:4f8:c013:aae9::194"
                    "138.199.149.249"
                  ];
                  transport = "tls";
                  hostname = "blank.dnsforge.de";
                }

                {
                  address = [
                    "2a01:4f8:13b:3407::face"
                    "94.130.135.203"
                  ];
                  transport = "tls";
                  hostname = "dns.digitalsize.net";
                }

                {
                  address = [
                    "2a01:4f8:251:554::2"
                    "5.9.164.112"
                  ];
                  transport = "tls";
                  hostname = "dns3.digitalcourage.de";
                }
              ];
            }
          ]
          ++ localForwards;

        views = [
          {
            subnets = [
              # Pallas
              "100.119.140.87"
              "fd7a:115c:a1e0::3801:8c5c"

              # Styx
              "100.90.80.127"
              "fd7a:115c:a1e0::401:507f"

              # Daniels iPhone
              "100.90.174.92"
              "fd7a:115c:a1e0::2a01:ae5c"
            ];
            tags = [ "aggressive" ];
          }
        ];

        local-data = {
          addresses = {
            "fritz.box" = "10.0.200.2";
          };

          rpz = [
            # Basic
            {
              file = "/var/lib/knot-resolver/urlhaus.rpz";
            }

            {
              file = "/var/lib/knot-resolver/hagezi-tif.rpz";
            }

            {
              file = "/var/lib/knot-resolver/hagezi-fake.rpz";
            }

            # Aggressive
            {
              file = "/var/lib/knot-resolver/oisd-big.rpz";
              tags = [ "aggressive" ];
            }

            {
              file = "/var/lib/knot-resolver/hagezi-pro.rpz";
              tags = [ "aggressive" ];
            }
          ];
        };

        cache = {
          storage = "/var/cache/knot-resolver";
          size-max = "100M";

          prefetch = {
            expiring = true;
          };
        };

        monitoring = {
          metrics = "always";
        };

        management = {
          interface = "127.0.0.1@8853";
        };
      };
    };

    caddy = {
      virtualHosts."dns.internal.kempkens.network" = {
        serverAliases = [ "dns-${config.networking.hostName}.internal.kempkens.network" ];

        extraConfig = ''
          encode

          header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

          @knot_doh {
            path /dns-query
          }

          @knot_metrics {
            path /metrics
            path /metrics/*
          }

          reverse_proxy @knot_doh 127.0.0.1:8053 {
            transport http {
              tls
              tls_insecure_skip_verify
              proxy_protocol v2
            }
          }

          reverse_proxy @knot_metrics 127.0.0.1:8853
        '';
      };
    };
  };

  systemd = {
    services = {
      knot-blocklist-update = {
        description = "Update Knot Blocklists";
        startAt = "*-*-* 00,12:00:00";
        restartIfChanged = true;

        path = with pkgs; [
          coreutils
          curl

          config.services.knot-resolver.managerPackage
        ];

        script = ''
          # HaGeZi
          curl --fail -o hagezi-tif.rpz.tmp https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/rpz/tif.txt
          if [ "$?" -eq 0 ]; then
            mv hagezi-tif.rpz.tmp hagezi-tif.rpz
          else
            rm -f hagezi-tif.rpz.tmp
          fi

          curl --fail -o hagezi-fake.rpz.tmp https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/rpz/fake.txt
          if [ "$?" -eq 0 ]; then
            mv hagezi-fake.rpz.tmp hagezi-fake.rpz
          else
            rm -f hagezi-fake.rpz.tmp
          fi

          curl --fail -o hagezi-pro.rpz.tmp https://cdn.jsdelivr.net/gh/hagezi/dns-blocklists@latest/rpz/pro.txt
          if [ "$?" -eq 0 ]; then
            mv hagezi-pro.rpz.tmp hagezi-pro.rpz
          else
            rm -f hagezi-pro.rpz.tmp
          fi

          # URLHaus
          curl --fail -o urlhaus.rpz.tmp https://malware-filter.gitlab.io/malware-filter/urlhaus-filter-rpz.conf
          if [ "$?" -eq 0 ]; then
            mv urlhaus.rpz.tmp urlhaus.rpz
          else
            rm -f urlhaus.rpz.tmp
          fi

          # oisd
          curl --fail -o oisd-big.rpz.tmp https://big.oisd.nl/rpz
          if [ "$?" -eq 0 ]; then
            mv oisd-big.rpz.tmp oisd-big.rpz
          else
            rm -f oisd-big.rpz.tmp
          fi

          kresctl reload
        '';

        serviceConfig = {
          Type = "oneshot";
          User = "knot-resolver";
          Group = "knot-resolver";
          WorkingDirectory = "/var/lib/knot-resolver";

          DevicePolicy = "closed";
          LockPersonality = true;
          ProtectControlGroups = true;
          ProtectKernelModules = true;
          ProtectKernelTunables = true;
          PrivateDevices = true;
          PrivateTmp = true;
          RestrictNamespaces = true;
        };
      };
    };

    timers.knot-blocklist-update.timerConfig.RandomizedDelaySec = "1h";
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
