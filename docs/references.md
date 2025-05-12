# References

Useful guides and resources I've relied upon while learning Nix, nix-darwin and home-manager.

## Nix

Guides to getting started with [Nix](https://nixos.org).

* [Zero to Nix](https://zero-to-nix.com)
* [Nix Pills](https://nixos.org/guides/nix-pills/)

### Flakes

* [Practical Nix Flakes](https://serokell.io/blog/practical-nix-flakes)
* [Nix Flakes: an Introduction](https://xeiaso.net/blog/nix-flakes-1-2022-02-21/)
* [Conquer dev environments with Nix](https://robertovitillo.com/conquer-dev-environments-with-nix/)
* [Hermetic shells](https://github.com/NixOS/nix/issues/4359#issuecomment-907768110)

## Nix on Darwin

* [Nix Manual - Darwin (macOS)](https://nixos.org/manual/nixpkgs/stable/#sec-darwin)
* [Nix Manual - iOS](https://nixos.org/manual/nixpkgs/stable/#ios)

### nix-darwin

nix-darwin "aims to bring the convenience of a declarative system approach to macOS".

* [nix-darwin](https://github.com/LnL7/nix-darwin)
* [Switching to nix-darwin and Flakes](https://evantravers.com/articles/2024/02/06/switching-to-nix-darwin-and-flakes/)
* [Setting up Nix on macOS](https://nixcademy.com/posts/nix-on-macos/)
* [Setting up Nix on macOS](https://davi.sh/til/nix/nix-macos-setup/)
* [Package management on macOS with nix-darwin](https://davi.sh/blog/2024/01/nix-darwin/)
* [Getting Started with Nix](https://mirosval.sk/blog/2023/nix-getting-started/)

#### Example Configurations

* [torgeir/nix-darwin](https://github.com/torgeir/nix-darwin)
* [ryan4yin/nix-darwin-kickstarter](https://github.com/ryan4yin/nix-darwin-kickstarter)
* [dustinlyons/nixos-config](https://github.com/dustinlyons/nixos-config)
* [zupo/dotfiles](https://github.com/zupo/dotfiles)
* [sheeley/dotfiles](https://github.com/sheeley/dotfiles)
* [bruxisma/dotfiles](https://github.com/bruxisma/dotfiles)
* [gamedolphin/system](https://github.com/gamedolphin/system)
* [alarsyo/nixos-config](https://git.alarsyo.net/alarsyo/nixos-config)
* [srid/nixos-config](https://github.com/srid/nixos-config)
* [reckenrode/nixos-configs](https://github.com/reckenrode/nixos-configs)
* [genebean/dots](https://github.com/genebean/dots)

## Home Manager

A system for managing user environments in coordination with Nix. My primary interest is for managing dotfiles (e.g. system and application configuration), environment variables, and so on.

* [Home Manager](https://github.com/nix-community/home-manager)
* [Managing dotfiles on macOS with Nix](https://davi.sh/blog/2024/02/nix-home-manager/)
* [Tidying up your $HOME with Nix](https://juliu.is/tidying-your-home-with-nix/)
* [Setting up a development environment with Nix and Home Manager](https://www.rousette.org.uk/archives/setting-up-a-development-environment-with-nix-and-home-manager/)
* [Home-Manager Dark Mode Toggle](https://ryan.himmelwright.net/post/home-manager-dark-mode/)

## Emacs

There are many different methods for installing [Emacs](https://www.gnu.org/software/emacs/) on macOS systems, each of which come with their own advantages and disadvantages. Personally, I prefer using the GUI ("[NextStep](https://github.com/emacs-mirror/emacs/blob/master/etc/NEXTSTEP)") version of Emacs for closer adherence to macOS standards. The GNU project do not ship an official installer for [non-free systems](https://www.gnu.org/software/emacs/download.html#nonfree), but thankfully there are third-party supported packages available.

* [nixpkgs 24.11 definition for Emacs](https://github.com/NixOS/nixpkgs/blob/nixos-24.11/pkgs/applications/editors/emacs/sources.nix)
* [Reddit comment explaining the situation for graphical Emacs on macOS](https://www.reddit.com/r/emacs/comments/1heyuq4/comment/m27fo42/)
* [How to view what settings Emacs was compiled with at runtime](https://emacs.stackexchange.com/a/35512)

### Doom

* [Doom Emacs Documentation](https://docs.doomemacs.org/latest/)
* [Getting Started with Doom Emacs](https://aquabeam.me/tech/doom_emacs_intro/)
* [ruivieira configuration](https://ruivieira.dev/doom-emacs.html)
* [zzamboni configuration](https://zzamboni.org/post/my-doom-emacs-configuration-with-commentary/)
* [justin.vc configuration](https://notes.justin.vc/config)
* [A handbook for the Doom Emacs initiate](https://valerioviperino.me/doom-emacs-handbook/)
* [Doom Emacs Workflows](https://noelwelsh.com/posts/doom-emacs/)
* [Doom Emacs Config](https://www.const.no/init/)
* [Switching to Doom Emacs](https://ethanaa.com/blog/switching-to-doom-emacs/)
* [Migrating to Doom Emacs](https://blog.jethro.dev/posts/migrating_to_doom_emacs/)
* [My Literate Doom Emacs Configuration](https://joshblais.com/posts/my-literate-doom-emacs-config/)
* [Doom Emacs Config](https://hieuphay.com/doom-emacs-config/)

### LSP

* [lsp-mode](https://github.com/emacs-lsp/lsp-mode/)
  * [nixd](https://github.com/nix-community/nixd)
  * [lsp-mode nix.el](https://github.com/emacs-lsp/lsp-mode/blob/d35aa757a3afde7a62efd67e2b84a9d8324951c0/clients/lsp-nix.el)

### Debugging

* [Doom Debugger](https://github.com/doomemacs/doomemacs/tree/master/modules/tools/debugger)
  * [debug-adaptor-protocol](https://github.com/microsoft/debug-adapter-protocol)
  * [DAPE](https://github.com/svaante/dape)
  * [Emacs IDE - How to Debug Your Code with dap-mode](https://www.youtube.com/live/0bilcQVSlbM)
  * [DAP and LSP](https://emacs-lsp.github.io/dap-mode/page/configuration/)
* [LLDB](https://lldb.llvm.org/index.html)
  * [Debug Adapator Protocol (DAP)](https://jonasdevlieghere.com/post/lldb-dap/)
  * [Building](https://lldb.llvm.org/resources/build.html)
  * [Remote Debugging](https://lldb.llvm.org/use/remote.html)
* [Debugging Ruby with Emacs](https://www.sharmaso.com/posts/debugging-ruby-with-emacs/)
* [Debugging Rust with Emacs](https://users.rust-lang.org/t/debugging-in-emacs-doom/99540)
* [Debugging Emacs](https://mclare.blog/posts/debugging-emacs/)

### Tree-Sitter

* [How to Get Started with Tree-Sitter](https://www.masteringemacs.org/article/how-to-get-started-tree-sitter)

### Org Mode

* [Doom Emacs tweaks: Org Journal and Super Agenda](https://www.rousette.org.uk/archives/doom-emacs-tweaks-org-journal-and-org-super-agenda/)
* [Org-modern and svg-tag-mode](https://hieuphay.com/doom-emacs-config/#org-modern-and-svg-tag-mode)

#### Org Roam

* [org-roam](https://www.orgroam.com)
* [How I Take Notes with Org-roam](https://jethrokuan.github.io/org-roam-guide/)
* [Build a Second Brain in Emacs with Org Roam](https://systemcrafters.net/build-a-second-brain-in-emacs/getting-started-with-org-roam/pp)

## Development

* [nix develop](https://nix.dev/manual/nix/2.24/command-ref/new-cli/nix3-develop)
* [Managing development environments with Nix](https://jeffkreeftmeijer.com/nix-devshells/)
* [NixOS: For developers](https://myme.no/posts/2020-01-26-nixos-for-development.html)
* [Nix shell and nix develop](https://blog.ysndr.de/posts/guides/2021-12-01-nix-shells/)

### Devenv

* [cachix/devenv](https://github.com/cachix/devenv)
* [cachix/nixcon-2024-workshop](https://github.com/cachix/nixcon-2024-workshop)

### Direnv

* [direnv: manage dev environments](https://nixos.asia/en/direnv)
* [direnv/direnv](https://github.com/direnv/direnv)
* [nix-community/nix-direnv](https://github.com/nix-community/nix-direnv)
  * [Setting up home-manager with nix-direnv](https://rexk.github.io/en/blog/nix-home-manager-direnv/)
* [doomemacs/direnv](https://github.com/doomemacs/doomemacs/blob/master/modules/tools/direnv/README.org)

### Rust

* [Nix shell with rustup](https://ayats.org/blog/nix-rustup)
* [Building a Rust service with Nix](https://fasterthanli.me/series/building-a-rust-service-with-nix)
  * [Making a dev shell with nix flakes](https://fasterthanli.me/series/building-a-rust-service-with-nix/part-10)
* [Nix Powered Dev Environments: Rust](https://blog.graysonhead.net/posts/sane-nix-flake-rust/)
* [oxalica/rust-overlay](https://github.com/oxalica/rust-overlay)
* [naersk](https://github.com/nix-community/naersk)
* [nix-community/fenix](https://github.com/nix-community/fenix)

## Keyboard

The keyboard I use - a [Drop CTRL](https://drop.com/buy/drop-ctrl-mechanical-keyboard) - has a Windows-style layout which results in the Command and Option keys being swapped around on macOS. The below explains how to fix this using `hidutil` which can then be mapped to nix-darwin configuration.

* [Remapping Keys in macOS](https://developer.apple.com/library/archive/technotes/tn2450/_index.html)
* [Example remapping keys with `hidutil`](https://github.com/ghostty-org/ghostty/discussions/3493#discussioncomment-11678819)
* [Example remapping keys with `hidutil` for a specific keyboard](https://github.com/LnL7/nix-darwin/issues/905#issuecomment-2340195913)

## Terminal

* [Terminal colours are tricky](https://jvns.ca/blog/2024/10/01/terminal-colours/)
