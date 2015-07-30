;; 41_clojure.el --- Clojure configuration

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


(when scame-clojure

  (use-package cider
    ;; :defer scame-defer-package
    :init (progn
            (add-hook 'cider-mode-hook 'eldoc-mode)
            (add-hook 'cider-repl-mode-hook 'company-mode)
            (add-hook 'cider-mode-hook 'company-mode))
    :config (progn
              (setq nrepl-log-messages t)
              (setq nrepl-hide-special-buffers t)
              (setq cider-stacktrace-fill-column 80)
              (setq cider-test-show-report-on-success t)
              (setq cider-repl-wrap-history t)
              (setq cider-repl-history-size 1000)
              ))


  )

(provide '41_clojure)
;;; 41_clojure.el ends here
