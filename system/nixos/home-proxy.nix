{ pkgs, config, secret, ... }:

{
  services.nginx.streamConfig = ''
    resolver 1.1.1.1 ipv6=off;

    server {
      listen ${builtins.toString(secret.nginx.upstream.home.port)} ssl proxy_protocol;
      proxy_pass ${secret.nginx.upstream.home.hostname}:${builtins.toString(secret.nginx.upstream.home.port)};
    }
  '';

  networking.firewall.interfaces."enp1s0".allowedTCPPorts = [ secret.nginx.upstream.home.port ];
}
