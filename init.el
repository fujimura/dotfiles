; using configuration from https://github.com/technomancy/emacs-starter-kit/
(add-to-list 'load-path "~/.emacs.d/")
(setenv "LANG" nil)
(setenv "LC_ALL" nil)
(setenv "LC_CTYPE" nil)
(setenv "LC_MESSAGES" nil)
(setenv "LC_TIME" nil)
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit
                      starter-kit-lisp
                      starter-kit-ruby
                      starter-kit-js
                      starter-kit-eshell
                      yaml-mode
                      haml-mode
                      slim-mode
                      scss-mode
                      haskell-mode
                      coffee-mode
                      markdown-mode
                      git-commit
                      ghc)
"A list of packages to ensure are installed at launch.")
(set-face-attribute 'default nil :height 140)

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(setq-default tab-always-indent t)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message t)
(setq linum-format "%4d " )
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

(global-linum-mode t)
(setq-default show-trailing-whitespace t)

(require 'yaml-mode)
(require 'coffee-mode)
(require 'slim-mode)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode t)
 '(safe-local-variable-values (quote ((encoding . utf-8) (whitespace-line-column . 80) (lexical-binding . t))))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(vc-follow-symlinks t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(transient-mark-mode t)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)

(global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "'") 'skeleton-pair-insert-maybe)
(global-visual-line-mode 1) ; 1 for on, 0 for off.
(setq line-spacing 3)
(setq skeleton-pair 1)

(setq ghc-module-command "~/Library/Haskell/bin/ghc-mod")
(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

(if (window-system)
    (progn (create-fontset-from-ascii-font "Monaco-14:weight=normal:slant=normal" nil "menlokakugo")
           (set-fontset-font "fontset-menlokakugo"
                             'unicode
                             (font-spec :family "Hiragino Kaku Gothic ProN" :size 14)
                             nil
                             'append)
           (add-to-list 'default-frame-alist '(font . "fontset-menlokakugo"))))
(setq hl-line-mode -1)

