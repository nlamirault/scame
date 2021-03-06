;;; 42_ruby.el --- Ruby mode configuration

;; Copyright (C) 2014-2017 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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


(when scame-ruby

  (use-package ruby-mode
    :ensure t
    :pin melpa
    :config (progn
              (add-hook 'ruby-mode-hook 'rvm-activate-corresponding-ruby)
              (setq ruby-deep-indent-paren nil))
    :bind (("C-M-h" . backward-kill-word)
           ("C-M-n" . scroll-up-five)
           ("C-M-p" . scroll-down-five))
    :mode (("\\.rake$" . ruby-mode)
           ("\\.gemspec$" . ruby-mode)
           ("\\.ru$" . ruby-mode)
           ("Rakefile$" . ruby-mode)
           ("Gemfile$" . ruby-mode)
           ("Capfile$" . ruby-mode)
           ("Guardfile$" . ruby-mode)))

  (use-package ruby-tools
    :ensure t
    :pin melpa
    )

  (use-package rvm
    :ensure t
    :pin melpa
    :init (rvm-use-default)
    :config (setq rvm-verbose nil))

  (use-package rhtml-mode
    :ensure t
    :pin melpa
    :mode (("\\.rhtml$" . rhtml-mode)
           ("\\.html\\.erb$" . rhtml-mode)))

  ;; (use-package inf-ruby
  ;;   :init (add-hook 'after-init-hook 'inf-ruby-switch-setup)
  ;;   :bind (("C-c r r" . inf-ruby)
  ;; 	 ("C-c r a" . rvm-activate-corresponding-ruby)))

  (use-package company-inf-ruby
    :ensure t
    :pin melpa
    )

  )

(provide '42_ruby)
;;; 42_ruby.el ends here
