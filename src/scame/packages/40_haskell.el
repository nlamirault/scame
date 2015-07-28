;;; 40_haskell.el --- Haskell configuration

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

(when scame-haskell

  (use-package haskell-mode
    :init (progn
            (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
            (add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
            (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
            (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
            ;;(add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan))
            )
    ;; :bind (;;("C-," . haskell-move-nested-left)
    ;;        ;;("C-." . haskell-move-nested-right)
    ;;        ;; ("M-o" . editutil-edit-next-line-same-column)
    ;;        ;;("TAB" . haskell-simple-indent)
    ;;        ;;("<backtab>" . haskell-simple-indent-backtab)
    ;;        ;;("C-<return>" . haskell-simple-indent-newline-indent)))
    ;;        ))
    )

  )

(provide '40_haskell)
;;; 40_haskell.el ends here
