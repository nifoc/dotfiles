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

    wireguard-config = {
      file = ./wireguard/config.age;
    };

    tubearchivist-environment-ta = {
      file = ./tubearchivist/environmentTA.age;
    };

    tubearchivist-environment-es = {
      file = ./tubearchivist/environmentES.age;
    };
  };
}
