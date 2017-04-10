;;; 04_search.el --- Emacs search frameworks configuration

;; Copyright (c) 2014-2017 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

(global-unset-key (kbd "C-x c"))
(define-prefix-command 'scame-completion-map)
(global-set-key (kbd "C-x c") 'scame-completion-map)

(use-package counsel
  :ensure t
  :pin melpa
  :bind (("C-x c F" . counsel-find-file)
         ("M-x" . counsel-M-x)
         ("C-x c v" . counsel-describe-variable)
         ("C-x c f" . counsel-describe-function)
         ("C-x c l" . counsel-describe-library)
         ("C-x c y" . counsel-info-lookup-symbol)
         ("C-x c o" . counsel-bookmark)
         ("C-x c p" . counsel-package)
         ("C-x c i" . counsel-imenu)))

(use-package ivy
  :ensure t
  :pin melpa
  :diminish ivy-mode
  :config (progn
            (ido-mode -1)
            (ivy-mode 1))
  :bind (("C-x c r" . ivy-recentf)
         ("C-x c b" . ivy-switch-buffer)))

(use-package swiper
  :ensure t
  :pin melpa
  :bind (("C-s" . swiper)
         ("C-r" . swiper)))

(use-package ivy-hydra
  :ensure t
  :pin melpa)

(use-package counsel-projectile
  :ensure t
  :pin melpa
  :config (counsel-projectile-on))

(provide '04_search)
;;; 04_search.el ends here
