;; IRC configuration
;; Copyright (c) Nicolas Lamirault


(require 'erc)
(require 'erc-join)
(require 'erc-match)

(setq erc-notifications-icon "~/.emacs.d/icons/irc.png")
(setq erc-keywords '("nicolas" "lamirault" "l_a_m"))

(setq erc-track-exclude-server-buffer t)
(setq erc-track-exclude '("*stickychan" "*status"))
(setq erc-track-showcount t)
(setq erc-track-shorten-start 1)
(setq erc-track-switch-direction 'importance)
(setq erc-track-visibility 'selected-visible)

(add-to-list 'erc-modules 'smiley)
(add-to-list 'erc-modules 'match)
(add-to-list 'erc-modules 'scrolltobottom)
;;(add-to-list 'erc-modules 'notifications)

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
;; (setq erc-autojoin-channels-alist
;;       '(("freenode.net" "#cvf" "#cloudstack" "#openstack-dev" "#openstack-fr")))


;; logging:
(setq erc-log-insert-log-on-open nil)
(setq erc-log-channels nil)
(setq erc-log-channels-directory "~/.irclogs/")
(setq erc-save-buffer-on-part t)
(setq erc-hide-timestamps nil)
