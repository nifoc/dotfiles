{ pkgs, config, lib, ... }:

{
  # Re-use old signald user and group
  users.users.signald = {
    group = "signald";
    isSystemUser = true;
  };

  users.groups.signald = { };

  systemd.services.mautrix-signal = {
    description = "A Matrix-Signal puppeting bridge";
    wantedBy = [ "multi-user.target" ];
    requires = [ "matrix-synapse.service" ];
    after = [ "matrix-synapse.service" ];
    restartTriggers = [ "${config.age.secrets.mautrix-signal-config.file}" ];
    serviceConfig = {
      User = "signald";
      Group = "signald";
      LoadCredential = [ "config:${config.age.secrets.mautrix-signal-config.path}" ];
      ExecStart = "${lib.getExe pkgs.mautrix-signal} --config=%d/config --no-update";
      Restart = "on-failure";
      RestartSec = "5s";

      StateDirectory = "mautrix-signal";
      RuntimeDirectory = "mautrix-signal";
      StateDirectoryMode = "0750";
      RuntimeDirectoryMode = "0750";

      ProtectHome = true;
      ProtectKernelTunables = true;
      ProtectKernelModules = true;
      ProtectControlGroups = true;
      PrivateTmp = true;
    };
  };

  services.matrix-synapse.settings.app_service_config_files = [
    "/var/lib/matrix-synapse/bridges/registration-signal.yaml"
  ];
}
