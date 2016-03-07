;;; scame-helm-test.el --- Unit tests for Scame Helm configuration.

;; Copyright (C) 2014, 2015  Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

;; FIXME
(ert-deftest test-scame-helm ()
  :tags '(helm)
  (let ((scame-completion-method 'helm))
    (scame--setup-search-framework scame-completion-method)
    (with-test-sandbox
     (require 'helm)
     (should (eql 'scame-completion-map
                  (key-binding (kbd "C-x c"))))
     (should (eql 'helm-find-files
                  (key-binding (kbd "C-x c F"))))
     (should (eql 'helm-for-files
                  (key-binding (kbd "C-x c f"))))
     (should (eql 'helm-M-x
                  (key-binding (kbd "C-x c x"))))
     (should (eql 'helm-show-kill-ring
                  (key-binding (kbd "C-x c y"))))
     (should (eql 'helm-buffers-list
                  (key-binding (kbd "C-x c b")))))))

(ert-deftest test-scame-occur ()
  :tags '(helm)
  (let ((scame-completion-method 'helm))
    (scame--setup-search-framework scame-completion-method)
    (with-test-sandbox
     (require 'helm)
     (should (eql 'helm-occur (key-binding (kbd "C-x c o")))))))

(ert-deftest test-scame-swoop ()
  :tags '(helm)
  (let ((scame-completion-method 'helm))
    (scame--setup-search-framework scame-completion-method)
    (with-test-sandbox
     (require 'helm)
     (require 'helm-swoop)
     (should (featurep 'helm-swoop))
     (should (eql 'helm-swoop (key-binding (kbd "C-x c w"))))
     (should (eql 'helm-multi-swoop (key-binding (kbd "C-x c W")))))))

(ert-deftest test-scame-helm-imenu ()
  :tags '(helm)
  (let ((scame-completion-method 'helm))
    (scame--setup-search-framework scame-completion-method)
    (with-test-sandbox
     (require 'helm)
     (require 'helm-imenu)
     (should (featurep 'helm-imenu))
     (should (eql 'helm-imenu
                  (key-binding (kbd "C-x c i")))))))

(provide 'scame-helm-test)
;;; scame-helm-test.el ends here
