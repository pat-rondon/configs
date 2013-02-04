(setq eshell-prompt-function
  (lambda ()
    (concat "\n"
            (format-time-string "%d-%m-%Y %H:%M " (current-time))
            (abbreviate-file-name
             (eshell/pwd))
            "\n"
            (if (= (user-uid) 0) "# " "$ "))))

(setq eshell-prompt-regexp "^[#$] ")
(global-set-key "\C-xm" 'eshell)
