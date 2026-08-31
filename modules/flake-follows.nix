{
  flake-file.inputs = {
    agenix.inputs = {
      nixpkgs.follows = "nixpkgs";
      home-manager.follows = "home-manager";
      darwin.follows = "darwin";
    };

    deploy-rs.inputs = {
      nixpkgs.follows = "nixpkgs";
    };

    direnv-instant.inputs = {
      nixpkgs.follows = "nixpkgs";
      flake-parts.follows = "flake-parts";
      treefmt-nix.follows = "treefmt-nix";
    };

    disko.inputs = {
      nixpkgs.follows = "nixpkgs";
    };

    git-hooks.inputs = {
      nixpkgs.follows = "nixpkgs";
    };

    nifoc-overlay.inputs = {
      nixpkgs.follows = "nixpkgs";
      flake-parts.follows = "flake-parts";
    };

    niks3.inputs = {
      nixpkgs.follows = "nixpkgs";
      treefmt-nix.follows = "treefmt-nix";
    };

    run0-sudo-shim.inputs = {
      nixpkgs.follows = "nixpkgs";
      treefmt-nix.follows = "treefmt-nix";
    };

    treefmt-nix.inputs = {
      nixpkgs.follows = "nixpkgs";
    };
  };
}
