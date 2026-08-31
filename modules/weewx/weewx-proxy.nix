{ den, inputs, ... }:

{
  flake-file.inputs = {
    agenix.url = "github:ryantm/agenix";
    nifoc-overlay.url = "https://git.kempkens.io/daniel/nix-overlay/archive/master.tar.gz";
  };

  den.aspects.weewx = {
    nixos =
      { config, inputs', ... }:
      let
        networkConfig = den.aspects.${config.networking.hostName}.meta.networking;
      in
      {
        imports = [ inputs.agenix.nixosModules.default ];

        age.secrets = {
          weewx-proxy-environment = {
            file = ../../agenix/weewx/proxy/environment.age;
          };
        };

        systemd.services.weewx-proxy = {
          description = "A proxy service for WeeWX sources";
          wantedBy = [ "multi-user.target" ];
          wants = [ "network-online.target" ];
          after = [ "network-online.target" ];

          restartTriggers = [ "${config.age.secrets.weewx-proxy-environment.file}" ];

          serviceConfig = {
            DynamicUser = true;
            StateDirectory = "weewx-proxy";
            EnvironmentFile = [ config.age.secrets.weewx-proxy-environment.path ];
            ExecStart = "${inputs'.nifoc-overlay.packages.weewx-proxy}/bin/weewx_proxy start";
            Type = "notify";
            WatchdogSec = "10s";
            Restart = "on-failure";
          };
        };

        networking.firewall.interfaces."${networkConfig.iot.name}".allowedTCPPorts = [ 4040 ];
      };
  };
}
