;;; gnus-keys.el --- Gnus keybindings configuration

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


;; Keybindings
;; ------------

;; (add-hook 'gnus-summary-mode-hook
;;           (lambda ()
(define-key gnus-summary-mode-map
  (kbd "B u") 'gnus-summary-put-mark-as-unread)

(define-key gnus-summary-mode-map (kbd "B d")
  (lambda ()
    (interactive)
    (gnus-summary-move-article nil "nnimap+gmail:[Gmail]/Trash")))

(define-key gnus-summary-mode-map (kbd "B s")
  (lambda ()
    (interactive)
    (gnus-summary-move-article nil "nnimap+gmail:[Gmail]/Spam")))


(provide 'gnus-keys)
;;; gnus-keys.el ends here
