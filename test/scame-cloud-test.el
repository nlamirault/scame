;;; scame-cloud-test.el --- Unit tests for Scame cloud tools.

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


(ert-deftest test-scame-puppet ()
  (with-test-sandbox
   (with-current-file
    "var/puppet/init.pp"
    (should (featurep 'puppet-mode)))))

(ert-deftest test-scame-vagrant ()
  (with-test-sandbox
   (with-current-file
    "var/vagrant/Vagrantfile"
    (should (featurep 'ruby-mode)))
   (require 'vagrant)
   (should (featurep 'vagrant))))

(ert-deftest test-scame-dockerfile-mode ()
  (with-test-sandbox
   (with-current-file
    "var/docker/Dockerfile"
    (should (featurep 'dockerfile-mode)))))


(provide 'scame-cloud-test)
;;; scame-cloud-test.el ends here
