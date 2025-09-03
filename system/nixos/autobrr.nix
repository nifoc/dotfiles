{ lib, ... }:

let
  fqdn = "autobrr.internal.kempkens.network";
  internalIP = "192.168.42.10";
  internalPortAuto = "7474";
  internalPortOmega = "7441";
  internalGW = "192.168.42.9";
  netns = "ch";
in
{
  virtualisation.oci-containers.containers = {
    autobrr = {
      image = "ghcr.io/autobrr/autobrr:latest";
      ports = [ "${internalIP}:${internalPortAuto}:7474" ];
      environment = {
        "TZ" = "Europe/Berlin";
      };
      volumes = [
        "/var/lib/autobrr:/config"
      ];
      networks = [ "ns:/var/run/netns/${netns}" ];
      labels = {
        "com.centurylinklabs.watchtower.enable" = "true";
        "io.containers.autoupdate" = "registry";
      };
      extraOptions = [
        "--add-host=sonarr.internal.kempkens.network:${internalGW}"
        "--add-host=radarr.internal.kempkens.network:${internalGW}"
      ];
    };

    omegabrr = {
      image = "ghcr.io/autobrr/omegabrr:latest";
      ports = [ "${internalIP}:${internalPortOmega}:7441" ];
      volumes = [
        "/var/lib/omegabrr:/config"
      ];
      networks = [ "ns:/var/run/netns/${netns}" ];
      labels = {
        "com.centurylinklabs.watchtower.enable" = "true";
        "io.containers.autoupdate" = "registry";
      };
      extraOptions = [
        "--add-host=sonarr.internal.kempkens.network:${internalGW}"
        "--add-host=radarr.internal.kempkens.network:${internalGW}"
      ];
    };
  };

  systemd = {
    services = {
      podman-autobrr = {
        bindsTo = [ "wg-${netns}.service" ];
        after = lib.mkAfter [ "wg-${netns}.service" ];
      };

      podman-omegabrr = {
        bindsTo = [ "wg-${netns}.service" ];
        after = lib.mkAfter [ "wg-${netns}.service" ];
      };
    };

    tmpfiles.rules = [
      "d /var/lib/autobrr 0755 root root"
      "d /var/lib/omegabrr 0755 root root"
    ];
  };

  services.caddy = {
    virtualHosts."${fqdn}" = {
      extraConfig = ''
        encode

        header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

        import tailscale-auth

        reverse_proxy ${internalIP}:${internalPortAuto}
      '';
    };
  };
}
