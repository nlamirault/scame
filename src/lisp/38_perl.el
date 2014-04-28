;;; 38_perl -- Perl configuration

;; Copyright (C) 2014 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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
