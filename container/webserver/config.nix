{ secret, ... }:

{
  systemd.tmpfiles.rules = [
    "d /etc/container-webserver/weewx 0755 421 421"
    "d /etc/container-webserver/weewx/html 0755 421 421"
  ];

  # mosquitto

  environment.etc."container-webserver/mosquitto/mosquitto.conf" = {
    text = ''
      listener 1883
      password_file /mosquitto/config/users.conf
    '';

    mode = "0644";
  };

  environment.etc."container-webserver/mosquitto/users.conf" = {
    text = secret.container.webserver.mosquitto.users;
    mode = "0644";
  };

  # weewx

  environment.etc."container-webserver/weewx/weewx.conf" = {
    source = ../../secret/container/webserver/config/weewx.conf;
    mode = "0644";
    uid = 421;
    gid = 421;
  };
}
