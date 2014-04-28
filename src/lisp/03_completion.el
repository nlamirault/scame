;;; 03_completion.el --- Auto complete

;; Copyright (c) 2014 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

;;(require 'auto-complete)
;;(ac-config-default)
;;(setq ac-ignore-case nil)
;;(add-to-list 'ac-modes 'web-mode)
;;(add-to-list 'ac-modes 'php-mode)

(use-package company
  :init (add-hook 'after-init-hook 'global-company-mode))




(provide '03_completion)
;;; 03_completion.el ends here
