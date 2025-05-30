{ lib, ... }:

let
  fqdn = "prowlarr.internal.kempkens.network";
  netns = "dl";
in
{
  virtualisation.oci-containers.containers.prowlarr = {
    image = "lscr.io/linuxserver/prowlarr:latest";
    ports = [ "192.168.42.2:9696:9696" ];
    dependsOn = [ "flaresolverr" ];
    environment = {
      "PUID" = "2001";
      "PGID" = "2001";
      "TZ" = "Etc/UTC";
      "PROWLARR__AUTH__TRUSTCGNATIPADDRESSES" = "true";
    };
    volumes = [ "/var/lib/prowlarr:/config" ];
    networks = [ "ns:/var/run/netns/${netns}" ];
    labels = {
      "com.centurylinklabs.watchtower.enable" = "true";
      "io.containers.autoupdate" = "registry";
    };
  };

  systemd = {
    services.podman-prowlarr = {
      bindsTo = [ "wg-${netns}.service" ];
      after = lib.mkAfter [ "wg-${netns}.service" ];
    };

    tmpfiles.rules = [
      "d /var/lib/prowlarr 0755 media_user user_media"
    ];
  };

  services.nginx = {
    tailscaleAuth.virtualHosts = [ fqdn ];

    virtualHosts."${fqdn}" = {
      quic = true;
      http3 = true;

      onlySSL = true;
      useACMEHost = "internal.kempkens.network";

      extraConfig = ''
        client_max_body_size 32m;
      '';

      locations."/" = {
        recommendedProxySettings = true;
        proxyPass = "http://192.168.42.2:9696";
        proxyWebsockets = true;
      };
    };
  };
}
