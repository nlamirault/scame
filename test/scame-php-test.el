;;; scame-php-test.el --- Unit tests for Scame Common Lisp development.

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

(ert-deftest test-scame-php ()
  (with-test-sandbox
   (with-current-file
    "var/hello.php"
    (should (featurep 'php-mode))
    (should (eql 'phpunit-current-test
                 (key-binding (kbd "C-x p t"))))
    (should (eql 'phpunit-current-class
                 (key-binding (kbd "C-x p f"))))
    (should (eql 'phpunit-current-project
                 (key-binding (kbd "C-x p p")))))))

(provide 'scame-php-test)
;;; scame-php-test.el ends here
