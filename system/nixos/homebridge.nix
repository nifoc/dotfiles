{
  systemd.tmpfiles.rules = [
    "d /var/lib/homebridge 0755 root root"
  ];

  virtualisation.oci-containers.containers.homebridge = {
    image = "oznu/homebridge:2023-01-08";
    environment = {
      "TZ" = "Europe/Berlin";
      "HOMEBRIDGE_CONFIG_UI" = "1";
      "HOMEBRIDGE_CONFIG_UI_PORT" = "8581";
    };
    volumes = [
      "/var/lib/homebridge:/homebridge"
    ];
    extraOptions = [
      "--network=host"
    ];
  };

  networking.firewall.interfaces."end0" = {
    allowedTCPPorts = [
      5353
      8581
      51789
    ];
    allowedUDPPorts = [ 5353 ];

    allowedTCPPortRanges = [
      {
        from = 52100;
        to = 52150;
      }
    ];
  };
}
