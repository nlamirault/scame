;;; scame-elisp.el --- Emacs Lisp configuration

;; Copyright (C) 2014-2018 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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
    :init (progn
            (use-package eldoc
              :ensure t
              :pin melpa
              :init (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
              :diminish eldoc-mode))
    :mode (("\\.el$" . emacs-lisp-mode)
           ("Cask" . emacs-lisp-mode)
           ("gnus" . emacs-lisp-mode))
    :diminish emacs-lisp-mode)

  (use-package ielm
    :defer t
    :init (add-hook 'ielm-mode-hook 'turn-on-eldoc-mode))

  (use-package elisp-slime-nav
    :ensure t
    :pin melpa
    :defer t
    :init (progn
            (dolist (hook '(emacs-lisp-mode-hook ielm-mode-hook))
              (add-hook hook 'elisp-slime-nav-mode)))
    :diminish elisp-slime-nav-mode)

  (use-package erefactor
    :ensure t
    :pin melpa
    :defer t
    :config (define-key emacs-lisp-mode-map "\C-c\C-v" erefactor-map))

  ;; (use-package overseer
  ;;   :init (add-hook 'emacs-lisp-mode-hook 'overseer-mode-hook))

  )

(provide 'scame-elisp)
;;; scame-elisp.el ends here
