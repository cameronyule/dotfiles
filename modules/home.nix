{ config, pkgs, ... }:

{
  home = {
    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "24.11"; # Please read the comment before changing.

    file = let
      prelude = pkgs.fetchFromGitHub {
        owner = "bbatsov";
        repo = "prelude";
        rev = "799c71f39d061145a7d01d6305bab5071caf71e1";
        hash = "sha256-jrWjitMKJG2W3nTzgeTdSuPe3uMcsy3V7RbEV9qBffE=";
      };
      in {
        ".emacs.d" = {
          source = prelude;

          # The cloned Prelude repository will live in the Nix store, which is immutable. To allow
          # mutating the configuration, we recursively symlink the directories and files from the
          # store, but ensure that the `emacs.d` directory itself is writable and mutable.
          # https://nix-community.github.io/home-manager/options.xhtml#opt-home.file._name_.recursive
          recursive = true;
        };

        # https://prelude.emacsredux.com/en/latest/installation/#pinning-packages
        ".emacs.d/prelude-pinned-packages.el".source = prelude + "/sample/prelude-pinned-packages.el";

        # https://prelude.emacsredux.com/en/latest/configuration/#personalizing
        ".emacs.d/personal/prelude-modules.el".source = prelude + "/sample/prelude-modules.el";
        ".emacs.d/personal/config.el" = {
          text = ''
            (prelude-require-package 'nix-mode)
            (add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode))
          '';
        };
      };
  };

  programs = {
    # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.git.enable
    git = {
      enable = true;
      userName = "Cameron Yule";
      userEmail = "cameron@cameronyule.com";
      ignores = [ ".DS_Store" ];
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
