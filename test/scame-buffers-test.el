;;; scame-buffers-test.el --- Unit tests for Scame buffers.

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

(ert-deftest test-scame-uniquify ()
  :tags '(buffers)
  (with-test-sandbox
   (require 'uniquify)
   (should (featurep 'uniquify))))

(ert-deftest test-scame-ag ()
  :tags '(buffers)
  (with-test-sandbox
   (require 'ag)
   (should (featurep 'ag))))

(ert-deftest test-scame-ace-jump-mode ()
  :tags '(buffers)
  (with-test-sandbox
   (require 'ace-jump-mode)
   (should (featurep 'ace-jump-mode))
   (should (eql 'ace-jump-mode (key-binding (kbd "C-c SPC"))))))

(ert-deftest test-scame-recentf ()
  :tags '(buffers)
  (with-test-sandbox
   (should (featurep 'recentf))
   (should (string-equal (f-join user-emacs-directory ".recentf")
                         recentf-save-file))))


(provide 'scame-buffers-test)
;;; scame-buffers-test.el ends here
