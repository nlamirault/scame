;;; 36_php.el --- PHP configuration

;; Copyright (C) 2014 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

(setq php-mode-force-pear t)

;; (add-hook 'php-mode-hook
;;           (lambda nil
;;             (setq indent-tabs-mode nil)
;;             (setq-default indent-tabs-mode nil)
;;             (setq-default tab-width 4)
;;             (setq c-basic-offset 4)
;;             (setq c-basic-indent 4)
;;             (column-highlight 150)
;;             (setq fill-column 150)
;;             (turn-on-auto-fill)))

;; (require 'web-mode)
;; (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(use-package web-mode
  :config (setq web-mode-code-indent-offset 4)
  :mode (("\\.html\\'" . web-mode)
	 ("\\.phtml\\'" . web-mode)
	 ("\\.tpl\\'" . web-mode)
	 ("\\.jsp\\'" . web-mode)
	 ("\\.erb\\'" . web-mode)
         ("\\.mustache\\'" . web-mode)
         ("\\.jinja\\'" . web-mode)
         ("\\.php\\'" . web-mode)))


;; FIXME: See Cerbere or not ?
(use-package phpunit
  :config (add-hook 'web-mode-hook
 		    (lambda ()
 		      (local-set-key (kbd "C-x p t") 'phpunit-current-test)
 		      (local-set-key (kbd "C-x p f") 'phpunit-current-class)
 		      (local-set-key (kbd "C-x p p") 'phpunit-current-project))))


(provide '36_php)
;;; 36_php.el ends here
