_: {
  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # The Nix sandbox is disabled by default on Darwin, re-enabling.
  nix.settings.sandbox = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Clean up every once in a while
  nix.gc.automatic = true;
}
