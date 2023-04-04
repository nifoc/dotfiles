{ config, secret, ... }:

{
  services.atticd = {
    enable = true;

    credentialsFile = config.age.secrets.atticd-environment.path;

    settings = {
      listen = "127.0.0.1:8080";

      storage = {
        type = "s3";
        region = "eu-central-1";
        bucket = "attic-cache";
        endpoint = "https://${secret.cloudflare.account-id}.r2.cloudflarestorage.com/attic-cache";
      };

      chunking = {
        nar-size-threshold = 64 * 1024; # 64 KiB
        min-size = 16 * 1024; # 16 KiB
        avg-size = 64 * 1024; # 64 KiB
        max-size = 256 * 1024; # 256 KiB
      };

      garbage-collection = {
        interval = "12 hours";
        default-retention-period = "3 months";
      };
    };
  };
}
