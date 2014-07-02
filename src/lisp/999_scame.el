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


;; Misc

(defvar scame-package-version "0.7.0"
  "Release version of Scame.")

;;(setq user-home-directory (f-full (getenv "HOME")))

(defun scame-version ()
  "Return the Scame's version."
  (interactive)
  (message "Scame version: %s" scame-package-version))


(defun scame-changelog ()
  "Display the ChangeLog."
  (interactive)
  (let ((changelog (f-join user-home-directory ".scame/ChangeLog.md")))
    (if (file-readable-p changelog)
	(switch-to-buffer (find-file-noselect changelog))
      (message "Scame: No Changelog available."))))


(defun scame-customization ()
  "Open the customization file."
  (interactive)
  (let ((customization (f-join user-home-directory ".config/scame/user.el")))
    (if (file-readable-p customization)
	(switch-to-buffer (find-file-noselect customization))
      (message "Scame: No customization file %s" customization))))


(defun scame-project-website ()
  "Open in a browser the project's website."
  (interactive)
  (browse-url
  ;;(helm-browse-url
   "https://github.com/nlamirault/scame"))


(defun perform-rest-request (url)
  "Perform an HTTP request using URL and return the response."
  (let ((buffer (url-retrieve-synchronously url)))
    (save-excursion
      (set-buffer buffer)
      (goto-char (point-min))
      (re-search-forward "^$" nil 'move)
      (setq response (buffer-substring-no-properties (point) (point-max)))
      (kill-buffer (current-buffer)))
    response))


(defun scame-last-release ()
  "Find from GitHub last release."
  (interactive)
  (let* ((response (perform-rest-request "https://github.com/nlamirault/scame/releases"))
	 (release (caar (s-match-strings-all "/[0-9.]*.zip" response))))
    (message "Scame last version: %s" (s-replace-all '((".zip" . "") ("/" . "")) release))))


;; Scame mode map

(defvar scame-mode-map
  (let ((map (make-sparse-keymap)))
    (let ((prefix-map (make-sparse-keymap)))
      (define-key prefix-map (kbd "v") 'scame-version)
      (define-key prefix-map (kbd "c") 'scame-changelog)
      (define-key prefix-map (kbd "z") 'scame-customization)
      (define-key prefix-map (kbd "s g") 'scame-search-google)
      (define-key prefix-map (kbd "s h") 'scame-search-github)
      (define-key prefix-map (kbd "s t") 'scame-search-twitter)
      (define-key prefix-map (kbd "s l") 'scame-search-launchpad)
      (define-key prefix-map (kbd "s a") 'scame-search-arch-aur)
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
