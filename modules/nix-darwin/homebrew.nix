{ nix-homebrew, username, ... }:

{
  imports = [
    nix-homebrew.darwinModules.nix-homebrew
  ];

  homebrew.enable = true;

  nix-homebrew = {
    enable = true;
    user = "${username}";
    autoMigrate = true;
  };
}
