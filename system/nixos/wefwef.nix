{
  virtualisation.oci-containers.containers.wefwef = {
    image = "ghcr.io/aeharding/wefwef:latest";
    ports = [ "127.0.0.1:8014:5314" ];
    extraOptions = [
      "--label=com.centurylinklabs.watchtower.enable=true"
      "--label=io.containers.autoupdate=registry"
    ];
  };

  services.nginx.virtualHosts."wefwef.daniel.sx" = {
    listenAddresses = [ "100.108.165.26" "[fd7a:115c:a1e0:ab12:4843:cd96:626c:a51a]" ];
    quic = true;
    http3 = true;

    onlySSL = true;
    useACMEHost = "daniel.sx";

    locations."/" = {
      recommendedProxySettings = true;
      proxyPass = "http://127.0.0.1:8014";
    };
  };
}
