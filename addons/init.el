
;; init.el --- Emacs initialization file

;; Copyright (c) 2015, 2016 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

(custom-set-variables
 '(scame-user-customization-file "/tmp/scame/foo.el")
 '(scame-golang t)
 '(scame-ruby nil)
 '(scame-clojure nil)
 '(scame-commonlisp nil)
 '(scame-python nil)
 '(scame-erlang nil)
 '(scame-elixir nil)
 )


(setq user-emacs-directory "/tmp/scame/")
(setq scame-user-directory "/tmp/scame/scame")
(mapc (lambda (path)
        (add-to-list 'load-path (concat user-emacs-directory path)))
      '("scame/" "scame/gnus"))
(require 'scame)
(scame-global-mode)

(use-package material-theme
  :config (load-theme 'material t))

(provide 'init)
;;; init.el ends here
