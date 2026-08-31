{
  den.aspects.database-server = {
    nixos =
      { pkgs, config, ... }:
      {
        # See: https://nixos.org/manual/nixos/unstable/#module-services-postgres-upgrading
        environment.systemPackages = [
          (
            let
              newPostgres = pkgs.postgresql_18_jit;
              # newPostgres = pkgs.postgresql_18_jit.withPackages (
              #   ps: with ps; [
              #     pgroonga
              #     pgvector
              #     vectorchord
              #   ]
              # );
              # pg_upgrade: --new-options "-c shared_preload_libraries='vchord.so'" \
            in
            pkgs.writeScriptBin "upgrade-pg-cluster" ''
              set -eux
              # XXX it's perhaps advisable to stop all services that depend on postgresql
              systemctl stop postgresql

              export NEWDATA="/var/lib/postgresql/${newPostgres.psqlSchema}"

              export NEWBIN="${newPostgres}/bin"

              export OLDDATA="${config.services.postgresql.dataDir}"
              export OLDBIN="${config.services.postgresql.finalPackage}/bin"

              install -d -m 0700 -o postgres -g postgres "$NEWDATA"
              cd "$NEWDATA"
              sudo -u postgres $NEWBIN/initdb --no-data-checksums -D "$NEWDATA"

              sudo -u postgres $NEWBIN/pg_upgrade \
                --old-datadir "$OLDDATA" --new-datadir "$NEWDATA" \
                --old-bindir $OLDBIN --new-bindir $NEWBIN \
                "$@"
            ''
          )
        ];
      };
  };
}
