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

      root = "${anonymous-overflow-pkg}/share/anonymous-overflow/public/";
      forceSSL = false;
      enableACME = false;

      locations."/" = {
        basicAuthFile = config.age.secrets.anonymous-overflow-auth.path;
        tryFiles = "$uri @proxy";
      };

      locations."@proxy" = {
        recommendedProxySettings = true;
        proxyPass = "http://127.0.0.1:8003";
      };
    };
  };
}
