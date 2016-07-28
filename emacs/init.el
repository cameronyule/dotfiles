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

;; Flycheck
(global-flycheck-mode)
;; (setq-default flycheck-temp-prefix ".flycheck")
;; (setq-default flycheck-disabled-checkers
;; 	      (append flycheck-disabled-checkers
;; 		      '(javascript-jshint)))
;; (setq-default flycheck-disabled-checkers
;; 	      (append flycheck-disabled-checkers
;; 		      '(json-jsonlist)))
;; (flycheck-add-mode 'javascript-eslint 'web-mode)

;; Git-gutter
(global-git-gutter-mode 1)

;; Helm
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)

;; Helm-projectile
(helm-projectile-on)

;; js2-mode
;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;; (add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-jsx-mode))

;; json-mode
;; (add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))

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
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss?\\'" . web-mode))

(defun my-web-mode-hook ()
  "Hooks for Web mode. Adjust indents"
  ;;; http://web-mode.org/
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))
(add-hook 'web-mode-hook  'my-web-mode-hook)

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
;;(ido-mode 1)
;; (setq ido-enable-flex-matching t)

;; Allow hash to be entered  
(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))
