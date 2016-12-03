;;; scame-mu4e-local.el --- Localhost configuration for Mu4e

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


;; ------------------------------------------
;; Setup:
;; - mbsync to sync IMAP in maildir format
;; - msmtp to send emails
;; ------------------------------------------

;; Customization :
(setq scame-maildir-local "/opt/Exchange")

;; default
(setq mu4e-maildir scame-maildir-local)


;; MSMTP
;; -----

(setq message-sendmail-f-is-evil 't
      message-sendmail-extra-arguments '("--read-envelope-from")
      message-send-mail-function 'message-send-mail-with-sendmail
      sendmail-program "/usr/sbin/msmtp")


(setq mu4e-drafts-folder "/Drafts")
;; (setq mu4e-sent-folder   "/[Gmail].Sent Mail")
(setq mu4e-trash-folder  "/Trash")

;; don't save message to Sent Messages, GMail/IMAP will take care of this
(setq mu4e-sent-messages-behavior 'delete)

;; setup some handy shortcuts
;; (setq mu4e-maildir-shortcuts
;;       '(("/Inbox"             . ?i)
;;         ("/INBOX.Cloud"       . ?c)
;;         ))

;;; Bookmarks
(setq mu4e-bookmarks
      `(("flag:unread AND NOT flag:trashed AND NOT (maildir:/[Gmail].Trash OR maildir:/Trash)" "Unread messages" ?u)
        ("date:today..now" "Today's messages" ?t)
        ("date:7d..now" "Last 7 days" ?w)
        ("mime:image/*" "Messages with images" ?p)
        ;; Own directories
        (,(mapconcat 'identity
                     (mapcar
                      (lambda (maildir)
                        (concat "maildir:" (car maildir)))
                      mu4e-maildir-shortcuts) " OR ")
         "All inboxes" ?i)))


;; UI

(setq mu4e-show-images t)




(provide 'scame-mu4e-gmail)
;;; scame-mu4e-gmail.el ends here
