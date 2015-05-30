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
  (dolist (p '(ac-python
               auto-complete
               flycheck
               pyflakes
               paredit
               projectile))
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
(tool-bar-mode -1)
(menu-bar-mode -1)

(setq flycheck-flake8rc "~/.config/flake8")

(setq ruby-indent-level 4)

(setenv "PAGER" "cat")

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching 1)


;key bindings
(global-set-key (kbd "<RET>") 'newline-and-indent)
(define-key global-map [C-tab] 'indent-region)
(define-key global-map "\t" 'dabbrev-expand)


;huge thanks to Casey from handmadehero for the below
(if (display-graphic-p)
    (progn
      (add-to-list 'default-frame-alist '(font . "Liberation Mono-11"))
      (set-face-attribute 'default t :font "Liberation Mono-11")))
(set-face-attribute 'font-lock-builtin-face nil :foreground "gold")
(set-face-attribute 'font-lock-comment-face nil :foreground "gray50")
(set-face-attribute 'font-lock-constant-face nil :foreground "olive drab")
(set-face-attribute 'font-lock-doc-face nil :foreground "gray50")
(set-face-attribute 'font-lock-function-name-face nil :foreground "chartreuse3")
(set-face-attribute 'font-lock-keyword-face nil :foreground "DarkGoldenrod3")
(set-face-attribute 'font-lock-string-face nil :foreground "burlywood")
(set-face-attribute 'font-lock-type-face nil :foreground "white smoke")
(set-face-attribute 'font-lock-variable-name-face nil :foreground "SpringGreen2")
(set-face-attribute 'minibuffer-prompt nil :foreground "cyan")

(defun post-load-stuff ()
  (interactive)
  (menu-bar-mode -1)
  (set-foreground-color "white smoke")
  (set-background-color "gray7")
  (set-cursor-color "lime green")
)
(add-hook 'window-setup-hook 'post-load-stuff t)
