{ den, ... }:

{
  den.aspects.remote-access = {
    nixos =
      { config, ... }:
      let
        cfg = den.aspects.${config.networking.hostName}.meta;

        networkConfig = cfg.networking.default;
        networkd = config.systemd.network.networks;
        networkdKey = if (builtins.hasAttr "10-wan" networkd) then "10-wan" else "10-lan";

        inherit (den.aspects.${cfg.primaryUser}.meta) sshKeys;
        authorizedKeys = builtins.map (
          keyName: "command=\"systemd-tty-ask-password-agent\" ${sshKeys.${keyName}}"
        ) cfg.ssh.authorizedKeys;
      in
      {
        boot.initrd = {
          systemd = {
            network = {
              networks = {
                ${networkdKey} = networkd.${networkdKey} // {
                  matchConfig.Name = networkConfig.altName;
                };
              };
            };
          };

          network = {
            enable = true;

            ssh = {
              enable = true;
              port = 2222;

              # mkdir -p /etc/secrets/initrd
              # chmod 700 -R /etc/secrets/
              # ssh-keygen -t ed25519 -N "" -f /etc/secrets/initrd/ssh_host_ed25519_key
              hostKeys = [ "/etc/secrets/initrd/ssh_host_ed25519_key" ];
              inherit authorizedKeys;
            };
          };
        };
      };
  };
}
