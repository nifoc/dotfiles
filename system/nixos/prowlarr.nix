{ config, ... }:

let
  inherit (config.virtualisation.quadlet) containers;

  fqdn = "prowlarr.internal.kempkens.network";
  internalIP = "192.168.42.2";
  internalPort = "9696";
  netns = "dl";
in
{
  virtualisation.quadlet.containers.prowlarr = {
    containerConfig = {
      image = "lscr.io/linuxserver/prowlarr:latest";
      environments = {
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

    unitConfig = {
      BindsTo = [ "wg-${netns}.service" ];
      Requires = [ containers.flaresolverr.ref ];
      After = [
        containers.flaresolverr.ref
        "wg-${netns}.service"
      ];
    };
  };

  systemd.tmpfiles.rules = [
    "d /var/lib/prowlarr 0755 media_user user_media"
  ];

  services.caddy = {
    virtualHosts."${fqdn}" = {
      extraConfig = ''
        encode

        request_body {
          max_size 32MB
        }

        header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

        import tailscale-auth

        reverse_proxy ${internalIP}:${internalPort}
      '';
    };
  };
}
