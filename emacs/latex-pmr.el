;; (load "auctex.el" nil t t)
(setq TeX-PDF-mode t)
(setq-default TeX-master nil)
(setq-default TeX-parse-self t)

(defun turn-on-outline-minor-mode () (outline-minor-mode 1))

(add-hook 'LaTeX-mode-hook 'turn-on-outline-minor-mode)
(add-hook 'latex-mode-hook 'turn-on-outline-minor-mode)
(setq outline-minor-mode-prefix "\C-c\C-o")
