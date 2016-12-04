;;; 13_modeline.el --- Mode-line configuration

;; Copyright (c) 2014, 2015, 2016 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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


;; (use-package smart-mode-line
;;  :init (setq sml/no-confirm-load-theme t)
;;  :config (progn
;;            (sml/setup)
;;            (sml/apply-theme 'smart-mode-line-dark)))
;; (setq sml/theme 'respectful)

;; (use-package spaceline
;;   :config (use-package spaceline-config
;;             :config
;;             (setq powerline-default-separator 'wave)
;;             (spaceline-define-segment line-column
;;                                       "The current line and column numbers."
;;                                       "l:%l c:%2c")
;;             ;;(spaceline-helm-mode)
;;             (spaceline-toggle-battery-on)
;;             (spaceline-toggle-minor-modes-on)
;;             (spaceline-toggle-flycheck-info-off)
;;             (spaceline-toggle-buffer-encoding-off)
;;             (spaceline-toggle-buffer-encoding-abbrev-off)
;;             (spaceline-toggle-buffer-size-off)
;;             (spaceline-toggle-persp-name-on)
;;             ;; (spaceline-define-segment time
;;             ;;                           "The current time."
;;             ;;                           (format-time-string "%H:%M"))
;;             ;; (spaceline-define-segment date
;;             ;;                           "The current date."
;;             ;;                           (format-time-string "%h %d"))
;;             ;; (spaceline-toggle-time-on)
;;             (spaceline-emacs-theme 'date 'time)))


(use-package powerline :quelpa)

(provide '13_modeline)
;;; 13_modeline.el ends here
