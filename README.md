# Dotfiles

These are my [dotfiles](https://dotfiles.github.io), which allow me to codify, automate, and reliably reproduce the configuration of my systems. They use [Nix](https://nixos.org), [nix-darwin](https://github.com/nix-darwin/nix-darwin), and [home-manager](https://github.com/nix-community/home-manager).

## Organisation

| File                                                       | Purpose                                     |
| :--------------------------------------------------------- | :------------------------------------------ |
| [flake.nix](flake.nix)                                     | The entrypoint to my dotfiles.              |
| [modules/nix-core.nix](modules/nix-core.nix)               | Configuration of Nix.                       |
| [modules/darwin](modules/darwin/default.nix)               | macOS configuration.                        |
| [modules/darwin/packages.nix](modules/darwin/packages.nix) | App installation.                           |
| [modules/home](modules/home/default.nix)                   | Home Manager initialisation.                |
| [modules/home/emacs.nix](modules/home/emacs.nix)           | Doom Emacs configuration.                   |
| [modules/home/terminal.nix](modules/home/terminal.nix)     | ZSH, Starship, fzf, bat, etc.               |
| [modules/home/git.nix](modules/home/git.nix)               | Git configuration.                          |
| [modules/home/ssh.nix](modules/home/ssh.nix)               | SSH configuration.                          |

## Prerequisites

See [bootstrap](docs/bootstrap.md) for further information.

### 1. Install Nix

I use the [Determinate Systems Nix Installer](https://github.com/DeterminateSystems/nix-installer?tab=readme-ov-file#installation) as it enables Nix Flakes by default and has a comprehensive uninstaller. The [official Nix installer](https://nixos.org/download/) can also be used as long as [flakes are enabled](https://nixos.wiki/wiki/Flakes#Other_Distros.2C_with_Home-Manager) afterwards. Note that when installing Nix using the Determinate Systems installer, I do not install the Determinate Systems [downstream distribution of Nix](https://docs.determinate.systems/determinate-nix/).

<details>
<summary>Install Command</summary>

```shell
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```
</details>

## Usage

### Bootstrap

Apply the configuration for the first time directly from GitHub:

```shell
nix run nix-darwin/nix-darwin-24.11#darwin-rebuild -- switch --flake github:cameronyule/dotfiles
```

Apply the configuration for the first time from a local working copy:

```shell
nix run nix-darwin/nix-darwin-24.11#darwin-rebuild -- switch --flake .
```

#### Post-Bootstrap Configuration

* 1Password
  * [Enable the 1Password SSH agent](https://developer.1password.com/docs/ssh/get-started/#step-3-turn-on-the-1password-ssh-agent)
  * [Enable integration with the 1Password CLI](https://developer.1password.com/docs/cli/get-started#step-2-turn-on-the-1password-desktop-app-integration)

### Apply Changes

After modifying the configuration, first validate:

``` shell
darwin-rebuild check --flake .
```

Optionally test your changes in a temporary session:

``` shell
darwin-rebuild test --flake .
```

And finally apply your configuration to your system:

```shell
darwin-rebuild switch --flake .
```

### Rollback

Rollback to the previous state:

```shell
darwin-rebuild switch --rollback
```

List all previous states:

```shell
darwin-rebuild --list-generations
```

Switch to a specific previous state, where `x` is the desired state identifier:

``` shell
darwin-rebuild switch --switch-generation x
```

### Uninstall

1. Uninstall [nix-darwin](https://github.com/nix-darwin/nix-darwin?tab=readme-ov-file#uninstalling).
2. Uninstall [Homebrew](https://docs.brew.sh/FAQ#how-do-i-uninstall-homebrew).
3. Uninstall [Nix](https://github.com/DeterminateSystems/nix-installer?tab=readme-ov-file#uninstalling).

NB: This will not undo any of the configuration changes that have been applied to the system(s) under management. See [rollback](#rollback) for reverting state prior to uninstalling.

## Development

### Roadmap

See [roadmap](docs/roadmap.md) for further information.

### Formatting

Run [nix fmt](https://nix.dev/manual/nix/2.24/command-ref/new-cli/nix3-fmt) with the [nixfmt](https://github.com/NixOS/nixfmt) formatter:

``` shell
nix fmt
```

### Linting

Run the [statix](https://github.com/oppiliappan/statix) linter in a local working copy:

```shell
nix run nixpkgs#statix check .
```
