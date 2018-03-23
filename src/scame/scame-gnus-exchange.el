;;; scame-gnus-exchange.el --- Microsoft Exchange configuration for Gnus

;; Copyright (C) 2014, 2018 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

(require 'gnus)
(require 'smtpmail)
(require 'starttls)

(require 'scame-gnus)
(require 'scame-bbdb)

;; Exchange configuration
;; ----------------------

;; Place a line like the following in ~/.authinfo
;; machine imap.microsoft.com login your-name@microsoft.com password your-password port 993
;; and make sure that no-one else can read it with
;; chmod 600 ~/.authinfo

(setq gnus-select-method
      '(nnimap "exchange"
               (nnimap-address "exch-imap.microsoft.fr")
               (nnimap-server-port 993)
               (nnimap-stream ssl)))

;; If you don't want to be prompted for a password on every mail sent,
;; you can add the following line to your ~/.authinfo.
;; machine smtp.microsoft.com login your-name@microsoft.com password your-password port 465
;; chmod 600 ~/.authinfo

;; (setq smtpmail-debug-info t
;;       smtpmail-debug-vert t)

;; (defun gnutls-available-p ()
;;   "Function redefined in order not to use built-in GnuTLS support"
;;   nil)

;; (setq smtpmail-smtp-service 25 ;;587(starttls) or 465(tls/ssl)
;;       smtpmail-smtp-server "exch-smtp.microsoft.fr"
;;       smtpmail-default-smtp-server smtpmail-smtp-server
;;       smtpmail-auth-credentials (expand-file-name "~/.authinfo")
;;       smtpmail-starttls-credentials (expand-file-name "~/.authinfo")
;;       ;;smtpmail-stream-type 'ssl)
;;       smtpmail-stream-type 'starttls
;;       starttls-use-gnutls t
;;       starttls-gnutls-program "gnutls-cli"
;;       starttls-extra-arguments nil ;'("--priority" "NORMAL:%COMPAT")
;;       )

;; MSMTP
;; -------

;; Exemple of configuration file :
;; ##################
;; defaults
;; tls on
;; tls_starttls on
;; tls_trust_file /etc/certificate.crt

;; account test
;; host exch-smtp.microsoft.fr
;; domain exch-smtp.microsoft.fr
;; auth login
;; user mylogin
;; from myemail
;; password mypassword
;; port 25
;; logfile /tmp/msmtp.log
;; ##################


(setq message-sendmail-f-is-evil 't
      message-sendmail-extra-arguments '("--read-envelope-from")
      message-send-mail-function 'message-send-mail-with-sendmail
      sendmail-program "/usr/sbin/msmtp")

(provide 'scame-gnus-exchange)
;;; scame-gnus-exchange.el ends here
