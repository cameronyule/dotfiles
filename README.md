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
./homebrew/install.sh
```

### Applications

```bash
brew bundle --file=homebrew/Brewfile
./system/configure-login-items.sh
```

### Dotfiles

```bash
./shell/install-dotfiles.sh
./shell/configure-bash.sh
```

### Optional

```bash
./xcode/install-documentation.sh
```

## Todo

* Base system
  * Configure Energy Saver preferences.
  * Configure Desktop & Screen Saver preferences.
* Emacs setup
  * Default [font size](https://www.emacswiki.org/emacs/SetFonts).
  * Emacs.app [macOS specific configuration](https://www.emacswiki.org/emacs/EmacsApp).
  * Evaluate [cyberpunk-theme](https://github.com/n3mo/cyberpunk-theme.el).
  * Auto-setup of package.el dependencies.
  * Git gutter.
  * Markdown mode.
  * Project configuration.
  * Auto-completion ([company-mode](https://company-mode.github.io/), [emacs-ycmd](https://github.com/abingham/emacs-ycmd)).
* Terminal setup
  * Configure custom prompt.
  * Evaluate other terminal emulators (i.e. [iTerm](https://www.iterm2.com/)).
  * Evaluate other shells (i.e. [zsh](http://www.zsh.org/)).
* Automated install script.
