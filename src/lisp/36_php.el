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

(use-package php-mode
  :config (progn
            (add-hook 'php-mode-hook
                      (lambda ()
                        (setq indent-tabs-mode nil)
                        (setq-default indent-tabs-mode nil)
                        (setq-default tab-width 4)
                        (setq c-basic-offset 4)
                        (setq c-basic-indent 4)
                        (column-highlight 150)
                        (setq fill-column 150)
                        (turn-on-auto-fill)
                        (setq php-mode-force-pear t))))
  :mode (("\\.php\\'" . php-mode)))


;; FIXME: See Cerbere or not ?
(use-package phpunit
  :config (add-hook 'php-mode-hook
 		    (lambda ()
 		      (local-set-key (kbd "C-x p t") 'phpunit-current-test)
 		      (local-set-key (kbd "C-x p f") 'phpunit-current-class)
 		      (local-set-key (kbd "C-x p p") 'phpunit-current-project))))


(provide '36_php)
;;; 36_php.el ends here
