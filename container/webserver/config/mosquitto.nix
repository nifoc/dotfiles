{
  environment.usr."local/etc/container-webserver/mosquitto/mosquitto.conf".text = ''
    listener 1883
    password_file /mosquitto/config/users.conf
  '';
}
