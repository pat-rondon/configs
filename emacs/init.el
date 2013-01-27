(setq package-archives '(("ELPA" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

(add-to-list 'load-path "~/.emacs.d")

(let ((host-specific-files (concat "~/.emacs.d/" system-name ".el")))
  (if (file-exists-p host-specific-files)
      (load host-specific-files)
      (message (concat "No host specific customizations for " system-name))))

(setq exec-path (append exec-path '("/usr/texbin" "/usr/local/bin")))
(setenv "PATH" (concat "/usr/texbin" ":" "/usr/local/bin" ":" (getenv "PATH")))

(load "display-pmr")                ;; How Emacs looks
(load "behavior-pmr")               ;; How Emacs behaves and keybindings
(load "programming-pmr")            ;; General programming settings
(load "latex-pmr")
(load "ocaml-pmr")
(load "w3m-pmr")
(load "eshell-pmr")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("bd22c46c6c0cc40c8b9cb773cb3489e487894431dc22e8388847d9bc10640090" "f06f766421a23dc6fa9eca2388a2178446223362b495e56dc2ab390e5c5bda24" "157e48c3b782f5c7b46498dac3b5a5578a0343d4c3fe6c108ab5b9dd4371a49c" "6a1c78b5b39ebec4c739f59d4bc4d64e0ac7818efea719e8fc0db341dee157d3" "3f3d7f2cbd8dd62031ff9f21ecce8ab8fa05e6c6df9b93077a9863c6f755a9bc" "821b166e3e1df2550ab45de64a0e5318fffcbeda2adc0c4b8a8bbeb41f64b283" "f4aa06970cee883801b73ce9ce35db5184a538652ada8166164327e9e9ac2577" "86f15c36b8b94da58483830702fe8eb77eec09f73b452d72d4986d8d8ca25361" "f20f8fa0aaf8240444485a5102c1110d3242132652cfefb25610e8af46445ccd" "228b1f04c30c02caf2f6a72748cdeb80d77afcd42a2ff919e267e941a0fbd978" "7015b1f821869f66c5c8ddb1e92de094765a9e2e" "71d690992b8e03c6ddfcc72fd3787f67bc91629d" "552b2919c3f8a2c1122c2ec3d3712db95313dff8" "3c7d6887cfc1eec37d239ca0f557b7a660aae82d" "058cc83c9ca08695e5250fd875e822e705eaed36" "a4d66e3a01a78aa0a1482eec5fffad12ae7be0fa" "4c15c758000d1b124ee3f674e2885bc09ec11037" "79f2bcaa36897bcf388f27c206df17226f663289" "bf1b19537b4d9261d958f8d9ea6e45cd1797b997" "c1f25118b6f22baff8856045146ee4dd3f1f9426" "1f5d18bc6d58161e56fe79bd32a8e7fdb5c5b747" "c933447ccee15d01665efa0721fd712482a2a84a" "db81d0cfbbeae4c179fc3b1420d43c95bbd60d3b" "c36f748186a40ba485e4cf9201f197d5baa0b9f9" "719385590818afa754ba169ee0724be1341c7b0e" "85ec65fcf9507d056e9d5e03adaad2d7b2dbbae3" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
