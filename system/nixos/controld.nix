{ pkgs, config, lib, podmanDNS, ... }:

{
  systemd = {
    services.controld = {
      description = "Control D DNS/53 to DoH Proxy";
      startLimitIntervalSec = 5;
      startLimitBurst = 10;
      serviceConfig = {
        ExecStart = "${pkgs.controld}/bin/ctrld run -vvvv";
        WorkingDirectory = "/var/lib/controld";
        RestartSec = 120;
        LimitMEMLOCK = "infinity";
      };
      after = [ "network.target" ];
      before = [ "nss-lookup.target" ];
      wants = [ "nss-lookup.target" ];
      wantedBy = [ "multi-user.target" ];
      restartTriggers = [ "${config.age.secrets.controld-config.file}" ];
    };

    tmpfiles.rules = [
      "d /var/lib/controld 0750 root root"
    ];
  };

  networking.firewall.interfaces =
    let
      interfaces = lib.mapAttrsToList (_: lib.attrsets.attrByPath [ "matchConfig" "Name" ] null) config.systemd.network.networks ++ [ "tailscale0" ];
    in
    builtins.listToAttrs
      (builtins.map
        (iface:
          {
            name = iface;
            value = {
              allowedTCPPorts = [ 53 5353 ];
              allowedUDPPorts = [ 53 5353 ];
            };
          })
        (builtins.filter builtins.isString interfaces));

  virtualisation.podman.defaultNetwork.settings.dns_enabled = lib.mkForce podmanDNS;
}
