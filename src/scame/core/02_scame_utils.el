;; 02_scame_utils.el --- Scame utilities

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

(require 'f)
(require 's)


;; Scame project

(defun scame-version ()
  "Return the Scame's version."
  (interactive)
  (message "Scame version: %s" scame-version-number))

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


;; Editing

(dolist (hook '(special-mode-hook
                Info-mode-hook
                eww-mode-hook
                term-mode-hook
                comint-mode-hook
                compilation-mode-hook
                twittering-mode-hook
                minibuffer-setup-hook))
  (add-hook hook (lambda ()
                   (setq show-trailing-whitespace nil))))


;; Tools

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


;; See: http://oremacs.com/2015/03/05/testing-init-sanity/
;;;###autoload
(defun scame-test-emacs ()
  "Run a batch Emacs with current config to see if it errors out or not."
  (interactive)
  (require 'async)
  (async-start
   (lambda () (shell-command-to-string
          "emacs --batch --eval \"
(condition-case e
    (progn
      (load \\\"~/.emacs.d/init.el\\\")
      (message \\\"-OK-\\\"))
  (error
   (message \\\"ERROR!\\\")
   (signal (car e) (cdr e))))\""))
   `(lambda (output)
      (if (string-match "-OK-" output)
          (when ,(called-interactively-p 'any)
            (message "All is well"))
        (switch-to-buffer-other-window "*startup error*")
        (delete-region (point-min) (point-max))
        (insert output)
        (search-backward "ERROR!")))))


(provide '02_scame_utils)
;;; 02_scame_utils.el ends here
