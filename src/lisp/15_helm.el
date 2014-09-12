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
  :init (progn
          (helm-mode 1)
          (define-prefix-command 'scame-helm-map)
          (global-set-key (kbd "C-x h") 'scame-helm-map))
  :config (progn
	    (setq helm-ff-tramp-not-fancy nil)
	    (setq helm-ff-skip-boring-files t)
	    (add-to-list 'helm-boring-buffer-regexp-list "\\*tramp")
	    (add-to-list 'helm-boring-buffer-regexp-list "\\*epc")
	    (add-to-list 'helm-boring-buffer-regexp-list "\\.elc$")
	    (add-to-list 'helm-boring-buffer-regexp-list "\\.pyc$"))
  :bind (("C-x h F" . helm-find-files)
         ("C-x h f" . helm-for-files)
         ("C-x h x" . helm-M-x)
         ("C-x h y" . helm-show-kill-ring)
	 ("C-x h b" . helm-buffers-list)))

(use-package helm-imenu
  :bind (("C-x h i" . helm-imenu)))

(use-package helm-proc)

(use-package helm-descbinds)

(use-package helm-delicious)


(provide '15_helm)
;;; 15_helm.el ends here
