{ config, ... }:

let
  inherit (config.virtualisation.quadlet) containers;

  fqdn = "tubearchivist.internal.kempkens.network";
  internalIP = "127.0.0.1";
  internalPort = "9887";
  requiredPaths = [
    "/dozer/MediaVault/YTDL"
  ];
in
{
  virtualisation.quadlet.containers = {
    tubearchivist = {
      autoStart = false;

      containerConfig = {
        image = "docker.io/bbilly1/tubearchivist:latest";
        publishPorts = [ "${internalIP}:${internalPort}:8000" ];
        environmentFiles = [ config.age.secrets.tubearchivist-environment-ta.path ];
        volumes = [
          "/dozer/MediaVault/YTDL/Downloads:/youtube"
          "/var/lib/tubearchivist/cache:/cache"
          "/dozer/MediaVault/YTDL/Cache/backup:/cache/backup"
          "/dozer/MediaVault/YTDL/Cache/import:/cache/import"
        ];
        labels = {
          "com.centurylinklabs.watchtower.enable" = "true";
          "io.containers.autoupdate" = "registry";
        };
      };

      unitConfig = {
        Requires = [
          containers.tubearchivist-redis.ref
          containers.tubearchivist-es.ref
        ];
        After = [
          containers.tubearchivist-redis.ref
          containers.tubearchivist-es.ref
        ];

        ConditionDirectoryNotEmpty = requiredPaths;
      };
    };

    tubearchivist-redis.containerConfig = {
      image = "docker.io/valkey/valkey:8";
      user = "2001:2001";
      volumes = [ "/var/lib/tubearchivist/redis:/data" ];
      labels = {
        "com.centurylinklabs.watchtower.enable" = "true";
        "io.containers.autoupdate" = "registry";
      };
    };

    tubearchivist-es.containerConfig = {
      image = "docker.io/bbilly1/tubearchivist-es:latest";
      publishPorts = [ "127.0.0.1:9200:9200" ];
      environmentFiles = [ config.age.secrets.tubearchivist-environment-es.path ];
      volumes = [ "/var/lib/tubearchivist/es:/usr/share/elasticsearch/data" ];
      labels = {
        "com.centurylinklabs.watchtower.enable" = "true";
        "io.containers.autoupdate" = "registry";
      };
    };
  };

  systemd = {
    paths.tubearchivist = {
      wantedBy = [ "multi-user.target" ];

      pathConfig = {
        PathModified = "/root/zfs-dozer-mount-common";
      };
    };

    tmpfiles.rules = [
      "d /var/lib/tubearchivist 0755 root root"
      "d /var/lib/tubearchivist/cache 0755 media_user user_media"
      "d /var/lib/tubearchivist/redis 0755 media_user user_media"
      "d /var/lib/tubearchivist/es 0755 1000 root"
    ];
  };

  services.caddy = {
    virtualHosts."${fqdn}" = {
      extraConfig =
        let
          media-browser = containers.media_browser.containerConfig.environments.PHX_HOST;

          override-cors = ''
            >Access-Control-Allow-Methods GET
            >Access-Control-Allow-Headers *
          '';
        in
        ''
          encode

          @origin_media header Origin "https://${media-browser}"
          @origin_localhost header Origin "http://localhost:4000"

          header >Strict-Transport-Security "max-age=31536000; includeSubDomains"

          header @origin_media {
            >Access-Control-Allow-Origin "https://${media-browser}"
            ${override-cors}
          }

          header @origin_localhost {
            >Access-Control-Allow-Origin "http://localhost:4000"
            ${override-cors}
          }

          import tailscale-auth

          reverse_proxy ${internalIP}:${internalPort} {
            flush_interval -1
          }
        '';
    };
  };
}
