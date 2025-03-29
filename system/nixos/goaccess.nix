{
  pkgs,
  lib,
  config,
  ...
}:

let
  inherit (pkgs) goaccess;

  fqdn = "goaccess-${config.networking.hostName}.kempkens.network";
  port = "7890";
  workingDir = "/var/lib/goaccess";

  tailscale-hosts = import ../shared/tailscale-hosts.nix;
  tailscale = tailscale-hosts.host."${config.networking.hostName}";
in
{
  environment.systemPackages = [ goaccess ];

  systemd.services.goaccess = {
    description = "GoAccess server monitoring";

    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig =
      let
        runGoAccess = pkgs.writeShellScript "run-caddy-goaccess" ''
          logs=""
          # shellcheck disable=SC2044
          for file in $(${lib.getExe pkgs.findutils} "/var/log/nginx" -type f -name "access*.log"); do
            logs+=" $file"
          done

          exec ${lib.getExe goaccess} $logs \
            --log-format=VCOMBINED \
            --jobs=2 \
            --real-time-html \
            --all-static-files \
            --html-refresh=30 \
            --agent-list \
            --with-output-resolver \
            --no-query-string \
            --ws-url=wss://${fqdn}:443/ws \
            --addr=127.0.0.1 \
            --port=${port} \
            -o "${workingDir}/index.html"
        '';
      in
      {
        User = "nginx";
        Group = "nginx";

        ExecStart = runGoAccess.outPath;
        ExecReload = "${lib.getExe' pkgs.coreutils "kill"} -HUP $MAINPID";
        Type = "simple";
        Restart = "on-failure";
        RestartSec = "10s";

        # Hardening
        NoNewPrivileges = true;
        PrivateDevices = "yes";
        PrivateTmp = true;
        ProtectHome = "read-only";
        ProtectKernelModules = "yes";
        ProtectKernelTunables = "yes";
        ProtectSystem = "strict";
        ReadOnlyPaths = [ "/var/log/nginx" ];
        ReadWritePaths = [
          "/proc/self"
          workingDir
        ];
        StateDirectory = "goaccess";
        SystemCallFilter = "~@clock @cpu-emulation @debug @keyring @memlock @module @mount @obsolete @privileged @reboot @resources @setuid @swap @raw-io";
        WorkingDirectory = workingDir;
      };
  };

  services.nginx.virtualHosts."${fqdn}" = {
    listen = [
      {
        addr = tailscale.ipv4;
        port = 443;
        ssl = true;
      }

      {
        addr = "[${tailscale.ipv6}]";
        port = 443;
        ssl = true;
      }
    ];

    quic = true;
    http3 = true;
    kTLS = true;

    root = workingDir;
    forceSSL = true;
    useACMEHost = "kempkens.network";

    locations."/ws" = {
      recommendedProxySettings = true;
      proxyPass = "http://127.0.0.1:${port}";
      proxyWebsockets = true;
    };
  };
}
