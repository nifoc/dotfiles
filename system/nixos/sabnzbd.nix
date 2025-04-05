{ lib, ... }:

{
  systemd.tmpfiles.rules = [
    "d /var/lib/sabnzbd 0750 media_user media_group"
  ];

  virtualisation.oci-containers.containers.sabnzbd = {
    image = "lscr.io/linuxserver/sabnzbd:latest";
    ports = [ "192.168.42.2:8080:8080" ];
    environment = {
      "PUID" = "1001";
      "PGID" = "2001";
      "TZ" = "Etc/UTC";
    };
    volumes = [
      "/var/lib/sabnzbd:/config"
      "/mnt/downloads:/mnt/downloads"
    ];
    extraOptions = [
      "--network=ns:/var/run/netns/wg"
      "--label=com.centurylinklabs.watchtower.enable=true"
      "--label=io.containers.autoupdate=registry"
    ];
  };

  systemd.services.podman-sabnzbd =
    let
      mounts = [
        "mnt-downloads.mount"
      ];
    in
    {
      requires = lib.mkAfter mounts;
      bindsTo = [ "wg.service" ];
      after = lib.mkForce ([ "wg.service" ] ++ mounts);
    };

  services.nginx =
    let
      fqdn = "sabnzbd.internal.kempkens.network";
    in
    {
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
          proxyPass = "http://192.168.42.2:8080";
        };
      };
    };
}
