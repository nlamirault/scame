;;; scame-markuptext-test.el --- Unit tests for markup text configuration.

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


(ert-deftest test-scame-markdown-mode ()
  :tags '(markup)
  (with-test-sandbox
   (with-current-file
    "var/readme.md"
    (should (featurep 'markdown-mode)))
   (with-current-file
    "var/readme.markdown"
    (should (featurep 'markdown-mode)))))

;; (ert-deftest test-scame-fountain-mode ()
;;   :tags '(markup)
;;   (with-test-sandbox
;;    (with-current-file
;;     "var/scame.fountain"
;;     (should (featurep 'fountain-mode)))))

(ert-deftest test-scame-toml-mode ()
  :tags '(markup)
  (with-test-sandbox
   (with-current-file
    "var/scame.toml"
    (should (featurep 'toml-mode)))))

(ert-deftest test-scame-asciidoc-mode ()
  :tags '(markup)
  (with-test-sandbox
   (with-current-file
    "var/readme.adoc"
    (should (featurep 'adoc-mode)))))

;; FIXME: package broken ?
;; (ert-deftest test-fixmee-mode ()
;;   (with-current-file "var/hello.py"
;;       (should fixmee-mode)
;;       (should (eql 'fixmee-view-listing
;;                    (key-binding (kbd "C-x v f"))))))


(provide 'scame-markuptext-test)
;;; scame-markuptext-test.el ends here
