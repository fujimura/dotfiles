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

(defvar my-packages '(yaml-mode
                      haml-mode
                      slim-mode
                      scss-mode
                      haskell-mode
                      coffee-mode
                      markdown-mode
                      clojure-mode
                      git-commit
                      ghc
                      ido-ubiquitous
                      undo-tree
                      ido-yes-or-no))

;; Ido
(ido-mode t)
(ido-ubiquitous t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-auto-merge-work-directories-length nil
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-use-virtual-buffers t
      ido-handle-duplicate-virtual-buffers 2
      ido-max-prospects 10)

;; Install packages unless installed
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(global-auto-revert-mode 1)
(global-linum-mode t)
(global-visual-line-mode 1) ; 1 for on, 0 for off.
(set-face-attribute 'default nil :height 140)
(delete-selection-mode t)
(transient-mark-mode t)

(require 'hl-line)
(set-face-background 'hl-line "black")

(setq-default tab-always-indent t)
(setq-default show-trailing-whitespace t)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message t)
(setq linum-format "%4d " )
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq line-spacing 3)
(setq skeleton-pair 1)
(setq menu-bar-mode nil)

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

;; auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)

;; Parentheses Completion
(global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "'") 'skeleton-pair-insert-maybe)

;; Ruby
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.thor$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.watchr$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Thorfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))

;; Haskell
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(setq ghc-module-command "~/Library/Haskell/bin/ghc-mod")
(setq exec-path (cons "~/Library/Haskell/bin" exec-path))
(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda ()
                               (ghc-init)
                               (auto-complete-mode)
                               (flymake-mode)
                               (set-face-background 'flymake-warnline nil)))

