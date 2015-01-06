;;; scame-golang-test.el --- Unit tests for Scame Common Lisp development.

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

(defconst testsuite-go-filename
  "var/hello.go"
  "File name for testing Golang setup.")

(ert-deftest test-scame-golang ()
  (with-test-sandbox
   (with-current-file
    testsuite-go-filename
    (should (featurep 'go-mode))
    (should (eql 'go-remove-unused-imports
        	 (key-binding (kbd "C-x g r"))))
    (should (eql 'go-goto-imports
        	 (key-binding (kbd "C-x g i"))))
    (should (eql 'godef-jump
        	 (key-binding (kbd "C-x g j"))))
    (should (eql 'godoc
                 (key-binding (kbd "C-x g d"))))
    (should (eql 'go-test-current-test
                 (key-binding (kbd "C-x g t"))))
    (should (eql 'go-test-current-file
                 (key-binding (kbd "C-x g f"))))
    (should (eql 'go-test-current-project
                 (key-binding (kbd "C-x g p")))))))

;; (ert-deftest test-scame-go-direx ()
;;   (with-current-file testsuite-go-filename
;;     (should (eql 'go-direx-pop-to-buffer
;; 		 (key-binding (kbd "C-x g x"))))))

;; (ert-deftest test-scame-go-projectile ()
;;   (with-current-file testsuite-go-filename
;;     (projectile-mode)
;;     (should (eql 'go-projectile-get
;; 		 (key-binding (kbd "C-c p N"))))))

(provide 'scame-golang-test)
;;; scame-golang-test.el ends here
