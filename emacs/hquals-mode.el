;; the command to comment/uncomment text
(defun hquals-comment-dwim (arg)
  "Comment or uncomment current line or region in a smart way.
   For detail, see `comment-dwim'."
   (interactive "*P")
   (require 'newcomment)
   (let ((deactivate-mark nil) (comment-start "(*") (comment-end "*)"))
     (comment-dwim arg)))

;; keywords for syntax coloring
(defconst hquals-keywords
 `(
   ( "qualif" . font-lock-keyword-face)
   ( ,(regexp-opt '("&&" "||" "not" "=>" "iff") 'word) . font-lock-builtin-face)
  )
)

;; define the major mode.
(define-derived-mode hquals-mode fundamental-mode
  "Liquid Qualifiers"
  (setq font-lock-defaults '(hquals-keywords))

  ;; modify the keymap
  (define-key hquals-mode-map [remap comment-dwim] 'hquals-comment-dwim)

  ; ( is first character of comment start
  (modify-syntax-entry ?\( "()1n" hquals-mode-syntax-table)
  ; * is second character of comment start,
  ; and first character of comment end
  (modify-syntax-entry ?*  ". 23n" hquals-mode-syntax-table)
  ; ) is last character of comment end
  (modify-syntax-entry ?\) ")(4" hquals-mode-syntax-table)
)

(setq auto-mode-alist
      (cons
       '("\\.hquals\\'" . hquals-mode)
       auto-mode-alist))