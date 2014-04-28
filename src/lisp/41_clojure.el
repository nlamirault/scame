;; 41_clojure.el --- Clojure configuration

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
