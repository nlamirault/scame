;;; scame-global-keys.el --- Unit tests for Scame global keybidings.

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


;;(require 'test-helper)


(defmacro with-scame-mode (&rest body)
  `(with-temp-buffer
     (scame-global-mode)
     ,@body))

(ert-deftest test-scame-version-keybinding ()
  :tags '(current)
  (with-test-sandbox
   (with-scame-mode
    (should (eql 'scame-version
                 (key-binding (kbd "C-c s v")))))))

(ert-deftest test-scame-customization-keybinding ()
  (with-test-sandbox
   (with-scame-mode
    (should (eql 'scame-customization
                 (key-binding (kbd "C-c s z")))))))

(ert-deftest test-scame-searchs-keybindings ()
  (with-test-sandbox
   (with-scame-mode
    (should (eql 'scame-search-google
                 (key-binding (kbd "C-c s s g"))))
    (should (eql 'scame-search-github
                 (key-binding (kbd "C-c s s h"))))
    (should (eql 'scame-search-launchpad
                 (key-binding (kbd "C-c s s l"))))
    (should (eql 'scame-search-arch-aur
                 (key-binding (kbd "C-c s s a")))))))

(ert-deftest test-scame-emails-keybindings ()
  (with-test-sandbox
   (with-scame-mode
    (should (eql 'scame-mail-gmail
                 (key-binding (kbd "C-c s m g"))))
    (should (eql 'scame-mail-exchange
                 (key-binding (kbd "C-c s m e"))))
    (should (eql 'scame-mail-offlineimap
                 (key-binding (kbd "C-c s m o")))))))

(ert-deftest test-scame-paradox-list-packages-keybinding ()
  (with-test-sandbox
   (with-scame-mode
    (should (eql 'paradox-list-packages
                 (key-binding (kbd "C-c s l p")))))))

(ert-deftest test-scame-proced-keybinding ()
  (with-test-sandbox
   (with-scame-mode
    (should (eql 'proced
                 (key-binding (kbd "C-c s l h")))))))

(ert-deftest test-scame-multi-term-keybinding ()
  (with-test-sandbox
   (with-scame-mode
    (should (string-equal "/bin/bash" multi-term-program))
    (should (eql 'scame-launch-term
                 (key-binding (kbd "C-c s l t")))))))

(ert-deftest test-scame-web-keybindings ()
  (with-test-sandbox
   (with-scame-mode
    (should (eql 'browse-url-at-point
                 (key-binding (kbd "C-c u"))))
    (should (eql 'eww
                 (key-binding (kbd "C-c w")))))))


(provide 'scame-global-keys-test)
;;; scame-global-keys-test.el ends here
