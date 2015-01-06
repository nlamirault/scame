;; 999_scame.el --- Scame for Emacs

;; Copyright (c) 2014 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

;;; Customization

(defgroup scame nil
  "Emacs starter kit."
  :group 'tools)

(defcustom scame-keymap-prefix (kbd "C-c s")
  "Scame keymap prefix."
  :group 'scame
  :type 'string)


;; Scame mode map

(defvar scame-mode-map
  (let ((map (make-sparse-keymap)))
    (let ((prefix-map (make-sparse-keymap)))
      (define-key prefix-map (kbd "v") 'scame-version)
      ;;(define-key prefix-map (kbd "u") 'scame-last-release)
      ;;(define-key prefix-map (kbd "c") 'scame-changelog)
      (define-key prefix-map (kbd "z") 'scame-customization)
      ;; Search
      (define-key prefix-map (kbd "s g") 'scame-search-google)
      (define-key prefix-map (kbd "s h") 'scame-search-github)
      (define-key prefix-map (kbd "s t") 'scame-search-twitter)
      (define-key prefix-map (kbd "s l") 'scame-search-launchpad)
      (define-key prefix-map (kbd "s a") 'scame-search-arch-aur)
      ;; Mail
      (define-key prefix-map (kbd "m g") 'scame-mail-gmail)
      (define-key prefix-map (kbd "m e") 'scame-mail-exchange)
      (define-key prefix-map (kbd "m o") 'scame-mail-offlineimap)
      ;; Toggle map
      (define-key prefix-map (kbd "t c") 'column-number-mode)
      (define-key prefix-map (kbd "t d") 'toggle-debug-on-error)
      (define-key prefix-map (kbd "t f") 'auto-fill-mode)
      (define-key prefix-map (kbd "t q") 'toggle-debug-on-quit)
      (define-key prefix-map (kbd "t w") 'whitespace-mode)
      ;; Launcher map
      (define-key prefix-map (kbd "l c") 'calc)
      (define-key prefix-map (kbd "l m") 'man)
      (define-key prefix-map (kbd "l p") 'paradox-list-packages)
      (define-key prefix-map (kbd "l h") 'proced) ;; htop :)
      (define-key prefix-map (kbd "l t") 'scame-launch-term)
      (define-key map scame-keymap-prefix prefix-map))
    map)
  "Keymap used by `scame-mode'.")


;; Scame main menu

(defun scame-mode-add-menu ()
  "Add a menu entry for `scame-mode' under Tools."
  (easy-menu-add-item nil '("Tools")
		      '("Scame"
			("Search"
			 ["Google" scame-search-google]
			 ["Github" scame-search-github]
			 ["Twitter" scame-search-twitter]
			 ["Launchpad" scame-search-launchpad]
			 ["Arch-AUR" scame-search-arch-aur])
			("General"
			 ["Project site" scame-project-website]
			 ["Changelog" scame-changelog]
			 ["Version" scame-version]))))


(defun scame-mode-remove-menu ()
  "Remove `same-mode' menu entry."
  (easy-menu-remove-item nil '("Tools") "Scame"))


;; Scame mode

;;;###autoload
(defconst scame-mode-line-lighter
  (s-concat " {SCAME-" scame-package-version "}")
  "The default lighter for `scame-mode'.")

(define-minor-mode scame-mode
  "Scame minor mode.

\\{scame-mode-map}"
  :lighter scame-mode-line-lighter
  :keymap scame-mode-map
  :group 'scame
  :require 'scame
  (if scame-mode
      ;; on start
      (scame-mode-add-menu)
    ;; on stop
    (scame-mode-remove-menu)))

;;;###autoload
(define-globalized-minor-mode scame-global-mode scame-mode scame-on)

(defun scame-on ()
  "Turn on `scame-mode'."
  (interactive)
  (scame-mode 1))

(defun scame-off ()
  "Turn off `scame-mode'."
  (interactive)
  (scame-mode -1))

(provide '999_scame)
;;; 999_scame.el ends here
