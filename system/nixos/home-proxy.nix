{ pkgs, config, secret, ... }:

{
  services.nginx.streamConfig = ''
    resolver 1.1.1.1 ipv6=off;

    server {
      listen 0.0.0.0:${builtins.toString(secret.nginx.upstream.home.port)};
      proxy_pass ${secret.nginx.upstream.home.hostname}:${builtins.toString(secret.nginx.upstream.home.port)};
    }
  '';

  networking.firewall.interfaces."enp1s0".allowedTCPPorts = [ secret.nginx.upstream.home.port ];
}
