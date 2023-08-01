{ pkgs, config, ... }:

{
  services.signald.enable = true;
  systemd.services.signald.serviceConfig.EnvironmentFile = [
    config.age.secrets.signald-environment.path
  ];

  systemd.services.mautrix-signal = {
    description = "A Matrix-Signal puppeting bridge";
    wantedBy = [ "multi-user.target" ];
    requires = [ "matrix-synapse.service" "signald.service" ];
    after = [ "matrix-synapse.service" "signald.service" ];
    restartTriggers = [ "${config.age.secrets.mautrix-signal-config.file}" ];
    serviceConfig = {
      User = config.services.signald.user;
      Group = config.services.signald.group;
      LoadCredential = [ "config:${config.age.secrets.mautrix-signal-config.path}" ];
      ExecStart = "${pkgs.mautrix-signal}/bin/mautrix-signal --config=%d/config --no-update";
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
