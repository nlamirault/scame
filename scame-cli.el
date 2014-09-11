;;; scame-cli.el --- CLI interface for Scame

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

;; CLI interface of Scame.

;;; Code:

(require 'cask)
(require 'commander)
(require 'f)
(require 'git)
(require 's)

(defconst scame-version "0.7.0")

(defconst scame-copyright
  (s-concat "Scame v"
	    scame-version
	    "\nCopyright (c) Nicolas Lamirault <nicolas.lamirault@gmail.com>\n"))

(defconst scame-repository "https://github.com/nlamirault/scame.git")

(defconst scame-directory (f-join (f-full (getenv "HOME")) ".scame"))
(defconst emacs-directory (f-join (f-full (getenv "HOME")) ".emacs.d"))


;; Internal

;; (defun scame-cli--clone-repo (target)
;;   "Clone Scame repository into `TARGET'."
;;   (when (f-exists? target)
;;     (error (s-concat target " already exists.")))
;;   (let ((git-repo target))
;;     (git-clone scame-repository target)))


(defun print-message (tokens)
  "Print `TOKENS' to stdout."
  ;;(message "[SCAME] %s" tokens))
  (message "[SCAME] %s" (propertize tokens 'face '(:foreground "green"))))

(defun scame-cli--update-repo (target)
  "With `TARGET' as Scame's local git repository, update it."
  (let ((git-repo target))
    (print-message "Update Scame GIT repository")
    (git-log)
    (git-pull))); git-repo)))

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

(defun scame-cli/cleanup ()
  "Destroy a previous Scame installation."
  (print-message "Cleanup installation")
  (scame-cli--cleanup emacs-directory))

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

 (command "cleanup"
          "Cleanup the $HOME/.emacs.d directory from Scame installation "
          scame-cli/cleanup)
 (command "install"
          "Install Scame into $HOME/.emacs.d directory"
          scame-cli/install)
 (command "update"
          "Update local Scame installation"
          scame-cli/update)
 (option "--version" "Show version" scame-cli/version)
 (option "-h [command], --help [command]" "Help" scame-cli/help)
 (option "--debug" "Active debug mode" scame-cli/debug))


(provide 'scame-cli)
;;; scame-cli.el ends here
