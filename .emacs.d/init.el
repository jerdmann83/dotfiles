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

(add-hook 'after-init-hook 'my-after-init-hook)
(defun my-after-init-hook ()
  (load-theme 'deeper-blue t)
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("2b5aa66b7d5be41b18cc67f3286ae664134b95ccc4a86c9339c886dfd736132d" "1e194b1010c026b1401146e24a85e4b7c545276845fc38b8c4b371c8338172ad" "ad9fc392386f4859d28fe4ef3803585b51557838dbc072762117adad37e83585" "8fd393097ac6eabfcb172f656d781866beec05f27920a0691e8772aa2cdc7132" "8dd5991bf912b39dc4ae77e2d6aa4882949f4441570222eaf25e07ec38c44d50" "3b819bba57a676edf6e4881bd38c777f96d1aa3b3b5bc21d8266fa5b0d0f1ebf" "769bb56fb9fd7e73459dcdbbfbae1f13e734cdde3cf82f06a067439568cdaa95" "dd43c9f997208c61ce0f4855932cc20a57ae2f37fe2ced218dace5c8c321d1e8" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "53e29ea3d0251198924328fd943d6ead860e9f47af8d22f0b764d11168455a8e" "0e121ff9bef6937edad8dfcff7d88ac9219b5b4f1570fd1702e546a80dba0832" "8b231ba3e5f61c2bb1bc3a2d84cbd16ea17ca13395653566d4dfbb11feaf8567" "60f04e478dedc16397353fb9f33f0d895ea3dab4f581307fbf0aa2f07e658a40" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(put 'downcase-region 'disabled nil)
