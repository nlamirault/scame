;;; 12_directories.el --- Dired and friends configurations

;; Copyright (c) 2014, 2016 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

(use-package dired :quelpa
  :init (progn
          (define-prefix-command 'scame-dired-map)
          (global-set-key (kbd "C-x d") 'scame-dired-map)
	  (add-hook 'dired-mode-hook 'dired-hide-details-mode)
	  (put 'dired-find-alternate-file 'disabled nil)
	  (setq dired-recursive-deletes 'always)
	  (setq dired-recursive-copies 'always))
  :bind (("C-x d d" . dired)))

;; (use-package dired+
;;   :config (setq diredp-hide-details-initially-flag nil))

;; (use-package dired-details+
;;   :config (progn
;;             (setq dired-details-hide-link-targets nil
;;                   dired-hide-details-mode nil
;;                   global-dired-hide-details-mode -1)))

;; (use-package direx :quelpa
;;   :bind ("C-x d j" . direx:jump-to-directory))

;; (use-package direx-project :quelpa)

;; (use-package dired-k :quelpa
;;   :init (add-hook 'dired-initial-position-hook 'dired-k)
;;   :config (progn
;;             (define-key dired-mode-map (kbd "K") 'dired-k)
;;             (define-key dired-mode-map (kbd "g") 'dired-k)
;;             (add-hook 'dired-initial-position-hook 'dired-k)))

;; (use-package dired-filter :quelpa)

;; (use-package dired-open :quelpa)

;; (use-package dired-rainbow :quelpa)

;; (use-package dired-subtree :quelpa)

;; (use-package ranger :quelpa)


(provide '12_directories)
;;; 12_directories.el ends here
