;;; scame-markup.el --- Markup language

;; Copyright (c) 2014-2018 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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


(use-package yaml-mode
  :ensure t
  :pin melpa
  :defer t
  :mode (("\\.ya?ml$" . yaml-mode)))

(use-package markdown-mode
  :ensure t
  :pin melpa
  :defer t
  :mode (("\\.\\(m\\(ark\\)?down\\|md\\)$" . markdown-mode)))

(use-package fountain-mode
  :ensure t
  :pin melpa
  :defer t
  :mode (("\\.fountain$" . fountain-mode)))

(use-package toml-mode
  :ensure t
  :pin melpa
  :defer t
  :mode (("\\.toml$" . toml-mode)))

(use-package adoc-mode
  :ensure t
  :pin melpa
  :defer t
  :mode (("\\.adoc$" . adoc-mode)))


(use-package nov
  :ensure t
  :pin melpa
  :defer t
  :mode (("\\.epub$" . nov-mode)))


(provide 'scame-markup)
;;; scame-markup.el ends here
