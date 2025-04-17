# Roadmap

* Simplify Install
  * Investigate [nix-homebrew](https://github.com/zhaofengli/nix-homebrew) to eliminate the manual Homebrew install step.
* System Configuration
  * Define the full list of software I use in [packages.nix](../modules/packages.nix).
    * Favour Nix-managed software over Homebrew Casks wherever possible.
  * Safari configuration (e.g., Status Bar).
  * Window Management.
    * ~~Configure tiling window management.~~
    * Investigate [FlashSpace](https://github.com/wojciech-kulik/FlashSpace) as an alternative to [macOS Spaces](https://support.apple.com/en-gb/guide/mac-help/mh14112/mac).
  * Keyboard Configuration
    * Apply keyboard overrides only to my specific keyboard.
* Development Environment.
  * ~~SSH Configuration (SSH keys, SSH agent, etc).~~
  * Secrets management.
    * [Using secrets with 1Password CLI](https://developer.1password.com/docs/cli/secret-references)
  * Emacs Configuration.
    * E.g., [Language Server Protocol](https://microsoft.github.io/language-server-protocol/) installations.
  * ~~Terminal Configuration.~~
    * ~~Application (e.g. iTerm).~~
    * ~~Theme.~~
    * ~~Fonts.~~
    * ~~`zsh` configuration.~~
    * ~~`fzf` or `sk` for fuzzy searching.~~
  * Evaluate [Nix flakes](https://fasterthanli.me/series/building-a-rust-service-with-nix/part-10), [Direnv](https://nixos.asia/en/direnv), [Devenv](https://devenv.sh/), [Flox](https://github.com/flox/flox), and others.
    * Evaluate [building containers with Nix](https://xeiaso.net/talks/2024/nix-docker-build/).
  * Xcode integration with Nix.
