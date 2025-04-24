{ config, pkgs, ... }:
{
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

      shellAliases = {
        ls = "exa -la";
      };
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

  home.file = {
    # TODO Automate Terminal.app consuming a theme (e.g. Zenburn).
    # plutil -convert binary1 -o Zenburn.plist Zenburn.terminal
    # https://github.com/gilacost/dot-files/blob/a1d15dd89ccc14285cc96a64b2ed16aa97342056/darwin-configuration.nix#L92
    # TODO Automate setting theme font (e.g. to Fira Code Nerd Font Mono)
    "${config.xdg.cacheHome}/terminal/iTerm2-Color-Schemes".source = pkgs.fetchFromGitHub {
      owner = "mbadolato";
      repo = "iTerm2-Color-Schemes";
      rev = "5c98ca96a752b3b9e51576776b7da06e468d8624";
      hash = "sha256-hGD5xqPrt0ZqFHyef7jwZZ5FQyLfF/84J+51LbtzmhM=";
    };
  };
}
