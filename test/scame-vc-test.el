;;; scame-vc-test.el --- Unit tests for Scame version control.

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

;; Git

(ert-deftest test-scame-magit ()
  :tags '(vc)
  (with-test-sandbox
   (require 'magit)
   (should (featurep 'magit))
   (should (eql 'magit-status (key-binding (kbd "C-c g s"))))
   (should (eql 'magit-pull (key-binding (kbd "C-c g d"))))
   (should (eql 'magit-push (key-binding (kbd "C-c g p"))))
   (should (eql 'magit-log (key-binding (kbd "C-c g l"))))
   (should (eql 'magit-branch-manager (key-binding (kbd "C-c g b"))))))


;; FIXME: #27
;; (ert-deftest test-scame-git-gutter+ ()
;;   (should (eql 'global-git-gutter+-mode (key-binding (kbd "C-c g m"))))
;;   (should (eql 'git-gutter+-next-hunk (key-binding (kbd "C-c g >"))))
;;   (should (eql 'git-gutter+-previous-hunk (key-binding (kbd "C-c g <")))))



(provide 'scame-vc-test)
;;; scame-vc-test.el ends here
