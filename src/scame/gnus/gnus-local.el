;;; gnus-local.el --- Localhost IMAP configuration for Gnus

;; Copyright (C) 2015, 2016 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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
(require 'scame-gnus-tools)


;; ------------------------------------------
;; Setup:
;; - mbsync to sync IMAP in maildir format
;; - dovecot for local IMAP server
;; - msmtp to send emails
;; ------------------------------------------

;; Customization :
;; (setq scame-maildir-local "/opt/Exchange")


;; IMAP Localhost offlineimap

;; (setq gnus-select-method
;;       '(nnimap "Exchange"
;;                (nnimap-stream shell)
;;                (nnimap-shell-program
;;                	 "/usr/lib/dovecot/imap -o mail_location=maildir:/opt/Exchange:LAYOUT=fs:INBOX=/opt/Exchange/INBOX")))

;; IMAP Localhost imapsync
;; (setq gnus-select-method
;;       '(nnimap "Exchange"
;;                (nnimap-stream shell)
;;                (nnimap-shell-program
;;                	 "/usr/lib/dovecot/imap -o mail_location=maildir:/opt/Exchange:LAYOUT=fs:INBOX=/opt/Exchange/Inbox")))

(setq gnus-select-method
      `(nnimap "Exchange"
               (nnimap-stream shell)
               (nnimap-shell-program
                (concat "/usr/lib/dovecot/imap -o mail_location=maildir:"
                        ,scame-maildir-local ":LAYOUT=fs:INBOX="
                        ,scame-maildir-local "/Inbox"))))


;; (setq gnus-secondary-select-methods
;;       '((nnimap "Other"
;;                 (nnimap-stream shell)
;;                 (nnimap-shell-program
;;                  "/usr/lib/dovecot/imap -o 'mail_location=maildir:~/Mail/Other'"))))

;; MSMTP
;; -----

(setq message-sendmail-f-is-evil 't
      message-sendmail-extra-arguments '("--read-envelope-from")
      message-send-mail-function 'message-send-mail-with-sendmail
      sendmail-program "/usr/sbin/msmtp")


;; Notmuch
;; --------

(use-package notmuch)

(use-package notmuch-labeler)

(use-package org-gnus)

(defun lld-notmuch-shortcut ()
  (define-key gnus-group-mode-map "GG" 'notmuch-search)
  )

(defun lld-notmuch-file-to-group (file)
  "Calculate the Gnus group name from the given file name."
  (let ((group (file-name-directory (directory-file-name (file-name-directory file)))))
    (setq group (replace-regexp-in-string ".*/opt/OrangeExchange/" "" group))
    (setq group (replace-regexp-in-string "/$" "" group))
    (if (string-match ":$" group)
        (concat group "INBOX")
      (replace-regexp-in-string ":\\." ":" group))))

(defun lld-notmuch-goto-message-in-gnus ()
  "Open a summary buffer containing the current notmuch article."
  (interactive)
  (let ((group (lld-notmuch-file-to-group (notmuch-show-get-filename)))
        (message-id (replace-regexp-in-string
                     "^id:" "" (notmuch-show-get-message-id))))
    (setq message-id (replace-regexp-in-string "\"" "" message-id))
    (if (and group message-id)
        (progn
          (switch-to-buffer "*Group*")
          (org-gnus-follow-link group message-id))
      (message "Couldn't get relevant infos for switching to Gnus."))))

(define-key notmuch-show-mode-map (kbd "C-c C-c") 'lld-notmuch-goto-message-in-gnus)


(add-hook 'gnus-group-mode-hook 'lld-notmuch-shortcut)


(provide 'gnus-local)
;;; gnus-local.el ends here
