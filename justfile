defaultLocalType := if os() == "macos" { "darwin" } else { "nixos" }
defaultRemoteType := "nixos"

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
build-remote-machine target type=defaultRemoteType:
    nom build --fallback \
      --eval-store auto \
      --store 'ssh-ng://root@{{ target }}' \
      '.#{{ type }}Configurations.{{ target }}.config.system.build.toplevel'

# Deploy to a local machine
[group('deploy')]
deploy-local-machine target type=defaultLocalType: _git-pull (build-local-machine target type)
    env TERM=xterm-256color {{ type }}-rebuild switch --fallback --flake ".#{{ target }}"
    attic push nifoc-systems /run/current-system
    find ./.direnv -maxdepth 1 -name 'flake-profile-*' -type l -exec attic push nifoc-systems {} \;

# Deploy to a remote machine
[group('deploy')]
deploy-remote-machine target type=defaultRemoteType: _git-pull (build-remote-machine target type)
    deploy --skip-checks '.#{{ target }}'
    ssh -t '{{ target }}' 'attic push nifoc-systems /run/current-system'

_git-pull:
    -git pull
