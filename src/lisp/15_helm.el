;;; 15_helm.el --- HELM configuration

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


;;(require 'helm)

(use-package helm
  :init (helm-mode 1)
  :config (progn
	    (setq helm-ff-tramp-not-fancy nil)
	    (setq helm-ff-skip-boring-files t)
	    (add-to-list 'helm-boring-buffer-regexp-list "\\*tramp")
	    (add-to-list 'helm-boring-buffer-regexp-list "\\*epc")
	    (add-to-list 'helm-boring-buffer-regexp-list "\\.elc$")
	    (add-to-list 'helm-boring-buffer-regexp-list "\\.pyc$"))
  :bind (("C-c M-f" . helm-find-files)
         ("C-c f" . helm-for-files)
	 ("C-c b" . helm-buffers-list)))
	 ;;("C-x C-i" . helm-imenu)))

(use-package helm-imenu
  :bind (("C-x C-i" . helm-imenu)))


(provide '15_helm)
;;; 15_helm.el ends here
