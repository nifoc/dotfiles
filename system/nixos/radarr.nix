{ pkgs, lib, ... }:

{
  services.radarr = {
    enable = true;
    user = "media_user";
    group = "media_group";
    openFirewall = false;
  };

  systemd.services.radarr = {
    bindsTo = [ "wg.service" ];
    after = lib.mkForce [ "wg.service" ];

    serviceConfig = {
      NetworkNamespacePath = "/var/run/netns/wg";
    };
  };

  systemd.services.socat-radarr = {
    description = "socat exposes radarr";
    bindsTo = [ "wg.service" ];
    requires = [ "radarr.service" ];
    after = [ "wg.service" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      Type = "simple";
      RuntimeDirectory = "socat-radarr";
      DynamicUser = true;
      UMask = "000";
      NetworkNamespacePath = "/var/run/netns/wg";
      ExecStart = "${pkgs.socat}/bin/socat -d -d UNIX-LISTEN:/run/socat-radarr/radarr.sock,unlink-early,fork TCP4:127.0.0.1:7878";
      Restart = "on-failure";
    };
  };

  services.nginx.virtualHosts."radarr.internal.kempkens.network" = {
    quic = true;
    http3 = true;

    onlySSL = true;
    useACMEHost = "internal.kempkens.network";

    extraConfig = ''
      client_max_body_size 32m;
    '';

    locations."/" = {
      recommendedProxySettings = true;
      proxyPass = "http://unix:/run/socat-radarr/radarr.sock:/";
    };
  };
}
