;;; 101_sauron.el --- Sauron for Emacs

;; Copyright (c) 2014 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

(use-package sauron
  :init (progn
          (define-prefix-command 'scame-sauron-map)
          (global-set-key (kbd "C-x s") 'scame-sauron-map))
  :commands sauron-start-hidden
  :config (setq sauron-dbus-cookie t
                sauron-modules '(sauron-erc
                                 sauron-notifications))
  :bind (("C-x s s" . sauron-toggle-hide-show)
         ("C-x s c" . sauron-clear)))

(provide '101_sauron)
;;; 101_sauron.el ends here
