{
  description = "macOS configuration";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew = {
      url = "github:zhaofengli/nix-homebrew";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nix-darwin.follows = "nix-darwin";
    };
  };

  outputs =
    inputs@{
      self,
      home-manager,
      nix-darwin,
      nix-homebrew,
      nixpkgs,
    }:
    let
      system = "aarch64-darwin";
      username = "cameronyule";
      hostname = "nexus";

      specialArgs = {
        inherit inputs username hostname;
      };
    in
    {
      formatter.${system} = nixpkgs.legacyPackages.${system}.nixfmt-rfc-style;

      darwinConfigurations = {
        "${hostname}" = nix-darwin.lib.darwinSystem {
          inherit specialArgs;
          modules = [
            ./modules/nix-core.nix
            ./modules/darwin
            ./modules/darwin/packages.nix
            nix-homebrew.darwinModules.nix-homebrew
            {
              nix-homebrew = {
                enable = true;
                user = "${username}";
                autoMigrate = true;
              };
            }
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
