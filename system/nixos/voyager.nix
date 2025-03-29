{
  virtualisation.oci-containers.containers.voyager = {
    image = "ghcr.io/aeharding/voyager:latest";
    ports = [ "127.0.0.1:8014:5314" ];
    extraOptions = [
      "--label=com.centurylinklabs.watchtower.enable=true"
      "--label=io.containers.autoupdate=registry"
    ];
  };

  services.nginx.virtualHosts."voyager.daniel.sx" = {
    listenAddresses = [
      "100.122.253.109"
      "[fd7a:115c:a1e0::3a01:fd6d]"
    ];
    quic = true;
    http3 = true;

    onlySSL = true;
    useACMEHost = "daniel.sx";

    extraConfig = ''
      client_max_body_size 32m;
    '';

    locations."/" = {
      recommendedProxySettings = true;
      proxyPass = "http://127.0.0.1:8014";
    };
  };
}
