;;; 35_ocaml.el --- OCaml configuration

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

;;(require 'tuareg)

;; (use-package tuareg
;;   :mode (("\\.ml\\w?" . tuareg-mode)
;;          ("\\.topml\\'" . taureg-mode)
;;          ("\\.fs[ix]?" . tuareg-mode)))

(use-package merlin)

(use-package flycheck-ocaml)



(provide '35_ocaml)
;;; 35_ocaml.el ends here
