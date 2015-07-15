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

(show-paren-mode t)
(fset 'yes-or-no-p 'y-or-n-p)
(setq vc-follow-symlinks 1)
(setq require-final-newline t)

(setq-default highlight-tabs t)
(setq-default indent-tabs-mode nil)
(global-auto-revert-mode t)
(setq fill-column 100)
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
(add-hook 'python-mode-hook (lambda ()
                              (flycheck-mode 1)))

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

(if (display-graphic-p)
    (progn
      (add-to-list 'default-frame-alist '(font . "Dejavu Sans Mono-10.5"))
      (set-face-attribute 'default t :font "Dejavu Sans Mono-10.5")
      (ample-theme)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector (vector "#eaeaea" "#d54e53" "#b9ca4a" "#e7c547" "#7aa6da" "#c397d8" "#70c0b1" "#000000"))
 '(custom-safe-themes 't)
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
