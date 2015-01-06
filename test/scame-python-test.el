;;; scame-python-test.el --- Unit tests for Scame python tools.

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

(defconst testsuite-python-filename
  "var/hello.py"
  "File name for testing python setup.")

(ert-deftest test-scame-python ()
  (with-test-sandbox
   (with-current-file
    testsuite-python-filename
    (should (= 4 python-indent-offset))
    (should (eql nil indent-tabs-mode)))))

(ert-deftest test-scame-anaconda ()
  (with-test-sandbox
   (with-current-file
    testsuite-python-filename
    (should (featurep 'anaconda-mode))
    ;; FIXME
    ;;(should (featurep 'eldoc-mode))
    )))

(ert-deftest test-scame-tox ()
  (with-test-sandbox
   (with-current-file
    testsuite-python-filename
    (should (eql 'tox-current-test
                 (key-binding (kbd "C-x y t"))))
    (should (eql 'tox-current-class
                 (key-binding (kbd "C-x y f")))))))

;; FIXME: why not present ?
;; (should (featurep 'company-anaconda))))

;; FIXME: jedi ??
;; (ert-deftest test-scame-jedi-direx ()
;;   (with-current-file testsuite-python-filename
;;     (should (eql 'jedi-direx:pop-to-buffer
;; 		 (key-binding (kbd "C-x y x"))))))

(ert-deftest test-scame-sphinx-doc ()
  (with-test-sandbox
   (with-current-file
    testsuite-python-filename
    (should (eql 'sphinx-doc
                 (key-binding (kbd "C-c M-d")))))))

;; FIXME: doesn't works on unit tests, works on Emacs instance
;; (ert-deftest test-scame-helm-pydoc ()
;;   (with-current-file testsuite-python-filename
;;     (should (eql 'helm-pydoc
;;                  (key-binding (kbd "C-x y d"))))))



(provide 'scame-python-test)
;;; scame-python-test.el ends here
