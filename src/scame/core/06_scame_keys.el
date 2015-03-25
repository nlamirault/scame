;; 06_scame_keys.el --- Scame customization for Emacs

;; Copyright (c) 2014, 2015 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

;; Scame is a configuration for Emacs.

;;; Code:


(use-package hydra
  :config (progn
            (setq hydra-is-helpful t)
            (defhydra scame (scame-mode-map "C-c s")
              "scame"
              ("v" scame-version "version")
              ("z" scame-customization "customization"))

            (defhydra scame-search (scame-mode-map "C-c s s")
              "Scame search"
              ("g" engine/search-google) ;scame-search-google "google")
              ("h" engine/search-github) ;scame-search-github "github")
              ("t" engine/search-twitter) ;scame-search-twitter "twitter")
              ("l" engine/search-launchpad) ;scame-search-launchpad "launchpad")
              ;("a" engine/search-arch) ;scame-search-arch-aur "arch aur"))
              ("s" engine/search-stackoverflow)
              ("w" engine/search-wikipedia)
              ("r" engine/search-rfcs))

            (defhydra scame-email (scame-mode-map "C-c s m")
              "Scame email"
              ("g" scame-mail-gmail "gmail")
              ("e" scame-mail-exchange "exchange")
              ("l" scame-mail-local "local"))

            (defhydra scame-toggle (scame-mode-map "C-c s t")
              "Scame toggle"
              ("c" column-number-mode "column-number")
              ("d" toggle-debug-on-error "debug-on-error")
              ("q" toggle-debug-on-quit "debug-on-quit")
              ("f" auto-fill-mode "auto-fill")
              ("w" whitespace-mode "whitespace"))

            (defhydra scame-launcher (scame-mode-map "C-c s l")
              "Scame launcher"
              ("c" calc "calc")
              ("m" man "man")
              ("p" paradox-list-packages "list-packages")
              ("h" proced "proced")
              ;;("t" scame-launch-term "term"))
              ("t" helm-mt "term"))

            (defhydra scame-calendar (scame-mode-map "C-c s c")
              "Scame calendars"
              ("g" scame-google-calendar "scame-google-calendar")
              ("w" scame-work-calendar "scame-work-calendar")
              ("d" scame-diary-calendar "scame-diary-calendar")
              ("o" scame-org-calendar "scame-org-calendar"))))


(provide '06_scame_keys)
;;; 06_scame_keys.el ends here
