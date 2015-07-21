;;; scame-perl-test.el --- Unit tests for Scame Perl development.

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


(defconst testsuite-perl-filename
  "var/hello.pl"
  "File name for testing Perl setup.")

(ert-deftest test-scame-perl ()
  :tags '(perl)
  (with-test-sandbox
   (with-current-file
    testsuite-perl-filename
    (should (featurep 'perl-mode)))))

;; (ert-deftest test-scame-plsense-direx ()
;;   (with-current-file testsuite-perl-filename
;;     (should (eql 'plsense-direx:open-explorer-key
;; 		 (key-binding (kbd "C-x j"))))))

(ert-deftest test-scame-helm-perldoc ()
  :tags '(perl)
  (with-test-sandbox
   (with-current-file
    testsuite-perl-filename
    (should (eql 'helm-perldoc
		 (key-binding (kbd "C-x e d")))))))

(provide 'scame-perl-test)
;;; scame-perl-test.el ends here
