;;; scame-mu4e-gmail.el --- Mu4e configuration for GMail

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
(require 'smtpmail)

(require 'scame-mu4e)

(setq mu4e-drafts-folder "/[Gmail].Drafts")
(setq mu4e-sent-folder   "/[Gmail].Sent Mail")
(setq mu4e-trash-folder  "/[Gmail].Trash")

;; don't save message to Sent Messages, GMail/IMAP will take care of this
(setq mu4e-sent-messages-behavior 'delete)

;; setup some handy shortcuts
(setq mu4e-maildir-shortcuts
      '(("/INBOX"             . ?i)
        ("/[Gmail].Sent Mail" . ?s)
        ("/[Gmail].Drafts"    . ?d)
        ("/[Gmail].Trash"     . ?t)))


;;; Bookmarks
(setq mu4e-bookmarks
      `(("flag:unread AND NOT flag:trashed AND NOT (maildir:/[Gmail].Trash OR maildir:/Trash)" "Unread messages" ?u)
        ("date:today..now" "Today's messages" ?t)
        ("date:7d..now" "Last 7 days" ?w)
        ("mime:image/*" "Messages with images" ?p)
        (,(mapconcat 'identity
                     (mapcar
                      (lambda (maildir)
                        (concat "maildir:" (car maildir)))
                      mu4e-maildir-shortcuts) " OR ")
         "All inboxes" ?i)))


;; UI

(setq mu4e-show-images t)

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


(provide 'scame-mu4e-gmail)
;;; scame-mu4e-gmail.el ends here
