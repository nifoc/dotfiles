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
        host = "smtp.mailgun.org";
        port = 465;
        tls_starttls = false;
        user = "carbon@mg.kempkens.io";
        passwordeval = "${pkgs.coreutils}/bin/cat ${config.age.secrets.msmtp-password.path}";

        set_from_header = true;
        from = "carbon@mg.kempkens.io";
      };
    };
  };
}
