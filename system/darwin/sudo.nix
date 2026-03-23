{
  security = {
    pam.services.sudo_local = {
      touchIdAuth = true;
      watchIdAuth = true;
    };

    sudo.extraConfig = ''
      Defaults pwfeedback
    '';
  };
}
