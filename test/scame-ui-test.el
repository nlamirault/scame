;;; scame-uis-test.el --- Unit tests for Scame UI.

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

;; (ert-deftest test-scame-ui-windows-keys ()
;;   :tags '(ui)
;;   (with-test-sandbox
;;    (should (scame-mode))
;;    (should (eql 'windmove-left (key-binding (kbd "C-c <left>"))))
;;    (should (eql 'windmove-right (key-binding (kbd "C-c <right>"))))
;;    (should (eql 'windmove-up (key-binding (kbd "C-c <up>"))))
;;    (should (eql 'windmove-down (key-binding (kbd "C-c <down>"))))
;;    (should (eql 'enlarge-window (key-binding (kbd "M-<left>"))))
;;    (should (eql 'shrink-window (key-binding (kbd "M-<right>"))))
;;    (should (eql 'enlarge-window-horizontally (key-binding (kbd "M-<up>"))))
;;    (should (eql 'shrink-window-horizontally (key-binding (kbd "M-<down>"))))))


(ert-deftest test-scame-ui-minor-mode ()
  :tags '(ui)
  (with-test-sandbox
   (mapc (lambda (mode)
           (should mode))
         '(column-number-mode global-linum-mode line-number-mode))))


;;
(ert-deftest test-scame-ace-window ()
  :tags '(ui)
  (with-test-sandbox
   (require 'ace-window)
   (should (featurep 'ace-window))
   (should (eql 'ace-window (key-binding (kbd "C-x o"))))))


(provide 'scame-ui-test)
;;; scame-ui-test.el ends here
