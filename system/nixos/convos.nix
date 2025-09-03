{ lib, ... }:

let
  fqdn = "convos.internal.kempkens.network";
  internalIP = "192.168.42.10";
  internalPort = "3000";
  netns = "ch";
in
{
  virtualisation.oci-containers.containers.convos = {
    image = "ghcr.io/convos-chat/convos:stable";
    ports = [ "${internalIP}:${internalPort}:3000" ];
    environment = {
      "TZ" = "Etc/UTC";
      "CONVOS_REVERSE_PROXY" = "1";
    };
    volumes = [
      "/var/lib/convos:/data"
    ];
    networks = [ "ns:/var/run/netns/${netns}" ];
    labels = {
      "com.centurylinklabs.watchtower.enable" = "true";
      "io.containers.autoupdate" = "registry";
    };
  };

  systemd = {
    services.podman-convos = {
      bindsTo = [ "wg-${netns}.service" ];
      after = lib.mkAfter [ "wg-${netns}.service" ];
    };

    tmpfiles.rules = [
      "d /var/lib/convos 0755 root root"
    ];
  };

  services.caddy = {
    virtualHosts."${fqdn}" = {
      extraConfig = ''
        encode

        header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

        import tailscale-auth

        reverse_proxy ${internalIP}:${internalPort} {
          header_up X-Request-Base "https://${fqdn}"
        }
      '';
    };
  };
}
