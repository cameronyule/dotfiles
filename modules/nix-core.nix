_:

{
  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # https://nix.dev/manual/nix/2.23/command-ref/conf-file.html?highlight=sandbox#conf-sandbox
  nix.settings.sandbox = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Clean up every once in a while
  nix.gc.automatic = true;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

}
