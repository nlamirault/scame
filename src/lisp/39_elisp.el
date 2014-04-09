;;; 39_elisp.el --- Emacs Lisp configuration

;; Copyright (C) Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

;;(require 'ielm)

;; (find-function-setup-keys)

;; (dolist (hook '(emacs-lisp-mode-hook
;;                 lisp-interaction-mode-hook
;;                 ielm-mode-hook))
;;   (add-hook hook 'turn-on-eldoc-mode))


;; (custom-set-variables
;;  '(eldoc-idle-delay 0.2))


(defun ielm-other-window ()
  "Run ielm on other window."
  (interactive)
  (switch-to-buffer-other-window
   (get-buffer-create "*ielm*"))
  (call-interactively 'ielm))


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

(provide '39_elisp)
;;; 39_elisp.el ends here
