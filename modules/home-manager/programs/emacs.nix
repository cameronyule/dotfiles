{
  config,
  pkgs,
  ...
}: {
  programs.emacs = {
    enable = true;
    extraPackages = epkgs: [epkgs.vterm];
  };

  home = {
    packages = with pkgs; [
      # Doom dependencies
      coreutils
      fd
      ripgrep
      # Doom Module dependencies
      # Editorconfig
      editorconfig-core-c
      # LSP
      nodejs
      # Markdown
      pandoc
      # Nix
      nixd
      nixfmt-rfc-style
      # SH
      bash-language-server
      shellcheck
      shfmt
      # Spelling
      (aspellWithDicts (
        dicts:
          with dicts; [
            en
            en-computers
            en-science
          ]
      ))
      # vterm
      cmake
      libvterm-neovim
    ];

    file = {
      # Doom Emacs.
      "${config.xdg.configHome}/emacs" = {
        source = pkgs.fetchFromGitHub {
          owner = "doomemacs";
          repo = "doomemacs";
          rev = "8406c1ff22b95bd0f816de4a0223fa3ce3c82568";
          hash = "sha256-rOkgOdmLESVAbOeEM9nJTzxyI+akdk48Ed2VlktOy3Q=";
        };
        recursive = true;
      };

      # Emacs Configuration.
      "${config.xdg.configHome}/doom" = {
        source = pkgs.fetchFromGitHub {
          owner = "cameronyule";
          repo = "dotemacs";
          rev = "307e4113f8d99d4994bbe178d7e2baa3258b25df";
          hash = "sha256-vklFhe15DcBdAhiCPd/zvsQbbieBnnNIKUzOFXauaM8=";
        };
        recursive = true;
      };

      # TODO Make this a configurable option of the module.
      # NOTE This violates Nix's principles regarding immutability, however the trade-off being
      # made is that this allows editing the Emacs configuration without rebuilding our Nix
      # configuration. As I'm actively working on my Emacs setup this is a trade-off worth
      # making, but I may want to reconsider in future and clone the remote repository instead.
      # "${config.xdg.configHome}/doom".source =
      #   config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/src/dotemacs";
    };

    # Ensure Doom-provided binaries are included in PATH.
    sessionPath = [
      "${config.xdg.configHome}/emacs/bin"
    ];

    sessionVariables = {
      # Doom needs a mutable local directory in which to store files (e.g. emacs packages).
      # We override this as by default it would use a relative path and I install Doom into the (immutable) Nix store.
      # https://github.com/doomemacs/doomemacs/blob/303dd28db808b42a2397c0f4b9fdd71e606026ff/lisp/doom.el#L285
      DOOMLOCALDIR = "${config.xdg.configHome}/emacs/.local";

      # Set Emacs as the default editor in the terminal.
      EDITOR = "emacs -nw";
    };
  };
}
