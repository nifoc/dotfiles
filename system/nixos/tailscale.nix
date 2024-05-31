{ pkgs, config, ... }:

let
  headscale = "https://ctrl.headscale.kempkens.network";
in
{
  environment.systemPackages = [ pkgs.tailscale ];

  services.tailscale = {
    enable = true;
    authKeyFile = config.age.secrets.tailscale-authkey.path;

    extraUpFlags = [
      "--login-server=${headscale}"
      "--stateful-filtering"
    ];
  };
}
