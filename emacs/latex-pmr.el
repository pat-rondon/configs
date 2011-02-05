(require 'tex-site)
(setq tex-dvi-view-command "xdvi")
(setq-default TeX-master nil)
(setq-default TeX-parse-self t)

(defun set-TeX-faces ()
  (color-theme-pmr))

(add-hook 'TeX-mode-hook 'set-TeX-faces)
