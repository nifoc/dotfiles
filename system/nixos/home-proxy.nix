{ pkgs, config, secret, ... }:

{
  services.nginx.streamConfig = ''
    resolver 1.1.1.1 ipv6=off;

    upstream video {
      server ${secret.nginx.upstream.video.hostname}:${builtins.toString secret.nginx.upstream.video.upstreamPort};
    }

    server {
      listen *:${builtins.toString secret.nginx.upstream.video.externalPort};
      listen [::]:${builtins.toString secret.nginx.upstream.video.externalPort};

      proxy_protocol on;
      proxy_pass video;
    }
  '';

  services.nginx = {
    commonHttpConfig = ''
      resolver 1.1.1.1;
    '';

    upstreams.dns = {
      servers = {
        "${secret.nginx.upstream.dns.primary.hostname}:${builtins.toString secret.nginx.upstream.dns.primary.upstreamPort}" = {
          fail_timeout = "5s";
        };

        "${secret.nginx.upstream.dns.secondary.hostname}:${builtins.toString secret.nginx.upstream.dns.secondary.upstreamPort}" = {
          backup = true;
        };
      };

      extraConfig = ''
        keepalive 8;
      '';
    };

    virtualHosts."${secret.nginx.upstream.dns.fqdn}" = {
      quic = true;
      http3 = true;

      onlySSL = true;
      useACMEHost = "daniel.sx";

      locations."/${secret.adguardhome.auth}/dns-query" = {
        recommendedProxySettings = true;
        proxyPass = "https://dns";

        extraConfig = ''
          rewrite ^/${secret.adguardhome.auth}(.*)$ $1 break;

          proxy_hide_header alt-svc;
        '';
      };
    };
  };

  networking.firewall.interfaces."enp41s0".allowedTCPPorts = [
    secret.nginx.upstream.video.externalPort
  ];
}
