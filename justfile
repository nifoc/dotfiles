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
  nom build ".#{{type}}Configurations.{{target}}.config.system.build.toplevel"

# Build a remote machine
[group('build')]
build-remote-machine target type=defaultRemoteType:
  nom build --eval-store auto \
    --store 'ssh-ng://root@{{target}}.ts.kempkens.network' \
    '.#{{type}}Configurations.{{target}}.config.system.build.toplevel'

# Deploy to a local machine
[group('deploy')]
deploy-local-machine target type=defaultLocalType: _git-pull (build-local-machine target type)
  env TERM=xterm-256color {{type}}-rebuild switch --flake ".#{{target}}"
  attic push nifoc-systems /run/current-system

# Deploy to a remote machine
[group('deploy')]
deploy-remote-machine target type=defaultRemoteType: _git-pull (build-remote-machine target type)
  deploy --skip-checks '.#{{target}}'
  ssh -t '{{target}}' attic push nifoc-systems /run/current-system

_git-pull:
  -git pull
