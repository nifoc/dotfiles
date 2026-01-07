{ config, ... }:

let
  restPort = 8081;
  webPort = 8085;
  interface = config.systemd.network.networks."20-iot".matchConfig.Name;
in
{
  virtualisation.quadlet.containers.otbr = {
    containerConfig = {
      image = "ghcr.io/ownbee/hass-otbr-docker:latest";
      environments = {
        TZ = "Europe/Berlin";
        OTBR_ENABLE = "1";
        DEVICE = "/tmp/ttyOTBR";
        NETWORK_DEVICE = "10.0.51.140:6638";
        BACKBONE_IF = interface;
        FLOW_CONTROL = "0";
        FIREWALL = "1";
        NAT64 = "0";
        BAUDRATE = "460800";
        OTBR_REST_PORT = toString restPort;
        OTBR_REST_LISTEN_PORT = toString restPort;
        OTBR_WEB_PORT = toString webPort;
        AUTOFLASH_FIRMWARE = "0";
      };
      volumes = [ "/var/lib/otbr:/var/lib/thread" ];
      networks = [ "host" ];
      addCapabilities = [
        "SYS_ADMIN"
        "NET_ADMIN"
        "IPC_LOCK"
      ];

      podmanArgs = [ "--privileged" ];
    };
  };

  systemd.tmpfiles.rules = [
    "d /var/lib/otbr 0750 root root"
  ];

  networking.firewall.interfaces."${interface}" = {
    allowedTCPPorts = [
      restPort
      webPort
    ];
  };
}
