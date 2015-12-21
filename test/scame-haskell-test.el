;;; scame-haskell-test.el --- Unit tests for Scame Haskell development.

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

(defconst testsuite-haskell-filename
  "var/hello.hs"
  "File name for testing Haskell setup.")

(ert-deftest test-scame-haskell ()
  :tags '(haskell)
  (with-test-sandbox
   (with-current-file
    testsuite-haskell-filename
    (should (featurep 'haskell-mode))
    (should (eql 'haskell-process-do-type
        	 (key-binding (kbd "C-x h t"))))
    (should (eql 'haskell-process-do-info
        	 (key-binding (kbd "C-x h i"))))
    (should (eql 'haskell-process-cabal
        	 (key-binding (kbd "C-x h c"))))
    (should (eql 'haskell-process-cabal-build
        	 (key-binding (kbd "C-x h b")))))))


(provide 'scame-haskell-test)
;;; scame-haskell-test.el ends here
