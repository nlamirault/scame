;;; 90_irc.el --- IRC configuration

;; Copyright (C) 2014, 2016 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

(when scame-communication

  (use-package erc :quelpa
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

  (use-package circe :quelpa
    :config (progn
              (setq circe-reduce-lurker-spam t)
              (setq lui-time-stamp-position 'right-margin)
              (add-hook 'circe-chat-mode-hook 'my-circe-prompt)
              (add-hook 'lui-mode-hook 'my-lui-setup)))

  (use-package circe-color-nicks :quelpa
    :config (enable-circe-color-nicks))

  (use-package circe-highlight-all-nicks :quelpa
    :config (enable-circe-highlight-all-nicks))


  ;; Rcirc
  ;; ------

  (use-package rcirc :quelpa
    :config (add-hook 'rcirc-mode-hook
                      (lambda ()
                        (rcirc-track-minor-mode 1)))
    :bind (("C-c i c" . rcirc)))

  (use-package rcirc-groups :quelpa
    :bind (("C-c i g" . rcirc-groups:switch-to-groups-buffer)))

  (use-package rcirc-alertify :quelpa
    :config (rcirc-alertify-enable))

  (use-package rcirc-notify :quelpa)


  )

(provide '90_irc)
;;; 90_irc.el ends here
