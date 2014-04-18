;;; 34_go-lang.el -- Configuration for the GO language

;; Copyright (c) 2014 Nicolas Lamirault <nicolas.lamirault@gmail.com>

;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;; The above copyright notice and this permission notice shall be included in
;; all copies or substantial portions of the Software.

;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
;; THE SOFTWARE.

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


(use-package gotest
  (add-hook 'go-mode-hook
	    (lambda ()
	      (local-set-key (kbd "C-x t") 'go-test-current-test)
	      (local-set-key (kbd "C-x c") 'go-test-current-file))))

;;   :bind (("C-x g t" . go-test-current-test)
;;   	 ("C-x g c" . go-test-current-file)))

;; Gocode
;;(require 'go-autocomplete)
;;(require 'auto-complete-config)


(use-package go-direx
  :config (progn
	    (add-hook 'go-mode-hook
		      (lambda ()
			(local-set-key (kbd "C-x x")
				       'go-direx-pop-to-buffer)))))


(provide '34_go-lang)
;;; 34_go-lang.el ends here
