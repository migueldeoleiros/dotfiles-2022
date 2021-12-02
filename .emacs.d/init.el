;;; STARTUP
;; Minimize garbage collection during startup
(setq gc-cons-threshold most-positive-fixnum)

;; Lower threshold to speed up garbage collection
(add-hook 'emacs-statup-hook
          (lambda()
            (setq gc-cons-threshold (* 5 1000 1000))))


;;;PACKAGE LIST
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("org" . "https://orgmode.org/elpa/")
        ("elpa" . "https://elpa.gnu.org/packages/")))


;;; BOOTSTRAP USE-PACKAGES
(package-initialize)
(setq use-package-always-ensure t)
(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))
(eval-when-compile (require 'use-package))


;;; PACKAGE UPDATE
(use-package auto-package-update
    :custom
    (auto-package-update-interval 7)
    (auto-package-update-prompt-before-update t)
    (auto-package-update-hide-results t)
    :config
    (auto-package-update-maybe)
    (auto-package-update-at-time "09:00"))


;;; OTHER CONFIG
;; initial buffer
;;(setq initial-buffer-choice (lambda () (dired "~/")))
;;scrolling
(setq redisplay-dont-pause t
  scroll-margin 1
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)

;; set tab to 4
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq c-set-style "k&r")
(setq c-basic-offset 4)

;; autocomplete brackets
(electric-pair-mode t)

;; set custom
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; backup directorie
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
    backup-by-copying t    ; Don't delink hardlinks
    version-control t      ; Use version numbers on backups
    delete-old-versions t  ; Automatically delete excess backups
    kept-new-versions 20   ; how many of the newest versions to keep
    kept-old-versions 5    ; and how many of the old
    )

