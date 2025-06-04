{
  config,
  pkgs,
  ...
}:
let
  dotemacs = pkgs.fetchFromGitHub {
    owner = "cameronyule";
    repo = "dotemacs";
    rev = "307e4113f8d99d4994bbe178d7e2baa3258b25df";
    hash = "sha256-vklFhe15DcBdAhiCPd/zvsQbbieBnnNIKUzOFXauaM8=";
  };
in
{
  # Install Emacs
  programs.emacs = {
    enable = true;
  };

  home = {

    packages = with pkgs; [
      # Doom dependencies
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
        dicts: with dicts; [
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

      # Install Doom Emacs
      # https://github.com/doomemacs/doomemacs
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
      # NOTE This violates Nix's principles regarding immutability, however the trade-off being
      # made is that this allows editing the Emacs configuration without rebuilding our Nix
      # configuration. As I'm actively working on my Emacs setup this is a trade-off worth
      # making, but I may want to reconsider in future and clone the remote repository instead.
      # "${config.xdg.configHome}/doom".source =
      #   config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/src/dotemacs";

      # FIXME emacs-libvterm compiling vterm at runtime necessitates passing Nix store paths
      # to my Emacs configuration. This level of complexity doesn't feel worth it, as being
      # able to access vterm within Emacs is a nice-to-have at best.
      "${config.xdg.configHome}/doom/config.el".source = pkgs.replaceVarsWith {
        src = "${dotemacs}/config.el";
        replacements = { libvterm = pkgs.libvterm-neovim; };
      };
      "${config.xdg.configHome}/doom/init.el".source = "${dotemacs}/init.el";
      "${config.xdg.configHome}/doom/packages.el".source = "${dotemacs}/packages.el";
    };

    sessionPath = [
      # Add Doom Emacs CLI to the PATH.
      "${config.xdg.configHome}/emacs/bin"
    ];

    sessionVariables = {
      # Doom needs a mutable local directory in which to store files (e.g. emacs packages).
      # We override this as by default it would use a relative path and I install Doom into the (immutable) Nix store.
      # https://github.com/doomemacs/doomemacs/blob/303dd28db808b42a2397c0f4b9fdd71e606026ff/lisp/doom.el#L285
      DOOMLOCALDIR = "${config.xdg.configHome}/emacs/.local";

      # Set emcas in terminal mode as the default editor.
      EDITOR = "emacs -nw";
    };
  };
}
