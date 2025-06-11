{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    aider-chat
    discord
    firefox
    rectangle
    signal-desktop-bin
    spotify
    utm
    zoom-us
    zotero
  ];

  fonts.packages = with pkgs; [
    # Proportional font for things like Org.
    # https://github.com/edwardtufte/et-book
    etBook
    # Monotype font for Emacs, Ghostty, and Starship.
    # https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode
    nerd-fonts.fira-code
    nerd-fonts.symbols-only
  ];

  # Use Homebrew to install macOS GUI apps.
  homebrew = {
    enable = true;

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

    masApps = {
      "1Password for Safari" = 1569813296;
      "AdGuard for Safari" = 1440147259;
      "Pins for Pinboard" = 1547106997;
      WhatsApp = 310633997;
      Xcode = 497799835;
    };

  };
}
