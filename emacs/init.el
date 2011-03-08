(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

(add-to-list 'load-path "~/.emacs.d")

(let ((host-specific-files (concat "~/.emacs.d/" system-name ".el")))
  (if (file-exists-p host-specific-files)
      (load host-specific-files)
      (message (concat "No host specific customizations for " system-name))))

(load "display-pmr")                ;; How Emacs looks
(load "behavior-pmr")               ;; How Emacs behaves and keybindings
(load "programming-pmr")            ;; General programming settings
(load "latex-pmr")
(load "ocaml-pmr")
(load "w3m-pmr")
;; (load "emms-pmr")

(load "hquals-mode")
