;;; 10_buffers.el --- Tools for buffers

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


(use-package uniquify
  :config (setq uniquify-buffer-name-style 'forward
		uniquify-separator "/"
		uniquify-after-kill-buffer-p t
		uniquify-ignore-buffers-re "^\\*"))

(use-package ag
  :commands (ag ag-project)
  :config (setq ag-highlight-search t))


(use-package swoop
  :bind (("C-o" . swoop)
	 ("C-M-o" . swoop-multi)
	 ("M-o" . swoop-pcre-regexp)
	 ("C-S-o" . swoop-back-to-last-position)))


(use-package ace-jump-mode
  :bind (("C-c SPC" . ace-jump-mode)))


(use-package imenu-anywhere
  :bind (("C-." . imenu-anywhere)))


(use-package recentf
  :config (progn
	    (setq recentf-exclude '("~/.emacs.d/.recentf"))
	    (setq recentf-save-file (concat user-emacs-directory "/.recentf"))
	    (setq recentf-max-saved-items 100)
	    (setq recentf-auto-cleanup 'never)
	    (setq recentf-auto-save-timer (run-with-idle-timer 600 t 'recentf-save-list))))


(provide '10_buffers)
;;; 10_buffers.el ends here
