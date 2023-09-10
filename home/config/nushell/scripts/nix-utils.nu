export alias update-system-flake = nix flake update ~/.config/nixpkgs -v

export def update-project-flake [] {
  let envrc = (rg --no-line-number --color never '^use flake' ./.envrc)

  if (not ('./.envrc' | path exists)) or $envrc =~ "^use flake$" {
    nix flake update ./ -v
  } else {
    let flake_path = ($envrc | split column ' ' | get 0 | get column3)
    nix flake update $flake_path -v
  }
}

export def update-neovim-plugins [] {
  let os = (uname)

  match $os {
    "Darwin" => { ~/.config/nixpkgs/home/programs/nvim/update-plugins.sh }
    "Linux" => { /etc/nixos/home/programs/nvim/update-plugins.sh }
    _ => { error make {msg: "unsupported operating system"} }
  }
}

export def update-all [] {
  update-system-flake
  update-neovim-plugins
}

export def nix-garbage-collect [] {
  nix-collect-garbage -d
  sudo nix-collect-garbage -d
}
