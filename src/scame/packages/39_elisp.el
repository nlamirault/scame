;;; 39_elisp.el --- Emacs Lisp configuration

;; Copyright (C) 2014, 2015, 2016 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

(when scame-elisp

  (use-package emacs-lisp-mode
    ;; :defer scame-defer-package
    :init (progn
            (use-package eldoc
              :init (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
              :diminish eldoc-mode))
    :mode (("\\.el$" . emacs-lisp-mode)
           ("gnus" . emacs-lisp-mode))
    :diminish emacs-lisp-mode)

  (use-package scame-mode
    :mode (("Cask" . emacs-lisp-mode)))

  (use-package ielm
    ;; :defer scame-defer-package
    :init (add-hook 'ielm-mode-hook 'turn-on-eldoc-mode))

  (use-package elisp-slime-nav
    ;; :defer scame-defer-package
    :init (progn
            (dolist (hook '(emacs-lisp-mode-hook ielm-mode-hook))
              (add-hook hook 'elisp-slime-nav-mode)))
    :diminish elisp-slime-nav-mode)

  (use-package erefactor
    ;; :defer scame-defer-package
    :config (define-key emacs-lisp-mode-map "\C-c\C-v" erefactor-map))

  ;; (use-package overseer
  ;;   :init (add-hook 'emacs-lisp-mode-hook 'overseer-mode-hook))

  )

(provide '39_elisp)
;;; 39_elisp.el ends here
