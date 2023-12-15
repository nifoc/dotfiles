{ pkgs, config, ... }:

{
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_16_jit;
    enableJIT = true;

    enableTCPIP = true;

    settings = {
      full_page_writes = "off";
      wal_init_zero = "off";
      wal_recycle = "off";

      track_activities = "on";
      track_counts = "on";
      autovacuum = "on";
    };

    authentication = ''
      host all all 100.64.10.3/32 md5
      host all all 10.88.0.0/16 md5
    '';
  };

  networking.firewall.interfaces."tailscale0".allowedTCPPorts = [ 5432 ];

  # See: https://nixos.org/manual/nixos/unstable/#module-services-postgres-upgrading
  environment.systemPackages = [
    (
      let
        newPostgres = pkgs.postgresql_16_jit;
      in
      pkgs.writeScriptBin "upgrade-pg-cluster" ''
        set -eux
        # XXX it's perhaps advisable to stop all services that depend on postgresql
        systemctl stop postgresql

        export NEWDATA="/var/lib/postgresql/${newPostgres.psqlSchema}"

        export NEWBIN="${newPostgres}/bin"

        export OLDDATA="${config.services.postgresql.dataDir}"
        export OLDBIN="${config.services.postgresql.package}/bin"

        install -d -m 0700 -o postgres -g postgres "$NEWDATA"
        cd "$NEWDATA"
        sudo -u postgres $NEWBIN/initdb -D "$NEWDATA"

        sudo -u postgres $NEWBIN/pg_upgrade \
          --old-datadir "$OLDDATA" --new-datadir "$NEWDATA" \
          --old-bindir $OLDBIN --new-bindir $NEWBIN \
          "$@"
      ''
    )
  ];
}
