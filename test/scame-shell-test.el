;;; scame-shell-test.el --- Unit tests for Scame shell setup

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

(ert-deftest test-scame-multi-term ()
  :tags '(shell)
  (with-test-sandbox
   (with-scame-mode
    (should (string-equal "/bin/bash" multi-term-program)))))


(provide 'scame-shell-test)
;;; scame-shell-test.el ends here
