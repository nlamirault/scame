;;; 46_javascript.el --- javascript configuration

;; Copyright (C) 2014, 2015 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

(when scame-javascript

  (use-package js3-mode
    ;; :defer scame-defer-package
    :init (setq js3-indent-level 4
                js3-mode-dev-mode-p t
                js3-auto-indent-p t
                js3-enter-indents-newline t
                js3-indent-on-enter-key t)
    :config (add-hook 'js3-mode-hook
                      (lambda ()
                        (flycheck-mode t)))
    :mode (("\\.js\\'" . js3-mode)))

  (use-package tern
    ;; :defer scame-defer-package
    :config (setq tern-command
                  (list (expand-file-name
                         (or (executable-find "tern") "tern")))))

  (use-package company-tern
    ;; :defer scame-defer-package
    :init (add-to-list 'company-backends 'company-tern)
    :config (add-hook 'js3-mode-hook 'tern-mode))

  ;; (use-package sws-mode)

  (use-package jade-mode
    ;; :defer scame-defer-package
    :mode (("\\.jade\\'" . jade-mode)
           ("\\.styl\\'" . jade-mode)))


  )


(provide '46_javascript)
;;; 46_javascript.el ends here
