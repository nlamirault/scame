;;; scame-ruby-test.el --- Unit tests for Scame Ruby development.

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

(defconst testsuite-ruby-filename
  "var/hello.rb"
  "File name for testing ruby setup.")

(ert-deftest test-scame-ruby ()
  :tags '(ruby)
  (with-test-sandbox
   (with-current-file
    testsuite-ruby-filename
    (should (featurep 'rvm))
    (should (featurep 'ruby-tools))
    ;;(should (featurep 'inf-ruby))
    (should (featurep 'ruby-mode))
    (should (featurep 'company-inf-ruby))
    ;;(should (eql 'inf-ruby (key-binding (kbd "C-c r r"))))
    (should (eql 'ruby-tools-to-single-quote-string
                 (key-binding (kbd "C-'"))))
    (should (eql 'ruby-tools-to-double-quote-string
                 (key-binding (kbd "C-\""))))
    (should (eql 'ruby-tools-to-symbol
                 (key-binding (kbd "C-:"))))
    (should (eql 'ruby-tools-clear-string
                 (key-binding (kbd "C-;")))))))


(provide 'scame-ruby-test)
;;; scame-ruby-test.el ends here
