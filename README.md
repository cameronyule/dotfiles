# Dotfiles

A semi-automated setup of my macOS environment.

Partially based on Mathias Bynens’ [dotfiles](https://github.com/mathiasbynens/dotfiles).

## Usage

I haven't written a fully automated install script, so installation is currently a multi-step process.

### Base System

```bash
./system/software-update.sh
./system/enable-filevault.sh
./system/configure-defaults.sh
```

### Development Environment

```bash
./xcode/install-clt.sh
./nix/install.sh
./homebrew/install.sh
```

### Applications

```bash
brew bundle --file=homebrew/Brewfile
./system/configure-login-items.sh
```

### Dotfiles

```bash
./shell/install.sh
```

### Optional

```bash
./xcode/install-documentation.sh
```

## Todo

* Base system
  * Configure Energy Saver preferences.
  * Configure Desktop & Screen Saver preferences.
* Applications
  * Email client (i.e. [Airmail](), [Nylas N1](), etc).
* Emacs setup
* Terminal setup
  * Configure command completions.
  * Configure custom prompt.
  * Evaluate other terminal emulators (i.e. [iTerm](https://www.iterm2.com/)).
  * Evaluate other shells (i.e. [zsh](http://www.zsh.org/)).
* Automated install script.
