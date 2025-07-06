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
      auto_https disable_certs
    '';
  };
}
