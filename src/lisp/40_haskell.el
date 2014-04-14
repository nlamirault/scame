;;; 40_haskell.el --- Haskell configuration

;; Copyright (C) 2014 Nicolas Lamirault <nicolas.lamirault@gmail.com>

;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;; The above copyright notice and this permission notice shall be included in
;; all copies or substantial portions of the Software.

;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
;; THE SOFTWARE.

;;; Commentary:

;;; Code:

;; (require 'haskell-mode)
;; (require 'haskell-simple-indent)
;; (require 'ghc)

(use-package haskell-mode
  :init (progn
	  (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
	  (add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
	  (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
	  (add-hook 'haskell-mode-hook 'turn-on-haskell-doc)
	  (add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan))
  :bind (;;("C-," . haskell-move-nested-left)
	 ;;("C-." . haskell-move-nested-right)
	 ("M-o" . editutil-edit-next-line-same-column)
	 ;;("TAB" . haskell-simple-indent)
	 ;;("<backtab>" . haskell-simple-indent-backtab)
	 ;;("C-<return>" . haskell-simple-indent-newline-indent)))
         ))

(provide '40_haskell)
;;; 40_haskell.el ends here
