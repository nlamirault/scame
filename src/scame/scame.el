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

;;; Code:

(defgroup scame nil
  "Emacs starter kit."
  :group 'tools)

(defcustom user-home-directory (concat (getenv "HOME") "/")
  "Path of the user home directory."
  :group 'scame
  :type 'string)

(defcustom scame-cask-file "~/.cask/cask.el"
  "Scame Cask file."
  :group 'scame
  :type 'string)

(defcustom scame-keymap-prefix (kbd "C-c s")
  "Scame keymap prefix."
  :group 'scame
  :type 'string)

(defcustom scame-user-directory
  (concat user-home-directory ".emacs.d/scame")
  "Scame user directory installation."
  :group 'scame
  :type 'string)

(defcustom scame-vendoring-directory
  (concat user-emacs-directory "vendor")
  "Vendoring directory for Scame."
  :group 'scame
  :type 'string)

(defcustom scame-user-customization-file
  (concat user-home-directory ".config/scame/scame-user.el")
  "File used to store user customization."
  :group 'scame
  :type 'string)

(defcustom scame-use-vendoring t
  "Set if you want to use vendoring utility."
  :group 'scame
  :type 'boolean)

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

(require 'cask scame-cask-file)
(cask-initialize)
(add-to-list 'auto-mode-alist '("Cask" . emacs-lisp-mode))
;;(require 'pallet)

(require 'f)
(require 's)
(require 'benchmark-init)
(require 'use-package)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq-default show-trailing-whitespace nil)

(use-package el-init
  :config (progn
            (setq el-init-meadow-regexp       "\\`meadow-"
                  el-init-carbon-emacs-regexp "\\`carbon-emacs-"
                  el-init-cocoa-emacs-regexp  "\\`cocoa-emacs-"
                  el-init-nw-regexp           "\\`nw-"
                  el-init-mac-regexp          "\\`mac-"
                  el-init-windows-regexp      "\\`windows-"
                  el-init-linux-regexp        "\\`linux-"
                  el-init-freebsd-regexp      "\\`freebsd-")
            (el-init-load (f-parent (f-this-file))
                          :subdirectories '("packages" "core")
                          :wrappers '(el-init-require/benchmark
                                      el-init-require/record-error
                                      el-init-require/system-case))))


(when (and scame-use-vendoring
           (f-exists? scame-vendoring-directory)
           (f-directory? scame-vendoring-directory))
  (f-entries scame-vendoring-directory
             (lambda (elem)
               ;;(message "elem: %s" elem)
               (cond ((or (f-directory? elem)
                          (f-symlink? elem))
                      (add-to-list 'load-path elem))
                     ((f-file? elem)
                      (when (string= (f-ext elem) "el")
                        (load-file elem)))))))

(when (file-readable-p scame-user-customization-file)
  (load scame-user-customization-file))

(provide 'scame)
;;; scame.el ends here