;;; KEYBINDS
(use-package general
  :after evil
  :config
  (general-create-definer efs/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")

  (efs/leader-keys
    "b" '(switch-to-buffer :which-key "buffer menu")
    "t" '(vterm :which-key "teminal")
    "d" '(dired :which-key "dired")
    "e" '(flycheck-list-errors :which-key "list of errors in file")
    ))

;;; UI
(setq inhibit-startup-message t)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room
(menu-bar-mode -1)            ; Disable the menu bar

;; Set up the visible bell
(setq visible-bell t)

(column-number-mode)
(global-display-line-numbers-mode t)

;; Set frame transparency
(defvar efs/frame-transparency '(80 . 80))
(set-frame-parameter (selected-frame) 'alpha efs/frame-transparency)
(add-to-list 'default-frame-alist `(alpha . ,efs/frame-transparency))
(set-frame-parameter (selected-frame) 'fullscreen 'maximized)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
    (add-hook mode (lambda () (display-line-numbers-mode 0))))

;;modeline
(use-package doom-modeline
    :init (doom-modeline-mode t)
    :custom ((doom-modeline-height 25)))


;;; THEME
(use-package doom-themes
     :init
     (load-theme 'doom-dracula t)
     (set-background-color "black"))

(defun on-after-init ()
    (unless (display-graphic-p (selected-frame))
        (set-face-background 'default "unspecified-bg" (selected-frame))))

(add-hook 'window-setup-hook 'on-after-init)

;;; FONT
(defvar efs/default-font-size 120)
(defvar efs/default-variable-font-size 120)
(set-face-attribute 'default nil :font "SauceCodePro Nerd Font" :height efs/default-font-size)
;; Set the fixed pitch face
(set-face-attribute 'fixed-pitch nil :font "SauceCodePro Nerd Font" :height efs/default-font-size)
;; Set the variable pitch face
(set-face-attribute 'variable-pitch nil :font "Cantarell" :height efs/default-variable-font-size :weight 'regular)


;;; ORG-MODE
(use-package org-bullets
    :hook (org-mode . org-bullets-mode)
    :custom
    (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(defun efs/org-mode-visual-fill ()
    (setq visual-fill-column-width 100 
          visual-fill-column-center-text t)
    (visual-fill-column-mode 1))

(use-package visual-fill-column
    :hook (org-mode . efs/org-mode-visual-fill))

;; better font faces
(defun efs/org-font-setup ()
    ;; Replace list hyphen with dot
    (font-lock-add-keywords 'org-mode 
                            '(("^ *\\([-]\\) " 
                               (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

;; Set faces for heading levels
(dolist (face '((org-level-1 . 1.2)
                (org-level-2 . 1.1)
                (org-level-3 . 1.05)
                (org-level-4 . 1.0)
                (org-level-5 . 1.1)
                (org-level-6 . 1.1)
                (org-level-7 . 1.1)
                (org-level-8 . 1.1)))
    (set-face-attribute (car face) nil :font "Cantarell" :weight 'regular :height (cdr face)))

;; Ensure that anything that should be fixed-pitch in Org files appears that way
(set-face-attribute 'org-block nil    :foreground nil :inherit 'fixed-pitch)
(set-face-attribute 'org-table nil    :inherit 'fixed-pitch)
(set-face-attribute 'org-formula nil  :inherit 'fixed-pitch)
(set-face-attribute 'org-code nil     :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-table nil    :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-checkbox nil  :inherit 'fixed-pitch)
(set-face-attribute 'line-number nil :inherit 'fixed-pitch)
(set-face-attribute 'line-number-current-line nil :inherit 'fixed-pitch))

;; Org babel for code blocks
(with-eval-after-load 'org
  (org-babel-do-load-languages
      'org-babel-load-languages
      '((emacs-lisp . t)
      (python . t)))

  (push '("conf-unix" . conf-unix) org-src-lang-modes))


;;; VIM
(use-package evil
    :demand t
    :bind (("<escape>" . keyboard-escape-quit))
    :init
    ;; allow for using cgn
    ;; (setq evil-search-module 'evil-search)
    (setq evil-want-keybinding nil)
    ;; no vim insert bindings
    (setq evil-undo-system 'undo-fu)
    :config
    (evil-mode t)
    (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
    (define-key evil-normal-state-map "\C-w\C-h" 'evil-window-left)
    (define-key evil-normal-state-map "\C-w\C-j" 'evil-window-down)
    (define-key evil-normal-state-map "\C-w\C-k" 'evil-window-up)
    (define-key evil-normal-state-map "\C-w\C-l" 'evil-window-right)
    (evil-set-initial-state 'messages-buffer-mode 'normal)
    (evil-set-initial-state 'dashboard-mode 'normal))
(use-package evil-collection
    :after evil
    :config
    (setq evil-want-integration t)
    (evil-collection-init))
;; Vim style undo
(use-package undo-fu)
;; Change cursor terminal
(unless (display-graphic-p)
    (use-package evil-terminal-cursor-changer
    :config (evil-terminal-cursor-changer-activate)))

;;; CODE
;;lsp
(defun efs/lsp-mode-setup ()
    (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
    (lsp-headerline-breadcrumb-mode))
(use-package lsp-mode
    :commands (lsp lsp-deferred)
    :hook (lsp-mode . efs/lsp-mode-setup)
    :init
    (setq lsp-keymap-prefix "C-c l")  ;; Or 'C-l', 's-l'
    :config
    (lsp-enable-which-key-integration t))
    (add-hook 'dockerfile-mode-hook #'lsp)
    (add-hook 'java-mode-hook #'lsp)
    (add-hook 'sql-mode-hook #'lsp)
    (add-hook 'c-mode-hook #'lsp)
    (add-hook 'c++-mode-hook #'lsp)
    (add-hook 'cmake-mode-hook #'lsp)
    (add-hook 'bash-mode-hook #'lsp)
    (add-hook 'ocaml-mode-hook #'lsp)
(use-package lsp-ui
    :hook (lsp-mode . lsp-ui-mode)
    :custom
    (lsp-ui-doc-position 'bottom))

;;flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

;;company
(use-package company
    :after lsp-mode
    :hook (lsp-mode . company-mode)
    :bind (:map company-active-map
            ("<tab>" . company-complete-selection))
          (:map lsp-mode-map
            ("<tab>" . company-indent-or-complete-common))
    :custom
    (company-minimum-prefix-length 1)
    (company-idle-delay 0.0))
(use-package company-box
  :hook (company-mode . company-box-mode))


;;LANGUAGES
;;Ocaml
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
(use-package flycheck-ocaml
  :config
  (with-eval-after-load 'merlin
    ;; Disable Merlin's own error checking
    (setq merlin-error-after-save nil)
    ;; Enable Flycheck checker
    (flycheck-ocaml-setup))
  (add-hook 'tuareg-mode-hook #'merlin-mode))

;;Java
(use-package lsp-java
  :config (add-hook 'java-mode-hook 'lsp))
(require 'lsp-java-boot)
;; to enable the lenses
(add-hook 'lsp-mode-hook #'lsp-lens-mode)
(add-hook 'java-mode-hook #'lsp-java-boot-lens-mode)

;;Python
(use-package python-mode
    :ensure t
    :hook (python-mode . lsp-deferred)
    :custom
    ;; NOTE: Set these if Python 3 is called "python3" on your system!
    ;; (python-shell-interpreter "python3")
    ;; (dap-python-executable "python3")
    (dap-python-debugger 'debugpy)
    :config
    (require 'dap-python))
(use-package pyvenv
    :after python-mode
    :config
    (pyvenv-mode 1))


;;; PACKAGES
;;ivy
(use-package ivy 
    :config
    (ivy-mode t)
    (setq ivy-use-virtual-buffers t)
    (setq enable-recursive-minibuffers t))
(use-package ivy-rich
    :after ivy
    :init (ivy-rich-mode t))
(use-package counsel 
    :config (counsel-mode t))
(use-package ivy-prescient
    :after counsel
    :custom
    (ivy-prescient-enable-filtering nil)
    :config
    (prescient-persist-mode t)
    (ivy-prescient-mode t))
(use-package lsp-ivy
    :after lsp)

;;projectile
(use-package projectile
    :diminish projectile-mode
    :config (projectile-mode)
    :custom ((projectile-completion-system 'ivy))
    :bind-keymap
    ("C-c p" . projectile-command-map)
    :init
    ;; NOTE: Set this to the folder where you keep your Git repos!
    ;; (when (file-directory-p "~/")
    ;; (setq projectile-project-search-path '("~/")))
    (setq projectile-switch-project-action #'projectile-dired))
(use-package counsel-projectile
    :after projectile
    :config (counsel-projectile-mode))

;;vterm
(use-package vterm
  :commands vterm
  :config
  (setq vterm-shell "zsh")
  (setq vterm-max-scrollback 10000))

;;magit
(use-package magit
  :ensure t)

;;whichKey
(use-package which-key
  :defer 0
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 1))

;;commenting
(use-package evil-nerd-commenter
  :bind ("M-/" . evilnc-comment-or-uncomment-lines))

;;Rainbow delimiters
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;;; init.el ends here
