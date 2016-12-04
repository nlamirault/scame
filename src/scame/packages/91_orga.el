;;; 91_orga.el --- Organisation

;; Copyright (C) 2014, 2015, 2016 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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


(when scame-org

  ;;(require 'org)

  ;;(require 'org-contacts)
  ;;(require 'org-jira)


  ;; Diary

  (require 'f)

  (setq diary-file
        (f-join user-home-directory ".diary"))


  ;; Calendar
  ;; ----------

  ;; From Emacs Jd setup

  (defvar calendar-legal-holidays
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

  (setq calendar-celebration-holidays
        '((holiday-fixed 2 2 "Chandeleur")
          (holiday-fixed 2 14 "Saint Valentin")
          (holiday-float 3 0 1 "Fête des grands-mères")
          (holiday-fixed 3 17 "St. Patrick's Day")
          (holiday-fixed 4 1 "April Fools' Day")
          (holiday-float 5 0 -1 "Fête des Mères")
          (holiday-float 6 0 3 "Fête des Pères")
          (holiday-fixed 6 21 "Fête de la musique")
          (holiday-fixed 10 31 "Halloween")
          (holiday-easter-etc -47 "Mardi Gras")))


  ;; From: http://drieu.org/post/Calcul-des-jours-f%C3%A9ri%C3%A9s-et-vacances-avec-le-calendrier-d-Emacs

  (defun vacances-i (string s e)
    "Holidays iterator"
    (if (= s e)
        nil
      (cons (list (calendar-gregorian-from-absolute s) string)
            (vacances-i string (+ s 1) e))))


  (defun vacances (string sd sm sy ed em ey)
    "Compute holiday lists"
                                        ;(filter-visible-calendar-holidays
    (holiday-filter-visible-calendar
     (vacances-i string
                 (calendar-absolute-from-gregorian (list sm sd sy))
                 (calendar-absolute-from-gregorian (list em ed ey)))))

  ;; 2015/2016
  ;; http://www.education.gouv.fr/cid87910/calendrier-scolaire-pour-les-annees-2015-2016-2016-2017-2017-2018.html
  (setq calendar-school-vacation
        '((vacances "Vacances de la Toussaint" 17 10 2015 1 11 2015)
          (vacances "Vacances de Noël" 19 12 2015 3 1 2016)
          (vacances "Vacances d'hiver A" 13 2 2016 28 2 2016)
          ;; (vacances "Vacances d'hiver B" 6 2 2016 21 2 2016)
          ;; (vacances "Vacances d'hiver C" 20 2 2016 6 3 2016)
          (vacances "Vacances de printemps A" 9 4 2016 24 4 2016)
          ;; (vacances "Vacances de printemps B" 2 4 2016 17 4 2016)
          ;; (vacances "Vacances de printemps C" 16 4 2016 1 5 2016)
          (vacances "Vacances d'été" 6 7 2016 5 9 2016)))

  ;; Holidays
  (setq calendar-holidays
        `(,@holiday-solar-holidays
          ,@calendar-legal-holidays
          ,@calendar-celebration-holidays
          ,@calendar-school-vacation))

  (use-package calendar :quelpa
    :config (setq calendar-date-style 'european
                  calendar-holidays calendar-legal-holidays
                  calendar-mark-holidays-flag t
                  calendar-week-start-day 1 ;; week starts on monday
                  calendar-set-date-style 'iso
                  calendar-intermonth-text '(propertize
                                             (format "%2d"
                                                     (car
                                                      (calendar-iso-from-absolute
                                                       (calendar-absolute-from-gregorian
                                                        (list month day year)))))
                                             'font-lock-face 'font-lock-warning-face)
                  calendar-intermonth-header (propertize "Wk"
                                                         'font-lock-face 'font-lock-keyword-face)))

  ;; Appointment
  ;; ------------

  (defun scame--appt-disp-window (min-to-app new-time msg)
    "Wrapper for appt popup display."
    (notifications-notify :title (format "Appt in %s minute(s)" min-to-app)
                          :body msg
                          :app-name "Emacs: Org"))

  (defun scame--appt-delete-window ()
    )


  (use-package appt :quelpa
    :config (progn
              (setq appt-audible nil
                    appt-display-diary nil
                    appt-display-mode-line t     ;; show in the modeline
                    appt-message-warning-time 60 ;; warn 60 min in advance
                    appt-display-interval 5
                    appt-display-duration 30
                    appt-display-format 'window
                    appt-disp-window-function (function scame--appt-disp-window)
                    appt-delete-window-function (function scame--appt-delete-window))
              (when (require 'sauron nil t)
                (add-to-list 'sauron-modules 'sauron-org)))
    :init (appt-activate))


  (use-package org :quelpa
    :config (progn
              (setq org-directory (f-join user-home-directory "Org"))
              (setq org-agenda-files (list org-directory))

              ;; Links
              ;; ------

              (setq org-link-abbrev-alist
                    '(("launchpad" . "https://bugs.launchpad.net/bugs/")))


              ;; Tasks
              ;; ------

              (setq org-default-notes-file (concat org-directory "/diary.org"))
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

              (setq org-log-done t
                    org-clock-persist t
                    org-clock-out-when-done nil)

              (org-clock-persistence-insinuate)

              (setq org-use-fast-todo-selection t)
              (setq org-treat-S-cursor-todo-selection-as-state-change nil)

              ;; Agenda views
              ;; -------------
              (setq org-agenda-skip-unavailable-files t)
              (setq org-agenda-dim-blocked-tasks nil)
              (setq org-agenda-include-diary t)
              ;; Compact the block agenda view
              (setq org-agenda-compact-blocks t)
              (setq org-agenda-clockreport-parameter-plist
                    '(:link nil :maxlevel 4 :emphasize t))

              ;; Appointment
              ;; ------------
              (org-agenda-to-appt)
              (add-hook 'org-finalize-agenda-hook 'org-agenda-to-appt)
              (add-hook 'org-remember-after-finalize-hook 'org-agenda-to-appt)
              (add-hook 'org-mode-hook (lambda()
                                         (add-hook 'before-save-hook
                                                   'org-agenda-to-appt t)))

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
  ;; (use-package ox-html)
  ;; (use-package ox-latex)
  ;; (use-package ox-ascii)

  ;; FIXME: requires Emacs 24.4

  ;; (use-package google-weather)
  ;; (use-package org-google-weather)

  (use-package calfw :quelpa)
  (use-package calfw-org :quelpa)
  (use-package calfw-ical :quelpa)
  (use-package calfw-cal :quelpa)

  (setq google-ical-calendar nil)

  (use-package org-crypt :quelpa
    :config (progn
              (org-crypt-use-before-save-magic)
              (setq org-tags-exclude-from-inheritance (quote ("crypt")))
              ;; GPG key to use for encryption
              ;; Either the Key ID or set to nil to use symmetric encryption.
              (setq org-crypt-key nil)))



  ;; --- org-bullets-bullet-list

  ;; hexagrams
  ;; “✡” “⎈” “✽” “✲” “✱” “✻” “✼” “✽” “✾” “✿” “❀” “❁” “❂” “❃” “❄” “❅” “❆” “❇”

  ;; circles
  ;; “○” “☉” “◎” “◉” “○” “◌” “◎” “●” “◦” “◯” “⚪” “⚫” “⚬” “❍” “￮” “⊙” “⊚” “⊛” “∙” “∘”

  ;; special circles
  ;; “◐” “◑” “◒” “◓” “◴” “◵” “◶” “◷” “⚆” “⚇” “⚈” “⚉” “♁” “⊖” “⊗” “⊘”

  ;; crosses
  ;; “✙” “♱” “♰” “☥” “✞” “✟” “✝” “†” “✠” “✚” “✜” “✛” “✢” “✣” “✤” “✥”

  ;; poker sybmols
  ;; “♠” “♣” “♥” “♦” “♤” “♧” “♡” “♢”

  ;; yinyang
  ;; “☯” “☰” “☱” “☲” “☳” “☴” “☵” “☶” “☷”

  ;; special symbols
  ;; “☀” “♼” “☼” “☾” “☽” “☣” “§” “¶” “‡” “※” “✕” “△” “◇” “▶” “◀” “◈”

  ;; --- org-ellipsis

  ;; “↝” “⇉” “⇝” “⇢” “⇨” “⇰” “➔” “➙” “➛” “➜” “➝” “➞”
  ;; “➟” “➠” “➡” “➥” “➦” “➧” “➨”
  ;; “➩” “➪” “➮” “➯” “➱” “➲”
  ;; “➳” “➵” “➸” “➺” “➻” “➼” “➽”
  ;; “➢” “➣” “➤” “≪”, “≫”, “«”, “»”
  ;; “↞” “↠” “↟” “↡” “↺” “↻”
  ;; “⚡”
  ;; …, ▼, ↴, , ∞, ⬎, ⤷, ⤵


  (use-package org-bullets :quelpa
    :init (progn
            (setq org-ellipsis "⚡⚡⚡")
            (setq org-bullets-bullet-list '("☀" "♼" "☼" "☾" "☽" "☣" "§" "¶" "‡" "※" "✕" "△" "◇" "▶" "◀" "◈"))
            ))

  )

(provide '91_orga)
;;; 91_orga.el ends here
