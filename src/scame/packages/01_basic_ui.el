;;; 01_basic_ui.el --- Emacs basic UI

;; Copyright (c) 2014-2016 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

(when (display-graphic-p)

  (menu-bar-mode -1)
  (scroll-bar-mode -1)

  (use-package tool-bar
    :config (tool-bar-mode -1))

  (setq x-select-enable-clipboard t)

  (use-package mode-icons
    :config (mode-icons-mode))

  )

(use-package ace-window
  :config (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  :bind ("C-x o" . ace-window))

;; (use-package beacon
;;   :diminish beacon-mode
;;   :config (progn
;;             (beacon-mode 1)
;;             (setq beacon-blink-delay 0.2
;;                   beacon-blink-duration 0.2
;;                   beacon-blink-when-point-moves 7
;;                   beacon-blink-when-window-changes t
;;                   beacon-blink-when-window-scrolls t
;;                   beacon-color "brown"
;;                   beacon-push-mark 5
;;                   beacon-size 25)))

(provide '01_basic_ui)
;;; 01_basic_ui.el ends here
