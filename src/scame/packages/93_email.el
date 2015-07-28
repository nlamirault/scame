;;; 93_email.el --- Scame Email configuration

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

(when scame-email

  (use-package notmuch)

  (use-package notmuch-labeler)

  (use-package bbdb-com
    :bind (("C-c d s" . bbdb)
           ("C-c d n" . bbdb-search-name)
           ("C-c d m" . bbdb-search-mail)))

  (use-package helm-bbdb
    :bind (("C-c d h" . helm-bbdb)))

  )

(provide '93_email)
;;; 93_email.el ends here
