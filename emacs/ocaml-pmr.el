(setq auto-mode-alist (cons '("\\.ml\\w?" . tuareg-mode) auto-mode-alist))
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)
(autoload 'caml-types-show-type "caml-types" "Show type of expression / pattern at point." t)

(defun ocaml-comment-heading ()
  (interactive)
  (comment-heading "(*" "*)" ?*))

(add-hook 'tuareg-mode-hook '(lambda ()
  (global-set-key (kbd "C-c C-t") 'caml-types-show-type)))

(add-hook 'tuareg-mode-hook
  (lambda ()
    (define-key tuareg-mode-map (kbd "C-c a") 'ocaml-comment-heading)))
