{
  den.aspects.dns-resolver = {
    nixos =
      { pkgs, config, ... }:
      {
        systemd = {
          services = {
            knot-blocklist-update = {
              description = "Update Knot Blocklists";
              startAt = "*-*-* 00,12:00:00";
              restartIfChanged = true;

              path = with pkgs; [
                coreutils
                curl

                config.services.knot-resolver.managerPackage
              ];

              script = ''
                # HaGeZi
                rm -f hagezi-tif.rpz

                curl --fail -o hagezi-tif-1.rpz.tmp https://raw.githubusercontent.com/hagezi/dns-blocklists/main/rpz/tif-1.txt
                if [ "$?" -eq 0 ]; then
                  mv hagezi-tif-1.rpz.tmp hagezi-tif-1.rpz
                else
                  rm -f hagezi-tif-1.rpz.tmp
                fi

                curl --fail -o hagezi-tif-2.rpz.tmp https://raw.githubusercontent.com/hagezi/dns-blocklists/main/rpz/tif-2.txt
                if [ "$?" -eq 0 ]; then
                  mv hagezi-tif-2.rpz.tmp hagezi-tif-2.rpz
                else
                  rm -f hagezi-tif-2.rpz.tmp
                fi

                curl --fail -o hagezi-fake.rpz.tmp https://raw.githubusercontent.com/hagezi/dns-blocklists/main/rpz/fake.txt
                if [ "$?" -eq 0 ]; then
                  mv hagezi-fake.rpz.tmp hagezi-fake.rpz
                else
                  rm -f hagezi-fake.rpz.tmp
                fi

                curl --fail -o hagezi-pro.rpz.tmp https://raw.githubusercontent.com/hagezi/dns-blocklists/main/rpz/pro.txt
                if [ "$?" -eq 0 ]; then
                  mv hagezi-pro.rpz.tmp hagezi-pro.rpz
                else
                  rm -f hagezi-pro.rpz.tmp
                fi

                # URLHaus
                curl --fail -o urlhaus.rpz.tmp https://malware-filter.gitlab.io/malware-filter/urlhaus-filter-rpz.conf
                if [ "$?" -eq 0 ]; then
                  mv urlhaus.rpz.tmp urlhaus.rpz
                else
                  rm -f urlhaus.rpz.tmp
                fi

                # oisd
                curl --fail -o oisd-big.rpz.tmp https://big.oisd.nl/rpz
                if [ "$?" -eq 0 ]; then
                  mv oisd-big.rpz.tmp oisd-big.rpz
                else
                  rm -f oisd-big.rpz.tmp
                fi

                kresctl reload
              '';

              serviceConfig = {
                Type = "oneshot";
                User = "knot-resolver";
                Group = "knot-resolver";
                WorkingDirectory = "/var/lib/knot-resolver";

                DevicePolicy = "closed";
                LockPersonality = true;
                ProtectControlGroups = true;
                ProtectKernelModules = true;
                ProtectKernelTunables = true;
                PrivateDevices = true;
                PrivateTmp = true;
                RestrictNamespaces = true;
              };
            };
          };

          timers.knot-blocklist-update.timerConfig.RandomizedDelaySec = "1h";
        };
      };
  };
}
