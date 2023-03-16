let
  secret = import ../../secret/container/matrix;
  custom-config = import ./config.nix;
in
{
  virtualisation.arion.projects.matrix.settings = {
    services = {
      signald = {
        service = {
          image = "registry.gitlab.com/signald/signald:latest";
          container_name = "signald";
          restart = "unless-stopped";
          volumes = [
            "/etc/container-matrix/signald:/signald"
          ];
          environment = {
            SIGNALD_DATABASE = secret.container.matrix.signald.environment.database;
          };
          labels = {
            "com.centurylinklabs.watchtower.enable" = "true";
          };
        };
      };

      matrix-signal = {
        service = {
          image = "dock.mau.dev/mautrix/signal:latest";
          container_name = "mautrix-signal";
          restart = "unless-stopped";
          depends_on = [ "signald" ];
          ports = [ "29328:29328" ];
          volumes = [
            "/etc/container-matrix/signal:/data"
            "/etc/container-matrix/signald:/signald"
          ];
          labels = {
            "com.centurylinklabs.watchtower.enable" = "true";
          };
        };
      };

      matrix-whatsapp = {
        service = {
          image = "dock.mau.dev/mautrix/whatsapp:latest";
          container_name = "mautrix-whatsapp";
          restart = "unless-stopped";
          ports = [ "29318:29318" ];
          volumes = [
            "/etc/container-matrix/whatsapp:/data"
          ];
          labels = {
            "com.centurylinklabs.watchtower.enable" = "true";
          };
        };
      };
    };
  };
} // custom-config
