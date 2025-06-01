{ pkgs, ... }:

{
  services.nginx = {
    enable = true;
    package = pkgs.nginxQuic.override {
      withKTLS = true;
    };

    additionalModules = with pkgs.nginxModules; [
      vts
    ];

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

      log_format combined_vhost '$host:$server_port '
                                '$remote_addr - $remote_user [$time_local] '
                                '"$request" $status $body_bytes_sent '
                                '"$http_referer" "$http_user_agent"';

      access_log /var/log/nginx/access.log combined_vhost buffer=32k flush=5m;

      map $remote_addr $tailscale_auth_skip {
        100.83.191.69 yes;
        fd7a:115c:a1e0::d034:bf45 yes;
        100.88.88.45 yes;
        fd7a:115c:a1e0::cb01:582d yes;
        default no;
      }

      vhost_traffic_status_zone;
    '';

    # Currently breaks HTTP3
    # appendConfig = ''
    #   worker_processes auto;
    # '';

    virtualHosts."localhost" = {
      listen = [
        {
          addr = "127.0.0.1";
          port = 80;
        }
        {
          addr = "[::1]";
          port = 80;
        }
      ];

      locations."/status".extraConfig = ''
        vhost_traffic_status_display;
        vhost_traffic_status_display_format html;

        access_log off;
        allow 127.0.0.1;
        allow ::1;
        deny all;
      '';
    };
  };
}
