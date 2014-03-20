;;
;; Erlang configuration
;;

(eval-after-load "erlang"
  '(progn
     (require 'erlang-start)
     (require 'erlang-flymake)))

(add-to-list 'auto-mode-alist '("\\.erl?$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.hrl?$" . erlang-mode))
