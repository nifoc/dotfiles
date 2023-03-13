{ pkgs, ... }:

{
  services.nginx = {
    enable = true;
    package = pkgs.nginxQuic;

    recommendedOptimisation = true;
    recommendedGzipSettings = true;
    recommendedBrotliSettings = true;
    recommendedTlsSettings = true;

    commonHttpConfig = ''
      map $remote_addr $remote_addr_anon {
        ~(?P<ip>\d+\.\d+\.\d+)\.    $ip.0;
        ~(?P<ip>[^:]+:[^:]+):       $ip::;
        default                     0.0.0.0;
      }

      log_format combined_anon '$remote_addr_anon - $remote_user [$time_local] '
                               '"$request" $status $body_bytes_sent '
                               '"$http_referer" "$http_user_agent"';

      access_log /var/log/nginx/access.log combined_anon buffer=32k flush=5m;
    '';
  };

  networking.firewall.interfaces =
    let
      nginxTCPPorts = [ 80 443 ];
      nginxUDPPorts = [ 443 ];
    in
    {
      "enp1s0".allowedTCPPorts = nginxTCPPorts;
      "enp1s0".allowedUDPPorts = nginxUDPPorts;
      "tailscale0".allowedTCPPorts = nginxTCPPorts;
      "tailscale0".allowedUDPPorts = nginxUDPPorts;
    };
}
