{ lib, config, secret, ... }:

{
  services.adguardhome = {
    enable = true;

    settings = {
      bind_host = "127.0.0.1";
      bind_port = 3000;

      users = [
        {
          inherit (secret.adguardhome.users.daniel) name password;
        }
      ];

      auth_attempts = 3;
      debug_pprof = false;

      dns = {
        bind_hosts = secret.adguardhome.bind_hosts;
        port = 53;

        bootstrap_dns = [
          "9.9.9.11"
          "149.112.112.11"
          "2620:fe::11"
          "2620:fe::fe:11"
        ];
      };

      tls = {
        enabled = false;
        allow_unencrypted_doh = true;
      };

      dhcp.enabled = false;
    };
  };

  networking.firewall.interfaces =
    let
      interfaces = lib.mapAttrsToList (_: value: lib.attrsets.attrByPath [ "matchConfig" "Name" ] null value) config.systemd.network.networks;
    in
    builtins.listToAttrs
      (builtins.map
        (iface:
          {
            name = iface;
            value = {
              allowedTCPPorts = [ 53 9053 ];
              allowedUDPPorts = [ 53 9053 ];
            };
          })
        (builtins.filter builtins.isString interfaces));

  virtualisation.podman.defaultNetwork.settings.dns_enabled = lib.mkForce secret.adguardhome.podmanDNS;

  services.nginx.virtualHosts."${secret.adguardhome.domain_prefix}.internal.kempkens.network" = {
    serverAliases = [ "dns.internal.kempkens.network" ];

    listen = [
      {
        addr = "0.0.0.0";
        port = 443;
        ssl = true;
      }

      {
        addr = "[::0]";
        port = 443;
        ssl = true;
      }

      {
        addr = "0.0.0.0";
        port = 9053;
        ssl = true;
      }

      {
        addr = "[::0]";
        port = 9053;
        ssl = true;
      }
    ];

    quic = true;
    http3 = true;

    onlySSL = true;
    useACMEHost = "internal.kempkens.network";

    extraConfig = ''
      set_real_ip_from 100.76.233.31/32;
      set_real_ip_from fd7a:115c:a1e0:ab12:4843:cd96:624c:e91f/128;
      real_ip_header X-Forwarded-For;
    '';

    locations."/" = {
      recommendedProxySettings = true;
      proxyPass = "http://127.0.0.1:3000";
    };
  };
}
