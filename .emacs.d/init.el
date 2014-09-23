(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching 1)

(fset 'yes-or-no-p 'y-or-n-p)
(setq-default highlight-tabs t)
(show-paren-mode t)
(setq mouse-yank-at-point t)
(setq-default indent-tabs-mode nil)
(global-auto-revert-mode t)

(setq backup-directory-alist '(("~/backups")))
(setq inhibit-startup-screen 1)
(setq vc-follow-symlinks 1)

(require 'server)
(if (server-running-p)
  (message "Server already started")
  (server-start))

(menu-bar-mode -1)
(tool-bar-mode -1)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(require 'saveplace)
(setq-default save-place t)

(global-set-key (kbd "M-/") 'hippie-expand)

(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

(set-frame-font "DejaVu Sans Mono")
(set-face-attribute 'default nil :height 108)

(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)
(setq scroll-step 1)

(global-set-key (kbd "<RET>") 'newline-and-indent)
(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "C-a") 'beginning-of-line-text)

(setq tramp-default-method "ssh")

(add-hook 'after-init-hook (load-theme 'deeper-blue t))
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)

(put 'downcase-region 'disabled nil)
