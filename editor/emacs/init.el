;; Remove menu bar and scroll mode
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(desktop-save-mode)

(setq-default custom-file (expand-file-name ".custom.el" user-emacs-directory))
(setq backup-directory-alist '(("" . "~/.emacs.d/backups")))

(when (file-exists-p custom-file)
  (load custom-file))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq-default
 use-package-always-defer t
 use-package-always-ensure t)

(use-package company)

(use-package better-defaults)

(use-package js2-mode)

(setq org-todo-keywords
      '((sequence "TODO(t)" "IN PROGRESS(p)" "|" "DONE(d!)" "CANCELLED(c!)")
	(sequence "DRAFT(d)" "IN ANALISIS(a)" "|" "DONE(d!)")))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)
