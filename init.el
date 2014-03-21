;;
;; Emacs setup
;; Copyright (c) Nicolas Lamirault <nicolas.lamirault@gmail.com>
;;

;; Debug or not
;;(setq debug-on-error t)


;;(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
;;(package-initialize)

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(add-to-list 'auto-mode-alist '("Cask" . emacs-lisp-mode))
(require 'pallet)

(require 'init-loader)
(init-loader-load "~/.emacs.d/lisp/")

(let ((user-customization "~/.emacs.d/custom/user.el"))
  (when (file-readable-p user-customization)
    (load user-customization)))


;; Scame

(defvar scame-package-version "0.1.0")

(defun scame-version ()
  "Return the Scame's version."
  (interactive)
  (message "Scame version: %s" scame-package-version))
