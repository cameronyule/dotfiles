# Bootstrap

These were the steps required to bootstrap a clean install of macOS 15 (Sequoia) to allow Nix, Nix Darwin and Home Manager to take over the system configuration.

## 1. Install Nix

Using the [Determinate Systems Nix Installer](https://github.com/DeterminateSystems/nix-installer?tab=readme-ov-file#installation). The only reason I chose this installer over the official one is that the Determinate Systems version has a comprehensive uninstaller.

``` shell
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

## 2. Install Homebrew

We'll use nix-darwin to manage [Homebrew](https://brew.sh) on our behalf, to allow for easier installation of GUI applications.

 ``` shell
 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## 3. Create Project Directory

We need somewhere to keep our working files.

``` shell
mkdir -p ~/src/dotfiles
```

## 4. Set hostname

We'll be limiting execution of our setup to specific machines, identified by hostname. This allows for bespoke configuration per machine.

``` shell
sudo scutil --set LocalHostName nexus
dscacheutil -flushcache
sudo shutdown -r now
```

## 5. Setup Nix Darwin

We're using [Nix Flakes](https://zero-to-nix.com/concepts/flakes/), which allow us to deterministically manage our dependencies via `flake.lock` files. Here we create a new Nix Flake based on the [Nix Darwin template](https://github.com/nix-darwin/nix-darwin?tab=readme-ov-file#step-1-creating-flakenix).

``` shell
nix flake init -t nix-darwin
```

### 5.1. Configure Hostname

Set the current machine's hostname in the appropriate place.

``` shell
sed -i '' "s/simple/$(scutil --get LocalHostName)/" flake.nix
```

### 5.2. Install nix-darwin

Ensure nix-darwin is [available in our PATH](https://github.com/nix-darwin/nix-darwin?tab=readme-ov-file#step-2-installing-nix-darwin).

``` shell
nix run nix-darwin -- switch --flake .
```

### 5.3. Apply Nix configuration

Apply the changes specified in our configuration to the current system.

``` shell
darwin-rebuild switch --flake .
```

## 6. Create Home Manager template

Create a default configuration for [Home Manager](https://github.com/nix-community/home-manager).

``` shell
nix run home-manager/master -- init
```
