;;
;; Clojure configuration
;; Copyright (c) Nicolas Lamirault <nicolas.lamirault@gmail.com>
;;

(require 'cider)
(setq cider-popup-stacktraces t)
(setq cider-repl-popup-stacktraces t)
(setq cider-repl-pop-to-buffer-on-connect t)
(setq cider-repl-use-clojure-font-lock t)
(setq nrepl-hide-special-buffers t)
(setq cider-repl-tab-command 'indent-for-tab-command)
(setq cider-repl-wrap-history t)
(setq cider-repl-history-size 1000)
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)


(require 'company-cider)
(eval-after-load 'company '(add-to-list 'company-backends 'company-cider))

(require 'clj-refactor)
(add-hook 'clojure-mode-hook (lambda ()
                               (clj-refactor-mode 1)
                               ;; insert keybinding setup here))

