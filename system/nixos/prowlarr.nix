{ lib, config, ... }:

let
  fqdn = "prowlarr.internal.kempkens.network";
  internalIP = "192.168.42.2";
  internalPort = "9696";
  netns = "dl";
in
{
  virtualisation.oci-containers.containers.prowlarr = {
    image = "lscr.io/linuxserver/prowlarr:latest";
    ports = [ "${internalIP}:${internalPort}:9696" ];
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

  services.caddy = {
    virtualHosts."${fqdn}" = {
      useACMEHost = "internal.kempkens.network";

      extraConfig = ''
        encode

        request_body {
          max_size 32MB
        }

        header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

        forward_auth unix/${config.services.tailscaleAuth.socketPath} {
          uri /auth
          header_up Remote-Addr {remote_host}
          header_up Remote-Port {remote_port}
          header_up Original-URI {uri}
          copy_headers {
            Tailscale-User>X-Webauth-User
            Tailscale-Name>X-Webauth-Name
            Tailscale-Login>X-Webauth-Login
            Tailscale-Tailnet>X-Webauth-Tailnet
            Tailscale-Profile-Picture>X-Webauth-Profile-Picture
          }
        }

        reverse_proxy ${internalIP}:${internalPort}
      '';
    };
  };
}
