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

    tailscale-authkey = {
      file = ./tailscale/authkey.age;
    };

    controld-config = {
      file = ./controld/config.age;
      path = "/var/lib/controld/ctrld.toml";
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
