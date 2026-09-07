{
  den.aspects.base = {
    nixos = {
      services.journald.settings = {
        Journal = {
          SystemMaxUse = "512M";
          MaxRetentionSec = "21day";
        };
      };
    };
  };
}
