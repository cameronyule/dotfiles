{system, ...}: {
  imports = [
    ../../modules/nix
    ../../modules/nix-darwin
    ../../modules/nix-darwin/homebrew.nix
    ./home.nix
  ];

  nixpkgs.hostPlatform = "${system}";
}
