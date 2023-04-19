{ pkgs, ... }:

{
  # The nix-provided options force a sabnzbd-user to a certain degree
  systemd.services.sabnzbd = {
    description = "sabnzbd server";
    bindsTo = [ "wg.service" ];
    after = [ "wg.service" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      Type = "forking";
      GuessMainPID = "no";
      User = "media_user";
      Group = "media_group";
      NetworkNamespacePath = "/var/run/netns/wg";
      BindReadOnlyPaths = [
        "/etc/netns/wg/resolv.conf:/etc/resolv.conf:norbind"
        "/etc/netns/wg/nsswitch.conf:/etc/nsswitch.conf:norbind"
      ];
      ExecStart = "${pkgs.sabnzbd}/bin/sabnzbd -d -f /var/lib/sabnzbd/sabnzbd.ini";
    };
  };

  services.nginx.virtualHosts."sabnzbd.internal.kempkens.network" = {
    quic = true;
    http3 = true;

    onlySSL = true;
    useACMEHost = "internal.kempkens.network";

    extraConfig = ''
      client_max_body_size 32m;
    '';

    locations."/" = {
      recommendedProxySettings = true;
      proxyPass = "http://192.168.42.2:8080";
    };
  };
}
