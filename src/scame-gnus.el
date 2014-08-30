;;; scame-gnus.el --- Gnus configuration

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


(require 'gnus)
(require 'smtpmail)


;; Customization
;; ---------------

(setq gnus-ignored-newsgroups
      "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\”]\”[#’()]")


;; Place a line like the following in ~/.authinfo
;; machine imap.gmail.com login your-name@gmail.com password your-password port 993
;; and make sure that no-one else can read it with
;; chmod 600 ~/.authinfo

(setq gnus-select-method
      '(nnimap "gmail"
               (nnimap-address "imap.gmail.com")
               (nnimap-server-port 993)
               (nnimap-stream ssl)))

;; If you don't want to be prompted for a password on every mail sent,
;; you can add the following line to your ~/.authinfo.
;; machine smtp.gmail.com login your-name@gmail.com password your-password port 465
;; chmod 600 ~/.authinfo

(setq send-mail-function 'smtpmail-send-it
      message-send-mail-function 'smtpmail-send-it
      smtpmail-debug-info t
      smtpmail-debug-verb t
      message-signature-file "~/.signature")

(setq smtpmail-smtp-service 465
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-default-smtp-server smtpmail-smtp-server
      smtpmail-auth-credentials (expand-file-name "~/.authinfo")
      smtpmail-stream-type 'ssl)


;; Newsgroup
;; -----------

(add-to-list 'gnus-secondary-select-methods
             '(nntp "news.gmane.org"))


;; PGP
;; ------

;; Automatically sign when sending mails or posts to gmane
;; (add-hook 'message-setup-hook
;;           (lambda ()
;; 	    (if (or (message-mail-p)
;; 		    (string-match "gmane" gnus-newsgroup-name))
;; 		(mml-secure-message-sign-pgpmime))))
;;(add-hook 'gnus-message-setup-hook 'mml-secure-message-sign)
;;(add-hook 'message-setup-hook 'mml-secure-message-sign)


;; Posting
;; --------------

(setq gnus-posting-styles
      '(
        (".*"
         (name user-full-name)
         (address user-mail-address)
         ("X-PGP-Fingerprint" user-fingerprint)
         (signature-file "~/.signature"))
	((message-news-p)
         (name user-full-name)
         (address user-mail-address)
         (organization "None")
	 ("X-PGP-Fingerprint" user-fingerprint)
         (signature "~/.signature"))
	))

;; No archive
(setq gnus-message-archive-group nil)

;; Contacts
;; ---------

;; (require 'google-contacts-gnus)
;; (require 'google-contacts-message)


;; Misc
;; ------------

;;; cache
(setq gnus-use-cache t)

;; speed up startup
(setq gnus-plugged t)
(setq gnus-check-group nil)
(setq gnus-read-active-file 'some)
(setq nntp-connection-timeout 5)


(setq gnus-visible-headers
      (quote ("^From:" "^To:" "Cc:" "^Reply-To:" "^Subject:" "^Organization:"
              "^Newsgroups:" "^X-Mailer:" "^X-Newsreader:" "^User-Agent:"
              "^X-Posting-Agent:" "^Folloup-To:" "^Date:" "Lines:"
              "X-PGP-Fingerprint:" "Content-Type:")))

(setq gnus-article-display-hook
      '(gnus-article-highlight
        gnus-article-hide-pgp
        gnus-article-hide-headers-if-wanted
        gnus-article-hide-boring-headers
        gnus-article-de-quoted-unreadable
        gnus-article-strip-leading-blank-lines
        gnus-article-remove-trailing-blank-lines
        gnus-article-strip-multiple-blank-lines
        gnus-article-emphasize))

(setq gnus-thread-hide-subtree t)
(setq gnus-build-sparse-threads 'some)
(setq gnus-summary-thread-gathering-function
      'gnus-gather-threads-by-references)

(add-hook 'gnus-select-group-hook 'gnus-group-set-timestamp)
(add-hook 'gnus-summary-exit-hook 'gnus-summary-bubble-group)

(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

(setq gnus-topic-display-empty-topics t  ;nil = cacher les topics vides
      gnus-topic-indent-level 2)

(setq gnus-use-trees t
      gnus-generate-tree-function 'gnus-generate-horizontal-tree
      gnus-tree-minimize-window nil)

;; UI
;; -----

(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
(setq gnus-topic-line-format "%i[ %(%{%n -- %A%}%) ]%v\n")
(setq  gnus-topic-display-empty-topics t  ;nil = cacher les topics vides
       gnus-topic-indent-level 2)

;;(setq gnus-summary-line-format "%U%R%z %o %I%(%[%-25,25n%]%) %s\n")
(setq gnus-summary-mode-line-format "Gnus: %G %Z")
(setq gnus-summary-line-format "%U%R%z %(%&user-date;  %-15,15f  %B%s%)\n")
(setq gnus-user-date-format-alist '((t . "%Y-%m-%d %H:%M")))

(setq gnus-group-line-format "%p%M%B%S%P%(%G: %N%)\n")


(setq gnus-face-1 'font-lock-string-face)
(setq gnus-face-2 'font-lock-comment-face)
(setq gnus-face-3 'font-lock-variable-name-face)

(setq gnus-message-setup-hook
      '(font-lock-fontify-buffer))

;;(add-hook 'gnus-article-mode-hook 'turn-on-auto-fill)
(add-hook 'message-mode-hook 'turn-on-auto-fill)

;; set renderer for html mail to w3m in emacs
(setq mm-text-html-renderer 'w3m)
(setq gnus-inhibit-images nil)

;; UI Organization
;; ----------------

(gnus-add-configuration
 '(article
   (horizontal 1.0
               (vertical 30 (group 1.0))
               (vertical 1.0
    (summary 0.20 point)
    (article 1.0)))))

(gnus-add-configuration
 '(summary
   (horizontal 1.0
               (vertical 30 (group 1.0))
               (vertical 1.0 (summary 1.0 point)))))


;; (gnus-add-configuration
;;  '(summary (horizontal 1.0
;; 		       (summary 1.0 point))))

;; (gnus-add-configuration
;;  '(article (vertical 1.0 (summary 0.25 point)
;; 		     (article 1.0))))


;; Sorting
;; ---------

(setq gnus-thread-sort-functions
      '(gnus-thread-sort-by-number
	gnus-thread-sort-by-most-recent-date))

(setq gnus-subthread-sort-functions
      '(gnus-thread-sort-by-number
	gnus-thread-sort-by-date))

(setq gnus-sort-gathered-threads-function 'gnus-thread-sort-by-date)


(provide 'scame-gnus)
;;; scame-gnus.el ends here
