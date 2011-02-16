(server-start)

(transient-mark-mode 1)

(ido-mode t)
(setq ido-enable-flex-matching t)

(setq-default indent-tabs-mode nil)

(set-language-environment "UTF-8")

(put 'set-goal-column 'disabled nil)

(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(add-to-list 'Info-default-directory-list "/home/pmr/dynamic/info/" )

;; Automatically byte-compile emacs-lisp files upon save
(add-hook 'emacs-lisp-mode-hook
          '(lambda () 
             (add-hook 'after-save-hook 'emacs-lisp-byte-compile t t)))

(windmove-default-keybindings)
(global-set-key (kbd "C-c k") 'compile)
(global-set-key (kbd "C-c |") 'align-regexp)
(global-set-key (kbd "C-c v") 'annotjump)

(global-set-key (kbd "C-x a d") 'emms-add-dired)
