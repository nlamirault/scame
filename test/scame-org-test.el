;;; scame-org-test.el --- Unit tests for Scame Common Lisp development.

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


(ert-deftest test-scame-org ()
  (with-test-sandbox
   (should (require 'org))
   (should (string-equal (f-join user-home-directory "Org")
                         org-directory))
   (should (eql 'org-store-link
                (key-binding (kbd "C-c o l"))))
   (should (eql 'org-agenda
                (key-binding (kbd "C-c o a"))))
   (should (eql 'org-iswitchb
                (key-binding (kbd "C-c o b"))))
   (should (eql 'org-capture
                (key-binding (kbd "C-c o c"))))))


(provide 'scame-org-test)
;;; scame-org-test.el ends here
