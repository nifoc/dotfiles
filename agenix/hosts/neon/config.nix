{
  age.secrets = {
    user-daniel-password = {
      file = ./user/danielPassword.age;
    };

    tailscale-authkey = {
      file = ./tailscale/authkey.age;
    };

    forgejo-actions-token = {
      file = ./forgejo-actions/token.age;
    };

    mosquitto-password-weewx-proxy = {
      file = ./mosquitto/passwordWeewxProxy.age;
      owner = "mosquitto";
      group = "mosquitto";
    };
  };
}
