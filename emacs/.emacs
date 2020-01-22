;; INSTALL USE-PACKAGE

;; need the package package in order to install the better use-package
(require 'package)
(setq package-enable-at-startup nil) ;; faster startup

;; add package archives
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

;; GENERAL EDITOR STUFF

;; font
(set-face-attribute 'default nil :font "Droid Sans Mono")

;; better defaults
(use-package better-defaults
  :ensure t)

;;scroll window up/down by one line
(global-set-key (kbd "M-n") (kbd "C-u 1 C-v"))
(global-set-key (kbd "M-p") (kbd "C-u 1 M-v"))

;; turn on line numbering
;(global-display-line-numbers-mode)
;(setq display-line-numbers-type 'relative)

;; GIT STUFF

;; use magit with C-x g or M-x magit-status
(use-package magit
  :ensure t)

;; ORG MODE

;; some org mode settings
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(with-eval-after-load 'org
  ;; default to visual line mode
  (add-hook 'org-mode-hook #'visual-line-mode))

;; CALENDAR / AGENDA MODE

(setq diary-file '"~/Dropbox/Personal/diary")
(setq calendar-date-style 'european)

;; nicer unicode bullets (rubbish with monofur)
;(use-package org-bullets
;  :ensure t
;  :after org
;  :config
;  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("2b9dc43b786e36f68a9fd4b36dd050509a0e32fe3b0a803310661edb7402b8b6" default)))
 '(package-selected-packages (quote (gruvbox-theme use-package magit better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
