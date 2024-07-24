default:
  @just --list

# Format the entire source tree
fmt:
  treefmt

# Build a local machine
build-local-machine target type='darwin':
  nom build ".#{{type}}Configurations.{{target}}.config.system.build.toplevel"

# Build a remote machine
build-remote-machine target type='nixos':
  nom build --eval-store auto \
    --store 'ssh-ng://root@{{target}}.ts.kempkens.network' \
    '.#{{type}}Configurations.{{target}}.config.system.build.toplevel'

# Deploy to a local machine
deploy-local-machine target type='darwin': _git-pull (build-local-machine target type)
  env TERM=xterm-256color {{type}}-rebuild switch --flake ".#{{target}}"
  attic push nifoc-systems /run/current-system

# Deploy to a remote machine
deploy-remote-machine target type='nixos': _git-pull (build-remote-machine target type)
  deploy --skip-checks '.#{{target}}'
  ssh -t '{{target}}' attic push nifoc-systems /run/current-system

_git-pull:
  -git pull
