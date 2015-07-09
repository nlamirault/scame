;; 99_scame.el --- Scame for Emacs

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





;;;###autoload
(defun scame-on ()
  "Turn on `scame-mode'."
  ;;(interactive)
  (scame-mode 1))

;;;###autoload
(defun scame-off ()
  "Turn off `scame-mode'."
  ;;(interactive)
  (scame-mode -1))

(provide '99_scame)
;;; 99_scame.el ends here
