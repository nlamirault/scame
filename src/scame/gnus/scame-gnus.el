;;; scame-gnus.el --- Gnus configuration

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

;;(require 'gnus)
;; (require 'smtpmail)

(require 'gnus-art)
(require 'gnus-cite)

(require 'gnus-gpg)


;; SMTP
;; ----

(setq send-mail-function 'smtpmail-send-it
      message-send-mail-function 'smtpmail-send-it
      smtpmail-debug-info t
      smtpmail-debug-verb t
      message-signature-file "~/.signature")


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
         (organization "Orange Applications for Business")
         ("X-PGP-Fingerprint" user-fingerprint)
         (signature-file "~/.signature"))
	((message-news-p)
         (name user-full-name)
         (address user-mail-address)
	 ("X-PGP-Fingerprint" user-fingerprint)
         (signature-file "~/.signature"))
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

(setq gnus-ignored-newsgroups
      "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\”]\”[#’()]")

(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
(setq gnus-topic-line-format "%i[ %(%{%n -- %A%}%) ]%v\n")
(setq  gnus-topic-display-empty-topics t  ;nil = cacher les topics vides
       gnus-topic-indent-level 2)

;;(setq gnus-summary-line-format "%U%R%z %o %I%(%[%-25,25n%]%) %s\n")
(setq gnus-summary-mode-line-format "Gnus: %G %Z")

; from jd
;; (setq gnus-summary-line-format
;;       (concat "%z%U%R %~(max-right 17)~(pad-right 17)&user-date;  "
;;               "%~(max-right 20)~(pad-right 20)f %B%s\n"))
;;(setq gnus-summary-line-format "%U%R%z %(%&user-date;  %-15,35f  %B%s%)\n")
;;(setq gnus-summary-line-format "%U%R%z%I%(%[%4L: %-23,23f%]%) %s\n")


(defun rs-gnus-get-label (header)
  "Returns label from X-Label header"
  (let ((lbl (or (cdr (assq 'X-GM-LABELS (mail-header-extra header))) "")))
    lbl))
(defalias 'gnus-user-format-function-r 'rs-gnus-get-label)
(setq gnus-summary-line-format
      "%1{%U%R%z: %}%2{%D%}%5{ %[%4i%] %}%4{%-24,24n%}%6{%-4,4ur%}%5{| %}%(%1{%B%}%s%)\n")
(setq nnmail-extra-headers '(To X-GM-LABELS Newsgroups Content-Type))

(copy-face 'default 'myface)
(set-face-foreground 'myface "chocolate")
(setq gnus-face-5 'myface)

(copy-face 'default 'face-label)
(set-face-foreground 'face-label "red")
(setq gnus-face-6 'face-label)

;;(setq gnus-group-line-format "%p%M%B%S%P%(%G: %N%)\n")
(setq gnus-group-line-format "%1M%1S%5y: %(%-50,50G%)\n")

(setq gnus-user-date-format-alist '((t . "%Y-%m-%d %H:%M")))

(setq gnus-message-setup-hook '(font-lock-fontify-buffer))

;;(add-hook 'gnus-article-mode-hook 'turn-on-auto-fill)
(add-hook 'message-mode-hook 'turn-on-auto-fill)

;; set renderer for html mail to w3m in emacs
;; (setq mm-text-html-renderer 'w3m)
;; (setq mm-text-html-renderer 'links)
(setq mm-text-html-renderer 'shr)
(setq gnus-inhibit-images nil)

;; UI Organization
;; ----------------

(gnus-add-configuration
 '(summary
   (horizontal 1.0
               (vertical 30 (group 1.0))
               (vertical 1.0 (summary 1.0 point)))))

(gnus-add-configuration
 '(article
   (horizontal 1.0
               ;;(vertical 30 (group 1.0))
               (vertical 1.0
                         (summary 0.20 point)
                         (article 1.0)))))

;; (loop for type in '(reply forward message post mail-bound)
;;       do (gnus-add-configuration
;; 	  `(,type
;; 	    (horizontal 8
;; 			(group 50)
;; 			(vertical 1.0
;; 				  (summary 20)
;; 				  (,type 1.0 point))))))

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

;; (setq gnus-sum-thread-tree-false-root ""
;;       gnus-sum-thread-tree-indent " "
;;       gnus-sum-thread-tree-leaf-with-other "├► "
;;       gnus-sum-thread-tree-root ""
;;       gnus-sum-thread-tree-single-leaf "╰► "
;;       gnus-sum-thread-tree-vertical "│")
(setq
    gnus-sum-thread-tree-root "● "
    gnus-sum-thread-tree-false-root "▷ "
    gnus-sum-thread-tree-single-indent ""
    gnus-sum-thread-tree-leaf-with-other "├─►"
    gnus-sum-thread-tree-vertical "│ "
    gnus-sum-thread-tree-single-leaf "└─►")

;; Keybindings

(define-key gnus-summary-mode-map
  (kbd "B u")
  'gnus-summary-put-mark-as-unread)


;; See https://www.gnu.org/software/emacs/manual/html_node/gnus/Customizing-W3.html
;; (eval-after-load "w3"
;;   '(progn
;;      (fset 'w3-fetch-orig (symbol-function 'w3-fetch))
;;      (defun w3-fetch (&optional url target)
;;        (interactive (list (w3-read-url-with-default)))
;;        (if (eq major-mode 'gnus-article-mode)
;;            (browse-url url)
;;          (w3-fetch-orig url target)))))

;; Colors
;; -------


(setq gnus-face-1 'font-lock-string-face)
(setq gnus-face-2 'font-lock-comment-face)
(setq gnus-face-3 'font-lock-variable-name-face)

(set-face-foreground 'gnus-summary-normal-ancient-face "white")
(set-face-foreground 'gnus-summary-normal-read-face "green")
(set-face-foreground 'gnus-summary-normal-ticked-face "cyan")
(set-face-foreground 'gnus-summary-normal-unread-face "SkyBlue")
(set-face-foreground 'gnus-summary-high-ancient-face "red")
(set-face-foreground 'gnus-summary-high-read-face "white")
(set-face-foreground 'gnus-summary-high-ticked-face "cyan")
(set-face-foreground 'gnus-summary-high-unread-face "SkyBlue")
(set-face-foreground 'gnus-summary-low-ancient-face "red")
(set-face-foreground 'gnus-summary-low-read-face "white")
(set-face-foreground 'gnus-summary-low-ticked-face "cyan")
(set-face-foreground 'gnus-summary-low-read-face "SkyBlue")

(set-face-foreground 'gnus-header-content-face "green")
(set-face-foreground 'gnus-header-from-face "orange")
(set-face-foreground 'gnus-header-name-face "cyan")
(set-face-foreground 'gnus-header-newsgroups-face "white")
(set-face-foreground 'gnus-header-subject-face "white")

(set-face-foreground 'gnus-signature-face "white")

(set-face-foreground 'message-cited-text "cyan")
(set-face-foreground 'message-header-cc "white")
(set-face-foreground 'message-header-name "white")
(set-face-foreground 'message-header-newsgroups "white")
(set-face-foreground 'message-header-subject "cyan")
(set-face-foreground 'message-header-other "red")
(set-face-foreground 'message-header-to "green")
(set-face-foreground 'message-header-xheader "blue")
(set-face-foreground 'message-separator "orange")
(set-face-foreground 'message-mml "beige")

(provide 'scame-gnus)
;;; scame-gnus.el ends here
