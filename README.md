# Dotfiles

A semi-automated setup of my macOS environment.

Partially based on Mathias Bynens’ [dotfiles](https://github.com/mathiasbynens/dotfiles).

## Usage

I haven't written a fully automated install script, so installation is currently a multi-step process.

### Base System

```bash
./system/configure-defaults.sh
```

### Development Environment

```bash
./xcode/install-clt.sh
./homebrew/install.sh
```

### Applications

```bash
brew bundle --file=homebrew/Brewfile-base
./system/configure-dock.sh
```

### Dotfiles

```bash
./shell/install-dotfiles.sh
./shell/configure-bash.sh
```
### Emacs

```bash
./emacs/install.sh
```

