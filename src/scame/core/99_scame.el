;; 99_scame.el --- Scame for Emacs

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

;; Scame is a configuration for Emacs.

;;; Code:

(use-package easymenu)


;; (use-package hydra
;;   :config (setq hydra-is-helpful t))

;;; Customization

;; (defgroup scame nil
;;   "Emacs starter kit."
;;   :group 'tools)

;; (defcustom scame-keymap-prefix (kbd "C-c s")
;;   "Scame keymap prefix."
;;   :group 'scame
;;   :type 'string)


;; Scame mode map

;; (defvar scame-mode-map
;;   (let ((map (make-sparse-keymap)))
;;     (let ((prefix-map (make-sparse-keymap)))
;;       (define-key map scame-keymap-prefix prefix-map))
;;     map)
;;   "Keymap used by `scame-mode'.")

;; (defhydra scame (scame-mode-map "C-c s")
;;   "scame"
;;   ("v" scame-version "version")
;;   ("z" scame-customization "customization"))

;; (defhydra scame-search (scame-mode-map "C-c s s")
;;   "Scame search"
;;   ("g" scame-search-google "google")
;;   ("h" scame-search-github "github")
;;   ("t" scame-search-twitter "twitter")
;;   ("l" scame-search-launchpad "launchpad")
;;   ("a" scame-search-arch-aur "arch aur"))

;; (defhydra scame-email (scame-mode-map "C-c s m")
;;   "Scame email"
;;   ("g" scame-mail-gmail "gmail")
;;   ("e" scame-mail-exchange "exchange")
;;   ("o" scame-mail-offlineimap "offllineimap"))

;; (defhydra scame-toggle (scame-mode-map "C-c s t")
;;   "Scame toggle"
;;   ("c" column-number-mode "column-number")
;;   ("d" toggle-debug-on-error "debug-on-error")
;;   ("q" toggle-debug-on-quit "debug-on-quit")
;;   ("f" auto-fill-mode "auto-fill")
;;   ("w" whitespace-mode "whitespace"))

;; (defhydra scame-launcher (scame-mode-map "C-c s l")
;;   "Scame launcher"
;;   ("c" calc "calc")
;;   ("m" man "man")
;;   ("p" paradox-list-packages "list-packages")
;;   ("h" proced "proced")
;;   ;;("t" scame-launch-term "term"))
;;   ("t" helm-mt "term"))

;; (defhydra scame-calendar (scame-mode-map "C-c s c")
;;   "Scame calendars"
;;   ("g" scame-google-calendar "scame-google-calendar")
;;   ("w" scame-work-calendar "scame-work-calendar")
;;   ("d" scame-diary-calendar "scame-diary-calendar")
;;   ("o" scame-org-calendar "scame-org-calendar"))

;; Scame main menu

;; (defun scame-mode-add-menu ()
;;   "Add a menu entry for `scame-mode' under Tools."
;;   (easy-menu-add-item nil '("Tools")
;; 		      '("Scame"
;; 			("General"
;; 			 ["Project site" scame-project-website]
;; 			 ["Changelog" scame-changelog]
;; 			 ["Version" scame-version]))))


;; (defun scame-mode-remove-menu ()
;;   "Remove `same-mode' menu entry."
;;   (easy-menu-remove-item nil '("Tools") "Scame"))

;;;###autoload
(defun scame-on ()
  "Turn on `scame-mode'."
  ;;(interactive)
  (scame-mode 1))

;;;###autoload
(defun scame-off ()
  "Turn off `scame-mode'."
  ;;(interactive)
  (scame-mode -1))

;; Scame mode

;; ;;;###autoload
;; (defconst scame-mode-line-lighter
;;   (s-concat " {SCAME-"  scame-version-number "}")
;;   "The default lighter for `scame-mode'.")

;; ;;;###autoload
;; (define-minor-mode scame-mode
;;   "Scame minor mode.

;; \\{scame-mode-map}"
;;   :lighter scame-mode-line-lighter
;;   :keymap scame-mode-map
;;   :group 'scame
;;   :require 'scame
;;   (if scame-mode
;;       ;; on start
;;       (scame-mode-add-menu)
;;     ;; on stop
;;     (scame-mode-remove-menu)))

;; ;;;###autoload
;; (define-globalized-minor-mode scame-global-mode scame-mode scame-mode)


(provide '99_scame)
;;; 99_scame.el ends here
