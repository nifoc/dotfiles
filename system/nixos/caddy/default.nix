{
  imports = [
    ./argon.nix
    ./boron.nix
  ];

  services.caddy = {
    enable = true;

    globalConfig = ''
      auto_https disable_certs
    '';
  };
}
