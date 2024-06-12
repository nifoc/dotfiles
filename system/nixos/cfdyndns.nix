{ config, secret, ... }:

{
  services.cfdyndns = {
    enable = true;
    inherit (secret.cfdyndns) email records;
    apiTokenFile = config.age.secrets.cfdyndns-api-token.path;
  };
}
