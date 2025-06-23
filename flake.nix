{
  description = "macOS configuration";

  inputs = {
    # keep-sorted start block=yes
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew = {
      url = "github:zhaofengli/nix-homebrew";
    };
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # keep-sorted end
  };

  outputs = inputs @ {
    # keep-sorted start
    flake-utils,
    home-manager,
    homebrew-cask,
    homebrew-core,
    nix-darwin,
    nix-homebrew,
    nixpkgs,
    self,
    treefmt-nix,
    # keep-sorted end
  }: let
    username = "cameronyule";
    staticDarwinConfigurations = {
      "nexus" = nix-darwin.lib.darwinSystem rec {
        system = "aarch64-darwin";
        specialArgs = inputs // {inherit username system;};
        modules = [./hosts/nexus];
      };
      "nova" = nix-darwin.lib.darwinSystem rec {
        system = "x86_64-darwin";
        specialArgs = inputs // {inherit username system;};
        modules = [./hosts/nova];
      };
    };
  in
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};
        treefmtEval = treefmt-nix.lib.evalModule pkgs ./internal/nix/treefmt.nix;
      in {
        formatter = treefmtEval.config.build.wrapper;
        checks.formatting = treefmtEval.config.build.check self;
      }
    )
    // {
      # Merge static per-host configurations.
      darwinConfigurations = staticDarwinConfigurations;
    };
}
