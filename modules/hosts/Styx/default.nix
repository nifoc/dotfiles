{ den, ... }:

{
  den.hosts.aarch64-darwin.Styx.users.dkempkens = { };

  den.aspects.Styx = {
    provides.to-users = {
      includes = with den.aspects; [
        base

        cli
        desktop._.macos
        fonts
        editors
        development
        onepassword._.macos

        work-device
      ];
    };

    darwin = {
      system.primaryUser = "dkempkens";

      users.users.dkempkens.home = "/Users/dkempkens";
    };
  };
}
