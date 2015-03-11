;; 05_scame_mode.el --- Scame mode

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

(use-package easymenu)

(defvar scame-mode-map
  (let ((map (make-sparse-keymap)))
    (let ((prefix-map (make-sparse-keymap)))
      (define-key map scame-keymap-prefix prefix-map))
    map)
  "Keymap used by `scame-mode'.")


(defun scame-mode-add-menu ()
  "Add a menu entry for `scame-mode' under Tools."
  (easy-menu-add-item nil '("Tools")
		      '("Scame"
			("General"
			 ["Project site" scame-project-website]
			 ["Changelog" scame-changelog]
			 ["Version" scame-version]))))


(defun scame-mode-remove-menu ()
  "Remove `same-mode' menu entry."
  (easy-menu-remove-item nil '("Tools") "Scame"))


;;;###autoload
(defconst scame-mode-line-lighter
  (s-concat " {SCAME-"  scame-version-number "}")
  "The default lighter for `scame-mode'.")

;;;###autoload
(define-minor-mode scame-mode
  "Scame minor mode.

\\{scame-mode-map}"
  :lighter scame-mode-line-lighter
  :keymap scame-mode-map
  :group 'scame
  :require 'scame
  (if scame-mode
      ;; on start
      (scame-mode-add-menu)
    ;; on stop
    (scame-mode-remove-menu)))

;;;###autoload
(define-globalized-minor-mode scame-global-mode scame-mode scame-mode)



(provide '05_scame_mode)
;;; 05_scame_mode.el ends here
