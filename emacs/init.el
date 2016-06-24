(package-initialize)

;; Package source configuration.
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

;; Package configuration.

;; https://github.com/clojure-emacs/cider
(use-package cider
  :ensure t
  :pin melpa)

;; https://company-mode.github.io/
(use-package company
  :ensure t
  :pin melpa)

;; https://github.com/clojure-emacs/clj-refactor.el
(use-package clj-refactor
  :ensure t
  :pin melpa)

;; https://github.com/bbatsov/solarized-emacs
(use-package solarized-theme
  :ensure t
  :pin melpa)

;; Unsure why this is necessary, as it should be picking up my system PATH.
;; TODO: Investigate.
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

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

;; Select theme
(load-theme 'solarized-dark t)

;; Enable useful minor modes
(global-linum-mode 1)
(ido-mode 1)
(show-paren-mode 1)
(global-company-mode 1)

;; Hooks
;; (add-hook 'after-init-hook 'global-company-mode)
