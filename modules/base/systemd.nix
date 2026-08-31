{
  den.aspects.base = {
    nixos = {
      systemd = {
        enableEmergencyMode = true;

        settings.Manager = {
          RuntimeWatchdogSec = "2min";
          RebootWatchdogSec = "10min";
        };

        sleep.settings.Sleep = {
          AllowSuspend = "no";
          AllowHibernation = "no";
        };
      };
    };
  };
}
