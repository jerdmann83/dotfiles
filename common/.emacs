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

;huge thanks to Casey from handmadehero for inspiring the below
(if (display-graphic-p)
    (progn
      (add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-10.5"))
      (set-face-attribute 'default t :font "DejaVu Sans Mono-10.5")))

(set-face-attribute 'font-lock-builtin-face nil :foreground "gold")
(set-face-attribute 'font-lock-comment-face nil :foreground "gray50")
(set-face-attribute 'font-lock-constant-face nil :foreground "DarkOrange1")
(set-face-attribute 'font-lock-doc-face nil :foreground "gray50")
(set-face-attribute 'font-lock-function-name-face nil :foreground "chartreuse3")
(set-face-attribute 'font-lock-keyword-face nil :foreground "red1")
(set-face-attribute 'font-lock-string-face nil :foreground "burlywood")
(set-face-attribute 'font-lock-type-face nil :foreground "white smoke")
(set-face-attribute 'font-lock-variable-name-face nil :foreground "white smoke")
(set-face-attribute 'isearch nil :background "DarkOrange1")
(set-face-attribute 'lazy-highlight nil :background "midnight blue")
(set-face-attribute 'region nil :background "midnight blue")
(set-face-attribute 'minibuffer-prompt nil :foreground "cyan")

(defun post-load-stuff ()
  (interactive)
  (set-foreground-color "white smoke")
  (set-background-color "gray7")
  (set-cursor-color "lime green")
)
(add-hook 'window-setup-hook 'post-load-stuff t)

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
