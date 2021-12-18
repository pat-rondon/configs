(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa-stable" . "http://stable.melpa.org/packages/")))

(require 'bind-key)
(require 'use-package)

(let ((host-specific-config (concat "~/.emacs.d/" (system-name) ".el")))
  (if (file-exists-p host-specific-config)
      (load host-specific-config)
      (message (concat "No host-specific customizations for " (system-name)))))

(setq exec-path (append exec-path '("/opt/local/bin" "/usr/texbin" "/usr/local/bin")))
(setenv "PATH" (concat "/opt/local/bin" ":" "/usr/texbin" ":" "/usr/local/bin" ":" (getenv "PATH")))

;;;; General behavior
(server-start)

(transient-mark-mode 1)
(setq make-backup-files nil)

(require 'uniquify)
(setq uniquify-buffer-style 'forward)

(ivy-mode 1)

(setq-default indent-tabs-mode nil)

(set-language-environment "UTF-8")

(put 'set-goal-column 'disabled nil)

;; Disable tedious unnecessary window creation.
(setq display-buffer-base-action
      '((display-buffer-reuse-window
         display-buffer-use-some-window)))

;; Automatically byte-compile emacs-lisp files upon save
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (add-hook 'after-save-hook 'emacs-lisp-byte-compile t t)))

;; Kill trailing whitespace on save.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(defun reload-this-file ()
  (interactive)
  (revert-buffer nil t))

;; Keybindings
(bind-key "C-x C-f" 'counsel-find-file)
(bind-key "C-c r" 'reload-this-file)
(bind-key "C-c /" 'lgrep)
(bind-key "C-c c" 'compile)
(bind-key "C-c g" 'magit-status)

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

(dolist (hook '(text-mode-hook org-mode-hook))
  (add-hook hook (lambda () flyspell-mode)))

; Packages are loaded after the init file, so we have to defer loading
; Evil mode.
(add-hook 'after-init-hook
          (lambda ()
            (require 'evil)
            (evil-mode t)))

;;;; Appearance
(global-font-lock-mode 1)
(show-paren-mode 1)
(blink-cursor-mode 0)
(setq ring-bell-function 'ignore)
(menu-bar-mode -1)
(column-number-mode t)

(load-theme 'monotonic t)
(if window-system
    (progn
      (tool-bar-mode 0)
      (set-scroll-bar-mode nil)
      (set-fringe-mode 4)
      (defvar pmr-frame-font)
      (setq pmr-frame-font "JetBrains Mono-12")
      (set-frame-font pmr-frame-font)
      (set-face-attribute 'default nil :font pmr-frame-font)))

;;;; Project and view management
(use-package perspective
  :bind
  ("C-x b" . persp-ivy-switch-buffer)
  :config
  (progn (persp-mode)
         (setq persp-state-default-file "~/.perspective-state")))

;;;; Spelling
(if (file-executable-p "/opt/local/bin/aspell")
    (setq ispell-program-name "/opt/local/bin/aspell"))

;;;; Programming
;; C
(setq c-basic-offset 2)

;; Compilation
(setq compilation-scroll-output t)

;; Commenting
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

;; Comment spelling.
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

;; OCaml
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

(setq tuareg-in-indent 2)

;;;; Latex
(setq TeX-PDF-mode t)
(setq-default TeX-master nil)
(setq-default TeX-parse-self t)

(defun turn-on-outline-minor-mode () (outline-minor-mode 1))

(add-hook 'LaTeX-mode-hook 'turn-on-outline-minor-mode)
(add-hook 'latex-mode-hook 'turn-on-outline-minor-mode)
(setq outline-minor-mode-prefix "\C-c\C-o")

;;;; EShell
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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("bd22c46c6c0cc40c8b9cb773cb3489e487894431dc22e8388847d9bc10640090" "f06f766421a23dc6fa9eca2388a2178446223362b495e56dc2ab390e5c5bda24" "157e48c3b782f5c7b46498dac3b5a5578a0343d4c3fe6c108ab5b9dd4371a49c" "6a1c78b5b39ebec4c739f59d4bc4d64e0ac7818efea719e8fc0db341dee157d3" "3f3d7f2cbd8dd62031ff9f21ecce8ab8fa05e6c6df9b93077a9863c6f755a9bc" "821b166e3e1df2550ab45de64a0e5318fffcbeda2adc0c4b8a8bbeb41f64b283" "f4aa06970cee883801b73ce9ce35db5184a538652ada8166164327e9e9ac2577" "86f15c36b8b94da58483830702fe8eb77eec09f73b452d72d4986d8d8ca25361" "f20f8fa0aaf8240444485a5102c1110d3242132652cfefb25610e8af46445ccd" "228b1f04c30c02caf2f6a72748cdeb80d77afcd42a2ff919e267e941a0fbd978" "7015b1f821869f66c5c8ddb1e92de094765a9e2e" "71d690992b8e03c6ddfcc72fd3787f67bc91629d" "552b2919c3f8a2c1122c2ec3d3712db95313dff8" "3c7d6887cfc1eec37d239ca0f557b7a660aae82d" "058cc83c9ca08695e5250fd875e822e705eaed36" "a4d66e3a01a78aa0a1482eec5fffad12ae7be0fa" "4c15c758000d1b124ee3f674e2885bc09ec11037" "79f2bcaa36897bcf388f27c206df17226f663289" "bf1b19537b4d9261d958f8d9ea6e45cd1797b997" "c1f25118b6f22baff8856045146ee4dd3f1f9426" "1f5d18bc6d58161e56fe79bd32a8e7fdb5c5b747" "c933447ccee15d01665efa0721fd712482a2a84a" "db81d0cfbbeae4c179fc3b1420d43c95bbd60d3b" "c36f748186a40ba485e4cf9201f197d5baa0b9f9" "719385590818afa754ba169ee0724be1341c7b0e" "85ec65fcf9507d056e9d5e03adaad2d7b2dbbae3" default))))
