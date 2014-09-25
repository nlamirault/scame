;;; 54_im.el --- Instant Messaging configuration

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


(use-package jabber
  :bind (("C-c i i" . jabber-chat-with)
         ("C-c i j" . jabber-connect-all)
         ("C-c i d" . jabber-disconnect)
         ("C-c i r" . jabber-display-roster))
  :config (progn
            (setq jabber-roster-line-format " %c %-25n %S"
                  jabber-use-sasl nil
                  jabber-history-enabled t
                  jabber-use-global-history nil
                  jabber-backlog-number 40
                  jabber-backlog-days 30)
            (add-hook 'jabber-chat-mode 'visual-line-mode)
            (setq jabber-chat-buffer-format "Chat: %n")))

(provide '54_im)
;;; 54_im.el ends here
