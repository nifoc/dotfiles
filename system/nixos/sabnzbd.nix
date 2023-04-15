{ pkgs, lib, ... }:

{
  services.sabnzbd = {
    enable = true;
    user = "media_user";
    group = "media_group";
  };

  systemd.services.sabnzbd = {
    bindsTo = [ "wg.service" ];
    after = lib.mkForce [ "wg.service" ];

    serviceConfig = {
      NetworkNamespacePath = "/var/run/netns/wg";
    };
  };

  systemd.services.socat-sabnzbd = {
    description = "socat exposes sabnzbd";
    bindsTo = [ "wg.service" ];
    requires = [ "sabnzbd.service" ];
    after = [ "wg.service" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      Type = "simple";
      RuntimeDirectory = "socat-sabnzbd";
      DynamicUser = true;
      UMask = "000";
      NetworkNamespacePath = "/var/run/netns/wg";
      ExecStart = "${pkgs.socat}/bin/socat -d -d UNIX-LISTEN:/run/socat-sabnzbd/sabnzbd.sock,unlink-early,fork TCP4:127.0.0.1:8080";
      Restart = "on-failure";
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
      proxyPass = "http://unix:/run/socat-sabnzbd/sabnzbd.sock:/";
    };
  };
}
