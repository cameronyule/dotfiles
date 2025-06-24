{pkgs, ...}: {
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    # Proportional font for things like Org.
    etBook
    # Monotype font for Emacs, Ghostty, and Starship.
    nerd-fonts.fira-code
    nerd-fonts.symbols-only
  ];
}
