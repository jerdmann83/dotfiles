;grab any packages we're missing
;; (require 'package)
;; (add-to-list 'package-archives
;;   '("marmalade" . "http://marmalade-repo.org/"))

;; (when (not package-archive-contents)
;;     (package-refresh-contents))

;; (defvar my-packages '(marmalade auto-complete flycheck inf-ruby
;;                                 paredit sublime-themes))
;; (dolist (p my-packages)
;;     (when (not (package-installed-p p))
;;           (package-install p)))

;start main config
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching 1)

(setq custom-safe-themes t)
(fset 'yes-or-no-p 'y-or-n-p)
(setq-default highlight-tabs t)
(show-paren-mode t)
(setq mouse-yank-at-point t)
(setq-default indent-tabs-mode nil)
(global-auto-revert-mode t)

(setq backup-directory-alist '(("~/backups")))
(setq inhibit-startup-screen 1)
(setq vc-follow-symlinks 1)

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
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
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

;key bindings
(global-set-key (kbd "<RET>") 'newline-and-indent)
(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "C-a") 'beginning-of-line-text)
(global-set-key (kbd "C-c C-c") 'my-reindent-copy-whole-buffer)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-l") 'kill-whole-line)
