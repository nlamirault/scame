;;; scame-ivy-test.el --- Unit tests for Scame Ivy configuration.

;; Copyright (C) 2015  Nicolas Lamirault <nicolas.lamirault@gmail.com>

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


(ert-deftest test-scame-ivy ()
  :tags '(ivy)
  (let ((scame-completion-method 'ivy))
    (scame--setup-search-framework scame-completion-method)
    (with-test-sandbox
     (require 'ivy)
     (should (eql 'scame-completion-map
                  (key-binding (kbd "C-x c"))))
     (should (eql 'counsel-find-file
                  (key-binding (kbd "C-x c F"))))
     (should (eql 'counsel-describe-function
                  (key-binding (kbd "C-x c f"))))
     (should (eql 'counsel-describe-variable
                  (key-binding (kbd "C-x c v"))))
     (should (eql 'counsel-info-lookup-symbol
                  (key-binding (kbd "C-x c y"))))
     (should (eql 'ivy-recentf
                  (key-binding (kbd "C-x c r"))))
     (should (eql 'ivy-switch-buffer
                  (key-binding (kbd "C-x c b")))))))


(ert-deftest test-scame-ivy-imenu ()
  :tags '(ivy)
  (let ((scame-completion-method 'ivy))
    (scame--setup-search-framework scame-completion-method)
    (with-test-sandbox
     (require 'ivy)
     (should (eql 'counsel-imenu
                  (key-binding (kbd "C-x c i")))))))



(provide 'scame-ivy-test)
;;; scame-ivy-test.el ends here
