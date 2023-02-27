{ pkgs, config, ... }:

{
  users.users.atuin = {
    group = "atuin";
    isSystemUser = true;
  };

  users.groups.atuin = { };

  systemd.services.atuin-sync = {
    description = "atuin sync server";

    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" "network-online.target" ];
    wants = [ "network.target" "network-online.target" ];

    serviceConfig = {
      ExecStart = "${pkgs.atuin}/bin/atuin server start";
      EnvironmentFile = [ config.age.secrets.atuin-environment.path ];
      Restart = "on-failure";
      User = "atuin";
      Group = "atuin";
      RuntimeDirectory = "atuin";
      RuntimeDirectoryMode = "0700";
    };
  };
}
