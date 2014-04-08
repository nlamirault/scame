;;; 12_directories.el --- Dired and friends configurations

;; Copyright (c) Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

;; Dired and cie.

;;; Code:


(use-package dired-x
  :init (progn
	  (add-hook 'dired-mode-hook 'dired-hide-details-mode)
	  (put 'dired-find-alternate-file 'disabled nil)
	  (setq dired-recursive-deletes 'always)
	  (setq dired-recursive-copies 'always))
  :bind ("C-x C-j" . direx:jump-to-directory))


(use-package direx-project)


;; Not available in MELP
;; (use-package dired-k
;;   :init (add-hook 'dired-initial-position-hook 'dired-k)
;;   :map (dired-mode-map ("K" . dired-k)))


(use-package dired-filter)

(use-package dired-open)

(use-package dired-rainbow)

(use-package dired-subtree)


(provide '12_direx)
;;; 12_directories.el ends here