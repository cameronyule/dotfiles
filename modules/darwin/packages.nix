{ pkgs, ... }:

{
  # Install nix packages.
  environment.systemPackages = with pkgs; [
    aider-chat
    discord
    firefox
    rectangle
    signal-desktop-bin
    spotify # FIXME Outdated version https://github.com/NixOS/nixpkgs/blob/8406224e30c258025cb8b31704bdb977a8f1f009/pkgs/by-name/sp/spotify/darwin.nix#L16
    utm
    zoom-us
    zotero
  ];

  # https://nix-darwin.github.io/nix-darwin/manual/index.html#opt-fonts.packages
  fonts.packages = with pkgs; [
    # Proportional font for things like Org.
    # https://github.com/edwardtufte/et-book
    etBook
    # Monotype font for things like code and terminals.
    # https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode
    # Required by https://starship.rs/guide/
    nerd-fonts.fira-code
    nerd-fonts.symbols-only
  ];

  # Use Homebrew to install GUI apps.
  # https://nix-darwin.github.io/nix-darwin/manual/index.html#opt-homebrew.enable
  #
  # TODO: Migrate to Nix where possible.
  # E.g., https://github.com/NixOS/nixpkgs/blob/nixos-24.11/pkgs/applications/misc/1password-gui/default.nix#L65
  # E.g., https://github.com/NixOS/nixpkgs/blob/nixos-24.11/pkgs/by-name/sp/spotify/package.nix#L15
  homebrew = {
    enable = true;

    # https://nix-darwin.github.io/nix-darwin/manual/index.html#opt-homebrew.casks
    # TODO Migrate to Nix packages where possible. Casks are not pinned.
    casks = [
      "1password" # https://github.com/NixOS/nixpkgs/issues/254944
      "1password-cli"
      "dropbox"
      "ghostty" # https://github.com/NixOS/nixpkgs/issues/388984#issuecomment-2715508998
      "little-snitch"
      "meetingbar"
      "lookaway"
    ];

    # https://nix-darwin.github.io/nix-darwin/manual/index.html#opt-homebrew.masApps
    masApps = {
      "1Password for Safari" = 1569813296;
      "AdGuard for Safari" = 1440147259;
      "Pins for Pinboard" = 1547106997;
      WhatsApp = 310633997;
      Xcode = 497799835;
    };

  };
}
