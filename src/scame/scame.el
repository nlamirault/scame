;; scame.el --- Scame Emacs initialization file

;; Copyright (c) 2014-2017 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

(when (version< emacs-version "24.4")
  (error "Scame requires at least GNU Emacs 24.4"))

;; Debug or not
(setq debug-on-error t)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq-default show-trailing-whitespace nil)

(setq warning-minimum-level :error)

;; Scame
;; -----------------

(require 'scame-custom)
(when (file-exists-p scame-emacs-custom-file)
  (load scame-emacs-custom-file))

(require 'scame-pkg)
(require 'scame-io)
(require 'scame-ui)

(require 'f)


(use-package el-init
  :ensure t
  :pin melpa
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
                                      el-init-require/system-case))))

(when (and scame-use-vendoring
           (f-exists? scame-vendoring-directory)
           (f-directory? scame-vendoring-directory))
  (f-entries scame-vendoring-directory
             (lambda (elem)
               ;;(message "elem: %s" elem)
               (cond ((or (f-directory? elem)
                          (f-symlink? elem))
                      (add-to-list 'load-path elem))
                     ((f-file? elem)
                      (when (string= (f-ext elem) "el")
                        (load-file elem)))))))

(when (file-readable-p scame-user-customization-file)
  (load scame-user-customization-file))

;; Enable mine ?
;; (when scame-use-custom-modeline
;;   (setq-default mode-line-format (scame--modeline)))

(setq warning-minimum-level :warning)

(provide 'scame)
;;; scame.el ends here
