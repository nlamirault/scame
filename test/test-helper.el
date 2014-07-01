;;; test-helper.el --- Scame: Test helper

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


(require 'cask)

(defconst scame-test/test-path
  (f-parent (f-this-file)))

(defconst scame-test/root-path
  (f-parent scame-test/test-path))

(defconst scame-test/sandbox-path
  (f-expand "sandbox" scame-test/test-path))

(defconst scame-cli-cask-file (f-join scame-test/root-path "Cask"))
(defconst scame-install-cask-file (f-join scame-test/root-path "src/Cask"))
(defconst scame-cask-cli-file (f-join scame-test/root-path "scame-cli.el"))

(add-to-list 'load-path scame-test/root-path)


(defmacro with-current-file (filename &rest body)
  "Open the `FILENAME' in the current buffer and execute `BODY'."
  `(let ((file (f-join scame-test/test-path ,filename)))
     (with-current-buffer (find-file-noselect file)
       ,@body)))

(defvar username (getenv "HOME"))


(defun cleanup-load-path ()
  (mapc #'(lambda (path)
            (when (string-match (s-concat username "/.emacs.d") path)
              (setq load-path (delete path load-path))))
        load-path))

(defun load-unit-tests (path)
  (dolist (test-file (or argv (directory-files path t "-test.el$")))
    (load test-file nil t)))


(defun install-scame ()
  (mapc #'(lambda (elem)
            (let ((output (f-join scame-test/sandbox-path elem)))
              (unless (f-exists? output)
                (f-copy (f-join scame-test/root-path "src" elem)
                        scame-test/sandbox-path))))
        '("Cask" "scame.el" "lisp"))
  (f-copy (f-join scame-test/test-path "init.el")
          scame-test/sandbox-path))

(defun setup-scame (path)
  (let ((bundle (cask-initialize scame-test/sandbox-path)))
    (cask-update bundle)
    (cask-install bundle)
    ;; (dolist (dir (f-directories
    ;;               (f-join path ".cask" emacs-version "elpa")))
    ;;   (add-to-list 'load-path dir))
    (add-to-list 'load-path (f-join path ".cask"))
    (add-to-list 'load-path (f-slash path))
    ;;(print (cask-load-path bundle))))
    (print load-path)
    ))


(provide 'test-helper)
;;; test-helper.el ends here
