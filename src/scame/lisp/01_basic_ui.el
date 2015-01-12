;;; 01_basic_ui.el --- Emacs basic UI

;; Copyright (c) 2014, 2015 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

(setq-default fill-column 120)

(global-linum-mode 1)
;;(setq column-number-mode t)

(require 'tool-bar)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(use-package tool-bar
  :config (tool-bar-mode -1))

; show the current line and column numbers in the stats bar as well
(line-number-mode t)
(column-number-mode t)
(blink-cursor-mode nil)

(when (display-graphic-p)
  (setq x-select-enable-clipboard t))

;; Window moves
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

;; Window resize
(global-set-key (kbd "M-<down>") 'enlarge-window)
(global-set-key (kbd "M-<up>") 'shrink-window)
(global-set-key (kbd "M-<left>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-<right>") 'shrink-window-horizontally)

;;(use-package golden-ratio)

(provide '01_basic_ui)
;;; 01_basic_ui.el ends here
