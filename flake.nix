{
  description = "macOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    nix-homebrew.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.inputs.nix-darwin.follows = "nix-darwin";
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
      username = "cameronyule";
    in
    {
      darwinConfigurations = {
        "nexus" = nix-darwin.lib.darwinSystem rec {
          system = "aarch64-darwin";
          specialArgs = inputs // { inherit username system; };
          modules = [ ./hosts/nexus ];
        };
        "nova" = nix-darwin.lib.darwinSystem rec {
          system = "x86_64-darwin";
          specialArgs = inputs // { inherit username system; };
          modules = [ ./hosts/nova ];
        };
      };

      #formatter.${system} = nixpkgs.legacyPackages.${system}.nixfmt-rfc-style;
    };
}
