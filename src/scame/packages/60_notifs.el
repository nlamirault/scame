;;; 60_notifs.el --- Notifications for Emacs

;; Copyright (c) 2014, 2016 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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


(defun scame--desktop-notify (title message)
   (notifications-notify :title title :body message))


(use-package alert :quelpa
  :config (cond
           (linux-p
            (setq alert-default-style 'libnotify))
           (darwin-p
            (setq alert-default-style 'notifier))
           (console-p
            (setq alert-default-style 'message))))


(use-package sauron :quelpa
  :init (progn
          (define-prefix-command 'scame-sauron-map)
          (global-set-key (kbd "C-x s") 'scame-sauron-map)
          (add-hook 'sauron-event-added-functions 'sauron-alert-el-adapter)
          (setq sauron-separate-frame nil
                sauron-hide-mode-line t
                sauron-log-events t
                sauron-dbus-cookie t
                sauron-modules '(sauron-notifications sauron-dbus)))
  :bind (("C-x s s" . sauron-toggle-hide-show)
         ("C-x s c" . sauron-clear)))

(provide '60_notifs)
;;; 60_notifs.el ends here
