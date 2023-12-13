{ pkgs, config, lib, ... }:

{
  systemd.services.mautrix-whatsapp = {
    description = "Matrix <-> Whatsapp hybrid puppeting/relaybot bridge";
    wantedBy = [ "multi-user.target" ];
    requires = [ "matrix-synapse.service" ];
    after = [ "matrix-synapse.service" ];
    restartTriggers = [ "${config.age.secrets.mautrix-whatsapp-config.file}" ];
    serviceConfig = {
      DynamicUser = true;
      StateDirectory = "mautrix-whatsapp";
      LoadCredential = [ "config:${config.age.secrets.mautrix-whatsapp-config.path}" ];
      ExecStart = "${lib.getExe pkgs.mautrix-whatsapp} --config=%d/config --no-update";
      Restart = "on-failure";
      RestartSec = "5s";

      ProtectSystem = "strict";
      ProtectHome = true;
      ProtectKernelTunables = true;
      ProtectKernelModules = true;
      ProtectControlGroups = true;
      PrivateTmp = true;
    };
  };

  services.matrix-synapse.settings.app_service_config_files = [
    "/var/lib/matrix-synapse/bridges/registration-whatsapp.yaml"
  ];
}
