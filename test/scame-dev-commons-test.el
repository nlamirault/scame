;;; scame-dev-commons-test.el --- Unit tests for Scame development.

;; Copyright (C) 2014, 2015, 2016  Nicolas Lamirault <nicolas.lamirault@gmail.com>

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
  :tags '(dev)
  (with-test-sandbox
   (should (= 120 fill-column))))

(ert-deftest test-scame-changelog-mode ()
  :tags '(dev)
  (with-test-sandbox
   (with-temp-buffer
     (change-log-mode)
     (should (eql nil indent-tabs-mode)))))

(ert-deftest test-perspective ()
  :tags '(dev)
  (with-test-sandbox
   (with-current-file
    "var/hello.php"
    (persp-mode)
    (should (require 'persp-projectile))
    ;; FIX https://github.com/nlamirault/scame/issues/50
    ;; (should (eql 'helm-projectile-find-file  (key-binding (kbd "C-c p f"))))
    (should (eql 'persp-switch (key-binding (kbd "C-x x s"))))
    (should (eql 'persp-remove-buffer (key-binding (kbd "C-x x k"))))
    (should (eql 'persp-kill (key-binding (kbd "C-x x c"))))
    (should (eql 'persp-rename (key-binding (kbd "C-x x r"))))
    (should (eql 'persp-add-buffer (key-binding (kbd "C-x x a"))))
    (should (eql 'persp-import (key-binding (kbd "C-x x i"))))
    (should (eql 'persp-next (key-binding (kbd "C-x x n"))))
    (should (eql 'persp-prev (key-binding (kbd "C-x x p")))))))

(ert-deftest test-dumb-jump ()
  :tags '(dev)
  (with-test-sandbox
   (with-current-file
    "var/hello.go"
    (should (eql 'dumb-jump-go (key-binding (kbd "C-x j g"))))
    (should (eql 'dumb-jump-back (key-binding (kbd "C-x j b"))))
    (should (eql 'dumb-jump-quick-look (key-binding (kbd "C-x j q")))))))

(ert-deftest test-origami ()
  :tags '(dev)
  (with-test-sandbox
   (with-current-file
    "var/hello.go"
    (should (eql 'origami-open-node (key-binding (kbd "C-x C-o +"))))
    (should (eql 'origami-open-all-nodes (key-binding (kbd "C-x C-o *"))))
    (should (eql 'origami-close-node (key-binding (kbd "C-x C-o -"))))
    (should (eql 'origami-close-all-nodes (key-binding (kbd "C-x C-o ="))))
    (should (eql 'origami-recursively-toggle-node (key-binding (kbd "C-x C-o /")))))))


(provide 'scame-dev-commons-test)
;;; scame-dev-commons-test.el ends here
