;; 999_scame.el --- Scame for Emacs

;; Copyright (c) Nicolas Lamirault <nicolas.lamirault@gmail.com>

;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;; The above copyright notice and this permission notice shall be included in
;; all copies or substantial portions of the Software.

;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
;; THE SOFTWARE.

;;; Commentary:

;; Scame is a configuration for Emacs.

;;; Code:

(use-package easymenu)


(defvar scame-package-version "0.4.0"
  "Release version of Scame.")


;; Misc

(defun scame-version ()
  "Return the Scame's version."
  (interactive)
  (message "Scame version: %s" scame-package-version))


(defun scame-changelog ()
  "Display the ChangeLog."
  (interactive)
  (let ((changelog (f-join user-emacs-directory "ChangeLog.md")))
    (when (file-readable-p changelog)
      (switch-to-buffer (find-file-noselect changelog)))))


(defun scame-project-website ()
  "Open in a browser the project's website."
  (interactive)
  (browse-url
  ;;(helm-browse-url
   "https://github.com/nlamirault/scame"))



;; Scame mode map

(defvar scame-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-c s v") 'scame-version)
    (define-key map (kbd "C-c s c") 'scame-changelog)
    map))

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

(define-minor-mode scame-mode
  "Minor mode for Scame..

\\{scame-mode-map}"
  :lighter " Scame"
  :keymap scame-mode-map
  (if scame-mode
      ;; on start
      (scame-mode-add-menu)
    ;; on stop
    (scame-mode-remove-menu)))

(defun scame-on ()
  "Turn on `scame-mode'."
  (interactive)
  (scame-mode +1))

(defun scame-off ()
  "Turn off `scame-mode'."
  (interactive)
  (scame-mode -1))



(provide '999_scame)
;;; 999_scame.el ends here
