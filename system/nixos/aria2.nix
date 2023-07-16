{ pkgs, config, ... }:

let
  ariaDir = "/mnt/downloads/Aria2";
  settingsDir = "${ariaDir}/conf";
  sessionFile = "${settingsDir}/aria2.session";
in
{
  # The nix-provided options force a aria2-user to a certain degree
  systemd.services.aria2 =
    let
      mounts = [ "mnt-downloads.mount" ];
    in
    {
      description = "aria2 Service";
      requires = mounts;
      bindsTo = [ "wg.service" ];
      after = [ "wg.service" ] ++ mounts;
      wantedBy = [ "multi-user.target" ];

      preStart = ''
        if [[ ! -e "${sessionFile}" ]]
        then
          touch "${sessionFile}"
        fi
        cp -f "${config.age.secrets.aria2-config.path}" "${settingsDir}/aria2.conf"
      '';

      serviceConfig = {
        Restart = "on-abort";
        ExecStart = "${pkgs.aria2}/bin/aria2c --enable-rpc --conf-path=${settingsDir}/aria2.conf --save-session=${sessionFile}";
        ExecReload = "${pkgs.coreutils}/bin/kill -HUP $MAINPID";
        User = "media_user";
        Group = "media_group";
        NetworkNamespacePath = "/var/run/netns/wg";
        BindReadOnlyPaths = [
          "/etc/netns/wg/resolv.conf:/etc/resolv.conf:norbind"
          "/etc/netns/wg/nsswitch.conf:/etc/nsswitch.conf:norbind"
        ];
      };
    };

  services.nginx.virtualHosts."aria.internal.kempkens.network" = {
    quic = true;
    http3 = true;
    kTLS = true;

    root = "${pkgs.ariang}/share/ariang";
    onlySSL = true;
    useACMEHost = "internal.kempkens.network";

    locations."/jsonrpc" = {
      recommendedProxySettings = true;
      proxyPass = "http://192.168.42.2:6801";
      proxyWebsockets = true;
    };
  };
}
