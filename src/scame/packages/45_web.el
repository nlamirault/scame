;;; 45_web.el --- web languages configuration

;; Copyright (C) 2014-2017 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

(when scame-web

  (use-package web-mode
    :ensure t
    :pin melpa
    :config (setq web-mode-code-indent-offset 4)
    :mode (("\\.html\\'" . web-mode)
           ("\\.mustache\\'" . web-mode)
           ("\\.jinja\\'" . web-mode)
           ))

  )

(provide '45_web)
;;; 45_web.el ends here
