{
  age.secrets = {
    user-daniel-password = {
      file = ./user/danielPassword.age;
    };

    tailscale-authkey = {
      file = ./tailscale/authkey.age;
    };

    atticd-environment = {
      file = ./atticd/environment.age;
    };
  };
}
