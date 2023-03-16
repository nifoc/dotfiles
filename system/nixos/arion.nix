{ pkgs, config, secret, ... }:

{
  environment.systemPackages = [
    pkgs.arion
  ];

  virtualisation = {
    docker.enable = false;

    podman = {
      enable = true;

      defaultNetwork.settings.dns_enabled = true;

      dockerSocket.enable = true;
      dockerCompat = true;

      autoPrune = {
        enable = true;
        dates = "weekly";
      };
    };

    # containers.containersConf.cniPlugins = with pkgs; [
    #   cni-plugins
    #   dnsname-cni
    # ];

    oci-containers = {
      backend = "podman";

      containers.watchtower = {
        image = "ghcr.io/containrrr/watchtower:latest";
        environment = {
          WATCHTOWER_POLL_INTERVAL = "21600";
          WATCHTOWER_LABEL_ENABLE = "true";
          WATCHTOWER_NOTIFICATIONS = "shoutrrr";
          WATCHTOWER_NOTIFICATIONS_HOSTNAME = config.networking.hostName;
          WATCHTOWER_NOTIFICATION_URL = secret.watchtower.ntfyUrl;
        };
        volumes = [
          "/var/run/docker.sock:/var/run/docker.sock"
        ];
        extraOptions = [
          "--label=com.centurylinklabs.watchtower.enable=true"
        ];
      };
    };

    arion = {
      backend = "podman-socket";
    };
  };

  networking.firewall.interfaces."podman+" = {
    allowedUDPPorts = [ 53 443 ];
    allowedTCPPorts = [ 53 443 ];
  };
}
