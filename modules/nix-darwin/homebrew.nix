{ nix-homebrew, username, ... }:

{
  imports = [
    nix-homebrew.darwinModules.nix-homebrew
  ];

  nix-homebrew = {
    enable = true;
    user = "${username}";
    autoMigrate = true;
  };
}
