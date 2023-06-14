{
  age.secrets = {
    user-daniel-password = {
      file = ./user/danielPassword.age;
    };

    mosquitto-password-weewx-proxy = {
      file = ./mosquitto/passwordWeewxProxy.age;
      owner = "mosquitto";
      group = "mosquitto";
    };
  };
}
