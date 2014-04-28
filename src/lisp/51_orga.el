;;; 51_orga.el --- Organisation

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
	    (setq org-directory (concat user-home-directory "Org"))
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
  :bind (("C-c o l" . org-store-link)
	 ("C-c o c" . org-capture)
	 ("C-c o a" . org-agenda)
	 ("C-c o b" . org-iswitchb)))

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
