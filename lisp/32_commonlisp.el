;;
;; Slime configuration
;;

(let ((filename "~/Apps/quicklisp/slime-helper.el"))
  (when (file-exists-p filename)
    (load (expand-file-name filename))))
(setq inferior-lisp-program "/usr/bin/sbcl")
