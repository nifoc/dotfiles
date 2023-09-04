{
  services.nginx.virtualHosts."default.kempkens.io" = {
    listen = [
      {
        addr = "0.0.0.0";
        port = 443;
        ssl = true;
        extraParameters = [
          "fastopen=63"
          "backlog=1023"
          "deferred"
        ];
      }

      {
        addr = "[::0]";
        port = 443;
        ssl = true;
        extraParameters = [
          "fastopen=63"
          "backlog=1023"
          "deferred"
        ];
      }
    ];

    default = true;
    quic = false;

    onlySSL = true;
    useACMEHost = "kempkens.io";

    locations."/" = {
      return = "418";
    };
  };
}
