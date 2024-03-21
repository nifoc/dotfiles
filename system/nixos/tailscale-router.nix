{
  imports = [
    ./tailscale.nix
  ];

  services.tailscale = {
    useRoutingFeatures = "server";

    extraUpFlags = [
      "--advertise-routes"
      "10.0.0.0/24"
    ];
  };
}
