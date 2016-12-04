;; scame-pkg.el --- Scame Packages installation

;; Copyright (c) 2014, 2016 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

(require 'package)

;; Install Scame dependencies

(defun scame--install-dependencies ()
  (use-package el-init
    :quelpa
    :config (progn
              (setq el-init-meadow-regexp       "\\`meadow-"
                    el-init-carbon-emacs-regexp "\\`carbon-emacs-"
                    el-init-cocoa-emacs-regexp  "\\`cocoa-emacs-"
                    el-init-nw-regexp           "\\`nw-"
                    el-init-mac-regexp          "\\`mac-"
                    el-init-windows-regexp      "\\`windows-"
                    el-init-linux-regexp        "\\`linux-"
                    el-init-freebsd-regexp      "\\`freebsd-")
              (el-init-load (f-parent (f-this-file))
                            :subdirectories '("packages" "core")
                            :wrappers '(el-init-require/benchmark
                                        el-init-require/record-error
                                        el-init-require/system-case)))))


(provide 'scame-pkg)
;;; scame-pkg.el ends here
