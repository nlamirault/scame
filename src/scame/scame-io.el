;; scame-io.el --- Scame I/O tools

;; Copyright (c) 2015 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

(defvar scame-buffer "*scame*")


(with-current-buffer (get-buffer-create scame-buffer)
  (setq inhibit-startup-screen t))
(switch-to-buffer scame-buffer)
(with-current-buffer scame-buffer
  (insert "-----------\n|  Scame  |\n-----------\n\n"))


(defun scame--msg-buffer (msg)
  "Write `MSG' to the scame buffer."
  (with-current-buffer scame-buffer
    (goto-char (point-max))
    (insert msg)))


(provide 'scame-io)
;;; scame-io.el ends here
