;;
;; Emacs Lisp configuration
;; Copyright (c) Nicolas Lamirault <nicolas.lamirault@gmail.com>
;;

(find-function-setup-keys)

(dolist (hook '(emacs-lisp-mode-hook
                lisp-interaction-mode-hook
                ielm-mode-hook))
  (add-hook hook 'turn-on-eldoc-mode))


(custom-set-variables
 '(eldoc-idle-delay 0.2))

(defun ielm-other-window ()
  "Run ielm on other window"
  (interactive)
  (switch-to-buffer-other-window
   (get-buffer-create "*ielm*"))
  (call-interactively 'ielm))
