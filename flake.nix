{
  description = "macOS configuration";

  inputs = {
    # Tracking rolling release.
    # https://wiki.nixos.org/wiki/Channel_branches
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
  };

  outputs =
    inputs@{
      self,
      home-manager,
      nix-darwin,
      nixpkgs,
    }:
    let
      system = "aarch64-darwin";
      specialArgs = {
        inherit inputs;
      };
    in
    {
      formatter.${system} = nixpkgs.legacyPackages.${system}.nixfmt-rfc-style;
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
