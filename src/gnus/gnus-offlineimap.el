;;; gnus-offlineimap.el --- Gmail configuration for Gnus

;; Copyright (C) 2014 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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
(require 'offlineimap)

(require 'scame-gnus)


(add-hook 'gnus-before-startup-hook 'offlineimap)

;; exemple of $HOME/.offlineimaprc file :

;; [general]
;; accounts = FT
;; maxsyncaccounts = 1
;; ui = Noninteractive.Basic

;; [Account FT]
;; localrepository = ft_local
;; remoterepository = ft_remote
;; autorefresh = 2
;; quick = 7

;; [Repository ft_local]
;; type = Maildir
;; localfolders = ~/Mail/FT

;; [Repository ft_remote]
;; type = IMAP
;; ssl = yes
;; port = 993
;; maxconnections = 2
;; remotehost = xx.xx.xx
;; remoteuser = yy.yy.yy
;; remotepass = zz.zz.zz


;; OfflineImap
;; ------------

(setq gnus-secondary-select-methods
      '((nnmaildir "GMail" (directory "~/Maildir/Gmail")) ; grab mail from here
        (nnfolder "archive"
                  (nnfolder-directory   "~/Maildir/archive") ; where I archive sent email
                  (nnfolder-active-file "~/Maildir/archive/active")
                  (nnfolder-get-new-mail nil)
                  (nnfolder-inhibit-expiry t))))

;; SMTP
;; -----

;; If you don't want to be prompted for a password on every mail sent,
;; you can add the following line to your ~/.authinfo.
;; machine smtp.gmail.com login your-name@gmail.com password your-password port 465
;; chmod 600 ~/.authinfo

(setq smtpmail-smtp-service 465
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-default-smtp-server smtpmail-smtp-server
      smtpmail-auth-credentials (expand-file-name "~/.authinfo")
      smtpmail-stream-type 'ssl)


(provide 'gnus-offlineimap)
;;; gnus-offlineimap.el ends here
