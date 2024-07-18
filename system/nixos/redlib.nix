{ pkgs, lib, secret, ... }:

{
  systemd.services.redlib =
    let
      args = lib.concatStringsSep " " ([
        "--port 8002"
        "--address 127.0.0.1"
      ]);
    in
    {
      description = "Private front-end for Reddit";
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];
      serviceConfig = {
        DynamicUser = true;
        ExecStart = "${pkgs.redlib}/bin/redlib ${args}";
        Restart = "on-failure";
        RestartSec = "2s";
        # Hardening
        CapabilityBoundingSet = [ "" ];
        DeviceAllow = [ "" ];
        LockPersonality = true;
        MemoryDenyWriteExecute = true;
        PrivateDevices = true;
        # A private user cannot have process capabilities on the host's user
        # namespace and thus CAP_NET_BIND_SERVICE has no effect.
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

  services.nginx.virtualHosts."${secret.nginx.hostnames.libreddit}" = {
    listenAddresses = [ "100.122.253.109" "[fd7a:115c:a1e0::3a01:fd6d]" ];

    quic = true;
    http3 = true;

    onlySSL = true;
    useACMEHost = "daniel.sx";

    locations."/" = {
      recommendedProxySettings = true;
      proxyPass = "http://127.0.0.1:8002";
    };
  };
}
