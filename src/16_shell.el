;; Terminal configuration
;;
;; Copyright (c) Nicolas Lamirault <nicolas.lamirault@gmail.com>
;;

;; Terminal
;; ---------


(require 'multi-term)
(setq multi-term-program "/bin/bash")
(global-set-key "\C-xt"
		(lambda () (interactive)
		  (unless (multi-term-dedicated-exist-p)
		    (multi-term-dedicated-open))
		  (multi-term-dedicated-select)))
