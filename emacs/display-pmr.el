(global-font-lock-mode 1)
(show-paren-mode 1)
(blink-cursor-mode 0)
(set-fringe-mode '(0 . 0))
(setq visible-bell 't)
(tool-bar-mode 0)
(menu-bar-mode 0)
(set-scroll-bar-mode nil)
(column-number-mode t)
(setq mode-line-format (butlast mode-line-format))

(add-to-list 'load-path "~/.emacs.d/color-themes/color-theme-distressed/")
(require 'color-theme)
(require 'color-theme-distressed)
(color-theme-distressed)
(defvar pmr-frame-font)
(if (eq system-type 'darwin)
    (setq pmr-frame-font
          "-apple-Menlo-medium-normal-normal-*-14-*-*-*-m-0-iso10646-1")
    (setq pmr-frame-font "DejaVu Sans Mono-12"))
(set-frame-font pmr-frame-font)
(set-face-attribute 'default nil :font pmr-frame-font)
