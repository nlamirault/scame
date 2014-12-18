;;; 80_misc.el -- Misc components

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

(use-package guide-key
  :init (progn
         (setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-c"))
         (setq guide-key/idle-delay 0.5)
         (setq guide-key/align-command-by-space-flag t)
         (guide-key-mode 1)))


(use-package discover-my-major
  :bind ("C-h C-m" . discover-my-major))


(provide '80_misc)
;;; 80_misc.el ends here
