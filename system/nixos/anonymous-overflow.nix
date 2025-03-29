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
      WorkingDirectory = "${anonymous-overflow-pkg}/share/anonymous-overflow";
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
      RestrictAddressFamilies = [
        "AF_INET"
        "AF_INET6"
      ];
      RestrictNamespaces = true;
      RestrictRealtime = true;
      RestrictSUIDSGID = true;
    };
  };

  services.nginx.virtualHosts."overflow.daniel.sx" = {
    listenAddresses = [
      "100.122.253.109"
      "[fd7a:115c:a1e0::3a01:fd6d]"
    ];
    quic = true;
    http3 = true;

    root = "${anonymous-overflow-pkg}/share/anonymous-overflow/public/";
    onlySSL = true;
    useACMEHost = "daniel.sx";

    locations."/" = {
      tryFiles = "$uri @proxy";
    };

    locations."/static".extraConfig = ''
      rewrite ^/static(/.*)$ $1 last;
    '';

    locations."@proxy" = {
      recommendedProxySettings = true;
      proxyPass = "http://127.0.0.1:8003";
    };
  };
}
