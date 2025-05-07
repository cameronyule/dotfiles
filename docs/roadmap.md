# Roadmap

* Simplify Install
  * [ ] Investigate [nix-homebrew](https://github.com/zhaofengli/nix-homebrew) to eliminate the manual Homebrew install step.

* Idiomatic Nix
  * [ ] Favour Nix-managed software over Homebrew Casks and Mac App Store.
  * [ ] Favour nix-darwin _or_ Home Manager for managing packages, not both.

* System Configuration
  * [x] ~~Define the full list of software I use in [packages.nix](../modules/packages.nix).~~
  * [ ] Safari configuration (e.g., Status Bar).
  * Window Management.
    * [x] ~~Investigate [FlashSpace](https://github.com/wojciech-kulik/FlashSpace) as an alternative to [macOS Spaces](https://support.apple.com/en-gb/guide/mac-help/mh14112/mac)~~.
    * [x] ~~Configure tiling window management.~~
  * Keyboard Configuration
    * Apply keyboard overrides only to my specific keyboard.

* Development Environment.
  * Emacs Configuration.
    * [ ] [Language Server Protocol](https://microsoft.github.io/language-server-protocol/) installations.
      * [ ] Elisp (e.g. [Elsa](https://github.com/emacs-elsa/Elsa))
      * [x] ~~Nix~~
      * [x] ~~Rust~~
      * [x] ~~Shell~~
    * [ ] Debugging Support.
      * [x] [Doom Debugger](https://github.com/doomemacs/doomemacs/tree/master/modules/tools/debugger)
    * [ ] Theme
      * [x] [Solarized](https://github.com/doomemacs/themes/blob/master/themes/doom-solarized-dark-theme.el)
      * [ ] [svg-tag-mode](https://github.com/rougier/svg-tag-mode)
      * [x] [Update Fonts](https://github.com/doomemacs/doomemacs/blob/master/docs/faq.org#change-my-fonts)
  * Evaluate [Nix flakes](https://fasterthanli.me/series/building-a-rust-service-with-nix/part-10), [Direnv](https://nixos.asia/en/direnv), [Devenv](https://devenv.sh/), [Flox](https://github.com/flox/flox), and others.
    * Evaluate [building containers with Nix](https://xeiaso.net/talks/2024/nix-docker-build/).
  * Xcode integration with Nix.
  * Secrets management.
    * [x] ~~[Using secrets with 1Password CLI](https://developer.1password.com/docs/cli/secret-references)~~
  * [x] ~~SSH Configuration (SSH keys, SSH agent, etc).~~
  * [x] ~~Terminal Configuration.~~
    * [x] ~~Application (e.g. iTerm).~~
    * [x] ~~Theme.~~
    * [x] ~~Fonts.~~
    * [x] ~~`zsh` configuration.~~
    * [x] ~~`fzf` or `sk` for fuzzy searching.~~
