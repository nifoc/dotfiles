{
  services.fail2ban = {
    enable = true;

    jails = {
      vaultwarden = {
        settings = {
          enabled = true;
          port = "80,443";
          filter = "vaultwarden[journalmatch='_SYSTEMD_UNIT=vaultwarden.service']";
        };
      };
    };
  };

  environment.etc = {
    "fail2ban/filter.d/vaultwarden.local".text = ''
      [INCLUDES]
      before = common.conf

      [Definition]
      failregex = ^.*?Username or password is incorrect\. Try again\. IP: <ADDR>\. Username:.*$
      ignoreregex =
    '';
  };

}
