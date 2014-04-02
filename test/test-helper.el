;;; test-helper.el --- Scame: Test helper

;; Copyright (C) 2014 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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


(require 'cask)

(defconst scame-test/test-path
  (f-parent (f-this-file)))

(defconst scame-test/root-path
  (f-parent scame-test/test-path))

(defconst scame-test/sandbox-path
  (f-expand "sandbox" scame-test/test-path))

(defconst scame-cask-file (f-join scame-test/root-path "Cask"))
;;(defconst scame-cask-cli-file (f-join scame-test/root-path "scame-cli.el"))

(add-to-list 'load-path scame-test/root-path)

(defmacro with-scame-sandbox (&rest body)
  `(unwind-protect
       (progn
	 (when (f-dir? scame-test/sandbox-path)
	   (f-delete scame-test/sandbox-path 'force))
	 (f-mkdir scame-test/sandbox-path)
	 ,@body)
     (when (f-dir? scame-test/sandbox-path)
       (f-delete scame-test/sandbox-path 'force))))


(provide 'test-helper)
;;; test-helper.el ends here
