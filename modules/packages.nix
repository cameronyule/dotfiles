{ pkgs, ... }:

{
  # Install nix packages.
  environment.systemPackages = [
    pkgs.emacs
    pkgs.pandoc
    pkgs.signal-desktop
    pkgs.utm
  ];

  # Use Homebrew to install GUI apps.
  # TODO: Migrate to Nix where possible.
  # E.g., https://github.com/NixOS/nixpkgs/blob/nixos-24.11/pkgs/applications/misc/1password-gui/default.nix#L65
  # E.g., https://github.com/NixOS/nixpkgs/blob/nixos-24.11/pkgs/by-name/sp/spotify/package.nix#L15
  homebrew = {
    # NB: This does not install Homebrew, which means there is a manual install step.
    # TODO: Investigate https://github.com/zhaofengli/nix-homebrew
    # E.g., https://github.com/dustinlyons/nixos-config/blob/91be1deae7e0b9e074256838a3a85899c21f09b5/flake.nix#L11

    enable = true;

    casks = [
      "1password"
      "dropbox"
      "firefox"
      "spotify"
      "zoom"
    ];

    masApps = {
      WhatsApp = 310633997;
    };

  };
}
