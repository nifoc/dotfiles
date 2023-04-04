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

    atticd-environment = {
      file = ./atticd/environment.age;
    };
  };
}
