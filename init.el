; using configuration from https://github.com/technomancy/emacs-starter-kit/
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
                      haml-mode)
  "A list of packages to ensure are installed at launch.")
(set-face-attribute 'default nil :height 130)

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message t)
(setq linum-format "%4d " )
(menu-bar-mode t)
(global-linum-mode t)
(setq-default show-trailing-whitespace t)

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(custom-enabled-themes (quote (tango)))
 '(safe-local-variable-values (quote ((encoding . utf-8) (whitespace-line-column . 80) (lexical-binding . t))))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(transient-mark-mode t)

(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)
