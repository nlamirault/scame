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

(setq warning-minimum-level :error
      warning-minimum-log-level :error)

(require 'ansi)
(require 'cl) ;; http://emacs.stackexchange.com/questions/2864/symbols-function-definition-is-void-cl-macroexpand-all-when-trying-to-instal
(require 'ert)
(require 'f)
(require 'package)
(require 'shut-up)
(require 'undercover)

(setq load-prefer-newer t)              ; Don't load outdated bytecode


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

(defvar scame-debug-output t
  "If T send output messages.")


(setq package-user-dir (f-join scame-test/sandbox-path "elpa"))

(package-initialize)
(package-refresh-contents)


(defmacro with-current-file (filename &rest body)
  "Open the `FILENAME' in the current buffer and execute `BODY'."
  `(let ((file (f-join scame-test/test-path ,filename)))
     (with-current-buffer (find-file-noselect file)
       ,@body)))

(defmacro with-scame-mode (&rest body)
  "Create a temporary buffer, activate `scame-mode' and evaluate `BODY'."
  `(with-temp-buffer
     (scame-global-mode)
     ,@body))

(defmacro scame--with-output (&rest body)
  "Execute `BODY' using `scame-debug-output' for output."
  `(if scame-debug-output
       ,@body
     (shut-up
       ,@body)))

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
  (let ((output (f-join scame-test/sandbox-path "scame")))
    (when (f-exists? output)
      (if (f-directory? output)
          (f-delete output t)
        (f-delete output)))
    (f-copy (f-join scame-test/root-path "src" "scame")
            scame-test/sandbox-path))
  (let ((output (f-join scame-test/sandbox-path "init.el")))
    (when (f-exists? output)
      (f-delete output 'force))
    (f-copy (f-join scame-test/test-path "init.el")
            scame-test/sandbox-path)))


(defun setup-scame (path)
  "Initialize dependencies to PATH and generate 'load-path."
  (message (ansi-green "[Scame] Setup Scame using %s" path))
  (add-to-list 'load-path (f-slash path))
  (add-to-list 'load-path (f-slash (f-join path "scame")))
  (add-to-list 'load-path (f-slash (f-join path "elpa"))))


(defun setup-scame-test ()
  (setq scame-use-vendoring nil)
  (setq scame-defer-package nil)
  (setq scame-user-customization-file
        (f-join scame-test/sandbox-path "scame-config-user.el"))
  (setq debugger-batch-max-lines (+ 50 max-lisp-eval-depth)
        debug-on-error t))


(defun load-library (path)
  "Load current library from PATH."
  (message (ansi-yellow "[Scame] Library %s/%s" default-directory path))
  (let ((path (f-join default-directory path)))
    (message (ansi-yellow "[Scame] Load library from %s" path))
    (undercover "*.el" (:exclude "*-test.el"))
    (scame--with-output
     (require 'scame path))))

(defmacro with-test-sandbox (&rest body)
  "Evaluate BODY in an empty sandbox directory."
  `(unwind-protect
       (condition-case nil
           (let ((default-directory scame-test/sandbox-path)
                 (scame-user-directory (concat scame-test/sandbox-path "/scame"))
                 (user-emacs-directory scame-test/sandbox-path)
                 )
             (setup-scame scame-test/sandbox-path)
             (setup-scame-test)
             (load-library "scame/scame.el")
             (message (ansi-yellow "[Scame] Execute body"))
             ,@body)
         )))



(provide 'test-helper)
;;; test-helper.el ends here
