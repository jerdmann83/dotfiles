;set up repos
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://milkbox.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

(defvar my-packages '(auto-complete flycheck inf-ruby nlinum paredit))

(dolist (p my-packages)
    (when (not (package-installed-p p))
          (package-install p)))

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching 1)

;; (desktop-save-mode nil)
;; (setq desktop-save t)
;; (setq desktop-dirname "~")

(linum-mode 1)
(setq custom-safe-themes t)
(fset 'yes-or-no-p 'y-or-n-p)
(setq-default highlight-tabs t)
(show-paren-mode t)
(setq mouse-yank-at-point t)
(setq-default indent-tabs-mode nil)
(global-auto-revert-mode t)

(setq auto-save-default nil)
(setq inhibit-startup-screen 1)
(setq vc-follow-symlinks 1)

(setq kill-whole-line 1)
;shell config
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; (require 'server)
;; (if (server-running-p)
;;   (message "Server already started")
;;   (server-start))

(menu-bar-mode -1)
(tool-bar-mode -1)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(require 'saveplace)
(setq-default save-place t)

(set-frame-font "DejaVu Sans Mono")
(set-face-attribute 'default nil :height 108)

(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)
(setq scroll-step 1)

(setq tramp-default-method "ssh")

(add-hook 'after-init-hook (load-theme 'wombat t))
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(put 'downcase-region 'disabled nil)

;function definitions
(defun my-reindent-buffer ()
  "Reindent entire buffer."
  (interactive)
  (save-excursion
    (mark-whole-buffer)
    (indent-region (region-beginning) (region-end))))

(defun my-replace-string-whole-buffer ()
  "Whole buffer version of replace-string."
  (interactive)
  (save-excursion
    (beginning-of-buffer)
    (call-interactively 'replace-string)))

(defun my-replace-regexp-whole-buffer ()
  "Whole buffer version of replace-regexp."
  (interactive)
  (save-excursion
    (beginning-of-buffer)
    (call-interactively 'replace-regexp)))

(defun my-copy-whole-buffer ()
  "Copy the entire buffer to the clipboard."
  (interactive)
  (save-excursion
    (mark-whole-buffer)
    (copy-region-as-kill (region-beginning) (region-end))))

(defun my-reindent-copy-whole-buffer ()
  "Reindent and copy the whole buffer to the clipboard."
  (interactive)
  (my-reindent-buffer)
  (my-copy-whole-buffer))

(defun my-toggle-ruby-indent ()
  "Toggle the indent for ruby files."
  (interactive)
  (setq ruby-indent-level (if (= ruby-indent-level 2) 4 2)))

(defun my-open-newline ()
  "Open a newline regardless of current position of point."
  (interactive)
  (move-end-of-line nil)
  (newline-and-indent))

;key bindings
(global-set-key (kbd "<RET>") 'newline-and-indent)
(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "C-o") 'my-open-newline)
(global-set-key (kbd "C-c r") 'my-reindent-copy-whole-buffer)
