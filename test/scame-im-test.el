;;; scame-im-test.el --- Unit tests for Scame Instant Messaging configuration.

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

;; IRC

(ert-deftest test-scame-erc ()
  :tags '(im)
  (with-test-sandbox
   (should (require 'erc))))

;; Twitter

(ert-deftest test-scame-twitter ()
  :tags '(im)
  (with-test-sandbox
   (should (eql 'twit
                (key-binding (kbd "C-c t t"))))))


(provide 'scame-im-test)
;;; scame-im-test.el ends here
