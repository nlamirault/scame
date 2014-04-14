;; 41_clojure.el --- Clojure configuration

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

;;(require 'cider)

(use-package cider
  :init (progn
	  (add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
	  (add-hook 'cider-repl-mode-hook 'subword-mode))
  :config (progn
	    (setq cider-popup-stacktraces t)
	    (setq cider-repl-popup-stacktraces t)
	    (setq cider-repl-pop-to-buffer-on-connect t)
	    (setq cider-repl-use-clojure-font-lock t)
	    (setq nrepl-hide-special-buffers t)
	    (setq cider-repl-tab-command 'indent-for-tab-command)
	    (setq cider-repl-wrap-history t)
	    (setq cider-repl-history-size 1000)))


;;(require 'company-cider)
(use-package company-cider
  :init (add-to-list 'company-backends 'company-cider))
;;(eval-after-load 'company '(add-to-list 'company-backends 'company-cider))

;;(require 'clj-refactor)
(use-package clj-refactor
  :init (add-hook 'clojure-mode-hook (lambda ()
				       (clj-refactor-mode 1))))

(provide '41_clojure)
;;; 41_clojure.el ends here
