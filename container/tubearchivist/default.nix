{ lib, config, ... }:

{
  systemd.tmpfiles.rules = [
    "d /var/lib/tubearchivist 0755 root root"
    "d /var/lib/tubearchivist/redis 0755 root root"
    "d /var/lib/tubearchivist/es 0755 1000 root"
  ];

  virtualisation.oci-containers.containers = {
    tubearchivist = {
      image = "docker.io/bbilly1/tubearchivist:latest";
      dependsOn = [ "archivist-es" "archivist-redis" ];
      ports = [ "127.0.0.1:9887:8000" ];
      environmentFiles = [ config.age.secrets.tubearchivist-environment-ta.path ];
      volumes = [
        "/mnt/media/YTDL/Downloads:/youtube"
        "/mnt/media/YTDL/Cache:/cache"
      ];
    };

    archivist-redis = {
      image = "docker.io/redis/redis-stack-server:latest";
      volumes = [
        "/var/lib/tubearchivist/redis:/data"
      ];
    };

    archivist-es = {
      image = "docker.io/bbilly1/tubearchivist-es:latest";
      ports = [ "127.0.0.1:9200:9200" ];
      environmentFiles = [ config.age.secrets.tubearchivist-environment-es.path ];
      volumes = [
        "/var/lib/tubearchivist/es:/usr/share/elasticsearch/data"
      ];
    };
  };

  systemd.services.podman-tubearchivist =
    let
      mounts = [ "mnt-media-YTDL.mount" ];
    in
    {
      requires = lib.mkAfter mounts;
      after = lib.mkAfter mounts;
    };

  services.nginx.virtualHosts."tubearchivist.internal.kempkens.network" = {
    quic = true;
    http3 = true;

    onlySSL = true;
    useACMEHost = "internal.kempkens.network";

    locations."/" = {
      recommendedProxySettings = true;
      proxyPass = "http://127.0.0.1:9887";
    };
  };
}
