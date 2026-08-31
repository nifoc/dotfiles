{ inputs, ... }:

{
  flake-file.inputs = {
    agenix.url = "github:ryantm/agenix";
    quadlet-nix.url = "github:SEIAROTg/quadlet-nix";
  };

  den.aspects.frigate = {
    nixos =
      { config, ... }:
      {
        imports = [
          inputs.agenix.nixosModules.default
          inputs.quadlet-nix.nixosModules.quadlet
        ];

        age.secrets = {
          frigate-reolink-environment = {
            file = ../../agenix/frigate/reolink-environment.age;
          };
        };

        virtualisation.quadlet.containers.reolinkproxy = {
          containerConfig = {
            image = "ghcr.io/shareed2k/reolinkproxy:v0.2.5";
            environments = {
              REOLINK_SERVER_RTSP_ADDRESS = "127.0.0.1:10554";
              REOLINK_SERVER_RTP_ADDRESS = "127.0.0.1:10000";
              REOLINK_SERVER_RTCP_ADDRESS = "127.0.0.1:10001";
              REOLINK_SERVER_ONVIF_ADDRESS = "127.0.0.1:10002";

              REOLINK_CAMERA_0_NAME = "doorbell";
              REOLINK_CAMERA_0_HOST = "10.0.50.62";
              REOLINK_CAMERA_0_USERNAME = "admin";
              REOLINK_CAMERA_0_STREAM = "main,sub";
              REOLINK_CAMERA_0_RTSP_PATH = "doorbell/stream";
              REOLINK_CAMERA_0_TALK_PROFILE = "sub";
              REOLINK_CAMERA_0_CHANNEL = "0";
              REOLINK_CAMERA_0_PAUSE_ON_CLIENT = "true";
            };
            environmentFiles = [ config.age.secrets.frigate-reolink-environment.path ];
            networks = [ "host" ];

            healthCmd = "/usr/local/bin/reolinkproxy healthcheck";
            healthInterval = "30s";
            healthTimeout = "5s";
            healthStartPeriod = "30s";
            healthRetries = 3;
          };
        };
      };
  };
}
