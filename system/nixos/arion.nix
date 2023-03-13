{ pkgs, config, secret, ... }:

{
  environment.systemPackages = [
    pkgs.arion
  ];

  virtualisation = {
    docker = {
      enable = true;
      autoPrune = {
        enable = true;
        flags = [ "--all" ];
      };
    };

    oci-containers = {
      backend = "docker";

      containers.watchtower = {
        image = "containrrr/watchtower";
        environment = {
          WATCHTOWER_POLL_INTERVAL = "28800";
          WATCHTOWER_LABEL_ENABLE = "true";
          WATCHTOWER_NOTIFICATIONS = "shoutrrr";
          WATCHTOWER_NOTIFICATIONS_HOSTNAME = config.networking.hostName;
          WATCHTOWER_NOTIFICATION_URL = secret.watchtower.ntfyUrl;
        };
        volumes = [
          "/var/run/docker.sock:/var/run/docker.sock"
          "/root/.docker/config.json:/config.json:ro"
        ];
      };
    };

    arion = {
      backend = "docker";
    };
  };
}
