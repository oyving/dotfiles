;; -*- mode: lisp -*-

;; require some core modules
(require 'cl)
(require 'package)

;; load the customize file
(load-file "~/.emacs.d/custom.el")

;; add the package repository
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(defun package-ensure-installed (package)
  (unless (package-installed-p package)
    (package-install package)))

(package-ensure-installed 'slime)


;; turn off some of the more annoying features appearing after Emacs 21
(when (>= emacs-major-version 21)
  (setf (default-value 'cursor-in-non-selected-windows) nil)
  (global-set-key [home] 'beginning-of-buffer)
  (global-set-key [end]  'end-of-buffer)
  (blink-cursor-mode 0)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (if (featurep 'tooltip)
      (tooltip-mode -1)))

;; we want marking of parens
(show-paren-mode t)

;; colorize in editing modes
(global-font-lock-mode t)

;; remove irritating UI elements
(menu-bar-mode -1)

;; show columns as well as lines
(column-number-mode t)

;; lazy typist, y or n instead of yes or no
(defalias 'yes-or-no-p 'y-or-n-p)

;; we want ido-mode for finding files
(ido-mode t)
(setq ido-enable-flex-matching t)

;; we do not want "magic" handling of tabs
(setf indent-tabs-mode nil)

;; ensure UTF-8
(set-language-environment "UTF-8")

;; get custom configuration into a different file
(setq custom-file (expand-file-name "~/.emacs.d/custom.el"))

;; keep backup files from littering the file system
(setf backup-directory-alist '(("." . "~/.emacs.d/backup")))

;; use org-mode for .org files
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;; start the emacs server
(server-start)
