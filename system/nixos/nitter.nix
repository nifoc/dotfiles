{ pkgs, config, secret, ... }:

let
  nitter-pkg = pkgs.nitter-unstable;
in
{
  # Based on: https://github.com/NixOS/nixpkgs/blob/nixos-unstable/nixos/modules/services/misc/nitter.nix

  systemd.services.nitter = {
    description = "Nitter (An alternative Twitter front-end)";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" "network-online.target" ];
    serviceConfig = {
      DynamicUser = true;
      StateDirectory = "nitter";
      LoadCredential = [ "config:${config.age.secrets.nitter-config.path}" ];
      Environment = [ "NITTER_CONF_FILE=%d/config" ];
      # Some parts of Nitter expect `public` folder in working directory,
      # see https://github.com/zedeus/nitter/issues/414
      WorkingDirectory = "${nitter-pkg}/share/nitter";
      ExecStart = "${nitter-pkg}/bin/nitter";
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

  services.nginx.virtualHosts."${secret.nginx.hostnames.nitter}" = {
    listenAddresses = [ "100.113.242.85" ];
    http3 = true;

    root = "${nitter-pkg}/share/nitter/public/";
    onlySSL = true;
    useACMEHost = "daniel.sx";

    locations."/" = {
      tryFiles = "$uri @proxy";
    };

    locations."@proxy" = {
      recommendedProxySettings = true;
      proxyPass = "http://127.0.0.1:8001";
    };
  };
}
