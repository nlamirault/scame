;;; 13_modeline.el --- Mode-line configuration

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

;;; Code:


(use-package rich-minority
  :config (progn
            ;; (setq rm-blacklist
            ;;       (format "^ \\(%s\\)$"
            ;;               (mapconcat #'identity
            ;;                          '("FlyC.*"
            ;;                            "overseer"
            ;;                            "company"
            ;;                            "SliNav"
            ;;                            "MRev"
            ;;                            "Guide"
            ;;                            "Undo-Tree")
            ;;                          "\\|")))
            (setq rm-blacklist '("company"
                                 "overseer"
                                 "SliNav"
                                 "MRev"
                                 "Guide"
                                 ))
            (rich-minority-mode 1)))


(use-package smart-mode-line
  :init (progn
          (setq sml/theme 'respectful
                sml/shorten-directory t
                sml/name-width 32
                sml/shorten-modes t
                sml/use-projectile-p 'before-prefixes
                sml/projectile-replacement-format "%s/"
                sml/no-confirm-load-theme t
                sml/replacer-regexp-list '(("^/ssh:.*:" ":SSH:")
                                           ("^/sudo:.*:" ":SU:")
                                           ("^~/.config/" ":C:")
                                           ("^~/Dropbox/" ":DB:")
                                           ("^~/findspire/findspire-front/" ":FS:")
                                           ("^:FS:findspire/" ":FSf:")
                                           ))
          (sml/setup)))


(use-package powerline
  :config (progn
	    (powerline-default-theme)
	    (setq powerline-default-separator 'arrow-fade)))




(provide '13_modeline)
;;; 13_modeline.el ends here
