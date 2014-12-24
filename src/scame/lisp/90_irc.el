;;; 90_irc.el --- IRC configuration

;; Copyright (C) 2014 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

;; (require 'erc)
;; (require 'erc-join)
;; (require 'erc-match)


(use-package erc
  :bind (("C-c i e" . erc))
  :config (progn
	    (setq erc-hide-list '("JOIN" "PART" "QUIT"))
	    (setq erc-nick-uniquifier "$")
	    (setq erc-autojoin-channels-alist '(("freenode.net"
						 "#openstack-fr"
						 "#docker"
                                                 "#docker-dev"
                                                 "#google-containers"
						 "#lisp"
						 "#emacs")))
	    (setq erc-notifications-icon "~/.emacs.d/icons/irc.png")
	    (setq erc-track-exclude-server-buffer t)
	    (setq erc-track-exclude '("*stickychan" "*status"))
	    (setq erc-track-showcount t)
	    (setq erc-track-shorten-start 1)
	    (setq erc-track-switch-direction 'importance)
	    (setq erc-track-visibility 'selected-visible)
	    (setq erc-header-line-format "%t: %o")
	    (setq erc-join-buffer 'bury)
	    (setq erc-warn-about-blank-lines nil)
	    (setq erc-interpret-mirc-color t)
	    (setq erc-server-reconnect-attempts t)
	    (setq erc-server-reconnect-timeout 10)
	    (setq erc-prompt (lambda ()
			       (if erc-network
				   (concat "[" (symbol-name erc-network) "]")
				 (concat "[" (car erc-default-recipients) "]"))))
	    (erc-timestamp-mode t)
	    (setq erc-timestamp-format "[%R-%m/%d]")
	    (erc-autojoin-mode 1)
	    ;; logging:
	    (setq erc-log-insert-log-on-open nil)
	    (setq erc-log-channels nil)
	    (setq erc-log-channels-directory "~/.irclogs/")
	    (setq erc-save-buffer-on-part t)
	    (setq erc-hide-timestamps nil)
	    (add-to-list 'erc-modules 'smiley)
	    (add-to-list 'erc-modules 'match)
	    (add-to-list 'erc-modules 'scrolltobottom)))



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
