;; 991_scame_utils.el --- Scame utilities

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

(defvar scame-package-version "0.7.0"
  "Release version of Scame.")

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
  (if (file-readable-p scame-user-customization-file)
      (switch-to-buffer (find-file-noselect scame-user-customization-file))
    (message "Scame: No customization file %s" scame-user-customization-file)))


(defun scame-project-website ()
  "Open in a browser the project's website."
  (interactive)
  (browse-url "https://github.com/nlamirault/scame"))

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
  (let* ((response (perform-rest-request
                    "https://github.com/nlamirault/scame/releases"))
	 (release (caar (s-match-strings-all "/[0-9.]*.zip" response))))
    (message "Scame last version: %s"
             (s-replace-all '((".zip" . "") ("/" . "")) release))))

;;;###autoload
(defun scame-bug-report ()
  "File a bug report about the `scame' project."
  (interactive)
  (browse-url "https://github.com/nlamirault/scame/issues/new"))

(provide '991_scame_utils)
;;; 991_scame_utils.el ends here
