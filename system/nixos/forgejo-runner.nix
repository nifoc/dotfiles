{ pkgs, config, secret, name, tag, nixTag, ... }:

# Based on: https://git.clan.lol/clan/clan-infra/src/branch/main/modules/web01/gitea/actions-runner.nix

let
  forgejoUrl = "https://git.kempkens.io";

  storeDepsBins = [
    pkgs.attic-client
    pkgs.coreutils
    pkgs.findutils
    pkgs.gnugrep
    pkgs.gawk
    pkgs.git
    pkgs.nixVersions.stable
    pkgs.nix-update
    pkgs.bash
    pkgs.jq
    pkgs.nodejs
  ];

  storeDeps = pkgs.runCommand "store-deps" { } ''
    mkdir -p $out/bin
    for dir in ${toString storeDepsBins}; do
      for bin in "$dir"/bin/*; do
        ln -s "$bin" "$out/bin/$(basename "$bin")"
      done
    done

    # Add SSL CA certs
    mkdir -p $out/etc/ssl/certs
    cp -a "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt" $out/etc/ssl/certs/ca-bundle.crt
  '';
in
{
  systemd.services = {
    forgejo-runner-nix-image = {
      wantedBy = [ "multi-user.target" ];
      after = [ "podman.service" ];
      requires = [ "podman.service" ];
      path = [ config.virtualisation.podman.package pkgs.gnutar pkgs.shadow pkgs.getent ];
      script = ''
        set -eux -o pipefail
        mkdir -p etc/nix

        touch etc/passwd etc/group
        groupid=$(cut -d: -f3 < <(getent group nix-ci-user))
        userid=$(cut -d: -f3 < <(getent passwd nix-ci-user))
        groupadd --prefix $(pwd) --gid "$groupid" nix-ci-user
        emptypassword='$6$1ero.LwbisiU.h3D$GGmnmECbPotJoPQ5eoSTD6tTjKnSWZcjHoVTkxFLZP17W9hRi/XkmCiAMOfWruUwy8gMjINrBMNODc7cYEo4K.'
        useradd --prefix $(pwd) -p "$emptypassword" -m -d /tmp -u "$userid" -g "$groupid" -G nix-ci-user nix-ci-user

        cat <<NIX_CONFIG > etc/nix/nix.conf
        accept-flake-config = true
        experimental-features = nix-command flakes
        substituters = https://attic.cache.daniel.sx/nifoc-ci?priority=1 https://nix-community.cachix.org?priority=2 https://cache.nixos.org/
        trusted-public-keys = nifoc-ci:JpD9zqVQi8JuS7B8htPDOQZh08rhInMnGFS9RVhiuwk= nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs= cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=
        NIX_CONFIG

        cat <<NIX_NETRC > etc/nix/netrc
        ${secret.forgejo_runner.netrc}
        NIX_NETRC

        cat <<NSSWITCH > etc/nsswitch.conf
        passwd:    files mymachines systemd
        group:     files mymachines systemd
        shadow:    files

        hosts:     files mymachines dns myhostname
        networks:  files

        ethers:    files
        services:  files
        protocols: files
        rpc:       files
        NSSWITCH

        tar -cv . | tar -tvf -
        tar -cv . | podman import --change "LABEL io.kempkens.keepImage=true" - forgejo-runner-nix
      '';
      serviceConfig = {
        RuntimeDirectory = "forgejo-runner-nix-image";
        WorkingDirectory = "/run/forgejo-runner-nix-image";
        Type = "oneshot";
        RemainAfterExit = true;
      };
    };

    gitea-runner-nix = {
      after = [ "forgejo-runner-nix-image.service" ];
      requires = [ "forgejo-runner-nix-image.service" ];

      serviceConfig = {
        # Hardening (may overlap with DynamicUser=)
        # The following options are only for optimizing output of systemd-analyze
        AmbientCapabilities = "";
        CapabilityBoundingSet = "";
        # ProtectClock= adds DeviceAllow=char-rtc r
        DeviceAllow = "";
        NoNewPrivileges = true;
        PrivateDevices = true;
        PrivateMounts = true;
        PrivateTmp = true;
        PrivateUsers = true;
        ProtectClock = true;
        ProtectControlGroups = true;
        ProtectHome = true;
        ProtectHostname = true;
        ProtectKernelLogs = true;
        ProtectKernelModules = true;
        ProtectKernelTunables = true;
        ProtectSystem = "strict";
        RemoveIPC = true;
        RestrictNamespaces = true;
        RestrictRealtime = true;
        RestrictSUIDSGID = true;
        UMask = "0066";
        ProtectProc = "invisible";
        SystemCallFilter = [
          "~@clock"
          "~@cpu-emulation"
          "~@module"
          "~@mount"
          "~@obsolete"
          "~@raw-io"
          "~@reboot"
          "~@swap"
          # needed by go?
          #"~@resources"
          "~@privileged"
          "~capset"
          "~setdomainname"
          "~sethostname"
        ];
        RestrictAddressFamilies = [ "AF_INET" "AF_INET6" "AF_UNIX" "AF_NETLINK" ];

        # Needs network access
        PrivateNetwork = false;
        # Cannot be true due to Node
        MemoryDenyWriteExecute = false;

        # The more restrictive "pid" option makes `nix` commands in CI emit
        # "GC Warning: Couldn't read /proc/stat"
        # You may want to set this to "pid" if not using `nix` commands
        ProcSubset = "all";
        # Coverage programs for compiled code such as `cargo-tarpaulin` disable
        # ASLR (address space layout randomization) which requires the
        # `personality` syscall
        # You may want to set this to `true` if not using coverage tooling on
        # compiled code
        LockPersonality = false;

        # Note that this has some interactions with the User setting; so you may
        # want to consult the systemd docs if using both.
        DynamicUser = true;
      };
    };
  };

  users.users.nix-ci-user = {
    group = "nix-ci-user";
    description = "Used for running nix-based CI jobs";
    home = "/var/empty";
    isSystemUser = true;
  };
  users.groups.nix-ci-user = { };

  services.gitea-actions-runner = {
    package = pkgs.forgejo-actions-runner;

    instances = {
      act = {
        enable = true;
        url = forgejoUrl;

        inherit name;
        tokenFile = config.age.secrets.forgejo-actions-token.path;

        labels = [
          "${tag}:docker://ghcr.io/catthehacker/ubuntu:act-latest"
        ];
      };

      nix = {
        enable = true;
        url = forgejoUrl;

        name = "${name}-nix";
        tokenFile = config.age.secrets.forgejo-actions-token.path;

        labels = [
          "nix-${nixTag}:docker://forgejo-runner-nix"
        ];

        settings = {
          container.options = "-e NIX_BUILD_SHELL=/bin/bash -e PAGER=cat -e PATH=/bin -e SSL_CERT_FILE=/etc/ssl/certs/ca-bundle.crt --device /dev/kvm -v /nix:/nix -v ${storeDeps}/bin:/bin -v ${storeDeps}/etc/ssl:/etc/ssl --user nix-ci-user";
          container.valid_volumes = [
            "/nix"
            "${storeDeps}/bin"
            "${storeDeps}/etc/ssl"
          ];
        };
      };
    };
  };
}
