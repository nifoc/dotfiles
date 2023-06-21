{ pkgs, ... }:

{
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_15;

    enableTCPIP = true;

    settings = {
      full_page_writes = "off";
      wal_init_zero = "off";
      wal_recycle = "off";
    };

    ensureDatabases = [
      "attic"
    ];

    ensureUsers = [
      {
        name = "attic";
        ensurePermissions = {
          "DATABASE attic" = "ALL PRIVILEGES";
        };
      }
    ];

    authentication = ''
      host all all 100.113.242.85/32 md5
      host all all 10.88.0.0/16 md5
    '';
  };

  networking.firewall.interfaces."tailscale0".allowedTCPPorts = [ 5432 ];
}
