{ den, ... }:

{
  den.aspects.dns-resolver = {
    nixos =
      { config, lib, ... }:
      let
        cfg = den.aspects.${config.networking.hostName}.meta;
        dnsInterfaces = (cfg.dns-resolver.interfaces or [ ]);
        trustedInterfaces = cfg.firewall.trustedInterfaces;
        localAccess = (cfg.dns-resolver.localAccess or true);
      in
      {
        services.knot-resolver = {
          enable = true;

          settings = {
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
              ];

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

                    {
                      address = [
                        "2001:67c:1401:2120::1"
                        "217.197.91.153"
                      ];
                      transport = "tls";
                      hostname = "dns.artikel10.org";
                    }
                  ];
                }
              ]
              ++ lib.optionals localAccess localForwards;

            views = [
              {
                subnets = [
                  # Almost certainly always DOH
                  "::1"

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
                  file = "/var/lib/knot-resolver/hagezi-tif-1.rpz";
                }

                {
                  file = "/var/lib/knot-resolver/hagezi-tif-2.rpz";
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
