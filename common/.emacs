(show-paren-mode t)
(fset 'yes-or-no-p 'y-or-n-p)
(setq vc-follow-symlinks 1)
(setq require-final-newline t)

(setq-default highlight-tabs t)
(setq-default indent-tabs-mode nil)
(global-auto-revert-mode t)
(setq ruby-indent-level 4)

(setq auto-save-default nil)
(setq make-backup-files nil)
(setq backup-inhibited t)
(xterm-mouse-mode 1)
(setq mouse-yank-at-point t)

(setq inhibit-startup-screen 1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(column-number-mode)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching 1)

(setq grep-command "grep -nHR -e ")

;key bindings
(global-set-key (kbd "<RET>") 'newline-and-indent)
(global-set-key (kbd "C-b") 'ido-switch-buffer)
(global-set-key (kbd "C-o") 'other-window)
(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "C-n") 'dabbrev-expand)
(global-set-key (kbd "C-p") 'find-dired)
(global-set-key (kbd "M-s") 'save-buffer)
(global-set-key (kbd "M-r") 'revert-buffer)

(if (display-graphic-p)
    (progn
      (add-to-list 'default-frame-alist '(font . "Liberation Mono-10.5"))
      (set-face-attribute 'default t :font "Liberation Mono-10.5")
      (load-theme 'tango-dark)))

;flymake config for running pyflakes
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "pyflakes" (list local-file))))

  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pyflakes-init)))

(add-hook 'find-file-hook 'flymake-find-file-hook)

;set up repos
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))
(package-initialize)

(defun install-my-packages ()
  (interactive)
  (when (not package-archive-contents)
    (package-refresh-contents))
  (dolist (p '(flycheck
               pyflakes))
    (when (not (package-installed-p p))
      (package-install p))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector (vector "#eaeaea" "#d54e53" "#b9ca4a" "#e7c547" "#7aa6da" "#c397d8" "#70c0b1" "#000000"))
 '(custom-safe-themes (quote ("1177fe4645eb8db34ee151ce45518e47cc4595c3e72c55dc07df03ab353ad132" "90d329edc17c6f4e43dbc67709067ccd6c0a3caa355f305de2041755986548f2" "7b4d9b8a6ada8e24ac9eecd057093b0572d7008dbd912328231d0cada776065a" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "b8b5c353e73470377f2111fddb0ea652d35ce98e0a27a5c592d2ab9f66855106" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(fci-rule-color "#2a2a2a")
 '(linum-format " %7i ")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map (quote ((20 . "#d54e53") (40 . "#e78c45") (60 . "#e7c547") (80 . "#b9ca4a") (100 . "#70c0b1") (120 . "#7aa6da") (140 . "#c397d8") (160 . "#d54e53") (180 . "#e78c45") (200 . "#e7c547") (220 . "#b9ca4a") (240 . "#70c0b1") (260 . "#7aa6da") (280 . "#c397d8") (300 . "#d54e53") (320 . "#e78c45") (340 . "#e7c547") (360 . "#b9ca4a"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
