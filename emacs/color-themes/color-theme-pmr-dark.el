(defun color-theme-pmr-dark ()
  (interactive)
  (color-theme-install
   '(color-theme-pmr-dark
      ((background-color . "#242424")
      (background-mode . light)
      (border-color . "#454545")
      (cursor-color . "#b8b8b8")
      (foreground-color . "#ffffff")
      (mouse-color . "black"))
     (fringe ((t (:background "#454545"))))
     (mode-line ((t (:foreground "#ffffff" :background "#666666"))))
     (region ((t (:background "#4a3d26"))))
     (font-lock-builtin-face ((t (:foreground "#38a9cc"))))
     (font-lock-comment-face ((t (:foreground "#e67ad6"))))
     (font-lock-function-name-face ((t (:foreground "#ffffff"))))
     (font-lock-keyword-face ((t (:foreground "#d47921"))))
     (font-lock-string-face ((t (:foreground "#22e2ec"))))
     (font-lock-type-face ((t (:foreground"#267ee8"))))
     (font-lock-variable-name-face ((t (:foreground "#fcfcfc"))))
     (minibuffer-prompt ((t (:foreground "#7299ff" :bold t))))
     (font-lock-warning-face ((t (:foreground "Red" :bold t))))
     )))
(provide 'color-theme-pmr-dark)