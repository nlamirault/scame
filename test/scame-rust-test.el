;;; scame-rust-test.el --- Unit tests for Scame Rust development.

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


(ert-deftest test-scame-rust ()
  :tags '(rust)
  (with-test-sandbox
   (with-current-file
    "var/hello.rs"
    (should (featurep 'rust-mode))
    (should (eql 'cargo-test-current-test
                 (key-binding (kbd "C-x r t"))))
    (should (eql 'cargo-test-current-file
                 (key-binding (kbd "C-x r f"))))
    (should (eql 'cargo-test-current-project
                 (key-binding (kbd "C-x r p")))))))


(provide 'scame-rust-test)
;;; scame-rust-test.el ends here
