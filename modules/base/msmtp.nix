{ inputs, ... }:

{
  flake-file.inputs = {
    agenix.url = "github:ryantm/agenix";
  };

  den.aspects.base = {
    nixos =
      { pkgs, config, ... }:
      {
        imports = [ inputs.agenix.nixosModules.default ];

        age.secrets = {
          msmtp-password = {
            file = ../../agenix/base/msmtp/password.age;
            mode = "444";
          };
        };

        programs.msmtp = {
          enable = true;
          setSendmail = true;

          defaults = {
            tls = true;
          };

          accounts = {
            default = {
              auth = true;
              host = "smtp.protonmail.ch";
              port = 587;
              tls_starttls = true;
              user = "server@kempkens.email";
              passwordeval = "${pkgs.coreutils}/bin/cat ${config.age.secrets.msmtp-password.path}";

              set_from_header = true;
              from = "server@kempkens.email";
            };
          };
        };
      };
  };
}
