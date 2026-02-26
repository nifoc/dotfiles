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
    nom build --fallback ".#{{ type }}Configurations.{{ target }}.config.system.build.toplevel"

# Build a remote machine
[group('build')]
build-remote-machine target remoteBuild=defaultRemoteBuild type=defaultRemoteType:
    #!/bin/sh
    if [ "{{ remoteBuild }}" = "true" ]; then
        user="$(nix eval --raw '.#deploy.nodes.{{ target }}.sshUser' 2> /dev/null)"
        hostname="$(nix eval --raw '.#deploy.nodes.{{ target }}.hostname' 2> /dev/null)"
        echo "Building on ${hostname} ..."
        nom build --fallback \
          --eval-store auto \
          --store "ssh-ng://${user}@${hostname}" \
          '.#{{ type }}Configurations.{{ target }}.config.system.build.toplevel'
    else
        echo "Remote building is disabled"
    fi

# Deploy to a local machine
[group('deploy')]
deploy-local-machine target type=defaultLocalType: _git-pull (build-local-machine target type)
    sudo {{ type }}-rebuild switch --fallback --flake ".#{{ target }}"
    attic push nifoc-systems /run/current-system
    find ./.direnv -maxdepth 1 -name 'flake-profile-*' -type l -exec attic push nifoc-systems {} \;

# Deploy to a remote machine
[group('deploy')]
deploy-remote-machine target remoteBuild=defaultRemoteBuild type=defaultRemoteType: _git-pull (build-remote-machine target remoteBuild type)
    deploy --skip-checks '.#{{ target }}'
    ssh -t '{{ target }}' 'attic push nifoc-systems /run/current-system'

_git-pull:
    -git pull
