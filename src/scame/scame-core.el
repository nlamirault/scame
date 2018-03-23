;; scame-core.el --- Scame

;; Copyright (c) 2014-2018 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

(require 'scame-custom)


;;
;; Scame project
;; -----------------------------------


(defvar scame-project-uri "https://github.com/nlamirault/scame"
  "Website of the Scame project.")

(defvar scame-version-number "2.0.0"
  "Release version of Scame.

This number adheres to Semantic Versioning (`http://semver.org/').")


(defun scame-version ()
  "Return the Scame's version."
  (interactive)
  (message "Scame version: %s" scame-version-number))


(defun scame-changelog ()
  "Display the ChangeLog."
  (interactive)
  (browse-url (concat scame-project-uri "/blob/master/ChangeLog.md")))


(defun scame-open-customization ()
  "Open the customization file."
  (interactive)
  (if (file-readable-p scame-user-customization-file)
      (switch-to-buffer (find-file-noselect scame-user-customization-file))
    (message "Scame: No customization file %s" scame-user-customization-file)))


(defun scame-open-project-website ()
  "Open in a browser the project's website."
  (interactive)
  (browse-url scame-project-uri))


;;
;; Editing
;; -----------------------------------

(dolist (hook '(special-mode-hook
                Info-mode-hook
                eww-mode-hook
                term-mode-hook
                comint-mode-hook
                compilation-mode-hook
                minibuffer-setup-hook))
  (add-hook hook (lambda ()
                   (setq show-trailing-whitespace nil))))


;;
;; Tools
;; -----------------------------------

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
                    (concat scame-project-uri "/releases"))
         (release (caar (s-match-strings-all "/[0-9.]*.zip" response))))
    (message "Scame last version: %s"
             (s-replace-all '((".zip" . "") ("/" . "")) release)))))

;;;###autoload
(defun scame-bug-report ()
  "File a bug report about the `scame' project."
  (interactive)
  (browse-url (concat scame-project-uri "/issues/new")))


;;
;; Emails
;; -----------------------------------

(defun scame--gnus-init-file (filename)
  (f-join user-emacs-directory filename))

(defun scame--gnus-startup-file (filename)
  (f-join user-home-directory filename))


(defvar scame--gmail-backend nil
  "The GMail backend used.")

(defun scame-mail-local ()
  "Launch Gnus using localhost IMAP server."
  (interactive)
  (setq gnus-init-file (scame--gnus-init-file "scame/scame-gnus-local.el"))
  (setq gnus-startup-file (scame--gnus-startup-file ".localhost-newsrc"))
  (require 'scame-gnus)
  (gnus))

(defun scame-mail-gmail ()
  "Launch Gnus using GMail configuration."
  (interactive)
  (setq gnus-init-file (scame--gnus-init-file "scame/scame-gnus-gmail.el"))
  (setq gnus-startup-file (scame--gnus-startup-file ".gmail-newsrc"))
  (setq scame--gmail-backend 'imap)
  (require 'scame-gnus)
  (gnus))

(defun scame-mail-exchange ()
  "Launch Gnus using Exchange configuration."
  (interactive)
  (setq gnus-init-file (scame--gnus-init-file "scame/scame-gnus-exchange.el"))
  (setq gnus-startup-file (scame--gnus-startup-file ".exchange-newsrc"))
  (require 'scame-gnus)
  (gnus))


;;
;; Calendars
;; --------------------------------

(defvar google-ical-calendars nil
      "The Google calendar private URLs.")

(defun scame-google-calendar ()
  "Open the google calendar defined."
  (interactive)
  (when google-ical-calendars
    (cfw:open-calendar-buffer
     :contents-sources (mapcar (lambda (cal)
                          (cfw:ical-create-source (second cal)
                                                  (first cal)
                                                  (third cal)))
                               google-ical-calendars))))
            ;;(cfw:open-ical-calendar google-ical-calendar)))


(defun scame-org-calendar ()
  "Open the org calendar."
  (interactive)
  (cfw:open-org-calendar))

(defun scame-diary-calendar ()
  "Open the diary."
  (interactive)
  (cfw:open-diary-calendar))

(defun scame-work-calendar ()
  "Open the work calendar."
  (interactive))


;;
;; Scame mode
;; -----------------------------------------


(use-package easymenu)

(defvar scame-mode-map
  (let ((map (make-sparse-keymap)))
    (let ((prefix-map (make-sparse-keymap)))
      (define-key map scame-keymap-prefix prefix-map))
    map)
  "Keymap used by `scame-mode'.")

(defun scame-mode-add-menu ()
  "Add a menu entry for `scame-mode' under Tools."
  (easy-menu-add-item nil '("Tools")
                      '("Scame"
                        ("General"
                         ["Project site" scame-project-website]
                         ["Changelog" scame-changelog]
                         ["Version" scame-version]))))


(defun scame-mode-remove-menu ()
  "Remove `same-mode' menu entry."
  (easy-menu-remove-item nil '("Tools") "Scame"))


;;;###autoload
(defconst scame-mode-line-lighter
  (s-concat " {SCAME-"  scame-version-number "}")
  "The default lighter for `scame-mode'.")

;;;###autoload
(define-minor-mode scame-mode
  "Scame minor mode.

\\{scame-mode-map}"
  ;:lighter scame-mode-line-lighter
  :keymap scame-mode-map
  :group 'scame
  :require 'scame
  (if scame-mode
      ;; on start
      (scame-mode-add-menu)
    ;; on stop
    (scame-mode-remove-menu)))

;;;###autoload
(define-globalized-minor-mode scame-global-mode scame-mode scame-mode)


(provide 'scame-core)
;;; scame-core.el ends here
