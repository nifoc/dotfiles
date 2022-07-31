{ secret, ... }:

{
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
}
