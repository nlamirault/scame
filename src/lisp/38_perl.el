;;; 38_perl -- Perl configuration

;; Copyright (C) 2014 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

;; (require 'cperl-mode)

;; (defalias 'perl-mode 'cperl-mode)
;; (add-to-list 'auto-mode-alist
;; 	     '("\\.\\(pl\\|pm\\|cgi\\|t\\|psgi\\)\\'" . cperl-mode))
;; (add-to-list 'auto-mode-alist '("cpanfile\\'" . cperl-mode))
;; (add-to-list 'auto-mode-alist '("\\.pod\\'" . pod-mode))

;; (eval-after-load "cperl-mode"
;;   '(progn
;;      (cperl-set-style "PerlStyle")
;;      (setq cperl-auto-newline nil)
;;      (helm-perldoc:setup)))


(use-package cperl-mode
  :init (defalias 'perl-mode 'cperl-mode)
  :mode (("\\.\\(pl\\|pm\\|cgi\\|t\\|psgi\\)\\'" . cperl-mode)
	 ("cpanfile\\'" . perl-mode))
  :init (progn
	  (cperl-set-style "PerlStyle")
	  (setq cperl-auto-newline nil)
	  (helm-perldoc:setup)))

(use-package plsense-direx
  :config (progn
	    (plsense-direx:config-default)
	    (add-hook 'cperl-mode-hook
		      (lambda ()
			(local-set-key (kbd "C-x j")
				       'plsense-direx:open-explorer-key)))))






(provide '38_perl)
;;; 38_perl.el ends here
