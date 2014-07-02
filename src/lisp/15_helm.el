;;; 15_helm.el --- HELM configuration

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


;;(require 'helm)

(use-package helm
  :init (helm-mode 1)
  :config (progn
	    (setq helm-ff-tramp-not-fancy nil)
	    (setq helm-ff-skip-boring-files t)
	    (add-to-list 'helm-boring-buffer-regexp-list "\\*tramp")
	    (add-to-list 'helm-boring-buffer-regexp-list "\\*epc")
	    (add-to-list 'helm-boring-buffer-regexp-list "\\.elc$")
	    (add-to-list 'helm-boring-buffer-regexp-list "\\.pyc$"))
  :bind (("C-c M-f" . helm-find-files)
         ("C-c f" . helm-for-files)
         ("C-c M-x" . helm-M-x)
         ("M-y" . helm-show-kill-ring)
	 ("C-c b" . helm-buffers-list)))
	 ;;("C-x C-i" . helm-imenu)))

(use-package helm-imenu
  :bind (("C-x C-i" . helm-imenu)))


(use-package helm-proc)

(use-package helm-descbinds)


(provide '15_helm)
;;; 15_helm.el ends here
