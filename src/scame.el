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
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
;;(package-initialize)
;; Don't initialize packages twice
(setq package-enable-at-startup nil)

;; Benchmark Emacs installation
;;(require 'benchmark-init)

(when (version< emacs-version "24.3")
  (error "Scame requires at least GNU Emacs 24.3"))

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(add-to-list 'auto-mode-alist '("Cask" . emacs-lisp-mode))
;;(require 'pallet)


(defalias 'yes-or-no-p 'y-or-n-p)

(setq-default show-trailing-whitespace t)

(require 'use-package)
(use-package f)
(use-package s)

(defconst user-home-directory (f-full (getenv "HOME")))

(defconst user-emacs-directory (f-join user-home-directory ".emacs.d"))

(defconst scame-user-customization-file
  (f-join user-home-directory ".config/scame/scame-user.el")
  "File used to store user customization.")

(defconst scame-init-file
  (f-join user-emacs-directory "scame.el")
  "Scame initialization file.")

(add-to-list 'load-path "~/.emacs.d/gnus")

(defun scame-mail-gmail ()
  "Launch Gnus using GMail configuration."
  (interactive)
  (setq gnus-init-file (f-join user-emacs-directory "gnus/gnus-gmail.el")
        gnus-startup-file (f-join user-home-directory ".gmail-newsrc"))
  (gnus))
(global-set-key (kbd "C-c m g") 'scame-mail-gmail)

(defun scame-mail-exchange ()
  "Launch Gnus using Exchange configuration."
  (interactive)
  (setq gnus-init-file (f-join user-emacs-directory "gnus/gnus-exchange.el")
        gnus-startup-file (f-join user-home-directory ".exchange-newsrc"))
  (gnus))
(global-set-key (kbd "C-c m e") 'scame-mail-exchange)

(defun scame-mail-offlineimap ()
  "Launch Gnus using Offlineimap configuration."
  (interactive)
  (setq gnus-init-file (f-join user-emacs-directory "gnus/gnus-offlineimap.el")
        gnus-startup-file (f-join user-home-directory ".offlineimap-newsrc"))
  (gnus))
(global-set-key (kbd "C-c m o") 'scame-mail-offlineimap)

(use-package init-loader
  :config (init-loader-load (f-slash (f-join user-emacs-directory "lisp"))))

;;(let ((user-customization (f-join user-home-directory ".config/scame/scame-user.el")))
(when (file-readable-p scame-user-customization-file)
  (load scame-user-customization-file))

(scame-global-mode 1)

(provide 'scame)
;;; scame.el ends here
