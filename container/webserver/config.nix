{ secret, ... }:

{
  systemd.tmpfiles.rules = [
    "d /etc/container-webserver/weewx 0755 421 421"
    "d /etc/container-webserver/weewx/html 0755 421 421"

    "d /etc/container-webserver/nitter 0755 0 0"
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

  # nitter
  environment.etc."container-webserver/nitter/nitter.conf" = {
    source = ../../secret/container/webserver/config/nitter.conf;
    mode = "0644";
    uid = 0;
    gid = 0;
  };
}
