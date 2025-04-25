{
  description = "macOS configuration";

  inputs = {
    # Tracking rolling release.
    # https://wiki.nixos.org/wiki/Channel_branches
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };
    nixpkgs-master = {
      url = "github:NixOS/nixpkgs/master";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, home-manager, nix-darwin, nixpkgs, nixpkgs-master }:
  let
    system = "aarch64-darwin";
    specialArgs = {
      inherit inputs;
      pkgs-master = import nixpkgs-master {
        inherit system;
      };
    };
  in {
    darwinConfigurations = {
      "nexus" = nix-darwin.lib.darwinSystem {
        inherit specialArgs;
        modules = [
          ./modules/nix-core.nix
          ./modules/darwin
          ./modules/darwin/packages.nix
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = specialArgs;
              users.cameronyule = import ./modules/home;
            };
          }
        ];
      };
    };
  };
}
