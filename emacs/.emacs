
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
;; enable flycheck globally
(add-hook 'after-init-hook #'global-flycheck-mode)
(setq flycheck-check-syntax-automatically '(save mode-enabled))

;; load zerodark theme
(load-theme 'zerodark t)

;; no tabs
(setq c-basic-indent 4)
(setq tab-width 4)
(setq-default indent-tabs-mode nil)
(setq indent-tabs-mode nil)

;; no backup files
(setq make-backup-files nil)
(setq auto-save-default nil)

(add-hook 'before-save-hook #'delete-trailing-whitespace)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key (kbd "C-p") 'counsel-git)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)


;; evil-mode-settings
;; set up vim key bindings
(use-package evil
  :init
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode)
  ;; unbind C-p
  (define-key evil-normal-state-map (kbd "C-p") nil)
  ;; set bindings for moving btwn windows
  (define-key evil-normal-state-map (kbd "C-h")  'windmove-left)
  (define-key evil-normal-state-map (kbd "C-l") 'windmove-right)
  (define-key evil-normal-state-map (kbd "C-k")    'windmove-up)
  (define-key evil-normal-state-map (kbd "C-j")  'windmove-down)
  )


(use-package projectile
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (setq projectile-project-search-path '("~/handydev/repos/"))
  (counsel-projectile-mode))


;; neotree settings
(use-package neotree
  :config
    (define-key evil-normal-state-map (kbd "<SPC> p t") 'neotree-toggle)
    (add-hook 'neotree-mode-hook
        (lambda ()
            (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
            (define-key evil-normal-state-local-map (kbd "I") 'neotree-hidden-file-toggle)
            (define-key evil-normal-state-local-map (kbd "z") 'neotree-stretch-toggle)
            (define-key evil-normal-state-local-map (kbd "R") 'neotree-refresh)
            (define-key evil-normal-state-local-map (kbd "m") 'neotree-rename-node)
            (define-key evil-normal-state-local-map (kbd "c") 'neotree-create-node)
            (define-key evil-normal-state-local-map (kbd "d") 'neotree-delete-node)

            (define-key evil-normal-state-local-map (kbd "s") 'neotree-enter-vertical-split)
            (define-key evil-normal-state-local-map (kbd "S") 'neotree-enter-horizontal-split)

            (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter))))


;; haskell settings
(add-hook 'haskell-mode-hook
  (lambda ()
    (setq haskell-tags-on-save t)))

(use-package dante
  :after haskell-mode
  :commands 'dante-mode
  :init
  (add-hook 'haskell-mode-hook 'dante-mode)
  (add-hook 'haskell-mode-hook 'flycheck-mode)
  :config
  (setq dante-repl-command-line '("cabal" "new-repl"))
  (define-key evil-normal-state-local-map (kbd ", t") 'dante-type-at)
  (define-key evil-normal-state-local-map (kbd ", g d") 'xref-find-definitions)
  (define-key evil-normal-state-local-map (kbd ", g r") 'xref-find-references)
  (add-hook 'dante-mode-hook
            (lambda ()
              (flycheck-add-next-checker 'haskell-dante
                                         '(warning . haskell-hlint))
              (add-to-list 'flycheck-disabled-checkers 'haskell-stack-ghc))))

(eval-after-load "haskell-mode"
    '(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-compile))

(eval-after-load "haskell-cabal"
    '(define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-compile))


;; scala settings
(use-package ensime
  :mode "\\.scala\\'"
  :init
  (add-hook 'scala-mode-hook 'ensime)
  :config
  (setq ensime-search-interface 'ivy)
  (define-key evil-normal-state-map (kbd "<SPC> r r") 'ensime-refactor-diff-rename)
  (define-key evil-normal-state-map (kbd "<SPC> r a") 'ensime-refactor-add-type-annotation)
  (define-key evil-normal-state-map (kbd "<SPC> t") 'ensime-type-at-point)
  (define-key evil-normal-state-map (kbd "<SPC> g d") 'ensime-edit-definition-of-thing-at-point))
