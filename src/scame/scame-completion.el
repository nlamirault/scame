;;; scame-completion.el --- Completion system

;; Copyright (c) 2014-2018 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

(use-package company
  :ensure t
  :pin melpa
  :init (add-hook 'after-init-hook 'global-company-mode)
  :bind (("M-/" . company-complete)
         ("C-c C-y" . company-yasnippet)
         :map company-active-map
         ("C-p" . company-select-previous)
         ("C-n" . company-select-next)
         ("<tab>" . company-complete-common-or-cycle)
         ("<backtab>" . company-select-previous)
         :map company-search-map
         ("C-p" . company-select-previous)
         ("C-n" . company-select-next))
  :config (setq company-tooltip-align-annotations t
                company-idle-delay 0.5
                company-minimum-prefix-length 2
                company-require-match nil
                company-dabbrev-ignore-case nil
                company-dabbrev-downcase nil)
  :diminish company-mode)

(use-package company-quickhelp
  :if (display-graphic-p)
  :bind (:map company-active-map
              ("M-h" . company-quickhelp-manual-begin))
  :config (company-quickhelp-mode 1))

;; (use-package company-shell
;;   :ensure t
;;   :pin melpa
;;   :config (progn
;;             (add-to-list 'company-backends 'company-shell)))

;; (use-package company-emoji
;;   :ensure t
;;   :pin melpa
;;   :config (add-to-list 'company-backends 'company-emoji))


(provide 'scame-completion)
;;; scame-completion.el ends here
