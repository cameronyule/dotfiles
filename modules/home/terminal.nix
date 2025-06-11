{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    gh
    tree
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

    zsh = {
      enable = true;

      # https://github.com/zsh-users/zsh-completions
      enableCompletion = true;

      # https://github.com/zsh-users/zsh-autosuggestions
      autosuggestion.enable = false;

      # https://github.com/zsh-users/zsh-syntax-highlighting
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

      # https://github.com/aloxaf/fzf-tab
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

  home.file = {
    # https://ghostty.org/docs/config
    "${config.xdg.configHome}/ghostty/config" = {
      text = ''
        # This is the configuration file for Ghostty.
        #
        # The template does not set any default options, since Ghostty ships
        # with sensible defaults for all options. Users should only need to set
        # options that they want to change from the default.
        #
        # Run `ghostty +show-config --default --docs` to view a list of
        # all available config options and their default values.
        #
        # Additionally, each config option is also explained in detail
        # on Ghostty's website, at https://ghostty.org/docs/config.
        #
        # Config syntax crash course
        # ==========================
        # # The config file consists of simple key-value pairs,
        # # separated by equals signs.
        # font-family = Iosevka
        # window-padding-x = 2
        #
        # # Spacing around the equals sign does not matter.
        # # All of these are identical:
        # key=value
        # key= value
        # key =value
        # key = value
        #
        # # Any line beginning with a # is a comment. It's not possible to put
        # # a comment after a config option, since it would be interpreted as a
        # # part of the value. For example, this will have a value of "#123abc":
        # background = #123abc
        #
        # # Empty values are used to reset config keys to default.
        # key =
        #
        # # Some config options have unique syntaxes for their value,
        # # which is explained in the docs for that config option.
        # # Just for example:
        # resize-overlay-duration = 4s 200ms

        theme = "Builtin Solarized Light"
        font-family = "FiraCode Nerd Font Mono"
        font-size = 11
      '';
    };
  };
}
