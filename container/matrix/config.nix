{
  systemd.tmpfiles.rules = [
    "d /etc/container-matrix/telegram 0775 1337 1337"
    "d /etc/container-matrix/signald 0775 0 0"
    "d /etc/container-matrix/signal 0775 1337 1337"
    "d /etc/container-matrix/whatsapp 0775 1337 1337"
  ];

  # Matrix: Telegram

  environment.etc."container-matrix/telegram/config.yaml" = {
    source = ../../secret/container/matrix/config/telegram.yaml;
    mode = "0640";
    uid = 1337;
    gid = 1337;
  };

  # Matrix: Signal

  environment.etc."container-matrix/signal/config.yaml" = {
    source = ../../secret/container/matrix/config/signal.yaml;
    mode = "0640";
    uid = 1337;
    gid = 1337;
  };

  # Matrix: WhatsApp

  environment.etc."container-matrix/whatsapp/config.yaml" = {
    source = ../../secret/container/matrix/config/whatsapp.yaml;
    mode = "0640";
    uid = 1337;
    gid = 1337;
  };
}
