(server-start)
(add-to-list 'load-path "/home/pmr/.emacs.d")
(add-to-list 'load-path "/home/pmr/.emacs.d/color-themes")

(global-font-lock-mode 1)
(show-paren-mode 1)
(blink-cursor-mode 0)

(tool-bar-mode 0)
(menu-bar-mode 0)
(set-scroll-bar-mode nil)

(require 'color-theme)
(require 'color-theme-pmr)
(require 'color-theme-pmr-dark)
(color-theme-pmr)
(set-default-font "DejaVu Sans Mono-10")

(ido-mode t)
(setq ido-enable-flex-matching t)

(setq tex-dvi-view-command "xdvi")

(setq c-basic-offset 4)
(setq-default indent-tabs-mode nil)

(setq visible-bell 't)

(set-language-environment "UTF-8")

(column-number-mode t)

(windmove-default-keybindings)

(global-set-key (kbd "C-c k") 'compile)

(put 'set-goal-column 'disabled nil)

(setq default-mode-line-format (butlast default-mode-line-format))

(setq auto-mode-alist (cons '("\\.ml\\w?" . tuareg-mode) auto-mode-alist))
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)
(autoload 'caml-types-show-type "caml-types" "Show type of expression / pattern at point." t)

(add-hook 'tuareg-mode-hook '(lambda ()
  (global-set-key (kbd "C-c C-t") 'caml-types-show-type)))

(setq load-path (cons "/usr/share/emacs/site-lisp/w3m" load-path))
(autoload 'w3m "w3m" "Interface for w3m on Emacs." t)
(add-hook 'w3m-mode-hook '(lambda ()
  (set-face-foreground 'w3m-anchor-face "CadetBlue")
  (set-face-foreground 'w3m-arrived-anchor-face "SeaGreen3")
  (set-face-foreground 'w3m-image-face "burlywood")
  (set-face-foreground 'w3m-header-line-location-title-face "goldenrod")
  (setq w3m-fill-column 72)))

(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(defun comment-heading (left right fill)
  (let* ((start   (point-at-bol))
         (end     (point-at-eol))
         (len     (- end start))
         (text    (buffer-substring start end))
         (width   (- 80 (+ (length left) (length right))))
         (center  (/ width 2))
         (textcen (/ (+ len 2) 2.0))
         (lpadc   (- center (floor textcen)))
         (rpadc   (- center (ceiling textcen)))
         (lpad    (make-string lpadc fill))
         (rpad    (make-string rpadc fill))
         (endcap  (concat left (make-string width fill) right)))
    (delete-region start end)
    (insert endcap "\n" left lpad " " text " " rpad right "\n" endcap)))

(defun ocaml-comment-heading ()
  (interactive)
  (comment-heading "(*" "*)" ?*))

(add-hook 'tuareg-mode-hook
  (lambda ()
    (define-key tuareg-mode-map (kbd "C-c a") 'ocaml-comment-heading)))

(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(require 'tex-site)
(setq-default TeX-master nil)
(setq-default TeX-parse-self t)

(defun set-TeX-faces ()
  (progn
    (set-face-foreground 'font-latex-math-face "gray 90")
    (set-face-foreground 'font-latex-italic-face "white")
    (set-face-foreground 'font-latex-bold-face "white")
    (set-face-foreground 'font-latex-verbatim-face "LightYellow3")
    (set-face-foreground 'font-latex-sectioning-2-face "white")
    ))

(add-hook 'TeX-mode-hook 'set-TeX-faces)

;; Misc Keybindings
(global-set-key (kbd "C-c |") 'align-regexp)

(require 'magit)
(global-set-key (kbd "C-c s") 'magit-status)

;; Useful for jumping around liquidc annots
(defun annotjump (start end)
  (interactive "r")
  (let ((name (concat (buffer-substring start end) " ::"))
        (basename (substring buffer-file-name 0 (- (length buffer-file-name) 6))))
    (find-file-other-window (concat basename ".annot"))
    (goto-char (point-min))
    (search-forward name)))

(global-set-key (kbd "C-c v") 'annotjump)

(add-to-list 'Info-default-directory-list "/home/pmr/doc/info/" )

(transient-mark-mode 1)
