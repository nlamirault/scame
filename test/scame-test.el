;;; scame-test.el --- Unit tests for Scame.

;; Copyright (C) 2014  Nicolas Lamirault <nicolas.lamirault@gmail.com>

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


(require 'test-helper)


(ert-deftest test-scame-version ()
  (should (require '999_scame))
  (should (string-equal "0.11.0" scame-package-version)))


(ert-deftest test-scame-customization-file ()
  (should (require '999_scame))
  (should (string-equal
	   (f-join (getenv "HOME") ".config/scame/scame-user.el")
	   scame-user-customization-file)))

(provide 'scame-test)
;;; scame-test.el ends here
