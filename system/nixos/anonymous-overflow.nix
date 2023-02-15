{ pkgs, config, ... }:

let
  anonymous-overflow-pkg = pkgs.anonymous-overflow;
in
{
  systemd.services.anonymous-overflow = {
    description = "View StackOverflow in privacy and without the clutter";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
    serviceConfig = {
      DynamicUser = true;
      StateDirectory = "anonymous-overflow";
      EnvironmentFile = [ config.age.secrets.anonymous-overflow-config.path ];
      # Some parts of Nitter expect `public` folder in working directory,
      # see https://github.com/zedeus/nitter/issues/414
      ExecStart = "${anonymous-overflow-pkg}/bin/anonymousoverflow";
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
      ProtectProc = "invisible";
      RestrictAddressFamilies = [ "AF_INET" "AF_INET6" ];
      RestrictNamespaces = true;
      RestrictRealtime = true;
      RestrictSUIDSGID = true;
      SystemCallArchitectures = "native";
      SystemCallFilter = [ "@system-service" "~@privileged" "~@resources" ];
      UMask = "0077";
    };
  };

  services.nginx = {
    enable = true;
    virtualHosts."anonymous-overflow.only.internal" = {
      listen = [
        {
          addr = "127.0.0.1";
          port = 80;
        }
      ];

      forceSSL = false;
      enableACME = false;

      locations."/" = {
        basicAuthFile = config.age.secrets.anonymous-overflow-auth.path;
        recommendedProxySettings = true;
        proxyPass = "http://127.0.0.1:8003";
      };
    };
  };
}
