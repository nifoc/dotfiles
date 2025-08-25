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
        host = "smtp.protonmail.ch";
        port = 587;
        tls_starttls = true;
        user = "server@kempkens.email";
        passwordeval = "${pkgs.coreutils}/bin/cat ${config.age.secrets.msmtp-password.path}";

        set_from_header = true;
        from = "server@kempkens.email";
      };
    };
  };
}
