# References

Useful guides and resources I've relied upon while learning Nix, nix-darwin and home-manager.

## Nix

Guides to getting started with [Nix](https://nixos.org).

* [Zero to Nix](https://zero-to-nix.com)
* [Nix Pills](https://nixos.org/guides/nix-pills/)

## nix-darwin

nix-darwin "aims to bring the convenience of a declarative system approach to macOS".

* [nix-darwin](https://github.com/LnL7/nix-darwin)
* [Switching to nix-darwin and Flakes](https://evantravers.com/articles/2024/02/06/switching-to-nix-darwin-and-flakes/)
* [Setting up Nix on macOS](https://nixcademy.com/posts/nix-on-macos/)
* [Setting up Nix on macOS](https://davi.sh/til/nix/nix-macos-setup/)
* [Package management on macOS with nix-darwin](https://davi.sh/blog/2024/01/nix-darwin/)

### Example Configurations

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

### LSP

* [lsp-mode](https://github.com/emacs-lsp/lsp-mode/)
  * [nixd](https://github.com/nix-community/nixd)
  * [lsp-mode nix.el](https://github.com/emacs-lsp/lsp-mode/blob/d35aa757a3afde7a62efd67e2b84a9d8324951c0/clients/lsp-nix.el)

### Roam

* [org-roam](https://www.orgroam.com)
* [How I Take Notes with Org-roam](https://jethrokuan.github.io/org-roam-guide/)
* [Build a Second Brain in Emacs with Org Roam](https://systemcrafters.net/build-a-second-brain-in-emacs/getting-started-with-org-roam/pp)

## Keyboard

The keyboard I use - a [Drop CTRL](https://drop.com/buy/drop-ctrl-mechanical-keyboard) - has a Windows-style layout which results in the Command and Option keys being swapped around on macOS. The below explains how to fix this using `hidutil` which can then be mapped to nix-darwin configuration.

* [Remapping Keys in macOS](https://developer.apple.com/library/archive/technotes/tn2450/_index.html)
* [Example remapping keys with `hidutil`](https://github.com/ghostty-org/ghostty/discussions/3493#discussioncomment-11678819)
* [Example remapping keys with `hidutil` for a specific keyboard](https://github.com/LnL7/nix-darwin/issues/905#issuecomment-2340195913)

## Terminal

* [Terminal colours are tricky](https://jvns.ca/blog/2024/10/01/terminal-colours/)
