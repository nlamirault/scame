;; 992_scame_email.el ---  Email setup in Scame

;; Copyright (c) 2014 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

(defun scame--gnus-init-file (filename)
  (f-join user-emacs-directory filename))

(defun scame--gnus-startup-file (filename)
  (f-join user-home-directory filename))



(defun scame-mail-gmail ()
  "Launch Gnus using GMail configuration."
  (interactive)
  (setq gnus-init-file (scame--gnus-init-file "scame/gnus/gnus-gmail.el")
        gnus-startup-file (scame--gnus-startup-file ".gmail-newsrc"))
  (gnus))
;;(global-set-key (kbd "C-c m g") 'scame-mail-gmail)

(defun scame-mail-exchange ()
  "Launch Gnus using Exchange configuration."
  (interactive)
  (setq gnus-init-file (scame--gnus-init-file "scame/gnus/gnus-exchange.el")
        gnus-startup-file (scame--gnus-startup-file ".exchange-newsrc"))
  (gnus))
;;(global-set-key (kbd "C-c m e") 'scame-mail-exchange)

(defun scame-mail-offlineimap ()
  "Launch Gnus using Offlineimap configuration."
  (interactive)
  (setq gnus-init-file (scame--gnus-init-file "scame/gnus/gnus-offlineimap.el")
        gnus-startup-file (scame--gnus-startup-file ".offlineimap-newsrc"))
  (gnus))
;;(global-set-key (kbd "C-c m o") 'scame-mail-offlineimap)


(provide '992_scame_email)
;;; 992_scame_email.el ends here
