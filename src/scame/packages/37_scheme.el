;;; 37_scheme.el --- Scheme configuration

;; Copyright (C) 2014, 2016 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

(when scame-scheme

  ;;(require 'geiser-install)

  (use-package geiser :quelpa
    :config (progn
              (setq geiser-active-implementations
                    '(guile racket chicken))))
  ;;(setq geiser-default-implementation 'guile)))

  ;;(setq geiser-impl-installed-implementations '(guile))

  )


(provide '37_scheme)
;;; 37_scheme.el ends here
