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


(require 'commander)
(require 'f)
;;(require 'git)
(require 's)



(defvar scame-repository "https://github.com/nlamirault/scame.git")
(defvar scame-directory (f-join (f-full (getenv "HOME")) ".scame"))
(defvar emacs-directory (f-join (f-full (getenv "HOME")) ".emacs.d"))


;; Internal

(defun scame-cli--clone-repo (target)
  "Clone Scame repository."
  (when (f-exists? target)
    (error (s-concat target " already exists.")))
  ;;(shell-command (concat "git clone " scame-repository " " target)))
  (let ((git-repo target))
    (git-clone scame-repository target)))


(defun scame-cli--cleanup (source)
  "Remove Scame's installation files."
  (dolist (file (f-files source))
    (f-delete file))
  (let ((dir (f-join source "lisp")))
    (when (f-exists? dir)
      (f-delete dir t))))


(defun scame-cli--copy-files (source target)
  "Copy Scame's files into target directory."
  (dolist (file (f-files source))
    (f-copy file target))
  (f-copy (f-join source "lisp") target))

(defun scame-cli--rename-cask ()
  "Rename file Cask.el to Cask."


;; API

(defun scame-cli/version ()
  "Print version for Scame project."
  (princ (concat "Scame v0.1.0"
		 "\nCopyright (c) Nicolas Lamirault <nicolas.lamirault@gmail.com>\n"))
  (kill-emacs 0))

(defun scame-cli/help (&optional command-name)
  "Display usage information or documentation for COMMAND-NAME."
  (princ (concat "Help: " command-name "]"))
  (if command-name
      (commander-print-usage-for-and-exit command-name)
    (commander-print-usage-and-exit)))

(defun scame-cli/install ()
  "Install Scame."
  (if (f-directory? scame-directory)
      (error "Emacs directory already exists. Please update.")
    (scame-cli--clone-repo scame-directory)
    (scame-cli--copy-files (f-join scame-directory "src") emacs-directory)))


(defun scame-cli/update ()
  "Update a Scame installation."
  ;;(let ((repo (s-concat "/tmp/scame-" (number-to-string (float-time)))))
  ;;(scame-cli--clone-repo repo)

    (scame-cli--cleanup emacs-directory)
    (scame-cli--copy-files repo emacs-directory)
    (scame-cli--rename-cask)))


(defun scame-cli/debug ()
  "Turn on debug output."
  (setq debug-on-error t))


;; CLI commands

(commander

 (name "scame")
 (description "Scame - An Emacs configuration tool.")

 (default commander-print-usage-and-exit)
 ;;(default "install")

 (command "install" "Install" scame-cli/install)
 (command "update" "Update" scame-cli/update)

 (option "--version" "Show version" scame-cli/version)
 (option "-h [command], --help [command]" "Help" scame-cli/help)
 (option "--debug" "Debug mode" scame-cli/debug))


(provide 'scame-cli)
;;; scame-cli.el ends here
