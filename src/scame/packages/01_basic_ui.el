;;; 01_basic_ui.el --- Emacs basic UI

;; Copyright (c) 2014-2017 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

(use-package tool-bar
  :config (progn
            (menu-bar-mode -1)
            (scroll-bar-mode -1)
            (tool-bar-mode -1)))

(setq x-select-enable-clipboard t)

(use-package all-the-icons
  :ensure t
  :pin melpa)

(use-package mode-icons
  :ensure t
  :pin melpa
  :config (mode-icons-mode))

(use-package ace-window
  :ensure t
  :pin melpa
  :config (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  :bind (("C-x o" . ace-window)))

(use-package page-break-lines
  :ensure t
  :pin melpa)

(use-package dashboard
  :ensure t
  :pin melpa
  :config (progn
            (setq dashboard-items '(;(agenda . 5)
                                    (recents  . 5)
                                    (projects . 5)
                                    (bookmarks . 5)))
            (setq dashboard-banner-logo-title "Welcome to Scame")
            (setq dashboard-startup-banner 'official)
            (dashboard-setup-startup-hook)))

(provide '01_basic_ui)
;;; 01_basic_ui.el ends here
