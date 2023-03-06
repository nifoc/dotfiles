{ pkgs, ... }:

{
  services.nginx = {
    enable = true;
    package = pkgs.nginxQuic;

    recommendedOptimisation = true;
    recommendedGzipSettings = true;
    recommendedBrotliSettings = true;
    recommendedTlsSettings = true;
  };

  networking.firewall.interfaces =
    let
      nginxTCPPorts = [ 80 443 ];
    in
    {
      "enp1s0".allowedTCPPorts = nginxTCPPorts;
      "tailscale0".allowedTCPPorts = nginxTCPPorts;
    };
}
