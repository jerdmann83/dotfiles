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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("0e121ff9bef6937edad8dfcff7d88ac9219b5b4f1570fd1702e546a80dba0832" "bd115791a5ac6058164193164fd1245ac9dc97207783eae036f0bfc9ad9670e0" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
