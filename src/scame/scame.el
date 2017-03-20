;; scame.el --- Scame Emacs initialization file

;; Copyright (c) 2014, 2015, 2016, 2017 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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


;; Bootstrap
;; ------------------------

(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("org" . "http://orgmode.org/elpa/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")
        ("melpa" . "https://melpa.org/packages/")
        ;; ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
        ;; ("melpa" . "http://melpa.milkbox.net/packages/")
        ))

(package-refresh-contents)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-install 'use-package))


;; Scame
;; -----------------


(require 'scame-custom)
;; (message "Scame defer packages: %s" scame-defer-package)
(load scame-emacs-custom-file)

;; Load Gnus from Emacs or Gnus development version
(when (eql 'gnus-dev scame-gnus-version)
  (push (concat scame-gnus-dev-directory "/lisp") load-path)
  (message "Load Gnus development version")
  (require 'gnus-load))

(require 'scame-io)
(require 'scame-ui)
(require 'scame-pkg)
(require 'scame-splash)

(require 'f)
(require 's)

(require 'use-package)

(scame--msg-buffer scame-buffer
                   "--> Scame modules ...\n"
                   'font-lock-string-face)
(redisplay)
(use-package el-init
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

(scame--msg-buffer scame-buffer
                   "--> Vendoring modules ...\n"
                   'font-lock-string-face)
(redisplay)
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

(scame--msg-buffer scame-buffer
                   "--> Customization file ...\n"
                   'font-lock-string-face)
(redisplay)
(when (file-readable-p scame-user-customization-file)
  (load scame-user-customization-file))

(scame--msg-buffer scame-buffer
                   "--> Addons modules ...\n"
                   'font-lock-string-face)
(redisplay)
(scame--install-packages scame-addons)

(scame--msg-buffer scame-buffer
                   (format "--> Version %s ready.\n"
                           scame-version-number)
                   'font-lock-string-face)
(redisplay)

(scame--setup-startup-hook)

(when scame-use-custom-modeline
  (setq-default mode-line-format (scame--modeline)))

(setq warning-minimum-level :warning)

(provide 'scame)
;;; scame.el ends here
