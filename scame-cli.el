;;; scame-cli.el --- CLI interface for Scame

;; Copyright (C) 2014 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

;; CLI interface of Scame.

;;; Code:

(require 'cask)
(require 'commander)
(require 'f)
(require 'git)
(require 's)

(defvar scame-copyright
  (s-concat "Scame v0.1.0"
	    "\nCopyright (c) Nicolas Lamirault <nicolas.lamirault@gmail.com>\n"))

(defvar scame-repository "https://github.com/nlamirault/scame.git")

(defvar scame-directory (f-join (f-full (getenv "HOME")) ".scame"))
(defvar emacs-directory (f-join (f-full (getenv "HOME")) ".emacs.d"))


;; Internal

;; (defun scame-cli--clone-repo (target)
;;   "Clone Scame repository into `TARGET'."
;;   (when (f-exists? target)
;;     (error (s-concat target " already exists.")))
;;   (let ((git-repo target))
;;     (git-clone scame-repository target)))


(defun print-message (message)
  "Print `MESSAGE' to stdout."""
  (message "[SCAME] %s" message))

(defun scame-cli--update-repo (target)
  "With `TARGET' as Scame's local git repository, update it."
  (let ((git-repo target))
    (print-message "Update repository")
    (git-pull git-repo)))

(defun scame-cli--cleanup (source)
  "Remove Scame's installation files from `SOURCE'."
  (dolist (file (f-files source))
    (f-delete file))
  (let ((dir (f-join source "lisp")))
    (when (f-exists? dir)
      (f-delete dir t))))

(defun scame-cli--copy-files (source target)
  "Copy Scame's files from `SOURCE' into `TARGET' directory."
  (dolist (file (f-files source))
    (f-copy file target))
  (f-copy (f-join source "lisp") target))

(defun scame-cli--update-deps (target)
  "Update dependencies using Cask for `TARGET' directory."
  (let ((bundle (cask-initialize target)))
    (cask-install bundle)
    (cask-update bundle)))


;; API

(defun scame-cli/version ()
  "Print version for Scame project."
  (princ scame-copyright))
  ;;(kill-emacs 0))

(defun scame-cli/help (&optional command-name)
  "Display usage information or documentation for COMMAND-NAME."
  ;;(princ (concat "Help: " command-name "]"))
  (if command-name
      (commander-print-usage-for-and-exit command-name)
    (commander-print-usage-and-exit)))

(defun scame-cli/install ()
  "Install Scame."
  (scame-cli--copy-files (f-join scame-directory "src") emacs-directory)
  (scame-cli--update-deps emacs-directory))

(defun scame-cli/update ()
  "Update a Scame installation."
  (print-message "Update current installation")
  (scame-cli/cleanup)
  (scame-cli--update-repo scame-directory)
  (scame-cli/install))

(defun scame-cli/cleanup ()
  "Destroy a previous Scame installation."
  (print-message "Cleanup installation")
  (scame-cli--cleanup emacs-directory))

(defun scame-cli/debug ()
  "Turn on debug output."
  (setq debug-on-error t))


;; CLI commands
(setq debug-on-error t)

(commander

 (name "scame")
 (description "Scame - An Emacs configuration tool.")

 (default commander-print-usage-and-exit)
 ;;(default "install")

 (command "cleanup" "Cleanup" scame-cli/cleanup)
 (command "install" "Install" scame-cli/install)
 (command "update" "Update" scame-cli/update)

 (option "--version" "Show version" scame-cli/version)
 (option "-h [command], --help [command]" "Help" scame-cli/help)
 (option "--debug" "Debug mode" scame-cli/debug))


(provide 'scame-cli)
;;; scame-cli.el ends here
