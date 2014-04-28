;;; 49_cerbere.el --- Cerbere configuration for Scame

;; Copyright (C) 2014  Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

(use-package cerbere
  :config (progn
            (add-hook 'python-mode-hook 'cerbere-mode)
            (add-hook 'go-mode-hook 'cerbere-mode)
            (add-hook 'web-mode-hook 'cerbere-mode)))


(provide '49_cerbere)
;;; 49_cerbere.el ends here
