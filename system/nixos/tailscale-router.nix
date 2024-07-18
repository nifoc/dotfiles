{
  imports = [
    ./tailscale.nix
  ];

  services.tailscale = {
    useRoutingFeatures = "server";

    extraUpFlags = [
      "--advertise-routes=10.0.0.0/24,10.0.50.0/24,10.0.51.0/24"
    ];
  };
}
