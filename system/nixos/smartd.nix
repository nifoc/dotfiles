{
  services.smartd = {
    enable = true;

    autodetect = true;

    defaults.monitored = "-a -o on -s (S/../.././02|L/../../6/03)";

    notifications = {
      mail = {
        enable = true;
        sender = "smartd@mg.kempkens.io";
        recipient = "daniel+tanker@kempkens.io";
      };

      wall.enable = true;
      x11.enable = false;

      test = false;
    };
  };
}
