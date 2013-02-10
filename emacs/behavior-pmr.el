(server-start)

(transient-mark-mode 1)
(setq make-backup-files nil)

(eval-after-load 'ido-ubiquitous-autoloads
  '(progn
     (ido-mode t)
     (ido-ubiquitous t)
     (setq ido-enable-flex-matching t)
     (setq ido-ignore-files
	   '(".*\\.hi$" ".*\\.cm[oix]$" ".*\\.o$" ".*\\.pdf$"))))

(setq-default indent-tabs-mode nil)

(set-language-environment "UTF-8")

(put 'set-goal-column 'disabled nil)

(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(add-to-list 'Info-default-directory-list "~/dynamic/info/" )

;; Automatically byte-compile emacs-lisp files upon save
(add-hook 'emacs-lisp-mode-hook
          '(lambda () 
             (add-hook 'after-save-hook 'emacs-lisp-byte-compile t t)))

(defun reload-this-file ()
  (interactive)
  (revert-buffer nil t))

;;;; Keybindings
(global-set-key "\C-xi" 'imenu)
(global-set-key (kbd "C-c |") 'align-regexp)
(global-set-key (kbd "C-c r") 'reload-this-file)
(global-set-key (kbd "C-c l") 'lgrep)

(defun dont-kill-emacs ()
  (interactive)
  (error (substitute-command-keys "To exit emacs: \\[kill-emacs]")))
(global-set-key "\C-x\C-c" 'dont-kill-emacs)

(windmove-default-keybindings)
(global-set-key (kbd "<select>") 'windmove-up)
(setq windmove-wrap-around t)
(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)

(setq org-disputed-keys '(([(shift up)] . [(meta p)])
                          ([(shift down)] . [(meta n)])
                          ([(shift left)] . [(meta -)])
                          ([(shift right)] . [(meta +)])
                          ([(meta return)] . [(control meta return)])
                          ([(control shift right)] . [(meta shift +)])
                          ([(control shift left)] . [(meta shift -)])))
(setq org-replace-disputed-keys t)

;; Programming keys
(global-set-key (kbd "C-x c") 'compile)
(global-set-key (kbd "C-x g") 'magit-status)
