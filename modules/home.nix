{ config, pkgs, ... }:

let
  # prelude = pkgs.fetchFromGitHub {
  #   owner = "bbatsov";
  #   repo = "prelude";
  #   rev = "799c71f39d061145a7d01d6305bab5071caf71e1";
  #   hash = "sha256-jrWjitMKJG2W3nTzgeTdSuPe3uMcsy3V7RbEV9qBffE=";
  # };
  iterm-themes = pkgs.fetchFromGitHub {
    owner = "mbadolato";
    repo = "iTerm2-Color-Schemes";
    rev = "5c98ca96a752b3b9e51576776b7da06e468d8624";
    hash = "sha256-hGD5xqPrt0ZqFHyef7jwZZ5FQyLfF/84J+51LbtzmhM=";
  };

in {

  home = {
    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "24.11"; # Please read the comment before changing.

    file = {
      # "${config.home.homeDirectory}/.emacs.d" = {
      #   source = prelude;

      #   # The cloned Prelude repository will live in the Nix store, which is immutable. To allow
      #   # mutating the configuration, we recursively symlink the directories and files from the
      #   # store, but ensure that the `emacs.d` directory itself is writable and mutable.
      #   # https://nix-community.github.io/home-manager/options.xhtml#opt-home.file._name_.recursive
      #   recursive = true;
      # };

      # # https://prelude.emacsredux.com/en/latest/installation/#pinning-packages
      # "${config.home.homeDirectory}/.emacs.d/prelude-pinned-packages.el".source = prelude + "/sample/prelude-pinned-packages.el";

      # # https://prelude.emacsredux.com/en/latest/configuration/#personalizing
      # "${config.home.homeDirectory}/.emacs.d/personal/prelude-modules.el".source = prelude + "/sample/prelude-modules.el";
      # "${config.home.homeDirectory}/.emacs.d/personal/config.el" = {
      #   text = ''
      #     (prelude-require-package 'nix-mode)
      #     (add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode))
      #   '';
      # };

      # TODO Automate Terminal.app consuming a theme (e.g. Zenburn).
      # plutil -convert binary1 -o Zenburn.plist Zenburn.terminal
      # https://github.com/gilacost/dot-files/blob/a1d15dd89ccc14285cc96a64b2ed16aa97342056/darwin-configuration.nix#L92
      # TODO Automate setting theme font (e.g. to Fira Code Nerd Font Mono)
      "${config.xdg.cacheHome}/terminal/iTerm2-Color-Schemes".source = iterm-themes;
    };
  };

  programs = {
    # https://github.com/sharkdp/bat
    # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.bat.enable
    bat = {
      enable = true;
    };

    # https://github.com/eza-community/eza
    # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.eza.enable
    eza = {
      enable = true;
      enableZshIntegration = true;
    };

    # https://github.com/sharkdp/fd
    # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.fd.enable
    fd = {
      enable = true;
    };

    # https://github.com/junegunn/fzf
    # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.fzf.enable
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.git.enable
    git = {
      enable = true;
      userName = "Cameron Yule";
      userEmail = "cameron@cameronyule.com";
      ignores = [ ".DS_Store" ];
      signing = {
        format = "ssh";
        key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII20sr7+ICMFMmR6NFC2/fhHjE8kESPWchJiJ5l/ds2m";
        signByDefault = true;
        signer = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
      };
    };

    # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.ssh.enable
    ssh = {
      enable = true;
      matchBlocks = {
        "*".extraOptions = {
          # https://developer.1password.com/docs/ssh/get-started/#step-4-configure-your-ssh-or-git-client
          identityAgent = ''"~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"'';
        };
      };
    };

    # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.zsh.enable
    zsh = {
      enable = true;

      # https://github.com/zsh-users/zsh-completions
      enableCompletion = true;

      # https://github.com/zsh-users/zsh-autosuggestions
      autosuggestion.enable = false;

      # https://github.com/zsh-users/zsh-syntax-highlighting
      syntaxHighlighting.enable = true;
      syntaxHighlighting.highlighters = [ "main" "brackets" ];

      # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.zsh.history
      history = {
        extended = true;
        save = 100000;
        size = 100000;
        share = true;
      };

      # https://github.com/aloxaf/fzf-tab
      # https://discourse.nixos.org/t/darwin-home-manager-zsh-fzf-and-zsh-fzf-tab/33943/2
      initExtra = ''
        source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
      '';
    };

    # https://starship.rs
    # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.starship.enable
    starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        add_newline = false;
      };
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
