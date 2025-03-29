{ pkgs, config, ... }:

{
  users.users.cloudflared = {
    group = "cloudflared";
    isSystemUser = true;
  };

  users.groups.cloudflared = { };

  systemd.services.cloudflared-sail = {
    wantedBy = [ "multi-user.target" ];
    after = [
      "network.target"
      "network-online.target"
    ];
    wants = [
      "network.target"
      "network-online.target"
    ];
    serviceConfig = {
      ExecStart = "${pkgs.cloudflared}/bin/cloudflared tunnel --no-autoupdate run";
      EnvironmentFile = [ config.age.secrets.cloudflared-environment.path ];
      Restart = "on-failure";
      User = "cloudflared";
      Group = "cloudflared";
    };
  };
}
