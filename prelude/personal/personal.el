;;; package --- Summary
;;; Commentary:

;;; Code:
(defvar default-packages '(pkgbuild-mode
                           markdown-mode
                           sublime-themes
                           which-key)
  "A list of packages to ensure are installed at launch.")

(dolist (p default-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

;; associete PKGBUILD files with pkgbuild-mode
(setq auto-mode-alist (append '(("PKGBUILD$" . pkgbuild-mode)) auto-mode-alist))

;; unpack zipped files in dired
(eval-after-load "dired-aux"
  '(add-to-list 'dired-compress-file-suffixes
                '("\\.zip\\'" ".zip" "unzip")))

;; do not use .Xresources or .Xdefaults
(setq inhibit-x-resources t)

;; use vi-like movement for words
(require 'viper-cmd)
(global-set-key (kbd "M-f") 'viper-forward-word)
(global-set-key (kbd "M-b") 'viper-backward-word)

;; do not add newline when closing file
(setq require-final-newline nil)
(setq mode-require-final-newline nil)

(global-subword-mode)

(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-scroll-amount '(2 ((shift) . 10)))

(setq scroll-conservatively 1000)
(setq scroll-preserve-screen-position t)

;; ui
(menu-bar-mode 0)
(scroll-bar-mode 0)
(setq ring-bell-function 'ignore)
(setq x-underline-at-descent-line t)
(global-hl-line-mode 0)
(set-face-attribute 'default nil
                    :family "Monaco"
                    :height 90
                    :weight 'regular)
(load-theme 'badwolf)

(defun usr/reduce-theme (color)
  "Set some UI elements with given COLOR."
  (progn
    (set-face-background 'default color)
    (set-face-attribute 'fringe nil :background color)
    (set-face-attribute 'linum nil :background color)))

(setq org-directory "~/code/org")
(setq org-default-notes-file (concat org-directory "/notes.org"))

(setq flycheck-highlighting-mode nil)

(global-company-mode)
(global-set-key (kbd "C-c SPC") #'company-complete)

(global-set-key (kbd "C-c M-%") #'anzu-query-replace-at-cursor)

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)

(setq whitespace-style '(face tabs empty trailing))

(global-git-commit-mode)

(which-key-mode)

(which-function-mode 0)
(beacon-mode 0)

(diminish 'which-key-mode)
(diminish 'projectile-mode)
(diminish 'prelude-mode)
(diminish 'company-mode)
(diminish 'subword-mode)
(diminish 'flycheck-mode)

(provide 'personal)
;;; personal.el ends here
