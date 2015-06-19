;;; 39_elisp.el --- Emacs Lisp configuration

;; Copyright (C) 2014, 2015 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

;;(require 'ielm)

;; (find-function-setup-keys)

;; (dolist (hook '(emacs-lisp-mode-hook
;;                 lisp-interaction-mode-hook
;;                 ielm-mode-hook))
;;   (add-hook hook 'turn-on-eldoc-mode))


;; (custom-set-variables
;;  '(eldoc-idle-delay 0.2))


(use-package emacs-lisp-mode
  :init (progn
	  (use-package eldoc
	    :init (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)))
  :mode (("\\.el$" . emacs-lisp-mode)
	 ("gnus" . emacs-lisp-mode)
	 ("Cask" . emacs-lisp-mode)))

(use-package ielm
  :init (add-hook 'ielm-mode-hook 'turn-on-eldoc-mode))

(use-package elisp-slime-nav
  :init (progn
	  (dolist (hook '(emacs-lisp-mode-hook ielm-mode-hook))
	    (add-hook hook 'elisp-slime-nav-mode))))

(use-package erefactor
  :config (define-key emacs-lisp-mode-map "\C-c\C-v" erefactor-map))

;; (use-package overseer
;;   :init (add-hook 'emacs-lisp-mode-hook 'overseer-mode-hook))

(provide '39_elisp)
;;; 39_elisp.el ends here
