;;; 99_global_keys.el --- Global key settings

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


;; General
;; ------------

(global-set-key "\C-cl" ;;'package-list-packages-no-fetch)
                'package-list-packages)

(global-set-key "\C-cq"
                (defun scame-quit-emacs ()
                  (interactive)
                  (if (yes-or-no-p "Quit emacs? ")
                      (save-buffers-kill-emacs))))


;; Navigation
;; -----------

(global-set-key (kbd "C-<down>")
                (function (lambda ()
                            (interactive)
                            (scroll-up 1))))

(global-set-key (kbd "C-<up>")
                (function (lambda ()
                            (interactive)
                            (scroll-down 1))))


;; Web
;; ----

(global-set-key "\C-cu" 'browse-url-at-point)

(global-set-key "\C-cw" 'eww)

;; Editing
;; --------

;;(bind-key "M-g" 'goto-line)
;;(bind-key "M-}" 'next-buffer)
;;(bind-key "M-{" 'previous-buffer)



(provide '99_global_keys)
;;; 99_global_keys.el ends here
