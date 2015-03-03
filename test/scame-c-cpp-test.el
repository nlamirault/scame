;;; scame-c-cpp-test.el --- Unit tests for Scame C/C++/ObjectiveC development.

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

(ert-deftest test-scame-c ()
  :tags '(scame-c-cpp)
  (with-test-sandbox
   (with-current-file
    "var/hello.c"
    (should (featurep 'irony))
    (should (featurep 'company-irony))
    (should (featurep 'irony-eldoc))
    (should (= 2 c-basic-offset))
    (should (string-equal "gnu" c-indentation-style)))))
    ;;(should (= 30 c-eldoc-buffer-regenerate-time)))))

(ert-deftest test-scame-cpp ()
  :tags '(scame-c-cpp)
  (with-test-sandbox
   (with-current-file
    "var/hello.cpp"
    (should (featurep 'irony))
    (should (featurep 'company-irony))
    (should (featurep 'irony-eldoc))
    (should (= 2 c-basic-offset))
    (should (string-equal "gnu" c-indentation-style)))))
    ;;(should (= 30 c-eldoc-buffer-regenerate-time)))))

(provide 'scame-c-cpp-test)
;;; scame-c-cpp-test.el ends here
