;;; 34_go-lang.el -- Configuration for the GO language

;; Copyright (c) 2014 Nicolas Lamirault <nicolas.lamirault@gmail.com>

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:


(use-package go-mode
  :mode (("\\.go$" . go-mode))
  :init (progn
	  (use-package go-eldoc
	    :config (add-hook 'go-mode-hook 'go-eldoc-setup))
	  (use-package go-mode-load))
  :config (progn
	    (add-hook 'before-save-hook 'gofmt-before-save)
	    (add-hook 'go-mode-hook
		      (lambda ()
			(local-set-key (kbd "C-x M-r") 'go-remove-unused-imports)
			(local-set-key (kbd "C-x i") 'go-goto-imports)
			(local-set-key (kbd "M-.") 'godef-jump)))))

;; DEPRECATED. See Cerbere
;; (use-package gotest
;;   (add-hook 'go-mode-hook
;; 	    (lambda ()
;; 	      (local-set-key (kbd "C-x t") 'go-test-current-test)
;; 	      (local-set-key (kbd "C-x c") 'go-test-current-file))))


;; Gocode
;;(require 'go-autocomplete)
;;(require 'auto-complete-config)


(use-package go-direx
  :config (progn
	    (add-hook 'go-mode-hook
		      (lambda ()
			(local-set-key (kbd "C-x j")
				       'go-direx-pop-to-buffer)))))


(provide '34_go-lang)
;;; 34_go-lang.el ends here
