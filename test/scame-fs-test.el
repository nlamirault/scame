;;; scame-fs-test.el --- Unit tests for Scame filesystem.

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

;; Directories

(ert-deftest test-scame-direx ()
  (with-test-sandbox
   (should (featurep 'direx))
   (should (eql 'direx:jump-to-directory
                (key-binding (kbd "C-x d j"))))))

(ert-deftest test-scame-dired-filter ()
  (with-test-sandbox
   (should (featurep 'dired-filter))))

(ert-deftest test-scame-dired-filter ()
  (with-test-sandbox
   (should (featurep 'dired-open))))

(ert-deftest test-scame-dired-filter ()
  (with-test-sandbox
   (should (featurep 'dired-rainbow))))

(ert-deftest test-scame-dired-filter ()
  (with-test-sandbox
   (should (featurep 'dired-subtree))))

(provide 'scame-fs-test)
;;; scame-fs-test.el ends here
