# Dotfiles

My [dotfiles](https://dotfiles.github.io), which allow me to automate and reliably reproduce the setup of my systems.  
Built with [Nix](https://nixos.org), [nix-darwin](https://github.com/nix-darwin/nix-darwin), and [home-manager](https://github.com/nix-community/home-manager).

## Organisation

| File                                                                 | Purpose                                              |
| :------------------------------------------------------------------- | :----------------------------------------------------|
| [flake.nix](flake.nix)                                               | Entrypoint.                                          |
| [hosts/](hosts/)                                                     | Host configs.                                        |
| [hosts/nexus/default.nix](hosts/nexus/default.nix)                   | Host entrypoint.                                     |
| [hosts/nexus/home.nix](hosts/nexus/home.nix)                         | Host configuration.                                  |
| [modules/](modules)                                                  | Common functionality.                                |
| [modules/home-manager/default.nix](modules/home-manager/default.nix) | Home Manager initialisation.                         |
| [modules/home-manager/programs/](modules/home-manager/programs/)     | Common application configuration.                    |
| [modules/nix/default.nix](modules/nix/defaalt.nix)                   | Nix configuration.                                   |
| [modules/nix-darwin/default.nix](modules/nix-darwin/default.nix)     | Common macOS [defaults](https://macos-defaults.com). |

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
nix run nix-darwin/nix-darwin-25.05#darwin-rebuild -- switch --flake github:cameronyule/dotfiles
```

Apply the configuration for the first time from a local working copy:

```shell
nix run nix-darwin/nix-darwin-25.05#darwin-rebuild -- switch --flake .
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

### Package Upgrades

The versions of packages available is determined by the version of [Nixpkgs](https://github.com/NixOS/nixpkgs) used. [Flakes](https://zero-to-nix.com/concepts/flakes/) lock all inputs by default so Nixpkgs is always locked to a specific revision. See [flake.lock](flake.lock) to determine which revision I'm currently using. This is the same as pinning all package versions to a specific point in time, which I find preferable for stability.

While it is possible to upgrade a specific package in isolation – e.g., by adding a duplicate Nixpkgs input and locking that to the desired revision – the more frequent usecase is upgrading all outdated packages. There's no built-in equivalent of `brew outdated` in nix-darwin, but we can achieve the same results with [nvd](https://sr.ht/~khumba/nvd/).

``` shell
# update nixpkgs to the latest revision
nix flake update nixpkgs

# build (but not use) the closure for our flake
sudo darwin-rebuild build --flake .

# diff the updated closure against the installed closure
nix run nixpkgs#nvd -- diff /run/current-system result
```

This will yield a diff showing the versions currently installed and which would be installed:

``` shell
❯ nix run nixpkgs#nvd -- diff /run/current-system result
Version changes:
[U.]  #01  bash-language-server                  5.4.0 -> 5.6.0
[U.]  #02  bc                                    1.08.1 -> 1.08.2
… etc …
Closure size: 636 -> 628 (619 paths added, 627 paths removed, delta -8, disk usage +150.7MiB).
```

### Uninstall

1. Uninstall [nix-darwin](https://github.com/nix-darwin/nix-darwin?tab=readme-ov-file#uninstalling).
2. Uninstall [Homebrew](https://docs.brew.sh/FAQ#how-do-i-uninstall-homebrew).
3. Uninstall [Nix](https://github.com/DeterminateSystems/nix-installer?tab=readme-ov-file#uninstalling).

NB: This will not undo any of the configuration changes that have been applied to the system(s) under management. See [rollback](#rollback) for reverting state prior to uninstalling.

## Development

### Roadmap

See [issues](https://github.com/cameronyule/dotfiles/issues) for further information.

### Formatting

Run [nix fmt](https://nix.dev/manual/nix/2.24/command-ref/new-cli/nix3-fmt), which executes the [treefmt configuration](internal/nix/treefmt.nix):

``` shell
nix fmt
```

### Linting

Run [nix flake check](https://nix.dev/manual/nix/2.24/command-ref/new-cli/nix3-flake-check), which executes the [treefmt configuration](internal/nix/treefmt.nix):

```shell
nix flake check
```
