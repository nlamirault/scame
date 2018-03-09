;;; 40_haskell.el --- Haskell configuration

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

;; (global-unset-key (kbd "C-x h"))
;; (define-prefix-command 'scame-hashell-map)
;; (global-set-key (kbd "C-x h") 'scame-haskell-map)

(when scame-haskell

  (use-package haskell-mode
    :ensure t
    :pin melpa
    :init (progn
            (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
            (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode))
    :config (add-hook 'haskell-mode-hook
                      (lambda ()
                        (local-set-key (kbd "C-x h t") 'haskell-process-do-type)
                        (local-set-key (kbd "C-x h i") 'haskell-process-do-info)
                        (local-set-key (kbd "C-x h c") 'haskell-process-cabal)
                        (local-set-key (kbd "C-x h b") 'haskell-process-cabal-build))))

  )

(provide '40_haskell)
;;; 40_haskell.el ends here
