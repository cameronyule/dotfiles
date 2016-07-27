;;
;; Using Cask for package management.
;; https://github.com/cask/cask
;;
(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)

;;
;; Plugin configuration
;;

;; Company
(global-company-mode 1)

;; Exec-path-from-shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; Git-gutter
(global-git-gutter-mode 1)

;; Markdown-mode
(setq markdown-command "marked")
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

;; org
;; (global-set-key "\C-cl" 'org-store-link)
;; (global-set-key "\C-ca" 'org-agenda)
;; (global-set-key "\C-cc" 'org-capture)
;; (global-set-key "\C-cb" 'org-iswitchb)
;; (setq org-startup-folded 'content)
;; (require 'ox-md nil t))

;; Powerline
(powerline-default-theme)

;; Projectile
(projectile-global-mode 1)

;; Rainbow-delimiters
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Smex
(global-set-key (kbd "M-x") 'smex)

;; Solarized-theme
(load-theme 'solarized-dark t)

;; Sublimity
(sublimity-mode 1)

;; Undo-tree
(global-undo-tree-mode 1)

;;
;; Default Emacs configuration
;;

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

;; Easier navigation between windows
;; https://www.emacswiki.org/emacs/WindMove
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; Enable useful minor modes
(global-linum-mode 1)
(show-paren-mode 1)

;; https://www.emacswiki.org/emacs/InteractivelyDoThings
(ido-mode 1)
(setq ido-enable-flex-matching t)

;; Allow hash to be entered  
(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))
