{
  age.secrets = {
    user-daniel-password = {
      file = ./user/danielPassword.age;
    };

    acme-credentials = {
      file = ./acme/credentials.age;
      owner = "acme";
      group = "acme";
    };

    cfdyndns-api-token = {
      file = ./cfdyndns/apiToken.age;
    };

    tailscale-authkey = {
      file = ./tailscale/authkey.age;
    };

    adguardhome-sync-environment = {
      file = ./adguardhome-sync/environment.age;
    };

    forgejo-actions-token = {
      file = ./forgejo-actions/token.age;
    };

    weewx-proxy-environment = {
      file = ./weewx-proxy/environment.age;
    };
  };
}
