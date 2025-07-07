{ pkgs, config, ... }:

{
  programs.msmtp = {
    enable = true;
    setSendmail = true;

    defaults = {
      tls = true;
    };

    accounts = {
      default = {
        auth = true;
        host = "smtp.fastmail.com";
        port = 465;
        tls_starttls = false;
        user = "daniel@kempkens.email";
        passwordeval = "${pkgs.coreutils}/bin/cat ${config.age.secrets.msmtp-password.path}";

        set_from_header = true;
        from = "server+${config.networking.hostName}@kempkens.io";
      };
    };
  };
}
