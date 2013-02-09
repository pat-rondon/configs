;;;; C
(setq c-basic-offset 2)

;;;; Compilation
(setq compilation-scroll-output t)
(setq compilation-auto-jump-to-first-error t)

;;;; Commenting
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
