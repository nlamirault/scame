;;; 13_modeline.el --- Mode-line configuration

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


;; (use-package powerline
;;   :config (progn
;; 	    (powerline-default-theme)
;; 	    (setq ;powerline-height 25
;;                   powerline-default-separator 'slant))) ;;'arrow-fade)))


(use-package smart-mode-line
 :init (setq sml/no-confirm-load-theme t)
 :config (progn
           (sml/setup)
           (sml/apply-theme 'smart-mode-line-dark)))
(setq sml/theme 'respectful)))


;; (use-package spaceline-segments
;;   :init (setq-default
;; 	 powerline-default-separator 'wave
;; 	 ;;spaceline-window-numbers-unicode t
;; 	 powerline-height 18)
;;   :config (require 'spaceline-segments))

;; (spaceline-install
;;  '(((workspace-number window-number)
;;     :fallback evil-state
;;     :separator "|"
;;     :face highlight-face)
;;    anzu
;;    (buffer-modified buffer-size buffer-id remote-host)
;;    major-mode
;;    ((flycheck-error flycheck-warning flycheck-info)
;;     :when active)
;;    (((minor-modes :separator spaceline-minor-modes-separator)
;;      process)
;;     :when active)
;;    (erc-track :when active)
;;    (version-control :when active)
;;    (org-pomodoro :when active)
;;    (org-clock :when active)
;;    nyan-cat)
;;  `(;;(battery :when active)
;;    selection-info
;;    ((buffer-encoding-abbrev
;;      point-position
;;      line-column)
;;     :separator " | ")
;;    (global :when active)
;;    buffer-position
;;    hud))


(provide '13_modeline)
;;; 13_modeline.el ends here
