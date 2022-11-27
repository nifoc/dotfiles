{ secret, ... }:

let
  connectionString = "postgres://${secret.dendrite.database.user}:${secret.dendrite.database.password}@10.99.99.3/dendrite?sslmode=disable";
in
{
  services.dendrite = {
    enable = true;

    environmentFile = "/var/lib/dendrite-secrets/environment";

    loadCredential = [
      "private_key:/var/lib/dendrite-secrets/matrix_key.pem"
    ];

    settings = {
      global = {
        server_name = "kempkens.io";
        private_key = "$CREDENTIALS_DIRECTORY/private_key";
        metrics.enabled = false;
        report_stats.enabled = false;
      };

      app_service_api = {
        database.connection_string = connectionString;
        config_files = [
          "/etc/container-matrix/telegram/registration.yaml"
        ];
      };

      federation_api.database.connection_string = connectionString;
      key_server.database.connection_string = connectionString;
      media_api.database.connection_string = connectionString;
      mscs.database.connection_string = connectionString;
      room_server.database.connection_string = connectionString;
      sync_api.database.connection_string = connectionString;
      user_api.account_database.connection_string = connectionString;
      user_api.device_database.connection_string = connectionString;

      client_api = {
        registration_shared_secret = "$REGISTRATION_SHARED_SECRET";
        registration_disabled = true;
      };

      mscs.mscs = [
        # threading
        "msc2946"
        # spaces
        "msc2836"
      ];
    };
  };

  networking.firewall.allowedTCPPorts = [ 8008 ];
}
