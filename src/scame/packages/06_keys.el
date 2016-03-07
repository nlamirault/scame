;;; 06_keys.el -- keys tools

;; Copyright (C) 2014, 2015, 2016 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

;; (use-package guide-key
;;   :init (progn
;;          (setq guide-key/guide-key-sequence '("C-x" "C-c"))
;;          (setq guide-key/idle-delay 0.5)
;;          (setq guide-key/align-command-by-space-flag t)
;;          (guide-key-mode 1)))

(use-package which-key
  :init (progn
          (which-key-mode)
          ;; (setq which-key-popup-type 'minibuffer)
          (setq which-key-popup-type 'side-window)
          (setq which-key-side-window-max-width 0.33)
          (setq which-key-side-window-max-height 0.25))
  :diminish which-key-mode)

(use-package hydra
  :config (progn
            (setq hydra-is-helpful t)))

(use-package discover-my-major
  :bind ("C-h C-m" . discover-my-major))


(provide '06_keys)
;;; 06_keys.el ends here
