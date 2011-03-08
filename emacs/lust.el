;; Paths

(setq exec-path (append exec-path '("/opt/local/bin")))
(setenv "PATH" (concat "/opt/local/bin:" (getenv "PATH")))
(add-to-list 'load-path "/opt/local/share/emacs/site-lisp/color-theme-6.6.0/")
;; (add-to-list 'load-path "~/src/magit-0.8.2/")

;; Haskell

(load "/opt/local/share/emacs/site-lisp/haskell-mode-2.4/haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'font-lock-mode)
(add-hook 'haskell-mode-hook 'imenu-add-menubar-index)

;; auctex

(setq TeX-PDF-mode t)
(setq TeX-view-program-list
      '(("Preview" "open %o")))
(setq TeX-view-program-selection '((output-pdf "Preview")))