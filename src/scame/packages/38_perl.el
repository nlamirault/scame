;;; 38_perl -- Perl configuration

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


(when scame-perl

  (use-package helm-perldoc
    ;; :defer scame-defer-package
    :config (add-hook 'perl-mode-hook
                      (lambda ()
                        (local-set-key (kbd "C-x e d") 'helm-perldoc))))


  )



(provide '38_perl)
;;; 38_perl.el ends here
