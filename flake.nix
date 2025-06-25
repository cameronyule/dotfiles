{
  description = "macOS configuration";

  inputs = {
    # keep-sorted start block=yes
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
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
    flake-parts,
    home-manager,
    homebrew-cask,
    homebrew-core,
    nix-darwin,
    nix-homebrew,
    nixpkgs,
    self,
    treefmt-nix,
    # keep-sorted end
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "aarch64-darwin"
        "x86_64-darwin"
      ];

      perSystem = {pkgs, ...}: let
        treefmtEval = treefmt-nix.lib.evalModule pkgs ./internal/nix/treefmt.nix;
      in {
        formatter = treefmtEval.config.build.wrapper;
        checks.formatting = treefmtEval.config.build.check self;
      };

      flake = {
        darwinConfigurations = let
          username = "cameronyule";

          mkDarwinHost = {
            system,
            hostname,
          }:
            nix-darwin.lib.darwinSystem {
              inherit system;
              specialArgs = inputs // {inherit username system;};
              modules = [./hosts/${hostname}];
            };
        in {
          "nexus" = mkDarwinHost {
            system = "aarch64-darwin";
            hostname = "nexus";
          };
          "nova" = mkDarwinHost {
            system = "x86_64-darwin";
            hostname = "nova";
          };
        };
      };
    };
}
