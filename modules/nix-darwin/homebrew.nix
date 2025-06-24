{
  nix-homebrew,
  homebrew-core,
  homebrew-cask,
  username,
  ...
}: {
  imports = [
    nix-homebrew.darwinModules.nix-homebrew
  ];

  # Enable nix-darwin's management of package management via Homebrew.
  homebrew.enable = true;

  nix-homebrew = {
    # Enable nix-homebrew's management of Homebrew installation.
    enable = true;

    user = "${username}";

    autoMigrate = false;

    # Declarative tap management
    taps = {
      "homebrew/homebrew-core" = homebrew-core;
      "homebrew/homebrew-cask" = homebrew-cask;
    };

    # Enable fully-declarative tap management
    # With mutableTaps disabled, taps can no longer be added imperatively with `brew tap`.
    mutableTaps = false;
  };
}
