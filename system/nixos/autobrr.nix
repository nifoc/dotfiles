{ lib, ... }:

{
  systemd.tmpfiles.rules = [
    "d /var/lib/autobrr 0755 root root"
    "d /var/lib/omegabrr 0755 root root"
  ];

  virtualisation.oci-containers.containers = {
    autobrr = {
      image = "ghcr.io/autobrr/autobrr:latest";
      ports = [ "192.168.42.2:7474:7474" ];
      environment = {
        "TZ" = "Europe/Berlin";
      };
      volumes = [
        "/var/lib/autobrr:/config"
      ];
      extraOptions = [
        "--network=ns:/var/run/netns/wg"
        "--label=com.centurylinklabs.watchtower.enable=true"
        "--label=io.containers.autoupdate=registry"
      ];
    };

    omegabrr = {
      image = "ghcr.io/autobrr/omegabrr:latest";
      ports = [ "192.168.42.2:7441:7441" ];
      volumes = [
        "/var/lib/omegabrr:/config"
      ];
      extraOptions = [
        "--network=ns:/var/run/netns/wg"
        "--label=com.centurylinklabs.watchtower.enable=true"
        "--label=io.containers.autoupdate=registry"
      ];
    };
  };

  systemd.services.podman-autobrr =
    let
      depends = [ "podman-sonarr.service" "podman-radarr.service" ];
    in
    {
      requires = lib.mkAfter depends;
      bindsTo = [ "wg.service" ];
      after = lib.mkForce ([ "wg.service" ] ++ depends);

      serviceConfig = {
        TimeoutStopSec = lib.mkForce 10;
      };
    };

  systemd.services.podman-omegabrr =
    let
      depends = [ "podman-autobrr.service" ];
    in
    {
      requires = lib.mkAfter depends;
      bindsTo = [ "wg.service" ];
      after = lib.mkForce ([ "wg.service" ] ++ depends);

      serviceConfig = {
        TimeoutStopSec = lib.mkForce 10;
      };
    };

  services.nginx.virtualHosts."autobrr.internal.kempkens.network" = {
    quic = true;
    http3 = true;

    onlySSL = true;
    useACMEHost = "internal.kempkens.network";

    locations."/" = {
      recommendedProxySettings = true;
      proxyPass = "http://192.168.42.2:7474";
    };
  };
}
