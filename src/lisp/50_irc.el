;;; 50_irc.el --- IRC configuration

;; Copyright (C) 2014 Nicolas Lamirault <nicolas.lamirault@gmail.com>

;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;; The above copyright notice and this permission notice shall be included in
;; all copies or substantial portions of the Software.

;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
;; THE SOFTWARE.

;;; Commentary:

;;; Code:

;; (require 'erc)
;; (require 'erc-join)
;; (require 'erc-match)


(use-package erc
  :config (progn
	    (setq erc-hide-list '("JOIN" "PART" "QUIT"))
	    (setq erc-nick-uniquifier "$")
	    (setq erc-autojoin-channels-alist '(("freenode.net"
						 "#openstack-fr"
						 "#cloudstack"
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



(provide '50_irc)
;;; 50_irc.el ends here
