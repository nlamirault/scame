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
;;(defconst scame-cask-cli-file (f-join scame-test/root-path "scame-cli.el"))

(add-to-list 'load-path scame-test/root-path)


;;;; Sandbox

;; TODO: load Scame in a sandbox and not using local installation
;; (let ((sandbox-path (f-expand "sandbox" user-emacs-directory)))
;;   (when (f-dir? sandbox-path)
;;     (-each (f--files sandbox-path (f-ext? it "el")) 'load)))

;; (defmacro with-scame-sandbox (&rest body)
;;   `(unwind-protect
;;        (progn
;; 	 (when (f-dir? scame-test/sandbox-path)
;; 	   (f-delete scame-test/sandbox-path 'force))
;; 	 (f-mkdir scame-test/sandbox-path)
;; 	 ,@body)
;;       (when (f-dir? scame-test/sandbox-path)
;;         (f-delete scame-test/sandbox-path 'force))))


(defmacro with-current-file (filename &rest body)
  "Open the `FILENAME' in the current buffer and execute `BODY'."
  `(let ((file (f-join scame-test/test-path ,filename)))
     (with-current-buffer (find-file-noselect file)
       ,@body)))


(provide 'test-helper)
;;; test-helper.el ends here
