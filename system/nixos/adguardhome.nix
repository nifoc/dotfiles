{ lib, config, secret, ... }:

{
  services.adguardhome = {
    enable = true;

    mutableSettings = true;
    # settings = null;

    settings =
      let
        inherit (config.security.acme) certs;
      in
      {
        tls = {
          enabled = true;

          port_https = 10443;
          port_dns_over_tls = 1053;
          port_dns_over_quic = 1053;
          port_dnscrypt = 0;

          certificate_path = "${certs."dns.kempkens.network".directory}/fullchain.pem";
          private_key_path = "${certs."dns.kempkens.network".directory}/key.pem";

          server_name = "dns.kempkens.network";
          allow_unencrypted_doh = true;
          strict_sni_check = true;
        };

        dns = {
          # Based on: https://pkg.go.dev/github.com/Potterli20/golibs-fork/netutil#IsLocallyServed
          private_networks = [
            "10.0.0.0/8"
            "127.0.0.0/8"
            "169.254.0.0/16"
            "172.16.0.0/12"
            "192.0.2.0/24"
            "192.168.0.0/16"
            "198.51.100.0/24"
            "203.0.113.0/24"
            "255.255.255.255/32"

            "::/128"
            "::1/128"
            "2001:db8::/32"
            "fd00::/8"
            "fe80::/10"

            "100.64.0.0/10"
            "fd7a:115c:a1e0::/96"
          ];
        };
      };

    # settings = {
    #   schema_version = 20;
    #   bind_host = "127.0.0.1";
    #   bind_port = 3000;
    #
    #   users = [
    #     {
    #       inherit (secret.adguardhome.users.daniel) name password;
    #     }
    #   ];
    #
    #   auth_attempts = 3;
    #   debug_pprof = false;
    #
    #   dns = {
    #     inherit (secret.adguardhome) bind_hosts;
    #     port = 53;
    #
    #     bootstrap_dns = [
    #       "9.9.9.11"
    #       "149.112.112.11"
    #       "2620:fe::11"
    #       "2620:fe::fe:11"
    #     ];
    #   };
    #
    #   tls = {
    #     enabled = false;
    #     allow_unencrypted_doh = true;
    #   };
    #
    #   dhcp.enabled = false;
    # };
  };

  systemd.services.adguardhome.serviceConfig = {
    SupplementaryGroups = [ "nginx" ];
  };

  networking.firewall.interfaces =
    let
      interfaces = lib.mapAttrsToList (_: lib.attrsets.attrByPath [ "matchConfig" "Name" ] null) config.systemd.network.networks ++ [ "tailscale0" ];
    in
    builtins.listToAttrs
      (builtins.map
        (iface:
          {
            name = iface;
            value = {
              allowedTCPPorts = [ 53 1053 9053 10443 ];
              allowedUDPPorts = [ 53 1053 9053 10443 ];
            };
          })
        (builtins.filter builtins.isString interfaces));

  virtualisation.podman.defaultNetwork.settings.dns_enabled = lib.mkForce secret.adguardhome.podmanDNS;

  services.nginx = {
    upstreams.adguardhome = {
      servers = {
        "127.0.0.1:3000" = {
          fail_timeout = "2s";
        };
      };

      extraConfig = ''
        keepalive 16;
      '';
    };

    virtualHosts."${secret.adguardhome.domain_prefix}.internal.kempkens.network" = {
      serverAliases = [
        "${secret.adguardhome.domain_prefix}-direct.internal.kempkens.network"
        "dns.internal.kempkens.network"
      ];

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
          extraParameters = [
            "fastopen=63"
            "backlog=1023"
            "deferred"
          ];
        }

        {
          addr = "[::0]";
          port = 9053;
          ssl = true;
          extraParameters = [
            "fastopen=63"
            "backlog=1023"
            "deferred"
          ];
        }
      ];

      quic = true;
      http3 = true;

      onlySSL = true;
      useACMEHost = "internal.kempkens.network";

      extraConfig = ''
        set_real_ip_from 100.122.253.109/32;
        set_real_ip_from fd7a:115c:a1e0::3a01:fd6d/128;
        real_ip_header X-Forwarded-For;
      '';

      locations."/" = {
        recommendedProxySettings = true;
        proxyPass = "http://adguardhome";
      };
    };
  };
}
