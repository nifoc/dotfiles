{ pkgs, config, lib, ... }:

{
  systemd.services.fedifetcher = {
    description = "FediFetcher";
    wants = [ "mastodon-web.service" "mastodon-wait-for-available.service" ];
    after = [ "mastodon-web.service" "mastodon-wait-for-available.service" ];
    # wantedBy = [ "multi-user.target" ];
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
