{ config, pkgs, pkgs-master,... }:
{
  # Entry point for Home Manager configuration.
  # https://nix-community.github.io/home-manager/

  imports = [
    ./emacs.nix
    ./git.nix
    ./ssh.nix
    ./terminal.nix
  ];

  home = {
    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "24.11"; # Please read the comment before changing.
  };

  # Enable font discovery
  fonts.fontconfig.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
