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

(setq abbrev-file-name scame-abrev-filename)

(provide '00_setup)
;;; 00_setup.el ends here
