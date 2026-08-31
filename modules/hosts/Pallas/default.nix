{ den, ... }:

{
  den.hosts.aarch64-darwin.Pallas.users.daniel = { };

  den.aspects.Pallas = {
    provides.to-users = {
      includes = with den.aspects; [
        base
        remote-builder._.client

        cli
        desktop._.macos
        fonts
        editors
        development
        bitwarden._.macos

        private-device
      ];
    };

    darwin = {
      system.primaryUser = "daniel";

      users.users.daniel.home = "/Users/daniel";
    };
  };
}
