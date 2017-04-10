;;; 11_crypto.el --- Some crypto tools.
;;
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


;; EasyPG
;; --------

(use-package epa-file
  :config (progn
            (epa-file-enable)
            (setq epg-debug t))
  :bind (("C-c c f" . epa-encrypt-file)
         ("C-c c r" . epa-encrypt-region)
         ("C-c c F" . epa-decrypt-file)
         ("C-c c R" . epa-encrypt-region)
         ("C-c c l" . epa-list-keys)))

(provide '11_crypto)
;;; 11_crypto.el ends here
