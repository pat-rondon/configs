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

(add-to-list 'load-path "~/.emacs.d/color-themes")
(require 'color-theme)
(require 'color-theme-pmr)
(require 'color-theme-pmr-dark)
(set-frame-font "DejaVu Sans Mono-12")
(set-face-attribute 'default nil :font "DejaVu Sans Mono-12")
(color-theme-pmr)
