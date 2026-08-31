{ den, inputs, ... }:

{
  flake-file.inputs = {
    quadlet-nix.url = "github:SEIAROTg/quadlet-nix";
  };

  den.aspects.netns.provides.vlan = {
    includes = with den.aspects; [
      netns
    ];

    nixos =
      {
        pkgs,
        config,
        lib,
        ...
      }:
      let
        vlanConfig = den.aspects.${config.networking.hostName}.meta.netns.vlan;
      in
      {
        imports = [
          inputs.quadlet-nix.nixosModules.quadlet
        ];

        environment.etc = builtins.listToAttrs (
          builtins.map (
            { name, ... }:
            {
              name = "netns/${name}/nsswitch.conf";
              value = {
                mode = "0644";
                text = ''
                  passwd:    files systemd
                  group:     files [success=merge] systemd
                  shadow:    files

                  hosts:     dns [!UNAVAIL=return] files
                  networks:  files

                  ethers:    files
                  services:  files
                  protocols: files
                  rpc:       files
                '';
              };
            }
          ) vlanConfig
        );

        systemd = {
          services =
            builtins.listToAttrs (
              lib.lists.flatten (
                builtins.map (
                  { name, vlan, ... }:
                  let
                    interface = "vlan${toString vlan.tag}";
                  in
                  [
                    {
                      name = "vlan-ns-${name}";
                      value = {
                        description = "${name} network interface";
                        bindsTo = [ "netns@${name}.service" ];
                        wants = [ "network-online.target" ];
                        after = [
                          "netns@${name}.service"
                          "network-online.target"
                        ];

                        path = with pkgs; [
                          iproute2
                          sysctl
                        ];

                        serviceConfig = {
                          Type = "oneshot";
                          RemainAfterExit = true;
                          ExecStart = pkgs.writers.writeBash "vlan-ns-${name}-up" (
                            ''
                              set -e
                              echo "Setting up DNS"
                              mkdir -p "/etc/netns/${name}"
                              echo -n "" >"/etc/netns/${name}/resolv.conf"
                            ''
                            + (lib.strings.concatMapStringsSep "\n" (
                              ns: "echo \"nameserver ${ns}\" >>\"/etc/netns/${name}/resolv.conf\""
                            ) vlan.nameserver)
                            + ''
                              chmod 644 "/etc/netns/${name}/resolv.conf"
                              echo "Setting lo to up ..."
                              ip -n ${name} link set lo up
                              echo "Moving VLAN interface into namespace ..."
                              ip link set ${interface} netns ${name}
                              ip netns exec ${name} sysctl net.ipv6.conf.${interface}.disable_ipv6=1
                              ip -n ${name} address add ${vlan.ip} dev ${interface}
                              ip -n ${name} link set ${interface} up
                              ip -n ${name} route add default via ${vlan.gateway} dev ${interface} onlink
                              echo "Done!"
                            ''
                          );
                          ExecStop = pkgs.writers.writeBash "vlan-ns-${name}-down" ''
                            echo "Moving VLAN interface out of namespace ..."
                            ip -n ${name} link set ${interface} down
                            ip -n ${name} route del default via ${vlan.gateway} dev ${interface} onlink
                            ip -n ${name} link set ${interface} netns 1
                            echo "Setting lo to down ..."
                            ip -n ${name} link set lo down
                            echo "Done!"
                          '';
                        };
                      };
                    }
                  ]
                ) vlanConfig
              )
            )
            // builtins.listToAttrs (
              lib.lists.flatten (
                builtins.map (
                  { name, services, ... }:
                  builtins.map (srv: {
                    name = srv;
                    value = {
                      bindsTo = [ "vlan-ns-${name}.service" ];
                      after = lib.mkAfter [ "vlan-ns-${name}.service" ];

                      serviceConfig = {
                        NetworkNamespacePath = "/var/run/netns/${name}";
                        BindReadOnlyPaths = [
                          "/etc/netns/${name}/resolv.conf:/etc/resolv.conf:norbind"
                          "/etc/netns/${name}/nsswitch.conf:/etc/nsswitch.conf:norbind"
                        ];
                      };
                    };
                  }) services
                ) vlanConfig
              )
            );

          tmpfiles.rules = builtins.map (
            { name, ... }: "d /etc/netns/${name}/nscd-kill 0755 nscd nscd"
          ) vlanConfig;
        };

        virtualisation.quadlet.containers = builtins.listToAttrs (
          lib.lists.flatten (
            builtins.map (
              { name, quadlets, ... }:
              builtins.map (srv: {
                name = srv;
                value = {
                  containerConfig = {
                    networks = [ "ns:/var/run/netns/${name}" ];
                  };

                  unitConfig = {
                    BindsTo = [ "vlan-ns-${name}.service" ];
                    After = lib.mkAfter [ "vlan-ns-${name}.service" ];
                  };
                };
              }) quadlets
            ) vlanConfig
          )
        );
      };
  };
}
