;;; scame-config-test.el --- Unit tests for Scame configuration.

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


;; (require 'test-helper)
;; (require 'f)


;; Init file

(ert-deftest test-scame-init-file ()
  (with-test-sandbox
   (mapc (lambda (mode)
           (should (featurep mode)))
         '(el-init cask use-package))))

(ert-deftest test-scame-global-mode-is-loaded ()
  (with-test-sandbox
   (should (scame-mode))))

;; UI tests

(ert-deftest test-scame-ui-minor-mode ()
  (with-test-sandbox
   (mapc (lambda (mode)
           (should mode))
         '(column-number-mode global-linum-mode line-number-mode))))

;; Disable
;; (ert-deftest test-scame-golden-radio ()
;;   (should (golden-radio-mode)))


;; Check encodings

(ert-deftest test-scame-encodings ()
  (with-test-sandbox
   (should (eql 'utf-8 default-terminal-coding-system))
   (should (eql 'utf-8-unix keyboard-coding-system))
   (should (string-equal "UTF-8" current-language-environment))))

;; Ido

(ert-deftest test-scame-ido ()
  (with-test-sandbox
   (should (featurep 'ido))))

;; Powerline

(ert-deftest test-scame-powerline ()
  (with-test-sandbox
   (should (featurep 'powerline))))

(ert-deftest test-scame-imenu-anywhere ()
  (with-test-sandbox
   (require 'imenu-anywhere)
   (should (featurep 'imenu-anywhere))
   (should (eql 'imenu-anywhere (key-binding (kbd "C-."))))))


;; smex

;; (ert-deftest test-scame-smex ()
;;   (require 'smex)
;;   (should (featurep 'smex))
;;   ;; Not works in unit test
;;   ;; (should (string-equal (f-join user-emacs-directory ".smex-items")
;;   ;;                       smex-save-file))
;;   (should (eql 'smex (key-binding (kbd "C-x M-x"))))
;;   (should (eql 'smex-major-mode-commands (key-binding (kbd "C-x M-X")))))


;; Packages

(ert-deftest test-scame-packages ()
  (with-test-sandbox
   (should (require 'paradox))))


(provide 'scame-config-test)
;;; scame-config-test.el ends here
