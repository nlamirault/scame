;; scame.el --- Scame Emacs initialization file

;; Copyright (c) 2014, 2015 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

;; Scame is a configuration for Emacs.

;;; Code:

;; Debug or not
(setq debug-on-error t)

(when (version< emacs-version "24.4")
  (error "Scame requires at least GNU Emacs 24.4"))

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
;;(package-initialize)
;; Don't initialize packages twice
(setq package-enable-at-startup nil)

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(add-to-list 'auto-mode-alist '("Cask" . emacs-lisp-mode))
;;(require 'pallet)

(require 'f)
(require 's)
(require 'benchmark-init)
(require 'use-package)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq-default show-trailing-whitespace t)

(defconst user-home-directory
  (f-full (getenv "HOME"))
  "Path of the user home directory.")

(defconst scame-user-directory
  (f-join user-home-directory ".emacs.d/scame")
  "Scame user directory installation.")

(defconst scame-vendoring-directory
  (f-join user-emacs-directory "vendor")
  "Vendoring directory for Scame.")

(defconst scame-user-customization-file
  (f-join user-home-directory ".config/scame/scame-user.el")
  "File used to store user customization.")

(defun scame--load-configuration (directory)
  "Setup `DIRECTORY' as a source directory, and load files."
  (let ((dir (f-slash (f-join (f-parent (f-this-file)) directory))))
    (message "[scame] packages directory : %s" dir)
    (use-package init-loader
      :config (init-loader-load dir))))

(scame--load-configuration "packages")
(scame--load-configuration "core")

(when (and (f-exists? scame-vendoring-directory)
           (f-directory? scame-vendoring-directory))
  (f-entries scame-vendoring-directory
             (lambda (dir)
               (when (or (f-directory? dir)
                         (f-symlink? dir))
                 (add-to-list 'load-path dir)))))

(when (file-readable-p scame-user-customization-file)
  (load scame-user-customization-file))

(provide 'scame)
;;; scame.el ends here
