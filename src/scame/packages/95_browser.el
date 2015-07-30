;;; 95_browser.el --- Browser configuration

;; Copyright (C) 2014, 2015 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

;; FIX:
;;
;; Debugger entered--Lisp error: (file-error "Cannot open load file" "w3m-cookie")
;;   w3m-cookie-shutdown()
;;   kill-emacs(t)
;;   command-line()
;;   normal-top-level()
;; Use:
;; (remove-hook 'kill-emacs-hook 'w3m-cookie-shutdown)

;; (use-package w3m
;;   :commands w3m
;;   ;;:init (remove-hook 'kill-emacs-hook 'w3m-cookie-shutdown)
;;   :config (progn
;;             (setq w3m-coding-system 'utf-8)
;;             (setq w3m-file-coding-system 'utf-8)
;;             (setq w3m-file-name-coding-system 'utf-8)
;;             (setq w3m-input-coding-system 'utf-8)
;;             (setq w3m-output-coding-system 'utf-8)
;;             (setq w3m-terminal-coding-system 'utf-8)))

;; (use-package w3m-cookie
;;   :config (setq w3m-use-cookies t))



(use-package eww
  ;; :defer scame-defer-package
  :config (progn
            (setq shr-color-visible-luminance-min 70)))

(provide '95_browser)
;;; 95_browser.el ends here
