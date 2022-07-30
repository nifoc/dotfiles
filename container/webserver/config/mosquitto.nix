let
  secret = import ../../../secret/container/webserver.nix;
in
{
  environment.etc."container-webserver/mosquitto/mosquitto.conf" = {
    text = ''
      listener 1883
      password_file /mosquitto/config/users.conf
    '';

    mode = "0644";
    uid = 1883;
    gid = 1883;
  };

  environment.etc."container-webserver/mosquitto/users.conf" = {
    text = secret.container.webserver.mosquitto.users;
    mode = "0644";
    uid = 1883;
    gid = 1883;
  };
}
