(setq c-basic-offset 4)

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