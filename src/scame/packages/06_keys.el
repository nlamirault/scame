;;; 06_keys.el -- keys tools

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


(use-package which-key
  :ensure t
  :pin melpa
  :init (progn
          (which-key-mode)
          ;; (setq which-key-popup-type 'minibuffer)
          (setq which-key-popup-type 'side-window)
          (setq which-key-side-window-max-width 0.33)
          (setq which-key-side-window-max-height 0.25))
  :diminish which-key-mode)

(use-package hydra
  :ensure t
  :pin melpa
  :config (progn
            (setq hydra-is-helpful t)))

(provide '06_keys)
;;; 06_keys.el ends here
