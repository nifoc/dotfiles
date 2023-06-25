{ config, ... }:

let
  data-dir = "/var/lib/linkding";
in
{
  virtualisation.oci-containers.containers.linkding = {
    image = "docker.io/sissbruecker/linkding:latest";
    ports = [ "127.0.0.1:8011:9090" ];
    environmentFiles = [ config.age.secrets.linkding-environment.path ];
    volumes = [
      "${data-dir}:/etc/linkding/data"
    ];
    extraOptions = [
      "--label=com.centurylinklabs.watchtower.enable=true"
      "--label=io.containers.autoupdate=registry"
    ];
  };

  systemd.services.podman-linkding.restartTriggers = [
    "${config.age.secrets.linkding-environment.file}"
  ];

  systemd.tmpfiles.rules = [
    "d ${data-dir} 0755 root root"
  ];

  services.nginx.virtualHosts."links.kempkens.io" = {
    quic = true;
    http3 = true;

    onlySSL = true;
    useACMEHost = "kempkens.io";

    locations."/" = {
      recommendedProxySettings = true;
      proxyPass = "http://127.0.0.1:8011";
    };
  };
}
