;;; 19_vc.el --- Version control

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

(use-package magit
  :ensure t
  :pin melpa
  :config (progn
            (setq magit-completing-read-function 'ivy-completing-read))
  :bind (("C-c g s" . magit-status)
	 ("C-c g d" . magit-pull)
	 ("C-c g p" . magit-push)
	 ("C-c g l" . magit-log-all)
	 ("C-c g b" . magit-branch-manager)))

(setq magit-auto-revert-mode nil
      magit-last-seen-setup-instructions "1.4.0")

;; (use-package magithub
;;   :after magit
;;   :config (magithub-feature-autoinject t))

(use-package gitconfig-mode
  :ensure t
  :pin melpa
  )

(use-package gitignore-mode
  :ensure t
  :pin melpa
  )

(provide '19_vc)
;;; 19_vc.el ends here
