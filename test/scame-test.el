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


(ert-deftest check-cli-dependencies ()
  (with-scame-sandbox
   (f-copy scame-cli-cask-file scame-test/sandbox-path)
   (let ((bundle (cask-setup scame-test/sandbox-path)))
     (should (eql 9 (length (cask-development-dependencies bundle)))))))

(ert-deftest check-scame-install-dependencies ()
  (with-scame-sandbox
   (f-copy scame-install-cask-file scame-test/sandbox-path)
   (let ((bundle (cask-setup scame-test/sandbox-path)))
     (should (eql 9 (length (cask-development-dependencies bundle))))
     (should (eql 95 (length (cask-dependencies bundle)))))))

(ert-deftest check-scame-installation ()
  (with-scame-sandbox
   (f-copy scame-install-cask-file scame-test/sandbox-path)
   (let ((bundle (cask-setup scame-test/sandbox-path)))
     (cask-install bundle))))


(provide 'scame-test)
;;; scame-test.el ends here
