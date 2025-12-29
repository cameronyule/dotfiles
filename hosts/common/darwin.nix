{system, ...}: {
  imports = [
    ../../modules/nix
    ../../modules/nix-darwin
    ../../modules/nix-darwin/homebrew.nix
  ];

  nixpkgs.hostPlatform = "${system}";
}
