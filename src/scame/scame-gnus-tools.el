;;; scame-gnus-tools.el --- Some tools for Gnus

;; Copyright (C) 2014-2018 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

(use-package gnus-summary-ext)

(require 'gnus-icalendar)
(gnus-icalendar-setup)
(setq gnus-icalendar-org-capture-file "~/Org/calendar.org")
(setq gnus-icalendar-org-capture-headline '("Calendar"))
(gnus-icalendar-org-setup)

(provide 'scame-gnus-tools)
;;; scame-gnus-tools.el ends here
