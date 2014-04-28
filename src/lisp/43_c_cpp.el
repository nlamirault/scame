;;; 43_c_cpp.el -- C/C++ configuration

;; Copyright (C) 2014  Nicolas Lamirault <nicolas.lamirault@gmail.com>

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


(use-package google-c-style
  :config (progn
            (add-hook 'c-mode-common-hook 'google-set-c-style)
            (add-hook 'c-mode-common-hook 'google-make-newline-indent)
            (add-hook 'c-mode-hook '(lambda ()
                                      (setq c-basic-offset 4)))
            (add-hook 'c++-mode-common-hook 'google-set-c-style)))

(use-package auto-complete-c-headers
  :config (progn
            (add-to-list 'ac-sources 'ac-source-c-headers)
            (add-hook 'c++-mode-hook '(lambda ()
                                        (add-to-list 'ac-sources 'ac-source-c-headers)))
            (add-hook 'c-mode-hook '(lambda ()
                                      (add-to-list 'ac-sources 'ac-source-c-headers)))))


(use-package c-eldoc
  :config (progn
            (add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)
            (add-hook 'c++-mode-hook 'c-turn-on-eldoc-mode)))


(provide '43_c_cpp)
;;; 43_c_cpp.el ends here
