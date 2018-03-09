;;; 95_browser.el --- Browser configuration

;; Copyright (C) 2014-2017 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

(defalias 'gk-urls-external-browser 'browse-url-xdg-open)

(defun gk-browse-url (&rest args)
  "Prompt for whether or not to browse with EWW, if no browse
with external browser."
  (apply
   (if (y-or-n-p "Browse with EWW? ")
       'eww-browse-url
     #'gk-urls-external-browser)
   args))

(use-package eww
  :config (progn
            (setq browse-url-browser-function #'gk-browse-url)
            (setq shr-color-visible-luminance-min 70)))

(provide '95_browser)
;;; 95_browser.el ends here
