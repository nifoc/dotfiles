{
  age.secrets = {
    user-daniel-password = {
      file = ./user/danielPassword.age;
    };

    tailscale-authkey = {
      file = ./tailscale/authkey.age;
    };

    controld-config = {
      file = ./controld/config.age;
      path = "/var/lib/controld/ctrld.toml";
    };

    forgejo-actions-token = {
      file = ./forgejo-actions/token.age;
    };

    mosquitto-password-weewx-proxy = {
      file = ./mosquitto/passwordWeewxProxy.age;
      owner = "mosquitto";
      group = "mosquitto";
    };

    mosquitto-password-home-assistant = {
      file = ./mosquitto/passwordHomeAssistant.age;
      owner = "mosquitto";
      group = "mosquitto";
    };

    deye-mqtt-config = {
      file = ./deye-mqtt/config.age;
    };
  };
}
