;;; scame-global-keys.el --- Unit tests for Scame global keybidings.

;; Copyright (C) 2014  Nicolas Lamirault <nicolas.lamirault@gmail.com>

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


(require 'test-helper)


(ert-deftest test-scame-packages-keybindings ()
  (with-temp-buffer
    (scame-mode)
    (should (eql 'package-list-packages
		 (key-binding (kbd "C-c l"))))))


(ert-deftest test-scame-web-keybindings ()
  (with-temp-buffer
    (scame-mode)
    (should (eql 'browse-url-at-point
		 (key-binding (kbd "C-c u"))))
    (should (eql 'eww
		 (key-binding (kbd "C-c w"))))))
