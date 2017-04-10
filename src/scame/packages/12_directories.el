;;; 12_directories.el --- Dired and friends configurations

;; Copyright (c) 2014-2017 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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
          (define-prefix-command 'scame-dired-map)
          (global-set-key (kbd "C-x d") 'scame-dired-map)
	  (add-hook 'dired-mode-hook 'dired-hide-details-mode)
	  (put 'dired-find-alternate-file 'disabled nil)
	  (setq dired-recursive-deletes 'always)
	  (setq dired-recursive-copies 'always))
  :bind (("C-x d d" . dired)))

(use-package all-the-icons-dired
  :ensure t
  :pin melpa
  :commands (all-the-icons-dired-mode)
  :init (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

(use-package direx
  :ensure t
  :pin melpa
  :bind ("C-x d j" . direx:jump-to-directory))

(provide '12_directories)
;;; 12_directories.el ends here
