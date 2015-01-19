;;; test-helper.el --- Scame: Test helper

;; Copyright (C) 2014, 2015 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

(require 'ansi)
(require 'cask)
(require 'cl) ;; http://emacs.stackexchange.com/questions/2864/symbols-function-definition-is-void-cl-macroexpand-all-when-trying-to-instal
(require 'ert)
(require 'f)
(require 'shut-up)
(require 'undercover)

(setq debugger-batch-max-lines (+ 50 max-lisp-eval-depth)
      debug-on-error t)

(defvar username (getenv "HOME"))

(defconst scame-test/test-path
  (f-parent (f-this-file))
  "The Scame unit tests directory.")

(defconst scame-test/root-path
  (f-parent scame-test/test-path)
  "The Scame source directory.")

(defconst scame-test/sandbox-path
  (f-expand "sandbox" scame-test/test-path)
  "The sandbox path for Scame unit tests.")

(defconst scame-cli-cask-file
  (f-join scame-test/root-path "Cask"))

(defconst scame-install-cask-file
  (f-join scame-test/root-path "src/Cask"))

(defconst scame-cask-cli-file
  (f-join scame-test/root-path "scame-cli.el"))

(defvar scame-debug-output t
  "If T send output messages.")


(defmacro with-current-file (filename &rest body)
  "Open the `FILENAME' in the current buffer and execute `BODY'."
  `(let ((file (f-join scame-test/test-path ,filename)))
     (with-current-buffer (find-file-noselect file)
       ,@body)))


(defmacro scame--with-output (&rest body)
  `(if scame-debug-output
       ,@body
     (shut-up
       ,@body)))


(defun print-load-path (path)
  "Output the 'load-path using PATH for Cask bundle."
  (let ((bundle (cask-initialize path)))
    (message (ansi-yellow "Path : %s" (cask-load-path bundle)))))


(defun cleanup-load-path ()
  "Remove home directory from 'load-path."
  (message (ansi-green "[Scame] Cleanup path"))
  (mapc #'(lambda (path)
            (when (string-match (s-concat username "/.emacs.d") path)
              (message (ansi-yellow "Suppression path %s" path))
              (setq load-path (delete path load-path))))
        load-path)
  (add-to-list 'load-path default-directory))


(defun load-unit-tests (path)
  "Load all unit test from PATH."
  (dolist (test-file (or argv (directory-files path t "-test.el$")))
    (load test-file nil t)))


(defun install-scame ()
  "Copy source files to sandbox."
  (message (ansi-green "[Scame] Install Scame"))
  (unless (f-dir? scame-test/sandbox-path)
    (f-mkdir scame-test/sandbox-path))
  (mapc #'(lambda (elem)
            (let ((output (f-join scame-test/sandbox-path elem)))
              (when (f-exists? output)
                (if (f-directory? output)
                    (f-delete output t)
                  (f-delete output)))
              (f-copy (f-join scame-test/root-path "src" elem)
                      scame-test/sandbox-path)))
        '("Cask" "scame"))
  (let ((output (f-join scame-test/sandbox-path "init.el")))
    (when (f-exists? output)
      (f-delete output 'force)))
  (f-copy (f-join scame-test/test-path "init.el")
          scame-test/sandbox-path))


(defun setup-scame (path)
  "Initialize Cask dependencies to PATH and generate 'load-path."
  (message (ansi-green "[Scame] Setup Scame"))
  (let ((bundle (cask-initialize path)))
    (cask-update bundle)
    (cask-install bundle)
    (dolist (dir (f-directories
                  (f-join path ".cask" emacs-version "elpa")))
      (add-to-list 'load-path dir))
    (add-to-list 'load-path (f-join path ".cask"))
    (add-to-list 'load-path (f-slash path))
    ;;(print (cask-load-path bundle))))
    ))


(defun load-library (path)
  "Load current library from PATH."
  ;;(message (ansi-yellow "[Scame] Library %s : %s" path default-directory))
  (let ((path (s-concat default-directory path)))
    (message (ansi-yellow "[Scame] Load library from %s" path))
    (undercover "*.el" (:exclude "*-test.el"))
    (scame--with-output
     (require 'scame path))))


(defmacro with-test-sandbox (&rest body)
  "Evaluate BODY in an empty sandbox directory."
  `(unwind-protect
       (condition-case nil ;ex
           (let ((default-directory scame-test/root-path))
             ;; (unless (f-dir? scame-test/sandbox-path)
             ;;   (f-mkdir scame-test/sandbox-path))
             (cleanup-load-path)
             (install-scame)
             (setup-scame scame-test/sandbox-path)
             (load-library "/src/scame/scame.el")
             ;;(should (featurep 'scame-global-mode))
             (message (ansi-yellow "[Scame] Execute body"))
             ,@body)
         ;; (f-delete scame-test/sandbox-path :force)))
         )))
         ;; (error
         ;;  (message (ansi-red "[Scame] Error during unit tests : %s" ex))))))


(provide 'test-helper)
;;; test-helper.el ends here
