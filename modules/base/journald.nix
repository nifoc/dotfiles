{
  den.aspects.base = {
    nixos = {
      services.journald.extraConfig = ''
        SystemMaxUse=512M
        MaxRetentionSec=21day
      '';
    };
  };
}
