;;; 18_smex.el --- Smex configuration

;; Copyright (C) 2014, 2016 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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


(use-package smex :quelpa
  :config (progn
            (setq smex-save-file
                  (s-concat user-emacs-directory "/.smex-items"))
            (smex-initialize))
  :bind (("C-x M-x" . smex)
         ("C-x M-X" . smex-major-mode-commands)))


(provide '18_smex)
;;; 18_smex.el ends here
