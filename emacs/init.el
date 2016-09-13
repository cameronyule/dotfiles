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

;; Editorconfig
(editorconfig-mode 1)

;; Exec-path-from-shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; Git-gutter
(require 'git-gutter-fringe)
(global-git-gutter-mode 1)
(custom-set-variables
 '(git-gutter:update-interval 2))

;; Helm
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)

;; Helm-projectile
(helm-projectile-on)

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
;; (global-set-key (kbd "M-x") 'smex)

;; Solarized-theme
(load-theme 'solarized-dark t)

;; Sublimity
(sublimity-mode 1)

;; Undo-tree
(global-undo-tree-mode 1)

;; Web-mode
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss?\\'" . web-mode))

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

;; https://www.emacswiki.org/emacs/RevertBuffer
;; https://www.emacswiki.org/emacs/AutoRevertMode
(global-auto-revert-mode t)

;; Retain minibuffer history between sessions
(savehist-mode 1)

;; Minimalist UI
(menu-bar-mode -1) 
(tool-bar-mode -1)
(toggle-scroll-bar -1)

;; Set default font size
;; The value is in 1/10pt, so 100 will give you 10pt, etc.
(set-face-attribute 'default nil :height 140)

;; Start maximised
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Easier navigation between windows
;; https://www.emacswiki.org/emacs/WindMove
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; Enable useful minor modes
(global-linum-mode 1)
(global-hl-line-mode 1)
(show-paren-mode 1)

;; Allow hash to be entered  
(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))
