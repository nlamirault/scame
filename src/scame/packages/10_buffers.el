;;; 10_buffers.el --- Tools for buffers

;; Copyright (C) 2014-2017 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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


(use-package uniquify
  :config (setq uniquify-buffer-name-style 'forward
		uniquify-separator "/"
		uniquify-after-kill-buffer-p t
		uniquify-ignore-buffers-re "^\\*"))

(use-package ace-jump-mode
  :ensure t
  :pin melpa
  :bind (("C-c SPC" . ace-jump-mode)))


(use-package imenu-anywhere
  :ensure t
  :pin melpa
  :bind (("C-." . imenu-anywhere)))


(use-package recentf
  :ensure t
  :pin melpa
  :config (progn
	    (setq recentf-exclude (list (f-join user-emacs-directory ".recentf")))
	    (setq recentf-save-file (f-join user-emacs-directory ".recentf"))
	    (setq recentf-max-saved-items 100)
	    (setq recentf-auto-cleanup 'never)
	    (setq recentf-auto-save-timer (run-with-idle-timer 600 t 'recentf-save-list))))


(provide '10_buffers)
;;; 10_buffers.el ends here
