;; Source - https://github.com/daviwil/emacs-from-scratch and his YT (System Carfters)

;; Remove the startup page
(setq inhibit-startup-message t)

(scroll-bar-mode -1) ; Remove scroll barr
(tool-bar-mode -1) ; Removes tool bar
(tooltip-mode -1) ; Removes tooltip
(set-fringe-mode 10) ; Give some breathing space 
(menu-bar-mode -1) ; Removes the menu-bar
(setq kill-ring-max 100) ; Kill Ring
(setq visible-bell t) ; Set visible bell 
(setq display-time-default-load-average nil)
;; Splits
(defun split-and-follow-horizontally ()
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)

;; Loaifng quciklisp and slime
(load (expand-file-name "~/.quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")


(defun split-and-follow-vertically ()
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)

;; Clock
(setq display-time-24hr-format t)
(setq display-time-format "%H:%M:%S")
(display-time-mode 1)
;; Matching delims
(setq electric-pair-pairs '(
			     (?\{ . ?\})
			     (?\( . ?\))
			     (?\[ . ?\])
			     (?\" . ?\")
			     (?\' . ?\')
			     (?\< . ?\>)
			     ))
(electric-pair-mode t)

;;UTF-8 support
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(set-face-attribute 'default nil :font "monospace" :height 100); Font

(load-theme 'doom-gruvbox t)  ; Load a different theme

;; Keybindings
(global-set-key(kbd "<escape>") 'keyboard-escape-quit) ; Map ESC to quit current prompt. Just like in vim.
(global-set-key (kbd "C-M-j") 'counsel-switch-buffer ) ; Ctrl-Meta-j to switch buffer

(define-key emacs-lisp-mode-map (kbd "C-x M-t") 'counsel-load-theme)


;; Initialize packages sources/repos
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))


(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install use-package if not installed already
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Add numbered lines
(column-number-mode)
(global-display-line-numbers-mode t)

; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Installig Ivy
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package ivy-rich
  :after ivy
  :init
  (ivy-rich-mode 1))


;; Dashboard
(use-package dashboard
  :ensure t
  :config
    (dashboard-setup-startup-hook)
    (setq dashboard-startup-banner "/home/haxtag/.emacs.d/img/tesla.png")
   ; (setq dashboard-items '((recents  . 5)
			    ;  (projects . 5)))
    (setq dashboard-items '((recents  . 5)
                            (bookmarks . 5)
                            (projects . 5)
                            (agenda . 5)
                            (registers . 5)))
    (setq dashboard-banner-logo-title "I don't care if they stole my idea, I care that thye don't have their own"))


;; Battery

(use-package fancy-battery
  :ensure t
  :init
  (fancy-battery-mode 1)
  (setq fancy-battery-show-percentage t))

;;Rainbow
(use-package rainbow-mode
  :ensure t
  :init (add-hook 'prog-mode-hook 'rainbow-mode))

;; Rainbow delims
;(use-package rainbow-delimiters
 ; :ensure t
  ;:init
 ; (rainbow-delimiters-mode 1))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; Helpful
(use-package helpful
  :ensure t
  :commands (helpful-callable helpful-variable helpful-command helpful-key)
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package doom-themes)

;; Installing which-key
(use-package which-key
  :defer 0
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 1))


;;General.el
;; (use-package general
;;   (general-create-definer hash/leader-keys
;;     :keymaps '(normal insert visual emacs)
;;     :prefix "SPC"
;;     :global-prefix "C-SPC")

;;   (hash/leader-keys
;;     "t"  '(:ignore t :which-key "toggles")
;;     "tt" '(counsel-load-theme :which-key "choose theme")))

;;  Becoming eVil 
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; Hydra
(use-package hydra
  :defer t)

;; (defhydra hydra-text-scale (:timeout 4)
;;   "scale text"
;;   ("j" text-scale-increase "in")
;;   ("k" text-scale-decrease "out")
;;   ("f" nil "finished" :exit t))

;;(hash/leader-keys
 ;; "ts" '(hydra-text-scale/body :which-key "scale text"))


;;(general-define-key
 ;;"C-M-j" 'counsel-switch-buffer)



;; Counsel
(use-package counsel
  :bind (("C-M-j" . 'counsel-switch-buffer)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history))
  :custom
  (counsel-linux-app-format-function #'counsel-linux-app-format-function-name-only)
  :config
  (counsel-mode 1))

;; Neotree
(use-package neotree)
(global-set-key [f8] 'neotree-toggle)

;; Powerline-style Modeline
;;(require 'powerline)
;;(powerline-default-theme)

;; Spaceline Modeline
(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
  (setq powerline-default-separator (quote arrow))
  (spaceline-spacemacs-theme))

;; Cool Icons
(use-package all-the-icons
  :ensure t
  :init)

(use-package all-the-icons-dired
  :ensure t
  :init (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

(use-package all-the-icons-ibuffer
  :ensure t
  :init (all-the-icons-ibuffer-mode 1))

;; Projectile
(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  ;; NOTE: Set this to the folder where you keep your Git repos!
  (when (file-directory-p "~/Documents/code")
    (setq projectile-project-search-path '("~/Documents/code")))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package counsel-projectile
  :after projectile
  :config (counsel-projectile-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("8fd2d543bdaa2858240dd7814bd8ee78c869f90bffed37a06316dd6407510260" default))
 '(package-selected-packages
   '(projectile neotree hydra evil-collection evil general helpful ivy-rich which-key dashboard-project-status dashboard rainbow-delimiters rainbow-mode fancy-battery vterm dmenu all-the-icons-ibuffer all-the-icons-dired all-the-icons powerline counsel ivy command-log-mode use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
