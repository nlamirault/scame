;;; scame-cli-test.el --- Unit tests for Scame CLI.

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
(require 'el-mock)

;; FIXME
;; (ert-deftest test-scame-cli-name ()
;;    (with-mock
;;     (mock (commander-print-usage))
;;     (mock (kill-emacs 0))
;;     (should (string-equal "Cleanup" (commander-usage-for 'scame-cli/cleanup)))))



(provide 'scame-cli-test)
;;; scame-cli-test.el ends here
