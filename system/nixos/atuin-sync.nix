{ pkgs, config, ... }:

{
  systemd.services.atuin-sync = {
    description = "atuin sync server";

    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" "network-online.target" ];
    wants = [ "network.target" "network-online.target" ];

    serviceConfig = {
      ExecStart = "${pkgs.atuin}/bin/atuin server start";
      EnvironmentFile = [ config.age.secrets.atuin-environment.path ];
      Restart = "on-failure";
      DynamicUser = true;
      RuntimeDirectory = "atuin";
      RuntimeDirectoryMode = "0700";
    };
  };

  services.nginx.virtualHosts."atuin-sync.kempkens.io" = {
    listenAddresses = [ "100.113.242.85" "[fd7a:115c:a1e0:ab12:4843:cd96:6271:f255]" ];
    http3 = true;

    onlySSL = true;
    useACMEHost = "kempkens.io";

    locations."/" = {
      recommendedProxySettings = true;
      proxyPass = "http://127.0.0.1:8015";
    };
  };
}
