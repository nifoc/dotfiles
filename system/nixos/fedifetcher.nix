{
  pkgs,
  config,
  lib,
  ...
}:

{
  systemd.services.fedifetcher = {
    description = "FediFetcher";
    requires = [ "gotosocial.service" ];
    startAt = "*:0/25";

    serviceConfig = {
      Type = "oneshot";
      DynamicUser = true;
      StateDirectory = "fedifetcher";
      LoadCredential = "config.json:${config.age.secrets.fedifetcher-config.path}";
      ExecStart = "${lib.getExe pkgs.fedifetcher} --config=%d/config.json";
    };
  };
}
