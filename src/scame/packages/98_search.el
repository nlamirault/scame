;;; 98_search.el --- Search tools for Emacs

;; Copyright (C) 2015 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

;; FIX: can't load it ?

(use-package engine-mode
  ;;:init (engine-mode t)
  :config (progn
            (defengine google
              "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s"
              "g")
            (defengine github
              "https://github.com/search?ref=simplesearch&q=%s"
              "h")
            (defengine twitter
              "https://twitter.com/search?src=typd&q="
              "t")
            (defengine rfcs
              "http://pretty-rfc.herokuapp.com/search?q=%s")
            (defengine stackoverflow
              "https://stackoverflow.com/search?q=%s")
            (defengine wikipedia
              "http://www.wikipedia.org/search-redirect.php?language=en&go=Go&search=%s"
              "w")))

(provide '98_search)
;;; 98_search.el ends here
