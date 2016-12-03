;;; scame-mu4e.el --- Mu4e configuration

;; Copyright (C) 2014, 2015, 2016 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

(require 'mu4e)


(setq mu4e-mu-binary "~/bin/mu")
(setq mu4e-headers-fields
      '((:date . 25) (:flags . 6) (:from-or-to . 22) (:subject)))
(setq mu4e-headers-date-format "%x %H:%M")



;; SMTP
;; ----

(setq send-mail-function 'smtpmail-send-it
      message-send-mail-function 'smtpmail-send-it
      smtpmail-debug-info t
      smtpmail-debug-verb t
      message-signature-file "~/.signature")


;; PGP
;; ------

(add-hook 'mu4e-compose-mode-hook 'epa-mail-mode)
(add-hook 'mu4e-view-mode-hook 'epa-mail-mode)


(provide 'scame-mu4e)
;;; scame-mu4e.el ends here
