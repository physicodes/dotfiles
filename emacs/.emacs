;; INSTALL USE-PACKAGE

;; need the package package in order to install the better use-package
(require 'package)

;; can't remember why this line is in here, no obvious effect
;; (setq package-enable-at-startup nil)

;; add package archives ** I MADE HTTP -> HTTPS, MAY BREAK STUFF **
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; initialise package package
(package-initialize)

;; automagically install use-package if not already installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; use the use-package package
(eval-when-compile
  (require 'use-package))

;; CUSTOM VARIABLES

;; who knows what this is really for, anyway emacs requires it so here it is
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (pyvenv flycheck cython-mode company company-mode material-theme exec-path-from-shell virtualenvwrapper evil-magit evil-org org-bullets magit linum-relative better-defaults evil-ledger ledger-mode evil use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; GENERAL EDITOR STUFF

;; hide the startup message
;;  will re-enable when I figure out how to unset C-j for interactive lisp

;; set font size
(if (eq system-type 'darwin)
    ((set-face-attribute 'default nil :height 140) ;; 14pt if on Mac OS
    (setq inhibit-startup-message t))              ;; and hide ugly startup
    (set-face-attribute 'default nil :height 120)) ;; 12pt if on anything else

;; better defaults
(use-package better-defaults
  :ensure t)

;; evil mode (just in case)
(use-package evil
  :ensure t)

;; turn on line numbering
(global-linum-mode)

;; color theme
(use-package material-theme
:ensure t)

(defun load-material-theme (frame)
(select-frame frame)
(load-theme 'material t))

(if (daemonp)
  (add-hook 'after-make-frame-functions #'load-material-theme)
(load-theme 'material t))

;; Uses correct path in emacs (normally broken in OS X)
(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

;; movement between frames
;; (global-set-key (kbd "C-h") 'windmove-left)
;; (global-set-key (kbd "C-l") 'windmove-right)
;; (global-set-key (kbd "C-k") 'windmove-up)
;; (global-set-key (kbd "C-j") 'windmove-down)

;; GIT STUFF

;; use magit with M-x magit-status
(use-package magit
  :ensure t)

;; COMPANY MODE

;; use company mode globally
(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-idle-delay 0) ; no delay in suggestions
  (setq company-minimum-prefix-length 1) ; suggestions after first char
  (setq company-selection-wrap-around t)) ; wrap list

;; SYNTAX CHECKING

(use-package flycheck
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

;; ORG MODE

;; some org mode settings
(with-eval-after-load 'org
  ;; default to visual line mode
  (add-hook 'org-mode-hook #'visual-line-mode)
  ;; fix cycling in terminal
  (add-hook 'org-mode-hook (lambda () (define-key evil-normal-state-map (kbd "TAB") 'org-cycle))))

;; nicer unicode bullets
(use-package org-bullets
  :ensure t
  :after org
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; LEDGER

(use-package ledger-mode
  :ensure t)

;; PYTHON

(use-package cython-mode
  :ensure t)

;; define function which will send whole buffer to shell
(defun python-shell-send-whole-buffer ()
  (interactive)
  (let ((current-prefix-arg 4)) ;; emulate C-u
    (call-interactively 'python-shell-send-buffer))) ;; emulate C-c C-c

;; C-c r to run python script
(use-package python
  :config
  (define-key python-mode-map (kbd "C-c r") 'python-shell-send-whole-buffer)
  (setq python-shell-interpreter "python3"))

(use-package pyvenv
  :ensure t)

;; LATEX

(use-package tex
  :defer t
  :ensure auctex
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t))
