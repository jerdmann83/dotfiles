;set up repos
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://milkbox.org/packages/") t)
(package-initialize)

(defun install-my-packages ()
  (interactive)
  (when (not package-archive-contents)
    (package-refresh-contents))
  (dolist (p '(ac-python
               auto-complete
               flycheck
               pyflakes
               paredit
               projectile
               color-theme-sanityinc-tomorrow))
    (when (not (package-installed-p p))
      (package-install p))))

(fset 'yes-or-no-p 'y-or-n-p)
(setq-default highlight-tabs t)
(show-paren-mode t)
(setq mouse-yank-at-point t)
(setq-default indent-tabs-mode nil)
(global-auto-revert-mode t)

(setq auto-save-default nil)
(setq make-backup-files nil)
(setq backup-inhibited t)
(setq vc-follow-symlinks 1)
(setq require-final-newline t)
(xterm-mouse-mode 1)

(setq inhibit-startup-screen 1)
(menu-bar-mode -1)
(tool-bar-mode -1)

(setq flycheck-flake8rc "~/.config/flake8")

(setq ruby-indent-level 4)

(setenv "PAGER" "cat")

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching 1)

(require 'projectile)
(projectile-global-mode)

(setq custom-safe-themes t)
(if (display-graphic-p)
    (progn
      (color-theme-sanityinc-tomorrow-night)
      (set-frame-font "DejaVu Sans Mono")
      (set-face-attribute 'default nil :height 108)))

(setq tramp-default-method "ssh")

;key bindings
(global-set-key (kbd "<RET>") 'newline-and-indent)
(global-set-key (kbd "M-/") 'hippie-expand)
