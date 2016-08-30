;; scame-splash.el --- Splash screen for Scame.

;; Copyright (c) 2014-2016 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

;; Thanks to :
;; https://www.reddit.com/r/emacs/comments/4yzwgy/is_there_a_package_for_a_startup_screen_like/

;;; Code:

(require 'scame-io)
(require 'scame-pkg)

(defvar scame--splash-buffer "*scame*")

(defvar scame--changelog-buffer "*scame-changelog*")


;; Startup Mode

(defvar scame-startup-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map [tab] 'widget-forward)
    (define-key map (kbd "C-i") 'widget-forward)
    (define-key map [backtab] 'widget-backward)
    (define-key map (kbd "RET") 'widget-button-press)
    (define-key map [down-mouse-1] 'widget-button-click)
    map)
  "Keymap for Scame startup mode.")

(define-derived-mode scame-startup-mode special-mode "Scame"
  "Scame major mode for startup screen.
\\<scame-mode-map>
"
  :group 'scame
  :syntax-table nil
  :abbrev-table nil
  (setq truncate-lines t))

;; Splash screen

(defmacro scame--startup-insert-shortcut (shortcut-char search-label &optional no-next-line)
  `(define-key scame-startup-mode-map ,shortcut-char
     (lambda ()
       (interactive)
       (unless (search-forward ,search-label (point-max) t)
         (search-backward ,search-label (point-min) t))
       ,@(unless no-next-line
           '((forward-line 1)))
       (back-to-indentation))))

;; (defun jethro/goto-link-line ()
;;   "Move the point to the beginning of the link line."
;;   (interactive)
;;   (with-current-buffer "*startscreen*"
;;     (goto-char (point-min))
;;     (re-search-forward "Homepage")
;;     (beginning-of-line)
;;     (widget-forward 1)))


(defun scame--startup-insert-file-list (list-display-name list)
  (when (car list)
    (scame--insert-message list-display-name 'font-lock-string-face)
    (mapc (lambda (el)
            (insert "\n    ")
            (widget-create 'push-button
                           :action `(lambda (&rest ignore)
                                      (find-file-existing ,el))
                           :mouse-face 'highlight
                           :follow-link "\C-m"
                           :button-prefix ""
                           :button-suffix ""
                           :format "%[%t%]"
                           (abbreviate-file-name el)))
          list)))


(defun scame--startup-insert-project-list (list-display-name list)
  (when (car list)
    (scame--insert-message list-display-name 'font-lock-string-face)
    (mapc (lambda (el)
            (insert "\n    ")
            (widget-create 'push-button
                           :action `(lambda (&rest ignore)
                                      (projectile-switch-project-by-name ,el))
                           :mouse-face 'highlight
                           :follow-link "\C-m"
                           :button-prefix ""
                           :button-suffix ""
                           :format "%[%t%]"
                           (abbreviate-file-name el)))
          list)))


(defun scame--startup-insert-bookmark-list (list-display-name list)
  (when (car list)
    (scame--insert-message list-display-name 'font-lock-string-face)
    (mapc (lambda (el)
            (insert "\n    ")
            (widget-create 'push-button
                           :action `(lambda (&rest ignore)
                                      (bookmark-jump ,el))
                           :mouse-face 'highlight
                           :follow-link "\C-m"
                           :button-prefix ""
                           :button-suffix ""
                           :format "%[%t%]"
                           (format "%s - %s" el (abbreviate-file-name
                                                 (bookmark-get-filename el)))))
          list)))

(defun scame--startup-insert-release (number)
  (scame--insert-message "Changelog:" 'font-lock-string-face)
  (let ((link
         (format "https://github.com/nlamirault/scame/releases/tag/%s" number)))
    (insert "\n    ")
    (widget-create 'push-button
                   :action `(lambda (&rest ignore)
                              (browse-url ,link))
                   :mouse-face 'highlight
                   :follow-link "\C-m"
                   :button-prefix ""
                   :button-suffix ""
                   :format "%[%t%]" link)))


(defun scame--startup-insert-project ()
  (goto-char (point-max))
  (insert "     ")
  (scame--startup-insert-shortcut "m" "[?]" t)
  (widget-create 'url-link
                 :tag (propertize "?" 'face 'font-lock-doc-face)
                 :help-echo "Open the quickhelp."
                 :action (lambda (&rest ignore)
                           (insert-file-contents (scame--find-file "README.md")))
                 :mouse-face 'highlight
                 :follow-link "\C-m"
                 )
  (insert " ")
  (widget-create 'url-link
                 :tag (propertize "Homepage" 'face 'font-lock-keyword-face)
                 :help-echo "Open the Scame Github page in your browser."
                 :mouse-face 'highlight
                 :follow-link "\C-m"
                 "https://github.com/nlamirault/scame")
  (insert " ")
  (widget-create 'url-link
                 :tag (propertize "Documentation" 'face 'font-lock-keyword-face)
                 :help-echo "Open the Scame documentation in your browser."
                 :mouse-face 'highlight
                 :follow-link "\C-m"
                 "https://nlamirault.github.io/scame/scame.html")
  (insert " ")
  (widget-create 'push-button
                 :tag (propertize "Release Notes" 'face 'font-lock-preprocessor-face)
                 :help-echo "Show the Changelog"
                 :action (lambda (&rest ignore)
                           (with-current-buffer (get-buffer-create scame--changelog-buffer)
                             (goto-char (point-min))
                             (insert-file-contents (scame--find-file "ChangeLog.md"))
                             (markdown-mode)
                             (switch-to-buffer scame--changelog-buffer)))
                 :mouse-face 'highlight
                 :follow-link "\C-m"
                 )
  (insert "\n               ")
  (widget-create 'push-button
                 :help-echo "Update all ELPA packages to the latest versions."
                 :action (lambda (&rest ignore)
                           (with-current-buffer (get-buffer-create scame-buffer)
                             (scame--msg-buffer scame-buffer
                                                "--> Update Packages ...\n"
                                                'font-lock-string-face)
                             (switch-to-buffer scame-buffer)
                             (scame--install-packages gnu-packages)
                             (scame--install-packages stable-packages)
                             (scame--install-packages unstable-packages)))
                 :mouse-face 'highlight
                 :follow-link "\C-m"
                 (propertize "Update Packages" 'face 'font-lock-keyword-face))
  (insert " ")
  (insert "\n")
  (insert "                  ")
  (insert "\n\n"))


(defun scame--startup-insert-page-break ()
  "Insert a page break line in the buffer."
  (scame--insert-message "\n\n\n" nil))


(defun scame--startup-insert-lists ()
  (interactive)
  (with-current-buffer (get-buffer-create scame--splash-buffer)
    (let ((buffer-read-only nil)
          (list-separator "\n\n"))
      (goto-char (point-max))
      ;;(page-break-lines-mode)
      (let ((scame-logo (scame--find-image "scame.png")))
        (when scame-logo
          (insert-image scame-logo "[Scame]")
          (scame--msg-buffer scame--splash-buffer "\n" nil)))
      (insert (format "Scame v%s" scame-version-number))
      (scame--startup-insert-page-break)
      ;; (scame--startup-insert-release scame-version-number)
      (scame--startup-insert-project)
      (insert list-separator)
      (recentf-mode)
      (when (scame--startup-insert-file-list "Recent Files:" (recentf-elements 5))
	(scame--startup-insert-shortcut "r" "Recent Files:")
	(insert list-separator))
      (when (scame--startup-insert-bookmark-list "Bookmarks:" (bookmark-all-names))
	(scame--startup-insert-shortcut "m" "Bookmarks:")
	(insert list-separator))
      (projectile-mode)
      (when (scame--startup-insert-project-list "Projects:" (projectile-relevant-known-projects))
	(scame--startup-insert-shortcut "p" "Projects:")
	(insert list-separator))
      (goto-char (point-min)))
    (scame-startup-mode)))


;; Hook

(defun scame--setup-startup-hook ()
  "Add post init processing."
  (add-hook 'emacs-startup-hook
            (lambda ()
              (scame--startup-insert-lists))
            (redisplay))
  (add-hook 'after-init-hook
            '(lambda ()
               (switch-to-buffer scame--splash-buffer))))


(provide 'scame-splash)
;;; scame-splash.el ends here
