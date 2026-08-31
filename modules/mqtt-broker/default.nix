{
  den.aspects.mqtt-broker = {
    nixos = {
      services.mosquitto = {
        enable = true;
        persistence = true;
      };
    };
  };
}
