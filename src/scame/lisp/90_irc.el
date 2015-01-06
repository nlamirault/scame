;;; 90_irc.el --- IRC configuration

;; Copyright (C) 2014, 2015 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

;; (use-package erc
;;   :bind (("C-c i e" . erc))
;;   :config (progn
;;             ;; Default server and nick
;;             (setq erc-hide-list '("JOIN" "PART" "QUIT")
;;                   erc-nick-uniquifier "$"
;;                   erc-nick "l_a_m"
;;                   erc-nick-uniquifier "_")
;;             (add-to-list 'erc-modules 'smiley)
;; 	    (add-to-list 'erc-modules 'match)
;; 	    (add-to-list 'erc-modules 'scrolltobottom)
;;             (erc-update-modules)))

;; (use-package erc-join                   ; Automatically join channels with ERC
;;   :config (progn
;;             (setq erc-join-buffer 'bury)
;;             (setq erc-autojoin-channels-alist
;;                 '(("\\.freenode\\.net" . ("#openstack-fr"
;;                                           "#docker"
;;                                           "#docker-dev"
;;                                           "#google-containers"
;;                                           "#lisp"
;;                                           "#emacs"))))))

;; (use-package erc-track                  ; Track status of ERC in mode line
;;     :config (setq erc-track-enable-keybindings t
;;                 erc-track-exclude-server-buffer t
;;                 erc-track-exclude '("*stickychan" "*status")
;;                 erc-track-showcount t
;;                 erc-track-shorten-start 1
;;                 erc-track-switch-direction 'importance
;;                 erc-track-visibility 'selected-visible))


;; (use-package erc-log
;;   :config (setq erc-log-channels-directory "~/.erc/logs/"))


(use-package erc
  :init (progn
          (require 'erc-services)
          (require 'erc-dcc)
          (setq erc-modules
                '(autojoin button completion fill irccontrols list match
                           menu move-to-prompt netsplit networks noncommands
                           notify readonly replace ring scrolltobottom services
                           smiley stamp track))
          (setq erc-prompt-for-nickserv-password nil
                erc-format-query-as-channel-p t
                erc-kill-buffer-on-part t
                erc-kill-server-buffer-on-quit t
                erc-max-buffer-size 20000
                erc-server-coding-system '(utf-8 . utf-8)
                erc-timestamp-only-if-changed-flag nil
                erc-timestamp-format "%H:%M "
                erc-fill-prefix "      "
                erc-hide-list '("JOIN" "PART" "QUIT")
                erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE" "324" "329" "332" "333" "353" "477")
                erc-prompt (lambda () (concat (buffer-name) ">"))
                erc-insert-timestamp-function 'erc-insert-timestamp-left)
          (erc-services-mode 1)))


;; Circe
;; ------

(defun my-circe-prompt ()
  (lui-set-prompt
   (concat (propertize (concat (buffer-name) ">")
                       'face 'circe-prompt-face)
           " ")))

(defun my-lui-setup ()
  (setq fringes-outside-margins t
        lui-time-stamp-position 'right-margin
        lui-fill-type nil
        lui-time-stamp-format "%H:%M"
        right-margin-width 5
        word-wrap t
        wrap-prefix "    "))

(use-package circe
  :config (progn
            (setq circe-reduce-lurker-spam t)
            (setq lui-time-stamp-position 'right-margin)
            (add-hook 'circe-chat-mode-hook 'my-circe-prompt)
            (add-hook 'lui-mode-hook 'my-lui-setup)))

(use-package circe-color-nicks
  :config (enable-circe-color-nicks))

(use-package circe-highlight-all-nicks
  :config (enable-circe-highlight-all-nicks))


;; Rcirc
;; ------

(use-package rcirc
  :config (add-hook 'rcirc-mode-hook
                    (lambda ()
                      (rcirc-track-minor-mode 1)))
  :bind (("C-c i c" . rcirc)))

(use-package rcirc-groups
  :bind (("C-c i g" . rcirc-groups:switch-to-groups-buffer)))

(use-package rcirc-alertify
  :config (rcirc-alertify-enable))

(use-package rcirc-notify)


(provide '90_irc)
;;; 90_irc.el ends here
