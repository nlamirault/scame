;;
;; Emacs configuration for the GO language
;; (c) Nicolas Lamirault <nicolas.lamirault@gmail.com>
;;


(require 'go-mode-load)
(add-hook 'go-eldoc-setup)

(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
(add-hook 'go-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c i") 'go-goto-imports)))
(add-hook 'go-mode-hook
	  (lambda ()
	    (local-set-key (kbd \"M-.\") 'godef-jump)))

;; Gocode
;;(require 'go-autocomplete)
;;(require 'auto-complete-config)
