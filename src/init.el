;; init.el --- Emacs initialization file

;; Copyright (c) Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

;; Scame is a configuration for Emacs.

;;; Code:

;; Debug or not
;;(setq debug-on-error t)


;;(require 'package)
;;(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;;                         ("marmalade" . "http://marmalade-repo.org/packages/")
;;                         ("melpa" . "http://melpa.milkbox.net/packages/")))
;;(package-initialize)


(when (version< emacs-version "24.3")
  (error "Scame requires at least GNU Emacs 24.3"))


(require 'cask "~/.cask/cask.el")
(cask-initialize)
(add-to-list 'auto-mode-alist '("Cask" . emacs-lisp-mode))
;;(require 'pallet)
(require 'use-package)

(use-package f)
(use-package s)

(fset 'yes-or-no-p 'y-or-n-p)

(setq package-enable-at-startup nil)    ; Don't initialize packages twice

(defvar user-home-directory (f-full (getenv "HOME")))
(defvar user-emacs-directory (f-join user-home-directory ".emacs.d"))
(defconst scame-user-customization-file
  (f-join user-home-directory ".config/scame/scame-user.el")
  "File used to store user customization.")

(use-package init-loader
  :config (init-loader-load (f-slash (f-join user-emacs-directory "lisp"))))

;;(let ((user-customization (f-join user-home-directory ".config/scame/scame-user.el")))
(when (file-readable-p scame-user-customization-file)
  (load user-customization))

(scame-global-mode)

(provide 'init)
;;; init.el ends here
