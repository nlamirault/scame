;; 03_scame_email.el ---  Email setup in Scame

;; Copyright (c) 2014, 2015 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

;; Scame is a configuration for Emacs.

;;; Code:

(require 'f)


(defun scame--gnus-init-file (filename)
  (f-join user-emacs-directory filename))

(defun scame--gnus-startup-file (filename)
  (f-join user-home-directory filename))


(defvar scame--gmail-backend nil
  "The GMail backend used.")

(defun scame-mail-local ()
  "Launch Gnus using localhost IMAP server."
  (interactive)
  (setq gnus-init-file (scame--gnus-init-file "scame/gnus/gnus-local.el")
        gnus-startup-file (scame--gnus-startup-file ".localhost-newsrc"))
  (gnus))

(defun scame-mail-gmail ()
  "Launch Gnus using GMail configuration."
  (interactive)
  (setq gnus-init-file (scame--gnus-init-file "scame/gnus/gnus-gmail.el")
        gnus-startup-file (scame--gnus-startup-file ".gmail-newsrc")
        scame--gmail-backend 'imap)
  (gnus))

(defun scame-mail-exchange ()
  "Launch Gnus using Exchange configuration."
  (interactive)
  (setq gnus-init-file (scame--gnus-init-file "scame/gnus/gnus-exchange.el")
        gnus-startup-file (scame--gnus-startup-file ".exchange-newsrc"))
  (gnus))


(provide '03_scame_email)
;;; 03_scame_email.el ends here
