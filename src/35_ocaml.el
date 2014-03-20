;;
;; OCaml configuration
;;

(setq auto-mode-alist (cons '("\\.ml\\w?" . tuareg-mode) auto-mode-alist))
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)

;; Install Merlin:
;; opam install merlin
(push
   (concat (substring (shell-command-to-string "opam config var share") 0 -1) "/emacs/site-lisp") load-path)
(setq merlin-command (concat (substring (shell-command-to-string "opam config var bin") 0 -1) "/ocamlmerlin"))
(autoload 'merlin-mode "merlin" "Merlin mode" t)
(add-hook 'tuareg-mode-hook 'merlin-mode)
(add-hook 'caml-mode-hook 'merlin-mode)

