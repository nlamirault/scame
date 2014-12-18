;; scame.el --- Scame Emacs initialization file

;; Copyright (c) 2014 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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
;;(setq debug-on-error t)


(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
;;(package-initialize)
;; Don't initialize packages twice
(setq package-enable-at-startup nil)

(when (version< emacs-version "24.3")
  (error "Scame requires at least GNU Emacs 24.3"))

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(add-to-list 'auto-mode-alist '("Cask" . emacs-lisp-mode))
;;(require 'pallet)

;; Benchmark Emacs installation
(require 'benchmark-init)
(require 'use-package)
(use-package f)
(use-package s)


(defalias 'yes-or-no-p 'y-or-n-p)

(setq-default show-trailing-whitespace t)

(defconst user-home-directory (f-full (getenv "HOME")))

(defconst scame-user-directory (f-join user-home-directory ".emacs.d/scame")
  "Scame user directory installation.")

(defconst scame-user-customization-file
  (f-join user-home-directory ".config/scame/scame-user.el")
  "File used to store user customization.")

;; (defconst scame-init-file
;;   (f-join user-emacs-directory "scame.el")
;;   "Scame initialization file.")

;; (message "User emacs directory for Scame : %s" user-emacs-directory)
(use-package init-loader
  :config (init-loader-load (f-slash (f-join scame-user-directory "lisp"))))

(when (file-readable-p scame-user-customization-file)
  (load scame-user-customization-file))

(scame-global-mode 1)

;; FIX ?
(remove-hook 'kill-emacs-hook 'w3m-cookie-shutdown)

(provide 'scame)
;;; scame.el ends here
