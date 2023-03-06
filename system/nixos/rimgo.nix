{ pkgs, config, ... }:

let
  rimgo-pkg = pkgs.rimgo;
in
{
  systemd.services.rimgo = {
    description = "An alternative frontend for Imgur";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
    serviceConfig = {
      DynamicUser = true;
      StateDirectory = "rimgo";
      Environment = [
        "ADDRESS=127.0.0.1"
        "PORT=8006"
      ];
      ExecStart = "${rimgo-pkg}/bin/rimgo";
      Restart = "on-failure";
      RestartSec = "5s";
      # Hardening
      CapabilityBoundingSet = [ "" ];
      DeviceAllow = [ "" ];
      LockPersonality = true;
      MemoryDenyWriteExecute = true;
      PrivateDevices = true;
      PrivateUsers = true;
      ProcSubset = "pid";
      ProtectClock = true;
      ProtectControlGroups = true;
      ProtectHome = true;
      ProtectHostname = true;
      ProtectKernelLogs = true;
      ProtectKernelModules = true;
      ProtectKernelTunables = true;
      RestrictAddressFamilies = [ "AF_INET" "AF_INET6" ];
      RestrictNamespaces = true;
      RestrictRealtime = true;
      RestrictSUIDSGID = true;
    };
  };

  services.nginx = {
    virtualHosts."ringo.daniel.sx" = {
      http3 = true;

      forceSSL = true;
      useACMEHost = "daniel.sx";
      basicAuthFile = config.age.secrets.rimgo-auth.path;

      locations."/" = {
        recommendedProxySettings = true;
        proxyPass = "http://127.0.0.1:8006";
      };
    };
  };
}
