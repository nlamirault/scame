;; scame-darwin.el --- Emacs configuration for OSX

;; Copyright (C) 2014-2018 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

;; Mac specified setting(Meta key, input method, terminfo)

;; (setq ns-command-modifier 'meta
;;       ns-alternate-modifier 'super
;;       ns-use-native-fullscreen nil ;; Don't use system fullscreen
;;       default-input-method "MacOSX"
;;       system-uses-terminfo nil)

;; Switch the Cmd and Meta keys
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

(setq w3m-command "w3m")

(provide 'scame-darwin)
;;; scame-darwin.el ends here
