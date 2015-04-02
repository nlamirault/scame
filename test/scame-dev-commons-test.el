;;; scame-dev-commons-test.el --- Unit tests for Scame development.

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

;; FIXME
;; (ert-deftest test-scame-development-commons ()
;;   (should (eql nil indent-tabs-mode)))

(ert-deftest test-scame-fill-column ()
  (with-test-sandbox
   (should (= 120 fill-column))))

(ert-deftest test-scame-changelog-mode ()
  (with-test-sandbox
   (with-temp-buffer
     (change-log-mode)
     (should (eql nil indent-tabs-mode)))))

;; (ert-deftest test-scame-projectile ()
;;   (with-test-sandbox
;;    (should (require 'projectile))
;;    (should (eql 'projectile-find-file
;;                 projectile-switch-project-action))))

;; (ert-deftest test-scame-helm-projectile ()
;;   (with-test-sandbox
;;    (should (require 'helm-projectile))
;;    (should (eql 'helm-projectile
;;                 (key-binding (kbd "C-c p h"))))))

(ert-deftest test-scame-projectile ()
  (with-test-sandbox
   (should (require 'projectile))
   (should (eql projectile-find-file
                helm-projectile-find-file))
   (should (eql 'helm-projectile
                (key-binding (kbd "C-c p h"))))))

;; (ert-deftest test-scame-project-explorer ()
;;   (should (require 'project-explorer)))

;; perspective

(ert-deftest test-perspective ()
  (with-test-sandbox
   (with-current-file
    "var/hello.php"
    (persp-mode)
    (should (require 'persp-projectile))
    (should (eql 'projectile-find-file  (key-binding (kbd "C-c p f"))))
    (should (eql 'persp-switch (key-binding (kbd "C-x x s"))))
    (should (eql 'persp-remove-buffer (key-binding (kbd "C-x x k"))))
    (should (eql 'persp-kill (key-binding (kbd "C-x x c"))))
    (should (eql 'persp-rename (key-binding (kbd "C-x x r"))))
    (should (eql 'persp-add-buffer (key-binding (kbd "C-x x a"))))
    (should (eql 'persp-import (key-binding (kbd "C-x x i"))))
    (should (eql 'persp-next (key-binding (kbd "C-x x n"))))
    (should (eql 'persp-prev (key-binding (kbd "C-x x p")))))))


(provide 'scame-dev-commons-test)
;;; scame-dev-commons-test.el ends here
