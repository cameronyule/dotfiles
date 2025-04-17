# Dotfiles

These are my [dotfiles](https://dotfiles.github.io), which allow me to codify, automate, and reliably reproduce the configuration of my systems. They use [Nix](https://nixos.org), [nix-darwin](https://github.com/nix-darwin/nix-darwin), and [home-manager](https://github.com/nix-community/home-manager).

## Organisation

| File                                            | Purpose                                     |
| :---------------------------------------------- | :------------------------------------------ |
| [flake.nix](flake.nix)                          | The entrypoint to my dotfiles.              |
| [modules/nix-core.nix](modules/nix-core.nix)    | Configuration of Nix itself.                |
| [modules/system.nix](modules/system.nix)        | macOS system configuration.                 |
| [modules/packages.nix](modules/packages.nix)    | Software (package and GUI) installation.    |
| [modules/home.nix](modules/home.nix)            | Home Manager configuration; dotfiles.       |

## Prerequisites

See [bootstrap](docs/bootstrap.md) for further information.

### 1. Install Nix

I use the [Determinate Systems Nix Installer](https://github.com/DeterminateSystems/nix-installer?tab=readme-ov-file#installation), but the [official installer](https://nixos.org/download/) can also be used as long as [flakes are enabled](https://nixos.wiki/wiki/Flakes#Other_Distros.2C_with_Home-Manager).

<details>
<summary>Install Command</summary>

```shell
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```
</details>

### 2. Install Homebrew
We install Homebrew to make it available to nix-darwin, which will manage installing any [Homebrew Casks](https://github.com/Homebrew/homebrew-cask) on our behalf. Homebrew will automatically [install the Xcode Command Line Tools](https://github.com/Homebrew/install/commit/493954aba6c4dfc37f2567eb7f67874c7ea51b11) during installation.

<details>
<summary>Install Command</summary>

 ```shell
 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
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

After modifying the configuration, apply the changes from a local working copy:

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

### Linting

Run the [statix](https://github.com/oppiliappan/statix) linter in a local working copy:

```shell
nix run nixpkgs#statix check .
```
