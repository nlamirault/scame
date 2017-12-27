;;; 00_setup.el --- Setup Emacs configuration

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

(require 'scame-custom)


(defconst linux-p (or (eq system-type 'gnu/linux)
                      (eq system-type 'linux))
  "Are we running on a GNU/Linux system ?")

(defconst darwin-p (eq system-type 'darwin)
  "Are we on OSX ?")

(defconst cygwin-p (eq system-type 'cygwin))

(defvar nt-p (eq system-type 'windows-nt))

(defvar meadow-p (featurep 'meadow))

(defvar windows-p (or cygwin-p nt-p meadow-p)
  "Are we on Windows ?")

(defconst console-p (eq (symbol-value 'window-system) nil)
  "Are we in a console?")


(defun scame-enable-proxy ()
  "Enable the HTTP(S) proxy."
  (interactive)
  (let ((credentials (format "%s:%s" scame-proxy-username scame-proxy-password)))
    (setq url-proxy-services
          `(("no_proxy" . "^\\(localhost\\|10.*\\|192.*\\)")
            ("http" . ,scame-proxy-url)
            ("https" . ,scame-proxy-url)))
    (setq url-http-proxy-basic-auth-storage
          (list (list scame-proxy-url
                      (cons proxy-username
                            (base64-encode-string credentials))))))
  (message "Proxy is enable: \"%s\"" scame-proxy-url)


(defun scame-disable-proxy ()
  "Disable the HTTP(S) proxy."
  (interactive)
  (setq url-proxy-services nil)
  (message "Proxy is disable")


(use-package abbrev
  :commands abbrev-mode
  :init (setq abbrev-file-name
              (concat user-emacs-directory "abbrev_defs")))

q(use-package saveplace
  :init
  (if (fboundp 'save-place-mode)
      (add-hook 'after-init-hook #'save-place-mode)
    (setq save-place t)))


(use-package exec-path-from-shell
  :ensure t
  :pin melpa
  :init
  (setq exec-path-from-shell-check-startup-files nil)
  (setq exec-path-from-shell-variables '("PATH" "MANPATH" "PYTHONPATH" "GOPATH"))
  (setq exec-path-from-shell-arguments '("-l"))
  (exec-path-from-shell-initialize))


(provide '00_setup)
;;; 00_setup.el ends here
