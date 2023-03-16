{ pkgs, config, secret, ... }:

{
  environment.systemPackages = [
    pkgs.arion
    pkgs.docker-client
  ];

  virtualisation = {
    docker.enable = false;
    # docker = {
    #   enable = true;
    #   autoPrune = {
    #     enable = true;
    #     flags = [ "--all" ];
    #   };
    # };

    podman = {
      enable = true;
      dockerSocket.enable = true;
      defaultNetwork.settings.dns_enabled = true;
    };

    oci-containers = {
      backend = "docker";

      # containers.watchtower = {
      #   image = "containrrr/watchtower";
      #   environment = {
      #     WATCHTOWER_POLL_INTERVAL = "21600";
      #     WATCHTOWER_LABEL_ENABLE = "true";
      #     WATCHTOWER_NOTIFICATIONS = "shoutrrr";
      #     WATCHTOWER_NOTIFICATIONS_HOSTNAME = config.networking.hostName;
      #     WATCHTOWER_NOTIFICATION_URL = secret.watchtower.ntfyUrl;
      #   };
      #   volumes = [
      #     "/var/run/docker.sock:/var/run/docker.sock"
      #     "/root/.docker/config.json:/config.json:ro"
      #   ];
      #   extraOptions = [
      #     "--label=com.centurylinklabs.watchtower.enable=true"
      #   ];
      # };
    };

    arion = {
      backend = "podman-socket";
    };
  };

  # networking.firewall.interfaces."docker0".allowedTCPPorts = [ 443 ];
}
