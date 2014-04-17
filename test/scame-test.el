;;; scame-test.el --- Unit tests for Scame.

;; Copyright (C) 2014  Nicolas Lamirault <nicolas.lamirault@gmail.com>

;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;; The above copyright notice and this permission notice shall be included in
;; all copies or substantial portions of the Software.

;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
;; THE SOFTWARE.

;;; Commentary:

;;; Code:


(require 'test-helper)
(require 'f)


(ert-deftest test-scame-version ()
  (should (require '999_scame))
  (should (string-equal "0.4.0" scame-package-version)))


(ert-deftest test-scame-keybindings ()
  (with-temp-buffer
    (scame-mode)
    (should (eql 'scame-version
		 (key-binding (kbd "C-c s v"))))
    (should (eql 'scame-changelog
		 (key-binding (kbd "C-c s c"))))
    (should (eql 'scame-customization
		 (key-binding (kbd "C-c s z"))))
    (should (eql 'scame-search-google
		 (key-binding (kbd "C-c s s g"))))
    (should (eql 'scame-search-github
		 (key-binding (kbd "C-c s s h"))))
    (should (eql 'scame-search-twitter
		 (key-binding (kbd "C-c s s t"))))
    (should (eql 'scame-search-launchpad
		 (key-binding (kbd "C-c s s l"))))
    (should (eql 'scame-search-arch-aur
		 (key-binding (kbd "C-c s s a"))))
    ))



(provide 'scame-test)
;;; scame-test.el ends here
