(setq c-basic-offset 4)

(global-set-key (kbd "C-c C-k") 'compile)
(setq compilation-scroll-output t)
(setq compilation-auto-jump-to-first-error t)

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

(global-set-key (kbd "C-c s") 'magit-status)

;; Useful for jumping around liquidc annots
(defun annotjump (start end)
  (interactive "r")
  (let ((name (concat (buffer-substring start end) " ::"))
        (basename (substring buffer-file-name 0 (- (length buffer-file-name) 6))))
    (find-file-other-window (concat basename ".annot"))
    (goto-char (point-min))
    (search-forward name)))

(defun interactive-goto-info (manual)
  (interactive "MInfo node: ")
  (Info-goto-node manual))

(defun goto-cil-manual ()
  (interactive)
  (Info-goto-node "(cil_api)Cil" "CIL Manual"))

(defun goto-ocaml-library-manual ()
  (interactive)
  (Info-goto-node "(ocaml)Chapter 20" "OCaml Library Manual"))

;; Jumping directly to useful info pages
(global-set-key (kbd "C-c i") 'interactive-goto-info)
(global-set-key (kbd "C-c c") 'goto-cil-manual)
(global-set-key (kbd "C-c o") 'goto-ocaml-library-manual)
