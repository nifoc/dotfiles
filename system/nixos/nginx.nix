{ pkgs, ... }:

{
  services.nginx = {
    enable = true;
    package = pkgs.nginxQuic;

    recommendedOptimisation = true;
    recommendedGzipSettings = true;
    recommendedBrotliSettings = true;
    recommendedZstdSettings = true;
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
}
