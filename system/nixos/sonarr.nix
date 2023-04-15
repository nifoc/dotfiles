{ pkgs, lib, ... }:

{
  services.sonarr = {
    enable = true;
    user = "media_user";
    group = "media_group";
    openFirewall = false;
  };

  systemd.services.sonarr = {
    bindsTo = [ "wg.service" ];
    after = lib.mkForce [ "wg.service" ];

    serviceConfig = {
      NetworkNamespacePath = "/var/run/netns/wg";
    };
  };

  systemd.services.socat-sonarr = {
    description = "socat exposes sonarr";
    bindsTo = [ "wg.service" ];
    requires = [ "sonarr.service" ];
    after = [ "wg.service" ];

    serviceConfig = {
      Type = "simple";
      RuntimeDirectory = "socat-sonarr";
      DynamicUser = true;
      UMask = "000";
      NetworkNamespacePath = "/var/run/netns/wg";
      ExecStart = "${pkgs.socat}/bin/socat -d -d UNIX-LISTEN:/run/socat-sonarr/sonarr.sock,unlink-early,fork TCP4:127.0.0.1:8989";
      Restart = "on-failure";
    };
  };

  services.nginx.virtualHosts."sonarr.internal.kempkens.network" = {
    quic = true;
    http3 = true;

    onlySSL = true;
    useACMEHost = "internal.kempkens.network";

    extraConfig = ''
      client_max_body_size 32m;
    '';

    locations."/" = {
      proxyPass = "http://unix:/run/socat-sonarr/sonarr.sock:/";

      extraConfig = ''
        set $fake_host localhost;

        proxy_set_header Host $fake_host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header X-Forwarded-Host $fake_host;
        proxy_set_header X-Forwarded-Server $fake_host;
      '';
    };
  };
}
