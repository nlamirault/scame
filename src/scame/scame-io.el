;; scame-io.el --- Scame I/O tools

;; Copyright (c) 2015, 2016 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

(defvar scame-buffer "*scame-startup*")


(with-current-buffer (get-buffer-create scame-buffer)
  (setq inhibit-startup-screen t))

(switch-to-buffer scame-buffer)
(with-current-buffer scame-buffer
  (insert "-----------\n|  Scame  |\n-----------\n\n")
  (redisplay))


(defun scame--msg-buffer (buffer msg face-type)
  "Write `MSG' to the scame buffer using `FACE-TYPE'."
  (with-current-buffer (get-buffer-create buffer)
    (goto-char (point-max))
    ;(insert msg)))
    (insert (propertize msg 'face face-type))))


(defun scame--insert-message (msg face-type)
  (insert (propertize msg 'face face-type)))


(defun scame--find-project-path ()
  (let ((dir))
     (mapc (lambda (path)
                 (when (s-contains-p "scame" path)
                   (setq dir path)))
               load-path)
     dir))


(defun scame--find-image (file-name)
  "Find an image specified by `FILE-NAME'."
  (let ((image-load-path
         (cons (expand-file-name "icons" (scame--find-project-path))
               (and (boundp 'image-load-path)
                    image-load-path))))
    (message "[scame] Find image: %s %s" image-load-path file-name)
    (find-image
     (list (list :ascent 'center
                 :file file-name
                 :type (image-type-from-file-name file-name)
                 :foreground (face-foreground 'default nil 'default)
                 :background (face-background 'default nil 'default))))))


(defun scame--find-file (file-name)
  "Find a file specified by `FILE-NAME'."
  (expand-file-name file-name (scame--find-project-path)))


(provide 'scame-io)
;;; scame-io.el ends here
