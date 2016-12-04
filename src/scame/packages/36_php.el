;;; 36_php.el --- PHP configuration

;; Copyright (C) 2014, 2016 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

(when scame-php

  (use-package php-mode :quelpa
    :config (progn
              (add-hook 'php-mode-hook
                        (lambda ()
                          (php-enable-psr2-coding-style)
                          (setq flycheck-phpcs-standard "PSR2")
                          (setq flycheck-phpmd-rulesets
                                '("codesize"
                                  "controversial"
                                  "design"
                                  "naming"
                                  "unusedcode"))
                          )))
    :mode (("\\.php\\'" . php-mode)))

  (use-package phpunit :quelpa
    :config (add-hook 'php-mode-hook
                      (lambda ()
                        (local-set-key (kbd "C-x p t") 'phpunit-current-test)
                        (local-set-key (kbd "C-x p f") 'phpunit-current-class)
                        (local-set-key (kbd "C-x p p") 'phpunit-current-project))))

  )

(provide '36_php)
;;; 36_php.el ends here
