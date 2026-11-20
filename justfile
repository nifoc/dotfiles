defaultLocalType := if os() == "macos" { "darwin" } else { "nixos" }
defaultRemoteType := "nixos"
defaultRemoteBuild := "true"

default:
    @just --list

# Format the entire source tree
fmt:
    treefmt

# Build a local machine
[group('build')]
build-local-machine target type=defaultLocalType:
    rom build ".#{{ type }}Configurations.{{ target }}.config.system.build.toplevel" -- --fallback

# Build a remote machine
[group('build')]
build-remote-machine target remoteBuild=defaultRemoteBuild type=defaultRemoteType:
    #!/bin/sh
    if [ "{{ remoteBuild }}" = "true" ]; then
        user="$(nix eval --raw '.#deploy.nodes.{{ target }}.sshUser' 2> /dev/null)"
        hostname="$(nix eval --raw '.#deploy.nodes.{{ target }}.hostname' 2> /dev/null)"
        echo "Building on ${hostname} ..."
        rom build \
          '.#{{ type }}Configurations.{{ target }}.config.system.build.toplevel' -- \
          --fallback \
          --eval-store auto \
          --store "ssh-ng://${user}@${hostname}"
    else
        echo "Remote building is disabled"
    fi

# Deploy to the local machine
[group('deploy')]
deploy-local-machine target type=defaultLocalType: _git-pull (build-local-machine target type)
    sudo {{ type }}-rebuild switch --fallback --flake ".#{{ target }}"

# Deploy to a remote machine
[group('deploy')]
deploy-remote-machine target remoteBuild=defaultRemoteBuild type=defaultRemoteType: _git-pull (build-remote-machine target remoteBuild type)
    #!/bin/sh
    hostname="$(nix eval --raw '.#deploy.nodes.{{ target }}.hostname' 2> /dev/null)"
    deploy --skip-checks '.#{{ target }}'

# Deploy to the local machine, but activate after a reboot
[group('deploy')]
deploy-boot-local-machine target type=defaultLocalType: _git-pull (build-local-machine target type)
    sudo {{ type }}-rebuild boot --fallback --flake ".#{{ target }}"

# Deploy to a remote machine, but activate after a reboot
[group('deploy')]
deploy-boot-remote-machine target remoteBuild=defaultRemoteBuild type=defaultRemoteType: _git-pull (build-remote-machine target remoteBuild type)
    #!/bin/sh
    hostname="$(nix eval --raw '.#deploy.nodes.{{ target }}.hostname' 2> /dev/null)"
    deploy --skip-checks --boot '.#{{ target }}'

_git-pull:
    -git pull
