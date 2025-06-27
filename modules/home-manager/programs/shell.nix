{pkgs, ...}: {
  home.packages = with pkgs; [
    # keep-sorted start
    gh
    tree
    # keep-sorted end
  ];

  programs = {
    bat = {
      enable = true;
    };

    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv = {
        enable = true;
      };
      silent = true;
    };

    eza = {
      enable = true;
      enableZshIntegration = true;
    };

    fd = {
      enable = true;
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    gpg = {
      enable = true;
    };

    zsh = {
      enable = true;

      enableCompletion = true;
      autosuggestion.enable = false;

      syntaxHighlighting.enable = true;
      syntaxHighlighting.highlighters = [
        "main"
        "brackets"
      ];

      history = {
        extended = true;
        save = 100000;
        size = 100000;
        share = true;
      };

      # https://discourse.nixos.org/t/darwin-home-manager-zsh-fzf-and-zsh-fzf-tab/33943/2
      initContent = ''
        source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
      '';

      shellAliases = {
        ls = "exa -la";
      };
    };

    starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        add_newline = false;
      };
    };
  };
}
