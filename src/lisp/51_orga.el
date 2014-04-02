;;; 51_orga.el --- Organisation

;; Copyright (C) Nicolas Lamirault <nicolas.lamirault@gmail.com>

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


;;(require 'org)

;;(require 'org-contacts)
;;(require 'org-jira)


;; Calendar
;; ----------

(defvar french-holiday
  '((holiday-fixed 1 1 "Jour de l'an")
    (holiday-fixed 5 1 "Fête du travail")
    (holiday-fixed 5 8 "Victoire 45")
    (holiday-fixed 7 14 "Fête nationale")
    (holiday-fixed 8 15 "Assomption")
    (holiday-fixed 11 1 "Toussaint")
    (holiday-fixed 11 11 "Armistice 18")
    (holiday-fixed 12 25 "Noël")
    (holiday-easter-etc 1 "Lundi de Pâques")
    (holiday-easter-etc 39 "Ascension")
    (holiday-easter-etc 50 "Lundi de Pentecôte")))

(setq calendar-date-style 'european
      calendar-holidays french-holiday
      calendar-mark-holidays-flag t)


(use-package org
  :config (progn
	    (setq org-directory "~/Org")
	    (setq org-agenda-files (list org-directory))


	    ;; Links
	    ;; ------

	    (setq org-link-abbrev-alist
		  '(("launchpad" . "https://bugs.launchpad.net/bugs/")))


	    ;; Tasks
	    ;; ------

	    (setq org-default-notes-file "~/Org/diary.org")
	    (setq org-todo-keywords
		  (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
			  (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|"
				    "CANCELLED(c@/!)" "PHONE" "MEETING"))))
	    (setq org-todo-keyword-faces
		  (quote (("TODO" :foreground "red" :weight bold)
			  ("NEXT" :foreground "yellow" :weight bold)
			  ("DONE" :foreground "forest green" :weight bold)
			  ("WAITING" :foreground "orange" :weight bold)
			  ("HOLD" :foreground "magenta" :weight bold)
			  ("CANCELLED" :foreground "forest green" :weight bold)
			  ("MEETING" :foreground "forest green" :weight bold)
			  ("PHONE" :foreground "forest green" :weight bold))))

	    (setq org-todo-state-tags-triggers
		  (quote (("CANCELLED" ("CANCELLED" . t))
			  ("WAITING" ("WAITING" . t))
			  ("HOLD" ("WAITING" . t) ("HOLD" . t))
			  (done ("WAITING") ("HOLD"))
			  ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
			  ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
			  ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

	    (setq org-capture-templates
		  (quote (("t" "todo" entry (file "~/Org/cloud.org")
			   "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
			  ("n" "note" entry (file "~/Org/notes.org")
			   "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
			  ("j" "Journal" entry (file+datetree "~/Org/diary.org")
			   "* %?\n%U\n" :clock-in t :clock-resume t)
			  ("m" "Meeting" entry (file "~/Org/meetings.org")
			   "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
			  ("p" "Phone call" entry (file "~/Org/calls.org")
			   "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
			  )))

	    (setq org-clock-persist 'history)
	    (org-clock-persistence-insinuate)

	    (setq org-use-fast-todo-selection t)
	    (setq org-treat-S-cursor-todo-selection-as-state-change nil)

	    ;; Agenda views
	    ;; -------------

	    ;; Do not dim blocked tasks
	    (setq org-agenda-dim-blocked-tasks nil)

	    ;; Compact the block agenda view
	    (setq org-agenda-compact-blocks t)


	    ;; Clock Setup
	    ;; ------------

	    (org-clock-persistence-insinuate)
	    ;; Show lot of clocking history so it's easy to pick items off the C-F11 list
	    (setq org-clock-history-length 23)
	    ;; Resume clocking task on clock-in if the clock is open
	    (setq org-clock-in-resume t)
	    ;; Separate drawers for clocking and logs
	    (setq org-drawers (quote ("PROPERTIES" "LOGBOOK")))
	    ;; Save clock data and state changes and notes in the LOGBOOK drawer
	    (setq org-clock-into-drawer t)
	    ;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks with 0:00 duration
	    (setq org-clock-out-remove-zero-time-clocks t)
	    ;; Clock out when moving task to a done state
	    (setq org-clock-out-when-done t)
	    ;; Save the running clock and all clock history when exiting Emacs, load it on startup
	    (setq org-clock-persist t)
	    ;; Do not prompt to resume an active clock
	    (setq org-clock-persist-query-resume nil)
	    ;; Enable auto clock resolution for finding open clocks
	    (setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))
	    ;; Include current clocking task in clock reports
	    (setq org-clock-report-include-clocking-task t)
	    (setq org-alphabetical-lists t))
  :bind (("C-cl" . org-store-link)
	 ("C-cc" . org-capture)
	 ("C-ca" . org-agenda)
	 ("C-cb" . org-iswitchb)))

	    ;; Exporting
	    ;; -----------


;; Explicitly load required exporters
(use-package ox-html)
(use-package ox-latex)
(use-package ox-ascii)

(use-package google-weather)
(use-package org-google-weather)

(use-package calfw)
(use-package calfw-org)
(use-package calfw-org)
(use-package calfw-ical)



(provide '51_orga)
;;; 51_orga.el ends here
