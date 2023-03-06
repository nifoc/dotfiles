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
      nginxUDPPorts = [ 443 ];
    in
    {
      "enp1s0".allowedTCPPorts = nginxTCPPorts;
      "enp1s0".allowedUDPPorts = nginxUDPPorts;
      "tailscale0".allowedTCPPorts = nginxTCPPorts;
      "tailscale0".allowedUDPPorts = nginxUDPPorts;
    };
}
