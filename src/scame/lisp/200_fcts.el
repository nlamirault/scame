;; 98_fcts.el --- Some functions

;; Copyright (C) 2014 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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


(defun scame-kill-all-buffers ()
  "Delete all active buffers."
  (interactive)
  (let* ((liste (reverse (buffer-list)))
         (buffer (car liste)))
    (while (cdr liste)
      (progn (kill-buffer buffer)
	     (setq liste (cdr liste))
	     (setq buffer (car liste))))
    (kill-buffer (car liste))))


;; Search engines
;; ----------------

(defun scame-perform-search (url prompt)
  (let ((query (if mark-active
		   (buffer-substring (region-beginning) (region-end))
		 (read-string prompt))))
    (browse-url
     (concat url (url-hexify-string query)))))

(defmacro def-search-engine (name url)
  "Perform a request to a search engine.

`NAME` is the search engine identifier.
`URL` is the URI request
`PROMPT` is a prompt for the user."
  `(defun ,(intern (format "scame-search-%s" name)) ()
     (interactive)
     (let ((prompt (s-concat (upcase-initials ,name) ": ")))
       (scame-perform-search ,url prompt))))

(def-search-engine "google" "http://www.google.com/search?q=")
(def-search-engine "github" "https://github.com/search?q=")
(def-search-engine "twitter" "https://twitter.com/search?src=typd&q=")
(def-search-engine "launchpad" "https://launchpad.net/+search?field.text=")


;; Path
;; -------


(defun scame-show-complete-filename ()
  "Show the complete path of the file associated with the current buffer."
  (interactive)
  (message (file-truename buffer-file-name)))



(provide '98_fcts)
;;; 98_fcts.el ends here