;;
;; Haskell configuration
;; Copyright (c) Nicolas Lamirault <nicolas.lamirault@gmail.com>
;;

(eval-after-load "haskell-mode"
  '(progn
     (require 'haskell-simple-indent)
     (require 'ghc)
     ;; ghc
     (setq ghc-module-command (executable-find "ghc-mod"))
     ;; bindings
     (define-key haskell-mode-map (kbd "M-o") 'editutil-edit-next-line-same-column)
     (define-key haskell-mode-map (kbd "TAB") 'haskell-simple-indent)
     (define-key haskell-mode-map (kbd "<backtab>") 'haskell-simple-indent-backtab)
     (define-key haskell-mode-map [remap newline] 'haskell-simple-indent-newline-same-col)
     (define-key haskell-mode-map [remap newline-and-indent] 'haskell-simple-indent-newline-indent)
     (define-key haskell-mode-map (kbd "C-<return>") 'haskell-simple-indent-newline-indent))
  )
