;;
;; Emacs for Nicolas Lamirault
;; (c) Nicolas Lamirault <nicolas.lamirault@gmail.com>
;;


(setq user-full-name "Nicolas Lamirault")
(setq user-mail-address "nicolas.lamirault@gmail.com")



;; UI themes
;; -----------

;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;; (add-to-list 'load-path "~/.emacs.d/themes/")
;;(load-theme 'zenburn t)
;;(load-theme 'noctilux t)
;;(load-theme 'moe-dark t)
;;(setq moe-theme-mode-line-color 'orange)
;;(require 'color-theme-sanityinc-tomorrow)
;;(color-theme-sanityinc-tomorrow--define-theme night)
(load-theme 'afternoon t)
;;(load-theme 'ample t)

(require 'multi-term)
(setq multi-term-program "/bin/bash")
