{
  services.nginx.virtualHosts."default.internal.kempkens.network" = {
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
    useACMEHost = "internal.kempkens.network";

    locations."/" = {
      return = "418";
    };
  };
}
