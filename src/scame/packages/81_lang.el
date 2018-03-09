;;; 81_lang.el --- Languages utilities

;; Copyright (c) 2014-2017 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

(setq ispell-program-name (executable-find "hunspell")
      ispell-dictionary "fr_FR")


(bind-key "C-c l F"
          (lambda ()
            (interactive)
            (ispell-change-dictionary "fr_FR")
            (flyspell-buffer)))

(bind-key "C-c l E"
          (lambda ()
            (interactive)
            (ispell-change-dictionary "en_GB")
            (flyspell-buffer)))


(use-package flyspell-correct
  :ensure t
  :pin melpa
  :after flyspell
  :bind (:map flyspell-mode-map
              ("C-c $" . flyspell-correct-word-generic))
  :config (progn
            (setq flyspell-correct-interface 'flyspell-correct-ivy)))


(provide '81_lang)
;;; 81_lang.el ends here
