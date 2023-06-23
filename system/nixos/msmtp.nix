{ config, ... }:

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
        user = "postmaster@mg.kempkens.io";
        passwordeval = "cat ${config.age.secrets.msmtp-password.path}";

        set_from_header = true;
        from = "tanker@mg.kempkens.io";
      };
    };
  };
}
