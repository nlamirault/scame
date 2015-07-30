;;; 21_sysadmin.el --- Tools for sysadmin

;; Copyright (c) 2014, 2015 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

(when scame-sysadmin

  (use-package apache-mode
    ;; :defer scame-defer-package
    :mode (("\\.htaccess\\'" . apache-mode)
           ("httpd\\.conf\\'"  . apache-mode)
           ("srm\\.conf\\'"    . apache-mode)
           ("access\\.conf\\'" . apache-mode)
           ("sites-\\(available\\|enabled\\)/" . apache-mode)))

  )


(provide '21_sysadmin)
;;; 21_sysadmin.el ends here
