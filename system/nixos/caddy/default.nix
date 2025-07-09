{
  imports = [
    ./argon.nix
    ./boron.nix
    ./carbon.nix
    ./krypton.nix
  ];

  services.caddy = {
    enable = true;

    globalConfig = ''
      admin

      auto_https disable_certs
    '';
  };
}
