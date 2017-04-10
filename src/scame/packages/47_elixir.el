;; 47_elixir.el --- Elixir configuration

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

(when scame-elixir

  (use-package elixir-mode
    :ensure t
    :pin melpa
    :mode (("\\.ex\\'" . elixir-mode)
           ("\\.exs\\'" . elixir-mode)
           ("\\.elixir\\'" . elixir-mode)))

  (use-package alchemist
    :ensure t
    :pin melpa
    :commands (alchemist-mode)
    :init (add-hook 'elixir-mode-hook 'alchemist-mode))

  )

(provide '47_elixir)
;;; 47_elixir.el ends here
