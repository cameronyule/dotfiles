(require 'package)

;; Package source configuration.
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Package configuration.

;; https://github.com/clojure-emacs/cider
(use-package cider
  :ensure t
  :pin melpa)

;; https://company-mode.github.io/
(use-package company
  :ensure t
  :pin melpa
  :config
  (global-company-mode 1))

;; https://github.com/clojure-emacs/clj-refactor.el
(use-package clj-refactor
  :ensure t
  :pin melpa)

;; https://github.com/purcell/exec-path-from-shell
(use-package exec-path-from-shell
  :ensure t
  :pin melpa)

;; https://github.com/syohex/emacs-git-gutter
(use-package git-gutter
  :ensure t
  :pin melpa
  :config
  (global-git-gutter-mode 1))

;; https://github.com/magit/magit
(use-package magit
  :ensure t
  :pin melpa)

;; https://github.com/bbatsov/projectile
(use-package projectile
  :ensure t
  :pin melpa
  :config
  (projectile-global-mode 1))

;; https://github.com/Fanael/rainbow-delimiters
(use-package rainbow-delimiters
  :ensure t
  :pin melpa)

;; https://github.com/nonsequitur/smex
(use-package smex
  :ensure t
  :pin melpa)

;; https://github.com/bbatsov/solarized-emacs
(use-package solarized-theme
  :ensure t
  :pin melpa
  :config
  (load-theme 'solarized-dark t))

;; https://github.com/zk-phi/sublimity
(use-package sublimity
  :ensure t
  :pin melpa
  :config
  (sublimity-mode 1))

;; https://melpa.org/#/undo-tree
(use-package undo-tree
  :ensure t
  :pin melpa
  :config
  (global-undo-tree-mode 1))

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; Keep any customize declarations separately. 
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Turn off startup screen
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; Disable junk files
(setq auto-save-default nil)
(setq make-backup-files nil)

;; Retain minibuffer history between sessions
(savehist-mode 1)

;; Minimalist UI
(menu-bar-mode -1) 
(tool-bar-mode -1)
(toggle-scroll-bar -1)

;; Start maximised
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Enable useful minor modes
(global-linum-mode 1)
(show-paren-mode 1)

;; https://www.emacswiki.org/emacs/InteractivelyDoThings
(ido-mode 1)
(setq ido-enable-flex-matching t)
