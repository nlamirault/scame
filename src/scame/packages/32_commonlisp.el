;;; 32_commonlisp.el --- Slime configuration

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


(when scame-commonlisp

  (setq inferior-lisp-program "/usr/bin/sbcl") ;(executable-find "sbcl"))

  ;; (use-package slime-autoloads
  ;;   :config (progn
  ;;             (slime-setup '(slime-fancy))))

  ;; (use-package slime-company
  ;;   :config (slime-setup '(slime-company)))

  (use-package sly
    ;; :defer scame-defer-package)
    )

  (use-package sly-company
    ;; :defer scame-defer-package
    :init (add-hook 'sly-mode-hook 'sly-company-mode))

  ;; Use Quicklisp to install Slime
  ;; (let ((filename "~/Apps/quicklisp/slime-helper.el"))
  ;;   (when (file-exists-p filename)
  ;;     (load (expand-file-name filename))))
  ;; (setq inferior-lisp-program "/usr/bin/sbcl")

  )

(provide '32_commonlisp)
;;; 32_commonlisp.el ends here
