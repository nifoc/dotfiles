{ inputs, ... }:

{
  flake-file.inputs = {
    agenix.url = "github:ryantm/agenix";
  };

  den.aspects.tailscale = {
    nixos =
      { pkgs, config, ... }:
      {
        imports = [ inputs.agenix.nixosModules.default ];

        age.secrets = {
          tailscale-authkey = {
            file = ../../agenix/tailscale/authkey.age;
          };
        };

        environment.systemPackages = [ pkgs.tailscale ];

        services.tailscale = {
          enable = true;
          authKeyFile = config.age.secrets.tailscale-authkey.path;

          disableUpstreamLogging = true;

          extraUpFlags = [
            "--stateful-filtering"
            "--accept-dns=false"
          ];
        };

        systemd.services.tailscale-wait-up = {
          after = [
            "tailscaled.service"
            "tailscaled-autoconnect.service"
          ];
          wants = [ "tailscaled.service" ];
          wantedBy = [ "multi-user.target" ];

          path = with pkgs; [
            coreutils
            tailscale
          ];

          script = ''
            until tailscale status --peers=false; do
              sleep 1
            done
          '';

          serviceConfig = {
            Type = "oneshot";
            TimeoutSec = 120;
          };
        };
      };
  };
}
