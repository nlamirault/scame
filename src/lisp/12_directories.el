;;; 12_directories.el --- Dired and friends configurations

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

;; Dired and cie.

;;; Code:

(use-package dired
  :init (progn
	  (add-hook 'dired-mode-hook 'dired-hide-details-mode)
	  (put 'dired-find-alternate-file 'disabled nil)
	  (setq dired-recursive-deletes 'always)
	  (setq dired-recursive-copies 'always)))


(use-package direx
  :bind ("C-x M-j" . direx:jump-to-directory))


(use-package direx-project)


;; Not available in MELP
;; (use-package dired-k
;;   :init (add-hook 'dired-initial-position-hook 'dired-k)
;;   :map (dired-mode-map ("K" . dired-k)))


(use-package dired-filter)

(use-package dired-open)

(use-package dired-rainbow)

(use-package dired-subtree)


(provide '12_direx)
;;; 12_directories.el ends here
