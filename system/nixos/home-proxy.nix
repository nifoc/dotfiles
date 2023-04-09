{ pkgs, config, secret, ... }:

{
  services.nginx.streamConfig = ''
    resolver 1.1.1.1 ipv6=off;

    upstream home {
      server ${secret.nginx.upstream.home.hostname}:${builtins.toString secret.nginx.upstream.home.port};
    }

    server {
      listen ${builtins.toString secret.nginx.upstream.home.port};
      proxy_protocol on;
      proxy_pass home;
    }
  '';

  networking.firewall.interfaces."enp1s0".allowedTCPPorts = [ secret.nginx.upstream.home.port ];
}
