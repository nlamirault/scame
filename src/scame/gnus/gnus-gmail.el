;;; gnus-gmail.el --- Gmail configuration for Gnus

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

(require 'gnus)
(require 'smtpmail)

(require 'scame-gnus)
(require 'scame-bbdb)


;; GMail IMAP configuration
;; -------------------------

;; Place a line like the following in ~/.authinfo
;; machine imap.gmail.com login your-name@gmail.com password your-password port 993
;; and make sure that no-one else can read it with
;; chmod 600 ~/.authinfo

(setq gnus-select-method
      '(nnimap "gmail"
               (nnimap-address "imap.gmail.com")
               (nnimap-server-port 993)
               (nnimap-stream ssl)
               ;; press 'E' to expire email
               (nnmail-expiry-target "nnimap+gmail:[Gmail]/Trash")))


;; GMail SMTP configuration

;; If you don't want to be prompted for a password on every mail sent,
;; you can add the following line to your ~/.authinfo.
;; machine smtp.gmail.com login your-name@gmail.com password your-password port 465
;; chmod 600 ~/.authinfo

(setq smtpmail-smtp-service 465
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-default-smtp-server smtpmail-smtp-server
      smtpmail-auth-credentials (expand-file-name "~/.authinfo")
      smtpmail-stream-type 'ssl)


;; Keybindings

(defun gmail-delete ()
  "Delete current mail."
  (interactive)
  (gnus-summary-move-article nil "nnimap+gmail:[Gmail]/Trash"))

(defun gmail-archive ()
  "Archive the current or marked mails.
This moves them into the All Mail folder."
  (interactive)
  (gnus-summary-move-article nil "nnimap+imap.gmail.com:[Gmail]/All Mail"))

(defun gmail-report-spam ()
  "Report the current or marked mails as spam.
This moves them into the Spam folder."
  (interactive)
  (gnus-summary-move-article nil "nnimap+imap.gmail.com:[Gmail]/Spam"))

(defun gmail-summary-keys ()
  "Some keybindings for Gmail."
  (local-set-key "y" 'gmail-archive)
  (local-set-key "x" 'gmail-delete)
  (local-set-key "$" 'gmail-report-spam))

(add-hook 'gnus-summary-mode-hook 'gmail-summary-keys)

(define-key gnus-summary-mode-map
  (kbd "B d")
  (lambda ()
    (interactive)
    (gnus-summary-move-article nil "nnimap+gmail:[Gmail]/Trash")))

(define-key gnus-summary-mode-map
  (kbd "B s")
  (lambda ()
    (interactive)
    (gnus-summary-move-article nil "nnimap+gmail:[Gmail]/Spam")))

(provide 'gnus-gmail)
;;; gnus-gmail.el ends here
