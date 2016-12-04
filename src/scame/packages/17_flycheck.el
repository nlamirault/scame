;;; 17_flycheck.el --- Settings for flycheck

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

;;; Code:

(use-package flycheck :quelpa
  ;; :defer scame-defer-package
  :config (add-hook 'after-init-hook #'global-flycheck-mode)
  :diminish flycheck-mode)

(use-package helm-flycheck :quelpa
  ;; :defer scame-defer-package
  :bind (("C-c ! h" . helm-flycheck)))

(use-package flycheck-color-mode-line :quelpa
  ;; :defer scame-defer-package
  :config (add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

(use-package flycheck-cask :quelpa
  ;; :defer scame-defer-package
  :config (add-hook 'flycheck-mode-hook #'flycheck-cask-setup))


(provide '17_flycheck)
;;; 17_flycheck.el ends here
