{ pkgs, secret, ... }:

{
  users.users.cloudflared = {
    group = "cloudflared";
    isSystemUser = true;
  };

  users.groups.cloudflared = { };

  systemd.services.cloudflared-sail = {
    wantedBy = [ "multi-user.target" ];
    after = [ "network-online.target" "systemd-resolved.service" ];
    serviceConfig = {
      ExecStart = "${pkgs.cloudflared}/bin/cloudflared tunnel --no-autoupdate run --token=${secret.cloudflared.token}";
      Restart = "always";
      User = "cloudflared";
      Group = "cloudflared";
    };
  };
}
