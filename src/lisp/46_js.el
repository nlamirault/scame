;;; 46_js.el --- web languages configuration

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

(use-package js3-mode
  :init (setq js3-indent-level 4
              js3-mode-dev-mode-p t
              js3-auto-indent-p t
              js3-enter-indents-newline t
              js3-indent-on-enter-key t)
  :config (add-hook 'js3-mode-hook
                    (lambda ()
                      (flycheck-mode t)))
  :mode (("\\.js\\'" . js3-mode)))

(use-package tern
  :config (setq tern-command
                (list (expand-file-name
                       (or (executable-find "tern") "tern")))))

(use-package company-tern
  :init (add-to-list 'company-backends 'company-tern)
  :config (add-hook 'js3-mode-hook 'tern-mode))


(provide '46_js)
;;; 46_js.el ends here
