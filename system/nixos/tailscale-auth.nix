{
  services = {
    tailscaleAuth = {
      enable = true;
    };

    nginx.tailscaleAuth = {
      enable = true;
    };
  };
}
