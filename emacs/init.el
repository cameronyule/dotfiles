(require 'package)

;; Package source configuration.
(setq
 package-archives
 '(("melpa-stable" . "http://stable.melpa.org/packages/")
   ("melpa"        . "https://melpa.org/packages/")
   ("org"          . "http://orgmode.org/elpa/")
   ("gnu"          . "https://elpa.gnu.org/packages/")))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Workaround use-package's inability to replace built-in packages such as org.
;; https://github.com/jwiegley/use-package/issues/319#issuecomment-185979556
(defun package-from-archive (f &rest args)
  (and (apply f args)
       (assq (car args) package-alist)))
(advice-add 'package-installed-p :around 'package-from-archive)

;; Package configuration.
;; TODO: Bootstrap the install of use-package itself.

;; https://company-mode.github.io/
(use-package company
  :ensure t
  :pin melpa
  :config
  (global-company-mode 1))

;; https://github.com/purcell/exec-path-from-shell
(use-package exec-path-from-shell
  :ensure t
  :pin melpa
  :config
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize)))

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

(use-package org
  :ensure t
  :pin org
  :bind (("C-c l" . org-store-link)
         ("C-c c" . org-capture)
         ("C-c a" . org-agenda)
         :map org-mode-map)
  :mode ("\\.org$" . org-mode)
  :init
  (setq org-startup-folded 'content)
  :config
  (require 'ox-md nil t))

;; https://github.com/larstvei/ox-gfm
(use-package ox-gfm
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
  :init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  :ensure t
  :pin melpa)

;; https://github.com/nonsequitur/smex
(use-package smex
  :ensure t
  :pin melpa
  :config
  (global-set-key (kbd "M-x") 'smex))

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

;; Allow hash to be entered  
(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))
