;;; 16_shell.el --- Terminal configuration

;; Copyright (c) 2014, 2015 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

;; Terminal
;; ---------


(use-package multi-term
  :config (progn
	    (setq multi-term-program "/bin/bash")))


(use-package helm-mt)

;; (defun scame-launch-term ()
;;   "Launch a new terminal."
;;   (interactive)
;;   (unless (multi-term-dedicated-exist-p)
;;     (multi-term-dedicated-open))
;;   (multi-term-dedicated-select))

(provide '16_shell)
;;; 16_shell.el ends here
