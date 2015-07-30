;;; scame-commonlisp-test.el --- Unit tests for Scame Common Lisp development.

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

(defconst testsuite-commonlisp-filename
  "var/hello.lisp"
  "File name for testing Common Lisp setup.")

(ert-deftest test-scame-commonslisp-implementation ()
  :tags '(commonlisp)
  (with-test-sandbox
   (with-current-file
    testsuite-commonlisp-filename
    (should (string-equal "/usr/bin/sbcl" inferior-lisp-program)))))

(ert-deftest test-scame-commonslisp-sly ()
  :tags '(commonlisp)
  (with-test-sandbox
   (with-current-file
    testsuite-commonlisp-filename
    (should (featurep 'lisp-mode))
    (should (eql 'describe-key
                 (key-binding (kbd "C-h k"))))
    ;; (should (eql 'sly-eval-defun
    ;;              (key-binding (kbd "C-M-x"))))
    ;; (should (eql 'sly-compile-defun
    ;;              (key-binding (kbd "C-c C-c"))))
    ;; (should (eql 'sly-compile-and-load-file
    ;;              (key-binding (kbd "C-c C-k"))))
    )))

;; (ert-deftest test-scame-commonslisp-sly-company-mode ()
;;   (with-test-sandbox
;;    (with-current-file
;;     testsuite-commonlisp-filename
;;     (should (featurep 'sly-company-mode)))))

    ;; (should (eql 'company-select-next
    ;;              (key-binding (kbd "C-n"))))
    ;; (should (eql 'company-select-previous
    ;;              (key-binding (kbd "C-p"))))
    ;; (should (eql 'company-show-doc-buffer
    ;;              (key-binding (kbd "C-d"))))
    ;; (should (eql 'company-show-location
    ;;              (key-binding (kbd "M-.")))))))



(provide 'scame-commonlisp-test)
;;; scame-commonlisp-test.el ends here
