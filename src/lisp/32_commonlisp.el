;;; 32_commonlisp.el --- Slime configuration

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


;; (use-package slime-autoloads
;;   :config (progn
;;             (setq inferior-lisp-program "/usr/bin/sbcl")
;;             (slime-setup '(slime-fancy))))

;; (use-package slime-company
;;   :config (slime-setup '(slime-company)))

(use-package sly-autoloads
     :config (setq inferior-lisp-program "/usr/bin/sbcl"))


;; Use Quicklisp to install Slime
;; (let ((filename "~/Apps/quicklisp/slime-helper.el"))
;;   (when (file-exists-p filename)
;;     (load (expand-file-name filename))))
;; (setq inferior-lisp-program "/usr/bin/sbcl")

(provide '32_commonlisp)
;;; 32_commonlisp.el ends here
