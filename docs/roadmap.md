# Roadmap

* Simplify Install
  * Investigate [nix-homebrew](https://github.com/zhaofengli/nix-homebrew) to eliminate the manual Homebrew install step.
* System Configuration
  * Define the full list of software I use in [packages.nix](../modules/packages.nix).
  * Favour Nix-managed software over Homebrew Casks wherever possible.
  * Safari configuration (e.g., Status Bar).
  * Window Management.
    * Investigate the [tiling window manager in macOS Sequoia](https://support.apple.com/en-gb/guide/mac-help/mchlef287e5d/mac) as an alternative to [Rectangle](https://rectangleapp.com).
    * Investigate [FlashSpace](https://github.com/wojciech-kulik/FlashSpace) as an alternative to [macOS Spaces](https://support.apple.com/en-gb/guide/mac-help/mh14112/mac).
  * Keyboard Configuration
    * Apply keyboard overrides only to my specific keyboard.
* Development Environment.
  * Secrets management (SSH keys, SSH agent, etc).
    * [1Password Integration](https://developer.1password.com/docs/ssh/get-started/#step-4-configure-your-ssh-or-git-client), [Example 1P/zsh integration](https://github.com/srid/nixos-config/blob/master/modules/home/all/zsh.nix)
  * Emacs Configuration.
    * E.g., [Language Server Protocol](https://microsoft.github.io/language-server-protocol/) installations.
  * ~~Terminal Configuration.~~
    * ~~Application (e.g. iTerm).~~
    * ~~Theme (e.g. [Gogh](https://github.com/Gogh-Co/Gogh), [Catppuccin](https://github.com/catppuccin/nix) ([usage](https://github.com/Lalit64/dotfiles/blob/main/home/lalit/modules/home.nix)), [iTerm2 Color Schemes](https://iterm2colorschemes.com), [Zenburn](https://kippura.org/zenburnpage/).~~
    * ~~Fonts.~~
    * ~~`zsh` configuration.~~
    * ~~`fzf` or `sk` for fuzzy searching.~~
  * Evaluate [Nix flakes](https://fasterthanli.me/series/building-a-rust-service-with-nix/part-10), [Direnv](https://nixos.asia/en/direnv), [Devenv](https://devenv.sh/), [Flox](https://github.com/flox/flox), and others.
    * Evaluate [building containers with Nix](https://xeiaso.net/talks/2024/nix-docker-build/).
  * Xcode integration with Nix.
