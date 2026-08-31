{ den, ... }:

{
  den.aspects.smb-server = {
    nixos =
      { config, ... }:
      let
        cfg = den.aspects.${config.networking.hostName}.meta;
        smbConfig = cfg.smb;
        networkConfig = cfg.networking;

        inherit (cfg) primaryUser;
        primaryGroup = (cfg.primaryGroup or primaryUser);
      in
      {
        services = {
          samba = {
            enable = true;
            openFirewall = false;

            settings = {
              global = {
                security = "user";
                workgroup = "WORKGROUP";
                "server string" = "${config.networking.hostName}";
                "hosts allow" = "10.0.0.0/255.255.255.0";
                interfaces = "eth*";
                "dns proxy" = false;
                "log level" = 1;
                "logging" = "systemd";

                "server min protocol" = "SMB3_02";
                "client min protocol" = "SMB3_02";
                "server smb encrypt" = "required";
                "client smb encrypt" = "desired";
                "server signing" = "mandatory";
                "client signing" = "mandatory";

                "socket options" = "TCP_NODELAY IPTOS_LOWDELAY";
                "use sendfile" = true;

                "vfs objects" = "catia fruit streams_xattr";
                "fruit:aapl" = "yes";
                "fruit:metadata" = "stream";
                "fruit:model" = "MacSamba";
                "fruit:encoding" = "native";
                "fruit:veto_appledouble" = "no";
                "fruit:nfs_aces" = "no";
                "fruit:wipe_intentionally_left_blank_rfork" = "yes";
                "fruit:delete_empty_adfiles" = "yes";
                "fruit:copyfile" = "yes";
                "fruit:posix_rename" = "yes";
              };
            }
            // builtins.mapAttrs (name: share: {
              inherit (share) path;
              comment = "${name} Export";
              "force user" = primaryUser;
              "force group" = (share.group or primaryGroup);
              "guest ok" = "no";
              "create mask" = "0644";
              "directory mask" = "0755";
              writable = "yes";
              browseable = "yes";
              printable = "no";
              "valid users" = primaryUser;
            }) smbConfig.shares;
          };

          samba-wsdd = {
            enable = true;
            openFirewall = false;
          };

          avahi = {
            enable = true;
            openFirewall = false;
            allowInterfaces = [ networkConfig.default.name ];

            publish = {
              enable = true;
              userServices = true;
            };

            nssmdns4 = true;
          };
        };

        networking.firewall.interfaces."${networkConfig.default.name}" = {
          allowedUDPPorts = [
            # Samba
            137
            138
            # WSDD
            3702
            # Avahi
            5353
          ];
          allowedTCPPorts = [
            # Samba
            139
            445
            # WSDD
            5357
          ];
        };
      };
  };
}
