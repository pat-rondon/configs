(server-start)

(transient-mark-mode 1)

(setq sentence-end-double-space nil)

(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-ignore-files
      '(".*\\.hi$" ".*\\.cm[oix]$" ".*\\.o$" ".*\\.pdf$"))

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

(global-set-key "\C-ca" 'org-agenda)

(setq org-agenda-files '("~/dynamic/agendas"))

(defun reload-this-file ()
  (interactive)
  (revert-buffer nil t))

(global-set-key (kbd "C-c |") 'align-regexp)
(global-set-key (kbd "C-c r") 'reload-this-file)
(global-set-key (kbd "C-c l") 'lgrep)
(global-set-key (kbd "C-c v") 'annotjump)

(defun dont-kill-emacs ()
  (interactive)
  (error (substitute-command-keys "To exit emacs: \\[kill-emacs]")))
  
(global-set-key "\C-x\C-c" 'dont-kill-emacs)

;; (require 'projectile)
;; (projectile-global-mode)

;; Sane Keybindings Via Evil

(add-to-list 'load-path "~/src/evil")
(require 'evil)  
(evil-mode 1)

(setq evil-insert-state-modes '("Magit Log Edit"))

(define-key evil-normal-state-map ",b" 'ido-switch-buffer)
(define-key evil-normal-state-map ",f" 'ido-find-file)
(define-key evil-normal-state-map ",g" 'magit-status)
(define-key evil-normal-state-map ",c" 'compile)
(define-key evil-normal-state-map ",d" 'kill-this-buffer)

;; (mapcar (lambda (state)
;;           (evil-declare-key state org-mode-map
;;             (kbd "M-l") 'org-metaright
;;             (kbd "M-h") 'org-metaleft
;;             (kbd "M-k") 'org-metaup
;;             (kbd "M-j") 'org-metadown
;;             (kbd "M-L") 'org-shiftmetaright
;;             (kbd "M-H") 'org-shiftmetaleft
;;             (kbd "M-K") 'org-shiftmetaup
;;             (kbd "M-J") 'org-shiftmetadown))
;;         '(normal insert))
