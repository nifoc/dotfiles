{ pkgs, config, ... }:

{
  environment.systemPackages = [ pkgs.tailscale ];

  services.tailscale = {
    enable = true;
    authKeyFile = config.age.secrets.tailscale-authkey.path;

    extraUpFlags = [
      "--stateful-filtering"
    ];
  };
}
