;;; scame-global-keys-test.el --- Unit tests for Scame global keybidings.

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



(ert-deftest test-scame-keybindings ()
  :tags '(scame-keys)
  (with-test-sandbox
   (with-scame-mode
    (should (eql 'hydra-scame/body
                 (key-binding (kbd "C-c s SPC")))))))


(ert-deftest test-scame-projectile-keybindings ()
  :tags '(scame-keys)
  (with-test-sandbox
   (with-scame-mode
    (should (eql 'hydra-scame-projectile/body
                 (key-binding (kbd "C-c s P")))))))


;; (ert-deftest test-scame-version-keybinding ()
;;   :tags '(scame-keys)
;;   (with-test-sandbox
;;    (with-scame-mode
;;     (should (eql 'scame/scame-version
;;                  (key-binding (kbd "C-c s v")))))))

;; (ert-deftest test-scame-customization-keybinding ()
;;   :tags '(scame-keys)
;;   (with-test-sandbox
;;    (with-scame-mode
;;     (should (eql 'scame/scame-customization
;;                  (key-binding (kbd "C-c s z")))))))

;; (ert-deftest test-scame-searches-keybindings ()
;;   :tags '(scame-keys)
;;   (with-test-sandbox
;;    (with-scame-mode
;;     (should (eql 'scame-search/engine/search-google
;;                  (key-binding (kbd "C-c s G"))))
;;     (should (eql 'scame-search/engine/search-github
;;                  (key-binding (kbd "C-c s H"))))
;;     (should (eql 'scame-search/engine/search-twitter
;;                  (key-binding (kbd "C-c s T"))))
;;     (should (eql 'scame-search/engine/search-stackoverflow
;;                  (key-binding (kbd "C-c s S"))))
;;     (should (eql 'scame-search/engine/search-wikipedia
;;                  (key-binding (kbd "C-c s W"))))
;;     ;; (should (eql 'scame-search/engine/search-arch
;;     ;;              (key-binding (kbd "C-c s s a")))))))
;;     )))

;; (ert-deftest test-scame-emails-keybindings ()
;;   :tags '(scame-keys)
;;   (with-test-sandbox
;;    (with-scame-mode
;;     (should (eql 'scame-email/scame-mail-gmail
;;                  (key-binding (kbd "C-c s M"))))
;;     (should (eql 'scame-email/scame-mail-exchange
;;                  (key-binding (kbd "C-c s E"))))
;;     (should (eql 'scame-email/scame-mail-local
;;                  (key-binding (kbd "C-c s L")))))))

;; (ert-deftest test-scame-launcher-keybindings ()
;;   :tags '(scame-keys)
;;   (with-test-sandbox
;;    (with-scame-mode
;;     (should (eql 'scame-launcher/calc
;;                  (key-binding (kbd "C-c s a"))))
;;     (should (eql 'scame-launcher/man
;;                  (key-binding (kbd "C-c s m"))))
;;     (should (eql 'scame-launcher/proced
;;                  (key-binding (kbd "C-c s h"))))
;;     (should (eql 'scame-launcher/helm-mt
;;                  (key-binding (kbd "C-c s t"))))
;;     (should (eql 'scame-launcher/paradox-list-packages
;;                  (key-binding (kbd "C-c s p")))))))

;; (ert-deftest test-scame-calendars-keybindings ()
;;   :tags '(scame-keys)
;;   (with-test-sandbox
;;    (with-scame-mode
;;     (should (eql 'scame-calendar/scame-google-calendar
;;                  (key-binding (kbd "C-c s g"))))
;;     (should (eql 'scame-calendar/scame-work-calendar
;;                  (key-binding (kbd "C-c s w"))))
;;     (should (eql 'scame-calendar/scame-diary-calendar
;;                  (key-binding (kbd "C-c s d"))))
;;     (should (eql 'scame-calendar/scame-org-calendar
;;                  (key-binding (kbd "C-c s o")))))))



(provide 'scame-global-keys-test)
;;; scame-global-keys-test.el ends here
