## Installation

⚠️ I have switched to a combination of `nix-darwin` and `home-manager`. The installation instructions below do not work that setup.

<details>
  <summary>Click to expand!</summary>

  ```bash
  # nix
  sh <(curl -L https://nixos.org/nix/install)

  sudo echo 'experimental-features = nix-command flakes' >> /etc/nix/nix.conf
  sudo echo 'keep-derivations = true' >> /etc/nix/nix.conf
  sudo echo 'keep-outputs = true' >> /etc/nix/nix.conf
  sudo echo 'auto-optimise-store = true' >> /etc/nix/nix.conf

  # home-manager
  nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
  nix-channel --update
  nix-shell '<home-manager>' -A install

  # Configuration
  cd ~/.config
  git clone git@github.com:nifoc/dotfiles.git nixpkgs
  home-manager switch --flake ~/.config/nixpkgs/#$USER

  sudo cachix use nix-community
  ```
</details>

## Overlays

* [neovim-nightly-overlay](https://github.com/nix-community/neovim-nightly-overlay)
* [zig-overlay](https://github.com/arqv/zig-overlay)
* [nifoc-overlay](https://github.com/nifoc/nix-overlay)
