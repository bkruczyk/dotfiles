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

;;; ui
(menu-bar-mode 0)                                                                       ;; disable menubar
(scroll-bar-mode 0)                                                                     ;; disable scrollbar
(setq ring-bell-function 'ignore)                                                       ;; silent emacs
(setq x-underline-at-descent-line t)                                                    ;; better underline
(global-hl-line-mode 0)                                                                 ;; disable line highlight
(set-face-attribute 'default nil                                                        ;; set font of choice
                    :family "Monaco"
                    :height 90
                    :weight 'regular)

(add-to-list 'custom-theme-load-path
             (expand-file-name "themes" user-emacs-directory))
(load-theme 'dorsey)

(defun usr/reduce-theme (color)
  "Set some UI elements with given COLOR."
  (progn
    (set-face-background 'default color)
    (set-face-attribute 'fringe nil :background color)
    (set-face-attribute 'linum nil :background color)))

;;; org-mode
(setq org-directory "~/code/org")
(setq org-default-notes-file (concat org-directory "/notes.org"))

;; (setq org-clock-continuously t)                                         ;;
;; (setq org-clock-persist 'history)                                       ;; persistent clocking
;; (org-clock-persistence-insinuate)                                       ;;

;;; company-mode
(global-company-mode)
(global-set-key (kbd "C-c c") #'company-complete)

;;; anzu-mode
(global-set-key (kbd "C-c M-%") #'anzu-query-replace-at-cursor)

;;; web-mode
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)

;;; whitespace-mode
(setq whitespace-style '(face tabs empty trailing))

;;; git
(global-git-commit-mode)

;;; which-key
(which-key-mode)

(provide 'personal)
;;; personal.el ends here
