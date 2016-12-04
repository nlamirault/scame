;;; 48_java.el -- Java development

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

;; (use-package malabar-mode
;;   :mode (("\\.java\\'" . malabar-mode))
;;   :config (progn
;;             (semantic-mode 1)
;;             (add-hook 'malabar-mode-hook
;;                       (lambda ()
;;                         (add-hook 'after-save-hook
;;                                   'malabar-compile-file-silently
;;                                   nil t)))))

(provide '48_java)
;;; 48_java.el ends here
