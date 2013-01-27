(autoload 'w3m "w3m" "Interface for w3m on Emacs." t)
(add-hook 'w3m-mode-hook '(lambda ()
  (setq w3m-fill-column 72)))
